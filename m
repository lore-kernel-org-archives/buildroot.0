From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 18 Jul 2019 10:32:43 +0300
Subject: [Buildroot] [RFC v2 1/1] utils/show-progress: add tool to show
 build progress at runtime
Message-ID: <20190718073243.10767-1-vadim4j@gmail.com>
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

RFC v2:
    1) filter rootfs package type
    2) rename build-progress -> show-progress
    3) check empty version

 utils/show-progress | 91 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100755 utils/show-progress

diff --git a/utils/show-progress b/utils/show-progress
new file mode 100755
index 0000000000..ee1e1da289
--- /dev/null
+++ b/utils/show-progress
@@ -0,0 +1,91 @@
+#!/usr/bin/env python
+
+# Copyright (C) 2019 Vadim Kochan <vadim4j@gmail.com>
+
+import os
+import sys
+import json
+import time
+import logging
+import subprocess
+
+do_exit = False
+
+def usage():
+    print("""Usage: show-progress [-h] [PATH]
+show-progress shows progress about selected and built packages.
+If PATH is no specified then the current working one will be used as
+build output directory.
+
+Example usage:
+ $ show-progress output/qemu_x86_64
+
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
+            if pkg_list[p]["type"] == "rootfs":
+                continue
+
+            ver = "" if pkg_list[p]["virtual"] else pkg_list[p]["version"]
+            ver = "-" + ver if ver != "" else ver
+
+            results.append(p + ver)
+
+    return results
+
+def is_pkg_built(build_dir, p):
+    for s in ["host", "target"]:
+        if os.path.exists(build_dir + "/build/" + p + "/.stamp_" + s + "_installed"):
+            return True
+
+    return False
+
+def progress(ready, total):
+    perc = ready / total
+    fill = round(perc * 80)
+    print('\r', '#' * fill + '-' * (80 - fill), '[{:>7.2%} {}/{} ]'.format(perc, ready, total), end='')
+    sys.stdout.flush()
+
+def main():
+    build_dir = "."
+
+    if "-h" in sys.argv or "--help" in sys.argv:
+        usage()
+
+    if len(sys.argv) > 1:
+        build_dir = sys.argv[1]
+
+    pkgs = get_pkgs_list(build_dir)
+    total = len(pkgs)
+
+    print("Press Ctrl-C to exit ...\n")
+    print("Building: " + build_dir)
+
+    while not do_exit:
+        ready = 0
+
+        for p in pkgs:
+            if is_pkg_built(build_dir, p):
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
