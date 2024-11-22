Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ABDE69185
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 18:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 949E4614C3;
	Fri, 22 Nov 2024 18:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3SwIoh5NgsE; Fri, 22 Nov 2024 18:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90206614C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90206614C5;
	Fri, 22 Nov 2024 18:25:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7A58E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A84EC614B8
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLABIIeoMuAv for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 18:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CA9E614C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CA9E614C3
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CA9E614C3
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:25:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A5696C001D
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:22:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1220DC0004;
 Fri, 22 Nov 2024 18:22:00 +0000 (UTC)
Date: Fri, 22 Nov 2024 19:21:59 +0100
MIME-Version: 1.0
Message-Id: <20241122-psplash_options-v1-1-b142ac91f53c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMbLQGcC/x3N2wqEIBAG4FeJuU5QW+jwKhEhNa4DkeJEFOG77
 7SXH/yHBxgzIcNQPZDxJKa4C0xdwRLc/kVFqxisth9jrFWJ0+Y4zDEdEmXlO/R92+qm1ytIK2X
 0dP0Xx0kciI+Y7/eglPIDibUA8HAAAAA=
X-Change-ID: 20241122-psplash_options-f8ef9770390d
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732299721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y0WcL5vKy3xoDMDJyzDzaiYy6ZRMIkual9Bn6lwTzYo=;
 b=d8dwBzu+/vL+F7BfCu7x6tH64wmJj9KzZRM1NNE1I15JlqkFCdLJW3G+iAiijmyt+KYYRU
 VHn14wULCsbaQxeXjodD1dzMB0SYUPcUEKv3Da9bi446Smb35YpOUU39WrylC/tUb+uIoj
 j9jahyUVoU4uUNBKbT4oA4+DmS0Gs0+H67wfJPe5jxUX5h6DUCIjKn7Yuwj6/qXA6PNoBh
 H4Wwe2poYL7SbinHTFKYlJpuk0hlHLH3+wKTixYmsY5nn9cBW/L2QhSIgRLh9L2RNkSl7A
 GHWo5Oo6vl9JnQc/lbF5NUzZyz18iWic4JQlUGrFychmXexHXq3//XJ5knfL5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d8dwBzu+
Subject: [Buildroot] [PATCH] package/psplash: add support for two configure
 options
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for two configure options:
  --disable-progress-bar, via BR2_PACKAGE_PSPLAH_PROGRESS_BAR
  --disable-startup-msg, via BR2_PACKAGE_PSPLASH_STARTUP_MSG

Both buildroot options will default to 'y' to be compatible with
the previous behaviour, since those were enable by default by
not specifying the disable config flag.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 package/psplash/Config.in  | 12 ++++++++++++
 package/psplash/psplash.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index da99b264e0458766f3c5840568acd7980d0ef313..6379c5537fa18612a3dda862995a9f9a857da121 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -35,6 +35,18 @@ config BR2_PACKAGE_PSPLASH_IMAGE
 	  Use a personalized png image as boot splash.
 	  Let it empty if you want to keep the psplash default image.
 
+config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
+	bool "enable progress bar"
+	default y
+	help
+	  Enable management of the progress bar via the "PROGRESS" command.
+
+config BR2_PACKAGE_PSPLASH_STARTUP_MSG
+       bool "enable startup message"
+       default y
+       help
+         Enable text banner output on startup.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 69f9bf386da0a6b3463a30b7b8a7b09ad9017819..f13f92d5875775aff0eafa8a4f11dc6c68bd0ce4 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -19,6 +19,18 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR), y)
+PSPLASH_CONF_OPTS +=
+else
+PSPLASH_CONF_OPTS += --disable-progress-bar
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG), y)
+PSPLASH_CONF_OPTS +=
+else
+PSPLASH_CONF_OPTS += --disable-startup-msg
+endif
+
 PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
 
 ifneq ($(PSPLASH_IMAGE),)

---
base-commit: 175dbdf3fc67775486ddf121b6deb651e2bf7c06
change-id: 20241122-psplash_options-f8ef9770390d

Best regards,
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
