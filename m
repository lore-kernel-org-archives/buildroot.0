From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:27 +0200
Subject: [Buildroot] [PATCH 1/9] support/scripts: Turn CVE check into a
 module
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-2-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be able to do CVE checking outside of pkg-stat, move the
CVE class in a module that can be used by other scripts.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve.py    | 141 ++++++++++++++++++++++++++++++++++++++
 support/scripts/pkg-stats | 115 +------------------------------
 2 files changed, 144 insertions(+), 112 deletions(-)
 create mode 100755 support/scripts/cve.py

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
new file mode 100755
index 0000000000..874ab4482d
--- /dev/null
+++ b/support/scripts/cve.py
@@ -0,0 +1,141 @@
+#!/usr/bin/env python
+
+# Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+# Copyright (C) 2020 by Gregory CLEMENT <gregory.clement@bootlin.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+import datetime
+import os
+import re
+import requests  # URL checking
+import json
+import ijson
+import distutils.version
+import time
+import gzip
+import sys
+
+sys.path.append('utils/')
+
+NVD_START_YEAR = 2002
+NVD_JSON_VERSION = "1.0"
+NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
+
+class CVE:
+    """An accessor class for CVE Items in NVD files"""
+    def __init__(self, nvd_cve):
+        """Initialize a CVE from its NVD JSON representation"""
+        self.nvd_cve = nvd_cve
+
+    @staticmethod
+    def download_nvd_year(nvd_path, year):
+        metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
+        path_metaf = os.path.join(nvd_path, metaf)
+        jsonf_gz = "nvdcve-%s-%s.json.gz" % (NVD_JSON_VERSION, year)
+        path_jsonf_gz = os.path.join(nvd_path, jsonf_gz)
+
+        # If the database file is less than a day old, we assume the NVD data
+        # locally available is recent enough.
+        if os.path.exists(path_jsonf_gz) and os.stat(path_jsonf_gz).st_mtime >= time.time() - 86400:
+            return path_jsonf_gz
+
+        # If not, we download the meta file
+        url = "%s/%s" % (NVD_BASE_URL, metaf)
+        print("Getting %s" % url)
+        page_meta = requests.get(url)
+        page_meta.raise_for_status()
+
+        # If the meta file already existed, we compare the existing
+        # one with the data newly downloaded. If they are different,
+        # we need to re-download the database.
+        # If the database does not exist locally, we need to redownload it in
+        # any case.
+        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_gz):
+            meta_known = open(path_metaf, "r").read()
+            if page_meta.text == meta_known:
+                return path_jsonf_gz
+
+        # Grab the compressed JSON NVD, and write files to disk
+        url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
+        print("Getting %s" % url)
+        page_json = requests.get(url)
+        page_json.raise_for_status()
+        open(path_jsonf_gz, "wb").write(page_json.content)
+        open(path_metaf, "w").write(page_meta.text)
+        return path_jsonf_gz
+
+    @classmethod
+    def read_nvd_dir(cls, nvd_dir):
+        """
+        Iterate over all the CVEs contained in NIST Vulnerability Database
+        feeds since NVD_START_YEAR. If the files are missing or outdated in
+        nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
+        """
+        for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
+            filename = CVE.download_nvd_year(nvd_dir, year)
+            try:
+                content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
+            except:  # noqa: E722
+                print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
+                raise
+            for cve in content:
+                yield cls(cve['cve'])
+
+    def each_product(self):
+        """Iterate over each product section of this cve"""
+        for vendor in self.nvd_cve['affects']['vendor']['vendor_data']:
+            for product in vendor['product']['product_data']:
+                yield product
+
+    @property
+    def identifier(self):
+        """The CVE unique identifier"""
+        return self.nvd_cve['CVE_data_meta']['ID']
+
+    @property
+    def pkg_names(self):
+        """The set of package names referred by this CVE definition"""
+        return set(p['product_name'] for p in self.each_product())
+
+    def affects(self, br_pkg):
+        """
+        True if the Buildroot Package object passed as argument is affected
+        by this CVE.
+        """
+        if br_pkg.is_cve_ignored(self.identifier):
+            return False
+
+        for product in self.each_product():
+            if product['product_name'] != br_pkg.name:
+                continue
+
+            for v in product['version']['version_data']:
+                if v["version_affected"] == "=":
+                    if br_pkg.current_version == v["version_value"]:
+                        return True
+                elif v["version_affected"] == "<=":
+                    pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
+                    if not hasattr(pkg_version, "version"):
+                        print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
+                        continue
+                    cve_affected_version = distutils.version.LooseVersion(v["version_value"])
+                    if not hasattr(cve_affected_version, "version"):
+                        print("Cannot parse CVE affected version '%s'" % v["version_value"])
+                        continue
+                    return pkg_version <= cve_affected_version
+                else:
+                    print("version_affected: %s" % v['version_affected'])
+        return False
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c1f41fc9e8..1c941104fe 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -38,9 +38,8 @@ from multiprocessing import Pool
 sys.path.append('utils/')
 from getdeveloperlib import parse_developers  # noqa: E402
 
