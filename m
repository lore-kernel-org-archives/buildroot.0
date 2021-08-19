Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1ACC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 17:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F9861075
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 17:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21F9861075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAED8193E;
	Thu, 19 Aug 2021 17:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPmTDM3qC3YL; Thu, 19 Aug 2021 17:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FD828195C;
	Thu, 19 Aug 2021 17:22:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C59BD1BF31A
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 17:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B17C6613CC
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 17:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcylvzLFs65P for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 17:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5FDE613C5
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 17:22:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f5so10149284wrm.13
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 10:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IqBTl0GrSLw9Pu2u8Wfalq4+wVCZbiGfjpkDuMSQzFg=;
 b=phQmGhYLn5KsboKlfUGZGHOA2Z0gXV+NbgYEbAfHnC9jOY4MKmmEs6qSjJvwKTqnKU
 Yd1Aqh7PI3mjofQNtmM2KCe33lzT6aaysBbqBLpHZ+79mCzEAz5RC1Y3Lpu53t7BRzZg
 s+EWUEpAhLMKR4Y6Izi/L3YCi4CQrXCFeXQ9p5XVPxQCwZkTapL/5Cbn0K+k3d6OObGE
 Lv8vfGKXT0bZ7jNZF5WQmt2brjfQ0pH/9x2tgfX3s5uHPd1c44ayy33u3LQdQxiOeNQG
 RzuotXyp+Ehpavo04u8i0W4w5Mx9Dx2mkCCCTRSQFSY7ZFZO+BCHsBqJD7xmZUb2RSHm
 lyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IqBTl0GrSLw9Pu2u8Wfalq4+wVCZbiGfjpkDuMSQzFg=;
 b=Kf87pmUHhboRaCdV1rQQZLGUvcGp9Wp41Ts6Ch/coprMKV+yc5G5ANir9wwMM+AtLF
 4PjfmhKS7jGGdlXJsTOFyDdyvFj+zybofGAExpvm8MyU9KaTM67TPGeRTnEmqPyjgv5z
 S18YxPkAqqaWhowQG5wq9ls+82OOz2VsNWH4jgoUmeLNeSnXiafaSDjydqlMmt97K5Qy
 WzHa7mhNqUwuSJhPLOtcG2yVWTTLuCl+dwp4WP9zN3R3MQerW7bfhc1UG+5kTV0ORb+m
 5ma4bourkW4k3xjxhVCB+/9Fx2Kujpdso02qxadrbtEGDctYGLfP5tqzmEM8r4ZSaGYP
 8Yrw==
X-Gm-Message-State: AOAM531t1wV3+3bC3Im49Iun2NcpInkTVOpxthWaW0ha8EfRpe8V8naM
 fPrmJhRu5xzGvvW2FjgTMp2CNwsQsVYIAA==
X-Google-Smtp-Source: ABdhPJxiJP27I4vMdwuOqWZSLeqFfA0AdGvxqJtJpTOocSKjAaC727zOmczZ2wRGUl+VEnARBzLIIw==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id
 r13mr5155907wru.230.1629393746736; 
 Thu, 19 Aug 2021 10:22:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id v1sm3366526wrt.93.2021.08.19.10.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:22:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 19:21:54 +0200
Message-Id: <20210819172154.7575-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nvidia-driver: fix build without
 X.org drivers
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure without BR2_PACKAGE_NVIDIA_DRIVER_XORG
raised since commit 9cda982855315d683d4880e6bb2a129133ea7213:

ln: failed to create symbolic link '/tmp/instance-0/output-1/target/usr/lib/xorg/modules/extensions/libglx.so': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/c2e7a826c105363309f70a3fcfe28bd53efcb94a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nvidia-driver/nvidia-driver.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 7e89c1ab01..54c2aa46d8 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -96,6 +96,12 @@ NVIDIA_DRIVER_LIBS += \
 	nvidia_drv.so:xorg/modules/drivers/ \
 	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
 
+# libglx needs a symlink according to the driver README. It has no SONAME
+define NVIDIA_DRIVER_SYMLINK_LIBGLX
+	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
+		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
+endef
+
 endif # X drivers
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
@@ -187,12 +193,6 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
 endef
 
-# libglx needs a symlink according to the driver README. It has no SONAME
-define NVIDIA_DRIVER_SYMLINK_LIBGLX
-	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
-		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
-endef
-
 # For target, install libraries and X.org modules
 define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
