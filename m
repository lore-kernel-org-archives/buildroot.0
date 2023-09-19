Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00560CE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42DA141E61;
	Tue, 19 Sep 2023 19:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42DA141E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lpQ7MYcq11t; Tue, 19 Sep 2023 19:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4478C41E67;
	Tue, 19 Sep 2023 19:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4478C41E67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3441BF853
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62E7D6121E
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62E7D6121E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9SbBc3kxgMOL for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 19:38:01 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B08560FEB
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 19:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B08560FEB
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-404314388ceso64574055e9.2
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 12:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695152279; x=1695757079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6DEtYeMmBiOBW605T5HNYPvqPumQpMaUqSyTbs4+E44=;
 b=eEkQS5CR+I/3UJSKX+ALNqj3ifx5+Gw/k8JKOLp7LlSa67wYoC31fxzLh0eAHAUoH3
 rwHyqVdz23/lzcoy6QAM9om+ItTqBEU32MzZR4xgw9uYABxRaeh43lTPu4qwKBb82IZs
 2mdEdAzQSjCi7KLe095K7/eVo8j/NlcB0mDPlILFde+oEo1iUsYCX79hGkgd2ug+NcN3
 VGr0XjKUy9FhNCiPXqZbMnVfWVyWXkZyztpp71hQY0ezO/SAeRcYqgszLrMc9yD/hwWq
 5pAcBK9pxvNOXlv2kNgJeAtu+ExJHRC5OwzFPi8PPcnDkz7+3z+evATXxriY5qiaVJiv
 Sy9A==
X-Gm-Message-State: AOJu0YxsKB7Z8XwdKr2BCzl487Yj7jCRGt2xW1Dx91DomG+vK6GZapzN
 b/04FS6k+LUJ2BqY2kx4vldKV22fXLI=
X-Google-Smtp-Source: AGHT+IHV4E+o15cuGa3JBGh3gLOimaqs0I6WHjIdiFyFUXLAvUbEUvXWP7AZPsxiyzR17/MZLVBmaQ==
X-Received: by 2002:a05:600c:2483:b0:403:b86:f620 with SMTP id
 3-20020a05600c248300b004030b86f620mr630401wms.12.1695152278784; 
 Tue, 19 Sep 2023 12:37:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b0031fc9402b47sm16442917wrv.4.2023.09.19.12.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 12:37:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 21:37:54 +0200
Message-Id: <20230919193754.121091-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695152279; x=1695757079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6DEtYeMmBiOBW605T5HNYPvqPumQpMaUqSyTbs4+E44=;
 b=kL9poS+TSZbWOJZwyhzyb46sfDgQbIBhFsJqo7QrPce5uSqT24HFx4MMMZ1ezZwh1B
 u9JOIN+p2OQDd7L637mmVjOcoJXLti7BswbRB6rV/knzMATdiJx7S0y597OGIfhonoNl
 6L+Nat22Dq3zojj2UtRox0iS3U3WbKaDNg6xx3HPsUTX1jrMbgFxFOS11SDAO9g549um
 tbd6dK0832p0Jp2O6pkH2XLft9gza81kI2f4e8D/gFB/RKr8I2lCwV+exK3pRzgOjYX9
 hj1CNTtazjDaVI+CWTOA0SC8lGtpkQEuBOpFaJ+nwsF37KwmQrd7wnnW8rlodPpBf9W1
 22fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kL9poS+T
Subject: [Buildroot] [PATCH 1/1] package/vulkan-loader: fix x11 handling
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
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 6aa1bc31678ff9f8013084fda34b9f941cc63fc3:

In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.h:24,
                 from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.c:23:
/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/vulkan/vulkan.h:71:10: fatal error: X11/extensions/Xrandr.h: No such file or directory
   71 | #include <X11/extensions/Xrandr.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/55ddfd44393e3bcc2f25bad2f9ecb7e1b142a985

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vulkan-loader/Config.in        |  1 +
 package/vulkan-loader/vulkan-loader.mk | 15 +++++++++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
index 9c215dc9ce..1ea6c94505 100644
--- a/package/vulkan-loader/Config.in
+++ b/package/vulkan-loader/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_VULKAN_LOADER
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  The Khronos official Vulkan ICD desktop loader.
 
diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
index f6dd9d0ac3..b1545a4972 100644
--- a/package/vulkan-loader/vulkan-loader.mk
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -26,13 +26,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VULKAN_LOADER_DEPENDENCIES += libxcb
-VULKAN_LOADER_CONF_OPTS += \
-	-DBUILD_WSI_XCB_SUPPORT=ON \
-	-DBUILD_WSI_XLIB_SUPPORT=ON
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
 else
-VULKAN_LOADER_CONF_OPTS += \
-	-DBUILD_WSI_XCB_SUPPORT=OFF \
-	-DBUILD_WSI_XLIB_SUPPORT=OFF
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
+VULKAN_LOADER_DEPENDENCIES += xlib_libX11 xlib_libXrandr
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
