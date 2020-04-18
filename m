From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 18 Apr 2020 19:14:09 -0300
Subject: [Buildroot] [PATCH v2 3/5] package/dmraid: use modules-load to load
 the kernel module
In-Reply-To: <20200418221411.1549783-1-unixmania@gmail.com>
References: <20200418221411.1549783-1-unixmania@gmail.com>
Message-ID: <20200418221411.1549783-4-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

This is compatible with BusyBox/sysvinit (via S02modules-load), OpenRC
and systemd. It also prevents trying to load the module each time the
init script is executed.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Tested on QEMU with a kernel config with MD=y and DM_<FOO>=m. Only the
module loading was tested, since there is no RAID device.
---
 package/dmraid/S20dmraid |  3 ---
 package/dmraid/dmraid.mk | 12 ++++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/dmraid/S20dmraid b/package/dmraid/S20dmraid
index b3bfdcc84b..ff325154c6 100644
--- a/package/dmraid/S20dmraid
+++ b/package/dmraid/S20dmraid
@@ -2,9 +2,6 @@
 
 set -e
 
-# try to load module in case that hasn't been done yet
-modprobe dm-mod >/dev/null 2>&1
-
 case "$1" in
 	start|"")
 		echo "Setting up DMRAID devices..."
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 0382cd4d99..c8facbdabd 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -21,4 +21,16 @@ define DMRAID_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
+ifeq ($(BR2_LINUX_KERNEL),y)
+define DMRAID_GEN_MODULES_CONF
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/modules-load.d
+	{ \
+		find $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/md -name 'dm[_-]mod.ko*'; \
+	} 2> /dev/null | { \
+		sed 's:^.*/::; s:\.ko[^ ]*::'; \
+	} > $(TARGET_DIR)/etc/modules-load.d/20-dmraid.conf
+endef
+DMRAID_TARGET_FINALIZE_HOOKS += DMRAID_GEN_MODULES_CONF
+endif
+
 $(eval $(autotools-package))
-- 
2.18.2
