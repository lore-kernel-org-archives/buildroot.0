From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:48:20 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 05/11] busybox: applets as
	individual binaries
In-Reply-To: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <1455603506-26138-5-git-send-email-niranjan.reddy@rockwellcollins.com>
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
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Niranjan <niranjan.reddy@rockwellcollins.com>

---
Changes v9 -> v10:
  - Removed 0002-applets-Add-installation-of-individual-binaries.patch as it was upstreamed.

Changes v8 -> v9:
  - No changes

Changes v7 -> v8:
  - Changed individual binaries comment to be !BR2_bfin (Suggested by
    Samuel)

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - Renamed to follow latest patch naming convention (Matt W.)
  - Updated to use BR2_STATIC_LIBS instead of old PREFERRED (Matt W.)
  - Added depends to make sure bfin can't build shared lib
    busybox lib for individual binary use.  Looks like shared
    lib creation doesn't error out but the objects don't get
    placed into the elf.  Then the trylink fails on linking
    the first individual applet. (Matt W.)
  - Made suid permissions setting dynamic for applets actually being
    installed (Clayton S.)

Changes v1 -> v4:
  - Did not exist
---
 package/busybox/Config.in  |  9 +++++++++
 package/busybox/busybox.mk | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index a3a328d..920ee0c 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -51,6 +51,15 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	  crond, then individual binaries have to be enabled for the
 	  SELinux type transitions to occur properly.
 
+config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
+	bool "Individual binaries"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_bfin # libbusybox.so link issue
+
+comment "Busybox individual binaries depends on dynamic libraries"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_bfin
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7f6dbd6..0c58b9a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -50,9 +50,37 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+define BUSYBOX_PERMISSIONS
+	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
+endef
+
+# Set permissions on all applets with BB_SUID_REQUIRE and BB_SUID_MAYBE. The
+# permissions are pulled from the applets.h file that is generated during
+# the build and used to determine all of the possible applets. The permissions
+# file is generated and added to the list of device tables used by makedevs to
+# set file permissions.
+define BUSYBOX_MAKEDEV_PERMISSIONS
+	if [ -f $(@D)/.buildroot_permissions ]; then \
+		rm $(@D)/.buildroot_permissions; \
+	fi; \
+	touch $(@D)/.buildroot_permissions; \
+	for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" $(@D)/include/applets.h \
+			| sed -e 's/,.*//' -e 's/.*(//'`; \
+	do \
+		temp=`grep -w $${app} $(@D)/busybox.links`; \
+		if [ -n "$${temp}" ]; then \
+			echo "$${temp} f 4755 0  0 - - - - -" >> $(@D)/.buildroot_permissions; \
+		fi; \
+	done
+endef
+BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_MAKEDEV_PERMISSIONS
+BR2_ROOTFS_DEVICE_TABLE += $(BUSYBOX_DIR)/.buildroot_permissions
+else
 define BUSYBOX_PERMISSIONS
 	/bin/busybox                     f 4755 0  0 - - - - -
 endef
+endif
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
@@ -170,6 +198,17 @@ define BUSYBOX_SET_SELINUX
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+define BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES
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
@@ -229,6 +268,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
+	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_MUSL_TWEAKS)
 endef
 
@@ -252,6 +292,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
 
 # Checks to give errors that the user can understand
-- 
2.5.0
