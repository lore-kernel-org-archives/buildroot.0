From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2015 15:06:56 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/tvheadend: Fix static build
In-Reply-To: <1440849333-27450-1-git-send-email-bernd.kuhls@t-online.de>
References: <1440849333-27450-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829130656.GD4857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-08-29 13:55 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> http://autobuild.buildroot.net/results/bd0/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: Changed patch to fix Makefile instead (Thomas)
> v2: Put everything in the if-static_libs-then clause (Jerzy)
> 
>  package/tvheadend/0003-fix-static-build.patch | 43 +++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/tvheadend/0003-fix-static-build.patch
> 
> diff --git a/package/tvheadend/0003-fix-static-build.patch b/package/tvheadend/0003-fix-static-build.patch
> new file mode 100644
> index 0000000..fef7e59
> --- /dev/null
> +++ b/package/tvheadend/0003-fix-static-build.patch
> @@ -0,0 +1,43 @@
> +Patch sent upstream: https://github.com/tvheadend/tvheadend/pull/705
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +
> +From 61b077fd48b1494205dbfd10d2dfcec0150f6b7a Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 29 Aug 2015 13:03:26 +0200
> +Subject: [PATCH] Remove -ldl to fix static build
> +
> +-ldl was added in 2010: "Link with libdl (for dladdr())"
> +https://github.com/tvheadend/tvheadend/commit/0fca6020008c0964155a18e23093e136333ad9ef
> +
> +The only trace of dladdr() can be found currently in src/trap.c in line
> +192, encapsulated in #if ENABLE_EXECINFO. The buildsystem does not
> +contain any trace of ENABLE_EXECINFO

Yes there is:

    $ git grep -i execinfo
    configure:check_cc_header execinfo
    [...]

Regards,
Yann E. MORIN.

> so I suppose -ldl is not needed
> +anymore. Unconditionally adding "-ldl" breaks static builds in buildroot
> +however:
> +http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/build-end.log
> +
> +This patch, written by Thomas Petazzoni, fixes the problem.
> +He gave me written consent to send this patch upstream in his name:
> +http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/125500
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 037e2fa..1b28c8d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -38,9 +38,9 @@ CFLAGS  += -fms-extensions -funsigned-char -fno-strict-aliasing
> + CFLAGS  += -D_FILE_OFFSET_BITS=64
> + CFLAGS  += -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
> + ifeq ($(CONFIG_ANDROID),yes)
> +-LDFLAGS += -ldl -lm
> ++LDFLAGS += -lm
> + else
> +-LDFLAGS += -ldl -lpthread -lm
> ++LDFLAGS += -lpthread -lm
> + endif
> + ifeq ($(CONFIG_LIBICONV),yes)
> + LDFLAGS += -liconv
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
