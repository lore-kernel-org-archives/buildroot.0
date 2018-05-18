From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 17 May 2018 22:13:18 -0500
Subject: [Buildroot] [PATCH v5 5/7] support/scripts/cpedb.py: new CPE XML
 helper
In-Reply-To: <1526613200-48452-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1526613200-48452-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1526613200-48452-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python class which consumes a NIST CPE XML and provides helper
functions to access and search the db's data.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
v5
[Ricardo
 - Fixed typo in join/split of cpe str without version
 - Removed extra prints as they aren't needed when we have the
   output reports/stdout
 - Updated v4 comments about general flake formatting cleanup
 - Incorporated parts of patch 1/2 suggestions for optimizations

[Arnout
 - added pre-processing of cpe values into two sets, one with
   and one without version
 - Collectly with Ricardo, decided to move cpe class to this
   seperate script

v1 -> v4
 - No version
---
 support/scripts/cpedb.py | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 support/scripts/cpedb.py

diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
new file mode 100644
index 0000000..77d1d17
--- /dev/null
+++ b/support/scripts/cpedb.py
@@ -0,0 +1,52 @@
+import sys
+import urllib2
+import xmltodict
+import gzip
+from StringIO import StringIO
+
+CPE_XML_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
+
+
+class CPEDB:
+    all_cpedb = dict()
+    all_cpes = set()
+    all_cpes_no_version = set()
+
+    def get_xml_dict(self):
+        print("CPE: Fetching xml manifest...")
+        try:
+            compressed_cpe_file = urllib2.urlopen(CPE_XML_URL)
+            print("CPE: Unzipping xml manifest...")
+            cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
+            print("CPE: Converting xml manifest to dict...")
+            self.all_cpedb = xmltodict.parse(cpe_file)
+
+            for cpe in self.all_cpedb['cpe-list']['cpe-item']:
+                cpe_str = cpe['cpe-23:cpe23-item']['@name']
+                cpe_str_no_version = self.get_cpe_no_version(cpe_str)
+                self.all_cpes.add(cpe_str)
+                self.all_cpes_no_version.add(cpe_str_no_version)
+
+        except urllib2.HTTPError:
+            print("CPE: HTTP Error: %s" % CPE_XML_URL)
+            sys.exit(1)
+        except urllib2.URLError:
+            print("CPE: URL Error: %s" % CPE_XML_URL)
+            sys.exit(1)
+
+    def find_partial(self, cpe_str):
+        cpe_str_no_version = self.get_cpe_no_version(cpe_str)
+        if cpe_str_no_version in self.all_cpes_no_version:
+            return cpe_str_no_version
+
+    def find(self, cpe_str):
+        if cpe_str in self.all_cpes:
+            return cpe_str
+
+    def get_cpe_no_version(self, cpe):
+        return ":".join(cpe.split(":")[:5])
+
+    def get_nvd_url(self, cpe_str):
+        return "https://nvd.nist.gov/products/cpe/search/results?keyword=" + \
+                urllib2.quote(cpe_str) + \
+                "&status=FINAL&orderBy=CPEURI&namingFormat=2.3"
-- 
1.9.1
