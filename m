Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D0AC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 784E882331;
	Mon,  4 Aug 2025 18:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tqD39R5tUMl; Mon,  4 Aug 2025 18:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB18182334
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB18182334;
	Mon,  4 Aug 2025 18:52:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33F1C118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25F7140C4C
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1PIV7gQsLT2 for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:52:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6078B40C54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6078B40C54
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6078B40C54
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:52:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DE9DA4C2EF8;
 Mon,  4 Aug 2025 20:52:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49746)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uj0IT-0000000016n-2Y9w;
 Mon, 04 Aug 2025 18:52:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Stephan Hoffmann <sho@relinux.de>
Date: Mon,  4 Aug 2025 20:52:33 +0200
Message-Id: <20250804185233.3345099-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754333554;
 bh=AsFPACuAZyVpokETdf6KJsJEHRb9J9KIUsIBepfiBIc=;
 h=From:To:Cc:Subject:Date:From;
 b=q15lXSFtNjyUZn89h9S7P+Q6CepidyPxtfCTsqbd3SxuV7XhNL3bVU5jS3p0nqUG/
 QfrHfnQKzlprwq6zC47/6xuJQl2ePMyy+xj7u71FUN4xf+asfnFYspVzAd7a/Bv/g6
 6y050jlaG7spa49c8/cklrMbR0s2VSxih6GMy4x/Zu8yZLekD9/ujztXPz+gjiCNbO
 7j/d0v8k2wdj5LsP4VPa2c6icByrTw2z9bj/u3YHnHgdIm3igYZ7Kl4qCWk5NFp6JU
 59gqdJaAEwwUB9MHD/oqb7OtsiqxLeJWwufCcy0XepCHj7ELb7mNK9ddKGalswLTIe
 59FHKcpAiglJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=q15lXSFt
Subject: [Buildroot] [PATCH 1/1] package/mtdev: bump version to 1.1.7
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mtdev/mtdev.hash | 2 +-
 package/mtdev/mtdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtdev/mtdev.hash b/package/mtdev/mtdev.hash
index 355e50ff6f..605aedb922 100644
--- a/package/mtdev/mtdev.hash
+++ b/package/mtdev/mtdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15d7b28da8ac71d8bc8c9287c2045fd174267bc740bec10cfda332dc1204e0e0  mtdev-1.1.6.tar.bz2
+sha256  a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2340c97f2ff1d814e  mtdev-1.1.7.tar.bz2
 sha256  795bfe74daae59a97d3a0c8ec0ba0f08c243adf94a3aa7981a4136fce31d55b4  COPYING
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index 7191858187..d3df198784 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTDEV_VERSION = 1.1.6
+MTDEV_VERSION = 1.1.7
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
 MTDEV_SITE = http://bitmath.org/code/mtdev
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
