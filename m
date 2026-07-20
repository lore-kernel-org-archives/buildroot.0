Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE005C4452A
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B67DC60719;
	Mon, 20 Jul 2026 15:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx3upW31ZDcC; Mon, 20 Jul 2026 15:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315EE606F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559781;
	bh=kH/8H594NJGXImMzBf1vHjvd30fG8bSQvNh3wSTdWUI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2GXfpnaXyAfe/PlaooBfJ7lfUXU5EBIVdsJDc0A5QUGTjwaogUGP6CkflZkN7Vo9
	 rRVFsmMeritPVFyNfW47QZaeYWiNUBNg/++/1nUKui+0dCBxFL2ehq2Q/a1yn9rowe
	 RumdqDnGjZ6RWCdCVzBKbhuEhVFY/avcJOA/GhVEePTZ6rxxPiUatMpwOLZpEd8J9f
	 YMdqRldUVffxG2J3sm2mLKLFc6s775J3DzGAVoKOCqKQ3lMFLx22syZlCBlrvFrYHc
	 +z6QpFY0kOmrgLxe0WgMX5SGDL6Ors8df0k0JA9F/8HNCTMTV2O9mwYvkuMDIRP2vh
	 QyEDVxNYgA6mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315EE606F1;
	Mon, 20 Jul 2026 15:03:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 253221F6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 128EF80CFE
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BXhrOGPmld6 for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B92F180CC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92F180CC8
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B92F180CC8
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so2862747f8f.0
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559770; x=1785164570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tubF09QNdM4p6UTnMavuBC6iv/yXggglpOm33aeUj98=;
 b=EAFxZeextLMnqkJEILAaKCV8BANnxzxRYsMTMDF1WwOoE3ZPm6rg76O/aZRIKV8Nf0
 5r3puBOl1xf64yeh15ozak+/WrF4LT7NqYrgyyhGXDBjc3mb7aVzNnFjvixqaGzgtfb7
 Fq+yNZE8bsNQzH97lor7gfzOO3qSOulEKPW9gR/ToIh1dcdMiNGS3qx4d7LselvGFEok
 fpIvb4VRAa8DDBCpeID2Qr2kU8Uzq3s/GvzyF83jBgzpwtSJ41ekaW8/ZJRbosltC0Sr
 x+rbG5B/bLJNPBSw9dzAKAI+/U+GRoUpm6iyQ8Sz1KkVGsUAXetKtLw1IYiILmb31r5K
 3hlg==
X-Gm-Message-State: AOJu0Yxh0EIlngFMwoBMIEfX4U/+WQ+Aw1GS91SB/RfVKdgEyfaw+0gm
 rkdvBxsnyDFshsxHni3qls0G/W8WhVU6d4O4naNcPdDyeQlcAeDshdw/Lbazxw==
X-Gm-Gg: AR+sD117DcX6mPkdzXYDcsWry57pHnnL36kwok+7t6Qg1xvTVbHCVSN58jEAmk8mBV4
 /eujRfJMobwXYfl+0UiphKZLsmpqERxt2PpO7X4ZhEOuVVctcy/7sPj2ARzLbNPSlcevgxr9gxz
 PWtUS9dKAP1+ZSCYFUS7TsMYda2GWhCWt49GzVm95XlJYBmM8GtWl1dHctMCh+DldydJ5LvgYod
 emGnITwXlV30A3nplbQMQ3ovX6kjOwN6S6AugYcRDPDEtXJGUBoKlLrNpXIj7XLmItWx8AfAa5i
 ndJOkwmhujwOKhd44jOLRH2PR3Lhqhx6NoRtjirkcQQPC3d5qOuN5hPi8jrmLnfsb2bad1hps+5
 qn150MGNxuFgkSZNVXwxNLHFAgDjsZ8pGoDtYh9cChVLmz/Q4bHhrEwrhY2naNJCRlMFCoSrdz+
 vbH5zFP7uYp+83SFubJK6Q6z89hawa
X-Received: by 2002:a05:6000:4282:b0:47f:5b4e:a7af with SMTP id
 ffacd0b85a97d-47f62303f70mr17047238f8f.21.1784559770433; 
 Mon, 20 Jul 2026 08:02:50 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:49 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:35 +0200
