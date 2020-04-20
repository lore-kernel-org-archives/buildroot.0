From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Apr 2020 11:17:56 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: add check-dotconfig.py
Message-ID: <20200420091757.2931721-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the same reason as for 50b747f212be2c9c0f7cf10c674ed488d042715c,
we need to check if the generated configuration file (.config)
contains all symbols present in the defconfig file.

If not there is an issue with the defconfig.

This script will be used in .gitlab-ci.yml.

Inspired by is_toolchain_usable() function from genrandconfig:
https://git.busybox.net/buildroot/tree/utils/genrandconfig?h=2020.02#n164

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-dotconfig.py | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100755 support/scripts/check-dotconfig.py

diff --git a/support/scripts/check-dotconfig.py b/support/scripts/check-dotconfig.py
new file mode 100755
index 0000000000..9e60810c1d
--- /dev/null
+++ b/support/scripts/check-dotconfig.py
@@ -0,0 +1,37 @@
+#!/usr/bin/env python3
+
+# This script check if the .config is contains all lines present in the defconfig.
+
+import sys
+
+
+def main():
+    if not (len(sys.argv) == 3):
+        print("Error: incorrect number of arguments")
+        print("""Usage: check-dotconfig <configfile> <defconfig>""")
+        sys.exit(1)
+
+    configfile = sys.argv[1]
+    defconfig = sys.argv[2]
+
+    with open(configfile) as configf:
+        configlines = configf.readlines()
+
+    defconfiglines = []
+    with open(defconfig) as defconfigf:
+        for line in defconfigf.readlines():
+            if line.startswith("BR2_"):
+                defconfiglines.append(line)
+
+    # Check that all the defconfig lines are still present
+    for defconfigline in defconfiglines:
+        if defconfigline not in configlines:
+            print("WARN: defconfig can't be used\n")
+            print("      Missing: %s\n" % defconfigline.strip())
+            return False
+
+    return True
+
+
+if __name__ == "__main__":
+    main()
-- 
2.25.3
