Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FFECD128E
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 09:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 963C040B83;
	Sat, 30 Mar 2024 09:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKNNCEVSFNfh; Sat, 30 Mar 2024 09:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CAA40B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86CAA40B8C;
	Sat, 30 Mar 2024 09:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD5E1BF27C
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DEDB81DE0
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 09:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X64IITsXuDk1 for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 09:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A49481DBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A49481DBF
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A49481DBF
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:59:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4155bdc0bf5so642125e9.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711792780; x=1712397580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sj7LtJziDmGukt16DDiaB10qjOyZfmZIPNYyJ7OEoeg=;
 b=cWWLTEj1KYyQ6kj7wQ+gTTi3KKNV3gtqOsSNCXq2OcBFIeboFGC3fGQupvyNgYXMYg
 xu3VIYvlUUrU+l5K7qLElTFujaucupKDmuchtSLPoeK2qW64Mq0zTbiRAiUv2DBmaS/X
 rpWlkvk+/lNUvYOY+dU/UtHmY+IQmMr1U+JNfha0N00QvPBQ9d0ypP6mqeiJFPpagw8m
 mP5iMkU1SAje5AxYM1W58S84zisaIWjqAIRzIun0CXWAEsgBAHeoP/LnVkkkMq9gBAP4
 9YIxKg7wZRqG5CzGe0q1cZpTwXrTdWMwXzfQavEV1KRvImbOFL+bst7T8KiInagOWoDH
 1D+Q==
X-Gm-Message-State: AOJu0YzR1/J5e6cJ8R9Q27WLxIRe4kd0tpHa0qgn+6oWaPbVbYw9VAE5
 wyZPRdLKUp8Y+Fbk4KcmEXiirg5CUqrk+2QjM3iJmE2XtNjY4L/SBbGY5u7C
X-Google-Smtp-Source: AGHT+IFt666vPHXvypZCLedLU8iEHWwwP42sp9B2M40rfMrUzz//jPcO4UOdGYJCt3K4tVLb5i3U9A==
X-Received: by 2002:a05:600c:4f0c:b0:414:85f:1f72 with SMTP id
 l12-20020a05600c4f0c00b00414085f1f72mr2769012wmq.6.1711792780140; 
 Sat, 30 Mar 2024 02:59:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fs11-20020a05600c3f8b00b004146dd6bfe2sm7927042wmb.47.2024.03.30.02.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 02:59:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 10:59:33 +0100
Message-ID: <20240330095933.601540-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711792780; x=1712397580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sj7LtJziDmGukt16DDiaB10qjOyZfmZIPNYyJ7OEoeg=;
 b=Kp1/PfkO+/NJvT/tuFF6CbtXStG1afgsED398ViydMTveiQ4xGYKT6aOLfTGJONWdH
 cDO3Cpm9uAzSMZNPd2N1CW1xMclOvBKPqEHCrthEiOBB+81RIuVN9aKbImTePyCCLcgS
 mxj0ZnL8vSAii9OKkOeCUSLBBt0We9Tl8KtX4NEMEe+6JqN0oj6TTuRjOsMgfod0Yvc6
 n62mZf+NlEL5wmDuLU0FCP9qhiH80kkttmcbQFgBfgO7H7IPD+F3EkaWluiL38deB/BE
 WuMzKOLN4FYuSy009HYdLUYpphr5aIZZKBSj2376/rCIXE6J8E6nnx43/826Nd8jPEF0
 x9Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kp1/PfkO
Subject: [Buildroot] [PATCH 1/1] package/mdadm: bump to version 4.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lore.kernel.org/all/20240215183844.00003735@linux.intel.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 +++++++++++++++++++
 package/mdadm/mdadm.hash                      |  2 +-
 package/mdadm/mdadm.mk                        |  2 +-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch

diff --git a/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch b/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
new file mode 100644
index 0000000000..5c3d6e03b4
--- /dev/null
+++ b/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
@@ -0,0 +1,34 @@
+From 1750758c7ff526e3560433f6235e5cfa35cf646a Mon Sep 17 00:00:00 2001
+From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Date: Wed, 6 Mar 2024 15:50:55 +0100
+Subject: udev.c: Do not require libudev.h if DNO_LIBUDEV
+
+libudev may not be presented at all, do not require it.
+
+Reported-by: Boian Bonev <bbonev@ipacct.com>
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+
+Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=1750758c7ff526e3560433f6235e5cfa35cf646a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ udev.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/udev.c b/udev.c
+index bc4722b0..066e6ab1 100644
+--- a/udev.c
++++ b/udev.c
+@@ -26,7 +26,10 @@
+ #include	<signal.h>
+ #include	<limits.h>
+ #include	<syslog.h>
++
++#ifndef NO_LIBUDEV
+ #include	<libudev.h>
++#endif
+ 
+ static char *unblock_path;
+ 
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
index b9631a2aaa..84bae1aebf 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256  461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d  mdadm-4.2.tar.xz
+sha256  416727ae1f1080ea6e3090cea36dd076826fc369151e36ab736557ba92196f9f  mdadm-4.3.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index b54e34b230..c6178700ef 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDADM_VERSION = 4.2
+MDADM_VERSION = 4.3
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
