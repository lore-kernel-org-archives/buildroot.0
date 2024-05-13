Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCFEC25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 08:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739D081F24;
	Mon, 13 May 2024 08:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMNwOEDYP_Pz; Mon, 13 May 2024 08:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561FF81EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 561FF81EC4;
	Mon, 13 May 2024 08:24:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 486FF1BF86C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 08:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35604606A9
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 08:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QF2MdW_ZCwul for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 08:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.43;
 helo=mail-lf1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CAFE6087C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CAFE6087C
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CAFE6087C
 for <buildroot@buildroot.org>; Mon, 13 May 2024 08:24:34 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so4298924e87.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 01:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715588672; x=1716193472;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F7DTAhCeJunM/P++sLxW4MclihpTWbj4wfX3hYoD3fo=;
 b=E9UbhU/seFgKe3KQptG4Ghhq8yXLJF4Hz6NotvpAqDNjbrQY332gaQzwkyyvcn+RKL
 lRcKJjpnaB/DhDDIcBdmrkAk1Wa7GfJb9pWZvNq2eLC5Y6gtce+6U+HRA897F8VywCwX
 +M0oeW7vgT7adHLYNohIWViHcvnO5ioZ34LKdAF2D23tfA/BNJhklYfMEPynS4noMyuS
 gARV1Wj4VzJUBdiuJDQNoVfjiS8FyC5bWLW5ebqFrgN0V1xyuwK+GN6aEtX83J49SIIu
 IlYTloyzWr50dQfWjHyxuG/Z+4pWc0dOrAgfoJoHv7N4d1y1A+5LbeMJazMkWd8ShpjU
 S3hA==
X-Gm-Message-State: AOJu0YxqveIz8boGevjUp+9Bc5PlXWApsjG22W1uyfk1VSXLz73gqRyD
 EjfvpOq2spJ+4i7Seezz3u+jFWQ8LDRd9IAq5lhgZOhm5jc5XI+t9XIkTw==
X-Google-Smtp-Source: AGHT+IEEtsa0txJFOeRk/VkQXCD31e5ZGOj9RLc2ZOLgnGg170oiEoNKmM4hGGvGMBu/CvWRzboEuw==
X-Received: by 2002:ac2:5e67:0:b0:51b:f78d:c189 with SMTP id
 2adb3069b0e04-5220fb69910mr5152739e87.14.1715588671421; 
 Mon, 13 May 2024 01:24:31 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8b5bsm1669997e87.214.2024.05.13.01.24.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 01:24:31 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51f2ebbd8a7so4333991e87.2
 for <buildroot@buildroot.org>; Mon, 13 May 2024 01:24:31 -0700 (PDT)
X-Received: by 2002:a05:6512:10c9:b0:516:582:2348 with SMTP id
 2adb3069b0e04-5220ff70bc7mr6705389e87.54.1715588670998; Mon, 13 May 2024
 01:24:30 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 13 May 2024 10:24:19 +0200
X-Gmail-Original-Message-ID: <CACXRmJi2z3zApRQ0vUupEQVjDE0C6chEBr1F_rZn16juJzXMCQ@mail.gmail.com>
Message-ID: <CACXRmJi2z3zApRQ0vUupEQVjDE0C6chEBr1F_rZn16juJzXMCQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.5.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News: https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.1.news.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 11e48b42aa..139771a11e 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.4.sha256sum
-sha256  291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa
 libsoup-3.4.4.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.1.sha256sum
+sha256  c1d7cfb89832d35c271f37d544f2cfe21fa60ae9faad4a7ac58996ae4031f7ba
 libsoup-3.5.1.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c
 COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 10caa5bea4..bc3ae4d0cb 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################

-LIBSOUP3_VERSION_MAJOR = 3.4
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).4
+LIBSOUP3_VERSION_MAJOR = 3.5
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE =
https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
-- 
2.43.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
