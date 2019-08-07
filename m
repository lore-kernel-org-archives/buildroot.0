From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed,  7 Aug 2019 23:35:02 +0300
Subject: [Buildroot] [PATCH 1/1] utils/show-progress: add tool to show build
 progress at runtime
Message-ID: <20190807203502.27269-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This might be useful to watch the amount of built and selected
packages and some progress about it. So added python script which
prints progress and build stats. The sample of output is:

Press Ctrl-C to exit ...

Building: output/qemu_x86_64
 ##################################------------------------------ [ 42.42% 14/33]

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 utils/show-progress | 106 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100755 utils/show-progress

diff --git a/utils/show-progress b/utils/show-progress
new file mode 100755
index 0000000000..1395664696
--- /dev/null
+++ b/utils/show-progress
@@ -0,0 +1,106 @@
+#!/usr/bin/env python
+
+from __future__ import print_function
+import subprocess
+import json
+import time
+import sys
+import os
+
+do_exit = False
+
+class Package:
+    def __init__(self):
+        self.build_dir = ""
+        self.version = ""
+        self.type = ""
+        self.name = ""
+
+    def get_full_name(self):
+        if self.version != "":
+            return self.name + "-" + self.version
+        return self.name
+
+    def is_built(self):
+        return os.path.exists(self.build_dir + "/build/" + \
+                self.get_full_name() + "/.stamp_" + self.type + "_installed")
+
+def usage():
+    print("""Usage: show-progress [-h] PATH
+
+Shows progress about selected and built packages.
+PATH must point to the output folder with generated Makefile.
+
+Example usage:
+ $ show-progress output/qemu_x86_64
+""")
+    sys.exit(0)
+
+def get_pkgs_list(build_dir):
+    cmd = ["make", "-C", build_dir, "-s", "--no-print-directory", "show-info"]
+    results = []
+
+    with open(os.devnull, 'wb') as devnull:
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull,
+                             universal_newlines=True)
+        pkg_list = json.loads(p.communicate()[0])
+
+        for p in pkg_list:
+            if pkg_list[p]["type"] == "rootfs" or pkg_list[p]["virtual"]:
+                continue
+
+            pkg = Package()
+            pkg.version = pkg_list[p]["version"]
+            pkg.build_dir = build_dir
+            pkg.name = p
+
+            if pkg_list[p]["install_images"]:
+                pkg.type = "images"
+            elif pkg_list[p]["install_staging"] and not pkg_list[p]["install_target"]:
+                pkg.type = "staging"
+            else:
+                pkg.type = pkg_list[p]["type"]
+
+            results.append(pkg)
+
+    return results
+
+def progress(ready, total):
+    max_len = 60
+    perc = ready / (total * 1.0)
+    fill = int(round(perc * max_len))
+    line = '#' * fill + '-' * (60 - fill)
+    line = line + '[{:>7.2%} {: >2d}/{}]'.format(perc, ready, total)
+    print('\r', line, end='')
+    sys.stdout.flush()
+
+def main():
+    if "-h" in sys.argv or "--help" in sys.argv or len(sys.argv) == 1:
+        usage()
+
+    build_dir = sys.argv[1]
+
+    pkgs = get_pkgs_list(os.path.realpath(build_dir))
+    total = len(pkgs)
+
+    print("Press Ctrl-C to exit ...\n")
+    print("Building: " + build_dir)
+
+    while not do_exit:
+        ready = 0
+
+        for p in pkgs:
+            if p.is_built():
+                ready = ready + 1
+
+        progress(ready, total)
+        time.sleep(1)
+
+        if ready == total:
+            print("Done")
+            break
+
+try:
+    main()
+except KeyboardInterrupt:
+    do_exit = True
-- 
2.22.0
