From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:41 +0100
Subject: [Buildroot] [PATCH 07/10] support/scripts/cve-checker: show CPE ID
 in results
In-Reply-To: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201104145145.1316167-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory CLEMENT <gregory.clement@bootlin.com>

This commit improves the cve-checker script to show the CPE ID of
packages, if available. For now, it doesn't use CPE IDs to match CVEs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve-checker | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
index ff110fc17c..421202d049 100755
--- a/support/scripts/cve-checker
+++ b/support/scripts/cve-checker
@@ -26,9 +26,10 @@ import cve as cvecheck
 
 
 class Package:
-    def __init__(self, name, version, ignored_cves):
+    def __init__(self, name, version, cpeid, ignored_cves):
         self.name = name
         self.version = version
+        self.cpeid = cpeid
         self.cves = list()
         self.ignored_cves = ignored_cves
 
@@ -106,6 +107,19 @@ def dump_html_pkg(f, pkg):
         f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
     f.write("  </td>\n")
 
+    # CPE ID
+    td_class = ["left"]
+    if pkg.cpeid:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    if pkg.cpeid:
+        f.write("  <code>%s</code>\n" % pkg.cpeid)
+    else:
+        f.write("  N/A\n")
+    f.write("  </td>\n")
+
     f.write(" </tr>\n")
 
 
@@ -116,6 +130,7 @@ def dump_html_all_pkgs(f, packages):
 <td>Package</td>
 <td class=\"centered\">Version</td>
 <td class=\"centered\">CVEs</td>
++<td class=\"centered\">CPE ID</td>
 </tr>
 """)
     for pkg in packages:
@@ -141,6 +156,7 @@ def dump_json(packages, date, output):
         pkg.name: {
             "version": pkg.version,
             "cves": pkg.cves,
+            "cpe-id": pkg.cpeid,
         } for pkg in packages
     }
     # The actual structure to dump, add date to it
@@ -170,7 +186,6 @@ def parse_args():
         parser.error('at least one of --html or --json (or both) is required')
     return args
 
-
 def __main__():
     args = parse_args()
 
@@ -178,7 +193,7 @@ def __main__():
     content = json.load(sys.stdin)
     for item in content:
         pkg = content[item]
-        p = Package(item, pkg.get('version', ''), pkg.get('ignore_cves', ''))
+        p = Package(item, pkg.get('version', ''), pkg.get('cpe-id', None), pkg.get('ignore_cves', ''))
         packages.append(p)
 
     date = datetime.datetime.utcnow()
-- 
2.26.2
