Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19D8ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 20:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 725584016A;
	Fri, 26 Aug 2022 20:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 725584016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RP7_qSYNsmJ; Fri, 26 Aug 2022 20:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1FF740120;
	Fri, 26 Aug 2022 20:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1FF740120
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F30821BF2A5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9832415FA
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9832415FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jFQ7cmS9-PzW for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 20:51:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E59E440910
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E59E440910
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 20:51:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id az27so3107471wrb.6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=2UUUgknQmyQznqeg05ZUAKF1WSYKJWl7aE9EoF5pFTg=;
 b=N8l0bxGtFnlRhQSZ1bNOg5yyC95/Zt7HR75DnXvKRLafswi97OKBEAX+GCn5gNv/uo
 N5yn2NlrudzVh052CxtExozQ7jygpY5N1UqfFvOjBMaLc6S6yV494EVh4tlSmj1rhNsJ
 HNra4DuBCjoresevSEJteVC2J/ODw5zb6eI1nmilIfUCeTNzAIdZ0SL/vqr8NeGoYQdz
 vhVViLQVAniMJ5c4/NhX5sqnXL/SOUyPVpyMmRs1hviNQgoOhOdrZ6t8ClMpap/KpA8X
 vktyrW/dpj++GOKSVClONh4684KJru02UO0+N8/jtO39jiL+IgwRv74SZtnyfheYzhWJ
 mK/g==
X-Gm-Message-State: ACgBeo2ebVWHD/KqgfLfEMOCXg54t9oSnncc05JSFZiaSG90RsEV5Ah3
 TAJDm97VJmENkBZpx2yWlIngYDUC2r4=
X-Google-Smtp-Source: AA6agR5MfrizF8csVETZk0+b5/z/koArj5A+/n45Fc0u3eqCMDvG715ABxiuG0NEHaGwYYpMFA19dQ==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr733482wrr.472.1661547067900; 
 Fri, 26 Aug 2022 13:51:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c500600b003a603f96db7sm642150wmr.36.2022.08.26.13.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:51:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 22:51:04 +0200
Message-Id: <20220826205104.18667-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=2UUUgknQmyQznqeg05ZUAKF1WSYKJWl7aE9EoF5pFTg=;
 b=RIuW2Mgi67F8RfuyjqQuDS4IYXdAXwpZgGQ2IbwYd78g611Fj3LHnF6/AvL5+D0L1O
 5w59cbcqfddGBFX91V6semdFL0418AUDS1ltdYhnuM/LDLRzS8GYNBhfEknR1HGDguN2
 4qvhIYkl3/3rBgySukfURVNsJJ+B0yFwweNDO5QGn4FGbQnP4C7nx5RiE/grY764EjTJ
 RDYghqdYT4gh0GL8YjT6+cfIEIhUqLMwW2CnmP9GK9HSbbcSlVnNwxlAomgsuAgQF60B
 bq2M0Dzc5xuVqwoBObKG6NzfHygr7O5J9WpfAeQdFHjYGYkxs4ojincryEYuelBieNmV
 MGhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RIuW2Mgi
Subject: [Buildroot] [PATCH 1/1] package/mali-driver: fix legal-info
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo: MALI_DRIVER_LICENSE_FILE -> MALI_DRIVER_LICENSE_FILES
added by commit f3ecd9ea4a40d601317f3b7195be4f5d1bdb3146

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mali-driver/mali-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 2d5febe192..515f70c429 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -8,7 +8,7 @@ MALI_DRIVER_VERSION = 3d697de9bce8bc68bf9408d5407873ce32d0f4fc
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-MALI_DRIVER_LICENSE_FILE = LICENSE
+MALI_DRIVER_LICENSE_FILES = LICENSE
 MALI_DRIVER_MODULE_SUBDIRS = r8p0/drivers/gpu/arm/midgard
 
 $(eval $(kernel-module))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
