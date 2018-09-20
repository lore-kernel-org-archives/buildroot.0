From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Thu, 20 Sep 2018 13:44:16 +0200
Subject: [Buildroot] [PATCH 1/1] utils/diffconfig: Removed BR2_* prefix
 restriction
Message-ID: <20180920114416.13976-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes the prefix restrictions on items in config files to
compare and now allows any prefix to be used.

Motivation:
To the best of my knowledge, buildroot does not impose any restrictions
on how to name config items. It is perfectly fine to use arbitrary
prefixes in your extensions. This kind of freedom should be reflected
in the accompanying tools so that's why I propose this patch.

As a side effect, this script now is able to correctly compare configs
of kconfig based packages as well as of buildroot itself.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 utils/diffconfig | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/utils/diffconfig b/utils/diffconfig
index 5862a62f25..f1af23cfce 100755
--- a/utils/diffconfig
+++ b/utils/diffconfig
@@ -28,14 +28,14 @@ If no config files are specified, .config and .config.old are used.
 
 Example usage:
  $ diffconfig .config config-with-some-changes
--LINUX_KERNEL_INTREE_DTS_NAME "vexpress-v2p-ca9"
- LINUX_KERNEL_DTS_SUPPORT y -> n
- LINUX_KERNEL_USE_INTREE_DTS y -> n
- PACKAGE_DFU_UTIL n -> y
- PACKAGE_LIBUSB n -> y
- TARGET_GENERIC_HOSTNAME "buildroot" -> "Tuxie"
- TARGET_GENERIC_ISSUE "Welcome to Buildroot" -> "Welcome to CustomBoard"
-+PACKAGE_LIBUSB_COMPAT n
+-BR2_LINUX_KERNEL_INTREE_DTS_NAME "vexpress-v2p-ca9"
+ BR2_LINUX_KERNEL_DTS_SUPPORT y -> n
+ BR2_LINUX_KERNEL_USE_INTREE_DTS y -> n
+ BR2_PACKAGE_DFU_UTIL n -> y
+ BR2_PACKAGE_LIBUSB n -> y
+ BR2_TARGET_GENERIC_HOSTNAME "buildroot" -> "Tuxie"
+ BR2_TARGET_GENERIC_ISSUE "Welcome to Buildroot" -> "Welcome to CustomBoard"
++BR2_PACKAGE_LIBUSB_COMPAT n
 
 """)
     sys.exit(0)
@@ -44,12 +44,14 @@ Example usage:
 def readconfig(config_file):
     d = {}
     for line in config_file:
-        line = line[:-1]
-        if line[:4] == "BR2_":
-            name, val = line[4:].split("=", 1)
-            d[name] = val
+        line = line.strip()
+        if len(line) == 0:
+            continue
         if line[-11:] == " is not set":
-            d[line[6:-11]] = "n"
+            d[line[2:-11]] = "n"
+        elif line[0] != "#":
+            name, val = line.split("=", 1)
+            d[name] = val
     return d
 
 def print_config(op, config, value, new_value):
@@ -58,9 +60,9 @@ def print_config(op, config, value, new_value):
     if merge_style:
         if new_value:
             if new_value=="n":
-                print("# BR2_%s is not set" % config)
+                print("# %s is not set" % config)
             else:
-                print("BR2_%s=%s" % (config, new_value))
+                print("%s=%s" % (config, new_value))
     else:
         if op=="-":
             print("-%s %s" % (config, value))
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
