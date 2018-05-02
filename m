From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 May 2018 00:28:34 +0200
Subject: [Buildroot] [PATCH 4/4] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <20180425064518.31797-4-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <20180425064518.31797-4-stefan.sorensen@spectralink.com>
Message-ID: <bc55f5f6-aa35-f688-176c-61fcc89ab5bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-04-18 08:45, Stefan S?rensen wrote:
> The PIE build flags are only intended for building executables and can not be
> used in relocateable links (-r), static builds and shared library build -
> including the flags here causes build errors.
> 
> So instead of parsing the PIE flags directly on the command line to gcc,
> include them in a gcc spec file where it is possible to only apply the flags
> when other incompatible flags are not set.

 This is a very elegant solution! In fact, a lot of things we now do in the
wrapper could perhaps be moved to the spec file. The idea would be that in
addition to generating the wrapper, we also generate a spec file with all the
options that are currently passed either into the wrapper or into CFLAGS/LDFLAGS.

 Thomas, perhaps a spec file is a good approach to force flags, what do you
think? This would mean:

- there is a way to distinguish between compile and link invocations;
- there is a way to take care of conflicting options;
- it is possible to hack the spec file after the build (mainly useful for
developers :-).

 Disadvantage is that the spec file syntax is not intuitive or familiar.


> This method and the spec files are from the Fedora build system.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/Makefile.in         | 4 ++--
>  toolchain/gcc-specs-pie-cc1 | 2 ++
>  toolchain/gcc-specs-pie-ld  | 2 ++
>  3 files changed, 6 insertions(+), 2 deletions(-)
>  create mode 100644 toolchain/gcc-specs-pie-cc1
>  create mode 100644 toolchain/gcc-specs-pie-ld
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 4525b8e79f..141eb83946 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -154,8 +154,8 @@ endif
>  ifeq ($(BR2_RELRO_PARTIAL),y)
>  TARGET_LDFLAGS += -Wl,-z,relro
>  else ifeq ($(BR2_RELRO_FULL),y)
> -TARGET_HARDENED += -fPIE
> -TARGET_LDFLAGS += -pie -Wl,-z,now -Wl,-z,relro
> +TARGET_HARDENED += -specs=$(TOPDIR)/toolchain/gcc-specs-pie-cc1
> +TARGET_LDFLAGS += -Wl,-z,relro -Wl,-z,now -specs=$(TOPDIR)/toolchain/gcc-specs-pie-ld

 Why not move the -z options into the spec file as well?

 There is no reason to have separate -cc1 and -ld spec files, right?

 The -specs option should be passed as part of the toolchain wrapper, so we're
sure it's really always used.

>  endif
>  
>  ifeq ($(BR2_FORTIFY_SOURCE_1),y)
> diff --git a/toolchain/gcc-specs-pie-cc1 b/toolchain/gcc-specs-pie-cc1
> new file mode 100644
> index 0000000000..fc54bcb510
> --- /dev/null
> +++ b/toolchain/gcc-specs-pie-cc1
> @@ -0,0 +1,2 @@
> +*cc1_options:
> ++ %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
> diff --git a/toolchain/gcc-specs-pie-ld b/toolchain/gcc-specs-pie-ld
> new file mode 100644
> index 0000000000..bd6b9071ff
> --- /dev/null
> +++ b/toolchain/gcc-specs-pie-ld
> @@ -0,0 +1,2 @@
> +*self_spec:

 self_spec only exists since gcc 4.7, while in theory we support gcc versions as
low as 4.3. So this would mean that RELRO_FULL should depend on
BR2_TOOLCHAIN_GCC_AT_LEAST_4_7.

 Regards,
 Arnout

> ++ %{!static:%{!shared:%{!r:-pie}}}
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
