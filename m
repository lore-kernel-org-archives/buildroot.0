Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F8ECD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 05:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC0CD40103;
	Tue,  2 Apr 2024 05:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiOZnJ2I7KRh; Tue,  2 Apr 2024 05:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B5A40184
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B5A40184;
	Tue,  2 Apr 2024 05:26:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6741A1BF362
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52999406C2
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNmBhJSKdg-m for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 05:26:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39E2E4068E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39E2E4068E
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39E2E4068E
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 05:26:23 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7cc77c19a19so222921339f.2
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 22:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712035582; x=1712640382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ne4qPAWa1Hwj0bqtR5H52EPxf+V4GM5CR3EfMYBxuys=;
 b=iaGXftGOHBjqfMblTuye+DiqyDDKA5sELiZaERjWBwyXMiTgYSZhlLjKvT99S4jKpf
 FEwuK+QkjXZWXm8wQUTc36SWO9QS6uhaOMCDkis/lEuXERp7fCXjK4ig/b0fPrt/b/VW
 Fvf8Gan/C0kn9eLn/FH8BW8eHtipPkroRF/xcOAhREDLT7lZIF3gzetSExI1Hp4xolSu
 g/BhjU//yrJPgvwERzAYSXrFLO64ahxYeBz85fP4zBHcEYfOCyhMjvA1VEz6ciMgP2NS
 p2xiaIZGTsn32ueU5qr9IlCgVfVVOL1p3htMvQG6wwvrh763MpP9Vz0vi2A38KpC7C35
 B+kw==
X-Gm-Message-State: AOJu0YzRhBQFyg3MlE3zWTk7pfJiMyv8/E5I6mSHXZRvZby+S/j1cYK5
 j/qt6BYUMrqinLzn1aqXcvr+sZcQyWdUudMfM1WxR9Ao6ipyOKjKOxDdsSAKSg30WQ==
X-Google-Smtp-Source: AGHT+IE21rdRSPVBzAV/TLu/NqG+qYyyIxiBNCvRGHz5mUb5xo04MZ98nlcWONCfsWXmP2RS2Pucaw==
X-Received: by 2002:a05:6e02:1386:b0:365:e274:5e55 with SMTP id
 d6-20020a056e02138600b00365e2745e55mr14726084ilo.7.1712035582130; 
 Mon, 01 Apr 2024 22:26:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 19-20020a0566380a5300b0047a3ac10c62sm3043041jap.25.2024.04.01.22.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 22:26:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 23:26:17 -0600
Message-Id: <20240402052617.153655-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712035582; x=1712640382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ne4qPAWa1Hwj0bqtR5H52EPxf+V4GM5CR3EfMYBxuys=;
 b=Bu0NGWCQPqKvJEssKo+dFMUELCmB9DKfHg+Fo6zH3uN3iQteu7z6JARh8/0w3kCSYO
 ZBg6g0PEFzWTWmBKVA3zgiViDgZ6DnxP5Pl1tXidSokCVrh4Nhw4zVukBQohjL6+EKfh
 S6zxUoiOQko+sek3cfL+jFtsqaUeLPZMhYiMwsx2Oe8ADk4f2aSlMuK25aGphbTwL4i+
 cmx0Pxk1QdUokdpNmOrPsZrL5VM/B2umJ3br/56oI9slypxBipPVttYw2TjZGXQKgoUB
 ojoBg5pFEyPF6MyZ8sxSxoQXE4ZUd604vCLLM3KB452HDJpioK2AXjwFxAuBswpFYzqP
 cavQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bu0NGWCQ
Subject: [Buildroot] [PATCH 1/1] package/screen: fix build with glibc 2.39
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing screen's libcrypt dependency this
broke any screen build using glibc version 2.39.

To fix this select the libxcrypt dependency for screen when using a
glibc toolchain and add the dependency if selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/screen/Config.in | 1 +
 package/screen/screen.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/screen/Config.in b/package/screen/Config.in
index ee4c04ca9e..40cda77b50 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SCREEN
 	bool "screen"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NCURSES
 	help
 	  Screen is a full-screen window manager that multiplexes a
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index d4052b1191..55fecb89bc 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -16,6 +16,10 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
 SCREEN_CONF_OPTS = --enable-colors256
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SCREEN_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SCREEN_DEPENDENCIES += linux-pam
 SCREEN_CONF_OPTS += --enable-pam
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
