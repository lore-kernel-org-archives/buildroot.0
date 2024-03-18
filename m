Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A320C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 22:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C45F608AB;
	Mon, 18 Mar 2024 22:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXfHe7wHZ5jY; Mon, 18 Mar 2024 22:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2E92608CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E92608CE;
	Mon, 18 Mar 2024 22:04:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DC671BF3AA
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 22:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16A6640607
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 22:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtwPgiq2nANM for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 22:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2EAB40510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2EAB40510
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2EAB40510
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 22:04:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33d38c9ca5bso2440979f8f.2
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 15:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710799462; x=1711404262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CqXo7xKEX3rQOmnk+v+AJkcW1tmlrWJzaDX5uMOIUL0=;
 b=CIWvFI4K7pV+YRYziASxpSBR4nd0CexbELJYEwQwJ+Nuyco2lblvnRDL0LAlugWalp
 Rs+5EppmzQCgnkvfxf4wt5E+04XXfJ1ZgquIO+getMMZdR1MtkU4bgG5YY30HfP8h0e2
 ppZfkwbcCvpIM1AclRQqNM0l97cbrxEcjGhAKr/KkC/COu2MV5Mc+omilpWjjNvx9lYU
 xVf+ByDOi2suLcRleVRRRSDR9IxDXsAz/9GXJ4mI0Ttzi1wYn9X8fvUcEmHG9Kmdbnln
 D6wV/ELfvdKAqkLG4l3fPcb7Oi/s3yKlxS6QZfw3ZgjE0san8s7mGolBV7D/3/1Aq9HC
 m0ow==
X-Gm-Message-State: AOJu0Yy+BK8AQb1MXiMKoeddGJO03JstU/6cxK/DbJuuyo1lPngskjM3
 X343ghGnlRQzHLOybnIIp7IDSIIZPS6eHSn4AwEjMqlS2278atxJWMMurgQW
X-Google-Smtp-Source: AGHT+IHYAFfrM4Tpg+/O13k85+k0xLsKhBLJgoTuc7Mi/RtWYYYh2Qu5+VeH/+HTd/wLrYiLVvgGHQ==
X-Received: by 2002:a5d:47cc:0:b0:33e:1ee1:ef92 with SMTP id
 o12-20020a5d47cc000000b0033e1ee1ef92mr706400wrc.67.1710799461442; 
 Mon, 18 Mar 2024 15:04:21 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b004131310a29fsm16170871wms.15.2024.03.18.15.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 15:04:21 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 23:04:20 +0100
Message-ID: <20240318220420.356343-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710799462; x=1711404262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=CqXo7xKEX3rQOmnk+v+AJkcW1tmlrWJzaDX5uMOIUL0=;
 b=IFwI2Uq2LfR3iV9u3ofPFdj5LeDiccH51kaz5YU37NVBI8QJWFetI2lqeQAt1acZvE
 omk5z0yBXGO3KbDQer1DZlXlAZ4d30T0ZAszC324iEyF+jNZqvC1G3m7HJo0nXCB7hpu
 pZ9JjMiy1F7s+qn7my8JNHUJRMOEKASiUUpDYI3HUufQCn2QoXqR3hk8rO7D9oIpickO
 pAa979CLN8P7z9j9CAHTChBfiVI7CnBCB8upE6eLx3wzBKLrQ51oYnlQR95ibYo+osZW
 HSeJpsEOLEL/1assiEVRXbdIXHfgAK7cknCx1xgBh6nkkyeuoyu3YSdqURWia8Lcs5JT
 +LLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IFwI2Uq2
Subject: [Buildroot] [PATCH] support/scripts: use FKIE git tree
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we grab the per-year CVE feeds, in two passes: first, we grab
the meta files, and check whether something has changed since last we
downloaded it; second, we download the feed proper, unless the meta file
has not changed, in which case we use the locally cached feed.

However, it has appeared that the FKIE releases no longer provide the
meta files, which means that (once again), our daily reports are broken.

The obvious fix would be to drop the use of the meta file, and always
and unconditionally download the feeds. That's relatively trivial to do,
but he feds are relatively big (even as xz-xompressed).

However, the CVE database from FKIE is available as a git tree. Git is
pretty good as only sending delta when updating a local copy. The git
tree, however, contains each CVE as individual files, so it is
relatively easier to scan and parse.

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
---
 support/scripts/cve.py | 76 ++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 47 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 7167ecbc6a..88c7fde577 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -19,10 +19,9 @@
 
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
 
@@ -41,7 +40,7 @@ except ImportError:
 sys.path.append('utils/')
 
 NVD_START_YEAR = 1999
-NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download"
+NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/"
 
 ops = {
     '>=': operator.ge,
@@ -81,41 +80,24 @@ class CVE:
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
@@ -131,15 +113,15 @@ class CVE:
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
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
