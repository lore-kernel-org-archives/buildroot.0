From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Aug 2019 19:18:28 +0200
Subject: [Buildroot] [PATCH 7/9] support/graph-size: add option to report
 size with IEC prefixes
In-Reply-To: <cover.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <7d974d2d24f11c454e59d76f5b22d364a0ed71e1.1566062299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When dealing with embedded devices, storage is more often than not some
kind of flash device, on which the memory is usually counted as powers
of 1024 instead of powers of 1000. As such, people may prefer reports
using IEC prefixes [0] instead of the SI prefixes.

Add an option to that effect.

We use argparse's ability to use custom actions [1] [2], to provide a
set of options that act on a boolean, but has a single help entry and
internally ensures consistency of the settings. We could have been using
the more conventional store_true/stor_false actions instead, but that
would have meant either two help entries, one for each set of options,
and/or some logic after parse_args() to check the validity of the
settings.

[0] https://en.wikipedia.org/wiki/Binary_prefix
[1] https://docs.python.org/2/library/argparse.html#action
[2] https://docs.python.org/2/library/argparse.html#argparse.Action

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 docs/manual/common-usage.txt |  3 +++
 support/scripts/size-stats   | 29 +++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 7e78d350d4..5653e85e12 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -326,6 +326,9 @@ to further control the generated graph. Accepted options are:
   contributing less than 1% are grouped under _Others_. Accepted values
   are in the range `[0.0..1.0]`.
 
+* `--iec`, `--binary`, `--si`, `--decimal`, to use IEC (binary, powers
+  of 1024) or SI (decimal, powers of 1000; the default) prefixes.
+
 .Note
 The collected filesystem size data is only meaningful after a complete
 clean rebuild. Be sure to run +make clean all+ before using +make
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 3454acd681..5bf0ee6e95 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -35,6 +35,7 @@ except ImportError:
 
 
 class Config():
+    iec = False
     size_limit = 0.01
     colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
               '#0068b5', '#f28e00', '#940084', '#97c000']
@@ -132,8 +133,12 @@ def build_package_size(filesdict, builddir):
 #
 def draw_graph(pkgsize, outputf):
     def size2string(sz):
-        divider = 1000.0
-        prefixes = ['', 'k', 'M', 'G', 'T']
+        if Config.iec:
+            divider = 1024.0
+            prefixes = ['', 'Ki', 'Mi', 'Gi', 'Ti']
+        else:
+            divider = 1000.0
+            prefixes = ['', 'k', 'M', 'G', 'T']
         while sz > divider and len(prefixes) > 1:
             prefixes = prefixes[1:]
             sz = sz/divider
@@ -238,6 +243,21 @@ def gen_packages_csv(pkgsizes, outputf):
             wr.writerow([pkg, size, "%.1f" % (float(size) / total * 100)])
 
 
+#
+# Our special action for --iec, --binary, --si, --decimal
+#
+class PrefixAction(argparse.Action):
+    def __init__(self, option_strings, dest, **kwargs):
+        for key in ["type", "nargs"]:
+            if key in kwargs:
+                raise ValueError('"{}" not allowed'.format(key))
+        super(PrefixAction, self).__init__(option_strings, dest, nargs=0,
+                                           type=bool, **kwargs)
+
+    def __call__(self, parser, namespace, values, option_string=None):
+        setattr(namespace, self.dest, option_string in ["--iec", "--binary"])
+
+
 def main():
     parser = argparse.ArgumentParser(description='Draw size statistics graphs')
 
@@ -249,11 +269,16 @@ def main():
                         help="CSV output file with file size statistics")
     parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
                         help="CSV output file with package size statistics")
+    parser.add_argument("--iec", "--binary", "--si", "--decimal",
+                        action=PrefixAction,
+                        help="Use IEC (binary, powers of 1024) or SI (decimal, "
+                             "powers of 1000, the default) prefixes")
     parser.add_argument("--size-limit", "-l", type=float,
                         help='Under this size ratio, files are accounted to ' +
                              'the generic "Other" package. Default: 0.01 (1%%)')
     args = parser.parse_args()
 
+    Config.iec = args.iec
     if args.size_limit is not None:
         if args.size_limit < 0.0 or args.size_limit > 1.0:
             raise ValueError("--size-limit must be in [0.0..1.0]")
-- 
2.20.1
