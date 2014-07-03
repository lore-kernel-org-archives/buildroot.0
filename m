From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 03 Jul 2014 11:57:27 +0800
Subject: [Buildroot] [RFC,
	PATCH] toolchain: separate c++ compiler from libstdc++ presence
Message-ID: <1404359847.56223.159017096333.1.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We may want a c++ compiler, but no libstdc++ on the system. For example,
firmware that isn't linked with the system libstdc++. These packages can
depend on BR2_CPP instead of BR2_INSTALL_LIBSTDCPP.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/Makefile.in                |    2 +-
 package/gcc/Config.in.host         |   14 +++++++++++---
 package/gcc/gcc-final/gcc-final.mk |    2 +-
 toolchain/toolchain-common.in      |    4 ++++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0233506..e8de29f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -361,7 +361,7 @@ else
 DISABLE_IPV6= --disable-ipv6
 endif
 
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifneq ($(BR2_CPP),y)
 TARGET_CONFIGURE_OPTS+=CXX=false
 endif
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fde1b90..693ff5f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -126,13 +126,21 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	  initial, gcc intermediate and gcc final passes.
 
 config BR2_TOOLCHAIN_BUILDROOT_CXX
-	bool "Enable C++ support"
-	select BR2_INSTALL_LIBSTDCPP
+	bool "Enable C++ compiler support"
+	select BR2_CPP
 	depends on !(BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && \
 		     BR2_TOOLCHAIN_BUILDROOT_LOCALE)
 	help
 	  Enable this option if you want your toolchain to support the
-	  C++ language and you want C++ libraries to be installed on
+	  C++ language.
+
+config BR2_TOOLCHAIN_BUILDROOT_LIBSTDCPP
+	bool "Install C++ libraries"
+	default y
+	select BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+	help
+	  Enable this option if you want C++ libraries to be installed on
 	  your target system.
 
 comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 622dcf2..d277064 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -43,7 +43,7 @@ endef
 
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_CPP) += c++
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_FORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_OBJC)    += objc
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index a91d247..24edce3 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -26,8 +26,12 @@ config BR2_USE_WCHAR
 config BR2_ENABLE_LOCALE
 	bool
 
+config BR2_CPP
+	bool
+
 config BR2_INSTALL_LIBSTDCPP
 	bool
+	select BR2_CPP
 
 config BR2_TOOLCHAIN_HAS_THREADS
 	bool
