Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312A5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF2FC60FE8
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF2FC60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F47A608A5;
	Mon, 25 Oct 2021 22:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxRHzuBBUYPC; Mon, 25 Oct 2021 22:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2900260893;
	Mon, 25 Oct 2021 22:07:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4D21BF85D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1438560893
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaHFBBGKYqh0 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:07:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BFAA60809
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:07:36 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso522286pjm.4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 15:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM3Iljci6ATdUhhTrlJJ0kewYpEaBDeDu+r509EfwXI=;
 b=YuYgCXT+pgjVe8Uj4alNBo5Ek6X6Xcixa2FmGKXJ4+39+/bpKjEhcf1GIW9UTBorl8
 G/bPwV9TGCxP6JPvbwCBPt6Wj4Ckh+fneEISpkN9bfZTqFP86EjewNgEy2snKXfWjHtz
 ZHwTJvJXinkQmQy73FMs/2vMrUTg7qsXvEY++cuVKKAMkyLZS9PrM/LIX5OgvZ1QY7P5
 WX7NiiuWV9+csDz3GrCHlneFulZfrY3cSC1rLs2hiNIn5Mw5bykXEadDBaRCR/gGHNC6
 JOfYZkMtwGeUi909R6ti06ux+L7q/EzZEjqTwPFjDynYNCtjW8/KOnohjXbvus5qRH7N
 9rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM3Iljci6ATdUhhTrlJJ0kewYpEaBDeDu+r509EfwXI=;
 b=SSy56Yfw2ZyT59rtPOkc6ZRUWM97h4Tfzyak92c9bfoV5ksk0ey6wtxTS41EtQKlNH
 s9o91ohErV959VQBS9rYioIfT/7jIdVY18//3kDe3sjY/U0aPMcjLme3uB3wQJ/RC0uv
 HwyIBWyG0XSkCva7HSXl+AwPy4/7JMbMEzuSJdD27nTtDYyiwkjvU8AExlnV1XrUECA3
 Bjlpk2ol9d8ChoZcju5ui93CclFdEJdwrfjQ3ckkHk/OBDa3ASmRjNcaD55e8HvEpKsQ
 GDw0bN2YhVCuzrcMlWJdlmjEgnj4tWsEt4vS2SjyojkAdA0vZ3PiImR+rSh3AhAh6s6i
 /bkg==
X-Gm-Message-State: AOAM5329+9Lx5rUO0ZjvLIHPdkifm6srTFSG5WHhbpsUqbiG7tSKgOck
 yeRlC0sFAwvd6R5wfxVKNlLBE+2WCso=
X-Google-Smtp-Source: ABdhPJxTjQDag2sWozDZOtGMRqht5WAwXOClDKExki5XHlGRBJRDu527wB+V6FpSUfkhQhfSgiFNwQ==
X-Received: by 2002:a17:90b:1213:: with SMTP id
 gl19mr13325403pjb.114.1635199655312; 
 Mon, 25 Oct 2021 15:07:35 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id c20sm16337001pfl.169.2021.10.25.15.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:07:34 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 15:07:32 -0700
Message-Id: <20211025220732.2795545-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libinput/libinput.mk: fix libx11
 dependency typo
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libx11 -> xlib_libX11

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libinput/libinput.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 0c232994df..54790498c2 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -24,7 +24,7 @@ ifeq ($(BR2_PACKAGE_WAYLAND_PROTOCOLS),y)
 LIBINPUT_DEPENDENCIES += wayland-protocols
 endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-LIBINPUT_DEPENDENCIES += libx11
+LIBINPUT_DEPENDENCIES += xlib_libX11
 endif
 else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
