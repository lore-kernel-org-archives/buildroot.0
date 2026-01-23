Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CB3D778B1
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 22:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632666074F;
	Fri, 23 Jan 2026 22:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjg3En1mmkgJ; Fri, 23 Jan 2026 22:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37EA3606EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769207391;
	bh=PnNdHNMNeiZXcCdvszImB4hHJ4mS4dZvDLxv+n/G77Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OhRav/yTxP3LQiGeVZzPJN8SsWNEf7bGraxp6Ol5QPYMHdeT2xqnUQ8+ccg8ge5gk
	 xWaGo+ifKWgjstwqCqMObT5IJx2Irn8BT3QZjOnGlaC6JVCbPZBRLmeQK1tT7u5mFa
	 fuTLYDLrWvV4TX/A0IIWol7FKP59q4Itgoe0IzLRr4tAiVfhrwPtT/eMwfeFjdLVec
	 9vKxFCphkLC9MxVHQCHvvxjTn44b3ZyNz0FZREmb7UmwrtNivnNCKiC3nT6+k16a5e
	 mrVCicvcWdWAIR2BQPMmOwmijZ3vA3zkp9H4UJGodizuHdAzfiehLTA1rphbJJsYit
	 byJh5IFW0Hmpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37EA3606EB;
	Fri, 23 Jan 2026 22:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A00CE122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 821AC4092C
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCcRnxyD86EP for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 22:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 749EF40925
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749EF40925
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 749EF40925
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:29:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bdf8.dip0.t-ipconnect.de [84.161.189.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 945A8A4C2C41
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 23:29:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40966)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjPez-0000000064A-2rfS
 for buildroot@buildroot.org; Fri, 23 Jan 2026 22:29:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 23 Jan 2026 23:29:45 +0100
Message-ID: <20260123222945.15544-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769207385;
 bh=60+zGERBd76Ke35OUp8gmaAQJ3D2+CConmFxl7gQ0So=;
 h=From:To:Subject:Date:From;
 b=lBm+2cKolL8lBk3lSQRnLSbhYEtka9n9UfDhPo2JSmogICEGJKgRDOjOpzSQ8tTUx
 +JmmkOk+t9UrEGuChC87tEVebSEad9JnDOkRx4dhA5d6EeBZ0MJUX0oSYSR40nAq/5
 wf94Wf4tOLKNKZAilbgu2SU+8dwIVfbPsAT1upQC4MWBiVv8giqm0ViNYxXT3rO1C0
 mtlo2aWdhjqsTQ53bejiitIkEw0fs86XwuqI0gzWGsSPzUUNblE/Kkaj+fYKkBh0b1
 vKuZ6768qVRwGnei41wqpty7Uf3OXm56o4BDzzf61HT3eC6aOUeFnsqmPi5vVz5h8q
 cB4SEiuhRkhEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lBm+2cKo
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.23.5
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

https://www.samba.org/samba/history/samba-4.23.5.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 363c6c26eb..cc07b2527b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.4.tar.asc
-sha256  af429d078a86f1ce16d0d1ecee35c42a3610790b47b84468f31284a8c4060140  samba-4.23.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.5.tar.asc
+sha256  593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f  samba-4.23.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7976e9ae05..5d9eacef90 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.4
+SAMBA4_VERSION = 4.23.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
