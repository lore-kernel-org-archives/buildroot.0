From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Dec 2019 20:17:04 +0100
Subject: [Buildroot] [PATCH 3/3] package/sysdig: bump to version 0.26.4
In-Reply-To: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
References: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
Message-ID: <20191207191704.647337-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- License is now Apache-2.0 except driver that is MIT and GPL-2.0:
  https://github.com/draios/sysdig/commit/e404c50c346ce1a2750446aeaac59f4062f33b0a
- grpc is a mandatory dependency since version 0.25.0 and
  https://github.com/draios/sysdig/commit/4362475c8a5c578c057d7ac16e453c6b2cf6c13e
- tbb is a mandatory dependency since version 0.24.0 and
  https://github.com/draios/sysdig/commit/69ad6dd5144cfe30b2eac5a8ef56dffd178a11a3
- driver/driver_config.h is not prebuilt so generate it
- Fix build with kernel >= 5.1 thanks to
  https://github.com/draios/sysdig/commit/a6ab1e66fc05a02178e051ea2441633996d5871e

Fixes:
 - fix build with kernel >= 5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysdig/Config.in   | 18 +++++++++++++-----
 package/sysdig/sysdig.hash |  6 ++++--
 package/sysdig/sysdig.mk   | 13 +++++++++----
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 672c44d211..2471a41537 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,21 +1,26 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_INSTALL_LIBSTDCPP # libjson
+	depends on BR2_INSTALL_LIBSTDCPP # libjson, grpc -> protobuf, tbb
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on !BR2_STATIC_LIBS # luajit, elfutils
+	depends on !BR2_STATIC_LIBS # luajit, elfutils, grpc -> protobuf, tbb
 	depends on BR2_USE_WCHAR # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
+	depends on BR2_TOOLCHAIN_HAS_THREADS # grpc -> protobuf, tbb
+	depends on BR2_TOOLCHAIN_USES_GLIBC # tbb
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_GRPC
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_JQ
 	select BR2_PACKAGE_LIBB64
 	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_TBB
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux
@@ -25,8 +30,11 @@ config BR2_PACKAGE_SYSDIG
 
 	  http://sysdig.org
 
-comment "sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 565b1e9828..a5eab5a49a 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,5 @@
 # sha256 locally computed
-sha256  57d5b713b875eba35546a1408bf3f20c2703904a17d956be115ee55272db4cfa  sysdig-0.23.1.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  7c15ee25abf6cca850eaf6f4e42e25a1d9ad2b775ae794028f94afbd1ce9d271  sysdig-0.26.4.tar.gz
+sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
+sha256  e3f6a43d097ed68176e9738de925d98b938e1bccf6d6bd1bcd79395eca8f76ed  driver/MIT.txt
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index c604032cf4..9f90238346 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.23.1
+SYSDIG_VERSION = 0.26.4
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
-SYSDIG_LICENSE = GPL-2.0
-SYSDIG_LICENSE_FILES = COPYING
+SYSDIG_LICENSE = Apache-2.0 (userspace), GPL-2.0 (driver), MIT (driver)
+SYSDIG_LICENSE_FILES = COPYING driver/GPL2.txt driver/MIT.txt
 SYSDIG_CONF_OPTS = -DENABLE_DKMS=OFF -DUSE_BUNDLED_DEPS=OFF
-SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64 elfutils
+SYSDIG_DEPENDENCIES = \
+	zlib luajit jsoncpp libcurl ncurses openssl jq libb64 elfutils grpc tbb
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # sysdig creates the module Makefile from a template, which contains a
@@ -22,6 +23,10 @@ define SYSDIG_MODULE_GEN_MAKEFILE
 	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
 	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
 	$(SED) 's/@PROBE_NAME@/sysdig-probe/;' $(@D)/driver/Makefile
+	$(INSTALL) -m 0644 $(@D)/driver/driver_config.h.in $(@D)/driver/driver_config.h
+	$(SED) 's/$${PROBE_VERSION}/$(SYSDIG_VERSION)/;' $(@D)/driver/driver_config.h
+	$(SED) 's/$${PROBE_NAME}/sysdig-probe/;' $(@D)/driver/driver_config.h
+	$(SED) 's/$${PROBE_DEVICE_NAME}/sysdig/;' $(@D)/driver/driver_config.h
 endef
 SYSDIG_POST_PATCH_HOOKS += SYSDIG_MODULE_GEN_MAKEFILE
 
-- 
2.24.0
