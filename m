From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:40 +0200
Subject: [Buildroot] [PATCH 07/17] support/scripts/cpedb.py: new CPE XML
 helper
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-8-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Python class which consumes a NIST CPE XML and provides helper
functions to access and search the db's data.

 - Defines the CPE as a object with operations / formats
 - Processing of CPE dictionary

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/scripts/cpedb.py | 185 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)
 create mode 100644 support/scripts/cpedb.py

diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
new file mode 100644
index 0000000000..0369536f6f
--- /dev/null
+++ b/support/scripts/cpedb.py
@@ -0,0 +1,185 @@
+import sys
+import urllib2
+from collections import OrderedDict
+import xmltodict
+import gzip
+from StringIO import StringIO
+import os
+import pickle
+
+VALID_REFS = ['VENDOR', 'VERSION', 'CHANGE_LOG', 'PRODUCT', 'PROJECT', 'ADVISORY']
+
+
+class CPE:
+    cpe_str = None
+    cpe_str_short = None
+    cpe_desc = None
+    cpe_cur_ver = None
+    titles = {}
+    references = {}
+
+    def __init__(self, cpe_str, titles=None, refs=None):
+        self.cpe_str = cpe_str
+        self.cpe_str_short = ":".join(self.cpe_str.split(":")[:6])
+        self.titles = titles
+        self.references = refs
+        self.cpe_cur_ver = "".join(self.cpe_str.split(":")[5:6])
+
+    def to_dict(self, cpe_str):
+        cpe_short_name = ":".join(cpe_str.split(":")[2:6])
+        cpe_new_ver = "".join(cpe_str.split(":")[5:6])
+        self.titles[0]['#text'] = self.titles[0]['#text'].replace(self.cpe_cur_ver, cpe_new_ver)
+        cpe_dict = OrderedDict([
+            ('cpe-item', OrderedDict([
+                ('@name', 'cpe:/' + cpe_short_name),
+                ('title', self.titles),
+                ('references', OrderedDict([('reference', self.references)])),
+                ('cpe-23:cpe23-item', OrderedDict([
+                        ('@name', cpe_str)
+                ]))
+            ]))
+        ])
+        return cpe_dict
+
+
+class CPEDB:
+    all_cpes = dict()
+    all_cpes_no_version = dict()
+
+    def get_xml_dict(self, url):
+        print("CPE: Setting up NIST dictionary")
+        # Setup location to save dict and xmls, if it exists, assume we're
+        # reusing the previous dict
+        if not os.path.exists("cpe"):
+            os.makedirs("cpe")
+            self.get_new_xml_dict(url)
+        else:
+            print("CPE: Loading CACHED dictionary")
+            cpe_file = open('cpe/.all_cpes.pkl', 'rb')
+            self.all_cpes = pickle.load(cpe_file)
+            cpe_file.close()
+            cpe_file = open('cpe/.all_cpes_no_version.pkl', 'rb')
+            self.all_cpes_no_version = pickle.load(cpe_file)
+            cpe_file.close()
+
+    def get_new_xml_dict(self, url):
+        print("CPE: Fetching xml manifest from [" + url + "]")
+        try:
+            compressed_cpe_file = urllib2.urlopen(url)
+            print("CPE: Unzipping xml manifest...")
+            nist_cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
+            print("CPE: Converting xml manifest to dict...")
+            all_cpedb = xmltodict.parse(nist_cpe_file)
+
+            # Cycle through the dict and build two dict to be used for custom
+            # lookups of partial and complete CPE objects
+            # The objects are then used to create new proposed XML updates if
+            # if is determined one is required
+            for cpe in all_cpedb['cpe-list']['cpe-item']:
+                cpe_titles = cpe['title']
+                # There maybe multiple titles or one.  Make sure this is
+                # always a list
+                if not isinstance(cpe_titles, (list,)):
+                    cpe_titles = [cpe_titles]
+                # Out of the different language titles, select English
+                for title in cpe_titles:
+                    if title['@xml:lang'] is 'en-US':
+                        cpe_titles = [title]
+                # Some older CPE don't include references, if they do, make
+                # sure we handle the case of one ref needing to be packed
+                # in a list
+                if 'references' in cpe:
+                    cpe_ref = cpe['references']['reference']
+                    if not isinstance(cpe_ref, (list,)):
+                        cpe_ref = [cpe_ref]
+                    # The reference text has not been consistantly upper case
+                    # in the NIST dict but they now require it.  So force upper
+                    # and then check for compliance to a specific tagging
+                    for ref_href in cpe_ref:
+                        ref_href['#text'] = ref_href['#text'].upper()
+                        if ref_href['#text'] not in VALID_REFS:
+                            ref_href['#text'] = ref_href['#text'] + "-- UPDATE this entry, here are some exmaples and just one word should be used -- " + ' '.join(VALID_REFS)
+                cpe_str = cpe['cpe-23:cpe23-item']['@name']
+                item = CPE(cpe_str, cpe_titles, cpe_ref)
+                cpe_str_no_version = self.get_cpe_no_version(cpe_str)
+                # This dict must have a unique key for every CPE version
+                # which allows matching to the specific obj data of that
+                # NIST dict entry
+                self.all_cpes.update({cpe_str: item})
+                # This dict has one entry for every CPE (w/o version) to allow
+                # partial match (no valid version) check (the obj is saved and
+                # used as seed for suggested xml updates. By updating the same
+                # non-version'd entry, it assumes the last update here is the
+                # latest version in the NIST dict)
+                self.all_cpes_no_version.update({cpe_str_no_version: item})
+
+        except urllib2.HTTPError:
+            print("CPE: HTTP Error: %s" % url)
+            sys.exit(1)
+        except urllib2.URLError:
+            print("CPE: URL Error: %s" % url)
+            sys.exit(1)
+
+        print("CPE: Caching dictionary")
+        cpes_file = open('cpe/.all_cpes.pkl', 'wb')
+        pickle.dump(self.all_cpes, cpes_file)
+        cpes_file.close()
+        cpes_file = open('cpe/.all_cpes_no_version.pkl', 'wb')
+        pickle.dump(self.all_cpes_no_version, cpes_file)
+        cpes_file.close()
+
+    def find_partial(self, cpe_str):
+        cpe_str_no_version = self.get_cpe_no_version(cpe_str)
+        if cpe_str_no_version in self.all_cpes_no_version:
+            return cpe_str_no_version
+
+    def find_partial_obj(self, cpe_str):
+        cpe_str_no_version = self.get_cpe_no_version(cpe_str)
+        if cpe_str_no_version in self.all_cpes_no_version:
+            return self.all_cpes_no_version[cpe_str_no_version]
+
+    def find_partial_latest_version(self, cpe_str_partial):
+        cpe_obj = self.find_partial_obj(cpe_str_partial)
+        return cpe_obj.cpe_cur_ver
+
+    def find(self, cpe_str):
+        if self.find_partial(cpe_str):
+            if cpe_str in self.all_cpes:
+                return cpe_str
+
+    def update(self, cpe_str):
+        to_update = self.find_partial_obj(cpe_str)
+        xml = self.__gen_xml__(to_update.to_dict(cpe_str))
+        fp = open(os.path.join('cpe', self.get_cpe_name(cpe_str) + '-' + self.get_cpe_version(cpe_str) + '.xml'), 'w+')
+        fp.write(xmltodict.unparse(xml, pretty=True))
+        fp.close()
+
+    def get_nvd_url(self, cpe_str):
+        return "https://nvd.nist.gov/products/cpe/search/results?keyword=" + \
+                urllib2.quote(cpe_str) + \
+                "&status=FINAL&orderBy=CPEURI&namingFormat=2.3"
+
+    def get_cpe_no_version(self, cpe):
+        return ":".join(cpe.split(":")[:5])
+
+    def get_cpe_name(self, cpe_str):
+        return "".join(cpe_str.split(":")[4])
+
+    def get_cpe_version(self, cpe_str):
+        return "".join(cpe_str.split(":")[5])
+
+    def __gen_xml__(self, cpe_list):
+        list_header = {
+            "cpe-list": {
+                "@xmlns:config": "http://scap.nist.gov/schema/configuration/0.1",
+                "@xmlns": "http://cpe.mitre.org/dictionary/2.0",
+                "@xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
+                "@xmlnsscap-core": "http://scap.nist.gov/schema/scap-core/0.3",
+                "@xmlns:cpe-23": "http://scap.nist.gov/schema/cpe-extension/2.3",
+                "@xmlns:ns6": "http://scap.nist.gov/schema/scap-core/0.1",
+                "@xmlns:meta": "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2",
+                "@xsi:schemaLocation": "http://scap.nist.gov/schema/cpe-extension/2.3 https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary-extension_2.3.xsd http://cpe.mitre.org/dictionary/2.0 https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2 https://scap.nist.gov/schema/cpe/2.1/cpe-dictionary-metadata_0.2.xsd http://scap.nist.gov/schema/scap-core/0.3 https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd http://scap.nist.gov/schema/configuration/0.1 https://scap.nist.gov/schema/nvd/configuration_0.1.xsd http://scap.nist.gov/schema/scap-core/0.1 https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd"
+             }
+        }
+        list_header['cpe-list'].update(cpe_list)
+        return list_header
-- 
2.28.0
