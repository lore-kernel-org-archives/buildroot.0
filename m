Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE398EFCE39
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86E6581190;
	Wed,  4 Mar 2026 19:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1TBrS6t7XdZ; Wed,  4 Mar 2026 19:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC810811D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772651771;
	bh=B0HjiGO4oJ+xhhgWBRhLur09u4fWPSvzTG0voMfNKk0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hRH9Mp5Ldx0xyKTzzdn1gCn8oGZJosA28IZ/cJU96/2wI/G2TqB56X+SsUBdO5uPC
	 IlmMRAEBeyE7j9ItGc87rUPycSRPSrY9ERdEsGjz2T4urLUlTHFlq8qJYL6WKtI6QJ
	 TWGkHvi8W0dDZv96MtJ9aH0xOtpi6IWzGUBORYdx5f3ZIPNZMrvdfBq+JVVzMT7F3a
	 EPwnD6V5Qi7SSsfvRsC0/D3kwKAV2tpOTHm5o+M29N9Coa9k/fyWAaOIDbYibGslSX
	 p/lF+crNl+5M+Y64fmf9oA1rTAGJEvBjs/vHQ6oYE8SMvcgMsnvuHdsgjjGRcxx8qS
	 cclfkVDZu+8Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC810811D5;
	Wed,  4 Mar 2026 19:16:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE0CB223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A045160693
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zEU61mi-vVy for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:16:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8629D605FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8629D605FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8629D605FF
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:16:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE112A4C338E;
 Wed,  4 Mar 2026 20:16:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxrhX-0000000074u-2jRb;
 Wed, 04 Mar 2026 19:16:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed,  4 Mar 2026 20:16:07 +0100
Message-ID: <20260304191607.3488559-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772651767;
 bh=xOxDvgaPAs/XQdq8bYU0P2KTfz1OhwZCgVAJaWlrcyI=;
 h=From:To:Cc:Subject:Date:From;
 b=aRXV2Ytfv4clbRsXbQOYSuEAeuTyi7IVl05p9s7rWH5fAJtQI1zHhuv94gdr43eFG
 hsFST7KO2DSP0PAeoaw9FmUFdMw7LXFYnoGBvl30xl3U1BeDmJ1GXLSmp4N3vMA1J2
 JbkCe3dhhn5Jdq0UDw25ELZKYT9st3PBrY++01h2MD1T+/uUb2M2tGc7u32ckCIwy7
 jNnycdi7QU1SUTSwNtuHNGLxw90tdpqx18brsfzjMqiER0v5PJJv6/VwTinhkbYh3f
 s4yH21bZpxtEi1dJipUUxJUoAKfJ88MVGb7oZsrXoWsXhYR+vVqG7Lcps1a/eykKoO
 W6so9a8rqGZKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=aRXV2Ytf
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 18.3
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

https://www.postgresql.org/about/news/postgresql-183-179-1613-1517-and-1422-released-3246/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 8d47db5b7f..58eab8e548 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.2/postgresql-18.2.tar.bz2.sha256
-sha256  5245bd1b79700d55b8e0575be0325ef61e7bbef627e6a616e4cf36ad4687be36  postgresql-18.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.3/postgresql-18.3.tar.bz2.sha256
+sha256  d95663fbbf3a80f81a9d98d895266bdcb74ba274bcc04ef6d76630a72dee016f  postgresql-18.3.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 542fe05264..fed3887ef5 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.2
+POSTGRESQL_VERSION = 18.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
