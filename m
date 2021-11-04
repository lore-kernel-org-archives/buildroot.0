Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C40C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 18:28:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C608660F9B
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 18:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C608660F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 862224025D;
	Thu,  4 Nov 2021 18:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faSfUtv-ODSE; Thu,  4 Nov 2021 18:28:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9698440267;
	Thu,  4 Nov 2021 18:28:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32CCD1BF3AD
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 18:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F45081980
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 18:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDc1IEv8q6J3 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 18:28:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5E9C8197D
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 18:28:00 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d21so4966916qtw.11
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M4iuNOyUN68Nq2o9LVRKLjYVWSaG909zU7hcAcB650I=;
 b=OvB7T1QCXEcieKq2FqqFyiulxEttINqMBPAX1w9br52F91oMdqfddw1A2Vs1FxYnXT
 LBA7Pv5LF7CyZseN6KKMhrfxMmuSZQRFq8UszjBTlBkIN82yXxI1MAC1crGkbdejTapE
 c20q18hBpjJ9LxCdzQSeP/PytOeOMi9dLIjOvy3ckKQwabDX20jpB0WIY/a/aKMbKES1
 MBvOAxiArCmIgrziRfOy4eqjlXwAyZYIYgfkrh3yhvS94cxHLheJfRQ3RS/hLeITYQVO
 6ox9o3EYMYBCNFhabQWF92VJcKc2/KhJUn4b1Px6+LlKX8CDPjquOM/JAhah6DbWx8XE
 vCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M4iuNOyUN68Nq2o9LVRKLjYVWSaG909zU7hcAcB650I=;
 b=Enu+eZHAfFAZXsAZqo6Qw/jazAjsTD4vX0xqAKKro5AZNqSNTgZOySutuydoRkIbPQ
 KoeMthHhcVaRLOPvNirHr9NQZIQHkyWKjiYLkbPUxBgoOX4m0GcNNkRvlNZheD4ze07i
 DS/KdyHkAp26Sq0Hp9iWvEfX8rdq5KIJJZjhBdURNqT/HQ69wlSVvO4UWfk/Sbc6BlOe
 df/SzyjmuqwxcJDqxKkAkGsKgQzbmbbz6EX+ayH+uROq183IFCBfE3WM6WkOYtOurveo
 IQcsxeOYRrzw8PecrXCFQyZLzZ9jKQlbejG0H08zz/JY+yNQ5Kbwg6WWIwaiCVtWhFso
 OjOA==
X-Gm-Message-State: AOAM531XGKEQ+MpyWHKskv+J8sD0seRu40vYL0WFxPaQgXzPoiGAMKdC
 auC5nGWe9J3VR2treHbbhb39QjmxYnY=
X-Google-Smtp-Source: ABdhPJwi4PRbaHAQ74oW5FsjwMXep9UA5v1a3Roj9f/4ruRjAAfMY2ivc+ZjGFpFvPso+uK4zxMtLA==
X-Received: by 2002:a05:622a:1744:: with SMTP id
 l4mr38575462qtk.271.1636050479339; 
 Thu, 04 Nov 2021 11:27:59 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id y25sm4244253qkj.15.2021.11.04.11.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 11:27:59 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 11:27:56 -0700
Message-Id: <20211104182756.1313345-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcm-tools: bump to version 202110
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
  - Update LICENSE hash due to a year bump.

  - Remove 0001-Look-for-pcm-core-at-the-default-path.patch in favor of
    the upstream patch
    0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch

  - Add -fPIC to the CXXFLAGS to prevent the error:
  "msr.o: relocation R_X86_64_PC32 against symbol `_ZTVN3pcm9MsrHandleE' can
  not be used when making a shared object; recompile with -fPIC"

  - Depend on Python3 for the pmu-query script.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...ook-for-pcm-core-at-the-default-path.patch |  46 --------
 ...-python3-errors-add-linux-platform-s.patch | 103 ++++++++++++++++++
 package/pcm-tools/Config.in                   |  10 +-
 package/pcm-tools/pcm-tools.hash              |   4 +-
 package/pcm-tools/pcm-tools.mk                |   4 +-
 5 files changed, 111 insertions(+), 56 deletions(-)
 delete mode 100644 package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch
 create mode 100644 package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch

