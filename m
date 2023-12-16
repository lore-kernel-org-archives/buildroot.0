Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88834C46CCD
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E3B418FF;
	Sat, 16 Dec 2023 16:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E3B418FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJr8MMNxGjOK; Sat, 16 Dec 2023 16:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F422417B5;
	Sat, 16 Dec 2023 16:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F422417B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A83591BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D9B281F39
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D9B281F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbSIdOvOeoPe for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:06 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48F5781EAA
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48F5781EAA
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c60dfa5bfso20044275e9.0
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743004; x=1703347804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l+IV0MqTaqzzF/hAeo097AsEz8qkieC0XiQmkhYPtog=;
 b=pCG9qsU9ZNUjeosmxl5cjbxUTwwM4g2Bl/0J+x5SoxTAoVCHWCep69ZG8nDuo3Gp5W
 N9JZDM5Jd/1RYFZQahPrRQP8EAeZQk66JN2wEZ4frReWbljJ34N700ABNd+SUULq6+rQ
 xbEZuWFU1FTksFTUlxaGXXaVyqmWmGniT7dOvFFikrbNmygqwv49Km6w+0ykKb/sGaDB
 Uzn4b+tjQ4t5wMilIe4Mbw/HEMyDhCGXVbuTBmAspOXEU9cx/TAAO29KXdWEHCVxT+Iz
 /7FjzhG/FWQJWnFbJz3qoflF23MfjRZ4SiwKN0ODjH/I5iXqm5OdaDQqIB6/YrBzO2GQ
 6eXw==
X-Gm-Message-State: AOJu0YxKPaXjDtBnCdAovlK2IwiRg6MV+KtxepQ7jxl0+XxiWqVsV5mc
 bX8oJwkkBisHSSmyzEbW66a4AmFgaTQ=
X-Google-Smtp-Source: AGHT+IGnkgFWP4DE2a5kUg0kRKJKda2Mz1DKwSEtt24s2wIqeSeWKHxguP7zGhw3p6ddqtHuZNed9Q==
X-Received: by 2002:a05:600c:1c9d:b0:40c:30fb:1df6 with SMTP id
 k29-20020a05600c1c9d00b0040c30fb1df6mr6859972wms.128.1702743003766; 
 Sat, 16 Dec 2023 08:10:03 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:03 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:09:56 +0100
Message-ID: <7d386d68c77c941282943a8e4d0a57bd989fb73b.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743004; x=1703347804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+IV0MqTaqzzF/hAeo097AsEz8qkieC0XiQmkhYPtog=;
 b=Pd9t/jfdRbNnY34ezoCmKgBbsSszd69xRXO0EAw6KtnicYKNWOTGndHkGe3/SNuKjT
 rxAzcyBhXJkfU/1mp2fiNh9l2h9AxZ70WpTXCO1Pyn2xG1I8kID6elItwP6En7KKJib9
 BkNUhOOMd7FioorUOsCDkmLIHgyZDliBP7E+r7Ur8oKMvHUvFSeqncT1RHvM/NOrqznk
 PToYWNjCpZ9hS4eS7trKo9BnnuYlLHdoLxJLuOSDbeEdVH8e/0m9wXAb8ldNzvaolZ4g
 Kht/7ZqUZynnFPuxmxebIyuuiks9S7+z6mkn8D5SReaHo/so67f1w7spcdqF3LyswmVg
 1JFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pd9t/jfd
Subject: [Buildroot] [PATCH 3/9] support/docker: retry even more
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When downloading from and old Debian snapshot, connections can timeout
while their storage backend retrieves the requested file from cold (very
cold!) storage, and this can take quite some time if that file has not
been retrieved for a long time, so much so that retrying three times
might not be enough.

Increase the number of retries yet a little bit more to avoid the issue.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 8c6e2add60..dd9b9c0f93 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -20,8 +20,8 @@ COPY apt-sources.list /etc/apt/sources.list
 
 # The container has no package lists, so need to update first
 RUN dpkg --add-architecture i386 && \
-    apt-get -o APT::Retries=3 update -y
-RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
+    apt-get -o APT::Retries=5 update -y
+RUN apt-get -o APT::Retries=5 install -y --no-install-recommends \
         bc \
         build-essential \
         bzr \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
