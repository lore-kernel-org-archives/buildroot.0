Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ECDCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B3E4606AA;
	Sun, 18 Oct 2026 10:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UicVEL3iW5Z4; Sun, 18 Oct 2026 10:12:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 27D2C606BA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792318352;
	b=h0AC3hj7dmK6IRJfQcVlXW3XgmNwZYWaMouBVMYCxBv6msyGHQqfp9JFeAefTnTB8pG4
	 CXhtokcr8fPjPJltDV0mgvhPtbF7KP59rDCoucD52bDnK4OzxIDk/KsS4IiNo7ruRL9Qe
	 b80Fb7pHvgL49FnbSrsyUQbY5KifUN8Ddgz9t4hm4PbPsJ3bEeG6urMrhTVaP3QFSSDwD
	 H93R0WO11QXCCZXwSIu5BCnKNXnyhkso68ZrFqjsX3L65ueUF2ViX9DoJyntTdINWi3xN
	 JoxsQpAfXPinAkPDCbcWKS7gBkUJF0UBCI4XbCyF+odRdWoK0H2StoC556w9TDBnTcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792318352;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3I7TNdzpy9wYC74ZtGyPv+11v1WTY7AwqbtEF9IQupA=;
	b=iQ6UON7UAOtinLVpnIB2YPRdvkrUPx59wAlzCrNMcS7n8sAaTuBjLl6FQvOP1MwtbwVY
	 5WGMwhZ7dZ1LIChwlgv+wG4Eilidmo646fOyhspr9Dr+orLDMNiI+cMAxRfsi4+lpA+xa
	 k2uisfDKR6gSeoSuBtc12TCYCUDQJpVAg60MX4ST3cqc9U4rroJJSPFeYaMHidALE0Qqe
	 2XpVVZD+qMmC5AVEP5dUTNS5QRtvLh9ujimj9r1k/qvf7E17eCVJDRru57L7mqo9ehGPi
	 Ga3kYSVcJGyU9faKvocVyWM1wOoaB19//WRK4/bZLXgVO3CJ1FMqAH5Fulipdi4eZCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792318352;
	bh=3I7TNdzpy9wYC74ZtGyPv+11v1WTY7AwqbtEF9IQupA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l27wbZwVJ3CD56QBS6+uNncuEHZfN+ysQqgZZ2a8GxWatCUNF0c+KRUKpaLBl9YK1
	 Z1pQJG/59s3IYp4KxzU0VYCimeIrROUhZSVEITCT26OrbuM+WPhWkCnXhHznMQ1tCt
	 j5qU6PuYFPtV+hk156r0fYV+I1p3cD9RmM7ogAe1+DQCMB+CmyByF0EfbAdJCFBCFH
	 Ui5r/jWRyDyB4vpwTKEI5iaHwNFGgSopA9eTSDOmoDmTuw8cohPILgE9nXAKugS4Pn
	 +YKlkArMRKyuICe7Tgx4WwaWMEaHdKkBErwSlWxVjVSeOAQHcGVpMNNrOOP9qh6nqD
	 F6ryu/TMco6pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D2C606BA;
	Sun, 18 Oct 2026 10:12:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C04769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4256A40817
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKJVbtxcTRpN for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:12:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7B4E540808
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792318350;
 b=ZoXVJy4Z5zKwzFx2Q23v3DemuTpHbNCQ5rZAtXo8S6vvIdn54LJPXMbE5IiWsBUNlHsy
 FwBS8+KCb9aTTCCcuNlUdzoPKQTAEEyvb/YTPQjejpLhz4iWfk8cj39CLKHnG2wyWHpro
 yOwxaJS5E5sTpP+TuS2uaAf3jyib1dl4XMQzr9cmkiP2Ky1j8rsVwJTfRQQgVOMiLdMxj
 Db06rX7gfYhBK5VdK6REqLDXGdcbqvk9+tfVv8TDOLkzMzboUrRIlmmLqPEJKrqlgH83r
 8j14DwrrsqvKCcFmov+HmzLVe+Chh1x7KWT/j72Caef4+OjWVkR3xppEenS3xDHCKHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792318350;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=y3z4+BFmdfNJ+r90WPLWCbldPU0LyvyYEwyMOJyy94w=;
 b=G4xXWVnCMkuxly5DAC7L1CsOM57vrXLc0Rsd5Qr6Q8W0EA4a4dZaeBD/ADYKmy9K2gxT
 BLP892lhcgOE0dHAnKERcRFIGF3pMcH1Sa5SeiXqFjI0KDnZ6eUeav80UlL4SzDb211Ot
 RfZQ6K0LsJR5Pr4vZZMXacw95IxW9lfW9/QqYWK7EdOruxIIF2alTeTkXSvlIvAnHgYwE
 m7FZ4FSQGlY7wfh40SxreBVgjktZwdeasfJSxua3h2MAkdbcETmko4FXzqnthwaC+tQaP
 lNnaIsXdaKY+qWtEOmD0esqH70tlKjFdg/tPG2oT6hcvBPrxrrdfxtYs4vZt4QfDQzQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B4E540808
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BB0896ADF; Sun, 18 Oct 2026 10:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:11:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bd698cdd6b9ea2fb4ead725780c963311100852
X-Git-Newrev: 072720fb23b1881fc7943944cbbdd0158697a57b
X-Patchwork-Hint: ignore
Message-Id: <20261018101108.7BB0896ADF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snagboot: bump to version 3.0.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/072720fb23b1881fc7943944cbbdd0158697a57b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since v2.6.1, see:
https://github.com/bootlin/snagboot/releases/tag/v3.0
https://github.com/bootlin/snagboot/releases/tag/v3.0.1

