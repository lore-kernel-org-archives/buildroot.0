From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:40 +0100
Subject: [Buildroot] [PATCH 18/19] core: ignore non-unique files that have
 disapeared
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <56125b7d30e7ebfc8c455d7cfb4f29528503c0af.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages that install info pages will update the info index when doing
so. But we do not have that file in the target, so we do not care what
content that file has, or whether it is modified by many packages.

This is basically also valid for any file that we remove as part of our
target-finalize cleanups: the files are not in target.

Therefore, check that a file still exists before reporting it as being
touched by more than one package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile                         | 12 +++++++++---
 support/scripts/check-uniq-files |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index aefbdd0e78..cc9ac91647 100644
--- a/Makefile
+++ b/Makefile
@@ -711,13 +711,17 @@ target-finalize: ROOTFS=
 .PHONY: staging-finalize
 host-finalize: $(HOST_DIR_SYMLINK)
 	# Check files that are touched by more than one package
-	./support/scripts/check-uniq-files -t host $(BUILD_DIR)/packages-file-list-host.txt
+	./support/scripts/check-uniq-files \
+		-t host -d $(HOST_DIR) \
+		$(BUILD_DIR)/packages-file-list-host.txt
 
 .PHONY: staging-finalize
 staging-finalize:
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 	# Check files that are touched by more than one package
-	./support/scripts/check-uniq-files -t staging $(BUILD_DIR)/packages-file-list-staging.txt
+	./support/scripts/check-uniq-files \
+		-t staging -d $(STAGING_DIR) \
+		$(BUILD_DIR)/packages-file-list-staging.txt
 
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) host-finalize
@@ -785,7 +789,9 @@ endif
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 	# Check files that are touched by more than one package
-	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
+	./support/scripts/check-uniq-files \
+		-t target -d $(TARGET_DIR) \
+		$(BUILD_DIR)/packages-file-list.txt
 
 	touch $(TARGET_DIR)/usr
 
diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index 2cee95d048..3b33626c73 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -2,6 +2,7 @@
 
 import sys
 import argparse
+import os.path
 from collections import defaultdict
 from brpkgutil import parse_pkg_file_list as parse_pkg_file_list
 
@@ -24,6 +25,8 @@ def main():
                         help='The packages-file-list to check from')
     parser.add_argument('-t', '--type', metavar="TYPE", required=True,
                         help='Report as a TYPE file (TYPE is either target, staging, or host)')
+    parser.add_argument('-d', '--dir', metavar="DIR", required=True,
+                        help='Directory used as base (target/, staging/ or host/))')
 
     args = parser.parse_args()
 
@@ -40,6 +43,9 @@ def main():
         if len(file_md5[file]) == 1:
             continue
 
+        if not os.path.exists(os.path.join(args.dir, file)):
+            continue
+
         sys.stderr.write(warn.format(args.type, str_decode(file),
                                      ", ".join([str_decode(p)
                                                 for p in file_to_pkg[file]])))
-- 
2.14.1
