From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:46 +0300
Subject: [Buildroot] [PATCH v1 8/9] board / intel: Add GPIO LEDs for Intel
	Minnowboard
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-9-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mika Westerberg <mika.westerberg@linux.intel.com>

There are 2 user controllable leds on Intel Minnowboard. This adds GPIO
LEDs device for those and sets default triggers for SD-card and system
heartbeat.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/minnowboard/acpi/leds.asl | 82 +++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 board/intel/minnowboard/acpi/leds.asl

diff --git a/board/intel/minnowboard/acpi/leds.asl b/board/intel/minnowboard/acpi/leds.asl
new file mode 100644
index 0000000..0de36d5
--- /dev/null
+++ b/board/intel/minnowboard/acpi/leds.asl
@@ -0,0 +1,82 @@
+/*
+ * Intel Minnowboard
+ *
+ * http://wiki.minnowboard.org/MinnowBoard
+ *
+ * This adds GPIO LEDs device for the 2 LEDs found on Intel Minnowboard
+ * available for users.
+ *
+ *   GPIO name           GPIO number   led
+ *   -----------------------------------------
+ *   E6XX_GPIO_SUS5      10           heartbeat
+ *   E6XX_GPIO_SUS6      11           sd-card
+ *
+ * In Linux you need to set CONFIG_LEDS_GPIO=y (or m) to be able to use
+ * this device.
+ */
+DefinitionBlock ("leds.aml", "SSDT", 5, "INTEL", "LEDS", 1)
+{
+    External (_SB_.PCI0.LPC, DeviceObj)
+
+    Scope (\_SB.PCI0.LPC)
+    {
+        Device (LEDS)
+        {
+            Name (_HID, "PRP0001")
+            Name (_DDN, "GPIO LEDs device")
+
+            Name (_CRS, ResourceTemplate () {
+                GpioIo (
+                    Exclusive,                  // Not shared
+                    PullNone,                   // No need for pulls
+                    0,                          // Debounce timeout
+                    0,                          // Drive strength
+                    IoRestrictionOutputOnly,    // Only used as output
+                    "\\_SB.PCI0.LPC",           // GPIO controller
+                    0)                          // Must be 0
+                {
+                    10,                         // E6XX_GPIO_SUS5
+                    11,                         // E6XX_GPIO_SUS6
+                }
+            })
+
+            Name (_DSD, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"compatible", "gpio-leds"},
+                },
+                ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
+                Package () {
+                    Package () {"led-0", "LED0"},
+                    Package () {"led-1", "LED1"},
+                }
+            })
+
+            // For more information about these bindings see:
+            // Documentation/devicetree/bindings/leds/leds-gpio.txt and
+            // Documentation/acpi/gpio-properties.txt.
+
+            Name (LED0, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"label", "heartbeat"},
+                    Package () {"gpios", Package () {^LEDS, 0, 0, 0}},
+                    Package () {"linux,default-state", "off"},
+                    Package () {"linux,default-trigger", "heartbeat"},
+                    Package () {"linux,retain-state-suspended", 1},
+                }
+            })
+
+            Name (LED1, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"label", "sd-card"},
+                    Package () {"gpios", Package () {^LEDS, 0, 1, 0}},
+                    Package () {"linux,default-state", "off"},
+                    Package () {"linux,default-trigger", "mmc0"},
+                    Package () {"linux,retain-state-suspended", 1},
+                }
+            })
+        }
+    }
+}
-- 
2.8.1
