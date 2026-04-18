Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A53F99C95
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1525A40F42;
	Sat, 18 Apr 2026 21:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-Om0gxKXBjM; Sat, 18 Apr 2026 21:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A1F40BD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776549366;
	bh=PSduMvaCiMKvu03yv6+3ywUXbpaWGqMughnsRALfzME=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlwbrLgZjgcBspDsiWbZJHnZ/b4H7LDC5DLedIKOG9ADeqBfhL0u1PUMl4hbWmzle
	 K37OawI3laPLJKh0DtWrkFC59sr3KMhOVmUkDyV9RlI4SiMrw9bkS7rr57zdjtXm4L
	 s9O+u04cEf/zJ2JW5S1dIJtIuh1RLh1VdpQHU09IOx0HRl8XhFEn7hw4DGotjaDdu8
	 gd4YMt6QDTj+U5OHpe0UzIpYEZgWACEnNLzsMdhq6jFAd0JuyfnJ+V5zJy7uYX0oiZ
	 Ef3pgCsgJT3Z5mi0/9VTGYsH7Q2LcpFqBSWTJcTndKvMlPjB8PC6yP4ch74u545F+t
	 61s1TMCeLeMmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A1F40BD4;
	Sat, 18 Apr 2026 21:56:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F7F347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 636BA40345
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aj9n3Khvducy for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 21:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DF2C4023F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF2C4023F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DF2C4023F
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 21:56:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62B0DA4C391A;
 Sat, 18 Apr 2026 23:55:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEDdZ-000000005tT-0GmR;
 Sat, 18 Apr 2026 21:55:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 18 Apr 2026 23:55:36 +0200
Message-ID: <20260418215536.55054-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418215536.55054-1-bernd@kuhls.net>
References: <20260418215536.55054-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776549337;
 bh=XTMKmGiZnvQMk6FzlimWk7q9GvalyuEyDbtKu1u8SLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uR/ml8knUgkv0UHzz2XgweI/Qg/SxLJFoFbRMwGQ+CtPozmFDtMhrRDR4D4ZrMzUP
 gBOVYjnJc6gVUx58lddBdYAstNINVM0TNQqruUXlBx7PhW1y6jEn9u2K6vvV2zTxX1
 ppQ6J7YhiGEXe3lykziSeU0BiIps/dJaVR02/QmF8kb4e2dk07LarE1SWPaiej+cJU
 5BUVLHC9Yi/ScY+dKqI8RVC6I6d7dM1NgO4FcV5OYk5VseAdb1DtBGNSGvb9fhY5n/
 qVggCuKtp//3hUoSj93kDs+/OrUyA4IcejqBcGi5W/XR8qTrikW7TplywHamJuzK25
 9Jz+mNqSMHX3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=uR/ml8kn
Subject: [Buildroot] [PATCH 3/3] package/jemalloc: bump version to 5.3.1
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

https://github.com/jemalloc/jemalloc/blob/5.3.1/ChangeLog

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jemalloc/jemalloc.hash | 3 ++-
 package/jemalloc/jemalloc.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index 214fe8062b..7abaccd6b3 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,3 +1,4 @@
+# From https://github.com/jemalloc/jemalloc/releases/tag/5.3.1
+sha256  3826bc80232f22ed5c4662f3034f799ca316e819103bdc7bb99018a421706f92  jemalloc-5.3.1.tar.bz2
 # Locally calculated
-sha256  2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa  jemalloc-5.3.0.tar.bz2
 sha256  94aa2caa98c25d942f58b956c71dba6a99ff98fc3a31cbc669fe2a4cd0268b53  COPYING
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 0c46f65029..61045c50d5 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 5.3.0
+JEMALLOC_VERSION = 5.3.1
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
