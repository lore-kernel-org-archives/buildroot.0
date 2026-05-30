Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1997CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EA042E10;
	Sat, 30 May 2026 09:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84gX5Owtxpur; Sat, 30 May 2026 09:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8837428C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780132153;
	bh=1a/xsFZuNgFRSHdmsIae8Ux2Fnv4t4qb/IfV9TXuPKo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=irYPHdAGHUb5un78XzM6W9PFSknid1uVyit7tC3RjC3cg+hMezsTKJLfMl9iGMcEr
	 e+io2Sum3oTiboo6Sb/dkJoUWpE473YmJZ124MhHR9dLewte3RbqVYRjL6no3tpWGG
	 5u7BJ7/16ZSuNNBFBE9/TrGqJr5+FvAgn8L8uWchjkp00XjX8VH/RMCt3uJiyM2ATD
	 cCd16jAg31qDGsdIGIUnVm1ttJLxiCH4UN/TRDLgVpcd5n9F7s/iExDDr3nKhIzdWt
	 NzZDuQAmPzUl28V8VAaTpinLm6bHAqs4uXoISBrKoOi5OA9PvwZ+AR31xN+peQhXow
	 ZpoyDm9ZUJNEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8837428C7;
	Sat, 30 May 2026 09:09:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B6B6D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CA3461363
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu6Z8r41iRYq for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5719F60F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5719F60F3D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5719F60F3D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:09:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1487159318; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 09:09:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wTFgp-00000004k24-0jKa;
 Sat, 30 May 2026 11:09:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:09:05 +0200
Message-ID: <20260530090906.1130247-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XQ46UdZBBZAOTVYd/uL9A45iEeNeAAZHIQLIU8vThPIus+EvpvFsIn3rNrbuSGZoU+dBW8Y8dV3QPjQ1N3S4o3Y4mWKsJPOkOo3diFRe4Sc/u++G1kzZkS0WoDtWa923fbmGRyHSIz1T50jBHfKcel4vS2VwTRpi/Yk8N1cHVZiPfexrrDk0uRjh/oKSSJWY9steoG3PR0QK2cfMxyD5608ZRcvZbefO/oKhm7K1FKrEVfWotEveFS28dHIV2RpD/2Bfc2Xo+iHogEZbunENnVOUeraoH4P4IzehYyBYuFZvhzkRkkRl06yPRV4nufdlxN43Yvcay7oFmMcsfBcMEQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LFGxpXWbIFca3WEkhln1LfGdDgYKYnPn0sIwz7R3JaA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=XQ46UdZB
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/icu: drop outdated comment about git
 tags format
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

Commit 5bf0db998b ("package/icu: bump version to 78.1") dropped the
dash-to-dot conversion logic as upstream now uses dots in the tags names
(E.G.  release-78.1), but forgot to drop the comment explaining why we were
doing the conversion - So drop the now outdated comment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index ee1ede6f2c..9b97011f55 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# Git tags (and therefore versions on release-monitoring.org) use the
-# XX-Y format, but the tarballs are named XX_Y and the containing
-# directories XX.Y.
 ICU_VERSION = 78.2
 ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
 ICU_SITE = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
