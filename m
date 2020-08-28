From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 09:14:39 +0200
Subject: [Buildroot] [git commit] support/scripts/cve.py: use the JSON data
 in 1.1 schema
Message-ID: <20200902161637.0E98385EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52ae092046696f099397d3b0a8206262e8203f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 2019, the JSON vulnerability feeds switched their schema from
version 1.0 to 1.1.

The main difference is the removal of the "affects" element that we
were using to check if a package was affected by a CVE.

This information is now available in the "configuration" element which
contains the cpeid as well as properties about the versions
affected. Instead of having a list of the versions affected, with
these properties, it is possible to have a range of versions.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py | 151 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 119 insertions(+), 32 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 59e52f3c73..e812da810c 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -24,6 +24,7 @@ import distutils.version
 import time
 import gzip
 import sys
+import operator
 
 try:
     import ijson
@@ -34,9 +35,18 @@ except ImportError:
 sys.path.append('utils/')
 
 NVD_START_YEAR = 2002
-NVD_JSON_VERSION = "1.0"
+NVD_JSON_VERSION = "1.1"
 NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
 
+ops = {
+    '>=': operator.ge,
+    '>': operator.gt,
+    '<=': operator.le,
+    '<': operator.lt,
+    '=': operator.eq
+}
+
+
 class CVE:
     """An accessor class for CVE Items in NVD files"""
     CVE_AFFECTS = 1
@@ -99,23 +109,86 @@ class CVE:
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
+            for parsed_node in self.parse_node(child):
+                yield parsed_node
+
+        for cpe in node.get('cpe_match', ()):
+            if not cpe['vulnerable']:
+                return
+            vendor, product, version = cpe['cpe23Uri'].split(':')[3:6]
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
+            yield {
+                'vendor': vendor,
+                'product': product,
+                'v_start': v_start,
+                'op_start': op_start,
+                'v_end': v_end,
+                'op_end': op_end
+            }
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
@@ -125,33 +198,47 @@ class CVE:
         if br_pkg.is_cve_ignored(self.identifier):
             return self.CVE_DOESNT_AFFECT
 
-        for product in self.each_product():
-            if product['product_name'] != br_pkg.name:
+        pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
+        if not hasattr(pkg_version, "version"):
+            print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
+            pkg_version = None
+
+        for cpe in self.each_cpe():
+            if cpe['product'] != br_pkg.name:
+                continue
+            if cpe['v_start'] == '-':
+                return self.CVE_AFFECTS
+            if not cpe['v_start'] and not cpe['v_end']:
+                print("No CVE affected version")
                 continue
+            if not pkg_version:
+                continue
+
+            if cpe['v_start']:
+                try:
+                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
+                    inrange = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
+                except TypeError:
+                    return self.CVE_UNKNOWN
+
+                # current package version is before v_start, so we're
+                # not affected by the CVE
+                if not inrange:
+                    continue
+
+            if cpe['v_end']:
+                try:
+                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
+                    inrange = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
+                except TypeError:
+                    return self.CVE_UNKNOWN
+
+                # current package version is after v_end, so we're
+                # not affected by the CVE
+                if not inrange:
+                    continue
+
+            # We're in the version range affected by this CVE
+            return self.CVE_AFFECTS
 
-            for v in product['version']['version_data']:
-                if v["version_affected"] == "=":
-                    if v["version_value"] == "-":
-                        return self.CVE_AFFECTS
-                    elif br_pkg.current_version == v["version_value"]:
-                        return self.CVE_AFFECTS
-                elif v["version_affected"] == "<=":
-                    pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
-                    if not hasattr(pkg_version, "version"):
-                        print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
-                        continue
-                    cve_affected_version = distutils.version.LooseVersion(v["version_value"])
-                    if not hasattr(cve_affected_version, "version"):
-                        print("Cannot parse CVE affected version '%s'" % v["version_value"])
-                        continue
-                    try:
-                        affected = pkg_version <= cve_affected_version
-                    except TypeError:
-                        return self.CVE_UNKNOWN
-                    if affected:
-                        return self.CVE_AFFECTS
-                    else:
-                        return self.CVE_DOESNT_AFFECT
-                else:
-                    print("version_affected: %s" % v['version_affected'])
         return self.CVE_DOESNT_AFFECT
