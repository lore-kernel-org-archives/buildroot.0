From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Dec 2018 13:40:16 +0100
Subject: [Buildroot] [PATCH 1/1] fontconfig: fix static build
In-Reply-To: <20181202093728.20636-1-fontaine.fabrice@gmail.com>
References: <20181202093728.20636-1-fontaine.fabrice@gmail.com>
Message-ID: <20181202124016.GD2544@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-12-02 10:37 +0100, Fabrice Fontaine spake thusly:
> Retrieved patch from upstream to fix static build
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/17e5f9ce5e7566f5a88abfd27b7db5614c1a3086
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-the-build-issue-with-enable-static.patch | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch
> 
> diff --git a/package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch b/package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch
> new file mode 100644
> index 0000000000..6104f1ed10
> --- /dev/null
> +++ b/package/fontconfig/0001-Fix-the-build-issue-with-enable-static.patch
> @@ -0,0 +1,80 @@
> +From 8208f99fa1676c42bfd8d74de3e9dac5366c150c Mon Sep 17 00:00:00 2001
> +From: Akira TAGOH <akira@tagoh.org>
> +Date: Mon, 3 Sep 2018 04:56:16 +0000
> +Subject: Fix the build issue with --enable-static
> +
> +Fixes https://gitlab.freedesktop.org/fontconfig/fontconfig/issues/109
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://gitlab.freedesktop.org/fontconfig/fontconfig/issues/109]

Is it not better to backport and reference the actual commit, instead:
    https://gitlab.freedesktop.org/fontconfig/fontconfig/commit/8208f99fa1676c42bfd8d74de3e9dac5366c150c

Regards,
Yann E. MORIN.

> +---
> + test/test-bz106632.c | 35 ++++++++++++-----------------------
> + 1 file changed, 12 insertions(+), 23 deletions(-)
> +
> +(limited to 'test')
> +
> +diff --git a/test/test-bz106632.c b/test/test-bz106632.c
> +index daa0c1e..2d67c2e 100644
> +--- a/test/test-bz106632.c
> ++++ b/test/test-bz106632.c
> +@@ -25,25 +25,26 @@
> + #ifdef HAVE_CONFIG_H
> + #include "config.h"
> + #endif
> ++#include <stdio.h>
> + #include <stdlib.h>
> ++#include <string.h>
> + #include <dirent.h>
> ++#include <unistd.h>
> ++#include <errno.h>
> + #ifndef HAVE_STRUCT_DIRENT_D_TYPE
> + #include <sys/types.h>
> + #include <sys/stat.h>
> +-#include <unistd.h>
> + #endif
> +-#include "fcstr.c"
> +-#undef FcConfigBuildFonts
> +-#undef FcConfigCreate
> +-#undef FcConfigGetCurrent
> +-#undef FcConfigParseAndLoadFromMemory
> +-#undef FcConfigUptoDate
> +-#undef FcFontList
> +-#undef FcInitReinitialize
> +-#undef FcPatternCreate
> +-#undef FcPatternDestroy
> + #include <fontconfig/fontconfig.h>
> + 
> ++#ifdef _WIN32
> ++#  define FC_DIR_SEPARATOR         '\\'
> ++#  define FC_DIR_SEPARATOR_S       "\\"
> ++#else
> ++#  define FC_DIR_SEPARATOR         '/'
> ++#  define FC_DIR_SEPARATOR_S       "/"
> ++#endif
> ++
> + #ifdef HAVE_MKDTEMP
> + #define fc_mkdtemp	mkdtemp
> + #else
> +@@ -154,18 +155,6 @@ unlink_dirs (const char *dir)
> +     return ret;
> + }
> + 
> +-FcChar8 *
> +-FcLangNormalize (const FcChar8 *lang)
> +-{
> +-    return NULL;
> +-}
> +-
> +-FcChar8 *
> +-FcConfigHome (void)
> +-{
> +-    return NULL;
> +-}
> +-
> + int
> + main (void)
> + {
> +-- 
> +cgit v1.1
> +
> -- 
> 2.17.1
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
