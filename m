Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84477C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38C41417B8;
	Wed, 30 Aug 2023 20:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38C41417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1Iw_J6RP9Wt; Wed, 30 Aug 2023 20:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3CF841807;
	Wed, 30 Aug 2023 20:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3CF841807
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A71B71BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F03841759
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F03841759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VadhzTNUBTSJ for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:49:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E15041583
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E15041583
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B9D286636; Wed, 30 Aug 2023 20:49:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:39:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8997c746fa53db665e00dc5e325600cdf7a0a71c
X-Git-Newrev: 6fa3a239ac21a3ea1175303bc9b1293571a43979
X-Patchwork-Hint: ignore
Message-Id: <20230830204913.8B9D286636@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-missing-cpe: remove
 rarely used script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fa3a239ac21a3ea1175303bc9b1293571a43979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The intention of this script is to generate the XML that can be sent to
NVD to request a new CPE identifier.

As discussed on the mailing list [0] keeping up with version numbers of
all registered CPE ID won't work.
In addition the feed used to generated the XML files will be retired
[1]. In the future an API needs to be used for fetching the data in
connection with a local database.
All of this works against keeping this script and porting it to the new
API.
As a last blow Matthew, the original author concluded [2]:
> Makes sense to drop it.  There never got to be enough momentum in the overall
> software community to make CVE or even the new identifier really accurate.

The intention is to ignore the version part of CPE IDs in the future,
and only look at the version range specified on a CVE. Therefore, a tool
to add new CPE ID versions isn't useful to us. It might still be useful
to have a tool to create the vendor and project parts of a CPE ID.
However, the current gen-missing-cpe tool doesn't support that, and the
API is anyway going to be retired. So there is no reason at all to keep
this around.

Remove gen-missing-cpe and the cpedb module. Remove the Makefile target
to call the script.

Since the cpedb module is removed, the CPEDB_URL definition must be
moved to the place where it is still used, in pkg-stats.

[0]: https://lists.buildroot.org/pipermail/buildroot/2023-August/672620.html
[1]: https://nvd.nist.gov/General/News/change-timeline
[2]: https://lists.buildroot.org/pipermail/buildroot/2023-August/672651.html

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                        |   9 ---
 support/scripts/cpedb.py        | 174 ----------------------------------------
 support/scripts/gen-missing-cpe |  65 ---------------
 support/scripts/pkg-stats       |   2 +-
 4 files changed, 1 insertion(+), 249 deletions(-)

diff --git a/Makefile b/Makefile
index 1a1ba92c66..8c7327356e 100644
--- a/Makefile
+++ b/Makefile
@@ -927,14 +927,6 @@ pkg-stats:
 		--html $(O)/pkg-stats.html \
 		--nvd-path $(DL_DIR)/buildroot-nvd
 
-.PHONY: missing-cpe
-missing-cpe:
-	$(Q)mkdir -p $(CPE_UPDATES_DIR)
-	$(Q)cd "$(CONFIG_DIR)" ; \
-	$(TOPDIR)/support/scripts/gen-missing-cpe \
-		--nvd-path $(DL_DIR)/buildroot-nvd \
-		--output $(CPE_UPDATES_DIR)
-
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # Some subdirectories are also package names. To avoid that "make linux"
@@ -1191,7 +1183,6 @@ help:
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
-	@echo '  missing-cpe            - generate XML snippets for missing CPE identifiers'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
 	@echo '                           to limit the list to variables names matching that pattern'
diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
deleted file mode 100644
index f4daf56124..0000000000
--- a/support/scripts/cpedb.py
+++ /dev/null
@@ -1,174 +0,0 @@
-#!/usr/bin/env python3
-
-import xml.etree.ElementTree as ET
-from xml.etree.ElementTree import Element, SubElement
-import gzip
-import os
-import requests
-import time
-from xml.dom import minidom
-
-VALID_REFS = ['VENDOR', 'VERSION', 'CHANGE_LOG', 'PRODUCT', 'PROJECT', 'ADVISORY']
-
-CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
-
-ns = {
-    '': 'http://cpe.mitre.org/dictionary/2.0',
-    'cpe-23': 'http://scap.nist.gov/schema/cpe-extension/2.3',
-    'xml': 'http://www.w3.org/XML/1998/namespace'
-}
-
-
-class CPE:
-    def __init__(self, cpe_str, titles, refs):
-        self.cpe_str = cpe_str
-        self.titles = titles
-        self.references = refs
-        self.cpe_cur_ver = "".join(self.cpe_str.split(":")[5:6])
-
-    def update_xml_dict(self):
-        ET.register_namespace('', 'http://cpe.mitre.org/dictionary/2.0')
-        cpes = Element('cpe-list')
-        cpes.set('xmlns:cpe-23', "http://scap.nist.gov/schema/cpe-extension/2.3")
-        cpes.set('xmlns:ns6', "http://scap.nist.gov/schema/scap-core/0.1")
-        cpes.set('xmlns:scap-core', "http://scap.nist.gov/schema/scap-core/0.3")
-        cpes.set('xmlns:config', "http://scap.nist.gov/schema/configuration/0.1")
-        cpes.set('xmlns:xsi', "http://www.w3.org/2001/XMLSchema-instance")
-        cpes.set('xmlns:meta', "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2")
-        cpes.set('xsi:schemaLocation', " ".join(["http://scap.nist.gov/schema/cpe-extension/2.3",
-                                                 "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary-extension_2.3.xsd",
-                                                 "http://cpe.mitre.org/dictionary/2.0",
-                                                 "https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd",
-                                                 "http://scap.nist.gov/schema/cpe-dictionary-metadata/0.2",
-                                                 "https://scap.nist.gov/schema/cpe/2.1/cpe-dictionary-metadata_0.2.xsd",
-                                                 "http://scap.nist.gov/schema/scap-core/0.3",
-                                                 "https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd",
-                                                 "http://scap.nist.gov/schema/configuration/0.1",
-                                                 "https://scap.nist.gov/schema/nvd/configuration_0.1.xsd",
-                                                 "http://scap.nist.gov/schema/scap-core/0.1",
-                                                 "https://scap.nist.gov/schema/nvd/scap-core_0.1.xsd"]))
-        item = SubElement(cpes, 'cpe-item')
-        cpe_short_name = CPE.short_name(self.cpe_str)
-        cpe_new_ver = CPE.version_update(self.cpe_str)
-
-        item.set('name', 'cpe:/' + cpe_short_name)
-        self.titles[0].text.replace(self.cpe_cur_ver, cpe_new_ver)
-        for title in self.titles:
-            item.append(title)
-        if self.references:
-            item.append(self.references)
-        cpe23item = SubElement(item, 'cpe-23:cpe23-item')
-        cpe23item.set('name', self.cpe_str)
-
-        # Generate the XML as a string
-        xmlstr = ET.tostring(cpes)
-
-        # And use minidom to pretty print the XML
-        return minidom.parseString(xmlstr).toprettyxml(encoding="utf-8").decode("utf-8")
-
-    @staticmethod
-    def version(cpe):
-        return cpe.split(":")[5]
-
-    @staticmethod
-    def product(cpe):
-        return cpe.split(":")[4]
-
-    @staticmethod
-    def short_name(cpe):
-        return ":".join(cpe.split(":")[2:6])
-
-    @staticmethod
-    def version_update(cpe):
-        return ":".join(cpe.split(":")[5:6])
-
-    @staticmethod
-    def no_version(cpe):
-        return ":".join(cpe.split(":")[:5])
-
-
-class CPEDB:
-    def __init__(self, nvd_path):
-        self.all_cpes = dict()
-        self.all_cpes_no_version = dict()
-        self.nvd_path = nvd_path
-
-    def get_xml_dict(self):
-        print("CPE: Setting up NIST dictionary")
-        if not os.path.exists(os.path.join(self.nvd_path, "cpe")):
-            os.makedirs(os.path.join(self.nvd_path, "cpe"))
-
-        cpe_dict_local = os.path.join(self.nvd_path, "cpe", os.path.basename(CPEDB_URL))
-        if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
-            print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
-            cpe_dict = requests.get(CPEDB_URL)
-            open(cpe_dict_local, "wb").write(cpe_dict.content)
-
-        print("CPE: Unzipping xml manifest...")
-        nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
-        print("CPE: Converting xml manifest to dict...")
-        tree = ET.parse(nist_cpe_file)
-        all_cpedb = tree.getroot()
-        self.parse_dict(all_cpedb)
-
-    def parse_dict(self, all_cpedb):
-        # Cycle through the dict and build two dict to be used for custom
-        # lookups of partial and complete CPE objects
-        # The objects are then used to create new proposed XML updates if
-        # if is determined one is required
-        # Out of the different language titles, select English
-        for cpe in all_cpedb.findall(".//{http://cpe.mitre.org/dictionary/2.0}cpe-item"):
-            cpe_titles = []
-            for title in cpe.findall('.//{http://cpe.mitre.org/dictionary/2.0}title[@xml:lang="en-US"]', ns):
-                title.tail = None
-                cpe_titles.append(title)
-
-            # Some older CPE don't include references, if they do, make
-            # sure we handle the case of one ref needing to be packed
-            # in a list
-            cpe_ref = cpe.find(".//{http://cpe.mitre.org/dictionary/2.0}references")
-            if cpe_ref:
-                for ref in cpe_ref.findall(".//{http://cpe.mitre.org/dictionary/2.0}reference"):
-                    ref.tail = None
-                    ref.text = ref.text.upper()
-                    if ref.text not in VALID_REFS:
-                        ref.text = ref.text + "-- UPDATE this entry, here are some examples and just one word should be used -- " + ' '.join(VALID_REFS) # noqa E501
-                cpe_ref.tail = None
-                cpe_ref.text = None
-
-            cpe_str = cpe.find(".//{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item").get('name')
-            item = CPE(cpe_str, cpe_titles, cpe_ref)
-            cpe_str_no_version = CPE.no_version(cpe_str)
-            # This dict must have a unique key for every CPE version
-            # which allows matching to the specific obj data of that
-            # NIST dict entry
-            self.all_cpes.update({cpe_str: item})
-            # This dict has one entry for every CPE (w/o version) to allow
-            # partial match (no valid version) check (the obj is saved and
-            # used as seed for suggested xml updates. By updating the same
-            # non-version'd entry, it assumes the last update here is the
-            # latest version in the NIST dict)
-            self.all_cpes_no_version.update({cpe_str_no_version: item})
-
-    def find_partial(self, cpe_str):
-        cpe_str_no_version = CPE.no_version(cpe_str)
-        if cpe_str_no_version in self.all_cpes_no_version:
-            return cpe_str_no_version
-
-    def find_partial_obj(self, cpe_str):
-        cpe_str_no_version = CPE.no_version(cpe_str)
-        if cpe_str_no_version in self.all_cpes_no_version:
-            return self.all_cpes_no_version[cpe_str_no_version]
-
-    def find_partial_latest_version(self, cpe_str_partial):
-        cpe_obj = self.find_partial_obj(cpe_str_partial)
-        return cpe_obj.cpe_cur_ver
-
-    def find(self, cpe_str):
-        if self.find_partial(cpe_str):
-            if cpe_str in self.all_cpes:
-                return cpe_str
-
-    def gen_update_xml(self, cpe_str):
-        cpe = self.find_partial_obj(cpe_str)
-        return cpe.update_xml_dict()
diff --git a/support/scripts/gen-missing-cpe b/support/scripts/gen-missing-cpe
deleted file mode 100755
index 0b222f2659..0000000000
--- a/support/scripts/gen-missing-cpe
+++ /dev/null
@@ -1,65 +0,0 @@
-#!/usr/bin/env python3
-
-import argparse
-import sys
-import json
-import subprocess
-import os
-from cpedb import CPEDB, CPE
-
-
-def gen_update_xml_reports(cpeids, cpedb, output):
-    cpe_need_update = []
-
-    for cpe in cpeids:
-        result = cpedb.find(cpe)
-        if not result:
-            result = cpedb.find_partial(CPE.no_version(cpe))
-            if result:
-                cpe_need_update.append(cpe)
-            else:
-                print("WARNING: no match found for '%s'" % cpe)
-
-    for cpe in cpe_need_update:
-        xml = cpedb.gen_update_xml(cpe)
-        fname = CPE.product(cpe) + '-' + CPE.version(cpe) + '.xml'
-        print("Generating %s" % fname)
-        with open(os.path.join(output, fname), 'w+') as fp:
-            fp.write(xml)
-
-    print("Generated %d update files out of %d CPEs" % (len(cpe_need_update), len(cpeids)))
-
-
-def get_cpe_ids():
-    print("Getting list of CPE for enabled packages")
-    cmd = ["make", "--no-print-directory", "show-info"]
-    js = json.loads(subprocess.check_output(cmd).decode("utf-8"))
-    return set([v["cpe-id"] for k, v in js.items() if "cpe-id" in v])
-
-
-def resolvepath(path):
-    return os.path.abspath(os.path.expanduser(path))
-
-
-def parse_args():
-    parser = argparse.ArgumentParser()
-    parser.add_argument('--output', dest='output',
-                        help='Path to the output CPE update files', type=resolvepath, required=True)
-    parser.add_argument('--nvd-path', dest='nvd_path',
-                        help='Path to the local NVD database', type=resolvepath, required=True)
-    return parser.parse_args()
-
-
-def __main__():
-    args = parse_args()
-    if not os.path.isdir(args.output):
-        print("ERROR: output directory %s does not exist" % args.output)
-        sys.exit(1)
-    cpedb = CPEDB(args.nvd_path)
-    cpedb.get_xml_dict()
-    cpeids = get_cpe_ids()
-    gen_update_xml_reports(cpeids, cpedb, args.output)
-
-
-if __name__ == "__main__":
-    __main__()
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eea900124c..28f5a0789c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -37,10 +37,10 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
 sys.path.append(os.path.join(brpath, "utils"))
 from getdeveloperlib import parse_developers  # noqa: E402
-from cpedb import CPEDB_URL  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
+CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
 
 RM_API_STATUS_ERROR = 1
 RM_API_STATUS_FOUND_BY_DISTRO = 2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
