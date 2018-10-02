From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  1 Oct 2018 21:37:28 -0500
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: URL checking
 support
Message-ID: <1538447849-46511-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes
v2 -> v3
[Ricardo
 - Fixed flake8 warnings of extra lines and unused variable
 - Adjusted regex to be compiled once and used example to
   simplify finding the url and cleaning up the string
 - Removed checking for help section and instead used the suggested
   improved regex to find the URL.

v1 -> v2
 - Dropped disabling of SSL cert verifing

[Thomas
 - Moved URL report to new column
 - Added color coding
 - Better info on if a package doesn't have a Config.in to search
   or the Config.in is missing the URL
---
 support/scripts/pkg-stats | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b7b00e8..c841e09 100755
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
+<td class=\"centered\">URL</td>
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
-- 
1.9.1
