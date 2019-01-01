From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  1 Jan 2019 18:17:28 +0100
Subject: [Buildroot] [PATCH v4] support/scripts/pkg-stats: add latest
 upstream version information
Message-ID: <20190101171729.8012-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds fetching the latest upstream version of each package
from release-monitoring.org.

The fetching process first tries to use the package mappings of the
"Buildroot" distribution [1]. This mapping mechanism allows to tell
release-monitoring.org what is the name of a package in a given
distribution/build-system. For example, the package xutil_util-macros
in Buildroot is named xorg-util-macros on release-monitoring.org. This
mapping can be seen in the section "Mappings" of
https://release-monitoring.org/project/15037/.

If there is no mapping, then it does a regular search, and within the
search results, looks for a package whose name matches the Buildroot
name.

Since release-monitoring.org is a bit slow, we fetch the information
in parallel for several packages using Python multiprocess Pool()
facility. However, even with this, the whole pkg-stats execution, with
both the upstream URL checking (already in pkg-stats) and upstream
version check (added by this patch) takes about 20 minutes.

From an output point of view, the latest version column:

 - Is green when the version in Buildroot matches the latest upstream
   version

 - Is orange when the latest upstream version is unknown because the
   package was not found on release-monitoring.org

 - Is red when the version in Buildroot doesn't match the latest
   upstream version. Note that we are not doing anything smart here:
   we are just testing if the strings are equal or not.

 - The cell contains the link to the project on release-monitoring.org
   if found.

 - The cell indicates if the match was done using a distro mapping, or
   through a regular search.

[1] https://release-monitoring.org/distro/Buildroot/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v3:
- Use Pool(), like is done for the upstream URL checking added by Matt
  Weber
- Use the requests Python module instead of the urllib2 Python module,
  so that we use the same module as the one used for the upstream URL
  checking
- Adjusted to work with the latest pkg-stats code

Changes since v2:
- Use the "timeout" argument of urllib2.urlopen() in order to make
  sure that the requests terminate at some point, even if
  release-monitoring.org is stuck.
- Move a lot of the logic as methods of the Package() class.

Changes since v1:
- Fix flake8 warnings
- Add missing newline in HTML
---
 support/scripts/pkg-stats | 138 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d0b06b1e74..6aa9a85838 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -29,6 +29,7 @@ from multiprocessing import Pool
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile("\s*https?://\S*\s*$")
+RELEASE_MONITORING_API = "http://release-monitoring.org/api"
 
 
 class Package:
@@ -49,6 +50,8 @@ class Package:
         self.url = None
         self.url_status = None
         self.url_worker = None
+        self.version_worker = None
+        self.latest_version = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -139,6 +142,19 @@ class Package:
                 self.warnings = int(m.group(1))
                 return
 
+
+
+    def set_latest_version(self):
+        # We first try by using the "Buildroot" distribution on
+        # release-monitoring.org, if it has a mapping for the current
+        # package name.
+        self.latest_version = self.get_latest_version_by_distro()
+        if self.latest_version == (False, None, None):
+            # If that fails because there is no mapping or because we had a
+            # request timeout, we try to search in all packages for a package
+            # of this name.
+            self.latest_version = self.get_latest_version_by_guess()
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -297,6 +313,65 @@ def check_package_urls(packages):
     for pkg in packages:
         pkg.url_status = pkg.url_worker.get(timeout=3600)
 
