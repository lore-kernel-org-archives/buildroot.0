From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  4 Dec 2020 16:45:58 +0100
Subject: [Buildroot] [PATCH v2 2/5] support/scripts/{pkg-stats,
 cve.py}: support CPE ID based matching
In-Reply-To: <20201204154601.125932-1-thomas.petazzoni@bootlin.com>
References: <20201204154601.125932-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201204154601.125932-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit modifies cve.py, as well as its users cve-checker and
pkg-stats to support CPE ID based matching, for packages that have CPE
ID information.

One of the non-trivial thing is that we can't simply iterate over all
CVEs, and then iterate over all our packages to see which packages
have CPE ID information that match the CPEs affected by the
CVE. Indeed, this is an O(n^2) operation.

So instead, we do a pre-filtering of packages potentially affected. In
check_package_cves(), we build a cpe_product_pkgs dict that associates
a CPE product name to the packages that have this CPE product
name. The CPE product name is either derived from the CPE information
provided by the package if available, and otherwise we use the package
name, which is what was used prior to this patch.

And then, when we look at CVEs, we only consider the packages that
have a CPE product name matching the CPE products affected by the
CVEs. This is done in check_package_cve_affects().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py    | 41 +++++++++++++++++++++++++++++++--------
 support/scripts/pkg-stats | 25 +++++++++++++++++-------
 2 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index e7472cd470..6e97ea193f 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -47,6 +47,24 @@ ops = {
 }
 
 
+# Check if two CPE IDs match each other
+def cpe_matches(cpe1, cpe2):
+    cpe1_elems = cpe1.split(":")
+    cpe2_elems = cpe2.split(":")
+
+    remains = filter(lambda x: x[0] not in ["*", "-"] and x[1] not in ["*", "-"] and x[0] != x[1],
+                     zip(cpe1_elems, cpe2_elems))
+    return len(list(remains)) == 0
+
+
+def cpe_product(cpe):
+    return cpe.split(':')[4]
+
+
+def cpe_version(cpe):
+    return cpe.split(':')[5]
+
+
 class CVE:
     """An accessor class for CVE Items in NVD files"""
     CVE_AFFECTS = 1
@@ -134,7 +152,11 @@ class CVE:
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            vendor, product, version = cpe['cpe23Uri'].split(':')[3:6]
+            product = cpe_product(cpe['cpe23Uri'])
+            version = cpe_version(cpe['cpe23Uri'])
+            # ignore when product is '-', which means N/A
+            if product == '-':
+                return
             op_start = ''
             op_end = ''
             v_start = ''
@@ -163,8 +185,7 @@ class CVE:
                     v_end = cpe['versionEndExcluding']
 
             yield {
-                'vendor': vendor,
-                'product': product,
+                'id': cpe['cpe23Uri'],
                 'v_start': v_start,
                 'op_start': op_start,
                 'v_end': v_end,
@@ -182,11 +203,11 @@ class CVE:
         return self.nvd_cve['cve']['CVE_data_meta']['ID']
 
     @property
-    def pkg_names(self):
-        """The set of package names referred by this CVE definition"""
-        return set(p['product'] for p in self.each_cpe())
+    def affected_products(self):
+        """The set of CPE products referred by this CVE definition"""
+        return set(cpe_product(p['id']) for p in self.each_cpe())
 
-    def affects(self, name, version, cve_ignore_list):
+    def affects(self, name, version, cve_ignore_list, cpeid=None):
         """
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
@@ -199,8 +220,12 @@ class CVE:
             print("Cannot parse package '%s' version '%s'" % (name, version))
             pkg_version = None
 
+        # if we don't have a cpeid, build one based on name and version
+        if not cpeid:
+            cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
+
         for cpe in self.each_cpe():
-            if cpe['product'] != name:
+            if not cpe_matches(cpe['id'], cpeid):
                 continue
             if not cpe['v_start'] and not cpe['v_end']:
                 return self.CVE_AFFECTS
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b012e1437a..100c7750d3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -556,17 +556,28 @@ async def check_package_latest_version(packages):
         await asyncio.wait(tasks)
 
 
+def check_package_cve_affects(cve, cpe_product_pkgs):
+    for product in cve.affected_products:
+        if not product in cpe_product_pkgs:
+            continue
+        for pkg in cpe_product_pkgs[product]:
+            if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves, pkg.cpeid) == cve.CVE_AFFECTS:
+                pkg.cves.append(cve.identifier)
+
 def check_package_cves(nvd_path, packages):
     if not os.path.isdir(nvd_path):
         os.makedirs(nvd_path)
 
-    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
-        for pkg_name in cve.pkg_names:
-            if pkg_name in packages:
-                pkg = packages[pkg_name]
-                if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves) == cve.CVE_AFFECTS:
-                    pkg.cves.append(cve.identifier)
+    cpe_product_pkgs = defaultdict(list)
+    for pkg in packages:
+        if pkg.cpeid:
+            cpe_product = cvecheck.cpe_product(pkg.cpeid)
+            cpe_product_pkgs[cpe_product].append(pkg)
+        else:
+            cpe_product_pkgs[pkg.name].append(pkg)
 
+    for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
+        check_package_cve_affects(cve, cpe_product_pkgs)
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -1054,7 +1065,7 @@ def __main__():
     loop.run_until_complete(check_package_latest_version(packages))
     if args.nvd_path:
         print("Checking packages CVEs")
-        check_package_cves(args.nvd_path, {p.name: p for p in packages})
+        check_package_cves(args.nvd_path, packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
-- 
2.28.0
