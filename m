Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DD0CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 15:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 897214089A;
	Sat, 29 Nov 2025 15:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFHngbb5LSOb; Sat, 29 Nov 2025 15:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A5340741
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A5340741;
	Sat, 29 Nov 2025 15:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06AA4273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 15:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED3A9402DC
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 15:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-u3HQwYGGEd for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 15:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8E7E40183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E7E40183
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8E7E40183
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 15:01:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B6CDA4C733A;
 Sat, 29 Nov 2025 16:01:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39072)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPMS6-000000006AN-0F6E;
 Sat, 29 Nov 2025 15:01:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat, 29 Nov 2025 16:01:33 +0100
Message-ID: <20251129150134.2732589-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764428494;
 bh=E9DxKJKb+0axu2dAHdg/O9mihuyDkNp336G/vegmt8k=;
 h=From:To:Cc:Subject:Date:From;
 b=AmW8l9EUvIi8Jx9jabc3rBUkvW079J3Siu9jqcjs++Yotnha4hWuY7phtZ7/4idwF
 lxQ51HJ0DKaZUTOiDeVFTjAZnK12Zi1ssu5PXBJI413XgY/6kb5Nj6by6CDYzJPUah
 yUs1j/MFqVjdBRCRLPG+lTR80OmNutpPKf5Bc0IF2fY6lFseys25SGIPjCEtI4hJE/
 NrM5A80IK54S/ahb8cd8Qh7QyArLYPBSz64cx/1m6b7NONP2WULaFFDExzoHjJ3/ym
 gVnHyse2HqRbeBhu51ECwrgSpn+TWaj/6YKpOISrHITeRx45NjL/DMKHXyndfAQ7q4
 6QFSp/XylS0kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=AmW8l9EU
Subject: [Buildroot] [PATCH/next 1/1] package/sbc: bump version to 2.1
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

Changelog: https://git.kernel.org/pub/scm/bluetooth/sbc.git/tree/ChangeLog?h=2.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sbc/sbc.hash | 2 +-
 package/sbc/sbc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
index b080c06205..313551101a 100644
--- a/package/sbc/sbc.hash
+++ b/package/sbc/sbc.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
-sha256  8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992  sbc-2.0.tar.xz
+sha256  426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2  sbc-2.1.tar.xz
 
 # sha256 locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 115867fa0a..2ee1a75ae8 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SBC_VERSION = 2.0
+SBC_VERSION = 2.1
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