Drop the patch that was merged upstream [1] and remove the obsolete
host-python-pyfatfs dependency.

[1] https://github.com/bootlin/snagboot/pull/95

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to release notes in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...over-utils.py-import-compression-modules-.patch | 57 ----------------------
 package/snagboot/snagboot.hash                     |  2 +-
 package/snagboot/snagboot.mk                       |  5 +-
 3 files changed, 3 insertions(+), 61 deletions(-)

diff --git a/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch b/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
deleted file mode 100644
index ea92c0caa2..0000000000
--- a/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From fa60aaf200eb1e6d31124ac3e7631e9e5458d145 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 8 Aug 2026 19:03:52 +0200
-Subject: [PATCH] src/snagrecover/utils.py: import compression modules when
- needed
-
-Commit 4f98bdec5ebeb13d9f851f848c3bd0086ef31eeb ("snagflash: Support
-on-the-fly decompression of input files") has added unconditional
-imports of lzma, bz2 and gzip Python modules, even if compressed input
-files are not used.
-
-Switch to dynamic imports where these modules are only imported
-on-demand. This allows to relax the need to have support for those
-modules in Python, which can be helpful in environments such as
-Buildroot where dependencies are kept to a minimum.
-
-Upstream: https://github.com/bootlin/snagboot/pull/95
-[Thomas: upstream version is different as upstream master branch also
-supports zstd compression, which wasn't supported as of v2.6.1 of
-snagboot]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/snagrecover/utils.py | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/snagrecover/utils.py b/src/snagrecover/utils.py
-index 8d240f6..dfe7d23 100644
---- a/src/snagrecover/utils.py
-+++ b/src/snagrecover/utils.py
-@@ -16,9 +16,7 @@ from snagrecover.usb import SnagbootUSBContext
- import yaml
- import importlib.resources
- 
--import lzma
--import bz2
--import gzip
-+from math import ceil
- 
- USB_RETRIES = 9
- USB_INTERVAL = 1
-@@ -47,10 +45,13 @@ def open_compressed_file(path: str, mode):
- 	comp = get_compression_method(path)
- 
- 	if comp == "xz":
-+		import lzma
- 		file = lzma.open(path, mode)
- 	elif comp == "bz2":
-+		import bz2
- 		file = bz2.open(path, mode)
- 	elif comp == "gz":
-+		import gzip
- 		file = gzip.open(path, mode)
- 	else:
- 		return open(path, mode)
--- 
-2.55.0
-
diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
index 09d765d9f5..7f28215061 100644
--- a/package/snagboot/snagboot.hash
+++ b/package/snagboot/snagboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b94184d9668c46cc2cf11002772ddb2fe06542f4f96cc6884342b5561d84b8d  snagboot-2.6.1.tar.gz
+sha256  084a48bfeb557014c194d64fe63ad376f203cd89ea28e1fc5d129bd08c91d29b  snagboot-3.0.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
index b3f699e988..7a0c9612cd 100644
--- a/package/snagboot/snagboot.mk
+++ b/package/snagboot/snagboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAGBOOT_VERSION = 2.6.1
+SNAGBOOT_VERSION = 3.0.1
 SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
 SNAGBOOT_LICENSE = GPL-2.0
 SNAGBOOT_LICENSE_FILES = LICENSE
@@ -17,8 +17,7 @@ HOST_SNAGBOOT_DEPENDENCIES = \
 	host-python-tftpy \
 	host-python-crccheck \
 	host-python-pylibfdt \
-	host-python-packaging \
-	host-python-pyfatfs
+	host-python-packaging
 
 # We do not install the dependencies for the snagfactory GUI
 define SNAGBOOT_REMOVE_SNAGFACTORY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
