Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686B6C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA37481A9C;
	Tue, 25 Jul 2023 14:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA37481A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2ztkZvN3K3i; Tue, 25 Jul 2023 14:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D9E081A50;
	Tue, 25 Jul 2023 14:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D9E081A50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 879E91BF588
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B2C181A2B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B2C181A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QJ7gpDIxStG for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:49:55 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A47B81A16
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A47B81A16
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3466725f0beso31638245ab.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690296594; x=1690901394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oAPoQCZSBLYqQoOxKWiJJv6Tws1Df1LP6aIDd23qo04=;
 b=G8oc3/7gNIdLpZDLah4TXngseEFiy+hUufhnpieSxQhtHRJ2ZEhVyh6WsOUg2Q3Tr1
 EldbiaInG87aYEXFMJ0nVHQhg6YAl0iiX0lAwbvZPyfiuPA8AvRcvcr70LnD53mUEjsq
 sAdAtNtpsNEGFC+wuky8Csytm+xtpTuMLMF8hUjKloRecXftwJJ50TmdALJV/M8C6H/T
 UCsnGlmM7IoY0sgYmQBixDhaSr+Xh2B4bXhXMc9VITTWJr29f4owr/cajKAgNVqkrLCf
 bKJ9GjJggcwaOYgjdRU1KCFWDe43KTGRp9TirL5FtihKF3XkxoLXixt8egzqZtf0FfyT
 w0fw==
X-Gm-Message-State: ABy/qLaP4fWomNOvneGM9bk5LbrB4Z76w6YbT5qSJh1j39ZibjjVSoPm
 KBWbdaDkFRJZLHfO4exf2hsDNs1hf9w=
X-Google-Smtp-Source: APBJJlETGmUa2OMaaibv3zpi2+2MHp3nK8BtBmwfG2Esk0CzmviC3ETdEiSSoB5ZeW7PeK1V7ul/1w==
X-Received: by 2002:a05:6e02:13cf:b0:346:541c:1010 with SMTP id
 v15-20020a056e0213cf00b00346541c1010mr2623604ilj.18.1690296593979; 
 Tue, 25 Jul 2023 07:49:53 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 o6-20020a92d4c6000000b0034267d3fcc5sm3675651ilm.55.2023.07.25.07.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:49:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:49:51 -0600
Message-Id: <20230725144951.941225-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690296594; x=1690901394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oAPoQCZSBLYqQoOxKWiJJv6Tws1Df1LP6aIDd23qo04=;
 b=LagieWRvFfB7Y9noax28EgmT7HjipkXmpPv/j3HoAhBpHYrcEDYQhiWBUjRE1YxB+o
 txRX/+C3vMuG5KAFfJCjsIA7Q5AXj2nV0fgOcVmZvfetyQR82ZA+DW5P0KslNY/FZsoa
 FwVfLjw3PJ3AOdmEwOpz6NmlR7IY3AtEzWiB1tGLCNQU15zZgmi2DIFRumv5/JNo/wr0
 HIXUOq1l22kisJl2xclGbmOOPLJCmza10OFBo2zdYLKBIubFcYSPagF8jeQY/580aefG
 1wkI4x0mC/vDuIUi+60Xd8jhvxGLhT87E/BwVCG7CKDnKjURydstYJ4DkRP688Y93HUt
 4ztQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LagieWRv
Subject: [Buildroot] [PATCH 1/1] package/wayland-utils: bump to version 1.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ayland-info-Fix-build-without-libdrm.patch | 46 -------------------
 package/wayland-utils/wayland-utils.hash      |  8 ++--
 package/wayland-utils/wayland-utils.mk        |  2 +-
 3 files changed, 4 insertions(+), 52 deletions(-)
 delete mode 100644 package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch

diff --git a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch b/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
deleted file mode 100644
index 2d4591f785..0000000000
--- a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3657a11d45f133776b50c716d99f37965eb07ed1 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 14 Sep 2022 09:07:10 +0200
-Subject: [PATCH] wayland-info: Fix build without libdrm
-
-wayland-info can optionally use libdrm to provide a description of the
-dmabuf format modifiers.
-
-When not using libdrm however, the build fails because "dev_t" is not
-defined.
-
-The definition of "dev_t" comes from <sys/types.h> which is included
-from <libdrm.h>, which is not included without libdrm support, hence the
-build failure.
-
-Simply include <sys/types.h> unconditionally to make sure "dev_t" is
-defined regardless of libdrm support, to fix the build failure.
-
-Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
-Reviewed-by: Simon Ser <contact@emersion.fr>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
-(cherry picked from commit baa65ba9f62e6a05c32b9202b524158a21f24245)
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-3657a11d45f133776b50c716d99f37965eb07ed1]
----
- wayland-info/wayland-info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
-index 53cd04b..98ff205 100644
---- a/wayland-info/wayland-info.c
-+++ b/wayland-info/wayland-info.c
-@@ -34,6 +34,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <sys/mman.h>
-+#include <sys/types.h>
- 
- #include <wayland-client.h>
- #if HAVE_HUMAN_FORMAT_MODIFIER
--- 
-2.34.1
-
diff --git a/package/wayland-utils/wayland-utils.hash b/package/wayland-utils/wayland-utils.hash
index c9b16e0535..fd14b986bc 100644
--- a/package/wayland-utils/wayland-utils.hash
+++ b/package/wayland-utils/wayland-utils.hash
@@ -1,6 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-September/042399.html
-md5  1a398cbb75c3ac1ac231b2a8f84bd6d6  wayland-utils-1.1.0.tar.xz
-sha1  38e5c37f5b35b86a84289659b4b0796811eb66cd  wayland-utils-1.1.0.tar.xz
-sha256  9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a  wayland-utils-1.1.0.tar.xz
-sha512  5b841ecb9b534a9b353e104dda9410961495495380fa65e32ef40855750609b03942a87c2fd66339aab57c05b3b8699e2bee055cfd44151f9609a5f6c53349df  wayland-utils-1.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-June/042736.html
+sha256  d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4  wayland-utils-1.2.0.tar.xz
+sha512  dc69a2d88215b54486954bd9f6e91cd158b0c0b94dccd2c863477cf6b1e83a83db4466f0718aa7d2be4de8d06484c0672c79318bc5c2b1f082f893fe795c2c00  wayland-utils-1.2.0.tar.xz
 sha256  1eba39c11640014a5841dd3017e5245fc31f47e1cf43a3287a286dd6a8de8a1a  COPYING
diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
index bc648a6904..efeb7e57a8 100644
--- a/package/wayland-utils/wayland-utils.mk
+++ b/package/wayland-utils/wayland-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_UTILS_VERSION = 1.1.0
+WAYLAND_UTILS_VERSION = 1.2.0
 WAYLAND_UTILS_SITE = https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/$(WAYLAND_UTILS_VERSION)/downloads
 WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
 WAYLAND_UTILS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
