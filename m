Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECF2C02188
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D371370484;
	Fri, 17 Jan 2025 10:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGRmhIfwi5iA; Fri, 17 Jan 2025 10:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D410F6FBCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D410F6FBCA;
	Fri, 17 Jan 2025 10:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6581B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 946CF6FBB4
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2OEQTgEtVaZ for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF64E6FBB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF64E6FBB2
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF64E6FBB2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso2785702e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111289; x=1737716089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDoVMCEK3zONo0cQ/Znc8t7lbKJGj5ItpLa29Chvy0I=;
 b=eoo4bTXpjyezitPGbm/t+oBw+b0069Cy8DJxLZncnfYyPYdy9frEvAerIWp6x+IHHE
 tw5RaQsoP9w5VY620jbXDE4PmIff3kuWz8ejloI4LQbo6MS+BMywzSNk+ui+j2+e3C02
 dFonUOyDMg2AazWh8x1r0OUL8JizOFmRkogNfK7EiphElgNZxXCjHNC4YVlqQG+mQ1WL
 kmdvuGP6FEmrr+unKWToJEGC4oMm8oZIZHDz1P9wcro4x4jK4gODU0vQV+s1+FcmzIZX
 xXQ9Xu59qM9laLw76ryvQdkbnCEH/7ufxhqb4xsIg36nPT5xgUsWe7etvM1IscJshu1c
 AJhQ==
X-Gm-Message-State: AOJu0YzLpeOJMH0YT314oRk0l0lxzGO+6rt3MqrJKlBWpIh/eJnvnBDB
 DrclKLYmniLOJQrl3DM5r3/tU+AKgP+grhy1A0kVLFl8LFI/z7AYgKeiPA==
X-Gm-Gg: ASbGncsJeX4N/8TyJ3Xn7jdWPbyeWo6H7RsM80X7FKCYmQGH17bvM6Fa1+auGjrWGXu
 ewfR2iQZjNaRaZu0vLOqzLM2F3AlUE0B5D2m65DokT0puK86rAL8eWzgJvEepnz4gm4BSi+xXTP
 DtLBuDLXp8c9fgUeNk5n5ZRxVmnQJTLy3IDydxUsrJAkCCT6UnwT7GfBnq/9YOC2vdr3f4kqTLl
 fhj2IEjohBud3DsDObNd2rM+rJxQjDVmwzdzM0FX11VSJtakH1vbB0eLJ2MXx6l/K2euy95ZIGn
 kxeqmGF0Gf0=
X-Google-Smtp-Source: AGHT+IH9KZqpPPZ+yTV8YJsBRPh/QfNvnxyV6BBR9szfbCaFLqVQtjragaPBFHZF6r/hdeJ+UpzPCw==
X-Received: by 2002:ac2:5e82:0:b0:542:8cf1:1a46 with SMTP id
 2adb3069b0e04-5439bf7a8eamr534959e87.9.1737111289394; 
 Fri, 17 Jan 2025 02:54:49 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:48 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:41 +0100
Message-ID: <20250117105354.618220-18-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111289; x=1737716089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDoVMCEK3zONo0cQ/Znc8t7lbKJGj5ItpLa29Chvy0I=;
 b=HVHtEWDUn5wnjRAuemr3LE45/McuboPGO0/RcAnTf6Oe//vW2JYlw1eg8D/gJokANU
 XxRxK55SrYpjM+Et2ez/a9ecmFdKDt5SCeVla7J9BtS0AmWVXlMEQJ6tysvAA3CQjpNx
 cp9zh2R6xcu0/+PzWt/ZmCpeUlAf/A8uVFyPBbJNPmyG5nMpydmh6ZHRw6ReCNl4szJK
 QN2jiBHClIy+yfhsqKATg9H+tKq1f/qohIeNNXkPR7Pnk4S75OEHyGmDZiylvNMgj0YT
 /PnQh02hJEYmyT0MxGP9Nk8/TUmLvDILhFfMGgbFyEF3priY9nxio+QP6pcB0+9PgOH8
 HxMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HVHtEWDU
Subject: [Buildroot] [PATCH 18/19] package/qt6/qt6multimedia: remove the
 explicit v4l option
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

I think this option is implemented incorrectly and with no good reason,
so postpone adding it.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in        | 5 -----
 package/qt6/qt6multimedia/qt6multimedia.mk | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index e3a25c31b0..70acbca8e6 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -97,11 +97,6 @@ config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
 	help
 	  This option enables the linux dma buffer support.
 
-config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
-	bool "v4l support"
-	help
-	  This option enables the video for linux support.
-
 config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	bool "pulseaudio support"
 	select BR2_PACKAGE_PULSEAUDIO
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index d4a1b8ec50..efc6436e9b 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -101,13 +101,6 @@ else
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)
-QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=ON
-QT6MULTIMEDIA_DEPENDENCIES += linux
-else
-QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=ON
 QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
