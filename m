From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue,  2 Jul 2019 13:52:27 -0500
Subject: [Buildroot] [PATCH 1/1] utils/check-package: Add a quiet flag
Message-ID: <20190702185227.14435-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When running in a CI system, stat messages become white noise. Introduce
an option to suppress non-error, non-warning, messages.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 utils/check-package | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index ce1fe98d67..f09aaeea03 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -33,6 +33,7 @@ def parse_args():
                         default="http://nightly.buildroot.org/",
                         help="default: %(default)s")
     parser.add_argument("--verbose", "-v", action="count", default=0)
+    parser.add_argument("--quiet", "-q", action="count", default=0)
 
     # Now the debug options in the order they are processed.
     parser.add_argument("--include-only", dest="include_list", action="append",
@@ -177,8 +178,10 @@ def __main__():
     # (e.g. counted by 'wc'), so for stats use stderr. Wait all warnings are
     # printed, for the case there are many of them, before printing stats.
     sys.stdout.flush()
-    print("{} lines processed".format(total_lines), file=sys.stderr)
-    print("{} warnings generated".format(total_warnings), file=sys.stderr)
+
+    if not flags.quiet:
+        print("{} lines processed".format(total_lines), file=sys.stderr)
+        print("{} warnings generated".format(total_warnings), file=sys.stderr)
 
     if total_warnings > 0:
         sys.exit(1)
-- 
2.21.0
