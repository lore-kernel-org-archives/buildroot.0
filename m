Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F47DC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B9581ABA;
	Sun, 14 Aug 2022 12:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6B9581ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dd7ZXIWIxQIf; Sun, 14 Aug 2022 12:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6DB981985;
	Sun, 14 Aug 2022 12:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6DB981985
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B08C1BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 738CB81985
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738CB81985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiNi4UcvZAUp for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:55:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A1FB8188A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A1FB8188A
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 12:55:47 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id uj29so9478630ejc.0
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 05:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=EdqBXLC4pQKRQDBJtzW7qZScUpy+6a21VeL2zrG9YDU=;
 b=XKDA7spKq9ekVwMvDVUHGG4IfPo1STWwuEIVMbOYBoMveXLLWB8CSZFNCjHZm1uk6U
 G+bFnMQGVMDHMbCjcbAmGOCJXCWUSDbeWTnpCvWkWiJOf+X42eA4s9b8guKXSI9jPpmM
 iwv2u6B+SkIxUxHeSFQh6TMGL1uIC0INt5pcN/2WWlfQmQs4UXZR7oCfIGfBCOxmPQSd
 Rmli6kK5qtFYTd1Evt50dqe7IymV6YSBamVMgV1CNusnIdiZZBcn7qOd9HyIiJzQoMie
 3Y6tDFUTFhZ3mogYwcARRJwgVyN2q2v6rt96gv9dsN6JQBJojvzTcTWsH/umKzYc6Xov
 bCdQ==
X-Gm-Message-State: ACgBeo3jG8FSkF4Xkmlv6IimbcrVRMASBtnZmLLcdXgmKEdlVmRPmGDg
 5FM0Dz5Boj6v5Wvs043EBupIiMKm3OE=
X-Google-Smtp-Source: AA6agR7hRO2hPZEyH/Y1wkJ+PDktOj/J0YMe0NJUmwRCOTX6C32Ie6/gwzf5lOtDcHhNkVfYwvGj7Q==
X-Received: by 2002:a17:907:6e9f:b0:730:e923:a378 with SMTP id
 sh31-20020a1709076e9f00b00730e923a378mr7856383ejc.71.1660481745523; 
 Sun, 14 Aug 2022 05:55:45 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 kw10-20020a170907770a00b006fe0abb00f0sm1161862ejc.209.2022.08.14.05.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:55:45 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 14:55:34 +0200
Message-Id: <20220814125534.1227844-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=EdqBXLC4pQKRQDBJtzW7qZScUpy+6a21VeL2zrG9YDU=;
 b=i0W2FL1QkW9M3YqWMGbr0tgkIfX/1Mjh3G203x/qsh1Xl9b4KsnnbHk4SuvbgiRhb1
 6AoN/VKSvsOR41L6OEBtuG4f+mSgbRq0PUxaA2xxb6MdEU7PyUNvd3nJZBv46FwuHXR7
 pYDc6KwXjvQNPPn5VdtIRr9qDxAf28zHzzwmNn4G57OrGhrve5+6LTeqV2Sn6TdRI83X
 OrKTCwkS0jmB/EtP0SGxnveSJ5lNnYh54zsoZie7g88aDhKJgwUCX28CILXPlnIJMqoE
 OeZ4zFaw4VO6r1YunURECWOcrn+SowUwa7Sjxga+9qZsi5YqsP2VulRra90Yo+EA7gbS
 J3eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i0W2FL1Q
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: bump to version 2.42.9
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 4bb246aa5..35084a50a 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.8.sha256sum
-sha256  84acea3acb2411b29134b32015a5b1aaa62844b19c4b1ef8b8971c6b0759f4c6  gdk-pixbuf-2.42.8.tar.xz
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.9.sha256sum
+sha256  28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962  gdk-pixbuf-2.42.9.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 57e8bbd51..7a75ed23f 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).8
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).9
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
