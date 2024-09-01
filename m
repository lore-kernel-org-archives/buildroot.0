Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3AFCD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5206981125;
	Sun,  1 Sep 2024 21:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwrVmgeWMlTO; Sun,  1 Sep 2024 21:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B42D81127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B42D81127;
	Sun,  1 Sep 2024 21:20:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BAD91BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C34810AA
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7H1IGAkazjgL for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 21:20:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B7A8810A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B7A8810A2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B7A8810A2
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 21:20:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42c5347b2f7so13987365e9.0
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 14:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725225640; x=1725830440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=47fQiArNokmEEBF94+MY8W8huK6W/vEVjneXIIs2iCU=;
 b=Wee80p0Alfkfyrw44cmgW7gwi0xFKVaUcm+3p9bimGKgJYVy49MV62EVmZhRWA9zm1
 nWFrgch5oZylcZqNPCBUU88xYbBzoZcWe5HjIMWF3lGXs3ipteqy9zwYcS809hErvE25
 EP9aJEKFsB44l7aWSrYgmFG/xA/ngcrCuxqv6k2JBbUiX1kwiV1cAPPj1fxfSa8wVgvn
 0MPgsqxtxIA11jb/oJwJx3d9jK/H0SAqAsjtva+ojtY9R7vBSTyFjwbsCpvK0tVp+5bL
 ko1lKDpPfKjIF0uyq+Z/8L4yqHt/UPWWDHMrDetPJ9QvYPxdrJTG907j08eHdDA518aE
 twmQ==
X-Gm-Message-State: AOJu0YyumTK3UeyJouXLl75zmjs1m2DUVdIhT8Y5SNSe3e5o0bmy/63f
 b1FX9KurrndyKTWXZLnI1jwXj+CIn0Y3NhdA6ZU6TWOq2R9rX7biDzMang==
X-Google-Smtp-Source: AGHT+IG9P6VEP9imD47U+HWOju66K717d+Cigau97CzHseDhqPMs1ji5R4dpzidypC6ZCKYNCn6JSA==
X-Received: by 2002:a05:6000:186e:b0:374:c92e:f6a3 with SMTP id
 ffacd0b85a97d-374c92ef910mr1401113f8f.14.1725225640028; 
 Sun, 01 Sep 2024 14:20:40 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4a5edsm9742102f8f.1.2024.09.01.14.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 14:20:39 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 23:20:36 +0200
Message-ID: <81f83aa43cb19570addc0ae0d9742b50fcb96795.1725225634.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725225634.git.yann.morin.1998@free.fr>
References: <cover.1725225634.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725225640; x=1725830440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47fQiArNokmEEBF94+MY8W8huK6W/vEVjneXIIs2iCU=;
 b=VVUXnCOtWkVl2lXaXSSf/BWN/RPcbeoXwle+QFbuDPxjQog53GyWjf949Of1DibbFJ
 qbHAhzNycE06EfowCRUuMqp6zc+eN4Fqjbdxj/hUaB+iYS8UMGCkQ5jKgdefjEBUc9FK
 TbWLs1FNmrjniIXynjZZ2Ym8p8b1+oCzVAyFQV8Vpv6BeZETAmpiCrnUOJH3BSpkKUai
 QtMGuK1vasOEAMmhrbVmowhl1u840LNpvmSWA+BCeDqA108q1qXd9CEbR0N7AnPQf5PE
 sAeLlXSMKA8JduGhbRc0wTmKXGgcTPOmfm6Ixkg3HpiLcerYhizoYeFBAbe/k3K6kPeD
 mp7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VVUXnCOt
Subject: [Buildroot] [PATCH 5/6 v3] package/python-gobject: bump to version
 3.48.2
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Current gobject-introspection releases work with musl, so relax the C
library requirement.

Also update the homepage, the old URL now links to the current one.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-gobject/Config.in           | 8 ++++----
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 3354535637..d9d73cc5e3 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -4,17 +4,17 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Python bindings for the GLib/GObject library
 
-	  https://wiki.gnome.org/action/show/Projects/PyGObject
+	  https://pygobject.gnome.org/
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "python-gobject needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 2fb9d38ab0..f3bb0a4610 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.42/pygobject-3.42.2.sha256sum
-sha256  ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957  pygobject-3.42.2.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.48/pygobject-3.48.2.sha256sum
+sha256  0794aeb4a9be31a092ac20621b5f54ec280f9185943d328b105cdae6298ad1a7  pygobject-3.48.2.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index a12ce5c107..a09ddb7e87 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.42
+PYTHON_GOBJECT_VERSION_MAJOR = 3.48
 PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
