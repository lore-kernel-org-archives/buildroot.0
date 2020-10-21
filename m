From: Sven Oliver Moll <buildroot@svol.li>
Date: Wed, 21 Oct 2020 12:33:43 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] busybox: install example zcip.script when
 zcip is activated in config
Message-ID: <alpine.DEB.2.20.2010211135470.29285@defender.svolli.xa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this way zcip will work out of the box when configured

Signed-off-by: Sven Oliver Moll <buildroot@svol.li>
---
  package/busybox/busybox.mk | 8 ++++++++
  1 file changed, 8 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 45f74271f2..7136d9378a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -207,6 +207,13 @@ define BUSYBOX_INSTALL_UDHCPC_SCRIPT
  	fi
  endef

+define BUSYBOX_INSTALL_ZCIP_SCRIPT
+	if grep -q CONFIG_ZCIP=y $(@D)/.config; then \
+		$(INSTALL) -m 0755 -D $(@D)/examples/zcip.script \
+			$(TARGET_DIR)/usr/share/zcip/default.script; \
+	fi
+endef
+
  ifeq ($(BR2_INIT_BUSYBOX),y)

  define BUSYBOX_SET_INIT
@@ -352,6 +359,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
  	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install-noclobber
  	$(BUSYBOX_INSTALL_INITTAB)
  	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
+	$(BUSYBOX_INSTALL_ZCIP_SCRIPT)
  	$(BUSYBOX_INSTALL_MDEV_CONF)
  endef

-- 
2.20.1
