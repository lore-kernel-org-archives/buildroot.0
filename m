Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7EFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E87040B7C;
	Tue, 26 Apr 2022 17:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzvGdi8vjFjT; Tue, 26 Apr 2022 17:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E365840B80;
	Tue, 26 Apr 2022 17:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FBDA1BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C00E418C0
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlP1Lyd0yzV2 for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:32:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60426418BF
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:32:22 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id c23so30906923plo.0
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iBn7k58gCgZxZygH1aVWqlLksXIfZfn8+2vFb2GY1Fs=;
 b=RgSv4ZVz1mmSvczbFgVuXwxDme26LxxDHL1duQVTT8HSBjkYWyxhDmmPadENZj+RZa
 WfaHaVJDISGvoSQCp4G5yhVDqwj/eOne3NE5z7wdU8xwvqqTLbq7Nggg6Jmz/fbWUjeQ
 +rGkREn1HYCaWb14WNbgP3owwo7XAdL217p4mV6aT32KI2HRhzwhoJzYu0WjjWg/2nhn
 HNaU3M+erjMD4gnHz293orseeZtw6gvgxm8lyI6VK+Ax1Lm3+vRkzdtUbWF4yzhGFXUJ
 fnxNsaCJT3iXksJZ3ArQFC/YTsVimCvT6If37Zx/uvSHVimiyUIG9yWUBUGawOLRUFBq
 vUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBn7k58gCgZxZygH1aVWqlLksXIfZfn8+2vFb2GY1Fs=;
 b=GEwawVqytiPMXaO0f1bc2Twh5IMbV3M70oVUJYTQkofF/eEuRK7MtuzYkTq8E0S8tY
 Zbq4B+WTgym+ERU2P6Xog/y1n1TqS9NfaFQzNqz+lXOEe1VW5yEpwzriMJBnVBXJlyRv
 KPCUjJP7sjVhVzI8wEtCjnI9eg4bwjPSp4vFdrhviL4KUQUj7nuBe5sL/pIuBt5t6W1c
 hcVjIFz6Zed3aBvK05SK8T0DLQiFmA53WDih712w9Bi+08J/jSgi+KK2M9/hkhi3Gbr5
 uUIZgSxf/GGhByCK4CYUSib0uBa+0Kj+S4cvq175aAgtfgyQqYo8jDhhZzpfHrSLQVf/
 Kbxw==
X-Gm-Message-State: AOAM530/X9O5KdkcTk8imy4vmKNbzupU0ZH+aG+a4x1YTUoF1yNb+DzQ
 yuhaYWxFPKd1ImZ18oh+LcE62jx/Tyk=
X-Google-Smtp-Source: ABdhPJyY1O/YSNPcbQaigPa9lME96nFs1apDt3mSENLx/tB57zS2KU0/wMzfjtAi4jttlnMtQj6eiw==
X-Received: by 2002:a17:902:7c8c:b0:156:5651:1d51 with SMTP id
 y12-20020a1709027c8c00b0015656511d51mr24549883pll.107.1650994341553; 
 Tue, 26 Apr 2022 10:32:21 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 o64-20020a62cd43000000b0050d416200e6sm7204341pfg.5.2022.04.26.10.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:32:21 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 10:32:11 -0700
Message-Id: <20220426173211.64840-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426173211.64840-1-f.fainelli@gmail.com>
References: <20220426173211.64840-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 12 version
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
Cc: opendmb@gmail.com, mmayer@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch allows to use an external toolchain based on gcc 12.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9346fa3feb75..683204e56ebd 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_12
+	bool "12.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_11
 	bool "11.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
