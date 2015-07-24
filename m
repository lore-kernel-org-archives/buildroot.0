From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 24 Jul 2015 22:08:07 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: support building with
	toolchains without native RPC
Message-ID: <1437768487-27179-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

ltp-testsuite needs RPC, but this could also be provided by libtirpc.

Since musl toolchains never have RPC support, this change would now allow
building of ltp-testsuite on musl toolchains. Unfortunately, ltp-testsuite
does not build yet with musl, so a specific check on musl is added.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/ltp-testsuite/Config.in        |  7 ++++---
 package/ltp-testsuite/ltp-testsuite.mk | 14 ++++++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 52c02ce..91b09ce 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -6,7 +6,8 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
 	help
@@ -21,7 +22,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://ltp.sourceforge.net/
 
-comment "ltp-testsuite needs a toolchain w/ RPC, threads"
+comment "ltp-testsuite needs a non-musl toolchain w/ threads"
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 2d4f286..05ffaf1 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -19,8 +19,18 @@ endif
 
 # ltp-testsuite uses <fts.h>, which isn't compatible with largefile
 # support.
+LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
+LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LTP_TESTSUITE_DEPENDENCIES += libtirpc
+LTP_TESTSUITE_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+LTP_TESTSUITE_LDFLAGS += -ltirpc
+endif
+
 LTP_TESTSUITE_CONF_ENV += \
-	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
+	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
+	LDFLAGS="$(LTP_TESTSUITE_LDFLAGS)"
 
 $(eval $(autotools-package))
-- 
1.8.5.1
