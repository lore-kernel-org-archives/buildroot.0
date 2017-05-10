From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 May 2017 12:12:01 +0100
Subject: [Buildroot] [PATCH 1/1] flex: bump to version v2.6.4
In-Reply-To: <20170510110643.17926-1-aduskett@codeblue.com>
References: <20170510110643.17926-1-aduskett@codeblue.com>
Message-ID: <15e3d3c3-221c-ac4d-1a48-9bc4179cd8a5@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

I already sent a patch to bump flex to 2.6.4 a couple of days ago. Could
you please review my patch instead?

http://patchwork.ozlabs.org/patch/759619/

Thanks,

Vincent

On 10/05/17 12:06, Adam Duskett wrote:
> flex.mk:
>   - The package is now hosted on github not sourceforge.
>   - autogen.sh is now used, set FLEX_AUTORECONF to YES.
>   - host-gettext is now required. Without it autoconf fails to run.
>     This is both with host-flex and target-flex.
>   - The FLEX_DISABLE_PROGRAM define in the makefile has been removed,
>     as the only reference to bin_PROGRAMS is now just flex.
>   - The flex++ symlink is now only generated if the flex binary is
>     installed. As such, FLEX_REMOVE_BROKEN_SYMLINK is no longer needed.
>   - Add FLEX_TOUCH_RPATH_CONF define in flex.mk.  Autogen.sh fails if
>     build-aux/config.rpath doesn't exist. Touching it fixes the problem.
> 
> - Removed 0001-prog-ar.patch, fixed upstream.
> - Removed 0002-fix-CVE-2016-6354.patch, applied upstream.
> 
> 0001-fix-cross-compiling-issues.patch:
>   - doc requires help2man which isn't supported, and documents aren't
>     needed anyways.
>   - po doesn't have a makefile, and isn't needed for compiling.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/flex/0001-fix-cross-compiling-issues.patch | 49 ++++++++++++++++++++++
>  package/flex/0001-prog-ar.patch                    | 11 -----
>  package/flex/0002-fix-CVE-2016-6354.patch          | 25 -----------
>  package/flex/flex.hash                             |  2 +-
>  package/flex/flex.mk                               | 26 +++++-------
>  5 files changed, 61 insertions(+), 52 deletions(-)
>  create mode 100644 package/flex/0001-fix-cross-compiling-issues.patch
>  delete mode 100644 package/flex/0001-prog-ar.patch
>  delete mode 100644 package/flex/0002-fix-CVE-2016-6354.patch
> 
> diff --git a/package/flex/0001-fix-cross-compiling-issues.patch b/package/flex/0001-fix-cross-compiling-issues.patch
> new file mode 100644
> index 0000000..ef092c5
> --- /dev/null
> +++ b/package/flex/0001-fix-cross-compiling-issues.patch
> @@ -0,0 +1,49 @@
> +From 31985a4183654c884240c3740f8a24212f8794c2 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@codeblue.com>
> +Date: Tue, 9 May 2017 13:46:18 -0400
> +Subject: [PATCH] fix cross compiling issues
> +
> +the po directory doesn't have a makefile.
> +doc wants help2man that isn't supported by buildroot.
> +
> +Remove both of these references.
> +
> +Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> +---
> + Makefile.am  | 2 --
> + configure.ac | 2 --
> + 2 files changed, 4 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 638c549..8b7fbc4 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -43,9 +43,7 @@ EXTRA_DIST = \
> + 
> + SUBDIRS = \
> + 	src \
> +-	doc \
> + 	examples \
> +-	po \
> + 	tests \
> + 	tools
> + 
> +diff --git a/configure.ac b/configure.ac
> +index 55e774b..6c56c36 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -171,11 +171,9 @@ reallocarray dnl  OpenBSD function. We have replacement if not available.
> + 
> + AC_CONFIG_FILES(
> + Makefile
> +-doc/Makefile
> + examples/Makefile
> + examples/fastwc/Makefile
> + examples/manual/Makefile
> +-po/Makefile.in
> + src/Makefile
> + tools/Makefile
> + tests/Makefile
> +-- 
> +2.9.3
> +
> diff --git a/package/flex/0001-prog-ar.patch b/package/flex/0001-prog-ar.patch
> deleted file mode 100644
> index e0626ff..0000000
> --- a/package/flex/0001-prog-ar.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -diff -rup flex-2.5.33.orig/Makefile.in flex-2.5.33/Makefile.in
> ---- flex-2.5.33.orig/Makefile.in	2007-01-18 17:29:25.000000000 +0100
> -+++ flex-2.5.33/Makefile.in	2007-01-18 18:28:22.000000000 +0100
> -@@ -105,7 +105,6 @@ am__installdirs = "$(DESTDIR)$(libdir)"
> - 	"$(DESTDIR)$(includedir)"
> - libLIBRARIES_INSTALL = $(INSTALL_DATA)
> - LIBRARIES = $(lib_LIBRARIES)
> --AR = ar
> - ARFLAGS = cru
> - libfl_a_AR = $(AR) $(ARFLAGS)
> - libfl_a_LIBADD =
> diff --git a/package/flex/0002-fix-CVE-2016-6354.patch b/package/flex/0002-fix-CVE-2016-6354.patch
> deleted file mode 100644
> index b0c780b..0000000
> --- a/package/flex/0002-fix-CVE-2016-6354.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From a5cbe929ac3255d371e698f62dc256afe7006466 Mon Sep 17 00:00:00 2001
> -From: Will Estes <westes575@gmail.com>
> -Date: Sat, 27 Feb 2016 11:56:05 -0500
> -Subject: [PATCH] Fixed incorrect integer type
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ----
> -Status: upstream
> -
> - flex.skl | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/flex.skl b/src/flex.skl
> -index 36a526a..64f853d 100644
> ---- a/flex.skl
> -+++ b/flex.skl
> -@@ -1703,7 +1703,7 @@ int yyFlexLexer::yy_get_next_buffer()
> - 
> - 	else
> - 		{
> --			yy_size_t num_to_read =
> -+			int num_to_read =
> - 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
> - 
> - 		while ( num_to_read <= 0 )
> diff --git a/package/flex/flex.hash b/package/flex/flex.hash
> index b91ab57..fc0463d 100644
> --- a/package/flex/flex.hash
> +++ b/package/flex/flex.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  bf693433a3effe6b1f42e44abd787491e4e213984b1859545b92267a86088dd3  flex-2.5.37.tar.gz
> +sha256  4df278468142e457a9e5f6492a7d39fdb34bd7e7d42ec21b3c382889b34cfefe  flex-v2.6.4.tar.gz
> diff --git a/package/flex/flex.mk b/package/flex/flex.mk
> index 9a3f840..0613c89 100644
> --- a/package/flex/flex.mk
> +++ b/package/flex/flex.mk
> @@ -4,27 +4,23 @@
>  #
>  ################################################################################
>  
> -FLEX_VERSION = 2.5.37
> -FLEX_SITE = http://download.sourceforge.net/project/flex
> +FLEX_VERSION = v2.6.4
> +FLEX_SITE = $(call github,westes,flex,$(FLEX_VERSION))
>  FLEX_INSTALL_STAGING = YES
>  FLEX_LICENSE = FLEX
>  FLEX_LICENSE_FILES = COPYING
> -FLEX_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_GETTEXT_IF_LOCALE),gettext) host-m4
> -FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
> -# we don't have a host-gettext/libintl
> -HOST_FLEX_DEPENDENCIES = host-m4
> +FLEX_DEPENDENCIES = host-m4 host-gettext
> +FLEX_AUTORECONF = YES
> +HOST_FLEX_DEPENDENCIES = host-gettext host-m4
>  
> -define FLEX_DISABLE_PROGRAM
> -	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/Makefile.in
> +# build-aux/config.rpath is needed but not auto-generated.
> +define FLEX_TOUCH_RPATH_CONF
> +	mkdir -p $(@D)/build-aux
> +	touch $(@D)/build-aux/config.rpath
>  endef
> -FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
>  
> -# flex++ symlink is broken when flex binary is not installed
> -define FLEX_REMOVE_BROKEN_SYMLINK
> -	rm -f $(TARGET_DIR)/usr/bin/flex++
> -endef
> -FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_BROKEN_SYMLINK
> +FLEX_PRE_CONFIGURE_HOOKS += FLEX_TOUCH_RPATH_CONF
> +HOST_FLEX_PRE_CONFIGURE_HOOKS += FLEX_TOUCH_RPATH_CONF
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
