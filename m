From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:09:55 +0200
Subject: [Buildroot] [git commit] system: introduce BR2_SYSTEM_ENABLE_NLS
Message-ID: <20170704170701.30CEE7FDF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc057d2865afafbf76c2bc2685d2dfe852ba7c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, the option BR2_ENABLE_LOCALE was more-or-less controlling
whether NLS support was enabled in packages. More precisely, if
BR2_ENABLE_LOCALE=y, we were not doing anything (so some packages
could have NLS support enabled, some not). And only when
BR2_ENABLE_LOCALE was disabled we were explicitly passing
--disable-nls to packages.

This doesn't make much sense, and there is no reason to tie NLS
support to locale support. You may want locale support, but not
necessarily NLS support. Therefore, this commit introduces
BR2_SYSTEM_ENABLE_NLS, which allows to enable/disable NLS support
globally. When this option is enabled, we pass --enable-nls to
packages, otherwise we pass --disable-nls.

In addition, when this option is enabled and the C library doesn't
provide a full-blown implementation of gettext, we select the gettext
package, which will provide the full blown implementation.

It is worth mentioning that this commit has a visible impact for users:

 - Prior to this commit, as soon as BR2_ENABLE_LOCALE=y, packages
   *could* provide NLS support. It was up to each package to decide
   whether they wanted to provide NLS support or not (we were not
   passing --enable-nls nor --disable-nls).

 - After this commit, it's BR2_SYSTEM_ENABLE_NLS that controls whether
   NLS is enabled or disabled, and this option is disabled by default.

Bottom line: with the default of BR2_SYSTEM_ENABLE_NLS disabled, some
packages may lose NLS support that they used to provide. But we
believe it's a reasonable default behavior for Buildroot, where
generally NLS support is not necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in       |  4 ++--
 package/gettext/Config.in |  1 +
 system/Config.in          | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4a5b3af..462b7ca 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -359,8 +359,8 @@ TARGET_CONFIGURE_ARGS = \
 
 ################################################################################
 
-ifeq ($(BR2_ENABLE_LOCALE),y)
-NLS_OPTS =
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+NLS_OPTS = --enable-nls
 else
 NLS_OPTS = --disable-nls
 endif
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 18bfda6..0dea03d 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_GETTEXT
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
 	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
+	default y if BR2_SYSTEM_ENABLE_NLS
 
 endif
 
diff --git a/system/Config.in b/system/Config.in
index 8588839..828df42 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -420,6 +420,25 @@ config BR2_GENERATE_LOCALE
 	  specified, UTF-8 is assumed. Examples of locales: en_US,
 	  fr_FR.UTF-8.
 
+config BR2_SYSTEM_ENABLE_NLS
+	bool "Enable Native Language Support (NLS)"
+	depends on BR2_USE_WCHAR
+	#  - glibc has built-in NLS support, but anyway doesn't
+	#    support static linking
+	#  - musl and uclibc support static linking, but they don't
+	#    have built-in NLS support, which is provided by the
+	#    libintl library from gettext. The fact that it is a
+	#    separate library causes too many problems for static
+	#    linking.
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_GETTEXT if !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
+	help
+	  This option will enable Native Language Support, which will
+	  allow software packages to support translations.
+
+comment "NLS support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
 	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
