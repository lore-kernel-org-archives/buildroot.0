Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5F7C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADBC282726;
	Wed,  7 Feb 2024 16:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cn98PWN51Kzy; Wed,  7 Feb 2024 16:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A627883C12
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A627883C12;
	Wed,  7 Feb 2024 16:38:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F08B11BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC76404E2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0ufXQhe54Em for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F01404D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5F01404D2
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB1CF87653; Wed,  7 Feb 2024 16:38:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:29:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98a49edda69e868c95bd8cf4e923eb0bd0a65ff7
X-Git-Newrev: 2bf75464d6027b8079431c34410ab9d070b818f4
X-Patchwork-Hint: ignore
Message-Id: <20240207163840.BB1CF87653@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: remove checking
 the CPE database
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bf75464d6027b8079431c34410ab9d070b818f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently check the CPE database to see if the CPE ID we use
(including the version) is already in the database.

However, the version part of the CPE ID is not actually used for CVE
matching. Instead, the CVEs have a range of versions associated with
them and we match against those ranges.

In addition, NVD is moving to a new API for accessing the CPE database.
It will not longer be possible to simply download all the CPE IDs, and
due to rate limiting, the download will have to be done in several
queries.

Since all of this is anyway of limited use, drop the CPE database lookup
entirely. Instead, as long as a CPE ID is defined in a package, it is
considered OK, without any checks.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 54 ++---------------------------------------------
 1 file changed, 2 insertions(+), 52 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 05f0cd9e4a..7835cb3d62 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -28,10 +28,6 @@ import re
 import subprocess
 import json
 import sys
-import time
-import gzip
-import xml.etree.ElementTree
-import requests
 
 brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
@@ -40,7 +36,6 @@ from getdeveloperlib import parse_developers  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
-CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
 
 RM_API_STATUS_ERROR = 1
 RM_API_STATUS_FOUND_BY_DISTRO = 2
@@ -282,8 +277,7 @@ class Package:
 
         if var in self.all_cpeids:
             self.cpeid = self.all_cpeids[var]
-            # Set a preliminary status, it might be overridden by check_package_cpes()
-            self.status['cpe'] = ("warning", "not checked against CPE dictionary")
+            self.status['cpe'] = ("ok", "(not checked against CPE dictionary)")
         else:
             self.status['cpe'] = ("error", "no verified CPE identifier")
 
@@ -674,47 +668,6 @@ def check_package_cves(nvd_path, packages):
                 pkg.status['cve'] = ("ok", "not affected by CVEs")
 
 
-def check_package_cpes(nvd_path, packages):
-    class CpeXmlParser:
-        cpes = []
-
-        def start(self, tag, attrib):
-            if tag == "{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item":
-                self.cpes.append(attrib['name'])
-
-        def close(self):
-            return self.cpes
-
-    print("CPE: Setting up NIST dictionary")
-    if not os.path.exists(os.path.join(nvd_path, "cpe")):
-        os.makedirs(os.path.join(nvd_path, "cpe"))
-
-    cpe_dict_local = os.path.join(nvd_path, "cpe", os.path.basename(CPEDB_URL))
-    if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
-        print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
-        cpe_dict = requests.get(CPEDB_URL)
-        open(cpe_dict_local, "wb").write(cpe_dict.content)
-
-    print("CPE: Unzipping xml manifest...")
-    nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
-
-    parser = xml.etree.ElementTree.XMLParser(target=CpeXmlParser())
-    while True:
-        c = nist_cpe_file.read(1024*1024)
-        if not c:
-            break
-        parser.feed(c)
-    cpes = parser.close()
-
-    for p in packages:
-        if not p.cpeid:
-            continue
-        if p.cpeid in cpes:
-            p.status['cpe'] = ("ok", "verified CPE identifier")
-        else:
-            p.status['cpe'] = ("error", "CPE version unknown in CPE database")
-
-
 def calculate_stats(packages):
     stats = defaultdict(int)
     stats['packages'] = len(packages)
@@ -1309,7 +1262,7 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
     parser.add_argument('--disable', type=list_str,
-                        help='Features to disable, comma-separated (cve, upstream, url, cpe, warning)',
+                        help='Features to disable, comma-separated (cve, upstream, url, warning)',
                         default=[])
     args = parser.parse_args()
     if not args.html and not args.json:
@@ -1372,9 +1325,6 @@ def __main__():
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
-    if "cpe" not in args.disable and args.nvd_path:
-        print("Checking packages CPEs")
-        check_package_cpes(args.nvd_path, packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
