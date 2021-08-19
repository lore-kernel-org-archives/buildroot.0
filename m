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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6F7C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:03:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A23160E90
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A23160E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A2440198;
	Thu, 19 Aug 2021 16:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_Pmp3_244Sm; Thu, 19 Aug 2021 16:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7454E404CB;
	Thu, 19 Aug 2021 16:03:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA6241BF4E4
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C86D8613C4
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gty1NC2pnJ3A for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 16:03:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AA40613B8
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 16:03:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso7142683wmc.5
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1e+e0y8/L4y7Rtrw0ZRk60y7CtJu5DPr4kbQaCn7YvE=;
 b=YHwr8wBcU4iEg4FQUDV/cl3PwQXKat8VpldheGpw7GwWEUhqifxHSAKVnCuMQqBgZa
 tuhNhgeagQFA4MbQMGIFgg0l1GOng2vre8Pzh6POwG4+iISLZbjf5MRiVzjHV/YJgWvZ
 GK9c5Ei+Jov/f8bh6vNDOHVzv3xftewJAEBK+MPHXI1qVm+qKpLaHJs1bXJvpZkFtSbx
 7sV2nIgW9cTcFV7XaUF8Mq4QEoa8mnl1in+ee51qnJ8iTbL1tom5Lo6n5IAaqZq2ATD+
 3XQXb4RtwZvL3SJR2xEcO1anuDqWwNLqXN7oIVIiVY+w+0r80+EPGRBQudz8pm/hGFCM
 /JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1e+e0y8/L4y7Rtrw0ZRk60y7CtJu5DPr4kbQaCn7YvE=;
 b=Tqw+jty50B7dbAVre7WCnV6rHuVjE7iLoOd3GaaQOvh0gbmTbuW/O+n5Yl7PpGQFPn
 I3Ih/YN1wpDY3ubooHqqZfS1kXNdO+vC5mlCCl2hbHVBCTUHtQpWMANPwa6Eo9Q4I4BB
 RKjnTU6yFT4HVoacLPVd9T/LfHJlLXl/aaTK3PFaZjjugzDsWX8Ke8FlBFoNhIC2ioCw
 98EON+2dMEfkAL9aVBYTfurrUFroypjAVZp0a9C4Bg3aWFth2Ts7YUaryzGhEKdElKWI
 7+ZQN9SCbt1ctuvd+aT3zszVbTJh3lmJWFvbsv6qoJ9RxrLZ7jTaBb6jEIVOFT1cS+8t
 M/Bg==
X-Gm-Message-State: AOAM5314EID9tV/+d8DkLYW4xT/mVmjhEwh7DHnsxj2T6XkQL47dAeDt
 IcP1Itfu9tYjpFCF/1zyG7GDVRSXcOY1Ag==
X-Google-Smtp-Source: ABdhPJzVQrk9R2R4PmN554z9EF6tKssnr9AWyISn2stoR+tXU1IwgX0adAs5chvxtvMvg6rwmwxLwA==
X-Received: by 2002:a05:600c:49a2:: with SMTP id
 h34mr14520206wmp.10.1629389008798; 
 Thu, 19 Aug 2021 09:03:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id 6sm2697771wmk.20.2021.08.19.09.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:03:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 18:03:17 +0200
Message-Id: <20210819160317.1045482-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpv: vaapi-drm needs egl-drm
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

Build of vaapi-drm without egl-drm is broken since commit
6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174:
https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L647

Fixes:
 - http://autobuild.buildroot.org/results/83d6dcbb77ab8754aefcdcf90baeaff9db2a1c81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/mpv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d4d4d4811d..91e31dd150 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -181,7 +181,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
-ifeq ($(BR2_PACKAGE_LIBDRM),y)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 MPV_CONF_OPTS += --enable-vaapi-drm
 else
 MPV_CONF_OPTS += --disable-vaapi-drm
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
