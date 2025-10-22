Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A4ACCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1920C60B54;
	Wed, 22 Oct 2025 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F---mdrKSpyA; Wed, 22 Oct 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5696F60B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5696F60B91;
	Wed, 22 Oct 2025 16:35:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24B2843F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1695460B91
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bf4NzTYNNwr for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E43360A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E43360A58
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E43360A58
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:35:04 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so1369803166b.3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150902; x=1761755702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIvmfEV5dg7zkzlhfBSogVnIO9lKvjPbV1XUnLHsZ6w=;
 b=Zb/ibebz4wNki9PdM2EP6phA4wEtfD1gjWbV81Um+RzMwQrMPcgUCOlMDAYd+xJxW4
 DVqDFlWyIRWITOjUnDay3cOgngHHPXETxdCPi57gci8vYr/FsL1hN+h94Y4R/Ihn119P
 XAk6EfWEdM79MvDgLAtTYSz4TznTQF6gjVSdbkSAjtaIeDz6bud5Os5M+HJgfKQInLzF
 F4QgDLDicxJje0L3NQk3QeA9/ipnolDkyJSuQDZDH51t8fY4lDBDDRJqFlu8vfl4v1wU
 pf2ImpE2hq5XqcmRg219oQkm8jKrAZbqCSwnOBfv6kAJ1yMLYdoDg9Q7gZ3MQokYFUkY
 SCjQ==
X-Gm-Message-State: AOJu0YwBsEE53AgKGpj7/UUoLyf0ex27MxMnbTb7eDcfMgjuDuNe/dbV
 815+WCmyvWX3FrGIF2dlvTkVLoU78wQDD6PUII9Gkc9fXkTockWCiJIbbc5bQBCDu/C0GklbiYJ
 xqHQz
X-Gm-Gg: ASbGncvYdpTUot6O8IQVCJcQAcNd7d+qOEul+b5gAFvfaU2EwPJ0p/y2Ojf5ElRq8z1
 tQONqE5sgyHTAQCZ1CO+kBcRNIQgVCIylinq8/nxCAgW6Az9lSsh54OSjrvDEWjMYuSSh46Caja
 MJhNgBiCUDDhtewDUC7YmPiRDQM0l7gGCE/M981DyYytY5mD/xcdTkVexwqk3lkDrZqtSJ9yffK
 0A2SPRu4glyPVI8dUbQEHUg5pjH3uBcDFYVIGEJiM6XyUsIrzKwWYBk0RRkgS+HTKjudYIrbzSg
 IwMy85HD02rEtiT7k0q91/j12Q4D+n7PnVdEhYXzNlh3wi88i0mT545ueIZSVuAoFVjxZwao5xh
 Po4JKXKjrRjnWwShA+NjAyM7NX2ybGiJmIRXvPQtCwoIsc1vt26f78TtaZgF4gwB5fy7bQTAn6R
 a01S/9NSoMjZG3d0W6bODCD9Y9LiIR4VUu/79clQ==
X-Google-Smtp-Source: AGHT+IHdSvE1idqtxCrXdzQK1Wngmpxh/Zys/hu7FFht31i7g6kLCCB8bRfXX15RpAHE1r6HD0cz3Q==
X-Received: by 2002:a17:906:c14b:b0:b3b:ff00:5d4 with SMTP id
 a640c23a62f3a-b647403a5bfmr2312149766b.5.1761150901834; 
 Wed, 22 Oct 2025 09:35:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3501ed5esm190988166b.70.2025.10.22.09.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:35:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:34:57 +0200
Message-ID: <20251022163457.19215-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022163457.19215-1-dario.binacchi@amarulasolutions.com>
References: <20251022163457.19215-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150902; x=1761755702;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIvmfEV5dg7zkzlhfBSogVnIO9lKvjPbV1XUnLHsZ6w=;
 b=ZJa+EyoU9DmajMt72k2HkJgVc+AcFOC6Q02hz/ByJw5ae5ilq+daA4L51Ioq15ZD2c
 h9ZCqVlwFgibpqIp4BCxWLXg1To3DmmGvi2bdFf8kPDRieTUfhE5BL4Vs1TLv6gEx8in
 2SM9jPVEZusLPB28SEphHTPlArGokvQqq/VsI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZJa+EyoU
Subject: [Buildroot] [PATCH 2/2] package/libglib2: bump to version 2.86.1
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

Release notes:
https://gitlab.gnome.org/GNOME/glib/-/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 129849b21b9f..e4b9a7c5ae5b 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.84/glib-2.84.4.sha256sum
-sha256  8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90  glib-2.84.4.tar.xz
+# https://download.gnome.org/sources/glib/2.86/glib-2.86.1.sha256sum
+sha256  119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57  glib-2.86.1.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 3382790bb330..0957d946bc0f 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.84
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.86
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
