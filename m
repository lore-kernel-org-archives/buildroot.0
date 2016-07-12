From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:46 +0200
Subject: [Buildroot] [PATCH 2/5] patch to enable the use of a JTAG debugger
In-Reply-To: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
References: <1468312009-22124-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468312009-22124-3-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default the kernel will disable the JTAG clock, access via the JTAG port
will not work after the kernel booted. The am335x-evm has a JTAG header fitted,
this patch keeps the JTAG clock alive.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 .../linux/0004-keep-jtag-clock-alive-for-debugger.patch        | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch

diff --git a/board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch b/board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch
new file mode 100644
index 0000000..0192e64
--- /dev/null
+++ b/board/ti/am335x-evm/patches/linux/0004-keep-jtag-clock-alive-for-debugger.patch
@@ -0,0 +1,10 @@
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2016-01-08 21:16:11.000000000 +0100
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2016-03-10 10:47:15.209992555 +0100
+@@ -208,6 +208,7 @@
+ 	.name		= "debugss",
+ 	.class		= &am33xx_debugss_hwmod_class,
+ 	.clkdm_name	= "l3_aon_clkdm",
++	.flags		= (HWMOD_INIT_NO_IDLE|HWMOD_INIT_NO_RESET), /* keep debugSS clock alive for JTAG */
+ 	.main_clk	= "trace_clk_div_ck",
+ 	.prcm		= {
+ 		.omap4	= {
-- 
1.9.1
