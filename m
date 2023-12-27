Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B1C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 10:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3DD781E6D;
	Wed, 27 Dec 2023 10:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DD781E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pq2zwNBdelZk; Wed, 27 Dec 2023 10:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0967D81E65;
	Wed, 27 Dec 2023 10:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0967D81E65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E30971BF263
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 10:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB97481E65
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 10:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB97481E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4B7uytxStqH for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 10:02:07 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86BD581E64
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 10:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BD581E64
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336897b6bd6so4954325f8f.2
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 02:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703671324; x=1704276124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t+fC2HhnZswK4pp01nYwlIgIpI2XaDANy/kvObcSCf0=;
 b=Q0oonR4i2Zk9ZJYIhWm6jKN8Gw7kBdYGBtMpRQokbw0S3ghU4+MSIzGRNw2ogQGbsG
 qmUbYJ6br56piZFLoEi9wMzzQM3o6EyfIHaOPC/5SY/XcroZ/rXtkDo8DRhPMdQroNV1
 fHfY+YvtlX9ctom7rW2jh7AAZwQDvJOIfkWw6vSVIx0dIxwsP3gZjzIhMNyCXhKFY0Of
 ZYg6tP2E9f9JXlOyHE0u041LlR0mH9BXlXDNgcF7sfRRmqBwRIccty98TBsb14XIqRaT
 +e2BNxyhICUfAFPFbjFoeItCu0MwM1IDj/57XlYIcbW+7eY0fxp6kR0tXRcwm4A8MX87
 oNwA==
X-Gm-Message-State: AOJu0Yxmc77cZs92KLSHuAlLwE77UG5D/o+f8IzA8bVPJq480TrRzrC0
 Z8SJHqAjrbnpbLzzAsbe8NLMtJhMdSE=
X-Google-Smtp-Source: AGHT+IEAJ6nL6QNNm/r+6+cbn3NxVq5G8apY2kbhx89ygPM8vYSD7g+7CzKqo7TNWI05bFD80fl0Kg==
X-Received: by 2002:a5d:5711:0:b0:336:4aa6:ff38 with SMTP id
 a17-20020a5d5711000000b003364aa6ff38mr4445852wrv.121.1703671324303; 
 Wed, 27 Dec 2023 02:02:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bl13-20020adfe24d000000b003365fcc1846sm14423547wrb.52.2023.12.27.02.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 02:02:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 11:01:57 +0100
Message-ID: <20231227100158.124316-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703671324; x=1704276124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t+fC2HhnZswK4pp01nYwlIgIpI2XaDANy/kvObcSCf0=;
 b=faZ3k69oYcMuIBVBioy2kAuNXM9sSdZCTO+2l/PoBEP1eZkiSwKOrcACAWSTrdBHf5
 E+rCL5g/oETc4PIB8C9+mKmcerWdYoZKIJrNTSVb3wET6fB/1Ct4iCra+tuT9foLbXUH
 pgHsGaakmkFkdg/KiQ5G2C1tRMUSAnbCHFWPTbJd3WAZfflsfkPmYcfdIbKH0Ir6SEUM
 Da2kDP4qYsfHssql8cljfSih4I2mNt1OxbtjJ3NBkSx4WHCx+9EbDKuEgLN4GIhryCne
 Xp0oj7Bjk0hHPL2BBy5CTE4On64DktkYUkwEhkLmaReyocFj20eLlIcE+tiaZXefdDSj
 uoSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=faZ3k69o
Subject: [Buildroot] [PATCH 1/2] package/gssdp: bump to version 1.6.3
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
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- libsoup has been replaced by libsoup3 with
  https://gitlab.gnome.org/GNOME/gssdp/-/commit/e223e6f75e370c3d9b2b402586521fe005f1a0da
- Disable manpages which are enabled by default since their addition:
  https://gitlab.gnome.org/GNOME/gssdp/-/commit/1970906319eefa0bf48553e60ee67b5a75b9e1c5

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.6.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gssdp/Config.in  | 8 ++++----
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 9 +++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
index 80c5edfffc..5a9317f486 100644
--- a/package/gssdp/Config.in
+++ b/package/gssdp/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_GSSDP
 	bool "gssdp"
-	depends on BR2_USE_WCHAR # glib2, libsoup
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libsoup
-	depends on BR2_USE_MMU # glib2, libsoup
+	depends on BR2_USE_WCHAR # glib2, libsoup3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libsoup3
+	depends on BR2_USE_MMU # glib2, libsoup3
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	help
 	  GSSDP implements resource discovery and announcement over
 	  SSDP.
diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 34ccfa8044..06bf51090f 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
-sha256  8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582  gssdp-1.4.0.1.tar.xz
+# Hash from: https://download.gnome.org/sources/gssdp/1.6/gssdp-1.6.3.sha256sum:
+sha256  2fedb5afdb22cf14d5498a39a773ca89788a250fcf70118783df821e1f3f3446  gssdp-1.6.3.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index f7ebb44acd..b512ace6d5 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 1.4
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0.1
+GSSDP_VERSION_MAJOR = 1.6
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = https://download.gnome.org/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
-GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
-GSSDP_CONF_OPTS = -Dexamples=false -Dgtk_doc=false -Dsniffer=false
+GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup3
+GSSDP_CONF_OPTS = \
+	-Dexamples=false -Dgtk_doc=false -Dmanpages=false -Dsniffer=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