diff --git a/package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch b/package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch
deleted file mode 100644
index 933eec0237..0000000000
--- a/package/pcm-tools/0001-Look-for-pcm-core-at-the-default-path.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 53b6161d2413406778fa222274069c82846f0297 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.com.br>
-Date: Thu, 6 Dec 2018 21:17:02 -0200
-Subject: [PATCH] Look for pcm-core at the default path
-
-On Buildroot, pcm-core.x is installed as /usr/bin/pcm-core. Remove the
-platform test, since we know that it's neither CigWin nor Windows, and
-use the default path.
-
-It's not nice to have a Buildroot specific patch but let's use one while
-we look for a solution that is acceptable upstream.
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- pmu-query.py | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/pmu-query.py b/pmu-query.py
-index 4c596c7..dc39df6 100755
---- a/pmu-query.py
-+++ b/pmu-query.py
-@@ -3,7 +3,6 @@ import urllib2
- import json, csv
- import subprocess
- import sys
--import platform
- import getopt
- 
- all_flag = False
-@@ -38,12 +37,7 @@ if filename == None:
-         except StopIteration:
-             break
- 
--    if platform.system() == 'CYGWIN_NT-6.1':
--        p = subprocess.Popen(['./pcm-core.exe -c'],stdout=subprocess.PIPE,shell=True) 
--    elif platform.system() == 'Windows':
--        p = subprocess.Popen(['pcm-core.exe -c'],stdout=subprocess.PIPE,shell=True)
--    else:
--        p = subprocess.Popen(['./pcm-core.x -c'],stdout=subprocess.PIPE,shell=True)
-+    p = subprocess.Popen(['/usr/bin/pcm-core -c'],stdout=subprocess.PIPE,shell=True)
- 
-     (output, err) = p.communicate()
-     p_status = p.wait()
--- 
-2.19.2
-
diff --git a/package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch b/package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch
new file mode 100644
index 0000000000..e49015f2d1
--- /dev/null
+++ b/package/pcm-tools/0001-pmu-query.py-fix-python3-errors-add-linux-platform-s.patch
@@ -0,0 +1,103 @@
+From 36b9aa5a8e071ac6349d2d7f9c23a25abcdc316d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Tue, 2 Nov 2021 10:30:55 -0700
+Subject: [PATCH] pmu-query.py: fix python3 errors, add linux platform support
+
+Unfortuantly, commit 0212b382624c744491a845c75dfb2a527d4a821f broke pmu-query
+in some unexpected ways.
+
+First, urllib.request.urlopen returns a bytes-object in Python3, which results
+in the csv.DictReader throwing the error: `TypeError: initial_value must be
+str or None, not HTTPResponse` A simple .read().decode('utf-8') appended to
+the end of urlopen fixes the error.
+
+Second, passing the map_file_raw string to DictReader results in a malformed
+dictionary. Fix this by wrapping the raw text string in io.StringIO().
+
+Third: During the python2 -> python3 refactoring, I accidentally switched some
+logic in the pull request. `if core_path != ''` changed to `if not core_path`,
+which breaks the logic, the same goes for
+`if offcore_path != ''` -> `if not offcore_path`. Change these to
+`if core_path` and `if offcore_path` respectively.
+
+From upstream commit: 7a670261c2063595f2330e6cc2a7f19eb18b6ea8
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ pmu-query.py | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/pmu-query.py b/pmu-query.py
+index 5595819..bc1e57b 100755
+--- a/pmu-query.py
++++ b/pmu-query.py
+@@ -1,4 +1,5 @@
+ #!/usr/bin/env python3
++import io
+ import urllib.request
+ import urllib.parse
+ import json
+@@ -8,6 +9,7 @@ import sys
+ import platform
+ import getopt
+ import re
++import shutil
+ 
+ all_flag = False
+ download_flag = False
+@@ -29,8 +31,8 @@ except getopt.GetoptError as err:
+     sys.exit(-2)
+ 
+ if filename is None:
+-    map_file_raw = urllib.request.urlopen("https://download.01.org/perfmon/mapfile.csv")
+-    map_dict = csv.DictReader(map_file_raw)
++    map_file_raw = urllib.request.urlopen("https://download.01.org/perfmon/mapfile.csv").read().decode('utf-8')
++    map_dict = csv.DictReader(io.StringIO(map_file_raw), delimiter=',')
+     map_file = []
+     core_path = ""
+     offcore_path = ""
+@@ -45,20 +47,26 @@ if filename is None:
+         p = subprocess.Popen(["./pcm-core.exe -c"], stdout=subprocess.PIPE, shell=True)
+     elif platform.system() == "Windows":
+         p = subprocess.Popen(["pcm-core.exe", "-c"], stdout=subprocess.PIPE, shell=True)
++    elif platform.system() == "Linux":
++        pcm_core = shutil.which("pcm-core")
++        if not pcm_core:
++            print("Could not find pcm-core executable!")
++            sys.exit(-1)
++        p = subprocess.Popen([pcm_core, "-c"], stdout=subprocess.PIPE, shell=True)
+     else:
+         p = subprocess.Popen(["./pcm-core.x -c"], stdout=subprocess.PIPE, shell=True)
+ 
+     (output, err) = p.communicate()
+     p_status = p.wait()
+     for model in map_file:
+-        if re.search(model["Family-model"], output):
++        if re.search(model["Family-model"], output.decode("utf-8")):
+             if model["EventType"] == "core":
+                 core_path = model["Filename"]
+             elif model["EventType"] == "offcore":
+                 offcore_path = model["Filename"]
+             print(model)
+ 
+-    if not core_path:
++    if core_path:
+         json_core_data = urllib.request.urlopen(
+             "https://download.01.org/perfmon" + core_path
+         )
+@@ -67,10 +75,10 @@ if filename is None:
+             with open(core_path.split("/")[-1], "w") as outfile:
+                 json.dump(core_events, outfile, sort_keys=True, indent=4)
+     else:
+-        print("no core event found for %s CPU, program abort..." % output)
++        print("no core event found for %s CPU, program abort..." % output.decode("utf-8"))
+         sys.exit(-1)
+ 
+-    if not offcore_path:
++    if offcore_path:
+         json_offcore_data = urllib.request.urlopen(
+             "https://download.01.org/perfmon" + offcore_path
+         )
+-- 
+2.32.0
+
diff --git a/package/pcm-tools/Config.in b/package/pcm-tools/Config.in
index f347a265a4..ca9719dc5f 100644
--- a/package/pcm-tools/Config.in
+++ b/package/pcm-tools/Config.in
@@ -18,16 +18,14 @@ config BR2_PACKAGE_PCM_TOOLS
 
 if BR2_PACKAGE_PCM_TOOLS
 
