Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD55D46624
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A891848E2;
	Thu, 15 Jan 2026 21:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gvEls_aaea0; Thu, 15 Jan 2026 21:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66ED848D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768510975;
	bh=xkeA+GahWqdpv8ATK3LNDCp9b06xzZdmdWnmi1cyqf0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cEW4vbVgdqpVgBWdeF5wptzVRerSTq4xFjVOJlfocr5UXwEShHrB9yd5XNseoPswH
	 gqdgv3p0pAk1UDeG8CBMP5uWlQqpn6qDu3uEB/A4ZmEvR85aKSrkowj2tL/GF61DaW
	 9NKgT1FwnJz/8V5ZXUZfsi/Q43QSyQkQnADBKEWQHP+XfyT3y3IeD441AcOzemvbL5
	 Y3zZrdxndOrjfAcbzGlkuPSSyEuO/PUJWgLNTq+XZJaPsPom+cnnWid9NBZhX9yXwH
	 /OOTj7qD+w1L6WWPT15ry6dQrghXbe8t1gdhWPq+CnvWtHfotJsa9T24oUp8V03xgs
	 mfcItVHeLcITw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66ED848D2;
	Thu, 15 Jan 2026 21:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE265223
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 21:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B91ED40CCC
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 21:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmIVXawUxZ3A for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 21:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AE7140CA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE7140CA9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE7140CA9
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 21:02:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1231A4C0F48
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:02:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46012)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgUUQ-000000003as-0NxX
 for buildroot@buildroot.org; Thu, 15 Jan 2026 21:02:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 22:02:46 +0100
Message-ID: <20260115210246.2892456-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768510968;
 bh=KiSORToi1P+/f5lNPcfdY2r2hXOolkg/O9GCZqZXM1Y=;
 h=From:To:Subject:Date:From;
 b=jtQBnOCWGoP1bLBE5tqsBB5XO3aS3HYCPwuvDQFJ94QD+xgZEGRwS+k10GknFhmoL
 pqjQeJJx49joHQFv3IKj4QBrCnOC18hZVqQWYxFeexVLwDk7bFF4yzQvo9/YwCJO1S
 5Nt3puLCRWiF8dizdM3zc6xF/uqlMWcRsoimIvvPFz0WE/ZgGR+/VwbW9J6aODqYYj
 m+LPHpL02aHj7gs5Bj6l7FK0rPKFhz1xQwpfLVnqLp8lBHJZXIHPf6zvfHaK+WvmD7
 6/JpYVhhHa+UGwyfUlkftgTNdhslUFiboNDQyVsL7+PuxX8rWjH5MKAtO0KghPAtl0
 40Q7O9HY2OOgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=jtQBnOCW
Subject: [Buildroot] [PATCH 1/1] package/libpng: security bump version to
 1.6.54
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

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.54/ANNOUNCE

* Fixed CVE-2026-22695 (medium severity):
  Heap buffer over-read in `png_image_read_direct_scaled.
  (Reported and fixed by Petr Simecek.)
* Fixed CVE-2026-22801 (medium severity):
  Integer truncation causing heap buffer over-read in `png_image_write_*`

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/9e4e247afbe809bac24bf70f531b23427e3f20ec

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 8 ++++----
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 1e57e1dc33..4cf8718cc6 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.53/
-sha1  90672f16e545e4931abd50d372edef50596a1d46  libpng-1.6.53.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.54/
+sha1  3dcffaeb58daa7b754bebe93cb008342964d9f39  libpng-1.6.54.tar.xz
 # Locally computed:
-sha256  1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4  libpng-1.6.53.tar.xz
-sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
+sha256  01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805  libpng-1.6.54.tar.xz
+sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 7b66f17bbf..d052fa7862 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.53
+LIBPNG_VERSION = 1.6.54
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
