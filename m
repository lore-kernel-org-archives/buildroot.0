Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC23EA719A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 14:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E434B607A1;
	Sun, 19 Apr 2026 14:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu-tLX7WXXnP; Sun, 19 Apr 2026 14:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1822860817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776608547;
	bh=QB66FEjd1IiBj/zM/zuMGN7O+s83lAYz6D5pFiVQQbg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GeJozxJ3HOQga0nu4wlQ3WTfsvwgJ3oRjdJDjvlos2Mntj5BqJxW7uazcR3LqOPpG
	 qrSc50EpyALQKQgHhCr1mp2QIFRJEx4X3kWWQawN5e86qGs9xxGa6PUIJ6HdzgGSCV
	 XZdGLzFRlUEAOCEnuooweDJSxdriSQIthhwAAy43hAuh85GsIMmSBV4550Iuqvmb4O
	 vxXlM8qdTVVX/v++wDajbhKxjJSeiMNayiDA3wiadvoIQEicp149L0cTUrhx8lWDns
	 03pxf04EAVgFTMjj48ZwBArjfvGCaalRkDr4JC7IflvFzCOwqSF+M2bw8nXCOPFVBs
	 aMHJMzHUn/MPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1822860817;
	Sun, 19 Apr 2026 14:22:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C8A259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DD9082343
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdPK7FIUH7_J for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 14:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A15181064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A15181064
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A15181064
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:22:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E45AA4C37AD;
 Sun, 19 Apr 2026 16:22:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54486)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wET2T-000000004Up-0fsm;
 Sun, 19 Apr 2026 14:22:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Apr 2026 16:22:20 +0200
Message-ID: <20260419142220.695101-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776608541;
 bh=RI7QTg8XidFH3JRrwxl1r3ZrlR+UhkDw2OHg3SaaUfw=;
 h=From:To:Cc:Subject:Date:From;
 b=MEnxVIXP7IOzct51W6zwMVlBFXLb7AigagQPeVviH0Hz5cQaWnrsuYaWYRyg/m/4h
 yj1fixxeB+jWFRQIrz41+rEMmJcQtGKuAlJK0H/0E70rtPfg6ihh9fpYGFWMPRkaCS
 +YT9alHATVIqYME4BpVeD6dVB6KnF0pvLI8PVW3NjZs/14tbOyjJTf6u/ugKnnwymW
 6Nk3UZ5cLBRic2p2ByxoOjdTJ4RoxEcGeTqFJTkWvJ3e4P/z1+4Ml5NENc1hiYzPVk
 SH2wnlCxRV2rJBtz+g5DBLi4snVUR8wPiW+pxV7dsfAkQgWynj5i+T/o9dH+Mrjc3o
 +fiEh57STB9vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MEnxVIXP
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to 4.5.8
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

https://github.com/warmcat/libwebsockets/compare/v4.5.7...v4.5.8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 6d708135d5..654d3007e6 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d08df7634da0a377a4e077400ed6b2d1d25cf0b239e89397cd39432c5eb437ac  libwebsockets-4.5.7.tar.gz
+sha256  b6ade658f4af3a823d0dc806ae5ef0623f0f4f5e2aeb895a0f77c4783840c30e  libwebsockets-4.5.8.tar.gz
 sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 3c7e778ccc..51f3df80f1 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.5.7
+LIBWEBSOCKETS_VERSION = 4.5.8
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
