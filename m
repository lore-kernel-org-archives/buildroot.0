From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Mar 2021 19:14:27 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
Message-ID: <20210316181429.30804-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Taking a deeper look at the configure script gen-compat-autoconf.sh reveals that
the batman feature options must be explicitly set to 'y' or 'n' to work as
expected.

Fixes:

  ERROR: modpost: "batadv_v_mesh_free" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_mesh_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_hardif_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
  ERROR: modpost: "batadv_v_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

Reported-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - the previous patch was tested against an RPi4 linux kernel already
    enabling the build-in batman-adv module inlcusive batman-v, the defconfig
    given by Christian (enhanced by BR2_LINUX_KERNEL/BR2_LINUX_KERNEL_LATEST_VERSION/
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFI) uses one with build-in batman-adv
    disabled
---
 package/batman-adv/batman-adv.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index bfa573643d..2de92d6543 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -24,9 +24,9 @@ BATMAN_ADV_MODULE_MAKE_OPTS = \
 	CONFIG_BATMAN_ADV_BLA=y \
 	CONFIG_BATMAN_ADV_DAT=y \
 	CONFIG_BATMAN_ADV_MCAST=y \
-	$(if $(BR2_PACKAGE_BATMAN_ADV_BATMAN_V), CONFIG_BATMAN_ADV_BATMAN_V=y) \
-	$(if $(BR2_PACKAGE_BATMAN_ADV_DEBUG), CONFIG_BATMAN_ADV_DEBUG=y) \
-	$(if $(BR2_PACKAGE_BATMAN_ADV_NC), CONFIG_BATMAN_ADV_NC=y)
+	CONFIG_BATMAN_ADV_BATMAN_V=$(if $(BR2_PACKAGE_BATMAN_ADV_BATMAN_V),y,n) \
+	CONFIG_BATMAN_ADV_DEBUG=$(if $(BR2_PACKAGE_BATMAN_ADV_DEBUG),y,n) \
+	CONFIG_BATMAN_ADV_NC=$(if $(BR2_PACKAGE_BATMAN_ADV_NC),y,n)
 
 BATMAN_ADV_MODULE_SUBDIRS = net/batman-adv
 
-- 
2.30.1
