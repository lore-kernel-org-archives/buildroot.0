Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D2DCAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 12:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 289EF61190;
	Sat,  4 Oct 2025 12:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOjdZ_tWofqZ; Sat,  4 Oct 2025 12:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1047D60ABC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1047D60ABC;
	Sat,  4 Oct 2025 12:21:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C66B118
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 728FA40742
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVG_8RVedhok for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 12:21:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7611B40785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7611B40785
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7611B40785
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:21:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68922A4C5D67;
 Sat,  4 Oct 2025 14:21:14 +0200 (CEST)
Received: from [192.168.1.144] (port=43328 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51GE-000000002yn-0H5Z;
 Sat, 04 Oct 2025 12:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Oct 2025 14:21:12 +0200
Message-ID: <20251004122113.2161276-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251004122113.2161276-1-bernd@kuhls.net>
References: <20251004122113.2161276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759580474;
 bh=f3e2p5A7deiMlcfQDmGR4GQv+//wbVBj5qUDwr4i2n8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dTcz91HIWjQbDTV83gioqlTusg2IUY03BLf0I9RVOhpKa2/Lgw0OHebmmULbueGp0
 21sBKScDDgOk3/7vrKJuh2Jkso+fp5gvl1UGKGEpNItaKUzLDOpcA8vMln9avzHv/a
 oIe8z8AHubfQHMkr+T27Lx9tBmYZjmOvefduiKc9Q5FjiHqCxILVgg6ECtljbZY1Wb
 1sdrfCYF4P+u657FIDNjyHXcwlFlaSmuM2wWFfpHmeXMo5M9WgzsgUvLRPnFCWxmDN
 unz/IH82JxeEgzvhUXN1WkHkxLXGrllpHmEoo2R17X1XsN0G3CERa5WbTfJAsweobD
 5OEu33NNMp7qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=dTcz91HI
Subject: [Buildroot] [PATCH 2/3] package/libgcrypt: bump version to 1.11.2
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
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=blob;f=NEWS;h=3add9aad0cf6dc5a70ce6cb3983a46e585a630b3;hb=737cc63600146f196738a6768679eb016cf866e9
https://dev.gnupg.org/T7642

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 486a29dfc0..a170a1c827 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  d33eb270cd74e8c23e263eb5cdb8f7de740f7b49  libgcrypt-1.11.1.tar.bz2
-sha256  24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c21499b00e  libgcrypt-1.11.1.tar.bz2
+sha1  b0d3d966894a5ee3b629e55350464f69e1c7859e  libgcrypt-1.11.2.tar.bz2
+sha256  6ba59dd192270e8c1d22ddb41a07d95dcdbc1f0fb02d03c4b54b235814330aac  libgcrypt-1.11.2.tar.bz2
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5f56e40ac2..5c38e0e2db 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.11.1
+LIBGCRYPT_VERSION = 1.11.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
