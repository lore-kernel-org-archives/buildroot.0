From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:28 +0200
Subject: [Buildroot] [PATCH 2/9] support/scripts/cve.py: Switch to JSON 1.1
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-3-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 2019, the JSON vulnerability feeds switched from version 1.0 to
1.1.

The main difference is the removal of the affects element that was
used to check if a package was affected by a CVE.

This information is duplicated in the configuration element which
contains in the end the cpeid as well as properties about the versions
affected. Instead of having a list of the versions affected, with
these properties, it is possible to have a range of versions.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve.py | 119 +++++++++++++++++++++++++++++++++--------
 1 file changed, 96 insertions(+), 23 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 874ab4482d..e911fe0c65 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -31,9 +31,19 @@ import sys
 sys.path.append('utils/')
 
 NVD_START_YEAR = 2002
-NVD_JSON_VERSION = "1.0"
+NVD_JSON_VERSION = "1.1"
 NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
 
+import operator
+
+ops = {
+    '>=' : operator.ge,
+    '>' : operator.gt,
+    '<=' : operator.le,
+    '<' : operator.lt,
+    '=' : operator.eq
+}
+
 class CVE:
     """An accessor class for CVE Items in NVD files"""
     def __init__(self, nvd_cve):
@@ -92,23 +102,83 @@ class CVE:
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
             for cve in content:
-                yield cls(cve['cve'])
+                yield cls(cve)
 
     def each_product(self):
         """Iterate over each product section of this cve"""
-        for vendor in self.nvd_cve['affects']['vendor']['vendor_data']:
+        for vendor in self.nvd_cve['cve']['affects']['vendor']['vendor_data']:
             for product in vendor['product']['product_data']:
                 yield product
 
+    def parse_node(self, node):
+        """
+        Parse the node inside the configurations section to extract the
+        cpe information usefull to know if a product is affected by
+        the CVE. Actually only the product name and the version
+        descriptor are needed, but we also provide the vendor name.
+        """
+
+        # The node containing the cpe entries matching the CVE can also
+        # contain sub-nodes, so we need to manage it.
+        for child in node.get('children', ()):
+            self.parse_node(child)
+
+        for cpe in node.get('cpe_match', ()):
+            if not cpe['vulnerable']:
+                return
+            cpe23 = cpe['cpe23Uri'].split(':')
+            vendor = cpe23[3]
+            product = cpe23[4]
+            version = cpe23[5]
+            op_start = ''
+            op_end = ''
+            v_start = ''
+            v_end = ''
+
+            if version != '*' and version != '-':
+                # Version is defined, this is a '=' match
+                op_start = '='
+                v_start = version
+            elif version == '-':
+                # no version information is available
+                op_start = '='
+                v_start = version
+            else:
+                # Parse start version, end version and operators
+                if 'versionStartIncluding' in cpe:
+                    op_start = '>='
+                    v_start = cpe['versionStartIncluding']
+
+                if 'versionStartExcluding' in cpe:
+                    op_start = '>'
+                    v_start = cpe['versionStartExcluding']
+
+                if 'versionEndIncluding' in cpe:
+                    op_end = '<='
+                    v_end = cpe['versionEndIncluding']
+
+                if 'versionEndExcluding' in cpe:
+                    op_end = '<'
+                    v_end = cpe['versionEndExcluding']
+
+            key =['vendor', 'product', 'v_start', 'op_start', 'v_end', 'op_end']
+            val = [vendor, product, v_start, op_start, v_end, op_end]
+            yield dict(zip(key, val))
+
+    def each_cpe(self):
+        for node in self.nvd_cve['configurations']['nodes']:
+            for cpe in self.parse_node(node):
+                yield cpe
+
     @property
     def identifier(self):
         """The CVE unique identifier"""
-        return self.nvd_cve['CVE_data_meta']['ID']
+        return self.nvd_cve['cve']['CVE_data_meta']['ID']
 
     @property
     def pkg_names(self):
         """The set of package names referred by this CVE definition"""
-        return set(p['product_name'] for p in self.each_product())
+        return set(p['product'] for p in self.each_cpe())
 
     def affects(self, br_pkg):
         """
@@ -118,24 +188,27 @@ class CVE:
         if br_pkg.is_cve_ignored(self.identifier):
             return False
 
-        for product in self.each_product():
-            if product['product_name'] != br_pkg.name:
+        for cpe in self.each_cpe():
+            affected = True
+            if cpe['product'] != br_pkg.name:
+                continue
+            if cpe['v_start'] == '-':
+                return True
+            if not (cpe['v_start'] or cpe['v_end']):
+                print("No CVE affected version")
                 continue
+            pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
+            if not hasattr(pkg_version, "version"):
+                print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
+                continue
+
+            if cpe['v_start']:
+                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
+                    affected = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
 
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
+            if (affected and cpe['v_end']):
+                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
+                    affected = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
+            if (affected):
+                return True
         return False
-- 
2.27.0
