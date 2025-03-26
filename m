Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ACEC3600C
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 11:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30BFC6F614;
	Wed, 26 Mar 2025 11:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQx4pvXFn8mh; Wed, 26 Mar 2025 11:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F76F61299
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F76F61299;
	Wed, 26 Mar 2025 11:17:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94E0AE4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 759564174F
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Og2sMRiXG86W for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 11:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BEA0408AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BEA0408AB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BEA0408AB
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:17:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso1501462f8f.2
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 04:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742987820; x=1743592620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EZqztkYlfflg5GpZu96zu6R79NHUoRxxJlnNYd1QgoQ=;
 b=iEPSW6e+PlJ6SPDy2AwQr0kd4Rxwl647BUcoPGFLEadL5So+sgXhQhBCHR4YB+yoNw
 Hw8X47vOSzadUSmSyfmquwM3e0TOTYUX8BY2eQYuZylLgBjwLqlR6C8zY4LVeuh6Uqwp
 lNyVDK7Ln4DyphUVqdHenCXauTeVtJ3oG6QbLsgV1Oo9EJGmqBnnMw4No83jAzsYL1YW
 btT/sLj5sOtVaZCvVK4dgjcFgZwonRN0xIGXsZTNwvu9unVN26i4wHDcDPQpom0uB9ve
 0rJE02YXkMKGzOU4HtByByHyl0H7dME6sBxj6mOCeE1iDfoIH+eDm8wO3PKGT7X6G8Ki
 Quog==
X-Gm-Message-State: AOJu0YwzBmLQ8WvPm81b+y2AI/bAusDImCQKlRABV7fK9Adbb858A8Dr
 lCkp34aHqzbSbQKNKkuQtm+JalTlZsEXMxsJaZC80cBdXt1XCkh/BseyDzInkfc=
X-Gm-Gg: ASbGncs+JOxjjX8tYdcOvxlR3mc9LyvsQDiGpbj4MX8kuRpGt6nc/fdx7XtoyQT/1ST
 RhnqeHVPfUxGKo69jaaZoDkLx6SUxUOvt+nhhg0yDEhWpmXebv362Hvc9VHNuMBxvKBJhyuhLa3
 r+4EP8wNGKp75gEtCTcBJFp92QdYbhYS3olDTWAkZNyz9iVy5nDOugPBReU6FT/Sl/bmrCE0HZB
 95Q6rH7E2eYpxB7bNYKh+jAaM4jzd+WqrzCi5RodQoUYiFxKL0X5GGfRsBPWCyoPKZf7PIeUM7E
 jdgNiMAcW7drRJMgdVlEvEYYPrYSHuMzsH/j38wp5GlLqQ7qVMuZb2ovt5Y1xuvirT2Kq+wtgw=
 =
X-Google-Smtp-Source: AGHT+IGw4Fc9zwCakxqF+EOsdaY9DftKQ89zEfSgcUz7/nI7rNABUdPQpjkD2wvBOGnaNPyXYzd/Cg==
X-Received: by 2002:a5d:47ca:0:b0:391:300f:7474 with SMTP id
 ffacd0b85a97d-3997f8f9faemr18794002f8f.18.1742987820405; 
 Wed, 26 Mar 2025 04:17:00 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f2asm16677145f8f.30.2025.03.26.04.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 04:16:59 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Wed, 26 Mar 2025 12:16:51 +0100
Message-ID: <20250326111651.23707-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326111651.23707-1-maxime@leroys.fr>
References: <20250326111651.23707-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742987820; x=1743592620; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZqztkYlfflg5GpZu96zu6R79NHUoRxxJlnNYd1QgoQ=;
 b=Q7sQn7xtf0QmxBEmOQe1FgpSLURVro5vx0ma0GGOju9Fvf+ScdfnkjICKFiHFoHbg6
 Ipv3TzcTUWkD3oWXMfHVSNbOtFSMoq99iI6JNyg1XJcFeIMp4E5dGmQFKa9QIi3Ak+qd
 fNRzwIa0/cM3UVS5r+Zjs/0HCiikVNBu/wEjseX3mIh/DUr+nqNpCtGgknZnBABuyIO0
 gVHTvDCGZQoLHvFT6KYtFydnSvZjWPZSKZpD0OG9Fr5h+ZYCn2XMkhR4C+aKqsf3TiTU
 hj+ZSWLAQppLjdxzTrefQUHgC/DPCY2Qnrc2JcOqXRhvfPVFNgQOBOtQvXELAs9cPPPA
 05fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q7sQn7xt
Subject: [Buildroot] [PATCH 2/2] package/grout: new package
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
 package/grout/grout.hash |  2 ++
 package/grout/grout.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 43 insertions(+)
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
index 0000000000..7c06a995f5
--- /dev/null
+++ b/package/grout/grout.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  10f8e20b4aa1a8fe928c87b249e23267eef356f39b04994a0b88b52931fcaa4b  v0.8.4.tar.gz
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
