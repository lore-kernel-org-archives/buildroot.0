From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Jun 2021 22:09:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libqb: needs threads and static
 library
Message-ID: <20210620200926.78270-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libqb fails to build without threads or dynamic library since the
addition of the package in commit
22864d570dd18d78a77dedab8fbcc5e0122c0acc

Also add ac_cv_prog_cc_c99=-std=gnu99 to fix build failure without wchar

Fixes:
 - http://autobuild.buildroot.org/results/21c1b5d29da4949f4582056ab4e2335ec225d8d6
 - http://autobuild.buildroot.org/results/aa4df6364cdf3c862be13b6b738595f420ec6105
 - http://autobuild.buildroot.org/results/376d316094238ba7097e8bdc51960ba38532683a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqb/Config.in    | 5 +++++
 package/libqb/libqb.mk     | 4 ++++
 package/usbguard/Config.in | 4 ++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libqb/Config.in b/package/libqb/Config.in
index 4ab010ca50..e481835dfc 100644
--- a/package/libqb/Config.in
+++ b/package/libqb/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_LIBQB
 	bool "libqb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Library for client-server applications
 
 	  https://github.com/ClusterLabs/libqb
+
+comment "libqb needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index a0d97d5eb8..a9cf5e3fb9 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -13,4 +13,8 @@ LIBQB_INSTALL_STAGING = YES
 LIBQB_AUTORECONF = YES
 LIBQB_DEPENDENCIES = libxml2
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+LIBQB_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
 $(eval $(autotools-package))
diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 582e9b3852..34e24a2156 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_USBGUARD
 	bool "usbguard"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
-	depends on !BR2_STATIC_LIBS # protobuf
+	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
 	help
-- 
2.30.2
