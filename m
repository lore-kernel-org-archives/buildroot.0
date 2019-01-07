From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:41 +0100
Subject: [Buildroot] [PATCH 19/19] core: add optional failure when 2+
 packages touch the same file
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <c7478b1fd1c92508f346f1a8626374d742c9c327.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For top-level parallel build, we will really want to avoid the situation
where two packages touch the same file. The two problematic situations
being:

  - different packages install different content for a file, so we would
    not know which to provide: currently build ordering guarantees the
    content to be reproducible (i.e. last wins), but with parallel
    builds, we may lose such a guarantee;

  - pacakge update an existing file, e.g. by registering new content to
    it: currently, build ordering again guarantees that the file is
    properly expanded by successive packages, but with top-level
    parallel build, that would not longer be the case.

Consequently, we can't accept that two packages touch the same file.

We currently only warn about the situation, but we have no real hard
numbers about how many packages are affected and cause the issue.

Add a user-settable option (mostly for the autobuilders for now) to turn
the warning into a hard error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                        |  8 ++++++++
 Makefile                         | 10 +++++++---
 support/scripts/check-uniq-files | 12 ++++++++++--
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index f965e9d6d8..d424ea6b0b 100644
--- a/Config.in
+++ b/Config.in
@@ -677,6 +677,14 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  and external toolchain backends (through the toolchain
 	  wrapper).
 
+config BR2_UNIQ_FILES
+	bool "Forbid two packages from touching the same files"
+	help
+	  By default, Buildroot will detect and warn when two packages
+	  (or more) touch the same files.
+
+	  Say 'y' here to turn the warning into an error.
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
diff --git a/Makefile b/Makefile
index cc9ac91647..cc135e0ad3 100644
--- a/Makefile
+++ b/Makefile
@@ -703,6 +703,10 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+ifeq ($(BR2_UNIQ_FILES),y)
+UNIQ_FILES_OPTS = --fail
+endif
+
 $(TARGETS_ROOTFS): target-finalize
 
 # Avoid the rootfs name leaking down the dependency chain
@@ -712,7 +716,7 @@ target-finalize: ROOTFS=
 host-finalize: $(HOST_DIR_SYMLINK)
 	# Check files that are touched by more than one package
 	./support/scripts/check-uniq-files \
-		-t host -d $(HOST_DIR) \
+		-t host -d $(HOST_DIR) $(UNIQ_FILES_OPTS) \
 		$(BUILD_DIR)/packages-file-list-host.txt
 
 .PHONY: staging-finalize
@@ -720,7 +724,7 @@ staging-finalize:
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 	# Check files that are touched by more than one package
 	./support/scripts/check-uniq-files \
-		-t staging -d $(STAGING_DIR) \
+		-t staging -d $(STAGING_DIR) $(UNIQ_FILES_OPTS) \
 		$(BUILD_DIR)/packages-file-list-staging.txt
 
 .PHONY: target-finalize
@@ -790,7 +794,7 @@ endif
 
 	# Check files that are touched by more than one package
 	./support/scripts/check-uniq-files \
-		-t target -d $(TARGET_DIR) \
+		-t target -d $(TARGET_DIR) $(UNIQ_FILES_OPTS) \
 		$(BUILD_DIR)/packages-file-list.txt
 
 	touch $(TARGET_DIR)/usr
diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index 3b33626c73..4507cda4a8 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -6,7 +6,7 @@ import os.path
 from collections import defaultdict
 from brpkgutil import parse_pkg_file_list as parse_pkg_file_list
 
-warn = 'Warning: {0} file "{1}" is touched by more than one package: {2}\n'
+warn = '{0}: {1} file "{2}" is touched by more than one package: {3}\n'
 
 
 # If possible, try to decode the binary string s with the user's locale.
@@ -27,6 +27,8 @@ def main():
                         help='Report as a TYPE file (TYPE is either target, staging, or host)')
     parser.add_argument('-d', '--dir', metavar="DIR", required=True,
                         help='Directory used as base (target/, staging/ or host/))')
+    parser.add_argument('-f', '--fail', action='store_true',
+                        help='Fail if a file is touched by more than one package')
 
     args = parser.parse_args()
 
@@ -36,6 +38,7 @@ def main():
         file_to_pkg[record['file']].add(record['pkg'])
         file_md5[record['file']].add(record['md5'])
 
+    ret = 0
     for file in file_to_pkg:
         if len(file_to_pkg[file]) == 1:
             continue
@@ -46,10 +49,15 @@ def main():
         if not os.path.exists(os.path.join(args.dir, file)):
             continue
 
-        sys.stderr.write(warn.format(args.type, str_decode(file),
+        ret = 1 if args.fail else ret
+        sys.stderr.write(warn.format("Error" if args.fail else "Warning",
+                                     args.type,
+                                     str_decode(file),
                                      ", ".join([str_decode(p)
                                                 for p in file_to_pkg[file]])))
 
+    return ret
+
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.14.1
