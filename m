From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:57:06 +0200
Subject: [Buildroot] [git commit] utils/diffconfig: remove BR2_* prefix
 restriction
Message-ID: <20181021175536.B13388848C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf9ccfc37b6594c41163eb235384abb4771a6a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The utils/diffconfig script works only on variables with the BR2_
prefix. This is OK for Buildroot [def]configs since this is the prefix
for all user-facing variables, but it prevents using the same script
to compare configs from kconfig-based packages.

Remove the BR2_ restriction, allowing usage such as:

  ./utils/diffconfig \
	board/qemu/xtensa-lx60/linux.config \
	board/qemu/xtensa-lx60/linux-nommu.config

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
