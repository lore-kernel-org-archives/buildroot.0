From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 20 Jul 2018 11:42:24 -0700
Subject: [Buildroot] [PATCH] support/scripts/check-uniq-files: run with
 Python 2.6
Message-ID: <33f2f5c9d9cdbb320e52.1532112144@cveaol6qa08.wv.mentorg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support Python 2.6 by switching from argparse (introduced in Python 2.7) to
optparse. Python 2.6 is the version of Python in RHEL6.5.

optparse was deprecated in 2.7, but is still usable, so the script now runs in
more environments.

Backports of argparse to 2.6 are available, but can be impractical to require
on all hosts (e.g. hosts belonging to end-users who are unfamiliar with Python
package management, corporate-managed build hosts where installing packages is
difficult or impossible).

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -281,8 +281,3 @@ if [ -n "$missing_perl_modules" ] ; then
 	echo
 	exit 1
 fi
-
-if ! python -c "import argparse" > /dev/null 2>&1 ; then
-	echo "Your Python installation is not complete enough: argparse module is missing"
-	exit 1
-fi
diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -1,31 +1,31 @@
 #!/usr/bin/env python
 
 import sys
-import argparse
+import optparse
 from collections import defaultdict
 
 warn = 'Warning: {0} file "{1}" is touched by more than one package: {2}\n'
 
 
 def main():
-    parser = argparse.ArgumentParser()
-    parser.add_argument('packages_file_list', nargs='*',
-                        help='The packages-file-list to check from')
-    parser.add_argument('-t', '--type', metavar="TYPE",
+    usage = 'usage: %prog -t TYPE <packages file list>'
+    parser = optparse.OptionParser(usage=usage)
+    parser.add_option('-t', '--type', metavar="TYPE",
                         help='Report as a TYPE file (TYPE is either target, staging, or host)')
 
-    args = parser.parse_args()
+    options, args = parser.parse_args()
 
-    if not len(args.packages_file_list) == 1:
-        sys.stderr.write('No packages-file-list was provided.\n')
+    if not len(args) == 1:
+        sys.stderr.write('No packages file list was provided.\n')
         return False
+    packages_file = args[0]
 
-    if args.type is None:
+    if options.type is None:
         sys.stderr.write('No type was provided\n')
         return False
 
     file_to_pkg = defaultdict(list)
-    with open(args.packages_file_list[0], 'rb') as pkg_file_list:
+    with open(packages_file, 'rb') as pkg_file_list:
         for line in pkg_file_list.readlines():
             pkg, _, file = line.rstrip(b'\n').partition(b',')
             file_to_pkg[file].append(pkg)
@@ -35,12 +35,12 @@ def main():
             # If possible, try to decode the binary strings with
             # the default user's locale
             try:
-                sys.stderr.write(warn.format(args.type, file.decode(),
+                sys.stderr.write(warn.format(options.type, file.decode(),
                                              [p.decode() for p in file_to_pkg[file]]))
             except UnicodeDecodeError:
                 # ... but fallback to just dumping them raw if they
                 # contain non-representable chars
-                sys.stderr.write(warn.format(args.type, file,
+                sys.stderr.write(warn.format(options.type, file,
                                              file_to_pkg[file]))
 
 
