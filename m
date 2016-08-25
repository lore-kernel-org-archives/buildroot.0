From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:43 +0300
Subject: [Buildroot] [PATCH v1 5/9] board / intel: Add SPI peripherals for
	Joule
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-6-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Add two SPI peripherals which can be connected to Intel Joule breakout
board connectors. First is Atmel AT25 compatible SPI EEPROM and second is
spidev that userspace can use to perform raw I/O access to the SPI bus.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/joule/acpi/at25.asl   | 56 +++++++++++++++++++++++++++++++++++++++
 board/intel/joule/acpi/spidev.asl | 42 +++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 board/intel/joule/acpi/at25.asl
 create mode 100644 board/intel/joule/acpi/spidev.asl

diff --git a/board/intel/joule/acpi/at25.asl b/board/intel/joule/acpi/at25.asl
new file mode 100644
index 0000000..018542e
--- /dev/null
+++ b/board/intel/joule/acpi/at25.asl
@@ -0,0 +1,56 @@
+/*
+ * Intel Joule
+ *
+ * This adds Atmel AT25 compatible serial EEPROM to the SPI host controller
+ * available on Intel Joule breakout #1 header:
+ *
+ *   pin name		pin number
+ *   -----------------------------
+ *   SPI_1_MISO_LS	2
+ *   SPI_1_MOSI_LS	4
+ *   SPI_1_FS0_LS	6
+ *   SPI_1_CLK_LS	10
+ *
+ * In Linux you need to set CONFIG_EEPROM_AT25=y (or m) to be able to use
+ * this device.
+ */
+DefinitionBlock ("at25.aml", "SSDT", 5, "INTEL", "AT25", 1)
+{
+    External (_SB_.PCI0.SPI2, DeviceObj)
+
+    Scope (\_SB.PCI0.SPI2)
+    {
+        Device (EEP0) {
+            Name (_HID, "PRP0001")
+            Name (_DDN, "Atmel AT25 compatible EEPROM")
+            Name (_CRS, ResourceTemplate () {
+                SpiSerialBus (
+                    0,                      // Chip select
+                    PolarityLow,            // Chip select is active low
+                    FourWireMode,           // Full duplex
+                    8,                      // Bits per word is 8 (byte)
+                    ControllerInitiated,    // Don't care
+                    1000000,                // 1 MHz
+                    ClockPolarityLow,       // SPI mode 0
+                    ClockPhaseFirst,        // SPI mode 0
+                    "\\_SB.PCI0.SPI2",      // SPI host controller
+                    0                       // Must be 0
+                )
+            })
+
+            /*
+             * See Documentation/devicetree/bindings/eeprom/at25.txt for
+             * more information about these bindings.
+             */
+            Name (_DSD, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"compatible", Package () {"atmel,at25"}},
+                    Package () {"size", 1024},
+                    Package () {"pagesize", 32},
+                    Package () {"address-width", 16},
+                }
+            })
+        }
+    }
+}
diff --git a/board/intel/joule/acpi/spidev.asl b/board/intel/joule/acpi/spidev.asl
new file mode 100644
index 0000000..17acca6
--- /dev/null
+++ b/board/intel/joule/acpi/spidev.asl
@@ -0,0 +1,42 @@
+/*
+ * Intel Joule
+ *
+ * This adds an SPI test device to the SPI host controller available on
+ * Intel Joule breakout #1 header:
+ *
+ *   pin name		pin number
+ *   -----------------------------
+ *   SPI_1_MISO_LS	2
+ *   SPI_1_MOSI_LS	4
+ *   SPI_1_FS2_LS	8
+ *   SPI_1_CLK_LS	10
+ *
+ * In Linux you need to set CONFIG_SPI_SPIDEV=y (or m) to be able to use
+ * this device.
+ */
+DefinitionBlock ("spidev.aml", "SSDT", 5, "INTEL", "SPIDEV", 1)
+{
+    External (_SB_.PCI0.SPI2, DeviceObj)
+
+    Scope (\_SB.PCI0.SPI2)
+    {
+        Device (TP0) {
+            Name (_HID, "SPT0001")
+            Name (_DDN, "SPI test device connected to CS2")
+            Name (_CRS, ResourceTemplate () {
+                SpiSerialBus (
+                    2,                      // Chip select
+                    PolarityLow,            // Chip select is active low
+                    FourWireMode,           // Full duplex
+                    8,                      // Bits per word is 8 (byte)
+                    ControllerInitiated,    // Don't care
+                    1000000,                // 1 MHz
+                    ClockPolarityLow,       // SPI mode 0
+                    ClockPhaseFirst,        // SPI mode 0
+                    "\\_SB.PCI0.SPI2",      // SPI host controller
+                    0                       // Must be 0
+                )
+            })
+        }
+    }
+}
-- 
2.8.1
