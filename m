Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE55C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2246960774;
	Sun,  5 Feb 2023 14:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2246960774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axU0620acyHh; Sun,  5 Feb 2023 14:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7546F606E7;
	Sun,  5 Feb 2023 14:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7546F606E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3261BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 254DE8146A
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 254DE8146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwCw7hfMzV8J for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:50:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D72CF8134F
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D72CF8134F
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:50:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h3so477893wrp.10
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 06:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fdKxA7w3L6nRqZdot7y/Da8Gwvhny6e7zruA35sKyFw=;
 b=cr5pU3g/DVHF4MvU18dJhU9WMBAQT+avaCQbom4uXWCT3RXP8OJeJiR+hkJyHcUuFi
 jZ83ah55WOck1aoQ+BwC0jK0gc7F86hn0rxuZr9wgdurhgl4309LfXxa0ykVN3xdY74S
 XexX/EsIfUd0dxfTqoSdi5sBQsojAJgbbCKog/+UGcVfq0NJdGRcVgPAQ8cRmB3UZUBc
 vGf8sDS8SBKAAW7LrZ0Xuw+/mH2rJO710ufR1kffFl7yBZFmO6r7dgMr9UNVR7D3fIB7
 haq4UY0Gol2MwKOZ/jlvcxU8SVOOObMsFjPnlH74SK/k8zQp71lrXvUDxaJ613hLE9NP
 Crzg==
X-Gm-Message-State: AO0yUKXeIujAn80iXDifdfC1fUob6XWg6qBZz2I3+7X/F41yTUBmv0tM
 JpM5ptueG3LR2zmtIAkN5dLkCxlSUjE=
X-Google-Smtp-Source: AK7set/PormCTiR3/QGP+Ly22C2yDsyFF5f4QFv++qyW9dDEFSTBlB3SqiESSgC95/i3/OINVuKBIA==
X-Received: by 2002:a5d:5047:0:b0:2be:151a:dda0 with SMTP id
 h7-20020a5d5047000000b002be151adda0mr13428908wrt.70.1675608638740; 
 Sun, 05 Feb 2023 06:50:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d68ce000000b002c3da499290sm5636093wrw.84.2023.02.05.06.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 06:50:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 15:50:36 +0100
Message-Id: <20230205145036.654667-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fdKxA7w3L6nRqZdot7y/Da8Gwvhny6e7zruA35sKyFw=;
 b=HBAibTVFPXNSMhfkX7NQxNUDeUpXKo+nM4xrA5SdCWDqU+il4+ea1fzTzo178LUHYL
 2PAW0eUnsXU6MaopySuWxR2fLJ6UrSTvf66gXPdMYPJlREyk8ZFiTICcUVG2hWz1EGuT
 vtLb+jlYiaeAViUoRyKcCtD0IBPXvVqcPFcQ8pRsv+57mgJ8Hf3VEJRf+fi9r40bl53Z
 ELWGlrqornW3GS5zSMNTH7BmSGBKaH35exRuMPqJIE+Ij1IYqjkZs47ZIc33lFojob9V
 qFVhH3pwJRaW+Ywlp3DoNL5vyWx09kuzgP3PBti5x6Oqk0ewSRnJ72YTEwuFVyjsJjM1
 bbYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HBAibTVF
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: fix openssl dependency
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483:

Makefile:576: *** libopenssl is in the dependency chain of fluent-bit that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/9c3b8e19063f7587877fdb0598739b55abccb3e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluent-bit/fluent-bit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 879437e5f4..13077e53cc 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -10,7 +10,7 @@ FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
 FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
-FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
+FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
