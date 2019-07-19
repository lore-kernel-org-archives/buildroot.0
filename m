From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 15:06:30 +0200
Subject: [Buildroot] [PATCH v3 3/3] support/scripts/pkg-stats: factorize
 date and commit
In-Reply-To: <20190719130630.9967-1-victor.huesca@bootlin.com>
References: <20190719130630.9967-1-victor.huesca@bootlin.com>
Message-ID: <20190719130630.9967-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'dump_html' and 'dump_json' both include commit infos as well as the
current date. It make more sense to retrieve these information once.
This patch simply does this factorization.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 478f98fbc2..7dcb2b4cbd 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -678,24 +678,21 @@ def dump_html_stats(f, stats):
     f.write("</table>\n")
 
 
-def dump_gen_info(f):
+def dump_gen_info(f, date, git_commit):
     # Updated on Mon Feb 19 08:12:08 CET 2018, Git commit aa77030b8f5e41f1c53eb1c1ad664b8c814ba032
-    o = subprocess.check_output(["git", "log", "master", "-n", "1", "--pretty=format:%H"])
-    git_commit = o.splitlines()[0]
-    f.write("<p><i>Updated on %s, git commit %s</i></p>\n" %
-            (str(datetime.datetime.utcnow()), git_commit))
+    f.write("<p><i>Updated on %s, git commit %s</i></p>\n" % (str(date), git_commit))
 
 
-def dump_html(packages, stats, output):
+def dump_html(packages, stats, date, commit, output):
     with open(output, 'w') as f:
         f.write(html_header)
         dump_html_all_pkgs(f, packages)
         dump_html_stats(f, stats)
-        dump_gen_info(f)
+        dump_gen_info(f, date, commit)
         f.write(html_footer)
 
 
-def dump_json(packages, stats, output):
+def dump_json(packages, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
     excluded_fields = ['url_worker', 'name']
@@ -717,8 +714,8 @@ def dump_json(packages, stats, output):
     o = subprocess.check_output(["git", "log", "master", "-n", "1", "--pretty=format:%H"])
     final = {'packages': pkgs,
              'stats': statistics,
-             'commit': o.splitlines()[0],
-             'date': str(datetime.datetime.utcnow())}
+             'commit': commit,
+             'date': str(date)}
 
     with open(output, 'w') as f:
         json.dump(final, f, indent=2, separators=(',', ': '))
@@ -749,6 +746,9 @@ def __main__():
         package_list = args.packages.split(",")
     else:
         package_list = None
+    date = datetime.datetime.utcnow()
+    commit = subprocess.check_output(['git', 'log', 'master', '-n', '1',
+                                      '--pretty=format:%H']).splitlines()[0]
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting package make info ...")
@@ -770,10 +770,10 @@ def __main__():
     stats = calculate_stats(packages)
     if args.html:
         print("Write HTML")
-        dump_html(packages, stats, args.html)
+        dump_html(packages, stats, date, commit, args.html)
     if args.json:
         print("Write JSON")
-        dump_json(packages, stats, args.json)
+        dump_json(packages, stats, date, commit, args.json)
 
 
 __main__()
-- 
2.21.0
