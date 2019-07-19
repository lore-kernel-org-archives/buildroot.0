From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 16:35:56 +0200
Subject: [Buildroot] [PATCH v2 5/5] support/scripts/pkg-stats: add option to
 reduce verbosity
In-Reply-To: <20190719143556.14907-1-victor.huesca@bootlin.com>
References: <20190719143556.14907-1-victor.huesca@bootlin.com>
Message-ID: <20190719143556.14907-6-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having the output flooded by status for all packages may be unnecessary.
This patch add a basic log level and set all print outside of the main
to have lower level.

Running this script with '-q' only prints the main thread while it
default prints all messages.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5b27a806ef..dede8ced9d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -303,7 +303,7 @@ def check_url_status(url, url_status):
 
 def check_package_urls(packages):
     pool = Pool(processes=64)
-    cb = progress_callback(lambda i, n, res, name: print("[%d/%d] (url) Package %s: %s" % (i, n, name, res)), 1, len(packages))
+    cb = progress_callback(lambda i, n, res, name: log(1, "[%d/%d] (url) Package %s: %s" % (i, n, name, res)), 1, len(packages))
     results = [apply_async(pool, check_url_status, (pkg.url, pkg.url_status),
                            callback=cb, cb_args=(pkg.name,)) for pkg in packages]
     for pkg, r in zip(packages, results):
@@ -377,7 +377,7 @@ def check_package_latest_version(packages):
     worker_pool = Pool(processes=64)
     cb = progress_callback(
         lambda i, n, (status, ver, id), name:
-            print("[%d/%d] (version) Package %s: %s" % (i, n, name, id)),
+            log(1, "[%d/%d] (version) Package %s: %s" % (i, n, name, id)),
         1, len(packages))
     results = [apply_async(worker_pool, check_package_latest_version_worker, (http_pool, pkg.name),
                            callback=cb, cb_args=(pkg.name,)) for pkg in packages]
@@ -745,14 +745,26 @@ def parse_args():
                         help='Number of packages')
     packages.add_argument('-p', dest='packages', action='store',
                         help='List of packages (comma separated)')
+    parser.add_argument('-q', dest='quiet', action='count',
+                        help='Avoid flooding, use -qq for being even quieter')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
     return args
 
 
+def log(lvl, *args, **kwargs):
+    '''
+    Print message depending on the log level.
+    Lower level means only print on more versbose log.LEVEL.
+    '''
+    if lvl > log.LEVEL:
+        print(*args, **kwargs)
+
+
 def __main__():
     args = parse_args()
+    log.LEVEL = args.quiet
     if args.packages:
         package_list = args.packages.split(",")
     else:
@@ -760,11 +772,11 @@ def __main__():
     date = datetime.datetime.utcnow()
     commit = subprocess.check_output(['git', 'log', 'master', '-n', '1',
                                       '--pretty=format:%H']).splitlines()[0]
-    print("Build package list ...")
+    log(2, "Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
-    print("Getting package make info ...")
+    log(2, "Getting package make info ...")
     package_init_make_info()
-    print("Getting package details ...")
+    log(2, "Getting package details ...")
     for pkg in packages:
         pkg.set_infra()
         pkg.set_license()
@@ -773,17 +785,17 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
-    print("Checking URL status")
+    log(2, "Checking URL status ...")
     check_package_urls(packages)
-    print("Getting latest versions ...")
+    log(2, "Getting latest versions ...")
     check_package_latest_version(packages)
-    print("Calculate stats")
+    log(2, "Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
-        print("Write HTML")
+        log(2, "Write HTML")
         dump_html(packages, stats, date, commit, args.html)
     if args.json:
-        print("Write JSON")
+        log(2, "Write JSON")
         dump_json(packages, stats, date, commit, args.json)
 
 
-- 
2.21.0
