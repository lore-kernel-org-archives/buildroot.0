From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Jul 2018 20:27:40 +0200
Subject: [Buildroot] [PATCH v2,1/1] wampcc: needs atomic
Message-ID: <20180710182740.10902-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/2f994762d4e01a904c50cf2728a4103e6e79da2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add BR2_TOOLCHAIN_HAS_ATOMIC in Config.in

 package/wampcc/Config.in | 3 +++
 package/wampcc/wampcc.mk | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/package/wampcc/Config.in b/package/wampcc/Config.in
index 9cf7d99dfe..92abc9cb25 100644
--- a/package/wampcc/Config.in
+++ b/package/wampcc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_WAMPCC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	select BR2_PACKAGE_LIBUV
@@ -17,11 +18,13 @@ config BR2_PACKAGE_WAMPCC
 
 comment "wampcc needs a toolchain w/ C++, NPTL, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
 comment "wampcc needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
index d8e093f679..dcd65f49d5 100644
--- a/package/wampcc/wampcc.mk
+++ b/package/wampcc/wampcc.mk
@@ -11,4 +11,9 @@ WAMPCC_INSTALL_STAGING = YES
 WAMPCC_LICENSE = MIT
 WAMPCC_LICENSE_FILES = LICENSE
 
+# Uses __atomic_fetch_add_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+WAMPCC_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
