From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 11:23:14 +0100
Subject: [Buildroot] [git commit] system: clarify /dev management using
	devtmpfs + {mdev, eudev}
Message-ID: <20151004102319.4B71380572@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=571552c4687f73c12a449cea45b842090a14c4fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "Dynamic using mdev" and "Dynamic using eudev" /dev management
methods are using devtmpfs, just like "Dynamic using devtmpfs only",
on top of which they add either mdev or eudev. But their names might
suggest they use mdev only or eudev only.

Clarify their descriptions by adding "devtmpfs +" to make it
unambiguous.

[Thomas: rewrap the paragraphs in the manual. It makes the diff a lot
less readable, but we actually want the result to be wrapped.]

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt |   57 +++++++++++++++++++++++---------------------
 system/Config.in          |    4 +-
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index dd34eef..44f5d24 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -295,39 +295,42 @@ different solutions to handle the +/dev+ directory :
    responsibility to enable those two options (if you fail to do so,
    your Buildroot system will not boot).
 
- * The third solution is *Dynamic using mdev*. This method also relies
-   on the _devtmpfs_ virtual filesystem detailed above (so the
-   requirement to have +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+
-   enabled in the kernel configuration still apply), but adds the
-   +mdev+ userspace utility on top of it. +mdev+ is a program part of
-   BusyBox that the kernel will call every time a device is added or
-   removed. Thanks to the +/etc/mdev.conf+ configuration file, +mdev+
-   can be configured to for example, set specific permissions or
-   ownership on a device file, call a script or application whenever a
-   device appears or disappear, etc. Basically, it allows _userspace_
-   to react on device addition and removal events. +mdev+ can for
-   example be used to automatically load kernel modules when devices
-   appear on the system. +mdev+ is also important if you have devices
-   that require a firmware, as it will be responsible for pushing the
-   firmware contents to the kernel. +mdev+ is a lightweight
-   implementation (with fewer features) of +udev+. For more details
-   about +mdev+ and the syntax of its configuration file, see
+ * The third solution is *Dynamic using devtmpfs + mdev*. This method
+   also relies on the _devtmpfs_ virtual filesystem detailed above (so
+   the requirement to have +CONFIG_DEVTMPFS+ and
+   +CONFIG_DEVTMPFS_MOUNT+ enabled in the kernel configuration still
+   apply), but adds the +mdev+ userspace utility on top of it. +mdev+
+   is a program part of BusyBox that the kernel will call every time a
+   device is added or removed. Thanks to the +/etc/mdev.conf+
+   configuration file, +mdev+ can be configured to for example, set
+   specific permissions or ownership on a device file, call a script
+   or application whenever a device appears or disappear,
+   etc. Basically, it allows _userspace_ to react on device addition
+   and removal events. +mdev+ can for example be used to automatically
+   load kernel modules when devices appear on the system. +mdev+ is
+   also important if you have devices that require a firmware, as it
+   will be responsible for pushing the firmware contents to the
+   kernel. +mdev+ is a lightweight implementation (with fewer
+   features) of +udev+. For more details about +mdev+ and the syntax
+   of its configuration file, see
    http://git.busybox.net/busybox/tree/docs/mdev.txt.
 
- * The fourth solution is *Dynamic using eudev*. This method also
-   relies on the _devtmpfs_ virtual filesystem detailed above, but
-   adds the +eudev+ userspace daemon on top of it. +eudev+ is a daemon
-   that runs in the background, and gets called by the kernel when a
-   device gets added or removed from the system. It is a more
-   heavyweight solution than +mdev+, but provides higher flexibility.
-   +eudev+ is a standalone version of +udev+, the original userspace
-   daemon used in most desktop Linux distributions, which is now part
-   of Systemd. For more details, see http://en.wikipedia.org/wiki/Udev.
+ * The fourth solution is *Dynamic using devtmpfs + eudev*. This
+   method also relies on the _devtmpfs_ virtual filesystem detailed
+   above, but adds the +eudev+ userspace daemon on top of it. +eudev+
+   is a daemon that runs in the background, and gets called by the
+   kernel when a device gets added or removed from the system. It is a
+   more heavyweight solution than +mdev+, but provides higher
+   flexibility.  +eudev+ is a standalone version of +udev+, the
+   original userspace daemon used in most desktop Linux distributions,
+   which is now part of Systemd. For more details, see
+   http://en.wikipedia.org/wiki/Udev.
 
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
