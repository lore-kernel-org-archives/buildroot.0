Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C856CA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 19:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40836613BE;
	Mon, 22 Sep 2025 19:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U02NvHPLAx_9; Mon, 22 Sep 2025 19:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 508C16169C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 508C16169C;
	Mon, 22 Sep 2025 19:59:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7DBC498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA0E26169C
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TxPw-bltIXy for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 19:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 066FD613BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 066FD613BE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 066FD613BE
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:59:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2051901418; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Sep 2025 19:59:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v0mgh-00GFg2-0m;
 Mon, 22 Sep 2025 21:59:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 21:59:01 +0200
Message-Id: <20250922195902.3873493-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WEo9/G35+7mJ2kp4N8E+hEnPuyKkvAUs3owyQNTEm2lY7kMFSGcs26WY6bM5MZ9lp5IPCzD8hDM1Wzf6qFvqmTc6OAGDdDeNW3LSIPK4w8esC1V362L+8YYMKb2mFNZ6qItoMZYAk9fMaHe7jRQYYJ6qkB8f9NY582E5fcVccWmJBTH519jzL7TLc8tPdg2n6DXVcw/ItkT6JFVJL8EgQp/tmvAuCWmQCCf3tfw9Af6XTkhI3KO8zNENVI8so3dGxFSWVRw3sLKVldYUIy7eMeilDc2P6DbXbH3eAgC05QXOH+Vgp9M32r1nfM4h5gw56zp/QU7WiDIhMuAdblo+hA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=GxSWrqjiM8hYXuCQFiEPzpFMIEYMjQ7WqIq8qgaTIR8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WEo9/G35
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/openjpeg: bump version to 2.5.4
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And drop now included security patch. For details, see:

https://github.com/uclouvain/openjpeg/releases/tag/v2.5.4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...check-for-error-after-parsing-header.patch | 41 -------------------
 package/openjpeg/openjpeg.hash                |  2 +-
 package/openjpeg/openjpeg.mk                  |  5 +--
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 package/openjpeg/0001-check-for-error-after-parsing-header.patch

diff --git a/package/openjpeg/0001-check-for-error-after-parsing-header.patch b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
deleted file mode 100644
index 9a02fbf3d4..0000000000
--- a/package/openjpeg/0001-check-for-error-after-parsing-header.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
-From: Sebastian Rasmussen <sebras@gmail.com>
-Date: Thu, 16 Jan 2025 02:13:43 +0100
-Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
-
-Consider the case where the caller has not set the p_image
-pointer to NULL before calling opj_read_header().
-
-If opj_j2k_read_header_procedure() fails while obtaining the rest
-of the marker segment when calling opj_stream_read_data() because
-the data stream is too short, then opj_j2k_read_header() will
-never have the chance to initialize p_image, leaving it
-uninitialized.
-
-opj_jp2_read_header() will check the p_image value whether
-opj_j2k_read_header() suceeded or failed. This may be detected as
-an error in valgrind or ASAN.
-
-The fix is to check whether opj_j2k_read_header() suceeded before
-using the output argument p_image.
-
-Upstream: https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d
-CVE: CVE-2025-54874
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/lib/openjp2/jp2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
-index 4df055a54..da5063186 100644
---- a/src/lib/openjp2/jp2.c
-+++ b/src/lib/openjp2/jp2.c
-@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
-                               p_image,
-                               p_manager);
- 
--    if (p_image && *p_image) {
-+    if (ret && p_image && *p_image) {
-         /* Set Image Color Space */
-         if (jp2->enumcs == 16) {
-             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 1992d5ca6a..3fda2a243b 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  368fe0468228e767433c9ebdea82ad9d801a3ad1e4234421f352c8b06e7aa707  openjpeg-2.5.3.tar.gz
+sha256  a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a  openjpeg-2.5.4.tar.gz
 sha256  a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 7b1352c222..bc5d8143a6 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.5.3
+OPENJPEG_VERSION = 2.5.4
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_CPE_ID_VENDOR = uclouvain
 OPENJPEG_INSTALL_STAGING = YES
 
-# 0001-check-for-error-after-parsing-header.patch
-OPENJPEG_IGNORE_CVES += CVE-2025-54874
-
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
