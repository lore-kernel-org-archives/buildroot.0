Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D924C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 15:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0437A4093E;
	Wed, 22 Jul 2026 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id or_gby5F73bE; Wed, 22 Jul 2026 15:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09B094078E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784734385;
	bh=KNf54Y0/roeW3APN2vHv9qGsxCGyiCDdw/CC8casflE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OaArPlttwvTYNC3aQ0HTOQiHlHPNOpqUYx2gaSKB23/R0foSN5c7pj49HMOcDg5mA
	 GMz3slgO+qIeYqwuYsmWtQA7yn7WNXPyhaZFykdGl5bMz+QHM5kTfSGBG/xw1ekQtA
	 3KNp74L5kKeHOQwvKL6fhS+dcJj6/0rJIa7T+TnaxGWKlc0WAcv8vke4utP/ThEu6u
	 DK08wYki//fXpcXPpKslOVN7Ei8hyTDKwb4rSqsHCzenpMm1lOdBUhzU0/xsI5Tmcx
	 YgmjZoyMDUWJwvI910aLa519qBz0hdk+hgUsE00Ypr+wQEQjmk5OAl3iX8SwcdPuaT
	 PtOGowzDZkW2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B094078E;
	Wed, 22 Jul 2026 15:33:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2F03224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C8F80F30
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oln8E_60IOv8 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 15:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CE6780F2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE6780F2D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CE6780F2D
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7GS-1wgU7o2fpy-008aRr; Wed, 22
 Jul 2026 17:32:54 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 22 Jul 2026 17:32:21 +0200
Message-ID: <20260722153224.624762-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:k9ksofxVvwfZ8+XGQIyr+gedEE/QPE36mAe1m6mvE3utxLhk/SO
 5dUqCv501BJ5ZITfAwC/U6FOxynZXRno1V3JDHez1g5kXxRHbr4BdKH3iP2E1IeI/UlrxRI
 iUJugrZ4nBmG+/rpmbcwwBH0sOFDXnh+buLuRLHyg5tgpeIXqbeXbRPwec75A5rmKCpyACn
 fj1aazPVQph+1i1628AuA==
UI-OutboundReport: notjunk:1;M01:P0:CQsbWfU6YKs=;62hG3E+Y6OCFRfN0jTGCquGfvtw
 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
 /T9oCGDzqe283NDdk5ng/
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784734374; x=1785339174; i=fiona.klute@gmx.de;
 bh=OYoGoElvbYrHquZFP14MZdk0a3c+T2iJwoE7tyq/4Qs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=B5P2YmzY9SD+XGPM4KMefR1IGrU7ZtixSCsh29Io+Z9cEWRVlENWVGjpE92n6XvC
 7q52yIz7Zkss2o9cF9r+Qd5elhEPia1zJwtVOanC59srW5DBNjtkAA2LqWsnbBl66
 9Uz3gPfoBUQb/wk1/c8Jpd5KsaV8Luy4tu+L8vYWAD4LOlSmaGG2Lnm1EC1ZmCOZM
 o063XR9XkdsxbmmbE3Bi8H1Ei4dUcC2NhGQYwGYFdBKSJe/+cKe57OMgRpi8mnHiq
 hBm/4c0JTppYCbcP9shPyRo2LUkLc+zJuNPbnPenGa5JlzEkMnR/Pv2b4MPASnoCc
 NQOypd9IGcfkjCzFbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=B5P2YmzY
Subject: [Buildroot] [PATCH 4/7] package/initscripts: add license info
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/initscripts/initscripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
index 2e997dcd6f..d3a7a8faa1 100644
--- a/package/initscripts/initscripts.mk
+++ b/package/initscripts/initscripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+INITSCRIPTS_LICENSE = GPL-2.0-or-later
+
 define INITSCRIPTS_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
