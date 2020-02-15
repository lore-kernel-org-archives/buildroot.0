From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 16:49:07 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add support for
 CVE reporting
Message-ID: <20200215153933.51E748E12A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a157be9efac8ba8888e4972f42eda213077152c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit extends the pkg-stats script to grab information about the
CVEs affecting the Buildroot packages.

To do so, it downloads the NVD database from
https://nvd.nist.gov/vuln/data-feeds in JSON format, and processes the
JSON file to determine which of our packages is affected by which
CVE. The information is then displayed in both the HTML output and the
JSON output of pkg-stats.

To use this feature, you have to pass the new --nvd-path option,
pointing to a writable directory where pkg-stats will store the NVD
database. If the local database is less than 24 hours old, it will not
re-download it. If it is more than 24 hours old, it will re-download
only the files that have really been updated by upstream NVD.

Packages can use the newly introduced <pkg>_IGNORE_CVES variable to
tell pkg-stats that some CVEs should be ignored: it can be because a
patch we have is fixing the CVE, or because the CVE doesn't apply in
our case.

From an implementation point of view:

 - A new class CVE implement most of the required functionalities:
   - Downloading the yearly NVD files
   - Reading and extracting relevant data from these files
   - Matching Packages against a CVE

 - The statistics are extended with the total number of CVEs, and the
   total number of packages that have at least one CVE pending.

 - The HTML output is extended with these new details. There are no
   changes to the code generating the JSON output because the existing
   code is smart enough to automatically expose the new information.

This development is a collective effort with Titouan Christophe
<titouan.christophe@railnova.eu> and Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 159 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e477828f7b..920a2be158 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -26,10 +26,17 @@ import subprocess
 import requests  # URL checking
 import json
 import certifi
+import distutils.version
+import time
+import gzip
 from urllib3 import HTTPSConnectionPool
 from urllib3.exceptions import HTTPError
 from multiprocessing import Pool
 
+NVD_START_YEAR = 2002
+NVD_JSON_VERSION = "1.0"
+NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
+
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
 
@@ -47,6 +54,7 @@ class Package:
     all_licenses = list()
     all_license_files = list()
     all_versions = dict()
+    all_ignored_cves = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -61,6 +69,7 @@ class Package:
         self.url = None
         self.url_status = None
         self.url_worker = None
+        self.cves = list()
         self.latest_version = (RM_API_STATUS_ERROR, None, None)
 
     def pkgvar(self):
@@ -152,6 +161,12 @@ class Package:
                 self.warnings = int(m.group(1))
                 return
 
+    def is_cve_ignored(self, cve):
+        """
+        Tells if the CVE is ignored by the package
+        """
+        return cve in self.all_ignored_cves.get(self.pkgvar(), [])
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -163,6 +178,110 @@ class Package:
             (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
 
 
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
+                content = json.load(gzip.GzipFile(filename))
+            except:
+                print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
+                raise
+            for cve in content["CVE_Items"]:
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
+
+
 def get_pkglist(npackages, package_list):
     """
     Builds the list of Buildroot packages, returning a list of Package
@@ -227,7 +346,7 @@ def get_pkglist(npackages, package_list):
 def package_init_make_info():
     # Fetch all variables@once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES"])
     variable_list = variables.splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -261,6 +380,10 @@ def package_init_make_info():
             pkgvar = pkgvar[:-8]
             Package.all_versions[pkgvar] = value
 
+        elif pkgvar.endswith("_IGNORE_CVES"):
+            pkgvar = pkgvar[:-12]
+            Package.all_ignored_cves[pkgvar] = value.split()
+
 
 def check_url_status_worker(url, url_status):
     if url_status != "Missing" and url_status != "No Config.in":
@@ -355,6 +478,16 @@ def check_package_latest_version(packages):
     del http_pool
 
 
+def check_package_cves(nvd_path, packages):
+    if not os.path.isdir(nvd_path):
+        os.makedirs(nvd_path)
+
+    for cve in CVE.read_nvd_dir(nvd_path):
+        for pkg_name in cve.pkg_names:
+            if pkg_name in packages and cve.affects(packages[pkg_name]):
+                packages[pkg_name].cves.append(cve.identifier)
+
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     for pkg in packages:
@@ -390,6 +523,9 @@ def calculate_stats(packages):
         else:
             stats["version-not-uptodate"] += 1
         stats["patches"] += pkg.patch_count
+        stats["total-cves"] += len(pkg.cves)
+        if len(pkg.cves) != 0:
+            stats["pkg-cves"] += 1
     return stats
 
 
@@ -601,6 +737,17 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"%s\">%s</td>\n" %
             (" ".join(td_class), url_str))
 
+    # CVEs
+    td_class = ["centered"]
+    if len(pkg.cves) == 0:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    for cve in pkg.cves:
+        f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
+    f.write("  </td>\n")
+
     f.write(" </tr>\n")
 
 
@@ -618,6 +765,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
+<td class=\"centered\">CVEs</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -656,6 +804,10 @@ def dump_html_stats(f, stats):
             stats["version-not-uptodate"])
     f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
             stats["version-unknown"])
+    f.write("<tr><td>Packages affected by CVEs</td><td>%s</td></tr>\n" %
+            stats["pkg-cves"])
+    f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
+            stats["total-cves"])
     f.write("</table>\n")
 
 
@@ -714,6 +866,8 @@ def parse_args():
                           help='Number of packages')
     packages.add_argument('-p', dest='packages', action='store',
                           help='List of packages (comma separated)')
+    parser.add_argument('--nvd-path', dest='nvd_path',
+                        help='Path to the local NVD database')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
@@ -746,6 +900,9 @@ def __main__():
     check_package_urls(packages)
     print("Getting latest versions ...")
     check_package_latest_version(packages)
+    if args.nvd_path:
+        print("Checking packages CVEs")
+        check_package_cves(args.nvd_path, {p.name: p for p in packages})
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
