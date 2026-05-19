Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30870CD4F57
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 09:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 513E2812EC;
	Tue, 19 May 2026 09:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbFCNabngDOG; Tue, 19 May 2026 09:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886F8812DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779182157;
	bh=NBYHvPjbEy/VLISLQy16/iPdJ4PBrSBwt1SAvBa/Sew=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EuFMyjYIqSO3p8NQQk9g8asvv6Za3h6XklsKKXeRQ/3g01DOQ5HbxTSdS79HT/v+I
	 gKeH2bbAsyE1W7g+iE1k04jkL/iuNp+luS9xzPX5WxYBFXMFAz0oqmg/l2WMbNtiAd
	 CZhs1BE8JrG9u52itzY5ewI8CA1yflFis6fo2ZleIUaeXNvGyVWZtsOmlUDp4ZHbW7
	 zFijQymTmDTm3cgKXGVhm12IfjRil9aBk2nBdXBBAKUmBoRza3D+Um7mdT8SV57a+Y
	 Sij0nNGB8k4DEqkkvw+ZkOYXt3xcr1zrTZpY2tPX+VYsWC07eGDZiZrJksU9h2QOkm
	 rDiXvYNP+cjcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886F8812DD;
	Tue, 19 May 2026 09:15:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1208C265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 09:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBF82608AA
 for <buildroot@buildroot.org>; Tue, 19 May 2026 09:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yqi2lavTcgqR for <buildroot@buildroot.org>;
 Tue, 19 May 2026 09:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D62A60882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D62A60882
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D62A60882
 for <buildroot@buildroot.org>; Tue, 19 May 2026 09:15:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id PGYHwfkDLiOfFPGYHwqKsl; Tue, 19 May 2026 11:15:50 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 11:15:48 +0200
Message-ID: <20260519091548.2867405-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPGWK1J1L35MuXdgsaWOf/QlorpT7r/qlbtMi3awgIXfhYzQsdG0WCkSO87EBmLYnLZJnwBZrSI/bWZxG/dBLnGlgkYivxJSAevRFa8gMbxzv5Dge0Qz
 JUBG6G+MQvFi+aO+s0M4ejZbFVo3578X9JWbns48YU+n/LGLJsCnMRzhfsTsFXi4fjifJ8oEfGbQOgiUwQNmcXvlxJ6opx8EIme/zav5AktBbYvJ2Nqx0vLl
 UYTY7ucyIeSsA7U6bU+iojxl9NgOQWvko8ujh4pC55aeBEdoKTEGVTAazXM4XO7lwO/2pJUfn3Kd15Xcndt8Hg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1779182150; bh=Q0E9bRPZfPtG1GoMazevwuRwfHzRRwQjLEPipizPyS0=;
 h=From:To:Subject:Date:MIME-Version;
 b=N+fUJijjG5eKlz3LyRjCulO7SqnRpKfLHe2lYmicxBLe3vluy5NdsqaWhXk526V3o
 vrcIA7pUe6EElSFwAU7+x7QZO6fVJ0tKbXZRMU+x5s5OU2kq7kZZXyv16AeyPhb5Ev
 WzhFQx0zhulCkXVGOy6GXuiGfcje6uKv84LWf9fEVRa4vkJBucdKfv2ziWu7oJZX0X
 O19yt5Q5UFQj2JxJt2bpRj+wMGuYOqfeGOoBmsnrDWKUid1CDzSQwAF3mMshL2ADbr
 KUfGSSGd4KojeOVvTjaqUMJIn+wn2ZhIZhNojiCTr5e3blTWYR3FwEGFrVhrXmXvMI
 7CZLWDFcTXFLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=N+fUJijj
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with linux
 7.1
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

Bump to version 2026-05-19 on branch v5.2.2.4 to fix build failure with
Linux 7.1.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 74f12fef29..2e21e45224 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bed53ce2ce2b947795f795538d823a8ecdf3845f2f7571d54ba351ddf4ddb243  rtl8188eu-2ef2819d2d3ef7701a739c66525bca4731c6abbf.tar.gz
+sha256  8ec126dc722b4e0837c866ec3f73eea9f0835d518fef38b880e2c37fd2fac55a  rtl8188eu-cca7c28087db740d7d745e81e4096c9eb9084f9a.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 5efa5aefec..5f378e0b6e 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 2ef2819d2d3ef7701a739c66525bca4731c6abbf
+RTL8188EU_VERSION = cca7c28087db740d7d745e81e4096c9eb9084f9a
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
