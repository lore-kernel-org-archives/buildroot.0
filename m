Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4175FC02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 13:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1757605EF;
	Mon, 27 Jan 2025 13:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URs3hPMNAURr; Mon, 27 Jan 2025 13:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 078BF60689
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 078BF60689;
	Mon, 27 Jan 2025 13:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A9A0AF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1710F6064F
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZ8quU2WSQg2 for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 13:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0467605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0467605EF
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0467605EF
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:06:59 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id CF07A1FB9F;
 Mon, 27 Jan 2025 14:05:23 +0100 (CET)
Received: from UDERZO.MYINSIA.INT (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id 49EF55F497;
 Mon, 27 Jan 2025 14:05:36 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jan 2025 14:05:11 +0100
Message-Id: <20250127130512.3976569-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1737983123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6dwPnSURXpQtKxPfermXAf1YWxcsDiJGooorfWln1Os=;
 b=GuWkREUu+3J9DTFjpMadBKHpghLwH9AcA/OrPAVjmjK63oXxTBNiYcqk1+GdwTFsh9vdBI
 GzNCeU7uEUgXbThgQ9ZANBpuatUPGLg/wPEHn9Eim7JPE7OpH9p/7o8N4T9oUBZrIudIKG
 yKS+A+X5iiPGLQEDBzErri77BCxzLK2Aw+0vjtYuj/mh6dlyBcAtL+kqoqmMyr5tMbUMu4
 1bAPJcHqRbAkBxEkryJKs5s5sh0zWXHrzb9C58qR8xWiLTBZ/wiFyBZ1fv1sVKjk3vWHrO
 PvDWpZ+qGhooLV2RzVqzPMPFQU2cOhn58KJ1T8++WvV1DWJkcFCQBGDmuF2GsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=GuWkREUu
Subject: [Buildroot] [PATCHv6 1/2] package/perl-file-slurp: add host package.
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
Cc: Christopher McCrory <chrismcc@gmail.com>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some project like efitools requires host version of this package to build properly.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 package/perl-file-slurp/perl-file-slurp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 0d4ab94034..7cada58070 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -12,3 +12,4 @@ PERL_FILE_SLURP_LICENSE_FILES = README.md
 PERL_FILE_SLURP_DISTNAME = File-Slurp
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
