From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:37:10 +0200
Subject: [Buildroot] [git commit] package/18xx-ti-utils: fix build with gcc
 10
Message-ID: <20200813213959.DDFFF86062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=079c7d238ed5d67a0dd9d736d6025b9e0561d43b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/df2d04de4b2e5003f3fc56c9e84db5054bd4d499

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-plt.h-fix-build-with-gcc-10.patch         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch b/package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..36480dfccb
--- /dev/null
+++ b/package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,38 @@
+From 12d3b3c01b0ec28d45427754541a8156939346d9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 13 Aug 2020 23:24:05 +0200
+Subject: [PATCH] plt.h: fix build with gcc 10
+
+Drop EFUSE_PARAMETER_TYPE_ENM to fix the following build failure with
+gcc 10:
+
+/home/buildroot/autobuild/run/instance-3/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -L/home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/lib nvs.o misc_cmds.o calibrator.o plt.o wl18xx_plt.o ini.o -lm -lnl-3 -lnl-genl-3 -o calibrator
+/home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: misc_cmds.o:(.bss+0x0): multiple definition of `EFUSE_PARAMETER_TYPE_ENM'; nvs.o:(.bss+0x0): first defined here
+/home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: calibrator.o: in function `.LANCHOR0':
+calibrator.c:(.bss+0xc): multiple definition of `EFUSE_PARAMETER_TYPE_ENM'; nvs.o:(.bss+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/df2d04de4b2e5003f3fc56c9e84db5054bd4d499
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to sudharshan <sudharshan@ti.com>]
+---
+ plt.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plt.h b/plt.h
+index 8b534a9..43d5dbc 100644
+--- a/plt.h
++++ b/plt.h
+@@ -399,7 +399,7 @@ enum EFUSE_PARAMETER_TYPE_ENMT {
+ 	TX_BIP_PD_BUFFER_VBIAS_ERROR_E,
+ 	EFUSE_NUMBER_OF_PARAMETERS_E,
+ 	EFUSE_LAST_PARAMETER_E = (EFUSE_NUMBER_OF_PARAMETERS_E - 1)
+-} EFUSE_PARAMETER_TYPE_ENM;
++};
+ 
+ int get_mac_addr(int ifc_num, unsigned char *mac_addr);
+ 
+-- 
+2.27.0
+
