Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4B2C4453E
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 050574088B;
	Wed, 22 Jul 2026 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6XBYqu3rUQT; Wed, 22 Jul 2026 15:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D69D408A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784734381;
	bh=iyaGI+PGdPH1+nBtxS6QejcHEtmF4SZwtx+OVXJz054=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CawVoMi0NqZ4dyr40MvoYdx6KSBzaRdj7vjKTQhLxbH8F8brPzZHuP9A+PaQq1OiP
	 peLwwh2j93hz5E/eSAtgKsM7HjqO79AjM0eOVcZHnwVvsrFsxMnN9nunrHVPr2XWBo
	 VE342c2JqRjLL0QQHa/UT5L9FDSzP+HFYJqPDHlmiAeflHuPfI6Bbux4su7BoiZm54
	 dlSOOsm/Acd4ivhk19vcWmhIq6UDEcED4Q5FngNyWOiFj7nUq4u4crJk1smcVnvwCI
	 z1ud/a+XH09lq4ROpMJehYJzjcCgdCv8G7OVHA+0079Uzr5Ae4fEkgkJrbaKQU1JZy
	 0TrwGRxFt4RzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D69D408A8;
	Wed, 22 Jul 2026 15:33:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4D2A224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1D3E40939
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyWA_pN1a5o6 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 15:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BAF0408FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BAF0408FD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BAF0408FD
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzFr-1wVAgA2SBt-00Vz1g; Wed, 22
 Jul 2026 17:32:55 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 22 Jul 2026 17:32:22 +0200
Message-ID: <20260722153224.624762-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wV5HhD/5Ocvk7ttEUwg4jPn9WHOOEbNHp9pCtPtZdONFtXlzh9T
 ZDMa4ZWZRDSqWXKIRTIdyKhIWdUNZIM35oXZYt+hWNEeikBmxRTLDxBLkoCxMCwvPbRKVDV
 ATNF3LdCB5CBWvsMSOPYQLOzK2BfnYBsQ9zOeLwBnCwUi9mmM3hGZEmx07The8OfgAha5wq
 iaUKZeqVIMXSJrRsbNfvw==
UI-OutboundReport: notjunk:1;M01:P0:B+8wMbdsv1E=;UqZnHB4fn+KvRHLUrCOI2XnHvK7
 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
 2cA27SrWDBNw+bHYtYuhK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784734375; x=1785339175; i=fiona.klute@gmx.de;
 bh=84QZV+tPNM5tcmA3BlWcbfwaXygv6AhnSW3d4c5vuOY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bUgl3NeEIhu8c49ghbsOiYtRynCvNm76FddZAqf2J2Ci9YHCBQSH+xGQ+qXGpbAG
 caKsQ0OiVw46QpBaoQxY1OpAP/0IOa/SsftCUjGzqouxPHj1NMJOy7XGt9XxPVrW+
 qbH0Ep7YDXGAV2kXUF0lWY0arnny9CH+f9cxKd+L9hki7Z45XtQoKgxNU2AP3DFti
 gTe2s/1enkqR946FVS+JlgOpi4nFCB0hlaPi6W2oFeRSuEQjSAEkRv1YJLpS0wtFx
 GzMZxAnHtOiYXaMN5S1T0TpKuZbqM/XOqpZq/TYWKk4ye/RHaF3ClGHW+fLgerDZL
 g0NF/RiGb0zcIIMGiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bUgl3NeE
Subject: [Buildroot] [PATCH 5/7] package/urandom-scripts: add license info
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
 package/urandom-scripts/urandom-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 89abdfff72..cc5f28d13a 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+URANDOM_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
 		$(TARGET_DIR)/etc/init.d/S01seedrng
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
