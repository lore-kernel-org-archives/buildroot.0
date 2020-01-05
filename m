From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  5 Jan 2020 10:23:27 +0100
Subject: [Buildroot] [PATCH v2 5/8] support/scripts/pkg-stats: add package
 status
In-Reply-To: <20200105092329.6288-1-heiko.thiery@gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
Message-ID: <20200105092329.6288-6-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unify the status check information. The status is stored in a tuple. The
first entry is the status that can be 'ok', 'warning' or 'error'. The
second entry is a verbose message.

With that status information the following variables are replaced:
has_license, has_license_files, has_hash, url_status

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 104 +++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 35 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c10eb79a08..ace092cf3b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -57,17 +57,14 @@ class Package:
         self.path = path
         self.infras = None
         self.license = None
-        self.has_license = False
-        self.has_license_files = False
-        self.has_hash = False
         self.patch_count = 0
         self.patch_files = []
         self.warnings = 0
         self.current_version = None
         self.url = None
-        self.url_status = None
         self.url_worker = None
         self.rm_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
+        self.status = {}
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -76,17 +73,17 @@ class Package:
         """
         Fills in the .url field
         """
-        self.url_status = "No Config.in"
+        self.status['url'] = ("warning", "no Config.in")
         for filename in os.listdir(os.path.dirname(self.path)):
             if fnmatch.fnmatch(filename, 'Config.*'):
                 fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
                 for config_line in fp:
                     if URL_RE.match(config_line):
                         self.url = config_line.strip()
-                        self.url_status = "Found"
+                        self.status['url'] = ("ok", "found")
                         fp.close()
                         return
-                self.url_status = "Missing"
+                self.status['url'] = ("warning", "missing")
                 fp.close()
 
     def set_infra(self):
@@ -108,31 +105,43 @@ class Package:
 
     def set_license(self):
         """
-        Fills in the .has_license and .has_license_files fields
+        Fills in the .status['license'] and .status['license-files'] fields
         """
         var = self.pkgvar()
+        self.status['license'] = ("error", "missing")
+        self.status['license-files'] = ("ok", "missing")
         if var in self.all_licenses:
-            self.has_license = True
             self.license = self.all_licenses[var]
+            self.status['license'] = ("ok", "found")
         if var in self.all_license_files:
-            self.has_license_files = True
+            self.status['license-files'] = ("ok", "found")
 
     def set_hash_info(self):
         """
-        Fills in the .has_hash field
+        Fills in the .status['hash'] field
         """
         hashpath = self.path.replace(".mk", ".hash")
-        self.has_hash = os.path.exists(hashpath)
+        if os.path.exists(hashpath):
+            self.status['hash'] = ("ok", "found")
+        else:
+            self.status['hash'] = ("error", "missing")
 
     def set_patch_count(self):
         """
-        Fills in the .patch_count field
+        Fills in the .patch_count, .patch_files and .status['patches'] fields
         """
         pkgdir = os.path.dirname(self.path)
         for subdir, _, _ in os.walk(pkgdir):
             self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
             self.patch_count = len(self.patch_files)
 
+        if self.patch_count == 0:
+            self.status['patches'] = ("ok", "no patches")
+        elif self.patch_count < 5:
+            self.status['patches'] = ("warning", "some patches")
+        else:
+            self.status['patches'] = ("error", "lots of patches")
+
     def set_current_version(self):
         """
         Fills in the .current_version field
@@ -143,10 +152,11 @@ class Package:
 
     def set_check_package_warnings(self):
         """
-        Fills in the .warnings field
+        Fills in the .warnings and .status['pkg-check'] fields
         """
         cmd = ["./utils/check-package"]
         pkgdir = os.path.dirname(self.path)
+        self.status['pkg-check'] = ("error", "Missing")
         for root, dirs, files in os.walk(pkgdir):
             for f in files:
                 if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
@@ -157,17 +167,28 @@ class Package:
             m = re.match("^([0-9]*) warnings generated", line)
             if m:
                 self.warnings = int(m.group(1))
+                if self.warnings == 0:
+                    self.status['pkg-check'] = ("ok", "no warnings")
+                else:
+                    self.status['pkg-check'] = ("error", "{} warnings".format(self.warnings))
                 return
 
     def set_developers(self, developers):
         """
