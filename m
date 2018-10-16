From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 16 Oct 2018 14:01:57 -0300
Subject: [Buildroot] [PATCH v3] eudev: generate hwdb.bin at system startup
Message-ID: <20181016170157.14348-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

Programs that use libudev (e.g. lsusb, from usbutils) need the hwdb.bin
file to work properly.

If BR2_PACKAGE_EUDEV_ENABLE_HWDB is selected then the eudev installation
populates /etc/udev/hwdb.d/ but does not genarete /etc/udev/hwdb.bin. It
must be created running "udevadm hwdb --update" on the target device but
this does not work with a read-only /etc, so we need these changes:

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
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v1->v2
- Incorporate fixes and improvements provided by Matt Weber
Changes v2->v3
- Make HWDB_BIN_PATH depend on ENABLE_HWDB, as pointed by Matt Weber.

Note: there was a discussion via email and on IRC, with suggetsions to
prebuild hwdb.bin at build time and to add a /etc/defaults/udev cfg file
instead patching S10udev (like in the recent S01logging suggested
updates). I like both suggestions but I'd prefer to implement them in
subsequent patches rather, since they woud require additional changes
(e.g. adding eudev as a host tool).
---
 package/eudev/Config.in | 10 ++++++++++
 package/eudev/S10udev   |  8 +++++++-
 package/eudev/eudev.mk  | 11 ++++++++++-
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..0ee5390dfb 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -32,6 +32,16 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	help
 	  Enables hardware database installation to /etc/udev/hwdb.d
 
+config BR2_PACKAGE_EUDEV_HWDB_BIN_PATH
+	string "hwdb.bin path"
+	depends on BR2_PACKAGE_EUDEV_ENABLE_HWDB
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
index 4e799d6507..08aca82dd9 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -21,14 +21,20 @@ UDEV_CONFIG=/etc/udev/udev.conf
 test -r $UDEV_CONFIG || exit 6
 . $UDEV_CONFIG
 
+UDEV_HWDB_BIN=%%UDEV_HWDB_BIN%%
+
 case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
         [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         /sbin/udevd -d || { echo "FAIL"; exit 1; }
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
index 11dc93762b..e4fc7c884c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -33,6 +33,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
 EUDEV_CONF_OPTS += --enable-hwdb
+define EUDEV_POST_PATCH
+	$(SED) 's,$${udevconfdir}/hwdb.bin,$${udevhwdbbinpath:-$${udevconfdir}/hwdb.bin},' \
+		$(@D)/configure
+endef
+EUDEV_POST_PATCH_HOOKS += EUDEV_POST_PATCH
+EUDEV_CONF_ENV += udevhwdbbinpath=$(BR2_PACKAGE_EUDEV_HWDB_BIN_PATH)
 else
 EUDEV_CONF_OPTS += --disable-hwdb
 endif
@@ -45,7 +51,10 @@ EUDEV_CONF_OPTS += --disable-selinux
 endif
 
 define EUDEV_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -D -m 0755 package/eudev/S10udev \
+		$(TARGET_DIR)/etc/init.d/S10udev
+	$(SED) 's,%%UDEV_HWDB_BIN%%,$(BR2_PACKAGE_EUDEV_HWDB_BIN_PATH),' \
+		$(TARGET_DIR)/etc/init.d/S10udev
 endef
 
 # Required by default rules for input devices
-- 
2.14.4
