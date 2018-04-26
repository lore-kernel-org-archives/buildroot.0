From: John Keeping <john@metanate.com>
Date: Thu, 26 Apr 2018 17:27:31 +0100
Subject: [Buildroot] [PATCH] support/scripts/check-uniq-files: ignore
 reinstalled packages
Message-ID: <20180426162731.4710-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a package is rebuilt, then any files it installs will be listed
multiple times in the file list and check-uniq-files will report that
these files are touched by more than one package even though it is the
same package listed multiple times.

Switch to storing the package names in a set so that each package can
only appear once.

Signed-off-by: John Keeping <john@metanate.com>
---
 support/scripts/check-uniq-files | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index fbc6b5d6e7..eb92724e42 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -24,11 +24,11 @@ def main():
         sys.stderr.write('No type was provided\n')
         return False
 
-    file_to_pkg = defaultdict(list)
+    file_to_pkg = defaultdict(set)
     with open(args.packages_file_list[0], 'rb') as pkg_file_list:
         for line in pkg_file_list.readlines():
             pkg, _, file = line.rstrip(b'\n').partition(b',')
-            file_to_pkg[file].append(pkg)
+            file_to_pkg[file].add(pkg)
 
     for file in file_to_pkg:
         if len(file_to_pkg[file]) > 1:
-- 
2.17.0
