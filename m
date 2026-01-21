Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140B6C44508
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2C64571A;
	Wed, 21 Jan 2026 18:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXDaLSmlzPpF; Wed, 21 Jan 2026 18:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D571F455DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769018844;
	bh=8fsOQMLA00upp55znqF9HmraiJXy9pyE3n5ExTJ8b6A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SDjShyx+c58s1SV7ZwN+VZ6mM9pzATKBYDFyJeZ4DIjg/6CS9wy7QWe5++dwH7E51
	 yPXxM0cXzIDeRU+pSbiD9CrQu+mLH0/i7Zt3RwcQNkHGlNXdZGJKBzgaBz/fkgRyzA
	 200HCCJgokO5k2E41Pv02/3ssdwEUAzMDylX/gctvOcL0Xa9J/W5djWb1meKGYdFBe
	 aVSJ6XMmyH1y7jJMY9w3ybSXTALOOa5xY+Pw4SWV3TmsQRs9J4vts5a0EHYTh/eoYJ
	 /lT883WCemLcVdLx2gBb/W9+5PwelreBoODdYFNyUTI7TjVfd+dYIvt37+wvO2AhUg
	 h9zd5UBzqVjgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D571F455DC;
	Wed, 21 Jan 2026 18:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D16A1158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A4D8541D
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnUimXCHKC0i for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8074185419
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8074185419
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8074185419
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E9B8A4C488D
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 19:07:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59338)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vicbu-000000006YH-3V3w
 for buildroot@buildroot.org; Wed, 21 Jan 2026 18:07:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:07:19 +0100
Message-ID: <20260121180719.47597-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121180719.47597-1-bernd@kuhls.net>
References: <20260121180719.47597-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769018839;
 bh=/rB3O8Wmb1CsPeAB3KF+iq7NlZ4oqFhS6ug9I+DeT8w=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=e6bty/C98O+SsJShtEFmsM6DDp23cUMo+kCBsHWyocIM1gH8D337qTI5/wZ924f8j
 Fi2HpQsT2hFSoCeXMKIMNnM9WZSXtnJjMidgTVALVooteTjmvKfKUlhlZuulGI0iUN
 zTEECFJWQLzYsJBs7GSPhzDBmIR5eN7FhAU+938cRpetxg+lV3HoJhck41NCCt8Vqb
 EnB89iFVxinhIzw+fSw5HYt0MeMM54rIM7XvUoI+MO2fDSp+NnfACCI5BqrgD8OLp2
 QnAL0wTDs+kqkF4IfdjiV70cYi+0XpuJ5Em3SwolvCfwbcj2Z5w/Fyz8aqt6hBBtym
 puIDMWoG03HuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=e6bty/C9
Subject: [Buildroot] [PATCH] package/opus: bump version to 1.6.1
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

https://opus-codec.org/release/stable/2026/01/14/libopus-1_6_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 675117e518..a5093d2cc0 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  b7637334527201fdfd6dd6a02e67aceffb0e5e60155bbd89175647a80301c92c  opus-1.6.tar.gz
+sha256  6ffcb593207be92584df15b32466ed64bbec99109f007c82205f0194572411a1  opus-1.6.1.tar.gz
 
 # Hash for license file
 sha256  01e1167d54a096d123cf6dfbbeb19587278845c6481d2d66d545669846079551  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 98ca12a623..13ab9cd7de 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.6
+OPUS_VERSION = 1.6.1
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
