From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 21:58:57 +0100
Subject: [Buildroot] [PATCH 3/3] package/meson: add
 gobject-introspection tools to cross-compilation.conf.in
In-Reply-To: <20200221224313.854089-4-aduskett@gmail.com>
References: <20200221224313.854089-1-aduskett@gmail.com>
 <20200221224313.854089-4-aduskett@gmail.com>
Message-ID: <20200223205857.GV8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-02-21 14:43 -0800, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> These paths are hardcoded by default to the host directory; however, because
> Buildroot is using wrappers for gobject-introspection, the sysroot paths to
> these tools must be explicitly called instead.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/meson/cross-compilation.conf.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index 369e225b3e..565ea67240 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -9,6 +9,8 @@ cpp = '@TARGET_CROSS at g++'
>  ar = '@TARGET_CROSS at ar'
>  strip = '@TARGET_CROSS at strip'
>  pkgconfig = '@HOST_DIR@/bin/pkgconf'
> +g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
> +g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'

On first sight, it would seem pretty obvious. However, not so much...

We already had a similar situation with llvm and llvm-config: packages,
such as mesa3d, may need to know where it is stored, but we did not want
the meson infra to hard-code all these per-package utilities.

Instead, packages that need them can specify them in their
FOO_MESON_EXTRA_BINARIES, and they get added to that package's
cross-compilation.conf.

So I'd like that the git toolset be handled the same.

Of course, to avoid repeating tedious path, you could have GOI set the
variables:

    GIR_COMPILER = $(STAGING_DIR)/usr/bin/g-ir-compiler
    GIR_SCANNER = $(STAGING_DIR)/usr/bin/g-ir-scanner

And then packages that need themwould do:

    FOO_MESON_EXTRA_BINARIES = \
        g-ir-compiler=$(GIR_COMPILER) \
        g-ir-scanner=$(GIR_SCANNER)

Regards,
Yann E. MORIN.

>  [properties]
>  needs_exe_wrapper = true
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
