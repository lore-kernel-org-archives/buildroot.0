From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Fri, 6 Nov 2015 20:25:56 +0000
Subject: [Buildroot] [PATCH] system: Fix for NFS booting with interface
	config via DHCP
Message-ID: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configuring the network interface with DHCP via
/etc/network/interfaces generally does work when NFS booting.  The
DHCP configuration will initially bring the interface down and system
then hangs at that point as the root filesystem is no longer
accessable.  See bug 4709.

The system config option adds a script to if-pre-up.d that will check
for a NFS root filesystem and if the interface to be configured is
used for access to the NFS server.  If this is the case, then it
returns a failure code so that ifup will not configure the interface.
This works for DHCP and another config methods (static, bootp, etc.).
This system does detect if the interface to be configured isn't the
one used for NFS and doesn't skip it when that is the case.

NFS filesystems that aren't the root fs aren't considered.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
---

Example when the interface is used for NFS:
# ifup eth0
Skipping eth0, used for NFS from 192.168.1.123
run-parts: /etc/network/if-pre-up.d/nfs_check: exit status 1

Example when the interface isn't used for NFS:
# ifup eth1
[brings interface up]

An alternative to putting the script in if-pre-up.d would be to add
pre-up lines to the interfaces file.  This would allow running the
script just for certain interfaces.  It also removes the "run-parts"
message to do it this way.

 package/skeleton/nfs_check   |  7 +++++++
 package/skeleton/skeleton.mk |  7 +++++++
 system/Config.in             | 19 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100755 package/skeleton/nfs_check

diff --git a/package/skeleton/nfs_check b/package/skeleton/nfs_check
new file mode 100755
index 0000000..1914404
--- /dev/null
+++ b/package/skeleton/nfs_check
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+nfsip=`awk '$3=="nfs" && $2=="/"{ sub(/:.*/,"",$1); print $1; }' /proc/mounts`
+if [ -n "$nfsip" ] && ip route get to "$nfsip" | grep -q "dev $IFACE"; then
+  echo Skipping $IFACE, used for NFS from $nfsip
+  exit 1
+fi
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index d1b797d..059a0b9 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -33,6 +33,12 @@ define SKELETON_USR_SYMLINKS_OR_DIRS
 endef
 endif
 
+ifeq ($(BR2_SYSTEM_IFUP_NFS_ROOT),y)
+define SKELETON_INSTALL_NFS_CHECK
+	$(INSTALL) -m 0755 -D package/skeleton/nfs_check $(TARGET_DIR)/etc/network/if-pre-up.d/nfs_check
+endef
+endif
+
 define SKELETON_INSTALL_TARGET_CMDS
 	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
@@ -98,6 +104,7 @@ define SET_NETWORK
 	mkdir -p $(TARGET_DIR)/etc/network/
 	$(SET_NETWORK_LOCALHOST)
 	$(SET_NETWORK_DHCP)
+	$(SKELETON_INSTALL_NFS_CHECK)
 endef
 
 TARGET_FINALIZE_HOOKS += SET_NETWORK
diff --git a/system/Config.in b/system/Config.in
index 4d07010..cd0bbf7 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -358,6 +358,25 @@ config BR2_SYSTEM_DHCP
 	  For more complicated network setups use an overlay to overwrite
 	  /etc/network/interfaces or add a networkd configuration file.
 
+config BR2_SYSTEM_IFUP_NFS_ROOT
+	bool "Have network interface configuration cope with NFS root boot"
+	default y
+	depends on BR2_SYSTEM_DHCP != ""
+	help
+	  This allows NFS booting to work while also enabling the
+	  option to configure the network interface via DHCP.
+	  Otherwise, a NFS booted system will likely hang during DHCP
+	  configuration.
+
+	  Attempting to configure the network interface used for NFS
+	  will initially bring that network down.  Since the root
+	  filesystem is accessed over this network, the system hangs.
+
+	  This option will add a script to the ifup system that will
+	  attempt to detect if a NFS root mount uses the interface to
+	  be configured, and if so does not configure it.  This should
+	  allow the same build to be disk/flash booted or NFS booted.
+
 comment "automatic network configuration via DHCP is not compatible with networkd"
 	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
 
-- 
1.8.3.1
