Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1C7FD377D
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 17:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9613B61563;
	Wed, 25 Feb 2026 17:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Qmt09Uj45K3; Wed, 25 Feb 2026 17:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E1261565
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772042385;
	bh=MpvaCTQOyRHASiHwvUxzLsH74y2xrQ4N6oN82Tj+ayg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LCnADYPGSv+FTEDx7p70AUsj8B4UXd3xzjmFM7BePuXrEqKfDmJJ/wkef9jJBRlGa
	 2uf/NhMd3z/IhWZDJoF1EQ7PFkkkpy4Az4DiH9V3KNSdY4TlWLuidk9v6HXl2bL11v
	 yjtQRJLCMHX/2Yr3Q0wOfjXdiNCJ6gDg42HeG/7sMf4h6iIMmSHc3mKhc/ymAaaIQ5
	 a3/HQ7Ft/5Wn8X7Woij/o5I9xljC3fjNQ8OcF/3fGOCIh2zy+6yXAaVaX1Zlk1cDTG
	 A3yuyunEvESdqEt9m+l4DdAOm5TzW/ccNhVGD5wY/TIiODyAfE5Rove7xc+jwe4ixH
	 VWLmL72fCuzpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E1261565;
	Wed, 25 Feb 2026 17:59:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D33523D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 17:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52F7761565
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 17:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUpdLG_-2CAX for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 17:59:42 +0000 (UTC)
X-Greylist: delayed 444 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 25 Feb 2026 17:59:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0229C61568
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0229C61568
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.233.101.22;
 helo=leonov.paulk.fr; envelope-from=paulk@sys-base.io; receiver=<UNKNOWN> 
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0229C61568
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 17:59:40 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id B13A71F80041
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 17:52:12 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 55306B2358A; Wed, 25 Feb 2026 17:52:11 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
 by laika.paulk.fr (Postfix) with ESMTP id 216BBB2357B;
 Wed, 25 Feb 2026 17:51:58 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: buildroot@buildroot.org
Cc: Pedro Aguilar <paguilar@paguilar.org>,
 Paul Kocialkowski <paulk@sys-base.io>
Date: Wed, 25 Feb 2026 18:51:38 +0100
Message-ID: <20260225175138.2965145-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sys-base.io
Subject: [Buildroot] [PATCH] packages/libunistring: bump to version 1.4.2
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

This minor release contains a fix for building with host glibc 2.43,
which fails otherwise.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 package/libunistring/libunistring.hash | 4 ++--
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index f86b6f94b02b..ef2f3da34147 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.1.tar.xz.sig
-sha256  67d88430892527861903788868c77802a217b0959990f7449f2976126a307763  libunistring-1.4.1.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.2.tar.xz.sig
+sha256  5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a41499c  libunistring-1.4.2.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 1abbfde6da9e..57333a35bffc 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.4.1
+LIBUNISTRING_VERSION = 1.4.2
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
