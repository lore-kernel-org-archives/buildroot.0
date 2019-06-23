From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:42:25 +0200
Subject: [Buildroot] [git commit] boot/mv-ddr-marvell: fix build with GCC 8
Message-ID: <20190623104321.B8A6783D76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d45784e8891fb05b2800a686b8d481118f9ca3ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing a build warning that is considered as error.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dr4_training_leveling.c-uninitialized-var.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch b/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch
new file mode 100644
index 0000000000..eada18b473
--- /dev/null
+++ b/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch
@@ -0,0 +1,31 @@
+From 5867fcad6e88af3d843bfa831648d84a53732d57 Mon Sep 17 00:00:00 2001
+From: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Date: Wed, 19 Dec 2018 17:17:13 +0100
+Subject: [PATCH] mv_ddr: mv_ddr4_training_leveling.c: uninitialized variable
+
+With GCC 8.2 uninitialized variables lead to a build error.
+
+Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 5867fcad6e8
+
+ mv_ddr4_training_leveling.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mv_ddr4_training_leveling.c b/mv_ddr4_training_leveling.c
+index 144e21a03c01..cb95389f5466 100644
+--- a/mv_ddr4_training_leveling.c
++++ b/mv_ddr4_training_leveling.c
+@@ -368,7 +368,7 @@ static int mv_ddr4_dynamic_pb_wl_supp(u32 dev_num, enum mv_wl_supp_mode ecc_mode
+ 	u32 subphy_num = ddr3_tip_dev_attr_get(dev_num, MV_ATTR_OCTET_PER_INTERFACE);
+ 	u8 compare_result = 0;
+ 	u32 orig_phase;
+-	u32 rd_data, wr_data;
++	u32 rd_data, wr_data = 0;
+ 	u32 flag, step;
+ 	struct mv_ddr_topology_map *tm = mv_ddr_topology_map_get();
+ 	u32 ecc_phy_access_id;
+-- 
+2.20.1
+
