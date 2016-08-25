From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:44 +0300
Subject: [Buildroot] [PATCH v1 6/9] board / intel: Add Aosong AM2315 sensor
	for Intel Joule
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-7-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mika Westerberg <mika.westerberg@linux.intel.com>

This is I2C connected temperature and humidity sensor.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/joule/acpi/am2315.asl | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 board/intel/joule/acpi/am2315.asl

diff --git a/board/intel/joule/acpi/am2315.asl b/board/intel/joule/acpi/am2315.asl
new file mode 100644
index 0000000..be1dc83
--- /dev/null
+++ b/board/intel/joule/acpi/am2315.asl
@@ -0,0 +1,36 @@
+/*
+ * Intel Joule
+ *
+ * This adds Aosong AM2315 temperature and humidity sensor to the
+ * first I2C bus available on Intel Joule breakout #1 header:
+ *
+ *   pin name           pin number
+ *   -----------------------------
+ *   I2C_0_SDA_LS       11
+ *   I2C_0_SCL_LS       13
+ *
+ * In Linux you need to set CONFIG_AM2315=y (or m) to be able to use
+ * this device.
+ */
+DefinitionBlock ("adc.aml", "SSDT", 5, "INTEL", "ADC", 1)
+{
+    External (_SB_.PCI0.I2C1, DeviceObj)
+
+    Scope (\_SB.PCI0.I2C1)
+    {
+        Device (TEMP) {
+            Name (_HID, "AOS2315")
+            Name (_DDN, "Aosong AM2315 Temperature & Humidity sensor")
+            Name (_CRS, ResourceTemplate () {
+                I2cSerialBus (
+                    0x5c,                   // Bus address
+                    ControllerInitiated,    // Don't care
+                    400000,                 // Fast mode (400 kHz)
+                    AddressingMode7Bit,     // 7-bit addressing
+                    "\\_SB.PCI0.I2C1",      // I2C host controller
+                    0                       // Must be 0
+                )
+            })
+        }
+    }
+}
-- 
2.8.1
