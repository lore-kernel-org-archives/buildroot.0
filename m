Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F94C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 17:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2889980EA1;
	Sat,  8 Aug 2026 17:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiNXkpc1ff4p; Sat,  8 Aug 2026 17:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA1580E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786209132;
	bh=jPkLwy+n+dzYL97/2Qxm+IJHX/0rn8jsKpM3UcvIe40=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JZEigeU+i4Dr9C0+TbupFzFeMXMQdNw/9N+FxU1ynJn5+foEdULJJEleU6Q6SoJv2
	 aRXc4VKwK2/uGFjJHvrkjVjuKexvgQtBkKK0xVo2xtdayZEjXygd3WkOVvEm3CFcZJ
	 1U2wCR6s0pBbL4/0sexVhjNRUaAxCGc5KBEWv6a5HnLF0iTXQt9lEmyeEuRmkWFuxT
	 iw1VkgJ7o8lg0JofekfldjHbncdlC4GRdIXQGfSdAuO8c6in5McMLYeW8A7yt3wvcZ
	 cTRiwLy30gko10rjUkK+EwRdP6HR/SeX2oZ8YYr/t7lWfbQKIJU+Y5zYI4UWfe9Pcz
	 GggZK9E3G/hig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA1580E93;
	Sat,  8 Aug 2026 17:12:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ECC31AF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90BF56064B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaGMJ5xOr9vh for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 17:12:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60B29605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B29605F9
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60B29605F9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:12:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 94D651A14CF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:12:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69D2D6045E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:12:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B0AE11C485DB; 
 Sat,  8 Aug 2026 19:12:00 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 19:11:55 +0200
Message-ID: <20260808171156.1421460-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786209122; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ZA4roI2uM2Ze+xSCXrYoxqiJ2VTMLp0yEk/cK/Aav7Y=;
 b=LmLs8ncK8UO+0TdXv+hIcc8qNGH7xa7SJrIdqMCfelUxhmLmWEJeb4jFKzEQPtANw6Bpi2
 RRxOONv+opMhrRvg4OVpGxmwWtzJ+oZNtWyM6+xqJeCWxzrnYRedPGB/fncC0EDN29NjBN
 qlkmejgL4Sxt9RtvwWsrccdMdijWsFRL/kyG01AdIuxIJHY5gsLVCxxbzLjgjMyL5CD/H0
 r/CdiG4N5s62NrTmRFzuJSypZhj3t/OrgmyliJQJaBDTbZ0Cx6DxMQXELj2wySAmWL9xP3
 C9mZ6pgelF9YRyBfsIZ0kT5lvctzHgnPc4cGQKTqlTeBHDwR16i4d1GhXZuU4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=LmLs8ncK
Subject: [Buildroot] [PATCH] package/snagboot: bump to version 2.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog 2.5..2.6:

treewide:
Migrate documentation to readthedocs
Emit more specific error messages for USB permission-based access issues
Add unit tests

snagflash:
Support compressed input files, e.g. *.wic.bz2
Refactor fastboot-uboot logic to factor out common code and improve logging
Automatically detect when oem_run isn't supported by U-Boot, and fallback to ucmd

snagrecover:
Support Renesas RZ/N1 platforms
Support SoC model aliases, and add i.MX8MP alias
Handle relative path prefixes with the -F syntax

Changelog 2.6..2.6.1:

snagrecover:
Correct i.MX93 ROM code recovery which doesn't support control endpoint HID commands
Add multi-board support to AM335x recovery setup script
Add i.MX7Solo support

treewide:
Fix broken links in documentation
Drop Python 3.9 support
Add CI for Python 3.14

One packaging-related change is that Snagboot would now
unconditionally import the bzip2, gzip and lzma Python modules, which
are not necessarily available. Since these are only needed when
compressed images are provided as input, we submitted a patch upstream
to make those imports only when compressed files are provided as
input, relaxing those dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...utils.py-import-compression-modules-.patch | 57 +++++++++++++++++++
 package/snagboot/snagboot.hash                |  2 +-
 package/snagboot/snagboot.mk                  |  2 +-
 3 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch

diff --git a/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch b/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
new file mode 100644
index 0000000000..ea92c0caa2
--- /dev/null
+++ b/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
@@ -0,0 +1,57 @@
+From fa60aaf200eb1e6d31124ac3e7631e9e5458d145 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 8 Aug 2026 19:03:52 +0200
+Subject: [PATCH] src/snagrecover/utils.py: import compression modules when
+ needed
+
+Commit 4f98bdec5ebeb13d9f851f848c3bd0086ef31eeb ("snagflash: Support
+on-the-fly decompression of input files") has added unconditional
+imports of lzma, bz2 and gzip Python modules, even if compressed input
+files are not used.
+
+Switch to dynamic imports where these modules are only imported
+on-demand. This allows to relax the need to have support for those
+modules in Python, which can be helpful in environments such as
+Buildroot where dependencies are kept to a minimum.
+
+Upstream: https://github.com/bootlin/snagboot/pull/95
+[Thomas: upstream version is different as upstream master branch also
+supports zstd compression, which wasn't supported as of v2.6.1 of
+snagboot]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/snagrecover/utils.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/snagrecover/utils.py b/src/snagrecover/utils.py
+index 8d240f6..dfe7d23 100644
+--- a/src/snagrecover/utils.py
++++ b/src/snagrecover/utils.py
+@@ -16,9 +16,7 @@ from snagrecover.usb import SnagbootUSBContext
+ import yaml
+ import importlib.resources
+ 
+-import lzma
+-import bz2
+-import gzip
++from math import ceil
+ 
+ USB_RETRIES = 9
+ USB_INTERVAL = 1
+@@ -47,10 +45,13 @@ def open_compressed_file(path: str, mode):
+ 	comp = get_compression_method(path)
+ 
+ 	if comp == "xz":
++		import lzma
+ 		file = lzma.open(path, mode)
+ 	elif comp == "bz2":
++		import bz2
+ 		file = bz2.open(path, mode)
+ 	elif comp == "gz":
++		import gzip
+ 		file = gzip.open(path, mode)
+ 	else:
+ 		return open(path, mode)
+-- 
+2.55.0
+
diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
index 6fff4c94c1..09d765d9f5 100644
--- a/package/snagboot/snagboot.hash
+++ b/package/snagboot/snagboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  03b3793feb9d926f5cb4f1c89f7a22075247fe91942c7be13065b6b62029376e  snagboot-2.5.tar.gz
+sha256  0b94184d9668c46cc2cf11002772ddb2fe06542f4f96cc6884342b5561d84b8d  snagboot-2.6.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
index 64b8b6fcc9..b3f699e988 100644
--- a/package/snagboot/snagboot.mk
+++ b/package/snagboot/snagboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAGBOOT_VERSION = 2.5
+SNAGBOOT_VERSION = 2.6.1
 SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
 SNAGBOOT_LICENSE = GPL-2.0
 SNAGBOOT_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
