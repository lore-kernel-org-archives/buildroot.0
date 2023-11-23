Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC395C27C40
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A506D81FC7;
	Thu, 23 Nov 2023 00:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A506D81FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSCUoyCwgYsr; Thu, 23 Nov 2023 00:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26F281EF3;
	Thu, 23 Nov 2023 00:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26F281EF3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 714031BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A83D60B16
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A83D60B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkHhV5yjid14 for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:45 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D9F660769
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D9F660769
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6b20a48522fso332485b3a.1
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698124; x=1701302924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/k8Y39a2iJxWM5k2N2ogRAJk1S7dQ1R4FlECVUGzro=;
 b=f1+OgtFm71c05WWbYxJcIwTKBX/JmR42A4XpT+xzrALD+uEV7MaEoX3hlbSPU216Y0
 LknmBn/eWlLR8L5dVUVFYqDYiZvdxhMp00GoKsLjt8GfdUcP96Mnuq6fgEygjERVwn4F
 0C61rxisfaUZRS9HbkTZzRvFrdmUVD9OdnUXHTc4ISYb/lX6Ru31kqi1hsbZWLQN21t6
 WNbbz7iqoJycwtI5HVne9CtvpUV2dN47cYuMwBH674WnNuh/bOFmq3HN1KDgz9tHPzU1
 wEvNMfXLvHmtNLSyf7obQC5j8IWqcqR72WjYX1n5SsiKYRE4Z/uRSSJHSvM2Yw4mjehh
 uhPA==
X-Gm-Message-State: AOJu0YwRpQ5pVZl8IuG3zHDY6z0B4ffTF09vA67mDnfvcfITpEN98uko
 /EJ32TAUvOrQlJ6glbl6fR94/od3mN01SglH5/w=
X-Google-Smtp-Source: AGHT+IEhwfM/PyjfjC1jObjFGQuvpSM4nC6x4sHF8GYPLWg0Q+4CAMh5qpKneIHJNOcOe4Uix5IVrQ==
X-Received: by 2002:a05:6a00:2d07:b0:690:2ad9:1436 with SMTP id
 fa7-20020a056a002d0700b006902ad91436mr4748349pfb.7.1700698124538; 
 Wed, 22 Nov 2023 16:08:44 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:19 -0700
Message-ID: <20231123000819.488595-14-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698124; x=1701302924;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/k8Y39a2iJxWM5k2N2ogRAJk1S7dQ1R4FlECVUGzro=;
 b=Vn2DayUxgf4Xs+KzlGQ0sYLDnf1pPkpSJU68Mp4lYklKzuORPG8uDc7Im2zF8k8Ox/
 SMaIHedbrtL84miFVw6rKc6yguOuIDXsxzDwGW0bk154u8AFLqbmFMe7FS44WwhRI3R7
 01pb95hEliBtZrAhxOELveaYc44Za9D66bRdI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Vn2DayUx
Subject: [Buildroot] [PATCH/next 13/13] package/sway/Config.in: Add a help
 note about the default terminal
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The default terminal used by sway is the foot terminal. Add a note in
the Config.in explaining that if a user is using the default sway config,
it is recommended to also enable the foot package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 3c573f83d5..b662e04bd3 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -23,6 +23,10 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_XKEYBOARD_CONFIG # Runtime dependency
 	help
 	  i3-compatible Wayland compositor
+	  Note:
+	    The default sway config uses the foot package as the
+	    default terminal. If you plan on using the default
+	    config, it is recommended to select the foot package!
 
 	  https://github.com/swaywm/sway
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
