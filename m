From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:47 +0300
Subject: [Buildroot] [PATCH v1 9/9] board / intel: Add GPIO buttons for
	Intel Minnowboard
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-10-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mika Westerberg <mika.westerberg@linux.intel.com>

There are 4 user controllable switches (S0, S1, S2, S3) on Intel
Minnowboard. This adds GPIO buttons device that is able to report key
presses through input layer for those.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/minnowboard/acpi/buttons.asl | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 board/intel/minnowboard/acpi/buttons.asl

diff --git a/board/intel/minnowboard/acpi/buttons.asl b/board/intel/minnowboard/acpi/buttons.asl
new file mode 100644
index 0000000..2bc4220
--- /dev/null
+++ b/board/intel/minnowboard/acpi/buttons.asl
@@ -0,0 +1,104 @@
+/*
+ * Intel Minnowboard
+ *
+ * http://wiki.minnowboard.org/MinnowBoard
+ *
+ * This adds GPIO buttons device for the 4 switches found on Intel
+ * Minnowboard available for users.
+ *
+ *   GPIO name           GPIO number  switch
+ *   ---------------------------------------
+ *   E6XX_GPIO_S0        0            S0
+ *   E6XX_GPIO_S1        1            S1
+ *   E6XX_GPIO_S2        2            S2
+ *   E6XX_GPIO_S3        3            S3
+ *
+ * In Linux you need to set CONFIG_KEYBOARD_GPIO_POLLED=y (or m) to be
+ * able to use this device.
+ */
+DefinitionBlock ("buttons.aml", "SSDT", 5, "INTEL", "BUTTONS", 1)
+{
+    External (_SB_.PCI0.LPC, DeviceObj)
+
+    Scope (\_SB.PCI0.LPC)
+    {
+        Device (BTNS)
+        {
+            Name (_HID, "PRP0001")
+            Name (_DDN, "GPIO buttons device")
+
+            Name (_CRS, ResourceTemplate () {
+                GpioIo (
+                    Exclusive,                  // Not shared
+                    PullUp,                     // Pull up the line
+                    0,                          // Debounce timeout
+                    0,                          // Drive strength
+                    IoRestrictionInputOnly,     // Only used as input
+                    "\\_SB.PCI0.LPC",           // GPIO controller
+                    0)                          // Must be 0
+                {
+                    0,                         // E6XX_GPIO_S0
+                    1,                         // E6XX_GPIO_S1
+                    2,                         // E6XX_GPIO_S2
+                    3,                         // E6XX_GPIO_S3
+                }
+            })
+
+            Name (_DSD, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"compatible", "gpio-keys-polled"},
+                    Package () {"poll-interval", 100},
+                    Package () {"autorepeat", 1}
+                },
+                ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
+                Package () {
+                    Package () {"button-0", "BTN0"},
+                    Package () {"button-1", "BTN1"},
+                    Package () {"button-2", "BTN2"},
+                    Package () {"button-3", "BTN3"}
+                }
+            })
+
+            // For more information about these bindings see:
+            // Documentation/devicetree/bindings/input/gpio-keys-polled.txt
+            // and Documentation/acpi/gpio-properties.txt.
+
+            Name (BTN0, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"linux,code", 105},
+                    Package () {"linux,input-type", 1},
+                    Package () {"gpios", Package () {^BTNS, 0, 0, 1}}
+                }
+            })
+
+            Name (BTN1, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"linux,code", 108},
+                    Package () {"linux,input-type", 1},
+                    Package () {"gpios", Package (4) {^BTNS, 0, 1, 1}}
+                }
+            })
+
+            Name (BTN2, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"linux,code", 103},
+                    Package () {"linux,input-type", 1},
+                    Package () {"gpios", Package () {^BTNS, 0, 2, 1}}
+                }
+            })
+
+            Name (BTN3, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"linux,code", 106},
+                    Package () {"linux,input-type", 1},
+                    Package () {"gpios", Package () {^BTNS, 0, 3, 1}}
+                }
+            })
+        }
+    }
+}
-- 
2.8.1
