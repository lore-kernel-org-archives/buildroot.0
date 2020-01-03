From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:45 +0100
Subject: [Buildroot] [PATCH 08/11] support/scripts/pkg-stats: add generic
 package status field
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-9-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Each check stores the status as a tuple: (status, message). The status
value should be one of: 'ok', 'warning', 'error' and the message holds
more verbose information.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 324700adbf..b0c2db2b93 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -112,6 +112,7 @@ class Package:
         self.url_status = None
         self.url_worker = None
         self.rm_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
+        self.status = {}
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -121,6 +122,7 @@ class Package:
         Fills in the .url field
         """
         self.url_status = "No Config.in"
+        self.status['url'] = ("error", "no Config.in")
         for filename in os.listdir(self.pkg_path):
             if fnmatch.fnmatch(filename, 'Config.*'):
                 fp = open(os.path.join(self.pkg_path, filename), "r")
@@ -128,9 +130,11 @@ class Package:
                     if URL_RE.match(config_line):
                         self.url = config_line.strip()
                         self.url_status = "Found"
+                        self.status['url'] = ("ok", "found")
                         fp.close()
                         return
                 self.url_status = "Missing"
+                self.status['url'] = ("error", "missing")
                 fp.close()
 
     def set_infra(self):
@@ -155,11 +159,16 @@ class Package:
         Fills in the .has_license and .has_license_files fields
         """
         var = self.pkgvar()
+        self.status['license'] = ("error", "missing")
+        self.status['license-files'] = ("error", "missing")
         if var in self.all_licenses:
             self.has_license = True
             self.license = self.all_licenses[var]
+            self.status['license'] = ("ok", "found")
+
         if var in self.all_license_files:
             self.has_license_files = True
+            self.status['license-files'] = ("ok", "found")
 
     def set_hash_info(self):
         """
@@ -167,6 +176,10 @@ class Package:
         """
         hashpath = os.path.join(self.pkg_path, self.name + '.hash')
         self.has_hash = os.path.exists(hashpath)
+        if self.has_hash:
+            self.status['hash'] = ("ok", "found")
+        else:
+            self.status['hash'] = ("error", "missing")
 
     def set_patch_count(self):
         """
@@ -176,6 +189,13 @@ class Package:
             self.patches['files'] = fnmatch.filter(os.listdir(subdir), '*.patch')
             self.patches['count'] = len(self.patches['files'])
 
+            if self.patches['count'] == 0:
+                self.status['patches'] = ("ok", "no patches")
+            elif self.patches['count'] < 5:
+                self.status['patches'] = ("warning", "some patches")
+            else:
+                self.status['patches'] = ("error", "lots of patches")
+
     def set_current_version(self):
         """
         Fills in the .current_version field
@@ -197,6 +217,7 @@ class Package:
         Fills in the .warnings field
         """
         cmd = ["./utils/check-package"]
+        self.status['pkg-check'] = ("error", "missing")
         for root, dirs, files in os.walk(self.pkg_path):
             for f in files:
                 if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
@@ -207,6 +228,10 @@ class Package:
             m = re.match("^([0-9]*) warnings generated", line)
             if m:
                 self.warnings = int(m.group(1))
+                if self.warnings == 0:
+                    self.status['pkg-check'] = ("ok", "no warnings")
+                else:
+                    self.status['pkg-check'] = ("error", "{} warnings".format(self.warnings))
                 return
 
     def set_developers(self, developers):
@@ -214,11 +239,15 @@ class Package:
         Fills in the .developers field
         """
         self.developers = list()
+        self.status['developers'] = ("warning", "no developers")
         for dev in developers:
             for f in dev.files:
                 if self.pkg_path[2:] == f[:-1]:
                     self.developers.append((dev.name))
 
+        if self.developers:
+            self.status['developers'] = ("ok", "{} developers".format(len(self.developers)))
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -425,6 +454,19 @@ def check_package_latest_version(packages):
         pkg.rm_version['status'] = r[0]
         pkg.rm_version['version'] = r[1]
         pkg.rm_version['id'] = r[2]
+        pkg.rm_version['version'] == pkg.current_version
+
+        if pkg.rm_version['status'] == RM_API_STATUS_ERROR:
+            pkg.status['version'] = ('warning', 'rm api error')
+        elif pkg.rm_version['status'] == RM_API_STATUS_NOT_FOUND:
+            pkg.status['version'] = ('warning', 'rm package not found')
+
+        if pkg.rm_version['version'] is None:
+            pkg.status['version'] = ('warning', 'no upstream version available')
+        elif pkg.rm_version['version'] != pkg.current_version:
+            pkg.status['version'] = ('error', 'package needs update')
+        else:
+            pkg.status['version'] = ('ok', 'up-to-date')
     del http_pool
 
 
-- 
2.20.1
