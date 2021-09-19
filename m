Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AA3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:36:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB9F60F50
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FB9F60F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8973401B1;
	Sun, 19 Sep 2021 08:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKsfTcx4TFAb; Sun, 19 Sep 2021 08:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E962140182;
	Sun, 19 Sep 2021 08:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE30E1BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDCA282B61
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYeT2exF6dUV for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:36:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D90F082BBA
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:36:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so13242211wmd.5
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9r6SGwyEWvErPw3p4C7iX0zQglDjoSSD8MPynV1omWA=;
 b=TBtZf/34FfoMYNwQ/zQR8qv4n7nshtHZT08LEJiW0jvKyuFWE0POTLfu05eQy+TZqO
 eTlcsQDV0F18G7PnoEDUhiB2c+7tTe5c63TqP5vNjP9y13wRHr+0xTMeKFfCw64Cr6Vn
 LgZQTLPR5vJ9jhJUmgCaZQCYTlJTlGwDpIVbes+SWZSCOFjDUsfdKquW34sv3kshhCpx
 oJeelZRucBx/PMpSlere6rwWbMJcHFUUCA7eFdRIQjPVjTLcEzI9mGbsPH9NJ0yUWIOj
 FloRaBMn5sVkku7XFUsZZBzXfSlbGPf0L//no3omdN5EPi4cu6vgqrj0HDJehKSEivk1
 Oz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9r6SGwyEWvErPw3p4C7iX0zQglDjoSSD8MPynV1omWA=;
 b=zxPQMtsunCq+bBv8QRNje5rKzk9V4fViSpiaOJyavNkwXucMTKHvbyuisV4y0yyMBw
 5woDB/zb1xqkPJCX//aqySoql+M2l95UsVbalc4Tvgp+6iWw9u9Ckf7ZzF3rA+0luk5a
 8+LQZ5oZA/BeWl75OHUU+8Y1CEFv0R7atbibbOI3RxNm1AmJoWZKKCuRnWfgsdLDch0n
 3a9p9BHD1HL7zz26HZj83jbaOfIg5sAeXySun0YMosj+978CASH17fTJHrchNiAg3ymB
 vj4RasIQlAdA63nVX5P6xkep9hgeQC2SUS+g91N6wG0I8n6oGVaPwwXR3CDQDRgXtCK2
 ycYw==
X-Gm-Message-State: AOAM533vzdn+qcCFkxp0FENr8GI+rBiU9zPNQleKsMBV+UFWQdG1+U75
 0nkYF4RfonzMk5zRiGjirlv/rCaOS8U=
X-Google-Smtp-Source: ABdhPJxnsLCKnEQBgxRoLAyzmPcjiZEZJKrNNJonsguUWovn1eFS+ikTmk615I2rBaKDH0J0U/RArQ==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr23571801wmb.79.1632040584646; 
 Sun, 19 Sep 2021 01:36:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id j21sm11988142wrd.48.2021.09.19.01.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 01:36:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 10:36:06 +0200
Message-Id: <20210919083606.1607325-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/wayland-protocols: add host-wayland dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

host-wayland is needed to avoid the following build failure raised since
bump to version 1.23 in commit 7eedc9cc1e0c3cce1c18cb150157cb2346075b23:

Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)

../output-1/build/wayland-protocols-1.23/meson.build:11:0: ERROR: Dependency "wayland-scanner" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/2744e50465a9cd9d3726d23298ad6c943ef49a21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Use host-wayland dependency instead of wayland

 package/wayland-protocols/wayland-protocols.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 41ab1e1c99..ea1639ea2d 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -11,6 +11,7 @@ WAYLAND_PROTOCOLS_LICENSE = MIT
 WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
 WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
 WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
+WAYLAND_PROTOCOLS_DEPENDENCIES = host-wayland
 
 WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
