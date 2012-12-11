From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Dec 2012 10:31:00 -0300
Subject: [Buildroot] [PATCH] libnss: fix build failures
Message-ID: <1355232660-2377-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Such as
http://autobuild.buildroot.net/results/2ca1d135269a67201e6b4d995ce8fbe94db1ed3f

The mozilla build system passes all of the different ways of CFLAGS
(OPTIMIZER, XCFLAGS, OS_CFLAGS) even when building host tools
(nsintall).
The best way around this without patching libnss is just building the
host tools first without any CFLAGS and then going on with the rest.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnss/libnss.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 84fc149..96faf37 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -17,7 +17,6 @@ LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
 		NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
 		BUILD_OPT=1 \
 		NS_USE_GCC=1 \
-		OPTIMIZER="$(TARGET_CFLAGS)" \
 		NSS_USE_SYSTEM_SQLITE=1 \
 		NSS_ENABLE_ECC=1 \
 		NATIVE_CC="$(HOSTCC)" \
@@ -34,11 +33,16 @@ endif
 
 
 define LIBNSS_BUILD_CMDS
-	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf build_dbm all \
+	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf \
 			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 			DIST=$(@D)/$(LIBNSS_DISTDIR) \
 			CHECKLOC= \
 			$(LIBNSS_BUILD_VARS)
+	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_dbm all \
+			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
+			DIST=$(@D)/$(LIBNSS_DISTDIR) \
+			CHECKLOC= \
+			$(LIBNSS_BUILD_VARS) OPTIMIZER="$(TARGET_CFLAGS)"
 endef
 
 define LIBNSS_INSTALL_STAGING_CMDS
-- 
1.7.8.6
