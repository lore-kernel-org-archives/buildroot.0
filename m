Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA55CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 741C080E93;
	Wed, 20 Aug 2025 16:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3Rhpnq68lVd; Wed, 20 Aug 2025 16:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 781AD80E97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 781AD80E97;
	Wed, 20 Aug 2025 16:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C827AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB57F4079C
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSpOlnId7krl for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA37F405F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA37F405F2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA37F405F2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b05a49cso419545e9.1
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 09:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755707967; x=1756312767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vSEcgPoTK59vjM0Xz/wMJUdXCJl7EVs0m4bCXlKLl0=;
 b=C1YE3q32xDoKTirZY3S1PVY66PDbW3+1MdpSeTv6sk4WLKFqTgTlgHGXe+fRZXG/Nj
 k6ncZIe/Yiny/SMChY/SPxG4/uiIo6iAhBGTDqvIwpi+1gfItgPzoitLWOK86QQKehnj
 jmXqD488LhvgRvm6o5fgSRKy4LodW2xrq1SUna+0ZALjJEpY+rrou7GkHXJ6bnu8+wyN
 s44IOUysSmgS0L1EcohtcsmlGFdTCHxOOxPfUe7+Gnl7UboXtFsMIcXfsYzXs5FxXhP1
 gPWmaefbSQL8gw1xEdVnvricZVlvcxbnuK1nAwlKU+9xun1oAcUqOLs7f4AZt1wmt/mo
 Z13Q==
X-Gm-Message-State: AOJu0YzkO6ndx7yMV4+yHo5Tqsb5q6S6r2Sh4YP2xWjaVQ8Vwqlf5MQG
 cGbg1TPX/Inj5Do8yeH5v128aZJXvQRBTgQ32sExsegM8iiZyQrZADzeop3i0ZzR
X-Gm-Gg: ASbGncvDOYkdUXmVnCsRFrQe81HTUjtgXRBoY16Qhip7OFgALuNPgBFdfTJB915bDHx
 TLwPLNgYnVtchau6THCRX10C5OPcMyJtiUDhoBVsV9+o6AAXnaxYKFj+R8RLRKPARCf2PWyy6iR
 G2D0H3mgVh8cjEgaNtE/Fn3nlRjcn0Sd/Hs9D2Y20FVcni7ALvKXNokDqFpxzDDJrVO/ERXMkSW
 pseo5wMTyz7oC59BLsKWnr/U6rw3CJ1+4r3dQptv9WOJmxraaofZJvSOJBH3TqHXYP77RehOIds
 JtReWAz7AGWQPnbaoQwbYXlXFxOsYjCRSOcthpNjAKNgs7UDIOZnmM3eeFtxukjddL2xlcarNR5
 YhKNbdEVI1gnEPq3i3TN48k0Zwqp//Ga0G+TaJDd6thLD4Q==
X-Google-Smtp-Source: AGHT+IHyz5LGb6Icd4oJxPJO2EwU9udNQmWvHwEpHet1djWcaP9TeP9S6KZ8n1caJ6l4LDv4QjeY6A==
X-Received: by 2002:a05:600c:8b17:b0:459:ddad:a3bd with SMTP id
 5b1f17b1804b1-45b479b331cmr33243815e9.15.1755707967337; 
 Wed, 20 Aug 2025 09:39:27 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47c6d857sm37412195e9.26.2025.08.20.09.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 09:39:26 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 18:39:20 +0200
Message-Id: <20250820163921.1968030-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755707967; x=1756312767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2vSEcgPoTK59vjM0Xz/wMJUdXCJl7EVs0m4bCXlKLl0=;
 b=O+ubkn1Yl0OXbUQymJHkedlgbc+J4z+G+RT6jFqUAMy/ZY50dvjKxpTWA7nzb9Xw7j
 Af2KleHMF5C8oaOX0psyepZIKF8E0ZEFIbfj+BfszMlOgptyKHB2ubTK50hAlApE4N69
 J6LAfeR/NyIm924QRiQIPlUcruW3gCLQ/fIpIfHMq6gGN6neUSX6tQ1gvUAkmLnw7ddM
 2uYiPx3mh02tLRT0LM/Ngi/8xdBm1c+sYciRY30DuwHborx49Ej1ndV3R4ecfMhYuaro
 1fEYOd5YeOaR/1TfwfwhC8Veuvr4IQ34nipZ/SkNUmcpEIHJEJM8cnD7JbwSTvpCQ+V0
 TrVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O+ubkn1Y
Subject: [Buildroot] [PATCH 3/4 v2] package/libppd: new package
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

This package contains PPD library for newer versions of cups supporting
more than ~10000 printer models.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
v1->v2:
* Fix incorrect order of patches (Baruch Siach)
* Add a note about autoreconf (Baruch Siach)


 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libppd/Config.in   |  8 ++++++++
 package/libppd/libppd.hash |  4 ++++
 package/libppd/libppd.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/libppd/Config.in
 create mode 100644 package/libppd/libppd.hash
 create mode 100644 package/libppd/libppd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bc8816c8aa..25d68f43a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -222,6 +222,7 @@ F:	package/libapparmor/
 F:	package/libb64/
 F:	package/libcupsfilters
 F:	package/libdill/
+F:	package/libppd/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 68a8f96e23..d029780241 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -354,6 +354,7 @@ comment "Graphic libraries"
 	source "package/imagemagick/Config.in"
 	source "package/libcupsfilters/Config.in"
 	source "package/libglvnd/Config.in"
+	source "package/libppd/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
diff --git a/package/libppd/Config.in b/package/libppd/Config.in
new file mode 100644
index 0000000000..124de4f7f2
--- /dev/null
+++ b/package/libppd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBPPD
+	bool "libppd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBCUPSFILTERS
+	help
+	  The Common Unix Printing System
+
+	  ~10000 printer models are supported with PPD-file-based classic CUPS drivers.
diff --git a/package/libppd/libppd.hash b/package/libppd/libppd.hash
new file mode 100644
index 0000000000..3f698c3108
--- /dev/null
+++ b/package/libppd/libppd.hash
@@ -0,0 +1,4 @@
+# Locally calculated:
+sha256  b356aeed1335ef0ca7f799741782a2544e7acee63fb4b047b94e4e0395a9cb62  libppd-2.1.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/libppd/libppd.mk b/package/libppd/libppd.mk
new file mode 100644
index 0000000000..9680bb7115
--- /dev/null
+++ b/package/libppd/libppd.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libppd
+#
+################################################################################
+
+LIBPPD_VERSION = 2.1.1
+LIBPPD_SOURCE = libppd-$(LIBPPD_VERSION).tar.gz
+LIBPPD_SITE = https://github.com/OpenPrinting/libppd/releases/download/$(LIBPPD_VERSION)
+LIBPPD_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+LIBPPD_LICENSE_FILES = LICENSE NOTICE
+LIBPPD_CPE_ID_VENDOR = openprinting
+LIBPPD_SELINUX_MODULES = cups
+LIBPPD_INSTALL_STAGING = YES
+
+# no configure in tarball
+LIBPPD_AUTORECONF = YES
+
+LIBPPD_DEPENDENCIES = cups libcupsfilters
+
+LIBPPD_CONF_OPTS = \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
