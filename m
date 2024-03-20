Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB45C54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA2A681425;
	Wed, 20 Mar 2024 20:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAgbKbN6WV3w; Wed, 20 Mar 2024 20:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964B381E2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964B381E2F;
	Wed, 20 Mar 2024 20:24:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6ED01BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4417415B3
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLJtMlStYQIy for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A955F40446
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A955F40446
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:24:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90A9D836C6; Wed, 20 Mar 2024 20:24:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Mar 2024 21:06:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87504a1b7948dbfa3648ad02c3c034a3c36dcd92
X-Git-Newrev: fee7efafd05872282e24a6923e40c1505e041196
X-Patchwork-Hint: ignore
Message-Id: <20240320202420.90A9D836C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: use FKIE git tree
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

commit: https://git.buildroot.net/buildroot/commit/?id=fee7efafd05872282e24a6923e40c1505e041196
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we grab the per-year CVE feeds, in two passes: first, we grab
the meta files, and check whether something has changed since last we
downloaded it; second, we download the feed proper, unless the meta file
has not changed, in which case we use the locally cached feed.

However, it has appeared that the FKIE releases no longer provide the
meta files, which means that (once again), our daily reports are broken.

The obvious fix would be to drop the use of the meta file, and always
and unconditionally download the feeds. That's relatively trivial to do,
but the feeds are relatively big (even as xz-xompressed).

However, the CVE database from FKIE is available as a git tree. Git is
pretty good at only sending delta when updating a local copy. In
addition, the git tree, contains each CVE as an individual file, so it
is relatively easier to scan and parse.

Switch to using a local git clone.

Slightly surprisingly (but not so much either), parsing the CVE files is
much faster when using the git working copy, than it is when parsing the
per-year feeds: indeed, the per-year feeds are xz-compressed, and even
if python is slow-ish to scan a directory and opening files therein, it
is still much faster than to decompress xz files. The timing delta [0]
is ~100s before and ~10s now, about a ten time improvement, over the
whole package set.

The drawback, however, is that the git tree is much bigger on-disk, from
~55MiB for the per-year compressed feeds, to 2.1GiB for the git tree
(~366MiB) and a working copy (~1.8GiB)... Given very few people are
going to use that, that's considered acceptable...

Eventually, with a bit of hacking [1], the two pkg-stats, before and
after this change, yield the same data (except for the date and commit
hash).

[0] hacking support/scripts/pkg-stats to display the time before/after
the CVE scan, and hacking support/scripts/cve.py to do no download so
that only the CVE scan happens (and also because the meta files are no
longer available).

[1] sorting the CVE lists in json, sorting the json keys, and using the
commit from the FKIE git tree that was used for the current per-year
feeds.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/cve.py | 88 +++++++++++++++++---------------------------------
 1 file changed, 29 insertions(+), 59 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 7167ecbc6a..e25825581e 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -19,29 +19,16 @@
 
 import datetime
 import os
-import requests  # URL checking
 import distutils.version
-import lzma
-import time
+import json
+import subprocess
 import sys
 import operator
 
-try:
-    import ijson
-    # backend is a module in < 2.5, a string in >= 2.5
-    if 'python' in getattr(ijson.backend, '__name__', ijson.backend):
-        try:
-            import ijson.backends.yajl2_cffi as ijson
-        except ImportError:
-            sys.stderr.write('Warning: Using slow ijson python backend\n')
-except ImportError:
-    sys.stderr.write("You need ijson to parse NVD for CVE check\n")
-    exit(1)
-
 sys.path.append('utils/')
 
 NVD_START_YEAR = 1999
-NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download"
+NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/"
 
 ops = {
     '>=': operator.ge,
@@ -81,41 +68,24 @@ class CVE:
         self.nvd_cve = nvd_cve
 
     @staticmethod
-    def download_nvd_year(nvd_path, year):
-        metaf = "CVE-%s.meta" % year
-        path_metaf = os.path.join(nvd_path, metaf)
-        jsonf_xz = "CVE-%s.json.xz" % year
-        path_jsonf_xz = os.path.join(nvd_path, jsonf_xz)
-
-        # If the database file is less than a day old, we assume the NVD data
-        # locally available is recent enough.
-        if os.path.exists(path_jsonf_xz) and os.stat(path_jsonf_xz).st_mtime >= time.time() - 86400:
-            return path_jsonf_xz
-
-        # If not, we download the meta file
-        url = "%s/%s" % (NVD_BASE_URL, metaf)
-        print("Getting %s" % url)
-        page_meta = requests.get(url)
-        page_meta.raise_for_status()
-
-        # If the meta file already existed, we compare the existing
-        # one with the data newly downloaded. If they are different,
-        # we need to re-download the database.
-        # If the database does not exist locally, we need to redownload it in
-        # any case.
-        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_xz):
-            meta_known = open(path_metaf, "r").read()
-            if page_meta.text == meta_known:
-                return path_jsonf_xz
-
-        # Grab the compressed JSON NVD, and write files to disk
-        url = "%s/%s" % (NVD_BASE_URL, jsonf_xz)
-        print("Getting %s" % url)
-        page_json = requests.get(url)
-        page_json.raise_for_status()
-        open(path_jsonf_xz, "wb").write(page_json.content)
-        open(path_metaf, "w").write(page_meta.text)
-        return path_jsonf_xz
+    def download_nvd(nvd_git_dir):
+        print(f"Updating from {NVD_BASE_URL}")
+        if os.path.exists(nvd_git_dir):
+            subprocess.check_call(
+                ["git", "pull"],
+                cwd=nvd_git_dir,
+                stdout=subprocess.DEVNULL,
+                stderr=subprocess.DEVNULL,
+            )
+        else:
+            # Create the directory and its parents; git
+            # happily clones into an empty directory.
+            os.makedirs(nvd_git_dir)
+            subprocess.check_call(
+                ["git", "clone", NVD_BASE_URL, nvd_git_dir],
+                stdout=subprocess.DEVNULL,
+                stderr=subprocess.DEVNULL,
+            )
 
     @staticmethod
     def sort_id(cve_ids):
@@ -131,15 +101,15 @@ class CVE:
         feeds since NVD_START_YEAR. If the files are missing or outdated in
         nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
         """
+        nvd_git_dir = os.path.join(nvd_dir, "git")
+        CVE.download_nvd(nvd_git_dir)
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
-            filename = CVE.download_nvd_year(nvd_dir, year)
-            try:
-                content = ijson.items(lzma.LZMAFile(filename), 'cve_items.item')
-            except:  # noqa: E722
-                print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
-                raise
-            for cve in content:
-                yield cls(cve)
+            for dirpath, _, filenames in os.walk(os.path.join(nvd_git_dir, f"CVE-{year}")):
+                for filename in filenames:
+                    if filename[-5:] != ".json":
+                        continue
+                    with open(os.path.join(dirpath, filename), "rb") as f:
+                        yield cls(json.load(f))
 
     def each_product(self):
         """Iterate over each product section of this cve"""
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
