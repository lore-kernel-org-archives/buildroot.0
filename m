From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 14 Mar 2021 23:32:06 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
Message-ID: <20210314223207.13460-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The given 'CONFIG_BATMAN_ADV_BATMAN_V=' is enough to trigger the wrong
code compile path in net/batman-adv/bat_v.h missing the static inline
dummy implementations.

Fixes:

  ERROR: modpost: "batadv_v_mesh_free" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_mesh_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_hardif_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/batman-adv/batman-adv.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index bd648b5a6c..0b9fcaefc0 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -20,12 +20,12 @@ BATMAN_ADV_MODULE_MAKE_OPTS = \
 	INSTALL_MOD_DIR=updates/net/batman-adv \
 	NOSTDINC_FLAGS="$(BATMAN_ADV_CFLAGS)" \
 	CONFIG_BATMAN_ADV=m \
-	CONFIG_BATMAN_ADV_BATMAN_V=$(BR2_PACKAGE_BATMAN_ADV_BATMAN_V) \
+	$(if $(BR2_PACKAGE_BATMAN_ADV_BATMAN_V), CONFIG_BATMAN_ADV_BATMAN_V=y) \
 	CONFIG_BATMAN_ADV_BLA=y \
 	CONFIG_BATMAN_ADV_DAT=y \
-	CONFIG_BATMAN_ADV_DEBUG=$(BR2_PACKAGE_BATMAN_ADV_DEBUG) \
+	$(if $(BR2_PACKAGE_BATMAN_ADV_DEBUG), CONFIG_BATMAN_ADV_DEBUG=y) \
 	CONFIG_BATMAN_ADV_MCAST=y \
-	CONFIG_BATMAN_ADV_NC=$(BR2_PACKAGE_BATMAN_ADV_NC)
+	$(if $(BR2_PACKAGE_BATMAN_ADV_NC), CONFIG_BATMAN_ADV_NC=y)
 BATMAN_ADV_MODULE_SUBDIRS = net/batman-adv
 
 define BATMAN_ADV_CONFIGURE_CMDS
-- 
2.30.1
