Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A159C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 22:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD6360F7D;
	Sat,  4 Mar 2023 22:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FD6360F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkSVdvgFCP_D; Sat,  4 Mar 2023 22:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65EA460F77;
	Sat,  4 Mar 2023 22:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65EA460F77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4D0E1BF591
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB90681DF7
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB90681DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMawn6hjCvkN for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 22:31:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A2981DE4
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71A2981DE4
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 22:31:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l25so5451762wrb.3
 for <buildroot@buildroot.org>; Sat, 04 Mar 2023 14:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677969064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5cD6oV4ZrqxgNjOhjzl6ZSt+oXkVY8dRd1KeR+28nZM=;
 b=oYmSXYIatp9Un/QgXytYoiLszqDAaYlty4FT3ns6QZEwpcCPqxB8johrDE7Tmflb3M
 Z/hwulNBOsnpeL1B7nBuCT/SE3wKSfeFEuWjbMrRi3/eHyeHiWCj+JygBViPr0MPqvED
 KaxrCznzhcPPzmRCZh/hGTBQcpNGvD4VEtT9Kp9ZBzLhWpgdHQsbeXmLMjuWc4BwMCST
 L80d/oIHwecIW3llqg8XtFVwr6203gLvizbIqjJ9yIwFxmWvdjf/aBxuicPj93CPtxkE
 EEPjHvrjq2ND5ePgNHellGvWoeENH6v1+3A1JWm3pkQDJhhcf5ZQVV9xM6DXrPaMAbbp
 kR/g==
X-Gm-Message-State: AO0yUKWlOWPyCUdFXtPb7wYgTdLaal6zLDJkBDgM4S5rFA4Ub3YumNMC
 GQqyPORr+uRtor+lvncqL47gZ44OmRY=
X-Google-Smtp-Source: AK7set/bLaNbDChbNSBzq/+JQWfSc9DYCMFk0oF1vxh71my1x2RvPt2C/J5RhdQ8VMUsh5o/yhbhLA==
X-Received: by 2002:a05:6000:1289:b0:2c7:1524:eb07 with SMTP id
 f9-20020a056000128900b002c71524eb07mr3455016wrx.67.1677969064125; 
 Sat, 04 Mar 2023 14:31:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c71dd1109fsm5886723wrw.47.2023.03.04.14.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 14:31:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Mar 2023 23:31:01 +0100
Message-Id: <20230304223101.23757-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677969064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5cD6oV4ZrqxgNjOhjzl6ZSt+oXkVY8dRd1KeR+28nZM=;
 b=LafQ2BF2FEPTW0Di4dVg0TWijI//iYjh7eUd72sOlKd90kkBGsj6ylBcTgqlwQ1UfZ
 PHTgKjGeMSQM5yAp4ag/HBPflos69UGK2X6HVkSw/V0pS4aEqrXkvWXr8HBi66trnYIR
 ZjhY9dhV9y28bmN/y1A4x1agiHwhm2XLTXjWR4+a0BAMyjYN3Z/BYqgYgKkqNu0a5wPm
 5OO6QQ6iTCOmipyOwJxJVhzSL+7aPOcxHKkf/G71uEFQ9SHUPuFx7Sb6VF9F47wys5PM
 eBFbsAYiwzPDDi2sDYKDNCPrp5hNvNtp2RGDMqadckBRWvcqiY106w8UbycSUw8LNhR5
 4cRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LafQ2BF2
Subject: [Buildroot] [PATCH 1/1] package/quazip: add QUAZIP_CPE_ID_VENDOR
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:quazip_project:quazip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aquazip_project%3Aquazip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quazip/quazip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index f4de2a11a4..70534b63b3 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -12,5 +12,6 @@ QUAZIP_DEPENDENCIES = \
 	qt5base
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
+QUAZIP_CPE_ID_VENDOR = quazip_project
 
 $(eval $(cmake-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
