From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  2 Feb 2016 14:05:59 +0100
Subject: [Buildroot] [PATCH v3] support/scripts: add size-stats-compare
	script
Message-ID: <1454418359-22799-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Leverage the CSV files produces by size-stats (make graph-size) to allow
for a comparison of rootfs size between two different buildroot
compilations.

The script takes the file-size CSV files of two compilations as input, and
produces a textual report of the differences per package.
Using the -d/--detail flag, the report will show the file size changes
instead of package size changes.
The -t/--threshold option allows to ignore file size differences smaller
or equal than the given threshold (in bytes).

Example output is:

Size difference per package (bytes), threshold = 0
--------------------------------------------------------------------------------
       -8192         busybox
      228572   added dmalloc
      301584   added jq
--------------------------------------------------------------------------------
      521964         TOTAL

or with detailed view:

Size difference per file (bytes), threshold = 0
--------------------------------------------------------------------------------
       -8192         bin/busybox
       18152   added usr/bin/jq
       39252   added usr/bin/dmalloc
       46968   added usr/lib/libdmalloc.so
       47288   added usr/lib/libdmallocxx.so
       47316   added usr/lib/libdmallocth.so
       47748   added usr/lib/libdmallocthcxx.so
      283432   added usr/lib/libjq.so.1.0.4
--------------------------------------------------------------------------------
      521964         TOTAL

---
v3:
- rename this/other to old/new and swap input arguments to match 'diff'-like
  expectations (ThomasP)
- change visual representation
v2:
Addressing Arnout's comments:
- improve help text
- remove references to commits-to-be-backported
- fix references to 'package' while really file or package could be meant
- verify header of CSV file is as expected
- don't print output header for sections that are empty
- use <= instead of < for threshold
- use argparse.Filetype for file path verification
- use positional args for input files
- improve string wrapping
- add reference to script in manual
- ensure Python 3 compatibility
Other changes:
- also print out total size difference
- add docstrings to methods
- add TODO with possible improvements

 docs/manual/common-usage.txt       |  10 +++
 support/scripts/size-stats-compare | 127 +++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100755 support/scripts/size-stats-compare

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 8d0ba63..18677b8 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -317,6 +317,16 @@ The collected filesystem size data is only meaningful after a complete
 clean rebuild. Be sure to run +make clean all+ before using +make
 graph-size+.
 
+To compare the root filesystem size of two different Buildroot compilations,
+for example after adjusting the configuration or when switching to another
+Buildroot release, use the +size-stats-compare+ script. It takes two
++file-size-stats.csv+ files (produced by +make graph-size+) as input.
+Refer to the help text of this script for more details:
+
+----------------
+support/scripts/size-stats-compare -h
+----------------
+
 include::eclipse-integration.txt[]
 
 include::advanced.txt[]
diff --git a/support/scripts/size-stats-compare b/support/scripts/size-stats-compare
new file mode 100755
index 0000000..e5a1ec3
--- /dev/null
+++ b/support/scripts/size-stats-compare
@@ -0,0 +1,127 @@
+#!/usr/bin/env python
+
+# Copyright (C) 2016 Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# TODO (improvements)
+# - support K,M,G size suffixes for threshold
+# - output CSV file in addition to stdout reporting
+
+import csv
+import argparse
+import sys
+
+def read_file_size_csv(inputf, detail=None):
+    """Extract package or file sizes from CSV file into size dictionary"""
+    sizes = {}
+    reader = csv.reader(inputf)
+
+    header = next(reader)
+    if (header[0] != 'File name' or header[1] != 'Package name' or
+        header[2] != 'File size' or header[3] != 'Package size'):
+        print(("Input file %s does not contain the expected header. Are you "
+               "sure this file corresponds to the file-size-stats.csv "
+               "file created by 'make graph-size'?") % inputf.name)
+        sys.exit(1)
+
+    for row in reader:
+        if detail:
+            sizes[row[0]] = int(row[2])
+        else:
+            sizes[row[1]] = int(row[3])
+
+    return sizes
+
+def compare_sizes(old, new):
+    """Return delta/added/removed dictionaries based on two input size
+    dictionaries"""
+    delta = {}
+    oldkeys = set(old.keys())
+    newkeys = set(new.keys())
+
+    # packages/files in both
+    for entry in newkeys.intersection(oldkeys):
+        delta[entry] = ('', new[entry] - old[entry])
+    # packages/files only in new
+    for entry in newkeys.difference(oldkeys):
+        delta[entry] = ('added', new[entry])
+    # packages/files only in old
+    for entry in oldkeys.difference(newkeys):
+        delta[entry] = ('removed', -old[entry])
+
+    return delta
+
+def print_results(result, threshold):
+    """Print the given result dictionary sorted by size, ignoring any entries
+    below or equal to threshold"""
+
+    from six import iteritems
+    list_result = list(iteritems(result))
+    # result is a dictionary: name -> (flag, size difference)
+    # list_result is a list of tuples: (name, (flag, size difference))
+
+    for entry in sorted(list_result, key=lambda entry: entry[1][1]):
+        if threshold is not None and abs(entry[1][1]) <= threshold:
+            continue
+        print('%12s %7s %s' % (entry[1][1], entry[1][0], entry[0]))
+
+
+# main #########################################################################
+
+description = """
+Compare rootfs size between Buildroot compilations, for example after changing
+configuration options or after switching to another Buildroot release.
+
+This script compares the file-size-stats.csv file generated by 'make graph-size'
+with the corresponding file from another Buildroot compilation.
+The size differences can be reported per package or per file.
+Size differences smaller or equal than a given threshold can be ignored.
+"""
+
+parser = argparse.ArgumentParser(description=description,
+                                 formatter_class=argparse.RawDescriptionHelpFormatter)
+
+parser.add_argument('-d', '--detail', action='store_true',
+                    help='''report differences for individual files rather than
+                            packages''')
+parser.add_argument('-t', '--threshold', type=int,
+                    help='''ignore size differences smaller or equal than this
+                            value (bytes)''')
+parser.add_argument('old_file_size_csv', type=argparse.FileType('r'),
+                    metavar='old-file-size-stats.csv',
+                    help="""old CSV file with file and package size statistics,
+                            generated by 'make graph-size'""")
+parser.add_argument('new_file_size_csv', type=argparse.FileType('r'),
+                    metavar='new-file-size-stats.csv',
+                    help='new CSV file with file and package size statistics')
+args = parser.parse_args()
+
+if args.detail:
+    keyword = 'file'
+else:
+    keyword = 'package'
+
+old_sizes = read_file_size_csv(args.old_file_size_csv, args.detail)
+new_sizes = read_file_size_csv(args.new_file_size_csv, args.detail)
+
+delta = compare_sizes(old_sizes, new_sizes)
+
+print('Size difference per %s (bytes), threshold = %s' % (keyword, args.threshold))
+print(80*'-')
+print_results(delta, args.threshold)
+print(80*'-')
+print_results({'TOTAL': ('', sum(new_sizes.values()) - sum(old_sizes.values()))},
+              threshold=None)
-- 
2.4.10
