Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C21CC001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 12:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E47626121B;
	Wed,  2 Aug 2023 12:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47626121B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZhkvGWv9vtR; Wed,  2 Aug 2023 12:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0228C611E2;
	Wed,  2 Aug 2023 12:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0228C611E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 245D91BF98D
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E488210B
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E488210B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxamLBoG1SSi for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 12:02:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE921820C9
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 12:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE921820C9
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso62707155e9.2
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 05:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690977726; x=1691582526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTdPInsCzFE9OBKztPSUSx7eYiN2Mcj0LhSMYCfHaRc=;
 b=hyqPZhRLtcZIUY0xZiuctfUEP2G4I3XNTyxgPCj6OIznlaSSUqUGA4cvwt6quHXyfb
 gU4+ZXUMdwA+S1L1LbGhyW1OmGTNb3El/hpf/EeZbXP7DBjtHuHFfxCmNXpmWuMssfSy
 M00ntMp9Z5WLacQ0+v5m/0uz7ueDdpThORrUuofWg1bZeX1EnT/43DD/KnqMu5mjQOGO
 kYxjQAjpstpz0IxIK2TCnXPNg26eiE0yUMEIaTdf/Kh4hMy9P99x0GFpxPNv/kRCTP6Y
 t78JIq9W6niBhOGcmQ2laNVrD7N362hRYa5j6yGOTqtsGoUb5ifLYbZgcRjZ1uuRFIjo
 kdcQ==
X-Gm-Message-State: ABy/qLabmOyFc1iSYvIlsjmWRJWcvAXFwNdZPWm5TgP84vIdSOhhXd/B
 2eSSKVBVaTt+/wbK3IBWLZhZV9WF/Z5B0UuaxvY=
X-Google-Smtp-Source: APBJJlFhEAXjMDEXraWOvIU8I//hcP9p64qvNmtCbLv9ic9tjd44Ky2pPQwC7JpjU+8jhjTgOPVPig==
X-Received: by 2002:a1c:7c18:0:b0:3f9:c0f2:e1a4 with SMTP id
 x24-20020a1c7c18000000b003f9c0f2e1a4mr4431999wmc.34.1690977726259; 
 Wed, 02 Aug 2023 05:02:06 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a7bce97000000b003fe20533a1esm1501873wmj.44.2023.08.02.05.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 05:02:06 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 14:01:49 +0200
Message-Id: <20230802120150.564860-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802120150.564860-1-thomas@devoogdt.com>
References: <20230802120150.564860-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/webkitgtk: add http/2 support by
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
  https://webkitgtk.org/2021/06/08/webkitgtk2.33.2-released.html
  "HTTP/2 support when building with libsoup3."

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: no change
---
 package/webkitgtk/Config.in    | 10 +++++-----
 package/webkitgtk/webkitgtk.mk |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 23c0bf41db..6835467c46 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -31,9 +31,9 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	depends on BR2_USE_WCHAR # icu, libsoup
+	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
@@ -44,7 +44,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
@@ -82,9 +82,9 @@ comment "sandboxing support needs a toolchain w/ headers >= 3.12"
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
-	depends on !BR2_STATIC_LIBS # libsoup -> glib-networking, gnutls
+	depends on !BR2_STATIC_LIBS # libsoup3 -> glib-networking, gnutls
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
-	select BR2_PACKAGE_LIBSOUP_SSL
+	select BR2_PACKAGE_LIBSOUP3_SSL
 	help
 	  Enable HTTPS protocol support.
 
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 56277a0a0a..f578868e52 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
-	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
+	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup3 \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
@@ -27,7 +27,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_AVIF=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
-	-DUSE_SOUP2=ON \
 	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
