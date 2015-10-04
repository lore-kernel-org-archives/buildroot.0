From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  4 Oct 2015 11:43:35 +0200
Subject: [Buildroot] [PATCH] system: clarify /dev management using devtmpfs
	+ {mdev, eudev}
Message-ID: <1443951815-7669-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "Dynamic using mdev" and "Dynamic using eudev" /dev management
methods are using devtmpfs, just like "Dynamic using devtmpfs only",
on top of which they add either mdev or eudev. But their names might
suggest they use mdev only or eudev only.

Clarify their descriptions by adding "devtmpfs +" to make it
unambiguous.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/configure.txt | 7 ++++---
 system/Config.in          | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index dd34eef..997be2b 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -295,7 +295,7 @@ different solutions to handle the +/dev+ directory :
    responsibility to enable those two options (if you fail to do so,
    your Buildroot system will not boot).
 
- * The third solution is *Dynamic using mdev*. This method also relies
+ * The third solution is *Dynamic using devtmpfs + mdev*. This method also relies
    on the _devtmpfs_ virtual filesystem detailed above (so the
    requirement to have +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+
    enabled in the kernel configuration still apply), but adds the
@@ -314,7 +314,7 @@ different solutions to handle the +/dev+ directory :
    about +mdev+ and the syntax of its configuration file, see
    http://git.busybox.net/busybox/tree/docs/mdev.txt.
 
- * The fourth solution is *Dynamic using eudev*. This method also
+ * The fourth solution is *Dynamic using devtmpfs + eudev*. This method also
    relies on the _devtmpfs_ virtual filesystem detailed above, but
    adds the +eudev+ userspace daemon on top of it. +eudev+ is a daemon
    that runs in the background, and gets called by the kernel when a
@@ -327,7 +327,8 @@ different solutions to handle the +/dev+ directory :
 The Buildroot developers recommendation is to start with the *Dynamic
 using devtmpfs only* solution, until you have the need for userspace
 to be notified when devices are added/removed, or if firmwares are
-needed, in which case *Dynamic using mdev* is usually a good solution.
+needed, in which case *Dynamic using devtmpfs + mdev* is usually a
+good solution.
 
 Note that if +systemd+ is chosen as init system, /dev management will
 be performed by the +udev+ program provided by +systemd+.
diff --git a/system/Config.in b/system/Config.in
index 45170d8..6afe896 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -110,11 +110,11 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
 	bool "Dynamic using devtmpfs only"
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
-	bool "Dynamic using mdev"
+	bool "Dynamic using devtmpfs + mdev"
 	select BR2_PACKAGE_BUSYBOX
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-	bool "Dynamic using eudev"
+	bool "Dynamic using devtmpfs + eudev"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
-- 
1.9.1
