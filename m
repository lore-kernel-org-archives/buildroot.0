From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 11:10:41 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add support for
 json output
Message-ID: <20190801090801.CD19981378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=500e1d6241afa569269f1d8953bcf9b8d3d5a7a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pkg-stats is a great script that get a lot of interesting info from
buildroot packages. Unfortunately it is currently designed to output a
static HTML page only. While this is great to include on the
buildroot's website, the HTML is not designed to be easily parsable and
thus it is difficult to reuse it in other scripts.

This patch provide a new option to output a JSON file in addition to the
HTML one.

The old 'output' option has been renamed to 'html' to distinguish from
the new 'json' option.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 48 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d65f609d57..478f98fbc2 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -695,16 +695,52 @@ def dump_html(packages, stats, output):
         f.write(html_footer)
 
 
+def dump_json(packages, stats, output):
+    # Format packages as a dictionnary instead of a list
+    # Exclude local field that does not contains real date
+    excluded_fields = ['url_worker', 'name']
+    pkgs = {
+        pkg.name: {
+            k: v
+            for k, v in pkg.__dict__.items()
+            if k not in excluded_fields
+        } for pkg in packages
+    }
+    # Aggregate infrastructures into a single dict entry
+    statistics = {
+        k: v
+        for k, v in stats.items()
+        if not k.startswith('infra-')
+    }
+    statistics['infra'] = {k[6:]: v for k, v in stats.items() if k.startswith('infra-')}
+    # The actual structure to dump, add commit and date to it
+    o = subprocess.check_output(["git", "log", "master", "-n", "1", "--pretty=format:%H"])
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
+    output = parser.add_argument_group('output', 'Output file(s)')
+    output.add_argument('--html', dest='html', action='store',
                         help='HTML output file')
+    output.add_argument('--json', dest='json', action='store',
+                        help='JSON output file')
     packages = parser.add_mutually_exclusive_group()
     packages.add_argument('-n', dest='npackages', type=int, action='store',
                         help='Number of packages')
     packages.add_argument('-p', dest='packages', action='store',
                         help='List of packages (comma separated)')
-    return parser.parse_args()
+    args = parser.parse_args()
+    if not args.html and not args.json:
+        parser.error('at least one of --html or --json (or both) is required')
+    return args
 
 
 def __main__():
@@ -732,8 +768,12 @@ def __main__():
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