-# The pmu-query script is not compatible with Python 3
 config BR2_PACKAGE_PCM_TOOLS_PMU_QUERY
 	bool "install the pmu-query script"
 	default y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_CA_CERTIFICATES # https
-	select BR2_PACKAGE_PYTHON_HASHLIB # urllib2
-	select BR2_PACKAGE_PYTHON_SSL # urllib2
+	select BR2_PACKAGE_PYTHON3_SSL # urllib2
 
-comment "pmu-query needs Python 2.x"
-	depends on !BR2_PACKAGE_PYTHON
+comment "pmu-query needs Python3"
+	depends on !BR2_PACKAGE_PYTHON3
 
 endif
diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index 77f1482462..1853dcebb5 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 798eb1bc5d9c34fa107de21b2100e8d4326cb45b613bc35baa1e1efb1dd13b04  pcm-tools-201812.tar.gz
-sha256 fac73f62c4d665c82622862a2be2b89713e0f480c93e593af2d8ef29a13d814b  LICENSE
+sha256  aa48ab1473720aeb7837b67bfc612100f484748720a8b8034daff00419709057  pcm-tools-202110.tar.gz
+sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index 6de11c0da2..8a58034232 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCM_TOOLS_VERSION = 201812
+PCM_TOOLS_VERSION = 202110
 PCM_TOOLS_SITE = $(call github,opcm,pcm,$(PCM_TOOLS_VERSION))
 PCM_TOOLS_LICENSE = BSD-3-Clause
 PCM_TOOLS_LICENSE_FILES = LICENSE
@@ -16,7 +16,7 @@ PCM_TOOLS_EXE_FILES = \
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC" \
 		UNAME=Linux HOST=_LINUX
 endef
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
