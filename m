From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 10:05:46 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: URL checking
 support
Message-ID: <20181009081141.7964B8E5C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4da3b2603b08c2a96576b820acfdea65b1dacab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Adds support to check if a package has a URL and if that URL
  is valid by doing a header request.
- Reports this information as part of the generated html output

The URL data is currently gathered from the URL string provided
in the Kconfig help sections for each package.

This check helps ensure the URLs are valid and can be used
for other scripting purposes as the product's home site/URL.
CPE XML generation is an example of a case that could use this
product URL as part of an automated update generation script.

CC: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b7b00e8634..1f983feb5c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -24,8 +24,10 @@ from collections import defaultdict
 import re
 import subprocess
 import sys
+import requests  # URL checking
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
+URL_RE = re.compile("\s*https?://\S*\s*$")
 
 
 class Package:
@@ -43,10 +45,29 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.url = None
+        self.url_status = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
 
+    def set_url(self):
+        """
+        Fills in the .url field
+        """
+        self.url_status = "No Config.in"
+        for filename in os.listdir(os.path.dirname(self.path)):
+            if fnmatch.fnmatch(filename, 'Config.*'):
+                fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
+                for config_line in fp:
+                    if URL_RE.match(config_line):
+                        self.url = config_line.strip()
+                        self.url_status = "Found"
+                        fp.close()
+                        return
+                self.url_status = "Missing"
+                fp.close()
+
     def set_infra(self):
         """
         Fills in the .infras field
@@ -255,6 +276,16 @@ def package_init_make_info():
         Package.all_versions[pkgvar] = value
 
 
+def check_url_status(pkg):
+    if pkg.url_status != "Missing" and pkg.url_status != "No Config.in":
+        try:
+            url_status_code = requests.head(pkg.url, timeout=5).status_code
+            if url_status_code >= 400:
+                pkg.url_status = "Invalid(%s)" % str(url_status_code)
+        except requests.exceptions.RequestException:
+            return
+
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     for pkg in packages:
@@ -311,6 +342,15 @@ td.somepatches {
 td.lotsofpatches {
   background: #ff9a69;
 }
+td.good_url {
+  background: #d2ffc4;
+}
+td.missing_url {
+  background: #ffd870;
+}
+td.invalid_url {
+  background: #ff9a69;
+}
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -422,6 +462,20 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"%s\">%d</td>\n" %
             (" ".join(td_class), pkg.warnings))
 
+    # URL status
+    td_class = ["centered"]
+    url_str = pkg.url_status
+    if pkg.url_status == "Missing" or pkg.url_status == "No Config.in":
+        td_class.append("missing_url")
+    elif pkg.url_status.startswith("Invalid"):
+        td_class.append("invalid_url")
+        url_str = "<a href=%s>%s</a>" % (pkg.url, pkg.url_status)
+    else:
+        td_class.append("good_url")
+        url_str = "<a href=%s>Link</a>" % pkg.url
+    f.write("  <td class=\"%s\">%s</td>\n" %
+            (" ".join(td_class), url_str))
+
     f.write(" </tr>\n")
 
 
@@ -437,6 +491,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
 <td class=\"centered\">Warnings</td>
+<td class=\"centered\">Upstream URL</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -517,6 +572,8 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
+        pkg.set_url()
+        check_url_status(pkg)
     print("Calculate stats")
     stats = calculate_stats(packages)
     print("Write HTML")
