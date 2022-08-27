Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C76ECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A1E54056C;
	Sat, 27 Aug 2022 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A1E54056C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0f5gFi_kkFT; Sat, 27 Aug 2022 20:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9548240475;
	Sat, 27 Aug 2022 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9548240475
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7357E1BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5088160E08
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5088160E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7i9V487Cc04 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:52:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E13D860C0F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E13D860C0F
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:52:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id j26so2481283wms.0
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JAltPFyaIy36H2d8z4xRMWBMj6PPEdQVIua5D+0Smeg=;
 b=omL0yJDUWwA2tPT8sO0NoyGlxqVfL2ATysja8gUxITZqHFbTQm9bx7xkTd6bPZbU9h
 fwMNjaSjM3RvLeEecV6i0GyVjt4/vGyxF+gOR4LhM0B7wQfH5v+062YCg7pMiXeWR77o
 YZrjK/k5FhUO+bJ3sNzxdcvaCT1zgVGC6ISCXRA9JcfAu23fB/TQzUx7zNBQEQe+dJ0z
 tgTqLF8LOOMrz7e0/gdylwZqet+NeEc8fd0AprLGq9Z0sYpK6oS3YOf5wuDOfR9N9FMx
 WFU+Ixd7X2OhvagphusDszOLLOJEBqcgLrv7qqDd/CJ2WbUEBAkLCh7s7taGvG995ikX
 AN/g==
X-Gm-Message-State: ACgBeo3K/94epcK5WwumFtNGyamzuY7CNNVnzJx7BSP0hwMkoomXP2Pe
 /yPeX1AVM944WOhUc4sM9uaYYY2O3/k=
X-Google-Smtp-Source: AA6agR6QxQyohf1av/nBod3jd/smZuRXVzwSVskFa3uKjOuS5N3f8otr91Y6IGl5Ebi411IMdZGbrQ==
X-Received: by 2002:a05:600c:4e15:b0:3a6:152a:9143 with SMTP id
 b21-20020a05600c4e1500b003a6152a9143mr2993571wmq.20.1661633542841; 
 Sat, 27 Aug 2022 13:52:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n62-20020a1c2741000000b003a5dde32e4bsm3826283wmn.37.2022.08.27.13.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 13:52:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 22:52:19 +0200
Message-Id: <20220827205219.277331-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JAltPFyaIy36H2d8z4xRMWBMj6PPEdQVIua5D+0Smeg=;
 b=Xrxfk5TDlgEpa3wd88lZ7ynFxKM1NLQ021hjMNNft7b+pU7xYQXiWY4RAZX1rIjT8K
 lJt84p2M66cVfAF132Xn1PX6l91W6IJ5sgw4r3FpPNL9xt1n2GAlOC1sULqzWzLsY9Qb
 XlNJqR9PjD1oD5W1299YvNrlkf6//oZ980ztkMG0LGf2uCq4TOcu0pKSwzzLjyOXFjxC
 yAhprd9ip+ACdo5vNPSwUXoBtOG86XYCcS/70uzon10FKqfHm4Fc3I63r3oU2ujk2uU1
 zGbO7GdhZPszbow5RndvrQSZcZD1CsVoSBsqoXevvX3kaPMAMcXpwgDvolxoFyS1SGzX
 C1Rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xrxfk5TD
Subject: [Buildroot] [PATCH 1/1] package/minetest: add MINETEST_CPE_ID_VENDOR
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:minetest:minetest is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminetest%3Aminetest

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minetest/minetest.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 5c007ada5e..6d56c3222f 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -8,6 +8,7 @@ MINETEST_VERSION = 5.5.1
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds), Zlib (irrlicht)
 MINETEST_LICENSE_FILES = LICENSE.txt lib/irrlichtmt/doc/irrlicht-license.txt
+MINETEST_CPE_ID_VENDOR = minetest
 
 MINETEST_DEPENDENCIES = gmp jsoncpp luajit sqlite zlib zstd
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