+def release_monitoring_get_latest_version_by_distro(name):
+    try:
+        req = requests.get(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", name))
+    except requests.exceptions.RequestException:
+        return (False, None, None)
+
+    if req.status_code != 200:
+        return (False, None, None)
+
+    data = req.json()
+
+    if len(data['versions']) > 0:
+        return (True, data['versions'][0], data['id'])
+    else:
+        return (True, None, data['id'])
+
+def release_monitoring_get_latest_version_by_guess(name):
+    try:
+        req = requests.get(os.path.join(RELEASE_MONITORING_API, "projects", "?pattern=%s" % name))
+    except requests.exceptions.RequestException:
+        return (False, None, None)
+
+    if req.status_code != 200:
+        return (False, None, None)
+
+    data = req.json()
+
+    for p in data['projects']:
+        if p['name'] == name and len(p['versions']) > 0:
+            return (False, p['versions'][0], p['id'])
+
+    return (False, None, None)
+
+def set_version_worker(name, url):
+    v = release_monitoring_get_latest_version_by_distro(name)
+    if v == (False, None, None):
+        v = release_monitoring_get_latest_version_by_guess(name)
+    return v
+
+def check_package_latest_version(packages):
+    """
+    Fills in the .latest_version field of all Package objects
+
+    This field has a special format:
+      (mapping, version, id)
+    with:
+    - mapping: boolean that indicates whether release-monitoring.org
+      has a mapping for this package name in the Buildroot distribution
+      or not
+    - version: string containing the latest version known by
+      release-monitoring.org for this package
+    - id: string containing the id of the project corresponding to this
+      package, as known by release-monitoring.org
+    """
+    Package.pool = Pool(processes=64)
+    for pkg in packages:
+        pkg.version_worker = pkg.pool.apply_async(set_version_worker, (pkg.name, pkg.url))
+    for pkg in packages:
+        pkg.latest_version = pkg.version_worker.get(timeout=3600)
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -322,6 +397,16 @@ def calculate_stats(packages):
             stats["hash"] += 1
         else:
             stats["no-hash"] += 1
+        if pkg.latest_version[0]:
+            stats["rmo-mapping"] += 1
+        else:
+            stats["rmo-no-mapping"] += 1
+        if not pkg.latest_version[1]:
+            stats["version-unknown"] += 1
+        elif pkg.latest_version[1] == pkg.current_version:
+            stats["version-uptodate"] += 1
+        else:
+            stats["version-not-uptodate"] += 1
         stats["patches"] += pkg.patch_count
     return stats
 
@@ -354,6 +439,7 @@ td.somepatches {
 td.lotsofpatches {
   background: #ff9a69;
 }
+
 td.good_url {
   background: #d2ffc4;
 }
@@ -363,6 +449,17 @@ td.missing_url {
 td.invalid_url {
   background: #ff9a69;
 }
+
+td.version-good {
+  background: #d2ffc4;
+}
+td.version-needs-update {
+  background: #ff9a69;
+}
+td.version-unknown {
+ background: #ffd870;
+}
+
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -465,6 +562,34 @@ def dump_html_pkg(f, pkg):
         current_version = pkg.current_version
     f.write("  <td class=\"centered\">%s</td>\n" % current_version)
 
+    # Latest version
+    if pkg.latest_version[1] is None:
+        td_class.append("version-unknown")
+    elif pkg.latest_version[1] != pkg.current_version:
+        td_class.append("version-needs-update")
+    else:
+        td_class.append("version-good")
+
+    if pkg.latest_version[1] is None:
+        latest_version_text = "<b>Unknown</b>"
+    else:
+        latest_version_text = "<b>%s</b>" % str(pkg.latest_version[1])
+
+    latest_version_text += "<br/>"
+
+    if pkg.latest_version[2]:
+        latest_version_text += "<a href=\"https://release-monitoring.org/project/%s\">link</a>, " % pkg.latest_version[2]
+    else:
+        latest_version_text += "no link, "
+
+    if pkg.latest_version[0]:
+        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">mapping</a>"
+    else:
+        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">no mapping</a>"
+
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), latest_version_text))
+
     # Warnings
     td_class = ["centered"]
     if pkg.warnings == 0:
@@ -502,6 +627,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
+<td class=\"centered\">Latest version</td>
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 </tr>
@@ -532,6 +658,16 @@ def dump_html_stats(f, stats):
             stats["no-hash"])
     f.write(" <tr><td>Total number of patches</td><td>%s</td></tr>\n" %
             stats["patches"])
+    f.write("<tr><td>Packages having a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
+            stats["rmo-mapping"])
+    f.write("<tr><td>Packages lacking a mapping on <i>release-monitoring.org</i></td><td>%s</td></tr>\n" %
+            stats["rmo-no-mapping"])
+    f.write("<tr><td>Packages that are up-to-date</td><td>%s</td></tr>\n" %
+            stats["version-uptodate"])
+    f.write("<tr><td>Packages that are not up-to-date</td><td>%s</td></tr>\n" %
+            stats["version-not-uptodate"])
+    f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
+            stats["version-unknown"])
     f.write("</table>\n")
 
 
@@ -587,6 +723,8 @@ def __main__():
         pkg.set_url()
     print("Checking URL status")
     check_package_urls(packages)
+    print("Getting latest versions ...")
+    check_package_latest_version(packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     print("Write HTML")
-- 
2.20.1
