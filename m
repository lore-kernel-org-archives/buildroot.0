From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:48:07 -0300
Subject: [Buildroot] [PATCH 18/20] wipe: bump to version 2.3.1 and switch to
	sourceforge
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original version is gone, so switch to sourceforge wipe and bump to
version 2.3.1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wipe/Config.in                 |    2 +-
 package/wipe/wipe-dont-force-lfs.patch |   16 ++++++++++++++++
 package/wipe/wipe.mk                   |   24 +++++-------------------
 3 files changed, 22 insertions(+), 20 deletions(-)
 create mode 100644 package/wipe/wipe-dont-force-lfs.patch

diff --git a/package/wipe/Config.in b/package/wipe/Config.in
index a053a72..0241c13 100644
--- a/package/wipe/Config.in
+++ b/package/wipe/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_WIPE
 	  Wipe is a little command for securely erasing files
 	  from magnetic media. It compiles under various unix platforms.
 
-	  http://lambda-diode.com/software/wipe
+	  http://wipe.sourceforge.net
diff --git a/package/wipe/wipe-dont-force-lfs.patch b/package/wipe/wipe-dont-force-lfs.patch
new file mode 100644
index 0000000..08916e2
--- /dev/null
+++ b/package/wipe/wipe-dont-force-lfs.patch
@@ -0,0 +1,16 @@
+LARGEFILE support shouldn't be forced into CFLAGS
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura wipe-2.3.1/configure.in wipe-2.3.1-lfs/configure.in
+--- wipe-2.3.1/configure.in	2009-06-15 22:55:11.000000000 -0300
++++ wipe-2.3.1-lfs/configure.in	2012-03-05 11:25:30.463221948 -0300
+@@ -91,7 +91,7 @@
+ test "$with_efence" = "yes" && temp2CFLAGS="$debugCFLAGS" && LIBS="-lefence"
+ 
+ DEBUG="$debugCFLAGS $fullCFLAGS"
+-fullCFLAGS="$temp2CFLAGS $fullCFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
++fullCFLAGS="$temp2CFLAGS $fullCFLAGS"
+ CFLAGS="$checkCFLAGS -D__USE_BSD -D_BSD_SOURCE -D__USE_POSIX -D_POSIX_SOURCE -D_POSIX_MAPPED_FILES"
+ 
+ dnl Checks for libraries.
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 54283f9..ec1b692 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -4,20 +4,10 @@
 #
 #############################################################
 
-WIPE_VERSION = 0.22
-WIPE_SITE = http://lambda-diode.com/resources/wipe
-WIPE_CFLAGS = $(TARGET_CFLAGS) -DHAVE_DEV_URANDOM -DHAVE_OSYNC -DHAVE_STRCASECMP -DHAVE_RANDOM -DSYNC_WAITS_FOR_SYNC -DFIND_DEVICE_SIZE_BY_BLKGETSIZE
-
-ifeq ($(BR2_LARGEFILE),y)
-WIPE_CFLAGS += -DSIXTYFOUR
-endif
-
-define WIPE_BUILD_CMDS
-	# Fix busted git version logic
-	$(SED) "s/which/!which/" $(@D)/Makefile
-	$(MAKE) -C $(@D) linux CC_LINUX="$(TARGET_CC)" \
-		CCO_LINUX="$(WIPE_CFLAGS)"
-endef
+WIPE_VERSION = 2.3.1
+WIPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/wipe
+WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
+WIPE_AUTORECONF = YES
 
 define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
@@ -29,8 +19,4 @@ define WIPE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man1/wipe.1
 endef
 
-define WIPE_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-$(eval $(call GENTARGETS))
+$(eval $(call AUTOTARGETS))
-- 
1.7.3.4
