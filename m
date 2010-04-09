From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/jffs2: cleanup
Message-ID: <20100409142126.A73BA20E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=16b1d2a734bde48c104eeef7e1a3287785ab2251
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the code to build host MTD utils, since they can now be built
using package/mtd.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/jffs2/Config.in    |    1 -
 target/jffs2/jffs2root.mk |   10 +---------
 2 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/target/jffs2/Config.in b/target/jffs2/Config.in
index bcb4d51..bf4ac60 100644
--- a/target/jffs2/Config.in
+++ b/target/jffs2/Config.in
@@ -1,6 +1,5 @@
 config BR2_TARGET_ROOTFS_JFFS2
 	bool "jffs2 root filesystem"
-	select BR2_HOST_FAKEROOT
 	help
 	  Build a jffs2 root filesystem
 
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index 7d31417..30ac86d 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -44,7 +44,7 @@ endif
 # value of MKFS_JFFS2 to either the previously installed copy or the one
 # just built.
 #
-$(JFFS2_TARGET): host-fakeroot makedevs mtd-host
+$(JFFS2_TARGET): host-fakeroot host-mtd makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	touch $(BUILD_DIR)/.fakeroot.00000
@@ -81,14 +81,6 @@ ifneq ($(JFFS2_COPYTO),)
 	@cp -f $(JFFS2_TARGET) $(JFFS2_COPYTO)
 endif
 
-jffs2root-source: mtd-host-source
-
-jffs2root-clean: mtd-host-clean
-	-rm -f $(JFFS2_TARGET)
-
-jffs2root-dirclean: mtd-host-dirclean
-	-rm -f $(JFFS2_TARGET)
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
