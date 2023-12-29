Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81158C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 276354017B;
	Fri, 29 Dec 2023 21:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 276354017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g_f3vTwX1oEv; Fri, 29 Dec 2023 21:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D531A401A1;
	Fri, 29 Dec 2023 21:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D531A401A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B133A1BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A75882099
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A75882099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqUbZfEqX_hM for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:49:48 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5537882089
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5537882089
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so17858415e9.0
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 13:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703886585; x=1704491385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2AdeA7FDJ9lQmlO+NMXj07lJSUfhVO9LkWh2h2CqfYM=;
 b=aCiUh7RrI+ASkc/EDqvMfrlH4pXt/jYrUbWl79iWmmB/eXmRMNesbSuughCdZBxG2D
 XYtFIo26C9U4or47N9EqN0jmofT4DGofBaDcNZYki4w+XHEz/PLLQzopRpm1gw0Vgqig
 d+3NsYiY7eOqJ3aPSWChNHH54+IpLpha0MAu/9NefUHPQujLgxru4GtJQUsQIlbgFTkM
 zIVYJdifDFonuLbQYcTFIkIIPWWOJeuZahoDM+l456MSfyAwCWfrqwmMhLfi+28oEHRz
 MGgBSHyFJyK/O0k+IE9dwsHL+txeH+W32afSMsYvfoV9qZ+sxw8kOnrj2IMZTMtpzn3W
 YAHQ==
X-Gm-Message-State: AOJu0Ywg21PnwL7Uua90XUxEtWj+FyfdlUqdQaodBKHgGdmuaOTL/rRb
 rdwg2vVcxe25iS74044s8FtIhgZGgck=
X-Google-Smtp-Source: AGHT+IFXn4jTD6nesh8bOQpUs1hqQmRT0zMEC0Uf0h6U0PXMR4MsQsEI5H2AVjhb8+aguEo4dZVQIA==
X-Received: by 2002:a05:600c:4e07:b0:40d:7990:7afe with SMTP id
 b7-20020a05600c4e0700b0040d79907afemr520040wmq.226.1703886585454; 
 Fri, 29 Dec 2023 13:49:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s23-20020adf9797000000b00336813bb588sm20302346wrb.111.2023.12.29.13.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 13:49:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:49:18 +0100
Message-ID: <20231229214918.15851-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703886585; x=1704491385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2AdeA7FDJ9lQmlO+NMXj07lJSUfhVO9LkWh2h2CqfYM=;
 b=gXVFsHqS3x5k1KaV1Wf6YhGvtgUWPvYg2CQfDlHH0XEeaseBvg+bQXI579o9fDS3a3
 P/Sv/TjIz7W+EIG88SBMayHdlbNIqdgkUtJiqEbNW1aOcstC2Tdco8WRqa6vQyqFpbZT
 0Med5hvvxffJ93qAYbDhjAWMorvXQhqW8DAO42pG2KHzVgdXav1CpGP3x91A8TGN+51c
 zroEeyt8Fxp7d5oA8gvZucch4uKhbzNLQ2XqL/aZuXz9euYpaR7h0iOqPexwE1LkSbsb
 tpr0KOyayuplDrmWSPzUxNbbcFJ3ZM4Pw4JHSJcH5CjX/Msh1Qx5U32H9qwuPLg9hoDI
 qPLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gXVFsHqS
Subject: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version 0.12.1
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

- libsoup has been replaced by libsoup3
- Add patches to fix build with libxml2 2.12

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.12.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...mon-Drop-deprecated-xmlRecoverMemory.patch | 33 +++++++++++++++++++
 ...-Fix-compatibility-with-libxml2-2-12.patch | 28 ++++++++++++++++
 package/gupnp-tools/Config.in                 |  4 +--
 package/gupnp-tools/gupnp-tools.hash          |  4 +--
 package/gupnp-tools/gupnp-tools.mk            |  6 ++--
 5 files changed, 68 insertions(+), 7 deletions(-)
 create mode 100644 package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
 create mode 100644 package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch

diff --git a/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch b/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
new file mode 100644
index 0000000000..c81d1b01fe
--- /dev/null
+++ b/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
@@ -0,0 +1,33 @@
+From f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Thu, 3 Aug 2023 23:44:15 +0200
+Subject: [PATCH] common: Drop deprecated xmlRecoverMemory
+
+Fixes #27
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/common/pretty-print.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
+index c692664..c8ebc9a 100644
+--- a/src/common/pretty-print.c
++++ b/src/common/pretty-print.c
+@@ -34,7 +34,11 @@ pretty_print_xml (const char *xml)
+         char *text;
+         int length;
+ 
+-        doc = xmlRecoverMemory (xml, strlen (xml));
++        doc = xmlReadMemory (xml,
++                             strlen (xml),
++                             NULL,
++                             NULL,
++                             XML_PARSE_NONET | XML_PARSE_RECOVER);
+ 
+         if (!doc)
+                 return NULL;
+-- 
+GitLab
+
diff --git a/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch b/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
new file mode 100644
index 0000000000..c76d440b5d
--- /dev/null
+++ b/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
@@ -0,0 +1,28 @@
+From 4e06104df81fba2cda06d4747b33e75f4cade458 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Fri, 24 Nov 2023 18:12:50 +0100
+Subject: [PATCH] common: Fix compatibility with libxml2 2.12
+
+Fixes #28
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/4e06104df81fba2cda06d4747b33e75f4cade458
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/common/pretty-print.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
+index c8ebc9a..1519cb0 100644
+--- a/src/common/pretty-print.c
++++ b/src/common/pretty-print.c
+@@ -22,6 +22,7 @@
+ 
+ #include "pretty-print.h"
+ 
++#include <libxml/globals.h>
+ #include <libxml/xmlreader.h>
+ 
+ #include <string.h>
+-- 
+GitLab
+
diff --git a/package/gupnp-tools/Config.in b/package/gupnp-tools/Config.in
index af662417c2..5bce5cabeb 100644
--- a/package/gupnp-tools/Config.in
+++ b/package/gupnp-tools/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_GUPNP_TOOLS
 	bool "gupnp-tools"
 	depends on BR2_PACKAGE_LIBGTK3
-	# gssdp, gupnp, libsoup all select on libglib2, so they have
+	# gssdp, gupnp, libsoup3 all select on libglib2, so they have
 	# the same dependencies as libgtk3, which we depend on. So for
 	# the same of simplicity, we don't replicate all those
 	# (complex) dependencies.
 	select BR2_PACKAGE_GSSDP
 	select BR2_PACKAGE_GUPNP
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBXML2
 	help
 	  GUPnP Tools are free replacements of Intel UPnP tools that
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index c3808de6e2..28e2661360 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp-tools/0.10/gupnp-tools-0.10.3.sha256sum:
-sha256  457f4d923935b078415cd2ba88d78db60079b725926b7ee106e4565efe3204de  gupnp-tools-0.10.3.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp-tools/0.12/gupnp-tools-0.12.1.sha256sum:
+sha256  53cf93123f397e8f8f0b8e9e4364c86a7502a5334f4c0be2e054a824478bd5ba  gupnp-tools-0.12.1.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index f87e98ef03..99fdf54f13 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_TOOLS_VERSION_MAJOR = 0.10
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).3
+GUPNP_TOOLS_VERSION_MAJOR = 0.12
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).1
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	https://download.gnome.org/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
@@ -18,7 +18,7 @@ GUPNP_TOOLS_DEPENDENCIES = \
 	libxml2 \
 	gssdp \
 	gupnp \
-	libsoup \
+	libsoup3 \
 	libgtk3 \
 	$(TARGET_NLS_DEPENDENCIES)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
