Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B901C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 968DA83C32;
	Wed,  7 Feb 2024 16:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5rWjp-TDvgX; Wed,  7 Feb 2024 16:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED2E183C4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED2E183C4F;
	Wed,  7 Feb 2024 16:38:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 160BB1BF954
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE65383C1A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxgTIQAyJBRa for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E681D82726
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E681D82726
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D093F8763D; Wed,  7 Feb 2024 16:38:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:29:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bf75464d6027b8079431c34410ab9d070b818f4
X-Git-Newrev: 22b69455526f3d12744bc285a33b74bbad58e4bc
X-Patchwork-Hint: ignore
Message-Id: <20240207163840.D093F8763D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve.py: switch from NVD to
 FKIE for the JSON files
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

commit: https://git.buildroot.net/buildroot/commit/?id=22b69455526f3d12744bc285a33b74bbad58e4bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NVD will deprecate the v1.1 API which allows us to download the full
database as individual JSON files. Instead, there's a horribly crappy
API that is extremely slow and subject to race conditions.

Fortunately, there is a project, Fraunhofer FKIE - Cyber Analysis and
Defense [1], that goes through the effort of adapting to this new API
and regenerating the convenient JSON files. The JSON files and meta
files are re-generated daily.

Instead of implementing the NVD v2 API, we decided to just use the JSON
files generatd by fkie-cad. That saves us the effort of solving the race
conditions, devising a cache mechanism that works, handling the frequent
gateway timeouts on the NVD servers, dealing with the rate limiting, and
keeping up with changes in the API.

Switch to this repository on github as NVD_BASE_URL. The file name is
also slightly different (CVE-20XX.json instead of nvdcve-1.1-20XX.json).

The fkie-cad repository compresses with xz instead of gz. Therefore:
 - rename the filename variables to _xz instead of _gz;
 - use xz as a subprocess because there is no xz decompressor in Python
   stdlib.

[1] https://www.fkie.fraunhofer.de/en/departments/cad.html

Cc: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 7cd6fce4d8..46c384955c 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -22,7 +22,7 @@ import os
 import requests  # URL checking
 import distutils.version
 import time
-import gzip
+import subprocess
 import sys
 import operator
 
@@ -41,8 +41,7 @@ except ImportError:
 sys.path.append('utils/')
 
 NVD_START_YEAR = 2002
-NVD_JSON_VERSION = "1.1"
-NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
+NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download"
 
 ops = {
     '>=': operator.ge,
@@ -83,15 +82,15 @@ class CVE:
 
     @staticmethod
     def download_nvd_year(nvd_path, year):
-        metaf = "nvdcve-%s-%s.meta" % (NVD_JSON_VERSION, year)
+        metaf = "CVE-%s.meta" % year
         path_metaf = os.path.join(nvd_path, metaf)
-        jsonf_gz = "nvdcve-%s-%s.json.gz" % (NVD_JSON_VERSION, year)
-        path_jsonf_gz = os.path.join(nvd_path, jsonf_gz)
+        jsonf_xz = "CVE-%s.json.xz" % year
+        path_jsonf_xz = os.path.join(nvd_path, jsonf_xz)
 
         # If the database file is less than a day old, we assume the NVD data
         # locally available is recent enough.
-        if os.path.exists(path_jsonf_gz) and os.stat(path_jsonf_gz).st_mtime >= time.time() - 86400:
-            return path_jsonf_gz
+        if os.path.exists(path_jsonf_xz) and os.stat(path_jsonf_xz).st_mtime >= time.time() - 86400:
+            return path_jsonf_xz
 
         # If not, we download the meta file
         url = "%s/%s" % (NVD_BASE_URL, metaf)
@@ -104,19 +103,19 @@ class CVE:
         # we need to re-download the database.
         # If the database does not exist locally, we need to redownload it in
         # any case.
-        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_gz):
+        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_xz):
             meta_known = open(path_metaf, "r").read()
             if page_meta.text == meta_known:
-                return path_jsonf_gz
+                return path_jsonf_xz
 
         # Grab the compressed JSON NVD, and write files to disk
-        url = "%s/%s" % (NVD_BASE_URL, jsonf_gz)
+        url = "%s/%s" % (NVD_BASE_URL, jsonf_xz)
         print("Getting %s" % url)
         page_json = requests.get(url)
         page_json.raise_for_status()
-        open(path_jsonf_gz, "wb").write(page_json.content)
+        open(path_jsonf_xz, "wb").write(page_json.content)
         open(path_metaf, "w").write(page_meta.text)
-        return path_jsonf_gz
+        return path_jsonf_xz
 
     @classmethod
     def read_nvd_dir(cls, nvd_dir):
@@ -128,7 +127,8 @@ class CVE:
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
             filename = CVE.download_nvd_year(nvd_dir, year)
             try:
-                content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
+                uncompressed = subprocess.check_output(["xz", "-d", "-c", filename])
+                content = ijson.items(uncompressed, 'CVE_Items.item')
             except:  # noqa: E722
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
