From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:38:05 -0600
Subject: [Buildroot] [PATCH v5 16/20] busybox: add option to install
	individual binaries
In-Reply-To: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1387485489-4186-17-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

The individual binaries option of busybox allows for the applets
that would usually be symlinks to be built as individual applications
that link against a shared library.

This feature is needed for SELinux to allow the applications to run
under the correct SELinux context.

The patch being added allows the individual applications to be
installed and will be upstreamed to the busybox developers.

The initial work for this change was done by Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v4 -> v5:
  - Removed Thomas P's signed off line because the original patch
    ahs been completely reworked.
  - Cleaned up the installation of the individual binaries to be a
    upstreamable patch.
  - Added the suid bit to the applets that are declared as
    BB_SUID_REQUIRE and BB_SUID_MAYBE.
Changes v1 -> v4:
  - Did not exist.
---
 ...s-Add-installation-of-individual-binaries.patch |  103 ++++++++++++++++++++
 package/busybox/Config.in                          |    7 ++
 package/busybox/busybox.mk                         |   34 +++++++
 3 files changed, 144 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/1.21.1/0005-applets-Add-installation-of-individual-binaries.patch

diff --git a/package/busybox/1.21.1/0005-applets-Add-installation-of-individual-binaries.patch b/package/busybox/1.21.1/0005-applets-Add-installation-of-individual-binaries.patch
new file mode 100644
index 0000000..e7b9178
--- /dev/null
+++ b/package/busybox/1.21.1/0005-applets-Add-installation-of-individual-binaries.patch
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
++				cp -a $sharedlib_dir/$app $prefix/$i || exit 1
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
index 2d55aa6..8df941b 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -55,6 +55,13 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
+	bool "Individual binaries"
+	depends on !BR2_PREFER_STATIC_LIB
+
+comment "Busybox individual binaries depends on dynamic libraries"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f6f542e..98ee288 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -50,10 +50,31 @@ ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+define BUSYBOX_PERMISSIONS
+# Applets with BB_SUID_REQUIRE
+/usr/bin/crontab		 f 4755	0 0 - - - - -
+/bin/login			 f 4755	0 0 - - - - -
+/usr/bin/passwd			 f 4755	0 0 - - - - -
+/bin/su				 f 4755	0 0 - - - - -
+/usr/bin/vlock			 f 4755	0 0 - - - - -
+/usr/bin/wall			 f 4755	0 0 - - - - -
+# Applets with BB_SUID_MAYBE
+/bin/ping			 f 4755	0 0 - - - - -
+/bin/ping6			 f 4755	0 0 - - - - -
+/sbin/findfs			 f 4755	0 0 - - - - -
+/bin/mount			 f 4755	0 0 - - - - -
+/usr/bin/traceroute		 f 4755	0 0 - - - - -
+/usr/bin/traceroute6		 f 4755	0 0 - - - - -
+# Other files
+/usr/share/udhcpc/default.script f 755  0 0 - - - - -
+endef
+else
 define BUSYBOX_PERMISSIONS
 /bin/busybox			 f 4755	0 0 - - - - -
 /usr/share/udhcpc/default.script f 755  0 0 - - - - -
 endef
+endif
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
@@ -152,6 +173,17 @@ define BUSYBOX_SET_INIT
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
 		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
@@ -187,6 +219,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
+	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
 endef
@@ -205,6 +238,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
 
 $(eval $(generic-package))
-- 
1.7.1
