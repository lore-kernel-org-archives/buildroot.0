From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Mon, 9 Nov 2015 22:16:49 +0000
Subject: [Buildroot] [PATCH v2] system: Fix for NFS booting with interface
 config via DHCP
In-Reply-To: <20151108145723.49e07124@free-electrons.com>
References: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
 <20151108145723.49e07124@free-electrons.com>
Message-ID: <1447107410.4553.76.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configuring the network interface with DHCP via
/etc/network/interfaces generally does not work when NFS booting.  The
DHCP configuration will initially bring the interface down and system
then hangs at that point as the root filesystem is no longer
accessable.  See bug 4709.

This adds a script to be run via a pre-up line in
/etc/network/interfaces.  It checks for a NFS root filesystem and if
the interface to be configured is used for access to the NFS server.
If this is the case, then it returns a failure code so that ifup will
not configure the interface.  This works for DHCP and another config
methods (static, bootp, etc.).  This system does detect if the
interface to be configured isn't the one used for NFS and doesn't skip
it when that is the case.

NFS filesystems that aren't the root fs aren't considered.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
---
 package/skeleton/nfs_check   | 20 ++++++++++++++++++++
 package/skeleton/skeleton.mk |  3 +++
 2 files changed, 23 insertions(+)
 create mode 100755 package/skeleton/nfs_check

diff --git a/package/skeleton/nfs_check b/package/skeleton/nfs_check
new file mode 100755
index 0000000..dfa0cbf
--- /dev/null
+++ b/package/skeleton/nfs_check
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# This allows NFS booting to work while also being able to configure
+# the network interface via DHCP when not NFS booting.  Otherwise, a
+# NFS booted system will likely hang during DHCP configuration.
+
+# Attempting to configure the network interface used for NFS will
+# initially bring that network down.  Since the root filesystem is
+# accessed over this network, the system hangs.
+
+# This script is run by ifup and will attempt to detect if a NFS root
+# mount uses the interface to be configured (IFACE), and if so does
+# not configure it.  This should allow the same build to be disk/flash
+# booted or NFS booted.
+
+nfsip=`sed -n '/^[^ ]*:.* \/ nfs.*[ ,]addr=\([0-9.]\+\).*/s//\1/p' /proc/mounts`
+if [ -n "$nfsip" ] && ip route get to "$nfsip" | grep -q "dev $IFACE"; then
+	echo Skipping $IFACE, used for NFS from $nfsip
+	exit 1
+fi
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index d1b797d..0cab8a1 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -89,8 +89,11 @@ define SET_NETWORK_DHCP
 		echo ;                                               \
 		echo "auto $(NETWORK_DHCP_IFACE)";                   \
 		echo "iface $(NETWORK_DHCP_IFACE) inet dhcp";        \
+		echo "  pre-up /etc/network/nfs_check";              \
 		echo "	wait-delay 15";                              \
 	) >> $(TARGET_DIR)/etc/network/interfaces
+	$(INSTALL) -m 0755 -D $(SKELETON_PKGDIR)/nfs_check \
+		$(TARGET_DIR)/etc/network/nfs_check
 endef
 endif
 
-- 
1.8.3.1
