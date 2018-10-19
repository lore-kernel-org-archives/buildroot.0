From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 19 Oct 2018 13:18:24 +0300
Subject: [Buildroot] [PATCH] mdadm: fix mdmon build without threads
Message-ID: <1bb26b73a032e6492f0cbeb97e99e029c1869a1f.1539944304.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 45498bbc62d8df (mdadm: also install mdmon) enabled build of hte
mdmon utility. This utility requires USE_PTHREADS make variable
undefined to build when threads are not supported.

Fixes:
http://autobuild.buildroot.net/results/4bd/4bdd03b1d8f30ef32177727aae46d8cf54fbc35e/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mdadm/mdadm.mk | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 3ee4ddd059e9..b2ed5049aa1f 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -10,13 +10,17 @@ MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 
+MDADM_BUILD_OPTS = $(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
+	CHECK_RUN_DIR=0
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+MDADM_BUILD_OPTS += USE_PTHREADS=
+endif
+
 define MDADM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
-		CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
-		CHECK_RUN_DIR=0 \
-		mdadm mdmon
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(MDADM_BUILD_OPTS) mdadm mdmon
 endef
 
 define MDADM_INSTALL_TARGET_CMDS
-- 
2.19.1
