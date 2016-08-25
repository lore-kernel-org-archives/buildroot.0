From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:42 +0300
Subject: [Buildroot] [PATCH v1 4/9] board / intel: Add SPI peripherals for
	Minnowboard MAX
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-5-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Add two SPI peripherals which can be connected to Minnowboard MAX low speed
connector. First is Atmel AT25 compatible SPI EEPROM and second is M25P80
compatible SPI serial flash.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/minnowboard-max/acpi/at25.asl   | 58 +++++++++++++++++++++++++++++
 board/intel/minnowboard-max/acpi/m25p80.asl | 52 ++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 board/intel/minnowboard-max/acpi/at25.asl
 create mode 100644 board/intel/minnowboard-max/acpi/m25p80.asl

diff --git a/board/intel/minnowboard-max/acpi/at25.asl b/board/intel/minnowboard-max/acpi/at25.asl
new file mode 100644
index 0000000..fdc169a
--- /dev/null
+++ b/board/intel/minnowboard-max/acpi/at25.asl
@@ -0,0 +1,58 @@
+/*
+ * Minnowboard MAX
+ *
+ * http://wiki.minnowboard.org/MinnowBoard_MAX
+ *
+ * This adds Atmel AT25 compatible 1kb serial EEPROM to the SPI host
+ * controller available on Minnowboard MAX low speed connector (JP1) pins:
+ *
+ *   pin name		pin number
+ *   -----------------------------
+ *   GPIO_SPI_CS	5
+ *   GPIO_SPI_MISO	7
+ *   GPIO_SPI_MOSI	9
+ *   GPIO_SPI_CLK	11
+ *
+ * In Linux you need to set CONFIG_EEPROM_AT25=y (or m) to be able to use
+ * this device.
+ */
+DefinitionBlock ("at25.aml", "SSDT", 5, "INTEL", "AT25", 1)
+{
+    External (_SB_.SPI1, DeviceObj)
+
+    Scope (\_SB.SPI1)
+    {
+        Device (EEP0) {
+            Name (_HID, "PRP0001")
+            Name (_DDN, "Atmel AT25 compatible EEPROM")
+            Name (_CRS, ResourceTemplate () {
+                SpiSerialBus (
+                    1,                      // Chip select
+                    PolarityLow,            // Chip select is active low
+                    FourWireMode,           // Full duplex
+                    8,                      // Bits per word is 8 (byte)
+                    ControllerInitiated,    // Don't care
+                    1000000,                // 1 MHz
+                    ClockPolarityLow,       // SPI mode 0
+                    ClockPhaseFirst,        // SPI mode 0
+                    "\\_SB.SPI1",           // SPI host controller
+                    0                       // Must be 0
+                )
+            })
+
+            /*
+	     * See Documentation/devicetree/bindings/eeprom/at25.txt for
+	     * more information about these bindings.
+             */
+            Name (_DSD, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"compatible", "atmel,at25"},
+                    Package () {"size", 1024},
+                    Package () {"pagesize", 32},
+                    Package () {"address-width", 16},
+                }
+            })
+        }
+    }
+}
diff --git a/board/intel/minnowboard-max/acpi/m25p80.asl b/board/intel/minnowboard-max/acpi/m25p80.asl
new file mode 100644
index 0000000..d0676c6
--- /dev/null
+++ b/board/intel/minnowboard-max/acpi/m25p80.asl
@@ -0,0 +1,52 @@
+/*
+ * Minnowboard MAX
+ *
+ * http://wiki.minnowboard.org/MinnowBoard_MAX
+ *
+ * This adds M25P80 (AT26DF, M25P, W25X) compatible serial flash to the SPI
+ * host controller available on Minnowboard MAX low speed connector (JP1)
+ * pins:
+ *
+ *   pin name		pin number
+ *   -----------------------------
+ *   GPIO_SPI_CS	5
+ *   GPIO_SPI_MISO	7
+ *   GPIO_SPI_MOSI	9
+ *   GPIO_SPI_CLK	11
+ *
+ * In Linux you need to set CONFIG_MTD_M25P80=y (or m) to be able to use
+ * this device.
+ */
+DefinitionBlock ("m25p80.aml", "SSDT", 5, "INTEL", "M25P80", 1)
+{
+    External (_SB_.SPI1, DeviceObj)
+
+    Scope (\_SB.SPI1)
+    {
+        Device (FLS0) {
+            Name (_HID, "PRP0001")
+            Name (_DDN, "M25P80 compatible serial flash")
+            Name (_CRS, ResourceTemplate () {
+                SpiSerialBus (
+                    1,                      // Chip select
+                    PolarityLow,            // Chip select is active low
+                    FourWireMode,           // Full duplex
+                    8,                      // Bits per word is 8 (byte)
+                    ControllerInitiated,    // Don't care
+                    10000000,               // 10 MHz
+                    ClockPolarityLow,       // SPI mode 0
+                    ClockPhaseFirst,        // SPI mode 0
+                    "\\_SB.SPI1",           // SPI host controller
+                    0                       // Must be 0
+                )
+            })
+
+            Name (_DSD, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"compatible", "jedec,spi-nor"},
+                }
+            })
+        }
+    }
+}
-- 
2.8.1
