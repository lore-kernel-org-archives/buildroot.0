From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Mar 2020 15:50:10 +0100
Subject: [Buildroot] [PATCH v4 08/12] support/scripts/pkg-stats: add
 defconfig support
In-Reply-To: <20200302145013.9574-1-heiko.thiery@gmail.com>
References: <20200302145013.9574-1-heiko.thiery@gmail.com>
Message-ID: <20200302145013.9574-9-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scan configs directory and create Defconfig objects.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 43 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1fd306a6d5..432090c251 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -54,6 +54,34 @@ RM_API_STATUS_NOT_FOUND = 4
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
+        self.developers = [
+            developer.name
+            for developer in developers
+            if developer.hasfile(self.path)
+        ]
+
+
+def get_defconfig_list():
+    """
+    Builds the list of Buildroot defconfigs, returning a list of Defconfig
+    objects.
+    """
+    return [
+        Defconfig(name[:-len('_defconfig')], os.path.join('configs', name))
+        for name in os.listdir('configs')
+        if name.endswith('_defconfig')
+    ]
+
 
 class Package:
     all_licenses = dict()
@@ -886,7 +914,7 @@ def dump_html(packages, stats, date, commit, output):
         f.write(html_footer)
 
 
-def dump_json(packages, stats, date, commit, output):
+def dump_json(packages, defconfigs, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
     excluded_fields = ['url_worker', 'name']
@@ -897,6 +925,12 @@ def dump_json(packages, stats, date, commit, output):
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
@@ -907,6 +941,7 @@ def dump_json(packages, stats, date, commit, output):
     # The actual structure to dump, add commit and date to it
     final = {'packages': pkgs,
              'stats': statistics,
+             'defconfigs': defconfigs,
              'commit': commit,
              'date': str(date)}
 
@@ -948,6 +983,10 @@ def __main__():
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
@@ -974,7 +1013,7 @@ def __main__():
         dump_html(packages, stats, date, commit, args.html)
     if args.json:
         print("Write JSON")
-        dump_json(packages, stats, date, commit, args.json)
+        dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
 __main__()
-- 
2.20.1
