From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 22 Feb 2020 09:57:12 +0100
Subject: [Buildroot] [PATCH v3 08/12] support/scripts/pkg-stats: add
 defconfig support
In-Reply-To: <20200222085715.23769-1-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
Message-ID: <20200222085715.23769-9-heiko.thiery@gmail.com>
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
index 36b33586ef..ae70f90485 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -54,6 +54,33 @@ RM_API_STATUS_NOT_FOUND = 4
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
@@ -882,7 +909,7 @@ def dump_html(packages, stats, date, commit, output):
         f.write(html_footer)
 
 
-def dump_json(packages, stats, date, commit, output):
+def dump_json(packages, defconfigs, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
     excluded_fields = ['url_worker', 'name']
@@ -893,6 +920,12 @@ def dump_json(packages, stats, date, commit, output):
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
@@ -903,6 +936,7 @@ def dump_json(packages, stats, date, commit, output):
     # The actual structure to dump, add commit and date to it
     final = {'packages': pkgs,
              'stats': statistics,
+             'defconfigs': defconfigs,
              'commit': commit,
              'date': str(date)}
 
@@ -944,6 +978,10 @@ def __main__():
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
@@ -970,7 +1008,7 @@ def __main__():
         dump_html(packages, stats, date, commit, args.html)
     if args.json:
         print("Write JSON")
-        dump_json(packages, stats, date, commit, args.json)
+        dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
 __main__()
-- 
2.20.1
