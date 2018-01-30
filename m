From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 30 Jan 2018 02:07:20 -0200
Subject: [Buildroot] [PATCH 3/3] eudev: generate hwdb.bin at system startup
In-Reply-To: <20180130040720.20172-1-casantos@datacom.ind.br>
References: <20180130040720.20172-1-casantos@datacom.ind.br>
Message-ID: <20180130040720.20172-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Programs that use libudev (e.g. lsusb, from usbutils) need the hwdb.bin
file to work properly.

If BR2_PACKAGE_EUDEV_ENABLE_HWDB is selected then the eudev installation
populates /etc/udev/hwdb.d/ but does not genarete /etc/udev/hwdb.bin. It
must be created running "udevadm hwdb --update" on the target device but
this does not work on with read-only /etc, so we need these changes:

- Add the BR2_PACKAGE_EUDEV_HWDB_BIN_PATH config, allowing the user to
  set the location of hwdb.bin.
- Patch the configuration script, allowing to set the hwdb.bin path by
  means of an environment variable (udevhwdbbinpath).
- Pass the value set in BR2_PACKAGE_EUDEV_HWDB_BIN_PATH to the configure
  script by means of the udevhwdbbinpath variable.
- Make the S10udev init script run "udevadm hwdb --update" to recreate
  hwdb.bin or print an error message if the operation fails (e.g. no
  write permission on the filesystem).

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/eudev/Config.in |  9 +++++++++
 package/eudev/S10udev   |  8 +++++++-
 package/eudev/eudev.mk  | 13 ++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..a589a14af3 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -32,6 +32,15 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	help
 	  Enables hardware database installation to /etc/udev/hwdb.d
 
+config BR2_PACKAGE_EUDEV_HWDB_BIN_PATH
+	string "hwdb.bin path"
+	default "/etc/udev/hwdb.bin"
+	help
+	  Location of the hwdb.bin file, which is re-generated at system
+	  startup. The default is /etc/udev/hwdb.bin but you may want to
+	  move it elsewhere (e.g. /var/run/udev/hwdb.bin) if /etc is in
+	  a read-only filesystem.
+
 endif
 
 comment "eudev needs eudev /dev management"
diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 640fec625b..026ab6ae49 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -25,14 +25,20 @@ UDEV_CONFIG=/etc/udev/udev.conf
 test -r $UDEV_CONFIG || exit 6
 . $UDEV_CONFIG
 
+UDEV_HWDB_BIN=%%UDEV_HWDB_BIN%%
+
 case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
         printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || { echo "FAIL"; exit 1; }
+        echo "done"
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
-        udevadm settle --timeout=30 || echo "udevadm settle failed"
+        udevadm settle --timeout=30 || { echo "udevadm settle failed" && exit 1; }
+        echo "done"
+        printf "Compiling hardware database information $UDEV_HWDB_BIN: "
+        udevadm hwdb --update || { echo "FAIL" && exit 1; }
         echo "done"
         ;;
     stop)
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index d08b9bb0c9..25745008d2 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -47,8 +47,19 @@ else
 EUDEV_CONF_OPTS += --disable-selinux
 endif
 
+define EUDEV_POST_PATCH
+	$(SED) 's,$${udevconfdir}/hwdb.bin,$${udevhwdbbinpath:-$${udevconfdir}/hwdb.bin},' \
+		$(@D)/configure
+endef
+EUDEV_POST_PATCH_HOOKS += EUDEV_POST_PATCH
+
+EUDEV_CONF_ENV += udevhwdbbinpath=$(BR2_PACKAGE_EUDEV_HWDB_BIN_PATH)
+
 define EUDEV_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -D -m 0755 package/eudev/S10udev \
+		$(TARGET_DIR)/etc/init.d/S10udev
+	$(SED) 's,%%UDEV_HWDB_BIN%%,$(BR2_PACKAGE_EUDEV_HWDB_BIN_PATH),' \
+		$(TARGET_DIR)/etc/init.d/S10udev
 endef
 
 # Required by default rules for input devices
-- 
2.14.3
