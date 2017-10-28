From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 17:30:59 +0200
Subject: [Buildroot] [PATCH 4/4 v3] core: check files are not touched by
	more than one package
In-Reply-To: <cover.1509204637.git.yann.morin.1998@free.fr>
References: <cover.1509204637.git.yann.morin.1998@free.fr>
Message-ID: <cd4d3c26158a9dc124b3ac584da2c61e004cbc8b.1509204637.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we do nothing about packages that touch the same file: given
a specific configuration, the result is reproducible (even though it
might not be what the user expected) because the build order is
guaranteed.

However, when we later introduce top-level parallel build, we will no
longer be able to guarantee a build order, by the mere way of it being
parallel. Reconcialliting all those modified files will be impossible to
do automatically. The only way will be to refuse such situations.

As a preliminary step, introduce a helper script that detects files that
are being moified by two or more packages, and reports them and the
impacted packages, at the end of the build.

The list being reported at the end of the build will make it prominently
visible in autobuilder results, so we can assess the problem, if any.

Later on, calling that helper script can be done right after the package
installation step, to bail out early.

Thanks Arnout for the pythonist way to write default dictionaries! ;-)

Note: doing it in python rather than a shell script is impressively
faster: where the shell script takes ~1.2s on a minimalist build, the
python script only takes ~0.015s, that is about 80 times faster.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Peter Seiderer <ps.report@gmx.net>

---
Changes v2 -> v3:
  - make it python2 *and* python3 compatible  (Baruch)
  - typoes  (Peter S.)
---
 Makefile                            |  4 ++++
 support/scripts/check-uniq-files.py | 40 +++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100755 support/scripts/check-uniq-files.py

diff --git a/Makefile b/Makefile
index 79db7fe48a..f0b60bae5c 100644
--- a/Makefile
+++ b/Makefile
@@ -679,6 +679,10 @@ $(TARGETS_ROOTFS): target-finalize
 .PHONY: target-finalize
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
+	# Check files that are touched by more than one package
+	./support/scripts/check-uniq-files.py -t target $(BUILD_DIR)/packages-file-list.txt
+	./support/scripts/check-uniq-files.py -t staging $(BUILD_DIR)/packages-file-list-staging.txt
+	./support/scripts/check-uniq-files.py -t host $(BUILD_DIR)/packages-file-list-host.txt
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/support/scripts/check-uniq-files.py b/support/scripts/check-uniq-files.py
new file mode 100755
index 0000000000..615c309491
--- /dev/null
+++ b/support/scripts/check-uniq-files.py
@@ -0,0 +1,40 @@
+#!/usr/bin/env python
+
+import sys
+import csv
+import argparse
+from collections import defaultdict
+
+warn = 'Warnng: {}s file "{}" is touched by more than one package: {}\n'
+
+def main():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('packages_file_list', nargs='*',
+                    help='The packages-file-list to check from')
+    parser.add_argument('-t', '--type', metavar="TYPE",
+                        help='Report as a TYPE file (TYPE is either target, staging, or host)')
+
+    args = parser.parse_args()
+
+    if not len(args.packages_file_list) == 1:
+        sys.stderr.write('No packages-file-list was provided.\n')
+        return False
+
+    if args.type is None:
+        sys.stderr.write('No type was provided\n')
+        return False
+
+    file_to_pkg = defaultdict(list)
+    with open(args.packages_file_list[0], 'r') as pkg_file_list:
+        r = csv.reader(pkg_file_list, delimiter=',')
+        for row in r:
+            pkg = row[0]
+            file = row[1]
+            file_to_pkg[file].append(pkg)
+
+    for file in file_to_pkg:
+        if len(file_to_pkg[file]) > 1:
+            sys.stderr.write(warn.format(args.type, file, file_to_pkg[file]))
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.11.0
