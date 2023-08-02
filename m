Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D827C00528
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 12:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE71F6117A;
	Wed,  2 Aug 2023 12:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE71F6117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPi9t8NuGLZX; Wed,  2 Aug 2023 12:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A4B61229;
	Wed,  2 Aug 2023 12:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A4B61229
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62DB11BF343
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151488209C
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151488209C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id il_SadmqcJhL for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 12:02:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22F4B81096
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 12:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F4B81096
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-307d20548adso5994542f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 05:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690977727; x=1691582527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NUyOjpugI1lhnOK8FLj2KBeGW9qbmeeW5u6eW7xCa14=;
 b=QNgxvx4pvTuUD1WVrGFW0qIcuqj4PADkz3UoMujbeWBJCSTABgtimVPZRT7TFvdn8P
 vuNP7EgXmenMQWJ5qQXlWJMUqfaGA+kdbg2iUJ7UH2CcBzdY1V6zu5jg35ZTByvqtPsi
 3dILm0O2uzpxKEeG6q0rrKlwRMxwen2whkg/UwORY6IEO6YnYFavsxutMDTcZjAYnyMm
 opOnBkDYiE2Oz3FWhr7DOkkEvyB7JHjrzuUuYf9mufRO48giXs7bKJrREJgZn0lIkMJP
 PQLkIRlDIUGGPeIQ1cELSmz/TTe9K1vmLk93AEaMaqim2Xpz7MLDESp5DZl9UPBKr3XE
 j7ug==
X-Gm-Message-State: ABy/qLZPWQtPUPjQLq8kp09zE4knw4ujGq0msXIEEz6eh1dVDxZI58Fc
 ym3ZiWsMbW7nMV8ZfYvh/6wdDwyuQan5BSudWGI=
X-Google-Smtp-Source: APBJJlHH62+0RHCIQ6dECLLmJjTQRVK/A6I5PfjFnausx3sGpHy1BGaE4MXhYYHAsTbODv+UeSAuiA==
X-Received: by 2002:a5d:4d09:0:b0:317:9537:d746 with SMTP id
 z9-20020a5d4d09000000b003179537d746mr4277046wrt.2.1690977727431; 
 Wed, 02 Aug 2023 05:02:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a7bce97000000b003fe20533a1esm1501873wmj.44.2023.08.02.05.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 05:02:07 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 14:01:50 +0200
Message-Id: <20230802120150.564860-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802120150.564860-1-thomas@devoogdt.com>
References: <20230802120150.564860-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/wpewebkit: add http/2 support by
 using libsoup3
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support added in 2.33.2:
  https://wpewebkit.org/release/wpewebkit-2.33.2.html
  "HTTP/2 support when building with libsoup3."

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: fix git message typo
---
 package/wpewebkit/Config.in    | 6 +++---
 package/wpewebkit/wpewebkit.mk | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 7a8dc557c3..f1d38c7cad 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -36,9 +36,9 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	depends on BR2_USE_WCHAR # icu, libsoup
+	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
@@ -51,7 +51,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_OPENJPEG
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index c13a7201e6..8b5de00f07 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -15,7 +15,7 @@ WPEWEBKIT_LICENSE_FILES = \
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
-	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
+	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
 WPEWEBKIT_CONF_OPTS = \
@@ -26,8 +26,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
 	-DENABLE_WEB_RTC=OFF \
-	-DUSE_AVIF=OFF \
-	-DUSE_SOUP2=ON
+	-DUSE_AVIF=OFF
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
 WPEWEBKIT_CONF_OPTS += \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
