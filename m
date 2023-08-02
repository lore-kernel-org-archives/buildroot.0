Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49109C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 11:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8609A60D75;
	Wed,  2 Aug 2023 11:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8609A60D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dbKpjCYUXZ6; Wed,  2 Aug 2023 11:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1BC60784;
	Wed,  2 Aug 2023 11:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1BC60784
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54E741BF98D
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83FF94051D
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83FF94051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eoy6Nkj1Tfk1 for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 11:58:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EAD04031C
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 11:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EAD04031C
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3128fcd58f3so6828540f8f.1
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 04:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690977501; x=1691582301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1W0prdfT1AAOdtwMiw+GQIRkBtviud4VAuWDea/QR2I=;
 b=df/R6Se67aUkHbwWTZOMjE1iwgmgRItOEtNpubdEp+92sYFhuj1ibCRGKNr2INegYV
 LLy9ZAVDiHjczpmmRyerF32SSrMLKPRIBvq7BJdbfZKTmn/3iPS8eYvpzi8hBf2ZpYAp
 k/i1/mU+Hs9/AdPE7Jd1NQnEEHK5Xzwsj/RZUBgF/Om9X+5j/dtFgfx+Nmzv7hh7GcPg
 njadOzAhPWob/f1u+rXbBD8deHBO8KvPf/iAQtFP/ZPqhJJiMelaMHJm+X+o73gWF2pM
 n5wlt3HmDIQUiv8QitnmvLl11u7gbDrBwfqncrS6ysbRgmeclPcZe5UVCN7QeEY0gC0T
 RS9g==
X-Gm-Message-State: ABy/qLbG9Sq0oMIB0wB2qWR6E2efrdyTdRFLlqhgoyJFKW9RSOqkUSDB
 OrLQEx/GhhDpozD0ZkpP0OhFNCcZYAtImF96J4E=
X-Google-Smtp-Source: APBJJlHmHkOVLF/S7Hrskli1GFEd33M2UX41+ufs9IH7VxRV8gozr1cnm/B7Wpt4Cskl4N4aVeMqwQ==
X-Received: by 2002:a5d:66cf:0:b0:315:ac1b:91e with SMTP id
 k15-20020a5d66cf000000b00315ac1b091emr4884897wrw.53.1690977501301; 
 Wed, 02 Aug 2023 04:58:21 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4f12000000b0030647449730sm18903863wru.74.2023.08.02.04.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 04:58:21 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 13:58:10 +0200
Message-Id: <20230802115811.501698-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802115811.501698-1-thomas@devoogdt.com>
References: <20230802115811.501698-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/3] package/webkitgtk: add http/2 support by
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
