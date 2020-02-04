From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 Feb 2020 22:52:30 +0100
Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: add support for
 CVE reporting
In-Reply-To: <20200204215232.666841-1-thomas.petazzoni@bootlin.com>
References: <20200204215232.666841-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200204215232.666841-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

 - The download_nvd() and download_nvd_year() function implement the
   NVD database downloading.

 - The check_package_cves() function will go through all the CVE
   reports of the NVD database, which has one JSON file per year. For
   each CVE report it will check if we have a package with the same
   name in Buildroot. If we do, then
   check_package_cve_version_affected() verifies if the version in
   Buildroot is affected by the CVE.

 - The statistics are extended with the total number of CVEs, and the
   total number of packages that have at least one CVE pending.

 - The HTML output is extended with these new details. There are no
   changes to the code generating the JSON output because the existing
   code is smart enough to automatically expose the new information.

This development is a collective effort with Titouan Christophe
<titouan.christophe@railnova.eu> and Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 157 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e477828f7b..23e630363b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -26,10 +26,18 @@ import subprocess
 import requests  # URL checking
 import json
 import certifi
+import distutils.version
+import time
+import gzip
+import glob
 from urllib3 import HTTPSConnectionPool
 from urllib3.exceptions import HTTPError
 from multiprocessing import Pool
 
+NVD_START_YEAR = 2002
+NVD_JSON_VERSION = "1.0"
+NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
+
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
 
@@ -47,6 +55,7 @@ class Package:
     all_licenses = list()
     all_license_files = list()
     all_versions = dict()
+    all_ignored_cves = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -61,6 +70,7 @@ class Package:
         self.url = None
         self.url_status = None
         self.url_worker = None
+        self.cves = list()
         self.latest_version = (RM_API_STATUS_ERROR, None, None)
 
     def pkgvar(self):
@@ -152,6 +162,13 @@ class Package:
                 self.warnings = int(m.group(1))
                 return
 
+    def is_cve_ignored(self, cve):
+        """
+        Tells is the CVE is ignored by the package
+        """
+        return self.pkgvar() in self.all_ignored_cves and \
+            cve in self.all_ignored_cves[self.pkgvar()]
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -227,7 +244,7 @@ def get_pkglist(npackages, package_list):
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES"])
     variable_list = variables.splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -261,6 +278,10 @@ def package_init_make_info():
             pkgvar = pkgvar[:-8]
             Package.all_versions[pkgvar] = value
 
+        elif pkgvar.endswith("_IGNORE_CVES"):
+            pkgvar = pkgvar[:-12]
+            Package.all_ignored_cves[pkgvar] = value.split(" ")
+
 
 def check_url_status_worker(url, url_status):
     if url_status != "Missing" and url_status != "No Config.in":
@@ -355,6 +376,49 @@ def check_package_latest_version(packages):
     del http_pool
 
 
+def check_package_cve_version_affected(pkg, versions):
+    for v in versions:
+        if v["version_affected"] == "=":
+            return pkg.current_version == v["version_value"]
+        elif v["version_affected"] == "<=":
+            pkg_version = distutils.version.LooseVersion(pkg.current_version)
+            if not hasattr(pkg_version, "version"):
+                print("Cannot parse package '%s' version '%s'" % (pkg.name, pkg.current_version))
+                continue
+            cve_affected_version = distutils.version.LooseVersion(v["version_value"])
+            if not hasattr(cve_affected_version, "version"):
+                print("Cannot parse CVE affected version '%s'" % v["version_value"])
+                continue
+            return pkg_version < cve_affected_version
+
+    return False
+
+
+def check_package_cve_filter(packages, cve):
+    for vendor_datum in cve['cve']['affects']['vendor']['vendor_data']:
+        for product_datum in vendor_datum['product']['product_data']:
+            cve_pkg_name = product_datum['product_name']
+            for pkg in packages:
+                if cve_pkg_name == pkg.name:
+                    if check_package_cve_version_affected(pkg, product_datum["version"]["version_data"]):
+                        cveid = cve["cve"]["CVE_data_meta"]["ID"]
+                        if not pkg.is_cve_ignored(cveid):
+                            pkg.cves.append(cveid)
+
+
+def check_package_cves_year(packages, nvd_file):
+    cves = json.load(open(nvd_file))
+    for cve in cves["CVE_Items"]:
+        check_package_cve_filter(packages, cve)
+
+
+def check_package_cves(nvd_path, packages):
+    nvd_files = sorted(glob.glob(os.path.join(nvd_path, "nvdcve-%s-*.json" %
+                                              NVD_JSON_VERSION)))
+    for nvd_file in nvd_files:
+        check_package_cves_year(packages, nvd_file)
+
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     for pkg in packages:
@@ -390,6 +454,9 @@ def calculate_stats(packages):
         else:
             stats["version-not-uptodate"] += 1
         stats["patches"] += pkg.patch_count
