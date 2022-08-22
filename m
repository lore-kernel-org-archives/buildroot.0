Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CE1C32792
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 06:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87C5B405FC;
	Mon, 22 Aug 2022 06:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C5B405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02tURFJZCKhk; Mon, 22 Aug 2022 06:02:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B5144060E;
	Mon, 22 Aug 2022 06:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B5144060E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4071BF48B
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 06:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB42581C2F
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 06:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB42581C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FU3y2hYjK4NS for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 06:02:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBB281C21
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECBB281C21
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:02:07 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so11720264fac.2
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 23:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=udDkU2yK0Es3gM0mmTb2yooz3cb+DOcYjUKwm3a7KKc=;
 b=qm3QwEuGrrn/ANMRaPIv1SsmHx7q1jMGQiqLJBhWh6ZeKD8I1OG8uXchq7StVkrmxZ
 0nk/KDAQir2I/GbJEj3x9psMh3FtBl/jC6ECzgr2V/4hdXJNSP4Hx+zj9PxELPjkjR4a
 JjsFV2r4WexqLQ2U7IUU01ecFqxMIfaqY91Hgw+ZLFsFIhA/czSwz6J8Dlmz0AQGpqPm
 MWgtR+v2Wqd9YKH6/aAkrk1I3bf5/1HwejS0F2SN4RTJxAW1rq6J+1IURc2K5/2dXOSY
 t/xlF6gVVZNOWRfsStPEtqAatH6OZsQdVhnoAu8JnDukbbPK1qQ0oXrQzKtoF+qbsb/I
 1DvQ==
X-Gm-Message-State: ACgBeo3UZc1m3on/x0/msWM+wu2Vi5+oHBreKVPwrVP9Jf6OXhXoc9T4
 KLPAukMKVvZnXLdj9yqBp2Fx1Y4dMoE=
X-Google-Smtp-Source: AA6agR6A/bAS3LGjcqKlYcnnC/isdTT+0Tl3vFNwCoWmrl2/yTWXEsNce7pC+UyiM2lgDNTw81TvMg==
X-Received: by 2002:a05:6870:c897:b0:11b:de9f:57c2 with SMTP id
 er23-20020a056870c89700b0011bde9f57c2mr11243230oab.267.1661148126244; 
 Sun, 21 Aug 2022 23:02:06 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 z20-20020a544594000000b00344eb5a9416sm2462338oib.55.2022.08.21.23.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 23:02:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 00:02:01 -0600
Message-Id: <20220822060201.3333515-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=udDkU2yK0Es3gM0mmTb2yooz3cb+DOcYjUKwm3a7KKc=;
 b=F9jCzrfJ1745HEJ/yc1QuwKNgelGGRio6qfj9av0BcxC0ae6n0lXwvl6T/0gHXEsXz
 HaxcERO/knreY1InuGeNWQoQ59YfeRHCM0OUGGYlF4kR3QcFy+tQyumDHfCYS2i/62Hu
 XXOttPjxjO4Cn9jUdV55XVsBtIbNka1IEjJsiSqbSOVP4oKJBAwn6BvJx3vInTdMD8Dv
 vTgU5wGB6VA8q/vsEOv55hJbtMHmquVBm+OE31mFWA+WhvQ2yTZtMWnAMn9NpMo5MOZ3
 rjrGVkhUiWq+VqOLyZBdsVfnn5/IauaYja+WJlxMz0Rp/fhr5bN0lGML/iXZVGts5kX6
 JyRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F9jCzrfJ
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-python: clean conflicting
 pep517 packages before install
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python installer package isn't able to overwrite packages that
already exist, this causes problems when doing a rebuild or update
without a full clean.

To fix this we can use functionality from importlib to identify and
remove any conflicting python package files before installation.

Since we are adding this functionality to our pyinstaller.py script
we must also use pyinstaller.py for host python packages to avoid
hitting this issue there as well.

Fixes:
Traceback (most recent call last):
  File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 69, in <module>
    main()
  File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 61, in main
    install(
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/_core.py", line 109, in install
    record = destination.write_file(
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 207, in write_file
    return self.write_to_fs(scheme, path_, stream, is_executable)
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 167, in write_to_fs
    raise FileExistsError(message)
FileExistsError: File already exists: /home/buildroot/buildroot/output/target/usr/lib/python3.10/site-packages/tinycss2/__init__.py

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
Changes v1 -> v2:
  - remove unused os import
---
 package/pkg-python.mk          | 12 ++++++++++--
 support/scripts/pyinstaller.py | 22 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5794e3a195..b147827821 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -139,6 +139,14 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_PEP517_ENV = \
 	$(HOST_PKG_PYTHON_ENV)
 
+HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
+	--interpreter=/bin/python \
+	--script-kind=posix \
+	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(HOST_DIR)/bin \
+	--data=$(HOST_DIR)
+
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
@@ -200,7 +208,7 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
-$(2)_BASE_INSTALL_CMD = -m installer dist/*
+$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 ifeq ($(4),target)
@@ -208,7 +216,7 @@ $$(error flit-bootstrap setup type only supported for host packages)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m flit_core.wheel
-$(2)_BASE_INSTALL_CMD ?= -m installer dist/*
+$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
index 6dd9242327..d9b77cac19 100755
--- a/support/scripts/pyinstaller.py
+++ b/support/scripts/pyinstaller.py
@@ -2,12 +2,33 @@
 
 import argparse
 import glob
+import pathlib
+
+from importlib.machinery import PathFinder
+from importlib.metadata import DistributionFinder
 
 from installer import install
+from installer._core import _process_WHEEL_file
 from installer.destinations import SchemeDictionaryDestination
 from installer.sources import WheelFile
 
 
+def clean(source, destination):
+    scheme = _process_WHEEL_file(source)
+    scheme_path = destination.scheme_dict[scheme]
+    context = DistributionFinder.Context(
+        name=source.distribution,
+        path=[scheme_path],
+    )
+    for path in PathFinder.find_distributions(context=context):
+        if not path.files:
+            continue
+        for file in path.files:
+            file_path = pathlib.Path(file.locate())
+            if file_path.exists():
+                file_path.unlink()
+
+
 def main():
     """Entry point for CLI."""
     ap = argparse.ArgumentParser("python pyinstaller.py")
@@ -58,6 +79,7 @@ def main():
     )
 
     with WheelFile.open(glob.glob(args.wheel_file)[0]) as source:
+        clean(source, destination)
         install(
             source=source,
             destination=destination,
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
