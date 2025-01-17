Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7A1C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DECCD6FBC0;
	Fri, 17 Jan 2025 10:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkH3rAA4QRhN; Fri, 17 Jan 2025 10:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DEE6FBBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83DEE6FBBF;
	Fri, 17 Jan 2025 10:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B29B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D886FBA6
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zz82nHhI0jt for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3B906FB9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B906FB9E
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3B906FB9E
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso2125344e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111284; x=1737716084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erlSuc9P8b5HD6eEktWJBNadHfVeiBInamfovMJ+M4Q=;
 b=pxgqu+ybKTSugkWHN67E7htc3l3449qTxi2qG9TGydKJkW4KazpyJXjf38swRBWfut
 7G6S2G9WYz0NbnjP5HrAno+NyLp59QPDjrySfxrFq8SWdAUc4f5W9fGh+hqXcP15OzRe
 RRmLNzPUMsPSfOkIs6mt+MAI4bC+kXbJ8d4tjmygGJ22FL6HPahqQ9/kTPbD1q+iRq21
 yJJi/ojPqztgX5EfAw/0um20uCGm7TPssWGmQJbLKKEpir97jEtOTAdnYA+TOpSrAtOc
 N7nS8rLu4ylIW9HYPhk5dqO+QDK8WrRVRqwg0n15Pv37Ty1eAdDeOJ3WfT0r0nxtUwlX
 Dd5g==
X-Gm-Message-State: AOJu0YxMkRG59N7DYgV7MLJ1ocLJ4p7ZbCMg4Mv9E1DB3W+q3ayI1gW1
 wlXRYAuG7qA3X7akA1k33t6n/oGnjo2vYy/Hwf22H94QZhHKL86aHbR69Q==
X-Gm-Gg: ASbGncvkhghIZ59r5+rt9MYkCJj38fdJVMP0LrplpRsd18McRkzhfoMNwlEOBAnYHQ/
 huyDkYnAn8OHxoObwAdsC5R8vUZ9iUKMl87UADSyGyu6H5C/jVkjn6ZtjV61Zku5v104VrkYJdI
 eNvx0V4CQjnnVMRhgfRl8GtmcJWIkn8vo9QqRLHBFk6SeCu0CXX75RmMDtXtZjp11VzCn7Pa9ht
 0MskIqZXIb0AE/22a26Q1a8QR9KmqrICZKRLe9xKHZpa6PgNWfB9PMBK5vbdok8G0kCFeLqjLql
 3sYjvMccrZQ=
X-Google-Smtp-Source: AGHT+IG3LWGDbsYmMnudGGfJTPOGgj9BVd9FvfeWdw3gxA0jc3hKmrxxVr5iVu3eFkj9bQbLx9C0eg==
X-Received: by 2002:ac2:41d7:0:b0:542:2a8b:d56f with SMTP id
 2adb3069b0e04-5439c22ca36mr516017e87.4.1737111283537; 
 Fri, 17 Jan 2025 02:54:43 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:43 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:39 +0100
Message-ID: <20250117105354.618220-16-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111284; x=1737716084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erlSuc9P8b5HD6eEktWJBNadHfVeiBInamfovMJ+M4Q=;
 b=bIltb01iRXHH9aoak5GerS4wn/LNXSmKSRvozVYAYv4BU0tK4oZSf4ZiNzXGFNwpfq
 PcleZC6gl1eRPmalN34HKQ9skrjmc7kcU4AJOYKMHtrSIG/qtWbklG8B0yga9O9ZpHL3
 w2R3q8fsiseRhyMQ3C+k6oq3nhyOoBYMHUlj5pT3CZroI4PiD8GezZO7N3TMqQ3s+3Ei
 4EkO/Lu2SmhezVNTMbS1K+ZXMM4w0RthDmBj9ui8HiHC8jQ+TYP6ho1TShi5jONxga9I
 t7KOvHuRwoRTVY3yR7gosgAdCiDILFAnZrucJ/3nAj7hkAHezNYGw5WwcR+2qNiq16wS
 zb/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bIltb01i
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
