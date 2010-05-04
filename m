From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 May 2010 23:11:20 +0200
Subject: [Buildroot] [git commit master] hal: cleanup package
Message-ID: <20100504211440.A36C88D361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=79db1ff5ac3c5f32ba473258bef1f8328564ca77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1525

Kconfig selects are not recursive, so ensure we select the dependencies
of our dependencies as well.

Cleanup target installation:
- Remove tasks handled by the generic post-build cleanup
- Hal doesn't install etc/rc.d, so don't try to delete it

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    5 +++--
 package/hal/Config.in |    6 ++++++
 package/hal/hal.mk    |    8 --------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2d2b9e2..19cb486 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,12 +2,13 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: mplayer, xdriver_xf86-video-openchrome,
-	usb_modeswitch
+	Updated/fixed packages: hal, mplayer,
+	xdriver_xf86-video-openchrome, usb_modeswitch
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#985: Bump usb_modeswitch package to 1.1.0
+	#1525: Package hal deletes a whole <target>/etc/rc.d directory
 
 2010.05-rc1, Released May 3rd, 2010:
 
diff --git a/package/hal/Config.in b/package/hal/Config.in
index 623825c..250e005 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_HAL
 	bool "hal"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_EXPAT
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_UDEV
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index 754ed85..0c362b0 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -63,19 +63,12 @@ $(HAL_DIR)/hald/hald: $(HAL_DIR)/.configured
 
 $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 	$(MAKE) STAGING_DIR="$(STAGING_DIR)" DESTDIR="$(TARGET_DIR)" -C $(HAL_DIR) install
-	rm -rf $(TARGET_DIR)/usr/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rm -rf $(TARGET_DIR)/usr/share/hal/device-manager
-	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig
-	# remove _everything_ in $(TARGET_DIR)/usr/include?
-	# rm -rf $(TARGET_DIR)/usr/include
 	rm -rf $(TARGET_DIR)/usr/lib/libhal*.so
-	rm -rf $(TARGET_DIR)/usr/lib/libhal*.la
 	rm -rf $(TARGET_DIR)/usr/lib/hal
 	rm -rf $(TARGET_DIR)/etc/PolicyKit
 	$(INSTALL) -m 0755 -D package/hal/S98haldaemon $(TARGET_DIR)/etc/init.d
-	rm -rf $(TARGET_DIR)/etc/rc.d
 	for file in hald-addon-acpi* hald-addon-cpufreq \
 		hald-addon-keyboard hald-addon-pmu \
 		hald-probe-pc-floppy hald-probe-printer \
@@ -86,7 +79,6 @@ $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 	do \
 		rm -f $(TARGET_DIR)/usr/libexec/$$file; \
 	done
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libhal*
 
 hal: host-pkg-config dbus-glib hwdata udev $(TARGET_DIR)/$(HAL_TARGET_BINARY)
 
-- 
1.6.3.3
