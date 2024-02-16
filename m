Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192A9C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 05:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ECFA409D9;
	Fri, 16 Feb 2024 05:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G8598QWZnIg2; Fri, 16 Feb 2024 05:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA33410D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA33410D7;
	Fri, 16 Feb 2024 05:53:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 007671BF3F6
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E93CD410D7
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 05:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Usn8WE0TbMUN for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 05:53:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F36DE409D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36DE409D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F36DE409D9
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 05:53:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A58EA4C0D92
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 06:53:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33994)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rarAN-000000006C1-1CFF
 for buildroot@buildroot.org; Fri, 16 Feb 2024 06:53:43 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 06:53:43 +0100
Message-Id: <20240216055343.24326-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708062823;
 bh=BGexXxxtNgKuNFZHAYa8IO6PJ9DfvfoUTMXMuLYGixs=;
 h=From:To:Subject:Date:From;
 b=YqWQLlZSWkMES67FcB0pbJWy+O8PSYvzue6ERGlE75ADAjiS/NhEdTW56x10WbilM
 yxVH431/zmA2nPsTyNubkZH0i8bVeDZ5wOtUMUBitQKom7IzYwg8jiO0BoUTVa30OB
 1rrXpteWedBOayzJSw89+V4yNMk30lajt1P0N+/0KfPmmDBmLam+iAF34F3YvH64la
 +xrYC2dS34q/8OU6UlOIWUiOYhJswuhmnetunwfaM/A1sC/D+vR8M9FyQX1Twdc5YC
 udhGo8ZRTAH1OHJWYFoWbCQBsjx2xIoPQeAh4oTYoNW2LKjQARDABoZ5S2JH+fDLR5
 tkEQvGK8gQrmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=YqWQLlZS
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Changelog: https://www.php.net/ChangeLog-8.php#8.2.16
Release notes: https://www.php.net/releases/8_2_16.php

Updated license hash due to copyright year bump:
https://github.com/php/php-src/commit/2575e6b88c3d3bbd53383fb65057c9b7b029e264

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 4 ++--
 package/php/php.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 7c8736e41c..4ce3616de3 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  eca5deac02d77d806838275f8a3024b38b35ac0a5d9853dcc71c6cbe3f1f8765  php-8.2.15.tar.xz
+sha256  28cdc995b7d5421711c7044294885fcde4390c9f67504a994b4cf9bc1b5cc593  php-8.2.16.tar.xz
 
 # License file
-sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
+sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index c69abd5f31..4daf7f633d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.15
+PHP_VERSION = 8.2.16
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
