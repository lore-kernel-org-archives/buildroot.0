From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 23 Feb 2020 07:59:12 -0300
Subject: [Buildroot] [PATCH] package/busybox: fix individual binaries
 installation
Message-ID: <20200223105912.1158-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Call BUSYBOX_INSTALL_INDIVIDUAL_BINARIES in BUSYBOX_INSTALL_TARGET_CMDS,
not in BUSYBOX_INSTALL_INIT_SYSV. This should have been done in commit
b1e07d6d796e67a980d4a05d04c64f00162245ff but was somehow lost during the
review/aply process.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6283bc96ea..dfcd9d392c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -349,6 +349,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	# Use the 'noclobber' install rule, to prevent BusyBox from overwriting
 	# any full-blown versions of apps installed by other packages.
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install-noclobber
+	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_INSTALL_INITTAB)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
@@ -360,7 +361,6 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
-	$(BUSYBOX_INSTALL_INDIVIDUAL_BINARIES)
 endef
 
 # Checks to give errors that the user can understand
-- 
2.18.2