-        Fills in the .developers field
+        Fills in the .developers and .status['developers'] field
         """
         self.developers = list()
+        self.status['developers'] = ("warning", "no developers")
         for dev in developers:
             if dev.hasfile(self.path):
                 self.developers.append((dev.name))
 
+        if self.developers:
+            self.status['developers'] = ("ok", "{} developers".format(len(self.developers)))
+
+    def is_status_ok(self, name):
+        return self.status[name][0] == 'ok'
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -176,7 +197,7 @@ class Package:
 
     def __str__(self):
         return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
-            (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
+            (self.name, self.path, self.is_status_ok('license'), self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
 
 
 def get_pkglist(npackages, package_list):
@@ -279,23 +300,23 @@ def package_init_make_info():
 
 
 def check_url_status_worker(url, url_status):
-    if url_status != "Missing" and url_status != "No Config.in":
+    if url_status[0] == 'ok':
         try:
             url_status_code = requests.head(url, timeout=30).status_code
             if url_status_code >= 400:
-                return "Invalid(%s)" % str(url_status_code)
+                return ("error", "invalid {}".format(url_status_code))
         except requests.exceptions.RequestException:
-            return "Invalid(Err)"
-        return "Ok"
+            return ("error", "invalid (err)")
+        return ("ok", "valid")
     return url_status
 
 
 def check_package_urls(packages):
     Package.pool = Pool(processes=64)
     for pkg in packages:
-        pkg.url_worker = pkg.pool.apply_async(check_url_status_worker, (pkg.url, pkg.url_status))
+        pkg.url_worker = pkg.pool.apply_async(check_url_status_worker, (pkg.url, pkg.status['url']))
     for pkg in packages:
-        pkg.url_status = pkg.url_worker.get(timeout=3600)
+        pkg.status['url'] = pkg.url_worker.get(timeout=3600)
 
 
 def release_monitoring_get_latest_version_by_distro(pool, name):
@@ -369,6 +390,18 @@ def check_package_latest_version(packages):
         pkg.rm_version['status'] = r[0]
         pkg.rm_version['version'] = r[1]
         pkg.rm_version['id'] = r[2]
+
+        if pkg.rm_version['status'] == RM_API_STATUS_ERROR:
+            pkg.status['version'] = ('warning', 'RM API error')
+        elif pkg.rm_version['status'] == RM_API_STATUS_NOT_FOUND:
+            pkg.status['version'] = ('warning', 'RM package not found')
+
+        if pkg.rm_version['version'] is None:
+            pkg.status['version'] = ('warning', 'no upstream version available')
+        elif pkg.rm_version['version'] != pkg.current_version:
+            pkg.status['version'] = ('error', 'package needs update')
+        else:
+            pkg.status['version'] = ('ok', 'up-to-date')
     del http_pool
 
 
@@ -384,15 +417,15 @@ def calculate_stats(packages):
             stats["infra-%s" % infra] += 1
         else:
             stats["infra-unknown"] += 1
-        if pkg.has_license:
+        if pkg.is_status_ok('license'):
             stats["license"] += 1
         else:
             stats["no-license"] += 1
-        if pkg.has_license_files:
+        if pkg.is_status_ok('license-files'):
             stats["license-files"] += 1
         else:
             stats["no-license-files"] += 1
-        if pkg.has_hash:
+        if pkg.is_status_ok('hash'):
             stats["hash"] += 1
         else:
             stats["no-hash"] += 1
@@ -532,30 +565,30 @@ def dump_html_pkg(f, pkg):
 
     # License
     td_class = ["centered"]
-    if pkg.has_license:
+    if pkg.is_status_ok('license'):
         td_class.append("correct")
     else:
         td_class.append("wrong")
     f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), boolean_str(pkg.has_license)))
+            (" ".join(td_class), boolean_str(pkg.is_status_ok('license'))))
 
     # License files
     td_class = ["centered"]
-    if pkg.has_license_files:
+    if pkg.is_status_ok('license-files'):
         td_class.append("correct")
     else:
         td_class.append("wrong")
     f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), boolean_str(pkg.has_license_files)))
+            (" ".join(td_class), boolean_str(pkg.is_status_ok('license-files'))))
 
     # Hash
     td_class = ["centered"]
-    if pkg.has_hash:
+    if pkg.is_status_ok('hash'):
         td_class.append("correct")
     else:
         td_class.append("wrong")
     f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), boolean_str(pkg.has_hash)))
+            (" ".join(td_class), boolean_str(pkg.is_status_ok('hash'))))
 
     # Current version
     if len(pkg.current_version) > 20:
@@ -606,12 +639,13 @@ def dump_html_pkg(f, pkg):
 
     # URL status
     td_class = ["centered"]
-    url_str = pkg.url_status
-    if pkg.url_status == "Missing" or pkg.url_status == "No Config.in":
+    url_str = pkg.status['url'][1]
+    if pkg.status['url'][0] == "warning":
+        td_class.append("missing_url")
+    elif pkg.status['url'][0] == "error":
         td_class.append("missing_url")
-    elif pkg.url_status.startswith("Invalid"):
         td_class.append("invalid_url")
-        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.url_status)
+        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.status['url'][1])
     else:
         td_class.append("good_url")
         url_str = "<a href=%s>Link</a>" % pkg.url
-- 
2.20.1
