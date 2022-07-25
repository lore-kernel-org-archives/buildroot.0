Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F930C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 06:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD10417A9;
	Mon, 25 Jul 2022 06:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD10417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPbI6jmW8Alw; Mon, 25 Jul 2022 06:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8064F41733;
	Mon, 25 Jul 2022 06:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8064F41733
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2DA01BF38C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DB2181468
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB2181468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrQ7p2P8vs94 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 06:43:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A143D813ED
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A143D813ED
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 06:43:42 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id v2so1863667ilm.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jbmh6L1lyJ4BYgZRrQTQOLseufkuHaxOMvJKkazd2Y8=;
 b=EZS/bvSNzLn13fmyIwWVaI1HGtIFc4cwq1gXavv7RBb9Q/Pcdl48+nt1JfXXCPZbEn
 8S8uKJseJZpcxUfQjuZShqXBSWHBvdwHVXFN0yP8eklQXEdCCezRp59HN9UKWS7UNaMG
 Mqk4qaSiEVCuaZUB2QeTRp8/gEuvfvvHy0ya108+Kuca0qjqbm+/pJOY7juPhfhIpYzl
 rh+h09nbcPGgusd5fp4jhtAPbqRD0ZG6fVaIppqvhyefrTKALy+txWmiExX6jdHaKxeb
 2q0JnsPcw95eS7ZxCkfgqsDEXv4Vr6s0lbpzWY/wbAY5ZKaRo+6mmiupsGLq93rI+uAO
 qqYA==
X-Gm-Message-State: AJIora+jqMqMQWmAQnsYEuwRrLqaVkbPzJ3xh5NPb9V+Z2CoHg/GV6Xa
 FVpkN0qgPRR/fWJHGZVR9sdMzM8m4RkTpg==
X-Google-Smtp-Source: AGRyM1vqy2laWYyAadH6FSfJJ0ODb5sdrYYsdQM2SnXU8d7MWyJr6868+dRYf0Td6GUsaHpQ3/Dx+Q==
X-Received: by 2002:a92:c544:0:b0:2dc:f222:9fba with SMTP id
 a4-20020a92c544000000b002dcf2229fbamr4447168ilj.270.1658731420654; 
 Sun, 24 Jul 2022 23:43:40 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 g1-20020a056602072100b0067ba7abc4cesm5520708iox.50.2022.07.24.23.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 23:43:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 00:43:38 -0600
Message-Id: <20220725064338.1326554-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jbmh6L1lyJ4BYgZRrQTQOLseufkuHaxOMvJKkazd2Y8=;
 b=IBmSG24SdOz/Aaq4H+8a9scvq1FwwfloRFzquMaLPxeqQW8ekkZMe2ikTsD5Z+eHKz
 ft8joRvbyV0Wr+ctNA6x17tHO0lMvKl1TXp+ePZ6y5P1qKQOgKIm8GH0souL1jPFDNk4
 5jTU4n5nSztcpFb6aj9Qpk+0m62Cxqcd9WTDx/iMSIxc/E1xHGwKvBgn8W4JHfEmXONX
 JqhrbytoHCXjR1IsBBv5mHcLbAkzbrCBt00BOcYYla9mni1jqXwkgELcctgcbzS4A+L5
 CHwyQq1R7Ym+VWlu8D75UiN1QvIeKbMNq+9TXNSFnAn0ia/G44ul5Q2Z1yYyDJAb6xn5
 XHLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IBmSG24S
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: clean conflicting
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
---
 package/pkg-python.mk          | 12 ++++++++++--
 support/scripts/pyinstaller.py | 23 +++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

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
index 6dd9242327..1ab1b83178 100755
--- a/support/scripts/pyinstaller.py
+++ b/support/scripts/pyinstaller.py
@@ -2,12 +2,34 @@
 
 import argparse
 import glob
+import os
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
@@ -58,6 +80,7 @@ def main():
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