+        stats["total-cves"] += len(pkg.cves)
+        if len(pkg.cves) != 0:
+            stats["pkg-cves"] += 1
     return stats
 
 
@@ -601,6 +668,17 @@ def dump_html_pkg(f, pkg):
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
 
 
@@ -618,6 +696,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
+<td class=\"centered\">CVEs</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -656,6 +735,10 @@ def dump_html_stats(f, stats):
             stats["version-not-uptodate"])
     f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
             stats["version-unknown"])
+    f.write("<tr><td>Packages affected by CVEs</td><td>%s</td></tr>\n" %
+            stats["pkg-cves"])
+    f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
+            stats["total-cves"])
     f.write("</table>\n")
 
 
@@ -702,6 +785,72 @@ def dump_json(packages, stats, date, commit, output):
         f.write('\n')
 
 
+def download_nvd_year(nvd_path, year):
+    metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
+    path_metaf = os.path.join(nvd_path, metaf)
+
+    # If the meta file is less than a day old, we assume the NVD data
+    # locally available is recent enough.
+    if os.path.exists(path_metaf) and os.stat(path_metaf).st_mtime >= time.time() - 86400:
+        return
+
+    # If not, we download the meta file
+    url = "%s/%s" % (NVD_BASE_URL, metaf)
+    print("Getting %s" % url)
+    r = requests.get(url)
+    meta_new = dict(x.strip().split(':', 1) for x in r.text.splitlines())
+    if os.path.exists(path_metaf):
+        # If the meta file already existed, we compare the existing
+        # one with the data newly downloaded. If they are different,
+        # we need to re-download the database.
+        with open(path_metaf, "r") as f:
+            meta_old = dict(x.strip().split(':', 1) for x in f)
+        needs_download = meta_new != meta_old
+    else:
+        # If the meta file does not exist locally, of course we need
+        # to download the database
+        needs_download = True
+
+    # If we don't need to download the database, bail out
+    if not needs_download:
+        return
+
+    # Write the meta file, possibly overwriting the existing one
+    with open(path_metaf, "w") as f:
+        f.write(r.text)
+
+    # Grab the compressed JSON NVD database
+    jsonf = "nvdcve-%s-%s.json" % (NVD_JSON_VERSION, year)
+    jsonf_gz = jsonf + ".gz"
+    path_jsonf = os.path.join(nvd_path, jsonf)
+    path_jsonf_gz = os.path.join(nvd_path, jsonf_gz)
+    url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
+    print("Getting %s" % url)
+    r = requests.get(url)
+    with open(path_jsonf_gz, "wb") as f:
+        f.write(r.content)
+
+    # Uncompress and write it
+    gz = gzip.GzipFile(path_jsonf_gz)
+    with open(path_jsonf, "w") as f:
+        f.write(gz.read())
+
+    # Remove the temporary compressed file
+    os.unlink(path_jsonf_gz)
+
+
+def download_nvd(nvd_path):
+    if nvd_path is None:
+        print("NVD database path not provided, not checking CVEs")
+        return
+
+    if not os.path.isdir(nvd_path):
+        raise RuntimeError("NVD database path doesn't exist")
+
+    for year in range(NVD_START_YEAR, datetime.date.today().year + 1):
+        download_nvd_year(nvd_path, year)
+
+
 def parse_args():
     parser = argparse.ArgumentParser()
     output = parser.add_argument_group('output', 'Output file(s)')
@@ -714,6 +863,8 @@ def parse_args():
                           help='Number of packages')
     packages.add_argument('-p', dest='packages', action='store',
                           help='List of packages (comma separated)')
+    parser.add_argument('--nvd-path', dest='nvd_path',
+                        help='Path to the local NVD database')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
@@ -729,6 +880,7 @@ def __main__():
     date = datetime.datetime.utcnow()
     commit = subprocess.check_output(['git', 'rev-parse',
                                       'HEAD']).splitlines()[0]
+    download_nvd(args.nvd_path)
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting package make info ...")
@@ -746,6 +898,9 @@ def __main__():
     check_package_urls(packages)
     print("Getting latest versions ...")
     check_package_latest_version(packages)
+    if args.nvd_path:
+        print("CVE")
+        check_package_cves(args.nvd_path, packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
-- 
2.24.1
