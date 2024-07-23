Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963B3C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51EFF8127D;
	Tue, 23 Jul 2024 20:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zb8zN5Jz3QuZ; Tue, 23 Jul 2024 20:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E7381062
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E7381062;
	Tue, 23 Jul 2024 20:37:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3AE1BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39A0740104
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4ajISfdxiTj for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C982400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C982400F6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C982400F6
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:37:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so43026345e9.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721767060; x=1722371860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WV+cUbIHdX1VCMq/XssxszNJg16TpaLtAP+CivFzcoo=;
 b=EtzjrjkR2z1gaQZ3gZKGZH77oJyQ9+rf/NL0nvE8G5xyPCuKTgBa/7WE8QI5AM9W9O
 zd+OLh6wEBpbARUBV62G24ANwiB6SEsw9tIVo/SAmblJ2ASv3xF5Wr8Es4wkpw32iwBk
 K2mNrmnkHWsDx83BC3o45sbdkDTbuza0vtn47gfwkIiY0FZm2T2Y1nBAyPuLvaKHZ9lp
 ZnodCMBeNRtxoYFkZ6+qeYKCyUFKOPUWMRh/x6pC+IYuBRu6Eo4XfoUSwbOGJ2KhJgVQ
 ar77eFJqIXowPV41SwLr0i0MG5G2QHYRAKMw7qaBlYo7vxw4yuoZjpFVojZenpWpOeYX
 nweg==
X-Gm-Message-State: AOJu0YyswnblTPLG9v+tU8OSKnAzLejYrAvYPA8V9bIp/JAaCoa5Z2tF
 NqZqYPL6y6ZVaAyzlZ9wW1d/92f8jROjDbY6yeu5Y6oh7H1q/fJcI7Cfuw==
X-Google-Smtp-Source: AGHT+IGeXW6GLX1qIqqpCs+EXwTNb3ZV9F5BDksLp2Zy9ZPkYDla8Pw1/UnKF2bsol7E6wnJS/alqw==
X-Received: by 2002:a05:600c:198c:b0:426:6f81:d235 with SMTP id
 5b1f17b1804b1-427dc527e16mr79502945e9.15.1721767059904; 
 Tue, 23 Jul 2024 13:37:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f939ab53sm415835e9.29.2024.07.23.13.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 13:37:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 22:37:37 +0200
Message-ID: <20240723203737.643733-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721767060; x=1722371860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WV+cUbIHdX1VCMq/XssxszNJg16TpaLtAP+CivFzcoo=;
 b=Hc+QIAfmf+a2FHB7uyMwbImGIOwrbN0/LPBr8KSUEUYXk3V4gJc2HWsO1bmOowWpeA
 tjSqnZqSQVRntkXJlgEpvQzQWpErt7qMzXiEk+ZEhR/NRc+jeAbP+XtKzjzMKwI1H9t8
 A5MACDUIH61F7CXD1TCDgbAVnAyAz3qrQ7s8ejCNHHZ5uUcpuNgrFUtAl3PqV62cWhww
 GpqznQlwekvi3trlxPhM7LhBYeHDcrajO/PXCZw7+1SNZ2uVyjhsr+lFGTdQnmTd0VTs
 kauniEdqmeanQIeqK6DHxTls8XCTJ/72K2HxUIuvyyHn7NzLrlIf1YGa9YgOz0XvozCm
 ++jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hc+QIAfm
Subject: [Buildroot] [PATCH v2,1/1] package/libdex: needs ucontext
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libdex needs ucontext since its addition in commit
70319b47f646f74f407ed3355baf5b581a10518a:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: src/libdex-1.a.p/dex-fiber.c.o: in function `dex_fiber_context_init':
/home/autobuild/autobuild/instance-11/output-1/build/libdex-0.6.1/build/../src/dex-fiber-context-private.h:131:(.text+0x30c): undefined reference to `getcontext'

[...]

In file included from ../src/dex-fiber-private.h:34,
                 from ../src/dex-scheduler.c:25:
../src/dex-fiber-context-private.h: In function '_dex_fiber_context_makecontext':
../src/dex-fiber-context-private.h:108:3: error: implicit declaration of function 'makecontext' [-Werror=implicit-function-declaration]
  108 |   makecontext (ucontext,
      |   ^~~~~~~~~~~

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/5f23b0e41f2957b0562c5d168f35e42f13bdad0b
 - http://autobuild.buildroot.org/results/67d958e9a8e1dfb147ac7be4fcb74fcafbbce987

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix libucontext select

 package/libdex/Config.in | 10 ++++++++--
 package/libdex/libdex.mk |  5 +++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/libdex/Config.in b/package/libdex/Config.in
index f10bdac46f..5f94a79b73 100644
--- a/package/libdex/Config.in
+++ b/package/libdex/Config.in
@@ -3,7 +3,11 @@ config BR2_PACKAGE_LIBDEX
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBUCONTEXT if \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS && !BR2_TOOLCHAIN_HAS_UCONTEXT
 	help
 	  Dex provides Future-based programming for GLib-based
 	  applications. It both integrates with and brings new
@@ -12,6 +16,8 @@ config BR2_PACKAGE_LIBDEX
 
 	  https://gitlab.gnome.org/GNOME/libdex
 
-comment "libdex needs a toolchain w/ wchar, threads"
+comment "libdex needs a toolchain w/ wchar, threads, ucontext"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 7c652a0409..360b389255 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -22,6 +22,11 @@ LIBDEX_CONF_OPTS = \
 	-Deventfd=enabled \
 	-Dintrospection=disabled
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+LIBDEX_DEPENDENCIES += libucontext
+LIBDEX_LDFLAGS += $(TARGET_LDFLAGS) -lucontext
+endif
+
 ifeq ($(BR2_PACKAGE_LIBURING),y)
 LIBDEX_CONF_OPTS += -Dliburing=enabled
 LIBDEX_DEPENDENCIES += liburing
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