-NVD_START_YEAR = 2002
-NVD_JSON_VERSION = "1.0"
-NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
+import cve as cvecheck
+
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
@@ -281,114 +280,6 @@ class Package:
             (self.name, self.path, self.is_status_ok('license'),
              self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
 
-
-class CVE:
-    """An accessor class for CVE Items in NVD files"""
-    def __init__(self, nvd_cve):
-        """Initialize a CVE from its NVD JSON representation"""
-        self.nvd_cve = nvd_cve
-
-    @staticmethod
-    def download_nvd_year(nvd_path, year):
-        metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
-        path_metaf = os.path.join(nvd_path, metaf)
-        jsonf_gz = "nvdcve-%s-%s.json.gz" % (NVD_JSON_VERSION, year)
-        path_jsonf_gz = os.path.join(nvd_path, jsonf_gz)
-
-        # If the database file is less than a day old, we assume the NVD data
-        # locally available is recent enough.
-        if os.path.exists(path_jsonf_gz) and os.stat(path_jsonf_gz).st_mtime >= time.time() - 86400:
-            return path_jsonf_gz
-
-        # If not, we download the meta file
-        url = "%s/%s" % (NVD_BASE_URL, metaf)
-        print("Getting %s" % url)
-        page_meta = requests.get(url)
-        page_meta.raise_for_status()
-
-        # If the meta file already existed, we compare the existing
-        # one with the data newly downloaded. If they are different,
-        # we need to re-download the database.
-        # If the database does not exist locally, we need to redownload it in
-        # any case.
-        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_gz):
-            meta_known = open(path_metaf, "r").read()
-            if page_meta.text == meta_known:
-                return path_jsonf_gz
-
-        # Grab the compressed JSON NVD, and write files to disk
-        url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
-        print("Getting %s" % url)
-        page_json = requests.get(url)
-        page_json.raise_for_status()
-        open(path_jsonf_gz, "wb").write(page_json.content)
-        open(path_metaf, "w").write(page_meta.text)
-        return path_jsonf_gz
-
-    @classmethod
-    def read_nvd_dir(cls, nvd_dir):
-        """
-        Iterate over all the CVEs contained in NIST Vulnerability Database
-        feeds since NVD_START_YEAR. If the files are missing or outdated in
-        nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
-        """
-        for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
-            filename = CVE.download_nvd_year(nvd_dir, year)
-            try:
-                content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
-            except:  # noqa: E722
-                print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
-                raise
-            for cve in content:
-                yield cls(cve['cve'])
-
-    def each_product(self):
-        """Iterate over each product section of this cve"""
-        for vendor in self.nvd_cve['affects']['vendor']['vendor_data']:
-            for product in vendor['product']['product_data']:
-                yield product
-
-    @property
-    def identifier(self):
-        """The CVE unique identifier"""
-        return self.nvd_cve['CVE_data_meta']['ID']
-
-    @property
-    def pkg_names(self):
-        """The set of package names referred by this CVE definition"""
-        return set(p['product_name'] for p in self.each_product())
-
-    def affects(self, br_pkg):
-        """
-        True if the Buildroot Package object passed as argument is affected
-        by this CVE.
-        """
-        if br_pkg.is_cve_ignored(self.identifier):
-            return False
-
-        for product in self.each_product():
-            if product['product_name'] != br_pkg.name:
-                continue
-
-            for v in product['version']['version_data']:
-                if v["version_affected"] == "=":
-                    if br_pkg.current_version == v["version_value"]:
-                        return True
-                elif v["version_affected"] == "<=":
-                    pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
-                    if not hasattr(pkg_version, "version"):
-                        print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
-                        continue
-                    cve_affected_version = distutils.version.LooseVersion(v["version_value"])
-                    if not hasattr(cve_affected_version, "version"):
-                        print("Cannot parse CVE affected version '%s'" % v["version_value"])
-                        continue
-                    return pkg_version <= cve_affected_version
-                else:
-                    print("version_affected: %s" % v['version_affected'])
-        return False
-
-
 def get_pkglist(npackages, package_list):
     """
     Builds the list of Buildroot packages, returning a list of Package
@@ -608,7 +499,7 @@ def check_package_cves(nvd_path, packages):
     if not os.path.isdir(nvd_path):
         os.makedirs(nvd_path)
 
-    for cve in CVE.read_nvd_dir(nvd_path):
+    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
             if pkg_name in packages and cve.affects(packages[pkg_name]):
                 packages[pkg_name].cves.append(cve.identifier)
-- 
2.27.0
