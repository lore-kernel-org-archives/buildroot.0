Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53954C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 14:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D2481331;
	Mon,  7 Aug 2023 14:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D2481331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSd5aoQ2g3xH; Mon,  7 Aug 2023 14:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B95A81C56;
	Mon,  7 Aug 2023 14:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B95A81C56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 491741BF280
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 14:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D16260F03
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 14:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D16260F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMX64mAyrvHm for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 14:59:02 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7437F60C24
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 14:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7437F60C24
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-307d20548adso3516968f8f.0
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 07:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691420340; x=1692025140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mC46yoZffZrR4zQ5OA2P3kyo7aDNaGo11pzj6snObfQ=;
 b=SyB5LObs91+XJ+mSQZKdsvpbnjLwrV5gbLbFX+0hYlyylBRkvOxo8YWUhBhFYFm2mi
 CtxTwCMV+pBDVA3D6VKrz3eGSsw+u2Py3LK8RYKCyezZNB9QVtynBs90a04e5iAhyi0K
 sl3rnuRZ/+8M1gC5m5MNBaE5krFSR7+8I9Ekvmx4dlu4ow2u0pG1bLaiFcPYpApWpTPH
 +cuyZ9MMHUg4sHFhnSsHrqsAxW0USfZKZGDInaGBFt7qbPcgZtcVaAQYnQXfPpSJNv0/
 /ol+gYKT4DRj4Y125L7X0b+zJUm+utc4qdh/IahTG6JU6xl6qhFZOx1+8rYzvC4xbYgV
 +eSw==
X-Gm-Message-State: AOJu0Yx7ere9tWXJzbnK+/UpG93qROWwDaRt+LZsbzFEmNNIqf0n15SM
 sFUPN/Ohh27DRgQHTwcueck05UQBAYm2CA==
X-Google-Smtp-Source: AGHT+IFaf73DEPyPx2/zoeWeUE5WiUz4pM3LziQ9BSg/NZTMLXjfKlGFHihVhhyCfyAR6HGLYubpxQ==
X-Received: by 2002:a5d:51c5:0:b0:315:adf3:67db with SMTP id
 n5-20020a5d51c5000000b00315adf367dbmr5746844wrv.59.1691420339832; 
 Mon, 07 Aug 2023 07:58:59 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 r2-20020a5d4942000000b003063a92bbf5sm10784845wrs.70.2023.08.07.07.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:58:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 16:58:39 +0200
Message-ID: <20230807145839.2375839-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
References: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691420340; x=1692025140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mC46yoZffZrR4zQ5OA2P3kyo7aDNaGo11pzj6snObfQ=;
 b=au4x6N4dJneowoIRYHZcK792oThG5J46Iz+4i95aakbDZVdy3aCXN+UY4BtM5tXBoi
 1Ba9r0W3CeDy92oe0Su7jkHCpepR5Hf1bvdLfGFYfpOQ8K+CffhzuB1qCO+Mt7+v+HsH
 3pt454DWlQOgWUYgdfG4tQEGLR8htjAY5KS4n+jZGPOG1FDHJG1nMfIvyu9CgaJYpVNs
 i5bWVCw0fbv1vHRIQZPUMaC7r+gC+fOPO54Symhn6MYlmqEEHNA6Zh43m6wpwck+301L
 fRpobWjO2om4AACp/PyKDLBCcQuY4o1VXA48X2EfShLKCbqcwVpuPOy5Xl2cNx733Xj2
 ksZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=au4x6N4d
Subject: [Buildroot] [PATCH v1 3/3 next] package/qt6/qt6base: use the
 CMAKE_NINJA flag
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
to specify what cmake backend to use, instead of special-coding it's use.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/qt6/qt6base/qt6base.mk | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index e6cf4f14bb..4a01bb17b2 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -8,6 +8,8 @@ QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 
+QT6BASE_CMAKE_BACKEND = ninja
+
 QT6BASE_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \
@@ -29,7 +31,6 @@ QT6BASE_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6BASE_DEPENDENCIES = \
-	host-ninja \
 	host-qt6base \
 	double-conversion \
 	libb2 \
@@ -38,7 +39,6 @@ QT6BASE_DEPENDENCIES = \
 QT6BASE_INSTALL_STAGING = YES
 
 QT6BASE_CONF_OPTS = \
-	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
@@ -76,26 +76,12 @@ QT6BASE_CONF_OPTS += \
 	-DFEATURE_avx512vl=OFF \
 	-DFEATURE_vaes=OFF
 
-define QT6BASE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
-endef
-
-define QT6BASE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR)
-endef
-
-define QT6BASE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR)
-endef
-
 HOST_QT6BASE_DEPENDENCIES = \
-	host-ninja \
 	host-double-conversion \
 	host-libb2 \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-GNinja \
 	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
@@ -110,14 +96,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
-define HOST_QT6BASE_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(BR2_CMAKE) --build $(HOST_QT6BASE_BUILDDIR)
-endef
-
-define HOST_QT6BASE_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
-endef
-
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
