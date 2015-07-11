From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 17:56:04 +0200
Subject: [Buildroot] [git commit] busybox: Install udhcpc script only if
	enabled
Message-ID: <20150711222431.ECB2C8181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1baac68bcb9fb3cb3d2603d238a2ce8e7eb1125
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It doesn't make sense to install such a scripts if UDHCPC was not
selected.
Also remove the entry from BUSYBOX_PERMISSIONS as the install command
does the same job.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 51b35bc..92874cd 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -52,7 +52,6 @@ BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
 define BUSYBOX_PERMISSIONS
 	/bin/busybox                     f 4755 0  0 - - - - -
-	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
 endef
 
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
@@ -127,6 +126,15 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
 endef
 endif
 
+define BUSYBOX_INSTALL_UDHCPC_SCRIPT
+	if grep -q CONFIG_UDHCPC=y $(@D)/.config; then \
+		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
+			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
+		$(INSTALL) -m 0755 -d \
+			$(TARGET_DIR)/usr/share/udhcpc/default.script.d; \
+	fi
+endef
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_SET_INIT
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
@@ -189,10 +197,7 @@ endef
 
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
-	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
-		$(TARGET_DIR)/usr/share/udhcpc/default.script
-	$(INSTALL) -m 0755 -d \
-		$(TARGET_DIR)/usr/share/udhcpc/default.script.d
+	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
 
