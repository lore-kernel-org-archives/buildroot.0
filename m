From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:21 -0500
Subject: [Buildroot] [PATCH v5 08/24] busybox: applets as individual binaries
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-9-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

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
---
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
 ...s-Add-installation-of-individual-binaries.patch | 103 +++++++++++++++++++++
 package/busybox/Config.in                          |   9 ++
 package/busybox/busybox.mk                         |  41 ++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 package/busybox/0002-applets-Add-installation-of-individual-binaries.patch

diff --git a/package/busybox/0002-applets-Add-installation-of-individual-binaries.patch b/package/busybox/0002-applets-Add-installation-of-individual-binaries.patch
new file mode 100644
index 0000000..ae0e654
--- /dev/null
+++ b/package/busybox/0002-applets-Add-installation-of-individual-binaries.patch
@@ -0,0 +1,103 @@
+From 3451b55054a6fe2073a21301938802a27dec835d Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clshotwe@rockwellcollins.com>
+Date: Mon, 16 Dec 2013 14:45:33 -0600
+Subject: [PATCH 5/5] applets: Add installation of individual binaries
+
+Adding support to install individual binaries if the option is
+enabled. This also installs the shared libbusybox.so.* library.
+
+Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
+---
+ Makefile.custom    |    4 ++++
+ applets/install.sh |   26 ++++++++++++++++++++++++--
+ 2 files changed, 28 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.custom b/Makefile.custom
+index 6da79e6..e4dc4dc 100644
+--- a/Makefile.custom
++++ b/Makefile.custom
+@@ -23,6 +23,10 @@ ifeq ($(CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER),y)
+ INSTALL_OPTS:= --scriptwrapper
+ endif
+ endif
++ifeq ($(CONFIG_FEATURE_INDIVIDUAL),y)
++INSTALL_OPTS:= --binaries
++LIBBUSYBOX_SONAME:= 0_lib/libbusybox.so.$(BB_VER)
++endif
+ install: $(srctree)/applets/install.sh busybox busybox.links
+ 	$(Q)DO_INSTALL_LIBS="$(strip $(LIBBUSYBOX_SONAME) $(DO_INSTALL_LIBS))" \
+ 		$(SHELL) $< $(CONFIG_PREFIX) $(INSTALL_OPTS)
+diff --git a/applets/install.sh b/applets/install.sh
+index 95b4719..d01c98d 100755
+--- a/applets/install.sh
++++ b/applets/install.sh
+@@ -5,19 +5,26 @@ export LC_CTYPE=POSIX
+ 
+ prefix=$1
+ if [ -z "$prefix" ]; then
+-	echo "usage: applets/install.sh DESTINATION [--symlinks/--hardlinks/--scriptwrapper]"
++	echo "usage: applets/install.sh DESTINATION [--symlinks/--hardlinks/--binaries/--scriptwrapper]"
+ 	exit 1
+ fi
+ 
++# Source the configuration
++. ./.config
++
+ h=`sort busybox.links | uniq`
+ 
++sharedlib_dir="0_lib"
++
+ linkopts=""
+ scriptwrapper="n"
++binaries="n"
+ cleanup="0"
+ noclobber="0"
+ case "$2" in
+ 	--hardlinks)     linkopts="-f";;
+ 	--symlinks)      linkopts="-fs";;
++	--binaries)      binaries="y";;
+ 	--scriptwrapper) scriptwrapper="y";swrapall="y";;
+ 	--sw-sh-hard)    scriptwrapper="y";linkopts="-f";;
+ 	--sw-sh-sym)     scriptwrapper="y";linkopts="-fs";;
+@@ -40,8 +47,9 @@ if [ -n "$DO_INSTALL_LIBS" ] && [ "$DO_INSTALL_LIBS" != "n" ]; then
+ 	for i in $DO_INSTALL_LIBS; do
+ 		rm -f "$prefix/$libdir/$i" || exit 1
+ 		if [ -f "$i" ]; then
++			echo "   Installing $i to the target@$prefix/$libdir/"
+ 			cp -pPR "$i" "$prefix/$libdir/" || exit 1
+-			chmod 0644 "$prefix/$libdir/$i" || exit 1
++			chmod 0644 "$prefix/$libdir/`basename $i`" || exit 1
+ 		fi
+ 	done
+ fi
+@@ -68,6 +76,7 @@ install -m 755 busybox "$prefix/bin/busybox" || exit 1
+ 
+ for i in $h; do
+ 	appdir=`dirname "$i"`
++	app=`basename "$i"`
+ 	mkdir -p "$prefix/$appdir" || exit 1
+ 	if [ "$scriptwrapper" = "y" ]; then
+ 		if [ "$swrapall" != "y" ] && [ "$i" = "/bin/sh" ]; then
+@@ -78,6 +87,19 @@ for i in $h; do
+ 			chmod +x "$prefix/$i"
+ 		fi
+ 		echo "	$prefix/$i"
++	elif [ "$binaries" = "y" ]; then
++		# Copy the binary over rather
++		if [ -e $sharedlib_dir/$app ]; then
++			if [ "$noclobber" = "0" ] || [ ! -e "$prefix/$i" ]; then
++				echo "   Copying $sharedlib_dir/$app to $prefix/$i"
++				cp -pPR $sharedlib_dir/$app $prefix/$i || exit 1
++			else
++				echo "  $prefix/$i already exists"
++			fi
++		else
++			echo "Error: Could not find $sharedlib_dir/$app"
++			exit 1
++		fi
+ 	else
+ 		if [ "$2" = "--hardlinks" ]; then
+ 			bb_path="$prefix/bin/busybox"
+-- 
+1.7.1
+
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index b4f949f..275e317 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -26,6 +26,15 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
+	bool "Individual binaries"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_bfin # libbusybox.so link issue
+
+comment "Busybox individual binaries depends on dynamic libraries"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_bfin
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1ce508a..dbee100 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -49,10 +49,38 @@ BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
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
 	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
 endef
+endif
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
@@ -132,6 +160,17 @@ define BUSYBOX_SET_INIT
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
@@ -167,6 +206,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
@@ -190,6 +230,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
 
 $(eval $(kconfig-package))
-- 
1.9.1