Message-ID: <20260720150236.243961-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559770; x=1785164570; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tubF09QNdM4p6UTnMavuBC6iv/yXggglpOm33aeUj98=;
 b=m8gIa7xkBN2Mv6h1yLLHMRspVHED56Vy2/kgajCmPQ2Z2wIvd+HoXaza9uOVw2eJ++
 4PBjJ0s2IiJEWcjbpmI+D1eSS01952oISr9pLae+yT9rdad+wn/uoeBjc4dHiMFsPBna
 FMcVA3+bRrQPhfCpZWKVnFGuL7wrga68OZFYMh2PypvY9jFTW4OySKMNrRNPaYddmwwV
 U+NbSuuhtIDL1sRQczcXd12wWh+q+RDFQunY3Ej2ykesH3V6VjGQ+gKNdxbHtNdpfeuH
 8I4IViSxSCmE0NaxbN/PoxnXSPEW/TyHY2EKiApAVjxjDnqVdiUSvbgFM/l+sCNcngCe
 Howw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=m8gIa7xk
Subject: [Buildroot] [PATCH v2 8/8] package/hare-dbus: new package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                         |  1 +
 package/hare-dbus/0001-fix-Makefile.patch | 26 +++++++++++++++++++++++
 package/hare-dbus/Config.in               | 10 +++++++++
 package/hare-dbus/hare-dbus.hash          |  3 +++
 package/hare-dbus/hare-dbus.mk            | 15 +++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/hare-dbus/0001-fix-Makefile.patch
 create mode 100644 package/hare-dbus/Config.in
 create mode 100644 package/hare-dbus/hare-dbus.hash
 create mode 100644 package/hare-dbus/hare-dbus.mk

diff --git a/package/Config.in b/package/Config.in
index 1d0dac96c..aa8818ce7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -511,6 +511,7 @@ endmenu
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
+	source "package/hare-dbus/Config.in"
 	source "package/hddtemp/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
diff --git a/package/hare-dbus/0001-fix-Makefile.patch b/package/hare-dbus/0001-fix-Makefile.patch
new file mode 100644
index 000000000..1250d89b0
--- /dev/null
+++ b/package/hare-dbus/0001-fix-Makefile.patch
@@ -0,0 +1,26 @@
+From 93abfa5970937253ae73bc8bcd9e243d890484a9 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Fri, 15 May 2026 11:56:39 +0200
+Subject: [PATCH] fix Makefile
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a738e6a..8c4fe78 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,7 +18,7 @@ dbus-introspector:
+ dbus-scanner:
+ 	$(HARE) build $(HAREFLAGS) cmd/dbus-scanner/
+ 
+-install: build
++install:
+ 	install -Dm755 dbus-introspector	${DESTDIR}${BINDIR}/dbus-introspector
+ 	install -Dm755 dbus-scanner		${DESTDIR}${BINDIR}/dbus-scanner
+ 	install -Dm644 dbus/protocol/*.ha -t	$(DESTDIR)$(THIRDPARTYDIR)/dbus/protocol
+-- 
+2.43.0
+
diff --git a/package/hare-dbus/Config.in b/package/hare-dbus/Config.in
new file mode 100644
index 000000000..63f332cbf
--- /dev/null
+++ b/package/hare-dbus/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HARE_DBUS
+	bool "hare-dbus"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	select BR2_PACKAGE_HARE_EV
+	select BR2_PACKAGE_HARE_XML
+	help
+	  D-Bus client implementation for Hare.
+
+	  https://git.sr.ht/~whynothugo/hare-dbus
diff --git a/package/hare-dbus/hare-dbus.hash b/package/hare-dbus/hare-dbus.hash
new file mode 100644
index 000000000..e8abc40e4
--- /dev/null
+++ b/package/hare-dbus/hare-dbus.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  67a3041126f7745e667d570904504a58475ca398acdd679b548d9e0e513092f8  hare-dbus-e9a89f8bc5ce783fa25f0eb67d7d8932db90bcc2-git4.tar.gz
+sha256  7c77ea8fa77851b9ee52d715ec6a3c5f15604bdab5148dd13dbd1dd345752017  LICENCE
diff --git a/package/hare-dbus/hare-dbus.mk b/package/hare-dbus/hare-dbus.mk
new file mode 100644
index 000000000..93d2a688f
--- /dev/null
+++ b/package/hare-dbus/hare-dbus.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# hare-dbus
+#
+################################################################################
+
+HARE_DBUS_VERSION = e9a89f8bc5ce783fa25f0eb67d7d8932db90bcc2
+HARE_DBUS_SITE_METHOD = git
+HARE_DBUS_SITE = https://git.sr.ht/~whynothugo/hare-dbus
+HARE_DBUS_LICENSE = MIT
+HARE_DBUS_LICENSE_FILES = LICENCE
+HARE_DBUS_INSTALL_STAGING = YES
+HARE_DBUS_DEPENDENCIES = hare-ev hare-xml
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
