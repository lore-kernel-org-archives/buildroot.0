Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD693C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF15080F5C;
	Wed, 22 Jul 2026 20:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65DV0IP7RyC8; Wed, 22 Jul 2026 20:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD7080F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784753526;
	bh=X4B/Ni2fk+g74EGBuJOcYroBa6+QRZDIBX4uS/Mqzrk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=aaGFBMd1rPcCgTP74S4PdApR3pnzGBEIruQjLQJGiMAknOiBOADtqGQ2RRsolTXVE
	 4cQKAst3qlzVNhyvSmPbA+JpzjwHyy58eM1olwtssKYP+ct1v4I0t+70ARDXx4gjv7
	 bLSjW2829pfXW/T1GQB5cEURnh/3v161qmirc8l3+zLY0q/jVPtk6gX1Box+6/yN7M
	 E2ckLT/s6mGwhS1Rt0ObZC44weMMZQP8sqCbnW+x/ptckChF/KwFE4rRaI2CDOMIKb
	 TJ3Ly7I87C/HM8rKvir+XOLCZDuWBJ/LjkXtaLeHb3VbYvSWJeWnianQbwaPeyahUg
	 rOGzuXkgY3KDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CD7080F47;
	Wed, 22 Jul 2026 20:52:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49A61224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F89C400A6
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2-phNutfXNR for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8BA7400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8BA7400B5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8BA7400B5
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:52:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7i8O-1x0aDy2kDa-00szXD; Wed, 22
 Jul 2026 22:52:00 +0200
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:51:42 +0200
Message-ID: <20260722205142.674788-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722205142.674788-1-fiona.klute@gmx.de>
References: <20260722205142.674788-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:blB9eBHsip+IQz196luiZHoO9JnsVL9gw+MG+Mn/T+DFaobj35X
 CfGEwuajY6xXl1tUMzuUG9QhJcIf4EuHSlQDbibAk7TAfy5GUWaS5sHlECL5//QBpfEVdoS
 9+LsgwbdNKwZk7TwRjONGKpt5HhoFV+vlWUb0Kc5CRyYlK/BBvi96If0R5NNtmY61+uxbbu
 I/Rfp25ORGrS9/kQu/zDA==
UI-OutboundReport: notjunk:1;M01:P0:HZk0Ns+PbwM=;yUBtKOOw82Sp9+wRUrZAjjKhuM7
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784753520; x=1785358320; i=fiona.klute@gmx.de;
 bh=03kbydO8vVOi5nJa+Tc8qp0nueJzGuA0326h8L9O1mA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fDYM2pxWB2yNgpiItgNVszuSJ0qksU8IpruUsolc8JoUxDCpx3DM+JehLwJbKl6S
 1kGrwvNQJoy2sZjx3I+tuzpTr6XPa6tYhJcnKRBUKCaHD7lluL1WuANjAtLs9XIzv
 P17bg+GATv457mC8/3U3C9tQ2c2AvMdm7k5sPFaFfik9gFvIEFZGP57FqHqVGW93H
 7nsqOH3Sq98A3oR7bROG0vc3tBNNF0Oh98JSo4Jc+9CVaSKskiHG+Sn+Jayx38GfF
 xc9oh6accSm3mBpVKpkUCskOTCnrdUmVa8zG8G+Fi2A2wYpW8soH0dDQgBBL88WId
 89NxPRtnI++cb+laAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fDYM2pxW
Subject: [Buildroot] [PATCH 2/2] package/agec: use correct SPDX license
 identifier
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BSD-0-Clause is not a recognized SPDX license identifier. The LICENSE
file matches the 0BSD license text [1].

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/agec/agec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/agec/agec.mk b/package/agec/agec.mk
index b19eac94a4..b9a3d0b5f1 100644
--- a/package/agec/agec.mk
+++ b/package/agec/agec.mk
@@ -7,7 +7,7 @@
 AGEC_VERSION = 0.1.0
 AGEC_SOURCE = $(AGEC_VERSION).tar.gz
 AGEC_SITE = https://git.sr.ht/~min/agec/archive
-AGEC_LICENSE = BSD-0-Clause
+AGEC_LICENSE = 0BSD
 AGEC_LICENSE_FILES = LICENSE
 AGEC_DEPENDENCIES = host-pkgconf openssl
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
