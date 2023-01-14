Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278D7C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 17:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F36F60D75;
	Sat, 14 Jan 2023 17:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F36F60D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWsPS8_x3_bD; Sat, 14 Jan 2023 17:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C198B60D6C;
	Sat, 14 Jan 2023 17:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C198B60D6C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07CA91BF3EA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0BD1405A2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0BD1405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwfsAeQDpjMM for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 17:07:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D8A4015A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9D8A4015A
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 17:07:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z5so22679862wrt.6
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XEfACbemgnXv6JuJN3GAk60bdrC2iW23oVTdhQWVPb0=;
 b=OeNWajIlR8CZ8dXEMVXfS0egY6QCWzzT1uL/GpYit+6irPhRNACWga3nxlHdlG2xTH
 N1x6PB1UWLmWlIJ85jP0UeNw45Ul+2crXSdSvVNxb03GOrt3RSGY8fUK+2qfYxKI3no+
 ZiGWyzPbKAmTWRwUBxVGNKwny+Aiza9xszw2jlBWbJyCp2nqwltjzutiqJ8c+0qy8u2R
 haghfMyBWO2QM2n9mWhsCuzp6E7TxuqCNyjDoao1e2AOacXAQ+MSJwBz0WyE+ZqLqccQ
 7G9p6tCo4KUlYRX3Mcav+8KyjIvyWF5+BL8D3E5eKSxL9sdkv1ARV6ivBrkgJzQjrO4W
 tdFA==
X-Gm-Message-State: AFqh2kov0rjivxVcEa+ML8BD7KM07no5Z3V0rBu8fUIoFBruT1jcti3w
 Sa6fWBKhZesBjLftaBmEwZkgwgYveJ0=
X-Google-Smtp-Source: AMrXdXvm6Dw9n1vCOcVQ3du4jKUTs2EhrvN7KRhWoCRCT+gE0lIjt8qfM2OrS+FGoJd6YaRk7NOgNw==
X-Received: by 2002:adf:fd4a:0:b0:2bd:d7fd:6c93 with SMTP id
 h10-20020adffd4a000000b002bdd7fd6c93mr6641725wrs.48.1673716060691; 
 Sat, 14 Jan 2023 09:07:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b0025e86026866sm25750709wrs.0.2023.01.14.09.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 09:07:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 18:07:38 +0100
Message-Id: <20230114170738.1101463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XEfACbemgnXv6JuJN3GAk60bdrC2iW23oVTdhQWVPb0=;
 b=cyTWH2d6AVy+QbuQ+Ud8KcZxdlwKbxnshGYaQDvel751Glwee+YZKyP5Pup8qTklXe
 yZpDUYPxfSN5hyejXaRpN486KhzT05E+w/s+MlbuasC5cbjXWC9jDOW31kFARexiROJv
 lEJG3+Z9FPatSm98Yg+kmsstd6eq3j7MmWS+p6e/oJEWH4TXbgnYA4raVWo7dqbq1r3N
 RqAdTwrYUnLOuCvZQcJ+lQ68JUcRFQCFCirWR9u+hw5tPK7sPiMuV+kvsaXY1KpQjRKB
 khk5vu/bFFwIk3kWIGZ49xHlATBMt5hOVy/HW1l2H72YzfXcbkqoF2fntnKwh20II0tX
 iIew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cyTWH2d6
Subject: [Buildroot] [PATCH 1/1] package/mongoose: fix build with gcc 4.8
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 7.8 in commit f9e51e1150f59962577358b3da5c390ca4749291:

/home/buildroot/autobuild/run/instance-2/output-1/build/mongoose-7.8/mongoose.c: In function 'mg_iotest':
/home/buildroot/autobuild/run/instance-2/output-1/build/mongoose-7.8/mongoose.c:4484:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (struct mg_connection *c = mgr->conns; c != NULL; c = c->next) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/c538c6d8e87e4e24097c9878ee15083802276505

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 8d06ed4689..0693f7553a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -13,7 +13,7 @@ MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
 
-MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
