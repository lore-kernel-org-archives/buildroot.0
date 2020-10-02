From: Shlomi Vaknin <shlomi.39sd@gmail.com>
Date: Fri,  2 Oct 2020 17:24:26 +0300
Subject: [Buildroot] [PATCH v2 4/4] configs/stm32mp157c-dk2: add support for
 wifi
In-Reply-To: <20201002142426.1375026-1-shlomi.39sd@gmail.com>
References: <20200927061606.10239-1-shlomi.39sd@gmail.com>
 <20201002142426.1375026-1-shlomi.39sd@gmail.com>
Message-ID: <20201002142426.1375026-4-shlomi.39sd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support for wifi for stm32mp157c-dk2 is achieved by using
another dts which includes the bindings for the wifi module.
In addition, a txt file for the wifi firmware. This was copied from the yocto bsp layer of st.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
---
 .../overlay/boot/extlinux/extlinux.conf       |  2 +-
 .../brcmfmac43430-sdio.st,stm32mp157c-dk2.txt | 59 +++++++++++++++++++
 .../stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts  | 32 ++++++++++
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts

diff --git a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
index 5b7f56ee77..a6595971a8 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
+++ b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32mp157c-dk2-buildroot
   kernel /boot/zImage
-  devicetree /boot/stm32mp157c-dk2.dtb
+  devicetree /boot/stm32mp157c-dk2-wifi.dtb
   append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt b/board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
new file mode 100644
index 0000000000..b36de8837f
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
@@ -0,0 +1,59 @@
+# NVRAM file for BCM943430WLSELG
+# 2.4 GHz, 20 MHz BW mode
+
+# The following parameter values are just placeholders, need to be updated.
+manfid=0x2d0
+prodid=0x0726
+vendid=0x14e4
+devid=0x43e2
+boardtype=0x0726
+boardrev=0x1202
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+sromrev=11
+boardflags=0x00404201
+boardflags3=0x08000000
+xtalfreq=37400
+#xtalfreq=19200
+nocrc=1
+ag0=255
+aa2g=1
+ccode=ALL
+
+pa0itssit=0x20
+extpagain2g=0
+
+#PA parameters for 2.4GHz, measured at CHIP OUTPUT
+pa2ga0=-168,7161,-820
+AvVmid_c0=0x0,0xc8
+cckpwroffset0=5
+
+# PPR params
+maxp2ga0=84
+txpwrbckof=6
+cckbw202gpo=0
+legofdmbw202gpo=0x66111111
+mcsbw202gpo=0x77711111
+propbw202gpo=0xdd
+
+# OFDM IIR :
+ofdmdigfilttype=18
+ofdmdigfilttypebe=18
+# PAPD mode:
+papdmode=1
+papdvalidtest=1
+pacalidx2g=32
+papdepsoffset=-36
+papdendidx=61
+
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+
+deadman_to=0xffffffff
+# muxenab: 0x1 for UART enable, 0x2 for GPIOs, 0x8 for JTAG
+muxenab=0x1
+# CLDO PWM voltage settings - 0x4 - 1.1 volt
+#cldo_pwm=0x4
+
+#VCO freq 326.4MHz
+spurconfig=0x3
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts b/board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts
new file mode 100644
index 0000000000..89747d2b5f
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts
@@ -0,0 +1,32 @@
+/dts-v1/;
+
+#include "stm32mp157c-dk2.dts"
+
+/ {
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpioh 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+/* Wifi */
+&sdmmc2 {
+	arm,primecell-periphid = <0x10153180>;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
+	non-removable;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	brcmf: bcrmf at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
-- 
2.25.1
