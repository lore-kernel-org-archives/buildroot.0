From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:37:02 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: add
 defconfig support
Message-ID: <20200307204505.091DA8FC5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d77ecbad0e1eed3c84201c9634602195afe0d4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Scan configs directory and create Defconfig objects.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 016c2322e6..a15d0ec24b 100755
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
@@ -889,7 +917,7 @@ def dump_html(packages, stats, date, commit, output):
         f.write(html_footer)
 
 
-def dump_json(packages, stats, date, commit, output):
+def dump_json(packages, defconfigs, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
     excluded_fields = ['url_worker', 'name']
@@ -900,6 +928,12 @@ def dump_json(packages, stats, date, commit, output):
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
@@ -910,6 +944,7 @@ def dump_json(packages, stats, date, commit, output):
     # The actual structure to dump, add commit and date to it
     final = {'packages': pkgs,
              'stats': statistics,
+             'defconfigs': defconfigs,
              'commit': commit,
              'date': str(date)}
 
@@ -951,6 +986,10 @@ def __main__():
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
@@ -977,7 +1016,7 @@ def __main__():
         dump_html(packages, stats, date, commit, args.html)
     if args.json:
         print("Write JSON")
-        dump_json(packages, stats, date, commit, args.json)
+        dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
 __main__()
