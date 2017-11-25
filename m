From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Nov 2017 18:00:57 +0100
Subject: [Buildroot] [RPC] package/libtirpc: fix compilation error
In-Reply-To: <20171125135438.22385-1-daggs@gmx.com>
References: <20171125135438.22385-1-daggs@gmx.com>
Message-ID: <1f3d5149-c8a4-d77f-340b-b64a2f66f350@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-17 14:54, Dagg Stompler wrote:
> fix rpc_parse.c's compilation failure

 When sending a fix like this which is not visible in the autobuilders, make
sure to also send a defconfig that reproduces it, as well as the build error itself.

 I took a look and I think this is about rpc_parse.c which include rpc/types.h.
I believe the tirpc code is correct however. rpcgen is a host tool, so it makes
sense to me that it uses the host's headers, not its own headers.

 rpc/types.h should be part of your system's libc, so how do you get a
compilation failure?

 Regards,
 Arnout

> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
> index 1cf861417c..fee91d4adc 100644
> --- a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
> +++ b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
> @@ -83,8 +83,8 @@ index 0000000..2277b6f
>  --- /dev/null
>  +++ b/rpcgen/Makefile.am
>  @@ -0,0 +1,22 @@
> -+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
> -+	$(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
> ++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) -I$(top_builddir)/tirpc \
> ++	$(AM_CPPFLAGS) $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
>  +LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
>  +
>  +noinst_PROGRAMS = rpcgen
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
