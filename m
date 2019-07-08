From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:22:58 +0200
Subject: [Buildroot] [PATCH] support/script/pkg-stats: add support for json
 output in addition to HTML
Message-ID: <20190708082258.28729-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allow to dump the statistics calculated by script in JSON format.
This allow us to easily reuse this statistics (in particular package version /
upstream version) as JSON parser are available in nearly every language.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 46 +++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b0be7d919b..73717bd893 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -696,22 +696,46 @@ def dump_html(packages, stats, output):
         f.write(html_footer)
 
 
+def dump_json(packages, stats, output):
+    excluded_fields = ['url_worker', 'name']
+    pkgs = { pkg.name: { k: v for k, v in pkg.__dict__.items() if k not in excluded_fields } for pkg in packages }
+    statistics = {
+        k: v
+        for k, v in stats.items()
+        if not k.startswith('infra-')
+    }
+    statistics['infra'] = { k[6:]: v for k, v in stats.items() if k.startswith('infra-') }
+    o = subprocess.check_output(['git', 'log', 'master', '-n', '1', '--pretty=format:%H'])
+    final = { 'packages': pkgs,
+              'stats': statistics,
+              'commit': o.splitlines()[0],
+              'date': str(datetime.datetime.utcnow()) }
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
@@ -735,8 +759,12 @@ def __main__():
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
