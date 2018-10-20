From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 14:22:45 +0200
Subject: [Buildroot] [git commit] mdadm: fix mdmon build without threads
Message-ID: <20181020122337.05E468296B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5620a4ca5abcb3ceb0b6744bb46c0b9c28f12c31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 45498bbc62d8df (mdadm: also install mdmon) enabled build of hte
mdmon utility. This utility requires USE_PTHREADS make variable
undefined to build when threads are not supported.

Fixes:
http://autobuild.buildroot.net/results/4bd/4bdd03b1d8f30ef32177727aae46d8cf54fbc35e/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdadm/mdadm.mk | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 3ee4ddd059..b2ed5049aa 100644
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
