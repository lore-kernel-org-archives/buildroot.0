From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:12:13 +0200
Subject: [Buildroot] [git commit branch/next] package/mdadm: bump version to
	4.0
Message-ID: <20170809221937.0223B7FDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47b693fb9bdb22599301c1003854ed6196c9e3ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version of mdadm can optionally use the corosync and libdlm
packages. However, it checks for their presence by directly probing the
host /usr/include, which fails for cross-compilation:

http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=7716570e6d906e7326f83d466f6ba73009649d03#patch2
http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=d15a1f72bd92bc4724ee94b2ae8132633ffeb72b#patch1

Since Buildroot doesn't package either corosync nor libdlm, disable
them explicitly with -DNO_COROSYNC -DNO_DLM.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mdadm/mdadm.hash | 2 +-
 package/mdadm/mdadm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
index 7f228d9..6132a6d 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256	8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68	mdadm-3.3.4.tar.xz
+sha256 1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9  mdadm-4.0.tar.xz
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index c08e057..207b0be 100644
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
