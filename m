Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F94AECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 18:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E514E40913;
	Fri, 16 Sep 2022 18:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E514E40913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0cfwLvB7KEv; Fri, 16 Sep 2022 18:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 250DF402EB;
	Fri, 16 Sep 2022 18:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 250DF402EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4785A1BF3E9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 18:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D82D843A6
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 18:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D82D843A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EX78IZRSGHwh for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 18:44:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB0A843A4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDB0A843A4
 for <buildroot@busybox.net>; Fri, 16 Sep 2022 18:44:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n8so9102704wmr.5
 for <buildroot@busybox.net>; Fri, 16 Sep 2022 11:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=OPOBbuaTV97eZD0Uz1Hqh5O7CqvYwY/ggPbRm8MU2R8=;
 b=J2hs9gjEbFvdaKAJPvoGzrU+l1OIk9KpodGhjacINwyynDtdSNXXAoDTF/SBelIchs
 KdGN3RjVh4nUQLq5RzbdxNm5MBku2N4xE+eNlmKXGhlppe7RfFuldXI9CPiLIWFFZ/EF
 H8F0Y2IGeg4ZPZQKqKdO7PN+jJzeFLUEB/gSAWa7V31zPFUCy6N8Il66rFf4p4//Iebc
 JV2agnv3c9/iqeXJHb9xoc3ChxCi2NCTR5/FV9+q1Fi3T3WgC9GKGWAP0JZC8HWYyXKt
 OxBIOjoN0yuCADiCse33lylrrmHdID6V0W8RSDLrP69hjK/SysBumdRAJfCGsE7tYHgy
 F+NQ==
X-Gm-Message-State: ACgBeo1jbwzLY5p4SOups8cDas+PiYbAv/FcHVzybZV87nLTuX3LqCW+
 J8wM44H7hBLggKXfsWgF50OTCpX+mqI=
X-Google-Smtp-Source: AA6agR5LjA+jATI3Mbav9k55e48WIv35YwlCGTK2iSU/WQ1BVurflW88rjkfdzDUi2A1GadZetbQVw==
X-Received: by 2002:a1c:721a:0:b0:3b4:641c:5d99 with SMTP id
 n26-20020a1c721a000000b003b4641c5d99mr11552753wmc.71.1663353876056; 
 Fri, 16 Sep 2022 11:44:36 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600016c700b00228933481dbsm5352426wrf.47.2022.09.16.11.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:44:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 16 Sep 2022 20:44:31 +0200
Message-Id: <20220916184431.2729748-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=OPOBbuaTV97eZD0Uz1Hqh5O7CqvYwY/ggPbRm8MU2R8=;
 b=YOri8PICLq9OLUGCVithMWvEjOX6Ui5FJH2WAw5fN8AKSqaPe3iNpJS+RisQ5WvUU6
 1yIa/9J9dqNt0ZMEAVGpgaZs08TvHmbn6dx4wNH0Ciijfp1IpXJVihEhIA7aCb9pQCnI
 DOKCa4/NrKm+tfR1iVbe2v5PUJmKtmBq1ukTU/TtHplshnC8E8q/Ou3rZLwuw4JtEXu6
 kLKG7eA8HhK+GVz8tPPlEIbzoW9IIeQdhg5j/fXkJe8lPFg7q+YBcFVs8APJjT0uz/fJ
 umCaNnI1WO0bTBQJOfmgZQME74QwiASfkyRHKyVC0LmEgMWZAjXZWtgnax0Ve8hQU9Y/
 hd2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YOri8PIC
Subject: [Buildroot] [PATCH] package/genimage: bump to version 16
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 80065d53b..7ea8f99fd 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9bca24bf883310b30ee4511cbc3a580e40ad4540826e5ed3992c595ce72d003e  genimage-15.tar.xz
+sha256  869f9662d3b778c69b1d1fe70df658e1c9e90aeda26abb753f6fe55e8b0c6e73  genimage-16.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 44963b48f..d1671f335 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 15
+GENIMAGE_VERSION = 16
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
