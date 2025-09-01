Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0DBCA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE43383EB9;
	Mon,  1 Sep 2025 20:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AA-Qd5MLfq6c; Mon,  1 Sep 2025 20:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5B0783F6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B0783F6D;
	Mon,  1 Sep 2025 20:33:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22B5CD2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1365161240
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp0B82EwOmpN for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:32:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88CD661205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88CD661205
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88CD661205
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:53 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b040df389easo358634766b.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 13:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756758771; x=1757363571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jo6XNWQjvvZivIg+e9Jllj7wGYs4TiNC3o3+uYMg5Is=;
 b=tJynQMPBHdk+hM9KqZsPVZEn8NcYJsFodMAMfMeYmXh0AtpUfZYDZfIfUiwxrphQWF
 Q7JJqG873Gmxf/rp+9h5/oXOYCVQF8ZI0owEJ80DK9f7H9iX2mRnb6wQlBB1lpHXeQGJ
 opiRIIjIvyl5n27EKiL/xo0/nYsXuWtwzMglwcqun7YMIyVB8YsvrtJCydGnFhcn/BBf
 iGaEAiZHE/SfzPKZbu41eN+31lKhrr0S7QoHr0VcW7CYgajuN8YuiNNtNuwusL1fD7ia
 FKC+gyoTqaVa/QWgrmrU5YG4mF5Lcc+htIJrbgT8+vM9KscBtcl3PuwMGhXxcR0/ZbDg
 32ow==
X-Gm-Message-State: AOJu0YxLyMtahjy+U34ER0j+Xo6+rMzOOlwTPFXAu4vgpp8xMrZKZqeL
 E2AY2hZ9d6jHRMKUWElMoZ8JSMo9Btgyd9V+6L8uiJF3w/+QJ2V8u7jle1ItkHOW6NblvbKbcx5
 6/49p
X-Gm-Gg: ASbGncsegC4rvC94Uy/9U7gtvb3LgPai2bduTPJsIgC/pyQo+fshOPZiVgs2UR0Hmou
 o5nTIamAhXxsEZMzsg5f4gy0XoK/vRLOoDpiZoZ6fNj3XK+ga6VnicYtvOJyIKluk+ELdeV1EGT
 sDjRLDYpG0mInQVnpGQQgG9Id/HF52qPXTAzZyXeA7J1+zef2UzvKlt2psKjeOMqa4AImoFC+jT
 mhNhaQh2ss4bgxlb/BOHCjwO2F4hzYOBkAXcfUNOnJvPeNHzsRpH2dMtQ4v5/FrymbulsmbFUJm
 2CjczgmzixFKkJL1ogrufmSV/5J0GC/uRRDkEdrwBHBBEBrk8dmd5fhLiuts9m2XFnmrnaEtw3O
 nzHmSY1oS2LTnIOwkTxndUkZcnZpjCvQ1//L52lcD6g09efmnWFfcHP4n88YjOS01g3AaLciktv
 qhLNcNRL16rXQ=
X-Google-Smtp-Source: AGHT+IHAAQhgRjGjkreX4k+3PV5+3Dt3Y+67nlRJpoaFZOy2fKoJ7EDjd4l178uvwgE911913DHlfA==
X-Received: by 2002:a17:907:6ea5:b0:b04:3d7b:ad43 with SMTP id
 a640c23a62f3a-b043d7bb618mr314143566b.40.1756758771342; 
 Mon, 01 Sep 2025 13:32:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0411bf1b09sm553530166b.79.2025.09.01.13.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 13:32:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 22:32:10 +0200
Message-ID: <20250901203210.804061-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
References: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756758771; x=1757363571;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jo6XNWQjvvZivIg+e9Jllj7wGYs4TiNC3o3+uYMg5Is=;
 b=lIxrJsO+d9eh40/zbTOkn4Afu4BTVNlKO/2Bsw9HjaATdqrtFVP4iBDfj1pJsY5G4Z
 mKRfgqQx1ehmlwhvwATQ4ol5+rwCmHZzcOqsbS0zb2wAyovn2mrblDYr6XZz9mM0rD9j
 EFgOfuEYK1S2oQD4jp+Ktnp3lN8LRiNX07aVo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lIxrJsO+
Subject: [Buildroot] [RFC v4 5/5] package/cutekeyboard: enable build with Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard Genoud <richard.genoud@bootlin.com>,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable building of cutekeyboard with Qt6. With the merge of
QuickControls2 into qtdeclarative, the corresponding Kconfig option has
also disappeared in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Added in v2

 package/cutekeyboard/Config.in       | 13 ++++++++-----
 package/cutekeyboard/cutekeyboard.mk |  6 +++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
index bd661b0cd42e..4f83316644a2 100644
--- a/package/cutekeyboard/Config.in
+++ b/package/cutekeyboard/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_CUTEKEYBOARD
 	bool "cutekeyboard"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
 	help
 	  CuteKeyboard is a Qt virtual keyboard plugin for
 	  embedded applications.
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 775bed0fe995..8181950aac50 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -6,7 +6,11 @@
 
 CUTEKEYBOARD_VERSION = v1.3.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
-CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+ifeq ($(BR2_PACKAGE_QT5),y)
+CUTEKEYBOARD_DEPENDENCIES += qt5declarative qt5quickcontrols2
+else
+CUTEKEYBOARD_DEPENDENCIES += qt6declarative
+endif
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
 CUTEKEYBOARD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
