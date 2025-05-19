Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9E6C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F4480F2C;
	Mon, 19 May 2025 21:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GS8vXIVQnCfv; Mon, 19 May 2025 21:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD39C8104C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD39C8104C;
	Mon, 19 May 2025 21:06:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E96AED4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D93D8400EC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxE6kHKPlR6c for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D32114192E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D32114192E
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D32114192E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:25 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3105ef2a071so56034271fa.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688784; x=1748293584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+uBvZzHwNYTNGm5MmkNG2DaPFRVM4Pk5VeXlpwPksg=;
 b=vsqa+1/Woi0wcVpR6fABp0E24Pg5vf6iUggtDEl+haKgLlpUIqof3gBrHBK9sBfA4v
 3caNYfKU/RTSfIiKaA6DkplyHLEEDfOWJLMg+SZJHJghAEJhjI3FxPXil/oyAh402nij
 2toDNIl0Sgq7iBy9h6MYvNx6Uqf2iUM7xTWM+BMIZMLYxyyOkJN9PS5WZ5cjfX23O/HH
 5wLDUOLp2KPeUymVGTct/Jmu2AWgo1hbjtPit8+ZwRz0EiUW5zc5tA5kYMGnKbWSkCpZ
 OapVBZtDrFfU64o+0zY0Pt3ptMXVEpZHdokXHyJl36YqLkkN+Uk/VVia1zDXid4IJIPp
 X7LA==
X-Gm-Message-State: AOJu0Ywxk7ivsUV9QZ/HFd39GZQbVIGxRMSCE9FPybzzO2PNn6DVVQ5i
 T0e75jvscLKCvjEFkFFhA4bKC94cXZemavTKvNn/pmBNNuzXkhmSz1EeYQqXvA==
X-Gm-Gg: ASbGncv73hLAtIJrI61UmqGO0qYfx5j61C/qO/ELH/c5/rvZ4kF6JQ/9T9Ckbw2Xgqb
 I32YMSF3T1dTRklgH+O1bKmbp7ulorNdlD10yLeKaH+MUSRyDMUFvrL+9AkOr09w82HUJml1rde
 TfkyAWSatBtzIbrlUy3DEhar3KqhfSvEEPpAEjpSMgOPJizN8jtE8MmNmjDBNdLpz7Q3WxAqads
 ithmm2NX/sB2yJQJaPOlkSbDY8IWQbpXLnPWeK8fkPP/oIbrm1e8U4ahqdM9VY5+hdcVyE4290L
 I2w4rWgA9zAaKUeq4G4mGpToJIHB8GsJRyFfPiaNdH3yt5WbUtqoSWkfhQ9ZAfmXpuuNxfZ27wh
 fef2QvA==
X-Google-Smtp-Source: AGHT+IHGmhgcU2t5/1wcxkdlWfuXepvj03TYd/lRGyaOZFFdORzkcpn9XQzqse/deIZ32NoP2YZE1g==
X-Received: by 2002:a05:651c:246:b0:30b:b132:43e5 with SMTP id
 38308e7fff4ca-328096f6568mr49289751fa.19.1747688783531; 
 Mon, 19 May 2025 14:06:23 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:22 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:45 +0200
Message-ID: <20250519210553.265725-12-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688784; x=1748293584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+uBvZzHwNYTNGm5MmkNG2DaPFRVM4Pk5VeXlpwPksg=;
 b=SKr37AEkCwQ8sKMbfPaQt5ami27o8gwiKDg9oimYQ3/xGBNm0NjwrTylPCwvRbSGvx
 U4I9Q9AaAM4PcM6TOIf2LrLtExMdo0L4KvEsKk8lpuxRiiOBUUMHKTW+kYDu1rt3jqVw
 ZGBRZKvuSHnHbOAexTD2b3kFGKIK7Q0wQZUjdvw+m9h5OxY3l0Jnk0EJvyc8opl3BPUp
 ghLxfIfHgvcMRlsovFDxiY+vWmQkATUbKxj2OQObZ8RA6BuDK6+72jezHl0gOZ+qH7v4
 AiwIH/cYwFYxSPA371kjNIdZxkO6evLg7hvsk0riNw0xCDaFJ+hAZEXam26LdAx7K0yR
 UH4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SKr37AEk
Subject: [Buildroot] [PATCH v2 11/11] package/qt6/qt6tools: fix assistant
 build failure
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
<...>/output/build/qt6tools-6.9.0/src/assistant/help/qhelpenginecore.cpp:11:10:
fatal error: QtConcurrent/qtconcurrentrun.h: No such file or directory
   11 | #include <QtConcurrent/qtconcurrentrun.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

The above error can be triggered by the following defconfig:
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6TOOLS=y
BR2_PACKAGE_QT6TOOLS_ASSISTANT=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in      | 1 +
 package/qt6/qt6tools/Config.in.host | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index cc0c507b86..f03990d9f5 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_QT6TOOLS
 config BR2_PACKAGE_QT6TOOLS_ASSISTANT
 	bool "assistant"
 	select BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT # qhelpgenerator
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6BASE_GUI
 	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
 	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 6517d3f1ef..17afafc9a9 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -15,6 +15,7 @@ if BR2_PACKAGE_HOST_QT6TOOLS
 
 config BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT
 	bool "host assistant"
+	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_HOST_QT6BASE_GUI
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
 	select BR2_PACKAGE_HOST_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.9.0#n30
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
