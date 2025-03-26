Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAB4C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 13:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB88C84777;
	Wed, 26 Mar 2025 13:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T04tOYe4WLvJ; Wed, 26 Mar 2025 13:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED1F84726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED1F84726;
	Wed, 26 Mar 2025 13:27:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E6A6E4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 851E3416CA
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnnVwWSsEafd for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 13:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88829417A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88829417A9
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88829417A9
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so5415155f8f.1
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 06:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742995643; x=1743600443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iv41EVrjYXR4WA3yenrtofFX+MBBrqZHsSN6tuBzBIs=;
 b=GPb3v+isDL5lEDhacB6UG0A3q7ALmx4I1gM18BYe6ICK8dgHHgVnE8bH9g4JiDTp9m
 4W0sATzJ7E20GPbNEiqigl5qr9FuqVXwQc4Zg/wQF6NmxGVrw/9sHZR28wh7ojjlpNAh
 8ZgyYqMrq8dQ2ptUVjyE42NJbvaMKy5gdj0rqHvNYdkq8R8urpePQmeVi+6vgYLJsG0u
 fhWvGKJ4e4gtGbKvXZZECm7o1vK+tnw+GX3+2pIjm/kT2shAk3FnSQ25eiR54tdiYqbb
 3apVi1gtoFj4AqLEDijz/VAcALIQynrQNJ5noDvglmAjwlufyAlPP4MkyRdBWCiT0SNV
 XVtw==
X-Gm-Message-State: AOJu0Yw6Me/4+gU9aCuNa9QS04Ibc8V9C74IuqXps7CyLmJAbJ2Rp14U
 fu7dzrWvMUc6bFp8xop764GQDP9nqT12ui7rttnxkdjj9a7S/hnFkPVQrpcWJlU=
X-Gm-Gg: ASbGncsG2lX0SV6GZTzEiwvZtkh5o1EvOhcpwUxD3LIUcCxi6fl3n5xeUK64GADLb1l
 iuAMXmKKs4Oyjf/ePyacTOwFo/N6NRdA8fx2OAcdxS3k3lsHanQWZMNOrq6zlTMdNXDSwir7q1h
 /OIDVEkN0DrLwOx4rvej2PlG4eYvAUTm+d03Df7tW9YN40oTC4d1xca96i3srnR4g417iu1nl1J
 5dTEpYBTF5cjzdxT9evKyt6bKTKud1PWTnPKSyyuPCSCPQIROuhr8Hn3lFmbSzaM/I+OeXWpWhI
 mtxPM+SG1HCt+hVMyCJqRPpsPka4ZCoppY5Od+FTDAzrEbTlRg4bHXY+F6m+ZcaZL7y2MOugbPc
 RtK5V2Xu/
X-Google-Smtp-Source: AGHT+IEvzBgYvJUgMPYA7jnKDK7URDvHbQ+on/0vlTnM0uskbyFTrKakghV9H5myVxpYzWG1AKRebQ==
X-Received: by 2002:a05:6000:2187:b0:39a:ca08:8c94 with SMTP id
 ffacd0b85a97d-39aca088ca6mr4834057f8f.19.1742995642334; 
 Wed, 26 Mar 2025 06:27:22 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e83482sm2175715e9.14.2025.03.26.06.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 06:27:19 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Wed, 26 Mar 2025 14:26:55 +0100
Message-ID: <20250326132655.35729-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326132655.35729-1-maxime@leroys.fr>
References: <20250326111651.23707-1-maxime@leroys.fr>
 <20250326132655.35729-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742995643; x=1743600443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iv41EVrjYXR4WA3yenrtofFX+MBBrqZHsSN6tuBzBIs=;
 b=Nta9pXt1ZVWh3lj6ClKXiotCOWVwdRQAbgOWk8pywircyAP0uNcYOUXs0x/sN6y6C+
 +LNxi+flbKjvyEzq2Bu0hLXBwHGHvO0fC1csMN/KCk8zJHwGWJUDdGNC19Czr6ZZs6r0
 pX0+zTYEFDYyab/mWjKydehLxAc0DGNM8qOzV2CEVsYSQZnA0GepYY5MB4ARNnFIgg0h
 aiKZBSjLZ60nFMfai+u2K0V69VflRPSDTsmk+PlZu+u2+hsUIt+mS/iPAHr5zo+oP7zk
 aOYiWoL1ohFh9plS3Pfqq3U0rTTWf0h8U0bxRvdLqv7zvmr+Lut2ECrrWF8PbGsU39FX
 0Gyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nta9pXt1
Subject: [Buildroot] [PATCH v2 2/2] package/grout: new package
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

Grout is a Graph router based on DPDK.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/grout/Config.in  | 13 +++++++++++++
 package/grout/grout.hash |  3 +++
 package/grout/grout.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/grout/Config.in
 create mode 100644 package/grout/grout.hash
 create mode 100644 package/grout/grout.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 44f7684c97..c9871f5d32 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2383,6 +2383,9 @@ F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
 
+N:	Maxime Leroy <maxime@leroys.fr>
+F:	package/grout
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index d8751fc19f..854cbc6cca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2493,6 +2493,7 @@ endif
 	source "package/gesftpserver/Config.in"
 	source "package/gloox/Config.in"
 	source "package/glorytun/Config.in"
+	source "package/grout/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/grout/Config.in b/package/grout/Config.in
new file mode 100644
index 0000000000..a39c3283eb
--- /dev/null
+++ b/package/grout/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GROUT
+	bool "grout"
+	depends on BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_DPDK
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_NUMACTL
+	select BR2_PACKAGE_LIBECOLI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Graph router based on DPDK
+
+	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
new file mode 100644
index 0000000000..cff686ff19
--- /dev/null
+++ b/package/grout/grout.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  10f8e20b4aa1a8fe928c87b249e23267eef356f39b04994a0b88b52931fcaa4b  v0.8.4.tar.gz
+sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
new file mode 100644
index 0000000000..0d6fb8dce9
--- /dev/null
+++ b/package/grout/grout.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# grout
+#
+################################################################################
+
+GROUT_VERSION = 0.8.4
+GROUT_SITE = https://github.com/DPDK/grout/archive/refs/tags
+GROUT_SOURCE = v$(GROUT_VERSION).tar.gz
+GROUT_LICENSE = BSD-3-Clause
+GROUT_LICENSE_FILES = LICENSE
+
+# Avoid using buildroot commit hash
+GROUT_CONF_ENV += GROUT_VERSION=$(GROUT_VERSION)
+
+GROUT_DEPENDENCIES = \
+	host-pkgconf \
+	dpdk \
+	libevent \
+	numactl \
+	libecoli \
+	util-linux
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
