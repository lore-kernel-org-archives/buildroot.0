From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:46 -0500
Subject: [Buildroot] [PATCH 01/14] support/scripts/pkg-stats: URL checking
 support
Message-ID: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Adds support to check if a package has a URL and if that URL
   is valid by doing a header request.
 - Reports this information as part of the generated html output

This check helps ensure the URLs are valid and can be used
for other scripting purposes as the product's home site/URL.
CPE XML generation is an example of a case that could use this
product URL as part of an automated update generation script.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 support/scripts/pkg-stats | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b7b00e8..c83545b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -24,6 +24,8 @@ from collections import defaultdict
 import re
 import subprocess
 import sys
+import time
+import requests  # URL checking
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 
@@ -43,10 +45,30 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.url = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
 
+    def set_url(self):
+        """
+        Fills in the .url field
+        """
+        in_help_section = False
+        self.url = "No Config"
+        for filename in os.listdir(os.path.dirname(self.path)):
+            if fnmatch.fnmatch(filename, 'Config.*'):
+                fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
+                for config_line in fp:
+                    if config_line.strip() == "help":
+                        in_help_section = True
+                    if in_help_section and re.match("(.*)https?://", config_line):
+                        self.url = ''.join(config_line.split())
+                        fp.close()
+                        return
+                self.url = "Missing Entry"
+                fp.close()
+
     def set_infra(self):
         """
         Fills in the .infras field
@@ -356,7 +378,19 @@ def boolean_str(b):
 
 def dump_html_pkg(f, pkg):
     f.write(" <tr>\n")
-    f.write("  <td>%s</td>\n" % pkg.path[2:])
+    url_status = "Ok"
+    if str(pkg.url) == "Missing Entry":
+        f.write("  <td>%s<br>    (URL: Missing URL)</td>\n" % pkg.path[2:])
+    elif str(pkg.url) == "No Config":
+        f.write("  <td>%s<br>    (URL: No Config File)</td>\n" % pkg.path[2:])
+    else:
+        try:
+            url_status_code = requests.head(pkg.url, verify=False).status_code
+            if url_status_code > 308:
+                url_status = "Error(" + str(url_status_code) + ")"
+        except requests.exceptions.RequestException as e:
+            url_status = e
+        f.write("  <td>%s<br>    (<a href=%s>URL: %s</a>)</td>\n" % (pkg.path[2:], str(pkg.url), url_status))
 
     # Patch count
     td_class = ["centered"]
@@ -511,6 +545,7 @@ def __main__():
     package_init_make_info()
     print("Getting package details ...")
     for pkg in packages:
+        pkg.set_url()
         pkg.set_infra()
         pkg.set_license()
         pkg.set_hash_info()
-- 
1.9.1
