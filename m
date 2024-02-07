Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A8CC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D818333F;
	Wed,  7 Feb 2024 15:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nw4MsLIzMfvZ; Wed,  7 Feb 2024 15:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 576E5839E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 576E5839E5;
	Wed,  7 Feb 2024 15:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFDF41BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD7D081FD2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLrmYGK8C4dn for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4350281DF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4350281DF0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4350281DF0
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:35:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so596119f8f.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 07:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707320121; x=1707924921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gs5mfd0hfqxFFUOFqvL/kudcMqcYSaZR7VNpHtEj/yU=;
 b=od9U4r1JEVZyTf/7UF4mKCDsIK8+rM2JUKFFzbQq7pmgi8ZhAElbuXO328AzwSuBf1
 KKKHA2yPkNUR/m0Wn7o+53v3Tzp01VL78VscCiuRG0Ktq8yKvATDZslO5mcUXhOQY48+
 uVtYB9wGmLLKFMJLasGrb7L94kVXVJvsByE3gbjIE1FGYbQ/IIN7orSIYbC1oTAITuyn
 FPtdMsr6JBsB/O9KZUmkQsSY2aA6jUiM3AaQw8Q6vH0OSJ/W7GR6C5c+OfrLM+5owV1L
 sMFk/LWScGQfICAs0gyntpNPDAgKj1ExhvAzlFWEUYF/rLxCrW/m8qh3HIDDv7ad8N6O
 gP7Q==
X-Gm-Message-State: AOJu0Ywa41rvOQPzU7CWepmk6NbD/W+jWB86YQAYtkfxUOedP7sUMukP
 FfkcV17nexgYVz7Td/yV8P5hE89xEmfoVQfd12w0F2/cm2uVzSD2IddUMyQE5auxxMKkCiM5xaF
 c
X-Google-Smtp-Source: AGHT+IHU7BcFIcgI7Kt13lsFwlzepTaC3aJFB/FGdSkGC9EzU0jCIbHxVE4L9vRDYQVNYM8y849eLg==
X-Received: by 2002:a05:6000:1568:b0:33b:36d5:a32b with SMTP id
 8-20020a056000156800b0033b36d5a32bmr5737742wrz.12.1707320121412; 
 Wed, 07 Feb 2024 07:35:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFsRweFNdzlhngw6E0cLOTGWwoUFsU1Zlplg80nHnyb2CfEHi+iuG/4old39GAqhBiu3yj3d1XEvhInXdI
Received: from arnoutx1.. ([85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040fddaf9ff4sm5703632wms.40.2024.02.07.07.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:35:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 16:35:18 +0100
Message-ID: <20240207153519.657048-2-arnout@mind.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207153519.657048-1-arnout@mind.be>
References: <20240207153519.657048-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707320121; x=1707924921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gs5mfd0hfqxFFUOFqvL/kudcMqcYSaZR7VNpHtEj/yU=;
 b=SqdActsf691DM5ER/EEUhzuSB8oqXlc5YWx0SM9M8eE+OssZD9hwtqoolBV1O0dQbw
 pr+W7aMR0izBLbvy7cIXSQOVvD1hbGeTYp0yzZrIv7Mqr2DZyNb0/8ljAgNsDa62S8zt
 Mvvh+NvJHf9N7aNbwQMopszmscj81OwTq4Gsn23Q2eJEOwHGWleORAhGX4sYGwfaqOz9
 qU6UQB+zDWxQM8/JShQtROWXY9uaUXVd6rF5qcml5opKJhfznBOcoD1eZHHjqwpF/s+6
 Vh4cYWQt2RIBLR1ZV2EYmvhSz/9+92Whq/aey/w8Lbatr7u4uN7Pr8Iozib1qs+uidPO
 +cVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SqdActsf
Subject: [Buildroot] [PATCH 2/3] support/scripts/cve.py: switch from NVD to
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Even better would be to clone the
https://github.com/fkie-cad/nvd-json-data-feeds repository so we can
cache with simple "git pull". I leave that as an exercise to the reader
:-)
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
