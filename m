Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E3BC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D176FAD1;
	Fri, 17 Jan 2025 10:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZBpRemoRjSs; Fri, 17 Jan 2025 10:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C7D6FB38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C7D6FB38;
	Fri, 17 Jan 2025 10:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA78B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6CDC837B6
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYxjwcQrDDm4 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E60EC837A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E60EC837A1
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E60EC837A1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:25 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso1919495e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111263; x=1737716063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yZFYBzLkh8qcfpvT5BIuhjQUp1/hRK9N7gVAuLmFiQ=;
 b=ZeQLn1ltyCQZRPTqYMaR6c2ExLq8FPRfcrygvbS5IFivTMgDdVPuNtLOazm0rZy11R
 Zp/iqC2HdJXElwwWQvb0KBSWiOb+w4yWRvGfJGfS//Rn/nGvHvPYWjmacSYT1FiMrAfO
 3ClrPZ0QBWf8AhFAJ8uf0Xg/wKsQxgA8oBMY8gzw+FzdyzZPKpEpSppAtcDTYnfj9Bon
 prYMYpLfogf55yry0oxh8gvnHg/x5vDbNlXwrOUQebhd33jwkFdoEe2hEWMg4SPvoZRD
 yR9mSEcbt5/JBRe61fno3gPAtxoty3QLqpVSadAan95AOhyQ5cGS1Xs2ILJllAyNALNI
 UUKg==
X-Gm-Message-State: AOJu0YzHL06fwSorTYfgR8dGGDr7X9hvgVyqI0Dzy2w9HTAzq3KesFkG
 HCBqedZ3gHLiO4IVkeAWbNLVv+HN4u1XIMqXfTifiDlzjdg65L5DcxE0Lg==
X-Gm-Gg: ASbGncvFxATlaY60GYFcTtpl4RWhJ6VSsafCFN1Z+o2nLcqJg+0Fl2f7Xl+is67CmyO
 WhTGiO7z0Po22EoMIWqlSi2BWtSNgXQVWX3ORVJWbJnG4UD8PyXf/RtYIzDuKZ/xPSylXrECJeh
 soB+NBexYidtw5JFIRKdOOQGwbqpRBXzr+YYZbc7dM2YYB5bAKQ0UE2abHgmwN1DyLtt5SRieGO
 jtQcv7ahcsVh0MUTSfYz5gdTJejyWasP7/HbfgRmKJ9dLx9OmXe+5fOxKdZNH9IeYJ7e0AV9o41
 zqWCmIiJ7bI=
X-Google-Smtp-Source: AGHT+IFMMYDylbTKzKZHYd2bnisVZXBXyL9d6jExCbm7gE+oPNhvlN6dctJPS6COilNd6Vg2m99+UQ==
X-Received: by 2002:ac2:44cc:0:b0:540:1a40:ab19 with SMTP id
 2adb3069b0e04-5439c249f5fmr557854e87.27.1737111263314; 
 Fri, 17 Jan 2025 02:54:23 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:21 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:32 +0100
Message-ID: <20250117105354.618220-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111263; x=1737716063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yZFYBzLkh8qcfpvT5BIuhjQUp1/hRK9N7gVAuLmFiQ=;
 b=JK0x+kz8+N7Q/vg+VR+RxqMJ7SH9tyOPUtnAYRCFXpXnxpbnGd8ICpdXtK5DjkA/a5
 KuXwC5Cvl6a+k8Os7j4BKKDFuneYvIvKR4wnmNCneOU7Aj/omLus7Dc4N8LdxDVoq+3W
 Cv3cE+pCkidFL2Xd3Fo6MgbtW/5IJto9b/nbtiF6kXoYHT0hNgVjykszdnYD7yFg4PLT
 eBcAQkmxpHRugETd9vCbBGN2/vg8hrs3AeFdttk31L7GzDNIPj5SGsoQvbAb4A23kgSJ
 DAF0MGn+xOtxm/s9uP7vGNsyj5KL+wI2pPt9pJS32kSX3KoPh7WuXagTNP50TwpNizlv
 /Acw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JK0x+kz8
Subject: [Buildroot] [PATCH 09/19] package/qt6/qt6multimedia: set
 BUILD_WITH_PCH=OFF
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

To follow the same pattern as in the other Qt6 packages.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 919b6990cb..60eac8c785 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -35,6 +35,7 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	src/3rdparty/pffft/LICENSE
 
 QT6MULTIMEDIA_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF \
 	-DQT_HOST_PATH=$(HOST_DIR) \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
