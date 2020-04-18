From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 18 Apr 2020 19:14:08 -0300
Subject: [Buildroot] [PATCH v2 2/5] package/busybox: add modules-load init
 script
In-Reply-To: <20200418221411.1549783-1-unixmania@gmail.com>
References: <20200418221411.1549783-1-unixmania@gmail.com>
Message-ID: <20200418221411.1549783-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use some scripting to mimic the systemd "modules-load" and the OpenRC
"modules" services (load kernel modules based on static configuration).

At the moment package/busybox/S02modules-load is a symlink to the kmod
script, since it works with both versions of the "modprobe" utility.

Signed-off-by: Carlos Santos <unixmania@gmail.com>

package/busybox/

---
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1->v2:
- Rename S02modules-load to S11modules-load to ensure that it runs after
  S10mdev and S10udev, which both are going to trigger cold-plug events
  that may in turn trigger module loading, as observed by Yann E. MORIN.
---
 package/busybox/S11modules-load |  1 +
 package/busybox/busybox.mk      | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 120000 package/busybox/S11modules-load

diff --git a/package/busybox/S11modules-load b/package/busybox/S11modules-load
new file mode 120000
index 0000000000..44623673ff
--- /dev/null
+++ b/package/busybox/S11modules-load
@@ -0,0 +1 @@
+../kmod/S11modules-load
\ No newline at end of file
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5d5f3e92bd..3512bf77b5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -264,6 +264,17 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 endef
 endif
 
+# Only install our modules-load script if no other package does it.
+ifeq ($(BR2_PACKAGE_KMOD_TOOLS),)
+define BUSYBOX_INSTALL_MODULES_SCRIPT
+	if grep -q CONFIG_MODPROBE=y $(@D)/.config; \
+	then \
+		$(INSTALL) -m 0755 -D package/busybox/S11modules-load \
+			$(TARGET_DIR)/etc/init.d/S11modules-load; \
+	fi
+endef
+endif
+
 # Only install our sysctl scripts if no other package does it.
 ifeq ($(BR2_PACKAGE_PROCPS_NG),)
 define BUSYBOX_INSTALL_SYSCTL_SCRIPT
@@ -368,6 +379,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_MODULES_SCRIPT)
 	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
-- 
2.18.2
