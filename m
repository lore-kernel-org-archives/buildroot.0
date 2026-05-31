Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEAACD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F6E60BE5;
	Sun, 31 May 2026 17:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzCkr_RScvKL; Sun, 31 May 2026 17:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CC9860B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249701;
	bh=pPqv3d8iOshNE7dySr8TkHGqoOzh3SQx364hbcmaxP8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIW2eCVUSlH2y3OQdesr4RxKIrBTtWrkqVW9z2nku1bQ/NiYboZZgSXEcNXZd89/D
	 Bf+YsRQiI5fzWYATV4fVWk0S/+xPP0M/jBreM9KWGe1QxvsC4HOx/UJaTem/hU0FSy
	 YI2zHHxblyl58pm+KhKvOkf+RUe3JLypiSbz95I69aXRsnFX5NEmppEIMY+khekxmZ
	 frUakEeA0f1GmH2uTEkbi0jtlbr6k2fbjyz/gWGKBzIGT0Ge33MqPSHMEvjKXOVuFj
	 xXz2qV7KBtjYRN1ROdwgkYGB1NFSxeN1/JN06GmSX8VivIp1+gxhm4oHRhk6E1rpbV
	 MD5r+o38tCQUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC9860B52;
	Sun, 31 May 2026 17:48:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C43F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E375284F25
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDFtOtG-qFhF for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1EE984EDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1EE984EDA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1EE984EDA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:48:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 237E9A4C34E4;
 Sun, 31 May 2026 19:48:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTkGn-000000000Fr-0gDo;
 Sun, 31 May 2026 17:48:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 May 2026 19:48:16 +0200
Message-ID: <20260531174816.1681614-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531174816.1681614-1-bernd@kuhls.net>
References: <20260531174816.1681614-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780249697;
 bh=PSrjo1V47zH0Qa5n3QMjg7bKrBzZfz5VUhMThp39VMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rL9g2Jix69mO+Sw27XdCvoWley5AObUkjm51jc+2h0tIk++amvg/lM2Ydvd6nhRcx
 wdps+O9DEiAtp9QupVMF3RuNuDDlBZAoCGMTt46i7smy6Eg4X2AcAkSqkfLLtRT0th
 m4wife0WBEv86UDdiDALaXfIMUDc8G/UikWTVZzdVLI3LV5In5vpVUbKkrzgxY7SZe
 GJiqro8bbYCKeyD19GwJXMFRAUhIIdd1TE+KdtspWodUS1wCx76A0CPp6dvvxW7qXX
 9NDB/yvHO8TD8xoz1KPhyfYBnxsaH5dfp41IevJTYC1JVn4NHfOrdzr7ZyA6yw+D7Y
 tol9/8thCSFjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rL9g2Jix
Subject: [Buildroot] [PATCH/next v2 2/2] package/minizip-zlib: share source
 tarball with libzlib
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Both packages use the same tarball as source.

Added comments to keep the version number in sync.

Transformed minizip-zlib.hash into a link to ../libzlib/libzlib.hash.

Added MINIZIP_ZLIB_DL_SUBDIR = libzlib so minizip-zlib uses the same
tarball as libzlib.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Gitlab pipelines passed:
    https://gitlab.com/bkuhls/buildroot/-/commits/3847d430587a9d874b378a77a80cfbe98f2fc784

 package/libzlib/libzlib.mk             | 1 +
 package/minizip-zlib/minizip-zlib.hash | 5 +----
 package/minizip-zlib/minizip-zlib.mk   | 2 ++
 3 files changed, 4 insertions(+), 4 deletions(-)
 mode change 100644 => 120000 package/minizip-zlib/minizip-zlib.hash

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index c73328deee..d71d5d5233 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version here, please also update the minizip-zlib package
 LIBZLIB_VERSION = 1.3.2
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
deleted file mode 100644
index bc8b046426..0000000000
--- a/package/minizip-zlib/minizip-zlib.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://www.zlib.net/
-sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
-# License files, locally calculated
-sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
new file mode 120000
index 0000000000..7214943cfa
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -0,0 +1 @@
+../libzlib/libzlib.hash
\ No newline at end of file
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 32af7ff0eb..d5c07fcca5 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
+# When updating the version here, please also update the libzlib package
 MINIZIP_ZLIB_VERSION = 1.3.2
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = https://www.zlib.net
+MINIZIP_ZLIB_DL_SUBDIR = libzlib
 MINIZIP_ZLIB_LICENSE = Zlib
 MINIZIP_ZLIB_LICENSE_FILES = LICENSE
 MINIZIP_ZLIB_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
