Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89672CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F87D61514;
	Wed, 10 Sep 2025 21:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qItTFjuns2u8; Wed, 10 Sep 2025 21:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A80361527
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A80361527;
	Wed, 10 Sep 2025 21:33:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D412BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F54F611D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R83EmqSNZTpv for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0237614CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0237614CC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0237614CC
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4A8C3C8F1E0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21399606D4;
 Wed, 10 Sep 2025 21:33:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BFF6102F29DA; 
 Wed, 10 Sep 2025 23:33:17 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Takumi Takahashi <takumiiinn@gmail.com>
Date: Wed, 10 Sep 2025 23:32:16 +0200
Message-ID: <20250910213241.1529448-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539997; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=P3hkyurZmpbX0XgB2Y2D+XwE4mwp7hjsnnNMx94UNPI=;
 b=FW6IEyDGU0kyZ70LahJnHXsY0JgIhg/JRrPO99kXBrEti3ru51pJ8G0J3pJig3gq393Cla
 rq3lCAthpT83sJYaUCOLKQBtJ6bh4YXMJUn1EMzw9DReLeXxwSGHMMhTf6ypB+TYN4DIcm
 +KAQKgbbT8MISO9nec4JylyoEA5Cdur+1Zq1HmwCdjX/h4MXXLSP6DSxpROqrvqKLtx8ip
 3SExP75CZtxUZR2rpcf97M8ZgZ0FajDniMmFj2PoZOzvi19wPChWMgLgmR7QfS5rS3bs16
 ZfoE8kRZ/hfa1gLOZBMRLDmHla53VXIEArIWHlxFpDtQJoT7lpo/zKSaGN416Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FW6IEyDG
Subject: [Buildroot] [PATCH 08/23] package/libcanberra: remove optional
 dependency on libgtk2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to drop libgtk2, let's remove the optional dependency
of libcanberra to libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcanberra/libcanberra.mk | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
index 2505e58eb0..456d08563b 100644
--- a/package/libcanberra/libcanberra.mk
+++ b/package/libcanberra/libcanberra.mk
@@ -12,7 +12,12 @@ LIBCANBERRA_LICENSE_FILES = LGPL
 LIBCANBERRA_INSTALL_STAGING = YES
 
 LIBCANBERRA_DEPENDENCIES = host-pkgconf libtool libvorbis
-LIBCANBERRA_CONF_OPTS = --disable-oss --disable-null --disable-tdb --disable-lynx
+LIBCANBERRA_CONF_OPTS = \
+	--disable-oss \
+	--disable-null \
+	--disable-tdb \
+	--disable-lynx \
+	--disable-gtk
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCANBERRA_CONF_OPTS += --enable-udev
@@ -42,13 +47,6 @@ else
 LIBCANBERRA_CONF_OPTS += --disable-gstreamer
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-LIBCANBERRA_CONF_OPTS += --enable-gtk
-LIBCANBERRA_DEPENDENCIES += libgtk2
-else
-LIBCANBERRA_CONF_OPTS += --disable-gtk
-endif
-
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBCANBERRA_CONF_OPTS += --enable-gtk3
 LIBCANBERRA_DEPENDENCIES += libgtk3
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
