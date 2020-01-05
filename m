From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  5 Jan 2020 10:23:30 +0100
Subject: [Buildroot] [PATCH v2 8/8] support/scripts/pkg-stats: add defconfig
 support
In-Reply-To: <20200105092329.6288-1-heiko.thiery@gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
Message-ID: <20200105092329.6288-9-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scan configs directory and create Defconfig objects.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 42 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5f61a095b6..cf5de784cd 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -46,6 +46,33 @@ RM_API_STATUS_NOT_FOUND = 4
 # because it's used by sub-processes.
 http_pool = None
 
+class Defconfig:
+    def __init__(self, name, path):
+        self.name = name
+        self.path = path
+        self.developers = None
+
+    def set_developers(self, developers):
+        """
+        Fills in the .developers field
+        """
+        self.developers = list()
+        for dev in developers:
+            if dev.hasfile(self.path):
+                self.developers.append(dev.name)
+
+def get_defconfig_list():
+     """
+     Builds the list of Buildroot defconfigs, returning a list of Defconfig
+     objects.
+     """
+     defconfigs = list()
+     files = [f for f in os.listdir('configs')]
+     for name in files:
+         d = Defconfig(name[:-10], os.path.join('configs', name))
+         defconfigs.append(d)
+     return defconfigs
+
 
 class Package:
     all_licenses = dict()
@@ -726,7 +753,7 @@ def dump_html(packages, stats, date, commit, output):
         f.write(html_footer)
 
 
-def dump_json(packages, stats, date, commit, output):
+def dump_json(packages, defconfigs, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
     excluded_fields = ['url_worker', 'name']
@@ -737,6 +764,12 @@ def dump_json(packages, stats, date, commit, output):
             if k not in excluded_fields
         } for pkg in packages
     }
+    defconfigs = {
+        d.name: {
+            k: v
+            for k, v in d.__dict__.items()
+        } for d in defconfigs
+    }
     # Aggregate infrastructures into a single dict entry
     statistics = {
         k: v
@@ -747,6 +780,7 @@ def dump_json(packages, stats, date, commit, output):
     # The actual structure to dump, add commit and date to it
     final = {'packages': pkgs,
              'stats': statistics,
+             'defconfigs': defconfigs,
              'commit': commit,
              'date': str(date)}
 
@@ -786,6 +820,10 @@ def __main__():
     packages = get_pkglist(args.npackages, package_list)
     print("Getting developers ...")
     developers = parse_developers()
+    print("Build defconfig list ...")
+    defconfigs = get_defconfig_list()
+    for d in defconfigs:
+        d.set_developers(developers)
     print("Getting package make info ...")
     package_init_make_info()
     print("Getting package details ...")
@@ -809,7 +847,7 @@ def __main__():
         dump_html(packages, stats, date, commit, args.html)
     if args.json:
         print("Write JSON")
-        dump_json(packages, stats, date, commit, args.json)
+        dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
 __main__()
-- 
2.20.1
