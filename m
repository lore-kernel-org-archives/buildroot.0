Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00CDE92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D80081A99;
	Mon, 29 Dec 2025 18:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBGN6cERmYr4; Mon, 29 Dec 2025 18:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31C581362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767032039;
	bh=/vxaqUU2084Olxs36ksa46Prx2c8njVv6W3RvIfFsSI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=K21umxnvQt0rPQsBj158lm96GBiRAzx9Zer0LuM1CNJyGvcfjg6yC8HHKmOp5U5n2
	 u5DnaMY+NM/yvFPKRME4SyEEyBWx1UmgjrfKA3OEWsG1BifLum301hx3s9XuQLJqY8
	 atZUu/4Ktkwub9srusGHc7k3rqlsjj0wVkc2gaNzAamE8W0dYJ8STj/yaDp4guzLXq
	 i4VPw1YBV7Feocrr19saXxwkXqT3ANmCHMyWFKN5iXTq+pOhQdLyGYr7hh2BR8ba/R
	 G0OPFso0ZhwyeAffbzqbZYpuit54lVWJdbfC3vBdudF/BZIWrLCAKsEp7pQ5wUsZDa
	 9zREYN15DoDPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31C581362;
	Mon, 29 Dec 2025 18:13:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDE29D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C035040589
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJ_hQwcu41GH for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9DEF404C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DEF404C4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9DEF404C4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:13:56 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BBFACB0056A;
 Mon, 29 Dec 2025 19:13:53 +0100 (CET)
To: buildroot@buildroot.org
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Mon, 29 Dec 2025 19:13:03 +0100
Message-ID: <20251229181303.1813920-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767032034;
 bh=MQsZeQ4E8n4ISp/UMQ2xBYRNGTPQBfeCbw3dNv6t3mI=;
 h=From:To:Cc:Subject:Date:From;
 b=Q9CVJVO0SHYlqQ2sfdnf7VbxKq5pgI9E2y8QxucVc+FyQ04HfesnoA5tuvb97d7c3
 L3AlA86ewQ6TmdDOV95NWZcKsov/yP1pLnfm/kdipuQmTEKcDkDMkpiCAOw7qAmrFo
 ZQ9QrlMX6v9rNaTh+wozYJgruFgzRF+Wa3Ncwm6KS3zcb7v7N7QpDanZzdVCdDvpwU
 jMXU2IehosyPjkDFjRqjdRrywPoKhT3u5sD45y+qxLH9l3AyH+IVZHq0O96nxHTTzS
 JRzR9mSSyKdZ7l5yxZd0ZneKCpIDj8ZqArvh9rHSU20Hb4dSL93howAfuUu9fIgnXO
 WLdnQara95+PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q9CVJVO0
Subject: [Buildroot] [PATCH] package/imagemagick: bump to 7.1.2-12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 3dbea6d8bc76..eead3a9f97b8 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  acf76a9dafbd18f4dd7b24c45ca10c77e31289fc28e4da0ce5cc3929fd0aef16  imagemagick-7.1.2-8.tar.gz
+sha256  521fa7a8c0f664a3f5cf7437cbcc219f12bd6d5fe0c1fb014f212fa145076e60  imagemagick-7.1.2-12.tar.gz
 sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 4e6a810631e8..0d5eb2aa34a8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-8
+IMAGEMAGICK_VERSION = 7.1.2-12
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
