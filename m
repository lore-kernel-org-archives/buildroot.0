Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F4CE63F25
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 05:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81EE540AFE;
	Mon, 16 Feb 2026 05:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifVdLQWDmIes; Mon, 16 Feb 2026 05:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8265E40AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771218802;
	bh=aWlGQMogbXWVJjz5Rq61cGPcquHdE15/2CpLcsPGW2w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RtYvcKAcq5H+iZ5OtLiE1MpiY+zPqLz2HecnxMfz44d+COIXOJC3cPQF91IFyZM0U
	 o3B9sbj9G5g7mm6tAIGY0XNE6jJeaDEKakFecHUAtTkElZBTrUsnbm1I96l4+c7HxI
	 WZf8W6Y81sDMG/v7hPNGQuNjqB3Pq8gLcsj8pTUvcEBlp2H6kny9zk8QwMriIki+SA
	 ZU+aLkyHqhR2x8oHDaacZSnpacimjiCXYWefdH68eXK50mJKT1qznUJSG+xIAwB4p6
	 nkhr5qdvW+WEPSGQWSZY5wl9V55fn4xGvCHXY8zzhlY41ficN2IZXiuwMzncqSri+K
	 UbUbBZBR1LJdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8265E40AD4;
	Mon, 16 Feb 2026 05:13:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DC7B35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 05:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BD2440AD4
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 05:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1Y-bNJKK6D9 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 05:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 426F140A72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 426F140A72
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 426F140A72
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 05:13:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5CEBA4C0D15;
 Mon, 16 Feb 2026 06:13:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48860)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrqv4-000000001p7-2Pn4;
 Mon, 16 Feb 2026 05:13:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 16 Feb 2026 06:13:14 +0100
Message-ID: <20260216051314.145935-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771218795;
 bh=s/SUJycMdNZ/45rn6C5XFvZ5XXy7UHjsHzZX8NLZUUY=;
 h=From:To:Cc:Subject:Date:From;
 b=nFWaAW9nhiqg4FHzVVIZw6pQaHmoQeyE8zQL5xHT+Rvn9ZTwECvBhUt8sY0ChHNHm
 yItppvuLuWRiYEXANgj0HXF82Ga/JpCQVb7myyoPXSwYYmtNyBv6Mi1aAz7SRUZQyJ
 KY+aIYNFJaQOo/vyf9wxgg6qb0bW46TNPqJeeUpWpGBkF3rP9IrGiUJA09SBaPaBw6
 ZGLcOVpnDQJqUKNHCPYmNeiPOV+dVi58S70vgJuUspLMkw+45g6wJSAuynOvTtkdoM
 2wezbi0fp9vJkPEOeuo/ES9qYXcHoycDAyXBth639qNYP8zKSahnW53mkFJVLSrkiz
 6EyZiKySc/IFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nFWaAW9n
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump version
 to 18.2
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

https://www.postgresql.org/about/news/postgresql-182-178-1612-1516-and-1421-released-3235/

Fixes CVE-2026-2003, CVE-2026-2004, CVE-2026-2005, CVE-2026-2006 &
CVE-2026-2007.

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=aa4b5ebc7640f60905cd4c71db45674e5941b611

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 524066c61e..8d47db5b7f 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.1/postgresql-18.1.tar.bz2.sha256
-sha256  ff86675c336c46e98ac991ebb306d1b67621ece1d06787beaade312c2c915d54  postgresql-18.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.2/postgresql-18.2.tar.bz2.sha256
+sha256  5245bd1b79700d55b8e0575be0325ef61e7bbef627e6a616e4cf36ad4687be36  postgresql-18.2.tar.bz2
 # License file, Locally calculated
-sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
+sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 38403b0f45..542fe05264 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.1
+POSTGRESQL_VERSION = 18.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
