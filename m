Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA50C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 06:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C57AB400FC;
	Wed, 27 Jul 2022 06:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C57AB400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeLGJ9zL4Tcl; Wed, 27 Jul 2022 06:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92CC840132;
	Wed, 27 Jul 2022 06:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CC840132
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C46351BF3A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F16560AA7
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F16560AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4t0QATr-hmZ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 06:27:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82FB6080B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A82FB6080B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:27:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id a11so9924011wmq.3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 23:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r5TVcnhQeeUJ8NvvvQxf0Ib78orKkBI1Zg0gr3s/OCM=;
 b=CiwvjNVXWCb50sQMgdJqEQWJ9LCabKBM9xgCFU7g37qH1LK4aWMSDmUzg3uX+jnjkE
 jYTEwtSAsHIyEoWvMUWmbLinBIH984ljcNJ5Ft3U1CVz14rl46AIhMcfUkb/5mTQyTuS
 COCF/bf9uYkyz4FB4d5lwRYt3uT4ps3ep8DNNR6UlD+M09a2s3ECfF98QVdeIlZL/vLL
 Rcs+pwoUX5TvabEmt9D4C2bFcBV10XPLSYgXp9+VAfqWYRxv2tds1+YhPgr+ju8p6Zo8
 +HEyQgSlvBWYGgyyEzpckbyA3/m/ndRvS5fqBHBwEdr4KFEHfWrBTfBOviei8osS8tAO
 jzWA==
X-Gm-Message-State: AJIora+XoU0crvkWP0n89w+dGPoJiqmoprLc2ha36cAslVdGXf/xtYv3
 yuSmpu1sEKWSpafK6ubhc68KGjxXaQU=
X-Google-Smtp-Source: AGRyM1sdFb243MhqTI/qN683OSuNmLpYgtsJf4nEuZyXO+aBrIvxRpwTe/JsSnI4azRkU/cGTlh0sA==
X-Received: by 2002:a1c:27c4:0:b0:3a3:365d:10a2 with SMTP id
 n187-20020a1c27c4000000b003a3365d10a2mr1715390wmn.61.1658903268451; 
 Tue, 26 Jul 2022 23:27:48 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 bh13-20020a05600c3d0d00b003a2fdde48d1sm1196295wmb.25.2022.07.26.23.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:27:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 08:27:31 +0200
Message-Id: <20220727062731.4011-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r5TVcnhQeeUJ8NvvvQxf0Ib78orKkBI1Zg0gr3s/OCM=;
 b=BxFOP0Hj3uRgPw5sBT6eaQoZvv6bX4jbTLLzg5fncrlINXT3+2lXkSVdOQjQSXmql0
 j2d41O9+6LEqCq3XLa0nbivQb7PKvQ+OqMJarsH4k//FkTDFVY187sZxnX0jEEUinCZH
 bNS+kDKJ+QKUJ9KR9uwp19DJcvxKMdiEgEjjW053M8LsvBEjPAnsElITJxtttZo7m2ap
 JRazWc3jbhs27Y3jKwx28okndu/VRDnrGsmvfV6d+myBc/ILGnkyQC56HjbNSESGYayT
 RMJmDt8PIh/M571B0Qod5LZqCZeuX5JaSi4d+9esgWhOU3fI1GADc+oicyRj3i3rk483
 5N9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BxFOP0Hj
Subject: [Buildroot] [PATCH 1/1] package/pipewire: simplify alsa-lib feature
 selection
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of having the user need to figure out that 2 alsa-lib features
are needed for pipewire ALSA support, have the top-level pulseaudio
option select the relevant alsa-lib features, when alsa-lib is enabled
as already done for pulseaudio in commit
97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/Config.in   | 2 ++
 package/pipewire/pipewire.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 3bfcf42a81..f038291e87 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PIPEWIRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_PACKAGE_ALSA_LIB_UCM if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
 	help
 	  PipeWire is a server and user space API to deal with
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index ecfb6c0ae2..790d9c8d9f 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -77,7 +77,7 @@ endif
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 PIPEWIRE_CONF_OPTS += -Dpipewire-alsa=enabled
 PIPEWIRE_DEPENDENCIES += alsa-lib
-ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_UCM)$(BR2_PACKAGE_HAS_UDEV),yyy)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PIPEWIRE_CONF_OPTS += -Dalsa=enabled
 else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
