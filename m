Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7844CC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 429EC6FB9A;
	Fri, 17 Jan 2025 10:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p-7Snvr5vBF; Fri, 17 Jan 2025 10:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B20566FB8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B20566FB8C;
	Fri, 17 Jan 2025 10:50:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2AD94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBCEE8174A
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BUYIt5-4GFA for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22A818148A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A818148A
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22A818148A
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so2125355e87.3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111017; x=1737715817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erlSuc9P8b5HD6eEktWJBNadHfVeiBInamfovMJ+M4Q=;
 b=oKGOhD6t/JGt9jXBxrbpYK2MQcMwLsWIjy4hApPcrdatvSqidxbb0ncWKHfxZKltdJ
 hD7IvUZ/RX753mtnekkkA9ZB6ZCmDAq7FUVzNTjF/7fJbtB0agVBUAYOhtu/IQR5yAsX
 E/tuwTzdwLM1AKNKTdKIllPQKqRFyNhbI7m2saNHsV/gdnXSCo1DIhqn520RBX5r0mCf
 wxPnB/CMxypxmoqSo+CfQcLtbF3yIBhdUdiuanrxBb12Bp5G9bBsVCwEGfx6ddjbV5yu
 ph9O/B0Me/4fC6dMZOOb1JZUJOmS23Ws8orgdQ38tOZGHiqIc4hT3ztP87nN+Sm1/D/Y
 oYxg==
X-Gm-Message-State: AOJu0Yz8um1580Y2LPhSxB6ZBlcmr2ZUdUhAIfgF27ed2lsYKhFj2ABM
 G/5CyfAiJUizuWq7VBHUFFK0y59SpTemzqXShQ/R51eLtXlGCsF9qpj5qQ==
X-Gm-Gg: ASbGncvMGv1DFhrgscKCFXio94XcEEWTs3jVo6AA71TPaYEqdntBulHj4ENf8UEqvhb
 c5Hp2fwVcVOa+AyWueDiynVETATUvbONuwD4YT8jtG0OtEIRithRLJgrb1y4w3/YPcEZC5nWIid
 o6q45U/jSN0G40OF9wC+xcxXFpiM5BlNVMm/trzW889zT/OSjN2YmOzJn6M3xmtiyuNDeFYDNTZ
 7Uxp7qCWyt6OTmFqyMUjbmQQSZy3e5F57ZKKog+FbXgsA8lYgPqIcxaB1K/csxrG2lMFmssUKTU
 5hS0PlEYOwo=
X-Google-Smtp-Source: AGHT+IHJ07PCgOzYqBwFquzy9gvYHurKZJ/ZnIM9ZWT9HoevualQLr3fUjtinvwJwIO4EARnaFMuDw==
X-Received: by 2002:a05:6512:3c92:b0:540:1e17:10eb with SMTP id
 2adb3069b0e04-5439c27d31fmr719018e87.48.1737111016753; 
 Fri, 17 Jan 2025 02:50:16 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:16 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:56 +0100
Message-ID: <20250117104911.613221-16-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111017; x=1737715817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erlSuc9P8b5HD6eEktWJBNadHfVeiBInamfovMJ+M4Q=;
 b=J5tex/b/wY0yKAtIhNLkAKuRg5xkbcoercvxaCuH99Ce03BmsSpBct+FOQXbxZuu1n
 rYs1F7BjHQYHnufsYEHu/dQN9txu+K0DeDZBA211+rhdsqvVHhUlulLBWECaVWvqXl93
 Pc4dFRkhJoXeV5ipOGucMoL9TULWoIXuP9nVMzWjXfm0bzpHitVh6ZB9Bnl7uGb2mpzv
 5Pubtb4epwA+0r9SAD9XansnTK1d+9OOFhpxJIedTiahR9EDG3SJNHMutOSf/Uiw0C5d
 fXgCjfe3S/EXPM2vptf1OZwDEZPQI2bcpH5zY0N+V65D7jsVchjuojT+BB7FL7WrgPiM
 mYRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J5tex/b/
Subject: [Buildroot] [PATCH 16/19] package/qt6/qt6multimedia: fix 'selects'
 typo
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index 934fd061c1..bc57481b13 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
 	depends on !BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	select BR2_PACKAGE_ALSA_LIB
 	help
-	  This option select Alsa as audio backend.
+	  This option selects Alsa as audio backend.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES
 	bool "examples"
@@ -106,7 +106,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	bool "pulseaudio support"
 	select BR2_PACKAGE_PULSEAUDIO
 	help
-	  This option select PulseAudio as audio backend.
+	  This option selects PulseAudio as audio backend.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
 	bool "spatial audio module"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
