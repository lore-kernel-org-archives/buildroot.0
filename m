From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 18:13:19 +0200
Subject: [Buildroot] [git commit] support/scripts: add check-dotconfig.py
Message-ID: <20200727161031.7A40B824EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7385ccab18d037ce37a8e8cac4f71ba1ebe2e383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the same reason as for 50b747f212be2c9c0f7cf10c674ed488d042715c,
we need to check if the generated configuration file (.config)
contains all symbols present in the defconfig file.

If not there is an issue with the defconfig.

This script will be used in .gitlab-ci.yml.

Inspired by is_toolchain_usable() function from genrandconfig:
https://git.busybox.net/buildroot/tree/utils/genrandconfig?h=2020.02#n164

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr:
  - strip defconfig lines when reading them
  - use a generator to read the defconfig lines
  - no need to strip() again when building the missing list
  - testing the list directly, not its len()
  - simply sys.exit(1) in the error condition
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-dotconfig.py | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/support/scripts/check-dotconfig.py b/support/scripts/check-dotconfig.py
new file mode 100755
index 0000000000..f9a416b743
--- /dev/null
+++ b/support/scripts/check-dotconfig.py
@@ -0,0 +1,42 @@
+#!/usr/bin/env python3
+
+# This scripts check that all lines present in the defconfig are
+# still present in the .config
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
+    # strip() to get rid of trailing \n
+    with open(configfile) as configf:
+        configlines = [l.strip() for l in configf.readlines()]
+
+    defconfiglines = []
+    with open(defconfig) as defconfigf:
+        # strip() to get rid of trailing \n
+        for line in (line.strip() for line in defconfigf.readlines()):
+            if line.startswith("BR2_"):
+                defconfiglines.append(line)
+            elif line.startswith('# BR2_') and line.endswith(' is not set'):
+                defconfiglines.append(line)
+
+    # Check that all the defconfig lines are still present
+    missing = [line for line in defconfiglines if line not in configlines]
+
+    if missing:
+        print("WARN: defconfig {} can't be used:".format(defconfig))
+        for m in missing:
+            print("      Missing: {}".format(m))
+        sys.exit(1)
+
+
+if __name__ == "__main__":
+    main()
