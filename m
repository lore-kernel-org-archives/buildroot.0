From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 21:39:05 +0100
Subject: [Buildroot] [git commit] system: TARGET_GENERIC_GETTY: allow it to
	be disabled
Message-ID: <20130104211238.652029A60C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bb2e62a4b90e13d0ae21472491bdea72cd982d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some systems, you don't want to run any getty, so allow the option
to be disabled when the empty string is used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |    1 +
 system/system.mk |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index f1c260a..5b66ac0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -145,6 +145,7 @@ config BR2_TARGET_GENERIC_GETTY_PORT
 	default "ttyS0"
 	help
 	  Specify a port to run a getty (login prompt) on.
+	  Set to the empty string to not run a getty.
 
 choice
 	prompt "Baudrate to use"
diff --git a/system/system.mk b/system/system.mk
index 7536ce6..3c4d06e 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -49,12 +49,15 @@ endif
 
 TARGETS += target-root-passwd
 
+ifneq ($(TARGET_GENERIC_GETTY),)
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
 else
 TARGETS += target-generic-getty-busybox
 endif
+endif
+
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 TARGETS += target-generic-do-remount-rw
 else
