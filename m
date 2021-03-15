From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Mar 2021 20:46:43 +0100
Subject: [Buildroot] [git commit] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
Message-ID: <20210315192400.56B1880E35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8b1eeb2f3f5f0bfd089704ccad57e5665f5813a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The given 'CONFIG_BATMAN_ADV_BATMAN_V=' is enough to trigger the wrong
code compile path in net/batman-adv/bat_v.h missing the static inline
dummy implementations.

Fixes:

  ERROR: modpost: "batadv_v_mesh_free" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_mesh_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_hardif_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - move all conditional options together
  - slight cleanup/reorganise
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/batman-adv/batman-adv.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 3f48e62051..bfa573643d 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -9,23 +9,25 @@ BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-a
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
 
-# Bridge Loop Avoidance, Distributed Arp Table are always enabled
 BATMAN_ADV_CFLAGS = \
 	-I$(@D)/compat-include/ \
 	-I$(@D)/include/ \
 	-include $(@D)/compat.h \
 	-DBATADV_SOURCE_VERSION=\"\\\"$(BATMAN_ADV_VERSION)\\\"\"
+
+# Bridge Loop Avoidance, Distributed Arp Table are always enabled
 BATMAN_ADV_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	INSTALL_MOD_DIR=updates/net/batman-adv \
 	NOSTDINC_FLAGS="$(BATMAN_ADV_CFLAGS)" \
 	CONFIG_BATMAN_ADV=m \
-	CONFIG_BATMAN_ADV_BATMAN_V=$(BR2_PACKAGE_BATMAN_ADV_BATMAN_V) \
 	CONFIG_BATMAN_ADV_BLA=y \
 	CONFIG_BATMAN_ADV_DAT=y \
-	CONFIG_BATMAN_ADV_DEBUG=$(BR2_PACKAGE_BATMAN_ADV_DEBUG) \
 	CONFIG_BATMAN_ADV_MCAST=y \
-	CONFIG_BATMAN_ADV_NC=$(BR2_PACKAGE_BATMAN_ADV_NC)
+	$(if $(BR2_PACKAGE_BATMAN_ADV_BATMAN_V), CONFIG_BATMAN_ADV_BATMAN_V=y) \
+	$(if $(BR2_PACKAGE_BATMAN_ADV_DEBUG), CONFIG_BATMAN_ADV_DEBUG=y) \
+	$(if $(BR2_PACKAGE_BATMAN_ADV_NC), CONFIG_BATMAN_ADV_NC=y)
+
 BATMAN_ADV_MODULE_SUBDIRS = net/batman-adv
 
 define BATMAN_ADV_CONFIGURE_CMDS
