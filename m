From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 28 Jun 2018 13:58:14 +0300
Subject: [Buildroot] [PATCH] trousers/tpm-tools: enable on ARC
Message-ID: <20180628105814.11509-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the latest ARC toolchain arc-2018.03 builds of "trousers" and
"tpm-tools" packages perform without errors.
Lets enable these packages for ARC.

With the exception, building tpm-tools for ARC770/750 requires to pass
"-mno-compact-casesi" as it was made for trousers before: 
see patch f4cd8ceb9cfa "trousers: Pass "-mno-compact-casesi" when
building for ARCv1".
This change is a temporary workaround and the feature is going to be
fixed in the next ARC toolchain release version.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 package/tpm-tools/Config.in    | 2 --
 package/tpm-tools/tpm-tools.mk | 4 ++++
 package/trousers/Config.in     | 3 ---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
index e115687281..ca70adc80c 100644
--- a/package/tpm-tools/Config.in
+++ b/package/tpm-tools/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_TPM_TOOLS
 	bool "tpm-tools"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # trousers
 	depends on !BR2_STATIC_LIBS # trousers
-	depends on !BR2_arc # trousers
 	select BR2_PACKAGE_TROUSERS
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -12,4 +11,3 @@ config BR2_PACKAGE_TPM_TOOLS
 
 comment "tpm-tools needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on !BR2_arc
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index b6738251ff..623e06fb98 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -16,4 +16,8 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TPM_TOOLS_CONF_ENV += LIBS='-liconv'
 endif
 
+ifeq ($(BR2_arc770d)$(BR2_arc750d),y)
+TPM_TOOLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-casesi"
+endif
+
 $(eval $(autotools-package))
diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index 7a1470629a..998df98398 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_TROUSERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# doesn't build properly in static only configurations
 	depends on !BR2_STATIC_LIBS
-	# ARC toolchain issue
-	depends on !BR2_arc
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -18,4 +16,3 @@ config BR2_PACKAGE_TROUSERS
 
 comment "trousers needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on !BR2_arc
-- 
2.17.1
