From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 11 Jul 2019 11:28:02 +0200
Subject: [Buildroot] [PATCH v2] support/script/pkg-stats: add support for
 json output
Message-ID: <20190711092801.6314-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pkg-stats is a great script that get a lot of intersting infos from
buildroot packages. Unfortunatly it is currently designed to output a
static HTML page only. While html is great for human to read, it is a
pain to parse for scripts.

This patch provide a new option to output a JSON file in addition to the
HTML one. This allow other scripts to use all the usefull informations
computed by pkg-stats.

Please note that the old 'output' option has been renamed to 'html'
to distinguish from the new 'json' option. Also the 'npackages' and
'packages' now uses the argparse `mutualy_exclusive` group.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
Changes v1 --> v2:
- Make commit message more explicit
- fix coding style using flake8
---
 support/scripts/pkg-stats | 53 +++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b0be7d919b..1ff3fb2bd1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -23,7 +23,6 @@ import os
 from collections import defaultdict
 import re
 import subprocess
-import sys
 import requests  # URL checking
 import json
 import certifi
@@ -696,22 +695,52 @@ def dump_html(packages, stats, output):
         f.write(html_footer)
 
 
+def dump_json(packages, stats, output):
+    excluded_fields = ['url_worker', 'name']
+    pkgs = {
+        pkg.name: {
+            k: v
+            for k, v in pkg.__dict__.items()
+            if k not in excluded_fields
+        } for pkg in packages
+    }
+    statistics = {
+        k: v
+        for k, v in stats.items()
+        if not k.startswith('infra-')
+    }
+    statistics['infra'] = {k[6:]: v for k, v in stats.items() if k.startswith('infra-')}
+    o = subprocess.check_output(['git', 'log', 'master', '-n', '1', '--pretty=format:%H'])
+    final = {'packages': pkgs,
+             'stats': statistics,
+             'commit': o.splitlines()[0],
+             'date': str(datetime.datetime.utcnow())}
+
+    with open(output, 'w') as f:
+        json.dump(final, f, indent=2, separators=(',', ': '))
+        f.write('\n')
+
+
 def parse_args():
     parser = argparse.ArgumentParser()
-    parser.add_argument('-o', dest='output', action='store', required=True,
+    group1 = parser.add_argument_group('output', 'Output file(s)')
+    group1.add_argument('--html', dest='html', action='store',
                         help='HTML output file')
-    parser.add_argument('-n', dest='npackages', type=int, action='store',
+    group1.add_argument('--json', dest='json', action='store',
+                        help='JSON output file')
+    group2 = parser.add_mutually_exclusive_group()
+    group2.add_argument('-n', dest='npackages', type=int, action='store',
                         help='Number of packages')
-    parser.add_argument('-p', dest='packages', action='store',
+    group2.add_argument('-p', dest='packages', action='store',
                         help='List of packages (comma separated)')
-    return parser.parse_args()
+    args = parser.parse_args()
+    if not args.html and not args.json:
+        parser.error('at least one of --html or --json (or both) is required')
+    return args
 
 
 def __main__():
     args = parse_args()
-    if args.npackages and args.packages:
-        print("ERROR: -n and -p are mutually exclusive")
-        sys.exit(1)
     if args.packages:
         package_list = args.packages.split(",")
     else:
@@ -735,8 +764,12 @@ def __main__():
     check_package_latest_version(packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
-    print("Write HTML")
-    dump_html(packages, stats, args.output)
+    if args.html:
+        print("Write HTML")
+        dump_html(packages, stats, args.html)
+    if args.json:
+        print("Write JSON")
+        dump_json(packages, stats, args.json)
 
 
 __main__()
-- 
2.21.0
