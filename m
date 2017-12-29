From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 14:32:04 +0100
Subject: [Buildroot] [PATCH] core: add optional failure when 2+ packages
 touch the same file
Message-ID: <20171229133204.16887-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For top-level parallel build, we will really want to avoid the situation
where two packages touch the same file.

We currently only warn about the situation, but we have no real hard
numbers about how many packages are affected and cause the issue.

Add a user-settable option (mostly for the autobuilders for now) to turn
the warning into a hard error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                        |  8 ++++++++
 Makefile                         | 10 +++++++---
 support/scripts/check-uniq-files |  9 ++++++++-
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 62d67ce957..2808205454 100644
--- a/Config.in
+++ b/Config.in
@@ -711,6 +711,14 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  toolchain (through the toolchain wrapper and binutils patches)
 	  and external toolchain backends (through the toolchain wrapper).
 
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
index ed5642f8eb..bdf00b6d4f 100644
--- a/Makefile
+++ b/Makefile
@@ -674,15 +674,19 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+ifeq ($(BR2_UNIQ_FILES),y)
+UNIQ_FILES_OPTS = --fail
+endif
+
 $(TARGETS_ROOTFS): target-finalize
 
 .PHONY: target-finalize
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
 	# Check files that are touched by more than one package
-	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
-	./support/scripts/check-uniq-files -t staging $(BUILD_DIR)/packages-file-list-staging.txt
-	./support/scripts/check-uniq-files -t host $(BUILD_DIR)/packages-file-list-host.txt
+	./support/scripts/check-uniq-files $(UNIQ_FILES_OPTS) -t target $(BUILD_DIR)/packages-file-list.txt
+	./support/scripts/check-uniq-files $(UNIQ_FILES_OPTS) -t staging $(BUILD_DIR)/packages-file-list-staging.txt
+	./support/scripts/check-uniq-files $(UNIQ_FILES_OPTS) -t host $(BUILD_DIR)/packages-file-list-host.txt
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index ea5afdb0b3..5144590e44 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -5,7 +5,7 @@ import csv
 import argparse
 from collections import defaultdict
 
-warn = 'Warning: {} file "{}" is touched by more than one package: {}\n'
+warn = 'Error: {} file "{}" is touched by more than one package: {}\n'
 
 def main():
     parser = argparse.ArgumentParser()
@@ -13,6 +13,8 @@ def main():
                     help='The packages-file-list to check from')
     parser.add_argument('-t', '--type', metavar="TYPE",
                         help='Report as a TYPE file (TYPE is either target, staging, or host)')
+    parser.add_argument('-f', '--fail', action='store_false',
+                        help='Fail if a file is touched by more than one package')
 
     args = parser.parse_args()
 
@@ -32,9 +34,14 @@ def main():
             file = row[1]
             file_to_pkg[file].append(pkg)
 
+    ret = True
     for file in file_to_pkg:
         if len(file_to_pkg[file]) > 1:
             sys.stderr.write(warn.format(args.type, file, file_to_pkg[file]))
+            ret = args.fail
+
+    # True means !0, False means 0, so invert to get correct shell exit code
+    return not ret
 
 if __name__ == "__main__":
     sys.exit(main())
-- 
2.11.0
