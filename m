From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:01:30 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other packages
In-Reply-To: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One of the requirement to implement per-package SDK is that a package
should not overwrite files installed by another package. The busybox
package creates such a situation with numerous other packages, because
it provides applets that are also provided as full-featured programs
in other packages.

In order to avoid having other packages overwrite the Busybox applet
symbolic link with their own variant, this commit improves the logic
in busybox.mk to disable the applets when the corresponding
full-featured program will be installed by a different package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Note: the list is not complete, this is just a RFC version to find out
if that's the direction we want to take.
---
 package/busybox/busybox.mk | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 8b720b30b8..e51dbc4887 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -250,6 +250,63 @@ endef
 BUSYBOX_DEPENDENCIES += linux-pam
 endif
 
+# Avoid collision with other packages
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_BC) += dc
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_BINUTILS) += ar strings
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_CPIO) += cpio
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_DCRON) += crond crontab
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_DEBIANUTILS) += run-parts which
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_DIFFUTILS) += cmp diff
+# test1 removes the [ applet
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_COREUTILS) += \
+	chmod tail printf uname touch echo od realpath sha512sum rmdir readlink \
+	sync mknod du true nlink ln ls fold who logname chown dirname chgrp \
+	basename uptime sha256sum uniq env rm expr wc pwd tee cat test chroot \
+	nohup head sha1sum df dd nl seq truncate id cp mkfifo tty whoami factor \
+	tr mkdir paste cksum sort stty shred md5sum hostid nproc install date \
+	mv sleep yes cut false unlink test1
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_FBSET) += fbset
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_KMOD_TOOLS) += lsmod rmmod modprobe insmod
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += blkid
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += dmesg
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += fdisk
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += flock
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += fstrim
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += hexdump
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += mkswap
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += readprofile
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += renice
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += setsid
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += swapoff
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_BINARIES) += swapon
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_EJECT) += eject
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_FALLOCATE) += fallocate
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_FDFORMAT) += fdformat
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_FSCK) += fsck
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_HWCLOCK) += hwclock
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_IPCRM) += ipcrm
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_IPCS) += ipcs
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_KILL) += kill
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_LAST) += last
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_LOGGER) += logger
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_LOGIN) += login
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_LOSETUP) += losetup
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_MESG) += mesg
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_MORE) += more
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_MOUNT) += mount umount
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT) += mountpoint
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT) += pivot_root
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS) += chrt
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_SU) += su
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_SULOGIN) += sulogin
+BUSYBOX_DROP_APPLET_$(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT) += switch_root
+
+define BUSYBOX_DROP_CONFLICTING_APPLETS
+	$(foreach applet,$(BUSYBOX_DROP_APPLET_y),\
+		$(call KCONFIG_DISABLE_OPT,CONFIG_$(call UPPERCASE,$(applet)),$(BUSYBOX_BUILD_CONFIG))
+	)
+endef
+
 # Telnet support
 define BUSYBOX_INSTALL_TELNET_SCRIPT
 	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
@@ -276,6 +333,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_MUSL_TWEAKS)
+	$(BUSYBOX_DROP_CONFLICTING_APPLETS)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
-- 
2.14.3
