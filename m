Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1201C369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDCCC413B8;
	Wed,  9 Apr 2025 20:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsaWkVGenEvy; Wed,  9 Apr 2025 20:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D990D4140F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D990D4140F;
	Wed,  9 Apr 2025 20:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D8E5D6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 235874128E
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5k9-wL1d9El for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5FD8413BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5FD8413BA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5FD8413BA
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so1180005e9.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229037; x=1744833837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nJq8nSNZCOYAl/JCVjJ8i/nXpSpRjds9OJk8asvQjK0=;
 b=lIo570BMlk/ZK6Xaa0F2+uaPeVvB2NBpRTx63FK3nDje1d0LTcyyKyo0ZgEXr/CN/q
 WWgcIqIMZ5LKDOt5+SkRrko5LUANi/SWZLGpZ1e909loTZMRWa9xJ+mp3nKoVWw2b3+w
 jYtiuJ2EjaY8zSziuNw04Qwm4lGIPkCS8c15ZU3RNmkmo3ngzmU+atBrhPUGcuOpR3Hn
 awKj7mhO6PR8UCeRmZh30YGFO73Gonb4vG+Q2KhjO0YRaXFiaRPDV3QdK6A6lfrm+1f9
 Y5LwKGn54xfT5P+CG++ap/XiCN3xPpHTO265me+M9ZrsStKmN4kHfDfalI9VB3WUiYc3
 fc7w==
X-Gm-Message-State: AOJu0YxnwrFBgQB9T+KdY1KKLbIxPzbJeLRURbfCjw5QvRLG7f2lWEeZ
 MRPjVzQperY6E2Ga5WeRlPVSE6mGOYhbT6o12fpZm3OzM6hCVQH1DaLULw==
X-Gm-Gg: ASbGnctkC40dWeZnfhDRGO/PYe3NGw4CLRUR9I7dM/WWbXbZpTvmL+zDzs02RHTyser
 0PlaVJtq8lmMi6RqPn5C7VicOCpfP13ku4tbqV/qtkaB3gi3E1LE+9v67B7GlqUYu3tsF6xP9sx
 9rdSh/jsrO9mevrvH29uCJkxZoGRmxDNHjm1HyYtHj301zmTO4UBHeWXt2KZntLrE0tKqu4XInL
 gIaHbYXPjNHYFurbtb82BwtgZFp1jUnOj2zrcpKhm02m9b4vC+qnoEW0Pr+x5HivHoy06XZqKST
 bYvB4qPkyurq7QuQFgw1XZlPuG1iJ/E/qiYtJal9Yb4iUsiV+/w=
X-Google-Smtp-Source: AGHT+IE49iisT9E+Y5WW80k4hPyKtLxEkAvvbA0qKFxO5d344akiPMUFnCS3ZS0618fFlmoJ2luXIw==
X-Received: by 2002:a5d:588f:0:b0:391:12a5:3c95 with SMTP id
 ffacd0b85a97d-39d8f469982mr66981f8f.22.1744229036885; 
 Wed, 09 Apr 2025 13:03:56 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:56 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:42 +0200
Message-ID: <4bd661190adafb817504a3cdc8e416aaa5dd9505.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229037; x=1744833837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJq8nSNZCOYAl/JCVjJ8i/nXpSpRjds9OJk8asvQjK0=;
 b=XcDfZQzucnsxgHhKt7UE6ayTG8xNytnoXAE/gnh6C7/co0ZvfkXi1b1dRxoelTwYNN
 AwJkspeNcW++/f52qGSyQP919DrNUKzQvWDG8BRi5v3HwUVIftPKuRcE2HRaG3C91id4
 1UFh7dvfCj9kpTBqnAsO3DZC2Qq15TOoE7DR5G12Fasfggu+ihF9rOqwqmPWfAHoZu5H
 xXxcuwJT55V40pm7H1PP8tYfr9Y20sqXoc14Gwvw9xpSpuspVpbg9Y46MgAVuhlS6lpE
 c7xwMiJQXNqE3hPwzncaFGNR+zuhVTykp+OE9NwUJpGX9PVXloBJ1Ei4NDHf4xbtNNiy
 H5EA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XcDfZQzu
Subject: [Buildroot] [PATCH 27/29 v2] package/sdcc: add option for the
 device lib
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This enables the "stdlib"-like set of libraries for the enabled ports
and for the various memory models supported by each port.

For some ports, there are non-fee libraries (and includes) available.
However, their licensing terms are dubious, and they are only available
for the PIC ports which we currently do not enable in Buildroot. So we
do not enable those non-free stuff.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdcc/Config.in.host |  5 +++++
 package/sdcc/sdcc.mk        | 21 +++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/sdcc/Config.in.host b/package/sdcc/Config.in.host
index 711da37444..56ac8c7ed1 100644
--- a/package/sdcc/Config.in.host
+++ b/package/sdcc/Config.in.host
@@ -36,4 +36,9 @@ config BR2_PACKAGE_HOST_SDCC_Z80
 	  mode, SM83, Rabbit 2000/3000, Rabbit 3000A , Toshiba TLCS-90,
 	  Zilog eZ80 in Z80 mode, ASCII R800),
 
+comment "libraries"
+
+config BR2_PACKAGE_HOST_SDCC_DEV_LIB
+	bool "device-lib"
+
 endif
diff --git a/package/sdcc/sdcc.mk b/package/sdcc/sdcc.mk
index 8e5032427f..0e2de37748 100644
--- a/package/sdcc/sdcc.mk
+++ b/package/sdcc/sdcc.mk
@@ -32,8 +32,6 @@ HOST_SDCC_DEPENDENCIES = \
 HOST_SDCC_CONF_OPTS = \
 	--without-ccache \
 	--disable-doc \
-	--disable-device-lib \
-	--disable-non-free \
 	--disable-libgc
 
 # Keep utilities separate, and alphabeticaly ordered.
@@ -72,4 +70,23 @@ HOST_SDCC_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-z80-port \
 	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-z80n-port
 
+ifeq ($(BR2_PACKAGE_HOST_SDCC_DEV_LIB),y)
+SDCC_LICENSE += \
+	, GPL-2.0-only with Library Exception (device libraries)
+
+HOST_SDCC_CONF_OPTS += \
+	--enable-device-lib \
+	--disable-non-free
+define HOST_SDCC_DEV_LIB_CLEAN
+	rm -rf $(HOST_DIR)/share/sdcc/lib/src
+	find $(HOST_DIR)/share/sdcc/include $(HOST_DIR)/share/sdcc/lib \
+		-depth -type d -empty -delete
+endef
+HOST_SDCC_POST_INSTALL_HOOKS += HOST_SDCC_DEV_LIB_CLEAN
+else
+HOST_SDCC_CONF_OPTS += \
+	--disable-device-lib \
+	--disable-non-free
+endif
+
 $(eval $(host-autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
