Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089C5C44506
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 19:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8108040927;
	Wed,  8 Jul 2026 19:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPXlyOjtas-Y; Wed,  8 Jul 2026 19:40:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB7AD409BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783539612;
	bh=86qS2jGY12pf1nlGuviorbFLMC0WYWY12rlCSiOC+OM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rdOqKooesdg8IuMImNezKTUbZbI2pttcSaJ2HgvzBbShk7WQMMBvxZs/IKfkld+3J
	 sULgYJ1RlwBg5ZpN8CIicpzZ0v5MK4IvGuFPOG/3qtv4Ccw4bCm+fzkR0gLx6kq+OO
	 O3/3T1EwZFwaXxrS7YAGcbqvNnNS4JHKIRJ/4jYcM88OyZ9uN9H7P4nY8ctSQD/K3g
	 vW35IxKdD1hN8gnyPKjVKPntxMZb3HEncyrpphFhotOxnx3776m/s9xBpRFs/dy/Ug
	 Rb8jea038PdhDZ+JAizu6n5zUCTGeSeeKMDzTj6t2H8GiITl+Eh5I30e+5Nb+jGJ+W
	 cOnnK2MtcWQDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7AD409BD;
	Wed,  8 Jul 2026 19:40:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCA9D2D1
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B34F140061
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgiBpaKFanEg for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 19:40:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A61B40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A61B40024
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A61B40024
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 19:40:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a01.dip0.t-ipconnect.de [91.58.10.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BAE7AA4C2DB2;
 Wed,  8 Jul 2026 21:39:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1whY7Q-0000000038v-1eqB;
 Wed, 08 Jul 2026 19:39:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Jul 2026 21:39:40 +0200
Message-ID: <20260708193940.1578161-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708193940.1578161-1-bernd@kuhls.net>
References: <20260708193940.1578161-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783539580;
 bh=lr11uAzXYG1zYiHsYkgCMVFrxALxrMc5ciF83NrIyj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LywNaMT5L+yPbALAJU99sSKxXNJeIrR3tevECzbfooOJcDrayV9EVwp04soZ6reVB
 fj7VmaJP+OyXPWUYbCz8B9Z+oWObisnyfNjvLTiqIlRCd3DOh1wKM/+34Eyhw8obvu
 /xb7MuSzIDzqxCk1+rXx8eDmb/8hHiRo1Ms9pHLdhz4tdz+CMyQat0y3PsEE3pd30c
 keXRX2TYXgLXQFLBU49nI7LEeLJY8Aaa8o7Q90SDbLluZ9ZEMML0ypfRwzgbadtYf3
 Rok8LY47V/epJ37ud5Klzu18hFFks50oTozNb+YaBOFLx6mSZxz0A/qpDajCdKuMB1
 fLKGJy78e6qRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LywNaMT5
Subject: [Buildroot] [PATCH 3/3] package/acl: security bump version to 2.4.0
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

https://lists.nongnu.org/archive/html/acl-devel/2026-06/msg00000.html

Fixes CVE-2026-54369, CVE-2026-54370 and CVE-2026-54371.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/e72a7b9a2d707b8ad8faacd2f882e39afefafabe

 package/acl/acl.hash | 2 +-
 package/acl/acl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index a6094fb985..bca535af59 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  97203a72cae99ab89a067fe2210c1cbf052bc492b479eca7d226d9830883b0bd  acl-2.3.2.tar.xz
+sha256  e661131456d2708a01c614a0f400e11d7d1bfaeb6f3e74b75bb980b72f0161a3  acl-2.4.0.tar.xz
 
 # Locally calculated
 sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 6ae0581ef5..f311526be6 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACL_VERSION = 2.3.2
+ACL_VERSION = 2.4.0
 ACL_SOURCE = acl-$(ACL_VERSION).tar.xz
 ACL_SITE = https://download.savannah.nongnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
