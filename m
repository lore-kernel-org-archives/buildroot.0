Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F82E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BF580AD9;
	Mon,  6 Jan 2025 13:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0mdWVa_jWvx; Mon,  6 Jan 2025 13:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0575780B34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0575780B34;
	Mon,  6 Jan 2025 13:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9995F6B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E51E402DE
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-5H_AuUpfvp for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6141040216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6141040216
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6141040216
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so27323996a12.1
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170968; x=1736775768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gj9swTSOVIak95WyWP6pcS2CmSvNKGPY7Z/HTnFzR+Y=;
 b=SuzPYmK+/dcFP0Jny8hdEq6rPyuS37PZ90bKrTB8uG+4zuoJdrdwfjxQn8oAee+C45
 VBWtK4yMZfViGGbeq5dgfwPLUlEh6hvdKLqZ+ynSDEbgDCyTpj2tPJefl2evOfh+PciZ
 5LQC16cQMnQMijTPphR10WbaGKGhsnE5myWNJYkP4TjYTZo20OZRm9d+vfEjQSPZf0sj
 zwmMGMmxt9YZCd+WsW7cdQx9VliQpbRRe0pDvq2Yr8iutFSgBAMj8xa/X7yhgszmS0Yh
 zNzL82LJ2LGlOoMWjTW3yRtflOSG77wKm3gEou7ywz3UEc+2CbAOwjF89/ZapCD9rfF7
 WwAQ==
X-Gm-Message-State: AOJu0YzQLYuw2ZFrhfLi2bzqJ4PO78FNwcv6YBLjnTynHHLdpTy8H+a/
 HBTnkC3qccSKIHFDc77vyFjfyiANcqsBRY9aT3CE068dvjthuocW+QQjlw==
X-Gm-Gg: ASbGncuS3AOzG+ye1jKGIa0ulMcFAZwGWXzh3e11NqY5E1d5DKQS7xhjiAcwZedSev9
 Ff65i4cZCXGtL6T1ATWAFzANHxyxDhcuA1ReTqvatsOPppZWdFD5S254svX+DlRbXo5q1ELP2FL
 x2oKiHVbuZcwop68rN8gdLB+IoLQOfCvAq9tpfciT9BT0f1srwIZJAAoNVBp8VjawHXFNQR6mam
 +BzpDdkAHiU655y3HCFdOjnqlNbqje6G5LkKNcOldcgo0KCvTrjsDU6McfYDc0GVFZZclm7bA==
X-Google-Smtp-Source: AGHT+IHkzurc4r7dIxHmF6tPXx99hZmINbbrv8rMySlJdwwYItmrovyc6l1UbFGHW6SxrfmMhguLuw==
X-Received: by 2002:a17:907:1c96:b0:aaf:ab78:34f0 with SMTP id
 a640c23a62f3a-aafab784915mr1021640066b.30.1736170967898; 
 Mon, 06 Jan 2025 05:42:47 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:47 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:17 +0100
Message-Id: <20250106134219.1914954-6-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170968; x=1736775768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gj9swTSOVIak95WyWP6pcS2CmSvNKGPY7Z/HTnFzR+Y=;
 b=I6OtLCDD4WItpB1REHh1mlrUJ1qBrC26tQQ6Vesjb+/O36/hN0Mcr/WmojBJcncilf
 arRdjPDdbEN6S/D6Rl+z3O4eVWeCX1jWOyPQUTdyDCuoos8AR6kPTx0oj1WlhIStjZIC
 8LDI2aQzWO2Hcv7cWtF5wpgsJTLY3smAusObdKqQpzpe/nRiCn5PkD9zsjPJLRpad3gp
 FIXMSnT9FMXQS/CBSAzGk/ugEczzWCl5FeNVCstMyUdiWjKOpV+3/COh6W0Zsxy1t7Du
 nOXydevakHtckIMIBGKRX13lWvfOfGR9/HjtrMHpR1ogDnkw/a09TCnx7SEoiByx0pZD
 NibA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I6OtLCDD
Subject: [Buildroot] [PATCH v4 5/9] package/sysrepo: bump to version 2.11.7
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

Add new config options to enable/disable binary tools/daemon. By default
this options are enabled to be backward compatible to older package
version.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v4:
    - removed redundant config help information

 package/sysrepo/Config.in    | 18 ++++++++++++++++++
 package/sysrepo/sysrepo.hash |  2 +-
 package/sysrepo/sysrepo.mk   |  5 ++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index b1535bed9f..fba565df6a 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -16,6 +16,24 @@ config BR2_PACKAGE_SYSREPO
 
 if BR2_PACKAGE_SYSREPO
 
+config BR2_PACKAGE_SYSREPO_SYSREPOCFG
+	bool "enable sysrepocfg"
+	default y
+	help
+	  Build binary tool sysrepocfg
+
+config BR2_PACKAGE_SYSREPO_SYSREPOCTL
+	bool "enable sysrepoctl"
+	default y
+	help
+	  Build binary tool sysrepoctl
+
+config BR2_PACKAGE_SYSREPO_PLUGIND
+	bool "enable sysrepo-plugind"
+	default y
+	help
+	  Build binary daemon sysrepo-plugind
+
 config BR2_PACKAGE_SYSREPO_EXAMPLES
 	bool "enable examples"
 	help
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 056f70787d..93c336e1a9 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  467efed8d0f62c26a0d200602b911096eb2d67858e620937ab68f96b316fa9b7  sysrepo-2.2.150.tar.gz
+sha256  45a98a71827dd1428e2c6b7dedea47558cdfbc491042bbdbc0c52e607ab8266e  sysrepo-2.11.7.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 7f2570bd7d..c215be0159 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.2.150
+SYSREPO_VERSION = 2.11.7
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
@@ -18,6 +18,9 @@ endif
 
 SYSREPO_CONF_OPTS = \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
+	-DENABLE_SYSREPOCFG=$(if $(BR2_PACKAGE_SYSREPO_SYSREPOCFG),ON,OFF) \
+	-DENABLE_SYSREPOCTL=$(if $(BR2_PACKAGE_SYSREPO_SYSREPOCTL),ON,OFF) \
+	-DENABLE_SYSREPO_PLUGIND=$(if $(BR2_PACKAGE_SYSREPO_PLUGIND),ON,OFF) \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DREPO_PATH=/etc/sysrepo
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
