Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3E6F55101
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 16:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C1C83C38;
	Sat,  7 Mar 2026 16:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E993LzH0NHnH; Sat,  7 Mar 2026 16:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 679D884143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772901961;
	bh=W/gZIZiQZj2bqXGqnmIUMwYsTb4jN3D99lYdOuVfgkM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9zM6je42SJt71/mPo6Se0RqJ5z2tPCAOdW2rJ4WDum97Xju9k5u2sLYCVcbXpnzb
	 apa6jxEOPc2hcJP+2NavZ2UAHN0bKZPwGVCr6r+XCVm0+ZrjEbl6y/Q7lirVlyqCzM
	 qOZr80AwZhbuEf20nnKAw4Hx94iK1xdKZK/R6PlxCHmCa2tmfXwu2lj4rmf6lItIHc
	 u5d4oCNNLJKRkTiirFKUVZLCUgyQOrBjKPfChAGXECWEUhcJeaSFdV6O1WA0rK4r+o
	 A65JUTf4DlXgoyRyXoM3b8uhGVghaQ2Rwk1K4UauuxQ38DFEcw1Pvsbb9kjmbBlwif
	 fz/ULPwQs+AoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 679D884143;
	Sat,  7 Mar 2026 16:46:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA3E8223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBD7F41A70
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqCZhI6hHjFp for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 16:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C262E419D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C262E419D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C262E419D9
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:45:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05EC2A4C37F6;
 Sat,  7 Mar 2026 17:45:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49466)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyumd-000000002xY-2hOf;
 Sat, 07 Mar 2026 16:45:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Mar 2026 17:45:43 +0100
Message-ID: <20260307164543.1076496-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307164543.1076496-1-bernd@kuhls.net>
References: <20260307164543.1076496-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772901944;
 bh=Np5aoHDT9wPupRJ14JeJLAoHlYtt+2/ntVjbkLgVCbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NH10ZlmCa3S95Rj0KfPYy5eGs+GfHh+4h0fRotHlnAAPMA02q6kHIMBYsF2jGe1Y7
 /WiTJG4zZr8+0eKVJESmSeBDD4WYB5zYHOdHctR1H6bI5b9lry+9emBnAaoB1b2cIF
 G9tqAg2McmEgFMQR7/5dxGOxdAdJY6XrFqxn1Hb8BKko8vtEUqOQDd04aYtjUIhQbZ
 FZbGXsN2LaGNrEQ5IuFgy87NJ/BF1VCCd9ljBEnz8MVmVJ7Uvj1H2x4rnZMyydUaFb
 lPeiEs9/NsA9ug4F2jj2EyYyWEyoUHtGLdpS4m25wpS82tUM2LD58J8WfkkYFho4w8
 EUrGtq6KB0CPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NH10ZlmC
Subject: [Buildroot] [PATCH 2/2] package/minizip-zlib: share source tarball
 with libzlib
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
