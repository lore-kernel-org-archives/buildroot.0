Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA53C25B74
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 07:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82B260689;
	Thu,  9 May 2024 07:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yb9rEUC5r7wc; Thu,  9 May 2024 07:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A410C606A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A410C606A8;
	Thu,  9 May 2024 07:49:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 032B01BF3C0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 07:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E167841958
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 07:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeTJlkzHr3O7 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 07:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5CD540A43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5CD540A43
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5CD540A43
 for <buildroot@buildroot.org>; Thu,  9 May 2024 07:49:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34db9a38755so485239f8f.1
 for <buildroot@buildroot.org>; Thu, 09 May 2024 00:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715240977; x=1715845777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/uWUU40vfWd5qW/7QZ5rkyyNGP3veA1S4WczRTD37ck=;
 b=X/V8nyP0yEVavhJouytY+tVQs7aKrOj7pHpHZSNgMZQXvaP6DwCcNS8ng46NjTpJka
 N3pfP1rd2FWcdcKIu4oTx+oA+irDn3PqaKNyU8tH29xbAnocOn/mXfVMcDLO91yqpeq4
 w1iQ812vly8sgx07a9+EaJmAf68CRaSQQON1Xmv3/bbpYj0m0xugYEwtHYAvggbtDOGe
 gllgeUfunsUJPWA2DDN+h1/BWHAKN0KkY8eg01ObumDWfDfRiI+2Myahyi1PMxF+2mQ+
 mh0uuK9/z3bNt2JwXCgc2xs521wnZ6YMov9MH+YuJBV1ZU7fMkzyxJ6ah8fMKcQ3SNsr
 MODg==
X-Gm-Message-State: AOJu0Yys9x5Deevqor3posLx/eEiZ0fhd6v/bjqUUZSFmlxNtO4cOlgS
 UwJWvd3AEjaPZfLAai92tIu8bWXQOdvFHdgYiqEKMRam0FwL400Xg0WfRQ==
X-Google-Smtp-Source: AGHT+IFGPlxUmZS3KoGZ9lUVZIVr7AXZn9O3lcmhL9/jWx4ikhlwpVXiA/FGtS9zTI/1X+evFLKYtw==
X-Received: by 2002:adf:a4da:0:b0:346:1443:27ea with SMTP id
 ffacd0b85a97d-34fca80e035mr4470788f8f.68.1715240976949; 
 Thu, 09 May 2024 00:49:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a77easm962444f8f.53.2024.05.09.00.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 00:49:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 May 2024 09:49:32 +0200
Message-ID: <20240509074932.4786-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715240977; x=1715845777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/uWUU40vfWd5qW/7QZ5rkyyNGP3veA1S4WczRTD37ck=;
 b=COx838BK2SQIX0Qc4I8zBtHzaPLGEX9okwDlflagla0hYj34FmCysXC+axJ3Awl+sr
 ahOhyx4vz8L8I18qAu60vYMKhdtV09kYTwsNupyccrwBW5nMYSzsmCzbDAgdDV9xWhs9
 zQmsN8ScDIx9Dwo6VhvewkKcwLx3jDvC4TuhEyUK0plGf6u7IB2jml7G7Fb7P0t0464F
 oOgTUvAtLwWIzqa3TU469GAmrtyzLfdktTozIXFPhN5e5JXnqRY5sx5qPm4EjVuoxsBM
 zFUYRtORVvGmIbVnHrLqGB3NyZVucj2QnFLfgCAO8Nt1dmKaFp9IxWMERdk32b+G73KI
 x3KA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=COx838BK
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix sixaxis build
 without tools
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 5.75 in
commit b890206876588ed0d16187abf49d35a45177cc3d and
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9f71892b63f6b65dab874a633d88ae2dcad93a16:

/home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: plugins/bluetoothd-sixaxis.o: in function `sixaxis_init':
sixaxis.c:(.text.sixaxis_init+0x23): undefined reference to `udev_new'

Fixes: b890206876588ed0d16187abf49d35a45177cc3d
 - http://autobuild.buildroot.org/results/c337d0f473c5fbb3e6cda1317ba06f5e2b16a43e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e.ac-fix-sixaxis-build-without-tools.patch | 35 +++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch

diff --git a/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch b/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch
new file mode 100644
index 0000000000..1e0e34cb8f
--- /dev/null
+++ b/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch
@@ -0,0 +1,35 @@
+From f4795bf64dbf8778fc765b7dad1b1bfb365b48d7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 8 May 2024 19:54:16 +0200
+Subject: configure.ac: fix sixaxis build without tools
+
+Fix the following build failure with --enable-sixaxis --enable-udev
+--disable-tools raised since version 5.73 and
+9f71892b63f6b65dab874a633d88ae2dcad93a16:
+
+sixaxis.c:(.text.sixaxis_init+0x23): undefined reference to `udev_new'
+
+Fixes: http://autobuild.buildroot.org/results/c337d0f473c5fbb3e6cda1317ba06f5e2b16a43e
+
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=f4795bf64dbf8778fc765b7dad1b1bfb365b48d7
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9dea70ddc1..8b3cdb4e8f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -226,7 +226,7 @@ AM_CONDITIONAL(MONITOR, test "${enable_monitor}" != "no")
+ 
+ AC_ARG_ENABLE(udev, AS_HELP_STRING([--disable-udev],
+ 		[disable udev device support]), [enable_udev=${enableval}])
+-if (test "${enable_tools}" != "no" && test "${enable_udev}" != "no"); then
++if (test "${enable_udev}" != "no"); then
+ 	PKG_CHECK_MODULES(UDEV, libudev >= 196)
+ 	AC_DEFINE(HAVE_UDEV, 1, [Define to 1 if udev is required])
+ fi
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 26f0f4afd4..d386ad57f0 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,6 +9,7 @@ BLUEZ5_UTILS_VERSION = 5.75
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 # 0001-configure.ac-Fix-disable-cups.patch
+# 0002-configure.ac-fix-sixaxis-build-without-tools.patch
 BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
