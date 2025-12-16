Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65441D609DB
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 18:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044CE40359;
	Tue, 16 Dec 2025 18:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VthGsuuMUXgg; Tue, 16 Dec 2025 18:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD5F40487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765909730;
	bh=VfKtsThj8J2qYvs/Lu6rUD8eKi2zxLotsacGSuF//Gs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VatX8b3/C7b3BaDrRm+nMbH51g9pq/11h6bS6aNBzGs/N0zL02rkqtG13T+daAiJt
	 UDihrz0txBGxod68PkWhdkBfYMTynzAHeymVVop7cf/9Hio9zETlts8+MQ9VBOBRjX
	 TRHsFIl7IEHzFoA8UxSwPcrAOndduCiPH8w2ZKTfxEn1CbT6zCJAHMTO3Tc+QhvpBm
	 DeKuAdJkWgHfvRYfySOdkq+6R/4tu6mfDAG2gjEQTwYHYF+xGHradsH5WRPHAcffq1
	 7b14M5YlzEC0j4p+ZrKmHYJkXyMW9/DiGCTkXXmE7CykR2GWpx6AednnBJR85LUAhF
	 ECBecq0yvgTFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD5F40487;
	Tue, 16 Dec 2025 18:28:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9A0535B
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 18:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB8616073C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 18:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQch6LSIDvCa for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 18:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 424A0606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424A0606ED
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 424A0606ED
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 18:28:46 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A3C192C894D0;
 Tue, 16 Dec 2025 19:28:43 +0100 (CET)
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
	Richard Braun <rbraun@sceen.net>
Date: Tue, 16 Dec 2025 19:28:43 +0100
Message-ID: <20251216182845.2575378-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1765909723; bh=7GKLiuSP3/Rconels8YkgW/uH8pneJrK5oV0DjMiia4=;
 h=From:To:Cc:Subject:Date;
 b=MSBdr8wWSM4OgGhgKGKKsKkbUsvPXZinpepXYmH0uCGpX9WEjM76vPvqM9JhpLiUX
 iplhOszK8RqFyuNoRQFjz2apodAWy3kmof+1AA0n5eIsCaZO5IISUwrb/K5BDvLzX6
 tToHS8UfH4uqiUdlc3tc3PFEc41LpJJ22fInQ75sevx6P75CqmcA6ssTEwr0OnNUQj
 8/oOiIZe+SaTc3+i2Qlb4xSaVJw8LE4lvYZuXkzI7jSUXbAPZo2Lkds39CgFN5wxfr
 nkeFEnTusG0bkrI9Qt4hLpN0SLSIToR9rporL9WUXKtxN/tvIxBlUw2JSTVi+MiZLt
 zODzVBcgfPnAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=MSBdr8wW
Subject: [Buildroot] [PATCH 1/2] package/tzdata: bump to 2025c
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index a1629066ce..fcf7bffd24 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
-sha512  7d83741f3cae81fac8131994b43c55b6da7328df18b706e5ee40e9b3212bc506e6f8fc90988b18da424ed59eff69bce593f2783b7b5f18eb483a17aeb94258d6  tzdata2025b.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
+sha512  1e33f7212fd0ae2ad3c16e68f0c1fc7a6ad26a126b8406c379a5768d79604c6a816054bd0fe3a63228d70cd6a1fc2b1bae2a9f8014e102d3727eb9d21affa1f1  tzdata2025c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 32607268d8..a7b6dd8f65 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2025b
+TZDATA_VERSION = 2025c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
