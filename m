Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4BCC4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 12:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9936B80BBC;
	Wed, 24 Apr 2024 12:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5g2PEesfarI; Wed, 24 Apr 2024 12:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D6680BBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D6680BBE;
	Wed, 24 Apr 2024 12:23:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3F0C1BF580
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF9C380BBB
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjK8lShkN6AQ for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 12:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99C4580B72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C4580B72
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99C4580B72
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 12:23:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a55b78510bbso377733566b.0
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 05:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713961422; x=1714566222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QrxPhrA5wrzhnLufPZasW9JsmcYpFx4ZUx7FpecD1VU=;
 b=K1B/5GF50PM4gP4wD8WdatQFgROQZlZtsTXWxZh2Fkrejxs/BN7DjkHwXbXQfFh6AN
 5o1RcW0XLBLoGWAkQOKdHp+sJwp7Bsv1TN/UocyQzc6OPn+Y+wxuMJceynb67App411X
 4leqe1lgkpXR10LH92HGqWiNLnyg6Nhc6ExjroF03z58MQsiH/5BW0ibXCt6iIeUqHDf
 3IS3mfpliFaue8jtBAvpUYOV6cgchJ7Folj2Dtds6yr80Om7Bxw1WnENstyTDFbugOf/
 1jHJ1RYTyFdl6Is0Cejk8bNPq4XR7rP9K6BN1mRqj7OUojdHKIUrSFdUbZMCxowjBHVM
 UIYg==
X-Gm-Message-State: AOJu0YycR6huPr8AeOXfZEaP46OEyewHbSSnS03Z7gLmiFgMHGB4mSxQ
 7QzUfUKhgHd5EiwLnzn7fDeigWaq15R4M9OIpu0A5x+AOMr596kt89FdAQ==
X-Google-Smtp-Source: AGHT+IG6gemdvQdVxWKcCK7uv0ko/759xGW/NesLC1FlPQn/Vx2M6UH2omXSv7l3I6Q3tMm4bgnVcg==
X-Received: by 2002:a17:907:3f1b:b0:a55:5b1f:52fd with SMTP id
 hq27-20020a1709073f1b00b00a555b1f52fdmr1872660ejc.3.1713961421812; 
 Wed, 24 Apr 2024 05:23:41 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 qt11-20020a170906eceb00b00a55ab2630c3sm4547410ejb.38.2024.04.24.05.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 05:23:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 14:22:40 +0200
Message-Id: <20240424122240.136386-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1713961422; x=1714566222; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QrxPhrA5wrzhnLufPZasW9JsmcYpFx4ZUx7FpecD1VU=;
 b=giGHKPUS8A/zIwblvlxlZTmzrIw2hJSd4BdR+1vUdTqKEXF1FI6HrVXFgR0tJ6CdgG
 Q3SY/S8s/+prCvF8tvPMr/r2r6ONyALiwdeCbkZs8IdxGUqT6tvuP2ElCAeJjYZTZT9g
 rOLp87dP6mdYjGISv/HAcGIDJ//t9xUmIGAGFwH+0a04yo2BCazCRej5WWMhQo/bUau7
 yePtX182yD2RaWQ5qgs3ONqadV4CZkGz9O/dec1y5vX6DLqOSPr9bTPF1nP2MzT32Gxs
 8QTrtRCldGfEpxbPycDBdMZQ+/yGQtviEXD4MQaQN0QzY7z0AXo60/CPEfcsBNugoMHc
 x+2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=giGHKPUS
Subject: [Buildroot] [PATCH] package/libxmlb: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libxmlb/Config.in    | 18 ++++++++++++++++++
 package/libxmlb/libxmlb.hash |  4 ++++
 package/libxmlb/libxmlb.mk   | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/libxmlb/Config.in
 create mode 100644 package/libxmlb/libxmlb.hash
 create mode 100644 package/libxmlb/libxmlb.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff..276ad8a27a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3284,6 +3284,7 @@ F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
+F:	package/libxmlb/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
 F:	package/modem-manager/
diff --git a/package/Config.in b/package/Config.in
index 1935077f0f..02ed24c6b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1860,6 +1860,7 @@ menu "JSON/XML"
 	source "package/libroxml/Config.in"
 	source "package/libucl/Config.in"
 	source "package/libxml2/Config.in"
+	source "package/libxmlb/Config.in"
 	source "package/libxmlpp/Config.in"
 	source "package/libxmlrpc/Config.in"
 	source "package/libxslt/Config.in"
diff --git a/package/libxmlb/Config.in b/package/libxmlb/Config.in
new file mode 100644
index 0000000000..702cc3d6f2
--- /dev/null
+++ b/package/libxmlb/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBXMLB
+	bool "libxmlb"
+	depends on !BR2_STATIC_LIBS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSOUP
+	help
+	  The libxmlb library takes XML source, and converts it
+	  to a structured binary representation with a deduplicated
+	  string table where the strings have the NULs included.
+
+	  https://github.com/hughsie/libxmlb
+
+comment "libxmlb needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
new file mode 100644
index 0000000000..6f364d1e04
--- /dev/null
+++ b/package/libxmlb/libxmlb.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  7050a3e43c4e1f53020cfbdfcb6fd5dc664c6c240faceb5ae3c8830423918262  libxmlb-0.3.19.tar.gz
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
+
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
new file mode 100644
index 0000000000..1d5d339e4f
--- /dev/null
+++ b/package/libxmlb/libxmlb.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# libxmlb
+#
+################################################################################
+
+LIBXMLB_VERSION = 0.3.19
+LIBXMLB_SITE = $(call github,hughsie,libxmlb,$(LIBXMLB_VERSION))
+LIBXMLB_LICENSE = LGPL-2.1+
+LIBXMLB_LICENSE_FILES = LICENSE
+LIBXMLB_INSTALL_STAGING = YES
+LIBXMLB_DEPENDENCIES = libglib2
+LIBXMLB_CONF_OPTS = -Dgtkdoc=false -Dtests=false
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBXMLB_CONF_OPTS += -Dintrospection=true
+LIBXMLB_DEPENDENCIES += gobject-introspection
+else
+LIBXMLB_CONF_OPTS += -Dintrospection=false
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBXMLB_DEPENDENCIES += zstd
+LIBXMLB_CONF_OPTS += -Dzstd=enabled
+else
+LIBXMLB_CONF_OPTS += -Dzstd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBXMLB_DEPENDENCIES += xz
+LIBXMLB_CONF_OPTS += -Dlzma=enabled
+else
+LIBXMLB_CONF_OPTS += -Dlzma=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
