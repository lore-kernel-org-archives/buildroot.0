Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E163C79FAD
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 17:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7CB38135A;
	Mon,  5 Jan 2026 17:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXUBjdusJNDp; Mon,  5 Jan 2026 17:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13C3281331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767635031;
	bh=lmBkdQML9MBojilegn2A46nMQsQvSlmWA/Mmdmn8Z1I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=V/l/T6ZGb71I3Cb1WqTgmvyP5D9+mh/k1QDpVusdp1XO5J1HA++rXNmtugnITMzz8
	 N0sPYCRuntRQP/55jyJ8bzWEQc/1MyjxlY2OmUQkTOpidyV6Cw0awP/OJ57Qs8ySUh
	 gsMDjjOlNtYrPZmVY4kRHkNH6J/xPm3/jdkbNdAtiOVEF3BFa7qa1CZGTjtCzMrR4O
	 ahch34UfEMx389gHlsrNvQcYCjHmosOt6CkYnnne8Oer3/+E/salnABAmWkuUKegc4
	 xxb1COrt69ivRYjQXTxSytmNyF987k45Pj+Dj9ro6yvKhd6KmXBwuqztH10cd0kZPD
	 chJLNVD/lZpqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13C3281331;
	Mon,  5 Jan 2026 17:43:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC0B7E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C98404037E
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kgwb3QOY-cUk for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 17:43:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4295400A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4295400A7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4295400A7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:43:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A334D19F72F;
 Mon,  5 Jan 2026 18:43:44 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon,  5 Jan 2026 18:43:28 +0100
Message-ID: <20260105174328.373330-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767635025;
 bh=AYFVGkslB2BvwhHVIiW88eaNFYaxfy24NIVJbHZJV6I=;
 h=From:To:Cc:Subject:Date:From;
 b=Jp8JQfOhQsbXbAnrj+jaeQ04d+zhJlaXz6SeUnMDVi0F509ctFGVOJaJNq8cM7h91
 pMTV20ipaX2apvHrytbmvg9sxM9cxQ1OF506p6GxjN8URAWm3OwMiumLuucBZVfcO5
 2aVAXX42FNveHKcbfkMplSyitdDjHxd4v7roKSqqoGNSODIhGHpWHh7oK2LEo1L+ol
 LskVnvzA36l8GKH8lC6hYASHsIWdqJ1gF0FVIzfu3xYWLWMYPJaUZY59fA829IIvR5
 tDedLDGFVcANTSZYD42C+cUX+PJiXHl9wPgGHpGrh1IJjstrhTarzHFwG9l6n5mhGP
 CcfrcOyd6Z/RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jp8JQfOh
Subject: [Buildroot] [PATCH 1/1] package/ddrescue: bump version to 1.30
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see:
https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00001.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12608229986
---
 package/ddrescue/ddrescue.hash | 4 ++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 716f6e4cfd..6c234d003e 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2025-03/msg00011.html
-sha256  ddd7d45df026807835a2ec6ab9c365df2ef19e8de1a50ffe6886cd391e04dd75  ddrescue-1.29.1.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00001.html
+sha256  2264622d309d6c87a1cfc19148292b8859a688e9bc02d4702f5cd4f288745542  ddrescue-1.30.tar.lz
 # Locally computed
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 20070d763a..6803246dd1 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.29.1
+DDRESCUE_VERSION = 1.30
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = $(BR2_GNU_MIRROR)/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
