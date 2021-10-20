Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5FCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:56:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338EB60ED3
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 338EB60ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00D7083AA0;
	Wed, 20 Oct 2021 16:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkBdj06CXLnR; Wed, 20 Oct 2021 16:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB8783A98;
	Wed, 20 Oct 2021 16:56:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69FE21BF3C6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59AA483A95
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AH8ZCl9yyc54 for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:56:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 237DA83A92
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:56:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e12so48307354wra.4
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 09:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbAe05DNCNBoQLDU3+2R/e2VRGV2m02A637/CP6P7Is=;
 b=nJvyxzxlKWx4qZBmmQzfqNA+cuy+hgu98hyBiXGKFWp8rKw+tJZM8fR46gPlQVAFoI
 GtP0639Yhwk9e+FNKbC0AL814C2HHKWHlJsN8RySP8O3uG87vksewOhZ7rrihvzg7C7o
 ivcKge8BTX1tx2FRGwrdeqvXU9e5I11VoPU10l1Ysxhkc6ODcBP9WP0gwbkA7pdYnVFv
 Eyme8NS77SqIOlP7vduoHzykXqrcVVSeHYOP5M1dI4s0UV6JygHRJqbyv71IXSsnCxMM
 3L1mlyVagBsYBt3SseYOLT4lDRUTfoWvUIxitubHpogdhwb0OVauT9t5sojF7GnCYukY
 eS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbAe05DNCNBoQLDU3+2R/e2VRGV2m02A637/CP6P7Is=;
 b=nDqovTUwuTcGreg42iKAxwVkcXyZ8EXPx3r/xlKTRcM6C+h7EhEhEHOIj0Dm90Aw3P
 wBojmOh2STJHJsA86bLhneR6GxsnHEtA0S8zmuPuTfTUCUyXY8yTCe456D0DExm8kjS3
 ScCo3+Mx29I4v7KXKmeeVEeX7ld55a0qJc0WBBc3fKzi2eTQ2Vf+Kt7ZO0QwgzVZYMGl
 JmGpRmdNDVw6NFsfBEuIqECsKnmXi2GTqxofgzb35WkEjgnugoKVEAjheyjtEpMvCQSr
 0FbyAYue07+KM/YOl5cpm6HxH5IBGjEgNjz+g30klEH3d6I2iaxB5mb4BoEE080T4KRt
 bs9g==
X-Gm-Message-State: AOAM532tBRr/L1wKJW+3k5t4r/3RHqTFQM3QnculkEVqkLbgfXSbyc68
 7PxpxfD9kyXuqclbV99BLBxLewe3IGk=
X-Google-Smtp-Source: ABdhPJxf6ikbiZ/mymiblUNZHWfDrSgneLPu8aBG3WdK1uWDPI52hFjYp5/WWNKdKTS1jKSLis+azg==
X-Received: by 2002:adf:ed90:: with SMTP id c16mr317777wro.395.1634748966971; 
 Wed, 20 Oct 2021 09:56:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t14sm2439921wrr.75.2021.10.20.09.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:56:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 18:54:45 +0200
Message-Id: <20211020165446.2754391-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/ipcalc: add libmaxminddb support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Derrick Lyndon Pallas <derrick@meter.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipcalc/ipcalc.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index ff9d643389..145b6904b9 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -10,8 +10,13 @@ IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
 
-IPCALC_CONF_OPTS = \
-	-Duse_maxminddb=disabled \
-	-Duse_geoip=disabled
+IPCALC_CONF_OPTS = -Duse_geoip=disabled
+
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+IPCALC_CONF_OPTS += -Duse_maxminddb=enabled
+IPCALC_DEPENDENCIES += host-pkgconf libmaxminddb
+else
+IPCALC_CONF_OPTS += -Duse_maxminddb=disabled
+endif
 
 $(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
