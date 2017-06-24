From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 16:50:16 +0200
Subject: [Buildroot] [git commit] package/beecrypt: remove c++ support
Message-ID: <20170624145209.87EF58072B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4d3c18d6753e1224fbe59d91a4b44f39bc38c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optional C++ support depends on icu, the icu version bump to 59.1
brought ABI-breaking changes
http://site.icu-project.org/download/59#TOC-char16_t-in-C-

which are incompatible with beecrypt. Since beecrypt did not get any
updates upstream since 2009 and no package uses beecrypt's C++ support
we disable this broken option.

With C++ support removed patches 0002 & 0004 are not needed anymore.

Fixes
http://autobuild.buildroot.net/results/a1a/a1ad507371192ddecacab0df91f7b2a84c7c288d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 +++++
 ...-build-system.patch => 0002-build-system.patch} |  0
 .../beecrypt/0002-icu-check-cross-compile.patch    | 31 ----------------------
 package/beecrypt/0004-gcc-4.7.patch                | 19 -------------
 package/beecrypt/Config.in                         | 22 ---------------
 package/beecrypt/beecrypt.mk                       | 11 ++------
 6 files changed, 9 insertions(+), 81 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 361d331..ec28da3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_PACKAGE_BEECRYPT_CPP
+	bool "C++ support removed in beecrypt"
+	select BR2_LEGACY
+	help
+	  Support for C++ depends on icu. The beecrypt package is
+	  incompatible with icu 59+.
+
 config BR2_PACKAGE_SPICE_CLIENT
 	bool "spice client support removed"
 	select BR2_LEGACY
diff --git a/package/beecrypt/0003-build-system.patch b/package/beecrypt/0002-build-system.patch
similarity index 100%
rename from package/beecrypt/0003-build-system.patch
rename to package/beecrypt/0002-build-system.patch
diff --git a/package/beecrypt/0002-icu-check-cross-compile.patch b/package/beecrypt/0002-icu-check-cross-compile.patch
deleted file mode 100644
index cc02116..0000000
--- a/package/beecrypt/0002-icu-check-cross-compile.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-configure: Use AC_COMPILE_IFELSE for ICU check for cross compilation compat
-
-AC_RUN_IFELSE doesn't work when cross compiling, but we can do the
-check in the preprocessor instead, so use AC_COMPILE_IFELSE instead.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-Index: beecrypt-4.2.1/configure.ac
-===================================================================
---- beecrypt-4.2.1.orig/configure.ac
-+++ beecrypt-4.2.1/configure.ac
-@@ -295,13 +295,13 @@
- if test "$ac_with_cplusplus" = yes; then
-   AC_MSG_CHECKING([for IBM's ICU library version >= 2.8])
-   AC_LANG_PUSH(C)
--  AC_RUN_IFELSE([
-+  AC_COMPILE_IFELSE([
-     AC_LANG_PROGRAM([[#include <unicode/uversion.h>]],[[
-       #if U_ICU_VERSION_MAJOR_NUM < 2
--      exit(1);
-+      #error too old
-       #elif U_ICU_VERSION_MAJOR_NUM == 2
-       # if U_ICU_VERSION_MINOR_NUM < 8
--      exit(1);
-+      #error too old
-       # else
-       exit(0);
-       # endif
diff --git a/package/beecrypt/0004-gcc-4.7.patch b/package/beecrypt/0004-gcc-4.7.patch
deleted file mode 100644
index 767f789..0000000
--- a/package/beecrypt/0004-gcc-4.7.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Really fixes gcc-4.7 related compile error:
-../../include/beecrypt/c++/util/AbstractSet.h:59:27: error: 'containsAll' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
-
-Downloaded from upstream bugtracker:
-http://sourceforge.net/p/beecrypt/patches/10/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/include/beecrypt/c++/util/AbstractSet.h
-+++ b/include/beecrypt/c++/util/AbstractSet.h
-@@ -56,7 +56,7 @@
- 					if (c->size() != size())
- 						return false;
- 
--					return containsAll(*c);
-+					return this->containsAll(*c);
- 				}
- 				return false;
- 			}
diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 8854515..9aec85a 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -8,25 +8,3 @@ config BR2_PACKAGE_BEECRYPT
 	  Beecrypt is a general-purpose cryptography library.
 
 	  http://beecrypt.sf.net
-
-if BR2_PACKAGE_BEECRYPT
-
-config BR2_PACKAGE_BEECRYPT_CPP
-	bool "C++ support"
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
-	depends on BR2_USE_WCHAR # icu
-	depends on !BR2_BINFMT_FLAT # icu
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_ICU
-	help
-	  Enable C++ support. This pulls in the (large) icu package.
-
-comment "C++ support needs a toolchain w/ C++, wchar, dynamic libraries, gcc >= 4.8, host gcc >= 4.8"
-	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		|| !BR2_HOST_GCC_AT_LEAST_4_8
-
-endif # BR2_PACKAGE_BEECRYPT
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 10dd97c..f13f72c 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -15,7 +15,8 @@ BEECRYPT_CONF_OPTS = \
 	--disable-expert-mode \
 	--without-java \
 	--without-python \
-	--disable-openmp
+	--disable-openmp \
+	--without-cplusplus
 
 # disable optimized m68k assembly as it doesn't compile for coldfire
 ifeq ($(BR2_m68k_cf),y)
@@ -27,19 +28,11 @@ ifeq ($(BR2_arm):$(BR2_ARM_CPU_HAS_ARM),y:)
 BEECRYPT_CONF_OPTS += --enable-debug
 endif
 
-ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
-BEECRYPT_DEPENDENCIES += icu
-BEECRYPT_CONF_OPTS += --with-cplusplus
-else
-BEECRYPT_CONF_OPTS += --without-cplusplus
-
 # automake/libtool uses the C++ compiler to link libbeecrypt because of
 # (the optional) cppglue.cxx. Force it to use the C compiler instead.
 define BEECRYPT_LINK_WITH_CC
 	$(SED) 's/--tag=CXX/--tag=CC/g' $(@D)/Makefile
 endef
-
 BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
-endif
 
 $(eval $(autotools-package))
