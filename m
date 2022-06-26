Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FB2C43334
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DC28289B;
	Sun, 26 Jun 2022 20:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89DC28289B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-mk4q-hKCNn; Sun, 26 Jun 2022 20:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B1828271A;
	Sun, 26 Jun 2022 20:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B1828271A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFB7F1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C86418261C
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 20:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C86418261C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXWCCSU8rJpk for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 20:38:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2DD825E6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F2DD825E6
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 20:38:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so4451178wml.2
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 13:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cA48TYuMgTBxmpoeAOIfwOsGq63yvy8Ru+QaSmrMp8g=;
 b=zI1BfOxtcmatcSdE+ubdT8RJAEGwBGJHia2jvMEVhVJ0rKZrYImRQKqc5SoedII1oc
 ZQgy1lioVONfA+K2WckY+GdE+0Zq84UC1LdJgBhlvw+QiyN4JxLmOkA5i1bY+aQ4z9pr
 yNPX6HMrO+BP8zmxeBhvtTwvInHZIlP7IBVdlqJjYTgJ63suHv/yyCp57Elz8Y6LfvGx
 bGLhj/70YggNZYyRzrGbXhu/pt+le+8pf8hIiTgi8TzST8wxAJNUMRHZeQdtW4CLwK4Y
 Es/YaUmkSwuYhttS3Edd7XSaCibUxiBIfULlSEeOAxZ3X8ibmxYq8DIVF2hpIj0Bv3lz
 N0tA==
X-Gm-Message-State: AJIora+aXNLmJzYnO8RlRY1hCTJ/GOEZGTm2W3OgrVW14jC0GurD1D/x
 pTakNgescWy2tmZuh6VbRsCAdoKfUdk=
X-Google-Smtp-Source: AGRyM1u66ahCDh5h5wVqiKs2coYhsflkK/wB8zbCkUacgtRW0APT8Zsi2bUxmp/hpXyqpcMQDjrAYQ==
X-Received: by 2002:a1c:19c3:0:b0:39c:6479:3ca with SMTP id
 186-20020a1c19c3000000b0039c647903camr15905055wmz.27.1656275906544; 
 Sun, 26 Jun 2022 13:38:26 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003942a244f47sm15809432wmq.32.2022.06.26.13.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 13:38:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 22:34:46 +0200
Message-Id: <20220626203446.1590347-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cA48TYuMgTBxmpoeAOIfwOsGq63yvy8Ru+QaSmrMp8g=;
 b=PzDE78UlcrbAEqujDPM5NLlOl57ls1KEoFtDCPJOqyha88GRDWSlmdXyUWWKQ9hflU
 FDqbtdTukWMin8ecxDWhFa+kDtxvMxQFxQtIktp5IZRXA0/xiASiQBg1HmPeEhZgKGyR
 6i67wU3Mm4sQ42QXcAgKHYX1M1k5sZOCkIadtfgx1er8VnOqE7B4djFVdeQ3DhQtxuCN
 4gsxPSGe73GE4j8DEfU/r0Cii2T86VPvhHSc4Z/7rGLAfImGy2J6Rl29XyecrAXbO5kg
 +a3GiCcXnkbZvvBkzFSMoGZ7BMelEdZTKiJnxWywclG6F1NpBOPggmtw+2QFrD/wStxT
 uZgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PzDE78Ul
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: bump to version 4.5.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/sqlcipher/sqlcipher/blob/v4.5.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/sqlcipher.hash | 2 +-
 package/sqlcipher/sqlcipher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index f831e615d8..c655165172 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  20c46a855c47d5a0a159fdcaa8491ec7bdbaa706a734ee52bc76188b929afb14  sqlcipher-4.5.0.tar.gz
+sha256  023499516ef2ade14fbcdbe93fb81cc69458ae6cb3544614df8dbef34835b406  sqlcipher-4.5.1.tar.gz
 sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index c47aa48429..c0c53acdd2 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = 4.5.0
+SQLCIPHER_VERSION = 4.5.1
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
