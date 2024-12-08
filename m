Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2964E7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 21:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F43080DB5;
	Sun,  8 Dec 2024 21:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAIQWw4egcvo; Sun,  8 Dec 2024 21:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8660E80DB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8660E80DB2;
	Sun,  8 Dec 2024 21:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D674ED2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AFE40111
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vychx6hz2D_T for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 21:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E5DC400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E5DC400E5
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E5DC400E5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:11 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e21990bcbso3786132e87.0
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 13:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733694488; x=1734299288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yf2GOt8tVWW7mMh7e0d7NYgEu5lHvFPr2tlsgYbTTg=;
 b=lsLUoNCyDkf+9fn87clxD0yBDqQjPZvEMJnJ1ozoZujmUACDwbYyZpdDvhMPSVLFMt
 FD0bXRRH9dmArKppzwWWmuUUDycun7EFBCVajSWR5aPlobytvfemtELTlXJFLCK7Eh4a
 Md5riobuJnt2weu6PRnFY23gygaiVzNsEj1ctg+bO+SegOoRc1/uqY2yFMBy9VGYBlbD
 tJXr2iUqsj7bSAAmJbEBnWHgUL83pt8m5y65wuka7dOvJ132tDcwqgPqY02fBDt6T8CB
 796jRqd+5uZGn8L8P5iQY0KgSrqGXahnxGa8bn1LHSgLg0OI+63dhFH/gHuuxJeJ7HhI
 hghQ==
X-Gm-Message-State: AOJu0Yw0SYT6VmpezUbr5zY7hUV5X9hOft/u6XtUodIboyMIKtC0cYSl
 2PfbZS17QgLVz4aNoYNWYiRZMuF0Zr9kvZMetKHPJZr//7TBgCMYXcbBHQ==
X-Gm-Gg: ASbGncu1kJnjYslx7L3P28hRTh++2UNPjz2X1VjbpcpM6SHf+ukuheF1FMkzCzFE5+k
 amdIMrJx+xvWVaxfUHPkwS0om0l7YqO6TC+WxXaqzTlKAtavUSpddgvT4HVqE6FKv2tGl9XYinv
 3tN1wHLSE9NvMZiRLpTVMntUSGGRh7eqsQyOLxsTn0Pk0qt8QUO78xNS+pVgXHt28I/8io7Najv
 zStDFSVVWR9gEkHYRQlTteV4RksXhLMykP/0U/G1s1Hf/6hB5KD/UZsabK9
X-Google-Smtp-Source: AGHT+IFU9dLsyFMDBY5xSx6WETo70zSyeZBMTgSfMljUjxeC/1UmwEJTfEAEHFEAau9ibVU6n+OCMw==
X-Received: by 2002:a05:6512:31d3:b0:540:1d58:da70 with SMTP id
 2adb3069b0e04-5401d58db92mr885212e87.4.1733694488319; 
 Sun, 08 Dec 2024 13:48:08 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54020798a43sm49328e87.12.2024.12.08.13.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 13:48:06 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  9 Dec 2024 00:46:18 +0300
Message-ID: <20241208214748.524923-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241208214748.524923-1-geomatsi@gmail.com>
References: <20241208214748.524923-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733694488; x=1734299288; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yf2GOt8tVWW7mMh7e0d7NYgEu5lHvFPr2tlsgYbTTg=;
 b=CtWeCGAsd3fy9KEe6e5oyeX97eXx9+W9eAuBEsGZ6UngzxWcATYhld92nL7sP3rURe
 5NcHLHTFgXoMHBi0CA5iLBM8e+xUzyvZXnBPAtqHJRR0GJ1bp0uW20AXEeylFwZDz+RD
 LVaaSBFe2/BhkD1kbIpy1ddf4P6k/i76/s3e9+3PHy8ym0lmfZ/8WR0/bXPSwG+aqmlp
 rRQzI9BoCsauXpRmrVfo8DY97qeiPxWB8mJpxnJiIQWZSy4zUg/Eh5ZrKyDSDw+a8OO/
 1mAhdJH+ZQsYQwDhzGYW4kHLBg7hB0hxhRzPhX/u6XkVJdlquzt+0vn5WzbmbdKb41eh
 mFuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CtWeCGAs
Subject: [Buildroot] [PATCH 2/3] linux: bump latest version to 6.12
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

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 63078d686e..f537dd7adf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.11)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.12)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
