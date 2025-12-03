Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E39D1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9DF61B17;
	Wed,  3 Dec 2025 22:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfP2fcjNzeVx; Wed,  3 Dec 2025 22:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA85060B33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799449;
	bh=7h9wEzK2tKXCyMNvTAadG/4lx2JeIZ0yL1bEy6FCHgI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Kfgb/WltZG1t1hmYXppHdJmH35T2cbVZInbH3NsgHguQXpbKj+J5MhtyACa0LcDYx
	 JR4AcvPHJbm+p1n8i5/PhitW5fansF//7sc2Mg4ctS1kMTM+qHYInwdEZyjd3rp9du
	 9vtLPiCrpRIHHKt6sBLG6HmwID2w594V8RCIXPSlkqJP89yk7THBpt7+wRbMKFmOfv
	 dySBSdFkUztG7MCw9VNep5cKoKw97IYGBlnEKh1GuKIsmjAkq1htjy17DV2aFdeznW
	 XseLuBDU1URhXeYH2RQcFFBU9n5Xp1UADDSvfiQ1S900XUWwcWrwgH8E2fGo98Kr8h
	 uTZaPyGeCpyiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA85060B33;
	Wed,  3 Dec 2025 22:04:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03DE0D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE5BA61AEF
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Luv0muvbXF3d for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:04:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C15B161AED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15B161AED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C15B161AED
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59432A4C79D1;
 Wed,  3 Dec 2025 22:59:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-2fWf;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:15 +0100
Message-ID: <20251203215723.2323032-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799146;
 bh=yrQ0Ww3MQWyYQmaBH6Pe0P+QO5a6SblyGLkENgiKPqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NQI6uZAoI4ys9azbVNkIhfBUhgsVK+Gg4RgPulwPH4a2PNFVF+w9vEzPyVIBVJXmR
 QbbKZBBzoNqRuiPYt2wWWFR/+5RMyZtNFeZGG7L///KfYgR3ih8AuORiRMr2K2dWPz
 akBbMl9uullD+V8INSo0HxXXt4welARkZmFsbPIJg7EwrZrCCGEY+IaX/lPvwZTITS
 BjD6YabZzyeCfW2nQfq4dpo6ykyJqjuLFu4LMk71HykvgUjx3CSyrNB3od8OSw+hGt
 6ugThJv3p6TpQJg1C2H5Tt0GySqfyGC6WtzCJLcCKvKAbXHO1KO1dTOCHaChQLibf8
 QWu7DIJkfgVtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NQI6uZAo
Subject: [Buildroot] [PATCH/next 08/16] package/gupnp-tools: bump version to
 0.12.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed two patches which are included in this release and added one
patch to fix build with libxml 2.15.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...emove-Werror-deprecated-declarations.patch | 27 +++++++++++++++
 ...mon-Drop-deprecated-xmlRecoverMemory.patch | 33 -------------------
 ...-Fix-compatibility-with-libxml2-2-12.patch | 28 ----------------
 package/gupnp-tools/gupnp-tools.hash          |  4 +--
 package/gupnp-tools/gupnp-tools.mk            |  2 +-
 5 files changed, 30 insertions(+), 64 deletions(-)
 create mode 100644 package/gupnp-tools/0001-Remove-Werror-deprecated-declarations.patch
 delete mode 100644 package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
 delete mode 100644 package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch

diff --git a/package/gupnp-tools/0001-Remove-Werror-deprecated-declarations.patch b/package/gupnp-tools/0001-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..ef76f01f66
--- /dev/null
+++ b/package/gupnp-tools/0001-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,27 @@
+From cb4ddac12977fd1abd88a1feacbab090d9ad5ecb Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 3 Dec 2025 20:06:22 +0100
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/issues/29
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c92a833..64a0513 100644
+--- a/meson.build
++++ b/meson.build
+@@ -44,7 +44,6 @@ conf.set('HAVE_GTK_SOURCEVIEW', gtksourceview.found())
+ conf.set('GETTEXT_PACKAGE', '"@0@"'.format(meson.project_name()))
+ conf.set('LOCALEDIR', '"@0@"'.format(localedir))
+ cc = meson.get_compiler('c')
+-add_project_arguments(cc.get_supported_arguments('-Werror=deprecated-declarations'), language: 'c')
+ conf.set('GLIB_VERSION_MIN_REQUIRED', 'GLIB_VERSION_@0@'.format(glib_version.underscorify()))
+ conf.set('GLIB_VERSION_MAX_ALLOWED', 'GLIB_VERSION_@0@'.format(glib_version.underscorify()))
+ 
+-- 
+2.47.3
+
diff --git a/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch b/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
deleted file mode 100644
index c81d1b01fe..0000000000
--- a/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Thu, 3 Aug 2023 23:44:15 +0200
-Subject: [PATCH] common: Drop deprecated xmlRecoverMemory
-
-Fixes #27
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/common/pretty-print.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
-index c692664..c8ebc9a 100644
---- a/src/common/pretty-print.c
-+++ b/src/common/pretty-print.c
-@@ -34,7 +34,11 @@ pretty_print_xml (const char *xml)
-         char *text;
-         int length;
- 
--        doc = xmlRecoverMemory (xml, strlen (xml));
-+        doc = xmlReadMemory (xml,
-+                             strlen (xml),
-+                             NULL,
-+                             NULL,
-+                             XML_PARSE_NONET | XML_PARSE_RECOVER);
- 
-         if (!doc)
-                 return NULL;
--- 
-GitLab
-
diff --git a/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch b/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
deleted file mode 100644
index c76d440b5d..0000000000
--- a/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4e06104df81fba2cda06d4747b33e75f4cade458 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Fri, 24 Nov 2023 18:12:50 +0100
-Subject: [PATCH] common: Fix compatibility with libxml2 2.12
-
-Fixes #28
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/4e06104df81fba2cda06d4747b33e75f4cade458
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/common/pretty-print.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
-index c8ebc9a..1519cb0 100644
---- a/src/common/pretty-print.c
-+++ b/src/common/pretty-print.c
-@@ -22,6 +22,7 @@
- 
- #include "pretty-print.h"
- 
-+#include <libxml/globals.h>
- #include <libxml/xmlreader.h>
- 
- #include <string.h>
--- 
-GitLab
-
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 28e2661360..6dc8bd74f2 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp-tools/0.12/gupnp-tools-0.12.1.sha256sum:
-sha256  53cf93123f397e8f8f0b8e9e4364c86a7502a5334f4c0be2e054a824478bd5ba  gupnp-tools-0.12.1.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp-tools/0.12/gupnp-tools-0.12.2.sha256sum
+sha256  4c92f2d1a3d454ec1f5fb05ef08ca34df9c743af64c8b5965c35884d46cb005c  gupnp-tools-0.12.2.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 99fdf54f13..910a157816 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.12
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).1
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	https://download.gnome.org/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
