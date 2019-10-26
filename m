From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 21:19:07 +0200
Subject: [Buildroot] [git commit] core: drop check-uniq-files
Message-ID: <20191026191234.807B7888E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2496189a4207173e4cd5bbab90256f911175ee57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back a few years ago, when we were starting to think about top-level
parallel build, we were not sure how to deal with packages that
installed the same files, so we wanted to catch the situation to assess
how prevalent that was, before we decided what to do and how to address
it.

However, the trend nowadays is that packages will install in a
per-package target/ (and staging/ and host/), and the final directories
will be assembled in a reproducible (alphabetical) order, so if two
packages install the same file, the last one will win (as is currently
the case).

Besides, check-uniq-files reports loads of spurious errors when packages
get reinstalled (e.g. during development).

Finally, check-uniq-files is the only script called during the build,
that is written in python.

So, get rid of check-uniq-files.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                         |  3 ---
 support/scripts/check-uniq-files | 48 ----------------------------------------
 2 files changed, 51 deletions(-)

diff --git a/Makefile b/Makefile
index ecaae13846..bab34ab9b5 100644
--- a/Makefile
+++ b/Makefile
@@ -737,9 +737,6 @@ staging-finalize:
 target-finalize: $(PACKAGES) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
 	# Check files that are touched by more than one package
-	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
-	./support/scripts/check-uniq-files -t staging $(BUILD_DIR)/packages-file-list-staging.txt
-	./support/scripts/check-uniq-files -t host $(BUILD_DIR)/packages-file-list-host.txt
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
deleted file mode 100755
index fbc6b5d6e7..0000000000
--- a/support/scripts/check-uniq-files
+++ /dev/null
@@ -1,48 +0,0 @@
-#!/usr/bin/env python
-
-import sys
-import argparse
-from collections import defaultdict
-
-warn = 'Warning: {0} file "{1}" is touched by more than one package: {2}\n'
-
-
-def main():
-    parser = argparse.ArgumentParser()
-    parser.add_argument('packages_file_list', nargs='*',
-                        help='The packages-file-list to check from')
-    parser.add_argument('-t', '--type', metavar="TYPE",
-                        help='Report as a TYPE file (TYPE is either target, staging, or host)')
-
-    args = parser.parse_args()
-
-    if not len(args.packages_file_list) == 1:
-        sys.stderr.write('No packages-file-list was provided.\n')
-        return False
-
-    if args.type is None:
-        sys.stderr.write('No type was provided\n')
-        return False
-
-    file_to_pkg = defaultdict(list)
-    with open(args.packages_file_list[0], 'rb') as pkg_file_list:
-        for line in pkg_file_list.readlines():
-            pkg, _, file = line.rstrip(b'\n').partition(b',')
-            file_to_pkg[file].append(pkg)
-
-    for file in file_to_pkg:
-        if len(file_to_pkg[file]) > 1:
-            # If possible, try to decode the binary strings with
-            # the default user's locale
-            try:
-                sys.stderr.write(warn.format(args.type, file.decode(),
-                                             [p.decode() for p in file_to_pkg[file]]))
-            except UnicodeDecodeError:
-                # ... but fallback to just dumping them raw if they
-                # contain non-representable chars
-                sys.stderr.write(warn.format(args.type, file,
-                                             file_to_pkg[file]))
-
-
-if __name__ == "__main__":
-    sys.exit(main())
