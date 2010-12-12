From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] udev: ensure startup script is
	well installed
Message-ID: <20101212234309.B60898E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd182cae65c0075c16910dc6b990fc3f8abbd776
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case /etc/init.d does not exists.

[Peter: use install -D]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    4 ++--
 package/udev/udev.mk |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 11c2bec..d5c40c5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,8 +4,8 @@
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
 	Updated/fixed packages: busybox, dbus, cloop, gdk-pixbuf,
-	hostapd, i2c-tools, libconfig, m4, openssh, openssl, qt, usbutils, xz,
-	zlib
+	hostapd, i2c-tools, libconfig, m4, openssh, openssl, qt,
+	udev, usbutils, xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 90dbdce..4b61ce4 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -88,7 +88,8 @@ define UDEV_INSTALL_TARGET_CMDS
 		LDFLAGS="-warn-common" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D) install
-	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 -D package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/udev/rules.d
 	$(INSTALL) -m 0644 $(@D)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
 	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
 	install -m 0755 -D $(@D)/udevstart $(TARGET_DIR)/sbin/udevstart
-- 
1.7.2.2
