Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E2C4453C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 15:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D838040961;
	Wed, 22 Jul 2026 15:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yY_xLaRGJXf5; Wed, 22 Jul 2026 15:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 520184093C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784734382;
	bh=TBig8leH3Lg8Cl05pc7TwV0zuKE8ectEnM8ObMJKCsU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=po4jR7dKr450GHaxJqHTi342MiqfW+knKwMxagQAGp8wg512xYlk6p984gH7anxr+
	 EvoFqeP+/ZcKZs3CEl2yzzzzpPA68cOHSpQVf/EYh+W65InBNKBsKvzKXjWV7rYv0t
	 PmAoRUhbKnB4ttC0apCM50MBuSsTpkicJ+u0C4L1Kccdm0ccjcQrf7nk2z5h3pLOT3
	 DCTgMfqux0idnICxoVcMKmkPqAgwwjC+TIZ7q0ERnDTNkLNxcuTgk6PzAMBQ5GXzI+
	 TDHp1mWdjSuFfmH2iUHb6xf/dLQc76RK58ahkWe+yv8HPjBrH1wBUiZ3jNyp3IM47b
	 c4qFA7NsOpR8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 520184093C;
	Wed, 22 Jul 2026 15:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98619224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77E4B60829
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6cH0RSNBTWS for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 15:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B192E60722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B192E60722
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B192E60722
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 15:32:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAcs-1xNpZ22J1E-00q8Td; Wed, 22
 Jul 2026 17:32:56 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Romain Naour <romain.naour@gmail.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 22 Jul 2026 17:32:23 +0200
Message-ID: <20260722153224.624762-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:QmMZoJnK13UMRleorWRXIM1XQziOQvnvCJ2wTkWFyRfhVInQMCP
 lVf3TqPQzO1bO+Zl95biyjw/d9WRMdM0HDdyCpMRijZBXXcRPe1YD7ukoTNntWRe8Zzxman
 YTteu8/V05GuwziknJdrjZPO8wxHj3BW6Vswb/BGKamLfGjz8h1DZkAPcZfNB1rr01vK0b0
 78Ymc3R1gjyYgQhSYwOSA==
UI-OutboundReport: notjunk:1;M01:P0:byNpmISUdS4=;HZ+4Biw2Dfg8M5LpX/QJPqC37EO
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784734376; x=1785339176; i=fiona.klute@gmx.de;
 bh=airBKuXd8bPs2fTHF4vEZjpmnPnARIBZ5weZt6bjO1Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DdFaaBUr+XtGY7Rv5tJOygQ40M8pFCOSpZw7H7iXgwFvWTDTVdM/RkeEEGvGkECy
 S0mjc10sy9ugKJAWNx5J0O0GntzALcfzlfpbNE1VpIc5eQjEr+uAOm2Y7TfJ7fpBf
 Tj6zUCxYNnLJR2/1ecnjda2nhFO6KgODh3+N1tE3/SMBArN8t8OOZAkrBkMKdLmmH
 4lgp/Wp3ZpvD0xQEB+/IdulnMvd1LL37suLc0AtpBkRrHK37SBISex4oXPsLrKPEe
 kukmHSEMG4C1Qi3RSIMHQTiDyWhP5ubNMHJCHFXJBZDTUbiJ2fILDsI8SpKB3WBXn
 NQR5VjTH7GMHlhsyfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=DdFaaBUr
Subject: [Buildroot] [PATCH 6/7] package/xz: fix license information
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

BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
in the source SPDX-License-Identifier headers, and the associated text
[1] matches the COPYING.0BSD file.

FSFUL and FSFULLR are the "few permissive licenses" of certain build
system files mentioned in COPYING.

Move "Public Domain" to the end of the list because it applies only to
a few files.

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 91eedd7a83..056c168057 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE = 0BSD, GPL-2.0+, GPL-3.0+, LGPL-2.1+, FSFUL, FSFULLR, Public Domain
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 # autoreconf needed to fix a musl static build failure
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
