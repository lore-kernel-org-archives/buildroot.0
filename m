From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 18 Jul 2019 02:55:15 +0300
Subject: [Buildroot] [RFC 1/1] utils/build-progress: add tool to show build
 progress at runtime
Message-ID: <20190717235515.28725-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This might be useful to watch the amount of built and selected
packages and some progress about it. So added python script which
prints progress and build stats. The sample of output is:

Press Ctrl-C to abort ...

Building: output/qemu_x86_64
 ##################################------------------------------ [ 42.42% 14/33]

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 utils/build-progress | 88 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 utils/build-progress

diff --git a/utils/build-progress b/utils/build-progress
new file mode 100755
index 0000000000..9af9a9af2a
--- /dev/null
+++ b/utils/build-progress
@@ -0,0 +1,88 @@
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
+    print("""Usage: build-progress [-h] [PATH]
+build-progress shows progress about selected and built packages.
+If PATH is no specified then the current working one will be used as
+build output directory.
+
+Example usage:
+ $ build-progress output/qemu_x86_64
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
+            ver = "" if pkg_list[p]["type"] == "rootfs" or \
+                           pkg_list[p]["virtual"] else "-" + pkg_list[p]["version"]
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
+    print("Press Ctrl-C to abort ...\n")
+    print("Building: " + build_dir)
+
+    while not do_exit:
+        ready = 0
+
+        for p in pkgs:
+            if is_pkg_built(build_dir, p):
+                ready = ready + 1
+
+        if ready == total:
+            print("Done")
+            break
+
+        progress(ready, total)
+        time.sleep(1)
+
+try:
+    main()
+except KeyboardInterrupt:
+    do_exit = True
-- 
2.22.0
