Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2882C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:04:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B246108E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58B246108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1610B60642;
	Thu, 19 Aug 2021 16:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlzuenPICCmb; Thu, 19 Aug 2021 16:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29BCA613B8;
	Thu, 19 Aug 2021 16:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E7D1BF4E4
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3179E818C0
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eC8t529yH_ny for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 16:03:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58755818A7
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 16:03:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r7so9964899wrs.0
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPEAhkaV8COIV13YXi7hz2M5LtYJWA/wV63Gl2HDOxk=;
 b=KL4O7PrCDMsr721Ncyk4HyTpnHePDCX3B6/OD8+LPAE+jdff0JppACzvr93T8lmXMp
 mmhwan/YDcbFt+6K/KeEBbfa+DAGaL/qRI4tBYOBU2LLcjJoxg8v5Nu/ydAeFbaoFr96
 3P5VxBFldhpWGEWkOYC2uRUqW1dHGFxPZ2blwVUARHIfnQRK3p/VjkAfdbrzTO6+ZiyZ
 411ojHzZu2yQrb7utDrS9vma1tshvSAdM1h8Vta0qIbUKcYQApQnoS+I/FhMOsbriGxe
 aeLBtnTdZPuU0o9BBqs9rrF/Bbc7fthe0UQV7iIAoblsmDrpPB7XzGLWTXwxhqb2pRGu
 kNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPEAhkaV8COIV13YXi7hz2M5LtYJWA/wV63Gl2HDOxk=;
 b=XTy/LCqw2VKGPkr+dXKG+4n6n1UR1Mm/Frnns3gP0ZsYVFMEQ0vUIfSAua86BeevO3
 t/9BLYLDOTZGyoAjM8+OeXtmUmncdf6qkbOicEc10uTwM+Z1m/T6MAjRFV9pFw+V8KlU
 8q1s+vUq5Tiw6wgdm62Q7SI8AkiLQ5WM+8sy6tW5fPNfRy8AfRNJl3t5wSos3Wl5LYJ9
 Wzq3scqPXAz30gZROVNJC6+/Funa7Kx0dI5PDxUKxUIubykEqLENWKR6nlFmjXXDCaXF
 N5sODdQPz1HtWoCHVrm8kXv6RRuQYL1ipCg5gdrCvbK5Fj7coP87IbiAH4nzIYWlEYKJ
 8+5A==
X-Gm-Message-State: AOAM533ayLEsrJJ9IA9KUV3d8YVBAtwgJoQozFhehNSwEE39K84gAFzc
 igz9n93p5mZLwer3OsRnRDgezOCvWU2AWQ==
X-Google-Smtp-Source: ABdhPJwDuAcnUZF10hEa6Dmwf0uasWhZsJ8zPjJxj8U7cYz/nG5vd0PCl7cyDK24fQ8c6kgYMmR2zQ==
X-Received: by 2002:a5d:668c:: with SMTP id l12mr4799509wru.84.1629389033368; 
 Thu, 19 Aug 2021 09:03:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id n10sm3226976wrw.76.2021.08.19.09.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:03:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 18:03:51 +0200
Message-Id: <20210819160351.1045591-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpv: fix build of vaapi with egl-drm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build of vaapi with egl-drm is broken since commit
6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174 because egl-drm is a part of gl
group which is only enabled if BR2_PACKAGE_HAS_LIBGL or
BR2_PACKAGE_HAS_LIBGLES are set:
https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L572

Fixes:
 - http://autobuild.buildroot.org/results/e5c15228f42a73f8c34b26630b2074c30e5f5966

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/mpv.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 91e31dd150..f8ecaeb78a 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -148,6 +148,9 @@ MPV_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MPV_CONF_OPTS += --enable-gl
 MPV_DEPENDENCIES += libgles
+else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+MPV_CONF_OPTS += --enable-gl
+MPV_DEPENDENCIES += libegl
 else
 MPV_CONF_OPTS += --disable-gl
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
