From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 8 Jun 2018 09:28:45 +0300
Subject: [Buildroot] [PATCH] elfutils: security bump to version 0.171
In-Reply-To: <ba51f7d0e34a8951b7c4b153f3b0e41a9a123199.1528438917.git.baruch@tkos.co.il>
References: <ba51f7d0e34a8951b7c4b153f3b0e41a9a123199.1528438917.git.baruch@tkos.co.il>
Message-ID: <20180608062845.mjkwfnf3mwikpmr3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

On Fri, Jun 08, 2018 at 09:21:57AM +0300, Baruch Siach wrote:
> Fixes CVE-2018-8769: buffer over-read in the ebl_dynamic_tag_name
> function of libebl/ebldynamictagname.c because SYMTAB_SHNDX is
> unsupported.

Actually, the bug was only introduced in the master branch, not in any 
elfutils release.

  https://sourceware.org/bugzilla/show_bug.cgi?id=22976

So not a security bump.

baruch

> Drop the po/ disable patch; not needed anymore.
> 
> Drop the __mempcpy compatibility patch; __mempcpy is not used anymore.
> 
> Refresh the -Werror removal patch; still needed, unfortunately.
> 
> Renumber the remaining patches.
> 
> Add GPLv3 license file.
> 
> Add license files hash.
> 
> Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...able-disable-progs-configure-option.patch} |  0
>  ...mplementation-of-the-fts_-functions.patch} |  0
>  ...-Werror-conditional-to-BUILD_WERROR.patch} | 10 +++----
>  package/elfutils/0004-disable-po.patch        | 24 -----------------
>  package/elfutils/0006-memcpy-def.patch        | 26 -------------------
>  package/elfutils/elfutils.hash                |  8 ++++--
>  package/elfutils/elfutils.mk                  |  4 +--
>  7 files changed, 13 insertions(+), 59 deletions(-)
>  rename package/elfutils/{0002-disable-progs.patch => 0001-Add-a-enable-disable-progs-configure-option.patch} (100%)
>  rename package/elfutils/{0003-fts.patch => 0002-Add-an-implementation-of-the-fts_-functions.patch} (100%)
>  rename package/elfutils/{0005-really-make-werror-conditional-to-build-werror.patch => 0003-Really-make-Werror-conditional-to-BUILD_WERROR.patch} (80%)
>  delete mode 100644 package/elfutils/0004-disable-po.patch
>  delete mode 100644 package/elfutils/0006-memcpy-def.patch
> 
> diff --git a/package/elfutils/0002-disable-progs.patch b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
> similarity index 100%
> rename from package/elfutils/0002-disable-progs.patch
> rename to package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
> diff --git a/package/elfutils/0003-fts.patch b/package/elfutils/0002-Add-an-implementation-of-the-fts_-functions.patch
> similarity index 100%
> rename from package/elfutils/0003-fts.patch
> rename to package/elfutils/0002-Add-an-implementation-of-the-fts_-functions.patch
> diff --git a/package/elfutils/0005-really-make-werror-conditional-to-build-werror.patch b/package/elfutils/0003-Really-make-Werror-conditional-to-BUILD_WERROR.patch
> similarity index 80%
> rename from package/elfutils/0005-really-make-werror-conditional-to-build-werror.patch
> rename to package/elfutils/0003-Really-make-Werror-conditional-to-BUILD_WERROR.patch
> index a7017d6e88c2..21ffa7f31b35 100644
> --- a/package/elfutils/0005-really-make-werror-conditional-to-build-werror.patch
> +++ b/package/elfutils/0003-Really-make-Werror-conditional-to-BUILD_WERROR.patch
> @@ -1,4 +1,4 @@
> -From 1d8f27d73df6369b19ddd6732960df0d4fdec338 Mon Sep 17 00:00:00 2001
> +From 2688a0238eaf825d6659c16c012db0c16f07e197 Mon Sep 17 00:00:00 2001
>  From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  Date: Mon, 29 May 2017 23:24:42 +0300
>  Subject: [PATCH] Really make -Werror conditional to BUILD_WERROR
> @@ -20,17 +20,17 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>   1 file changed, 1 deletion(-)
>  
>  diff --git a/config/eu.am b/config/eu.am
> -index 8fe1e259f9e2..c5a6209a4e04 100644
> +index c2cc349ce876..99b368e09060 100644
>  --- a/config/eu.am
>  +++ b/config/eu.am
> -@@ -71,7 +71,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
> +@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
>   	    -Wold-style-definition -Wstrict-prototypes \
>   	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
>   	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
>  -	    $(if $($(*F)_no_Werror),,-Werror) \
>   	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
>   	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
> - 	    $($(*F)_CFLAGS)
> + 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
>  -- 
> -2.11.0
> +2.17.1
>  
> diff --git a/package/elfutils/0004-disable-po.patch b/package/elfutils/0004-disable-po.patch
> deleted file mode 100644
> index c45c5804632b..000000000000
> --- a/package/elfutils/0004-disable-po.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Disable the build of the po/ directory
> -
> -Building the po/ directory complains that the scripts in there have
> -been generated with gettext 0.17, while we use gettext 0.18 in
> -Buildroot. Since we don't care that much about po files anyway, just
> -disable the build of this directory.
> -
> -Based on the former patch by Thomas Petazzoni.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -diff -rup a/Makefile.am b/Makefile.am
> ---- a/Makefile.am	2014-11-07 15:14:39.018060884 +0000
> -+++ b/Makefile.am	2014-11-07 15:30:02.864918229 +0000
> -@@ -28,7 +28,7 @@ endif
> -
> - # Add doc back when we have some real content.
> - SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
> --	  backends $(PROGS_SUBDIR) po tests
> -+	  backends $(PROGS_SUBDIR) tests
> -
> - EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
> -	     COPYING COPYING-GPLV2 COPYING-LGPLV3
> diff --git a/package/elfutils/0006-memcpy-def.patch b/package/elfutils/0006-memcpy-def.patch
> deleted file mode 100644
> index 509482774c77..000000000000
> --- a/package/elfutils/0006-memcpy-def.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Provide a compatibility alias __memcpy
> -
> -For some reason, libelf uses the internal glibc alias __memcpy, which
> -doesn't exist in uClibc. Add a manual alias so that the build can
> -proceed with uClibc.
> -
> -Based on the former patch by Thomas Petazzoni.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -diff -rup a/libelf/libelf.h b/libelf/libelf.h
> ---- a/libelf/libelf.h	2014-08-27 10:25:17.000000000 +0100
> -+++ b/libelf/libelf.h	2014-11-07 15:13:08.743508221 +0000
> -@@ -34,6 +34,11 @@
> - /* Get the ELF types.  */
> - #include <elf.h>
> -
> -+#ifndef _LIBC
> -+#ifndef __mempcpy
> -+#define __mempcpy mempcpy
> -+#endif
> -+#endif
> -
> - /* Known translation types.  */
> - typedef enum
> diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
> index 76b6dc64588d..dc321e935988 100644
> --- a/package/elfutils/elfutils.hash
> +++ b/package/elfutils/elfutils.hash
> @@ -1,2 +1,6 @@
> -# From https://sourceware.org/elfutils/ftp/0.169/sha512.sum
> -sha512 0a81a20bb2aff533d035d6b76f1403437b2e11bce390db57e34b8c26e4b9b3150346d83dddcbfbbdc58063f046ca3223508dba35c6ce88e375d201e7a777a8b9  elfutils-0.169.tar.bz2
> +# From https://sourceware.org/elfutils/ftp/0.171/sha512.sum
> +sha512 777be2d63ca9b11440bf358a33428d9ca974e2612a880934156c9f7194af596ed627c1ed2d48dbd47a3761c94913b8f39565f9dcb6b62c92bf229f04c96d5ee3  elfutils-0.171.tar.bz2
> +# Locally calculated
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
> +sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING-LGPLV3
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index 5570a3b37fea..5eaaaeadadb5 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -ELFUTILS_VERSION = 0.169
> +ELFUTILS_VERSION = 0.171
>  ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
>  ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
>  ELFUTILS_INSTALL_STAGING = YES
>  ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
> -ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
> +ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
>  ELFUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
>  HOST_ELFUTILS_DEPENDENCIES = host-zlib host-bzip2 host-xz
>  
> -- 
> 2.17.1
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
