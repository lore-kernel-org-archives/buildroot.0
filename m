From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:45 +0300
Subject: [Buildroot] [PATCH v1 7/9] board / intel: Add GPIO LEDs for Intel
	Joule
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-8-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mika Westerberg <mika.westerberg@linux.intel.com>

There are 4 user controllable leds on the Joule breakout board. This adds
the GPIO LEDs device for those and sets default triggers for SD-card and
system heartbeat.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/joule/acpi/leds.asl | 107 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 board/intel/joule/acpi/leds.asl

diff --git a/board/intel/joule/acpi/leds.asl b/board/intel/joule/acpi/leds.asl
new file mode 100644
index 0000000..61ba3c4
--- /dev/null
+++ b/board/intel/joule/acpi/leds.asl
@@ -0,0 +1,107 @@
+/*
+ * Intel Joule
+ *
+ * This adds GPIO LEDs device for the 4 LEDs found on Intel Joule board
+ * available for users. Same GPIOs are also available on breakout header
+ * with pins:
+ *
+ *   pin name           pin number   led
+ *   -----------------------------------------
+ *   ISH_GPIO_0_LS      35           heartbeat
+ *   ISH_GPIO_1_LS      33           sd-card
+ *   ISH_GPIO_2_LS      31           led-2
+ *   ISH_GPIO_3_LS      29           led-3
+ *
+ * In Linux you need to set CONFIG_LEDS_GPIO=y (or m) to be able to use
+ * this device.
+ */
+DefinitionBlock ("leds.aml", "SSDT", 5, "INTEL", "LEDS", 1)
+{
+    External (_SB_.PCI0, DeviceObj)
+
+    Scope (\_SB.PCI0)
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
+                    "\\_SB.GPO2",               // GPIO controller
+                    0)                          // Must be 0
+                {
+                    22,                         // ISH_GPIO_0_LS
+                    23,                         // ISH_GPIO_1_LS
+                    24,                         // ISH_GPIO_2_LS
+                    25                          // ISH_GPIO_3_LS
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
+                    Package () {"led-2", "LED2"},
+                    Package () {"led-3", "LED3"},
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
+                    Package () {"gpios", Package () {^LEDS, 0, 0, 1}},
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
+                    Package () {"gpios", Package () {^LEDS, 0, 1, 1}},
+                    Package () {"linux,default-state", "off"},
+                    Package () {"linux,default-trigger", "mmc0"},
+                    Package () {"linux,retain-state-suspended", 1},
+                }
+            })
+
+            Name (LED2, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"label", "led-2"},
+                    Package () {"gpios", Package () {^LEDS, 0, 2, 1}},
+                    Package () {"linux,default-state", "off"},
+                    Package () {"linux,retain-state-suspended", 1},
+                }
+            })
+
+            Name (LED3, Package () {
+                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+                Package () {
+                    Package () {"label", "led-3"},
+                    Package () {"gpios", Package () {^LEDS, 0, 3, 1}},
+                    Package () {"linux,default-state", "off"},
+                    Package () {"linux,retain-state-suspended", 1},
+                }
+            })
+        }
+    }
+}
-- 
2.8.1
