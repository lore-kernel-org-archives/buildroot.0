From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat,  7 Mar 2020 08:56:26 +0100
Subject: [Buildroot] [PATCH v5 05/12] support/scripts/pkg-stats: add package
 status
In-Reply-To: <20200307075633.7514-1-heiko.thiery@gmail.com>
References: <20200307075633.7514-1-heiko.thiery@gmail.com>
Message-ID: <20200307075633.7514-6-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unify the status check information. The status is stored in a tuple. The
first entry is the status that can be 'ok', 'warning' or 'error'. The
second entry is a verbose message.

The following checks are performed:
- url: status of the URL check
- license: status of the license presence check
- license-files: status of the license file check
- hash: status of the hash file presence check
- patches: status of the patches count check
- pkg-check: status of the check-package script result
- developers: status if a package has developers in the DEVELOPERS file
- version: status of the version check

With that status information the following variables are replaced:
has_license, has_license_files, has_hash, url_status

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 101 ++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 32 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9529ad5c6a..0d4bb13196 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -73,10 +73,10 @@ class Package:
         self.warnings = 0
         self.current_version = None
         self.url = None
-        self.url_status = None
         self.url_worker = None
         self.cves = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
+        self.status = {}
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -85,17 +85,17 @@ class Package:
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
+                self.status['url'] = ("error", "missing")
                 fp.close()
 
     @property
@@ -121,30 +121,42 @@ class Package:
 
     def set_license(self):
         """
-        Fills in the .has_license and .has_license_files fields
+        Fills in the .status['license'] and .status['license-files'] fields
         """
         var = self.pkgvar()
+        self.status['license'] = ("error", "missing")
+        self.status['license-files'] = ("error", "missing")
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
@@ -155,10 +167,11 @@ class Package:
 
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
@@ -169,6 +182,10 @@ class Package:
             m = re.match("^([0-9]*) warnings generated", line.decode())
             if m:
                 self.warnings = int(m.group(1))
+                if self.warnings == 0:
+                    self.status['pkg-check'] = ("ok", "no warnings")
+                else:
+                    self.status['pkg-check'] = ("error", "{} warnings".format(self.warnings))
                 return
 
     def is_cve_ignored(self, cve):
@@ -179,7 +196,7 @@ class Package:
 
     def set_developers(self, developers):
         """
-        Fills in the .developers field
+        Fills in the .developers and .status['developers'] field
         """
         self.developers = [
             dev.name
@@ -187,6 +204,14 @@ class Package:
             if dev.hasfile(self.path)
         ]
 
+        if self.developers:
+            self.status['developers'] = ("ok", "{} developers".format(len(self.developers)))
+        else:
+            self.status['developers'] = ("warning", "no developers")
+
+    def is_status_ok(self, name):
+        return self.status[name][0] == 'ok'
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -195,7 +220,7 @@ class Package:
 
     def __str__(self):
         return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
-            (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
+            (self.name, self.path, self.is_status_ok('license'), self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
 
 
 class CVE:
@@ -409,23 +434,23 @@ def package_init_make_info():
 
 
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
     pool = Pool(processes=64)
     for pkg in packages:
-        pkg.url_worker = pool.apply_async(check_url_status_worker, (pkg.url, pkg.url_status))
+        pkg.url_worker = pool.apply_async(check_url_status_worker, (pkg.url, pkg.status['url']))
     for pkg in packages:
-        pkg.url_status = pkg.url_worker.get(timeout=3600)
+        pkg.status['url'] = pkg.url_worker.get(timeout=3600)
         del pkg.url_worker
     pool.terminate()
 
@@ -499,6 +524,18 @@ def check_package_latest_version(packages):
     results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
     for pkg, r in zip(packages, results):
         pkg.latest_version = dict(zip(['status', 'version', 'id'], r))
+
+        if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
+            pkg.status['version'] = ('warning', "Release Monitoring API error")
+        elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
+            pkg.status['version'] = ('warning', "Package not found on Release Monitoring")
+
+        if pkg.latest_version['version'] is None:
+            pkg.status['version'] = ('warning', "No upstream version available on Release Monitoring")
+        elif pkg.latest_version['version'] != pkg.current_version:
+            pkg.status['version'] = ('error', "The newer version {} is available upstream".format(pkg.latest_version['version']))
+        else:
+            pkg.status['version'] = ('ok', 'up-to-date')
     worker_pool.terminate()
     del http_pool
 
@@ -525,15 +562,15 @@ def calculate_stats(packages):
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
@@ -676,30 +713,30 @@ def dump_html_pkg(f, pkg):
 
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
@@ -750,12 +787,12 @@ def dump_html_pkg(f, pkg):
 
     # URL status
     td_class = ["centered"]
-    url_str = pkg.url_status
-    if pkg.url_status == "Missing" or pkg.url_status == "No Config.in":
+    url_str = pkg.status['url'][1]
+    if pkg.status['url'][0] in ("error", "warning"):
         td_class.append("missing_url")
-    elif pkg.url_status.startswith("Invalid"):
+    if pkg.status['url'][0] == "error":
         td_class.append("invalid_url")
-        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.url_status)
+        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.status['url'][1])
     else:
         td_class.append("good_url")
         url_str = "<a href=%s>Link</a>" % pkg.url
-- 
2.20.1
