From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 25 Oct 2016 14:26:07 -0500
Subject: [Buildroot] [PATCH v13 5/8] busybox: applets as individual binaries
In-Reply-To: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <1477423570-15694-5-git-send-email-bryce.ferguson@rockwellcollins.com>
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
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

---
Changes v12 -> v13:
  - Fixed indentation issue in makedevs.c line:590

Changes v11 -> v12:
  - No changes

Changes v10 -> v11:
  - Removed BUSYBOX_MAKEDEV_PERMISSIONS logic and added all 12 applets to
    BUSYBOX_PERMISSIONS variable.
  - Changed makedevs.c file to ignore optional files with type=F ( files which does not exist).

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
 package/busybox/Config.in   |  9 +++++++++
 package/busybox/busybox.mk  | 40 ++++++++++++++++++++++++++++++++++++++++
 package/makedevs/makedevs.c |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 7ef3f0e..d4c85b0 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -54,6 +54,15 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
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
index fc23a90..7d14209 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -54,9 +54,36 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
+ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
+define BUSYBOX_PERMISSIONS
+	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
+# Set permissions on all applets with BB_SUID_REQUIRE and BB_SUID_MAYBE.
+# 12 Applets are pulled from applets.h using grep command :
+#  grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" \
+#  $(@D)/include/applets.h 
+#  o/p:  
+#   wall,ping,ping6,crontab,findfs,login,mount,passwd,su,traceroute 
+#   traceroute6 and vlock.
+# These applets are added to the device table and the makedev file
+# ignores the files with type 'F' ( optional files).
+	/usr/bin/wall 			 F 4755 0  0 - - - - -
+	/bin/ping 			 f 4755 0  0 - - - - -
+	/bin/ping6 			 F 4755 0  0 - - - - -
+	/usr/bin/crontab 		 f 4755 0  0 - - - - -
+	/sbin/findfs 			 F 4755 0  0 - - - - -
+	/bin/login 			 F 4755 0  0 - - - - -
+	/bin/mount 			 f 4755 0  0 - - - - -
+	/usr/bin/passwd 		 F 4755 0  0 - - - - -
+	/bin/su 			 F 4755 0  0 - - - - -
+	/usr/bin/traceroute 		 f 4755 0  0 - - - - -
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
@@ -164,6 +191,17 @@ define BUSYBOX_SET_SELINUX
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
@@ -221,6 +259,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
+	$(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_MUSL_TWEAKS)
 endef
 
@@ -244,6 +283,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
 
 # Checks to give errors that the user can understand
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index cacb144..0909e2d 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -587,6 +587,8 @@ int main(int argc, char **argv)
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
+		} else if (type == 'F') {
+           continue; /*Ignore optional files*/
 		} else if (type == 'r') {
 			recursive_uid = uid;
 			recursive_gid = gid;
-- 
1.9.1
