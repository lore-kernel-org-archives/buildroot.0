Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB4BC2BA18
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 12:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED36284721;
	Thu, 20 Jun 2024 12:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4_wJvkHDST8; Thu, 20 Jun 2024 12:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE1A184722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE1A184722;
	Thu, 20 Jun 2024 12:51:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 342F01BF573
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 12:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F75F84722
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 12:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X47dVsiwS-mx for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 12:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4078284721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4078284721
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4078284721
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 12:51:48 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4647EA4C;
 Thu, 20 Jun 2024 14:51:26 +0200 (CEST)
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 13:51:33 +0100
Message-Id: <20240620125133.1593259-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1718887886;
 bh=/d1fSdExQA/eE6sAz0m1am7tfSFmYIYb6C+dFd0hCwk=;
 h=From:To:Cc:Subject:Date:From;
 b=iMv/qjowN9ksApGjqsp+CMb1kdEW7BCZ16LEY+3rKK2/a9EU1ghaVp833IXlhllXt
 y2eNr+uUDZ7c3UxhZ4IoXabGdd/9a2gMWwAvr59h1oI8n1aYRBj/AV/3HjhN8EaXiR
 vc29lW6+4rCt7LI5yG1/CDgRTZm7GUgCXbNu0+IU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=iMv/qjow
Subject: [Buildroot] [PATCH] package/libcamera: Enable python bindings
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since libcamera commit f513fd70ba1a ("subprojects: Drop leftovers of
pybind11"), merged before libcamera v0.1.0, libcamera has no longer
relied on an external subproject branch of pybind to build the python
bindings.

Enable python bindings in libcamera when Python3 is selected in the
configuration, by also bringing in pybind as required and enabling the
option within the libcamera meson setup stage.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 package/libcamera/Config.in    | 1 +
 package/libcamera/libcamera.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index e84b8d342eea..2368a5b8008c 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -15,6 +15,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
+	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
 	help
 	  libcamera provides a software stack to support
 	  complex devices that need heavy hardware image
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index dfcd340b75a0..50429a1df9ce 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -19,7 +19,6 @@ LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
 	-Dtest=false \
-	-Dpycamera=disabled \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
@@ -77,6 +76,13 @@ LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
 LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
+LIBCAMERA_DEPENDENCIES += python3 python-pybind
+LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
+else
+LIBCAMERA_CONF_OPTS += -Dpycamera=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
 LIBCAMERA_CONF_OPTS += -Dqcam=enabled
 LIBCAMERA_DEPENDENCIES += qt5base
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
