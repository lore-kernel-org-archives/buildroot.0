From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] hal: fix udev dependency
Message-ID: <20091216153104.5C94F77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c09e51037a52984d7faa3ad268dc7de34f7298b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Selecting symbols with dependencies doesn't work unless you select
  the dependencies as well
- udev-volume-id target gone, use the generic udev one instead

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hal/Config.in |    1 +
 package/hal/hal.mk    |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/hal/Config.in b/package/hal/Config.in
index 56ed428..623825c 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HAL
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_VOLUME_ID
 	help
 	  The Hardware Abstraction Layer (HAL) suite.
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index fb152d6..a72bc63 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -87,7 +87,7 @@ $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 	done
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libhal*
 
-hal: host-pkg-config dbus-glib hwdata udev-volume_id $(TARGET_DIR)/$(HAL_TARGET_BINARY)
+hal: host-pkg-config dbus-glib hwdata udev $(TARGET_DIR)/$(HAL_TARGET_BINARY)
 
 hal-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf
-- 
1.6.3.3
