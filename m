Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEDDEEB569
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 18:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E9B8124C;
	Wed, 31 Dec 2025 18:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk2JJE6hKUas; Wed, 31 Dec 2025 18:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E70C681242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767205693;
	bh=btKYXf233o3ONyL4USETU83hePmUIrGF1R5Kwi0ZD60=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=gQ6xkLSMU9Ar3CNcIVQwGOJ4WCkh/+dJcweqWrepaU3p6q8PVJ5ID8RFrhBVeZA6/
	 pvqu8o1Sa77ElGAPQr+OP4Vu1bVNZklOnVtQVdOLHbIlRIglUZfYJcFS8S63JpjCK8
	 8/BXnr3040DgmsU4xJ6gSQ2/jebN+YTMuMqH+R+4cGP1RO3O4OO3DQADpopI/n+oyD
	 G1DwKV/J6v1ozNzT1rJFgQxjn7B7ve0kovMO0NxndURTyygs7rVuV3Xqk5e209wHIR
	 VrXwm5b/2aqHNe8vBVcNiv8jBE1e+Udr2V+475O1Ww8eI/kMSGIuJcEICkFGvWryjo
	 jA3pqJaaw6qPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70C681242;
	Wed, 31 Dec 2025 18:28:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8CC8177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A02F4009A
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMAKO2WeXJZH for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 18:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96D4E4007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D4E4007D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96D4E4007D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:28:10 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E17F6B0051E;
 Wed, 31 Dec 2025 19:28:04 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 19:27:43 +0100
Message-ID: <20251231182743.2150393-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767205687;
 bh=hHEl1wz+fAhEaAKH3qUqhJ2QUQBfrEOQCCHkaG+gBPo=;
 h=From:To:Cc:Subject:Date:From;
 b=ZeoSfGacNrmhIYFJNW3ZK7QW5ymR2VjymPsxdPkhHp4lOT9woZtaDBKIvZLOK4F70
 ezK/UHQlRpAKDTEOzvxNlYPXsLfdc0g10XDGbp1bKy2onGf8s4lL7Lt7d53O8g/rhh
 1nuYRQIEv/tQVkCoojAdVMLGjnwcVJZMoOwTxPC1BvMmjWXd+k/gDX8PfQ7nAJT3C7
 fN5WLns607n4TqVjCIa4qa29wxaoLcKJlcmVVbOQsSsAkMQtLNolwA9uj1vkPAwcET
 4jhUkso+YZICOg9jEyIM5lFYak6q4woEOfeby3coV/bAmf7f5panUxWc6v1EYcifnT
 woxctO1Xat/1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZeoSfGac
Subject: [Buildroot] [PATCH] package/feh: bump to 3.11.2
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/derf/feh/blob/3.11.2/ChangeLog

COPYING hash updated with this commit:
https://github.com/derf/feh/commit/e4eebe54d5ebca968d0d9643eb15a0ee407d1e70

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/feh/feh.hash | 4 ++--
 package/feh/feh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index f86a7ef6d797..61c35e6386af 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  5426e2799770217af1e01c2e8c182d9ca8687d84613321d8ab4a66fe4041e9c8  feh-3.10.3.tar.bz2
-sha256  881f1b901b5b99bce372fd9498106724a1ea52450f7bfc6fc1cce6736a2faf4d  COPYING
+sha256  020f8bce84c709333dcc6ec5fff36313782e0b50662754947c6585d922a7a7b2  feh-3.11.2.tar.bz2
+sha256  c07900c3c11294d8dea3c592092aa41fda3789f58fa009910695de0ba2570aeb  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index be3b67aff9c6..340418e570f1 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.10.3
+FEH_VERSION = 3.11.2
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = https://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
