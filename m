From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 3 Jul 2017 23:00:49 +0200
Subject: [Buildroot] [PATCH v14 2/4] busybox: applets as individual binaries
In-Reply-To: <20170703210051.3457-1-arnout@mind.be>
References: <20170703210051.3457-1-arnout@mind.be>
Message-ID: <20170703210051.3457-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

The individual binaries option of busybox allows for the applets
that would usually be symlinks to be built as individual applications
that link against a shared library.

This feature is needed for SELinux to allow the applications to run
under the correct SELinux context.

The patch being added allows the individual applications to be
installed and will be upstreamed to the busybox developers.

The initial work for this change was done by Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
[Thomas:
 - add help text in Config.in option.
 - rename BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES to
   BUSYBOX_SET_INDIVIDUAL_BINARIES to be consistent with other
   variables.
 - call BUSYBOX_INSTALL_INDIVIDUAL_BINARIES in
   BUSYBOX_INSTALL_TARGET_CMDS, not in BUSYBOX_INSTALL_INIT_SYSV.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Arnout:
 - revert to the "optional file" approach in makedevs;
 - reword Config.in comment text to match our usual pattern;
 - abbreviate comment about how suid applets are found a little;
 - all applets are optional (each one may have been unselected from the
   busybox config).]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v14:
 - revert to the "optional file" approach in makedevs;
 - reword Config.in comment text to match our usual pattern;
 - abbreviate comment about how suid applets are found a little;
 - all applets are optional (each one may have been unselected from the
   busybox config).
---
 package/busybox/Config.in  | 16 ++++++++++++++++
 package/busybox/busybox.mk | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 116a72e945..ca8fe68eea 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -56,6 +56,22 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	  crond, then individual binaries have to be enabled for the
 	  SELinux type transitions to occur properly.
 
+config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
+	bool "Individual binaries"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_bfin # libbusybox.so link issue
+	help
+	  By default (i.e with this option disabled), Busybox is
+	  installed as a single binary in /bin/busybox and all applets
+	  are a symbolic link to /bin/busybox.
+
+	  With this option enabled, each applet is a separate binary,
+	  which is needed for proper operation with SELinux.
+
+comment "Busybox individual binaries need a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_bfin
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a536ed2953..943ac2d514 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -60,9 +60,33 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+define BUSYBOX_PERMISSIONS
+	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
+# Set permissions on all applets with BB_SUID_REQUIRE and BB_SUID_MAYBE.
+# 12 Applets are pulled from applets.h using grep command :
+#  grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" \
+#  $(@D)/include/applets.h 
+# These applets are added to the device table and the makedev file
+# ignores the files with type 'F' ( optional files).
+	/usr/bin/wall 			 F 4755 0  0 - - - - -
+	/bin/ping 			 F 4755 0  0 - - - - -
+	/bin/ping6 			 F 4755 0  0 - - - - -
+	/usr/bin/crontab 		 F 4755 0  0 - - - - -
+	/sbin/findfs 			 F 4755 0  0 - - - - -
+	/bin/login 			 F 4755 0  0 - - - - -
+	/bin/mount 			 F 4755 0  0 - - - - -
+	/usr/bin/passwd 		 F 4755 0  0 - - - - -
+	/bin/su 			 F 4755 0  0 - - - - -
+	/usr/bin/traceroute 		 F 4755 0  0 - - - - -
+	/usr/bin/traceroute6 		 F 4755 0  0 - - - - -
+	/usr/bin/vlock 			 F 4755 0  0 - - - - -
+endef
+else
 define BUSYBOX_PERMISSIONS
 	/bin/busybox                     f 4755 0  0 - - - - -
 endef
+endif
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
@@ -171,6 +195,17 @@ define BUSYBOX_SET_SELINUX
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+define BUSYBOX_SET_INDIVIDUAL_BINARIES
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_INDIVIDUAL,$(BUSYBOX_BUILD_CONFIG))
+endef
+
+define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
+	rm -f $(TARGET_DIR)/bin/busybox
+endef
+endif
+
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
@@ -228,6 +263,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
+	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_MUSL_TWEAKS)
 endef
 
@@ -251,6 +287,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
 
 # Checks to give errors that the user can understand
-- 
2.13.2
