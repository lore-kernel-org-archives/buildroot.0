From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:49:35 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/mdadm: bump version to 4.0
Message-ID: <20170805094935.18967-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to use -DNO_COROSYNC -DNO_DLM, otherwise the build will fail
because the checks used in Makefile for host headers are not cross-
compile friendly:

http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=7716570e6d906e7326f83d466f6ba73009649d03#patch2
http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=d15a1f72bd92bc4724ee94b2ae8132633ffeb72b#patch1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mdadm/mdadm.hash | 2 +-
 package/mdadm/mdadm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
index 7f228d99d..6132a6d8c 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256	8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68	mdadm-3.3.4.tar.xz
+sha256 1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9  mdadm-4.0.tar.xz
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index c08e05774..207b0be60 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-MDADM_VERSION = 3.3.4
+MDADM_VERSION = 4.0
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 
 MDADM_MAKE_OPTS = \
-	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm
+	CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm
 
 MDADM_INSTALL_TARGET_OPTS = \
 	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) install-mdadm
-- 
2.11.0
