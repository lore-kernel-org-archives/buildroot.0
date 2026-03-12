Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4776C105A583
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 11:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1D86149A;
	Thu, 12 Mar 2026 11:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCGylLxGDMiy; Thu, 12 Mar 2026 11:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1C661470
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773313954;
	bh=0mQBSCacwlVNaKeZwXLdt+uBjEIQ0/pLxXeRXp8nWxE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Czt9dXtMI6WgaaIj15YLGHW72Yh0VzMyIT8Ajuoi4IbzmWxAKTirSRu/Nw762vVwG
	 sAXopfY3AwJNIHUFrmIaV1UG06CasZB//IpzaygFfCDBd1xbB4x72YIFqP3vXKJ7Ar
	 5mRi7QQzXvxZ8+Lu/JXAjpHcjr2tp0+y2PP8JytGEBhIAvVmoqASM5nVSNV+Sv/b9h
	 7S7rSFjXlYJHBepdF0qw4ZgJQMi0I6mINUDIXIQsl+poPIoGfxOulmEWwBddOMLikd
	 ntDNipYOceTq9iCnz7gji2H3YZspSiAtH2xC0DdAVj1Ek/2vj8QFVyfUdWb8oAntAP
	 eyyGtGuUWOQnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A1C661470;
	Thu, 12 Mar 2026 11:12:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A98E228
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 11:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FDF961470
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 11:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oC9b5yyv8I_T for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 11:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A6AC6146F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6AC6146F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A6AC6146F
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 11:12:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5E2FF1A2DF2
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 11:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F8FC5FDEB;
 Thu, 12 Mar 2026 11:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACB9E10369D8E; Thu, 12 Mar 2026 12:12:23 +0100 (CET)
To: buildroot@buildroot.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 12 Mar 2026 12:12:16 +0100
Message-ID: <20260312111218.390784-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773313946; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=3jUaVqVpvzH5MM6tZBYHPJ1CjJ4kWyFX4jUHkguF1MM=;
 b=NBCsWXCdm00fiJy46ZKWkdoIRGMlIWHsao0lXRbYhQy2UgvXFdb955UKaEssV2ahIXchiE
 ZHm8EFCIcQgxKnZgV3bnPf3wB0tzyMOf4jEBJG87/D+ww3iAS7pfJh/O5aaJyD3dMSt19E
 nwDlZWN40UlaIiQTBcS5oiqZCRQkb6ZDXVhaDqWL5f3LqX6wHmuSf3F16zPrgqCv1WX23k
 loWbrV/oOXSk0zxkGEy8MgzL0hVwAqIjG5qKmmUM2994WlVI0feCEUQpYp8ehcQFakA8Ar
 gbL6GDhRl+oYnubOZlItsfSphNX0+Da7UZvGMA1hu9jTKyF3N6aIjI53Dn9SDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NBCsWXCd
Subject: [Buildroot] [PATCH] package: Add drm_info
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

drm_info is a small utility to dump info about DRM devices.

Link: https://gitlab.freedesktop.org/emersion/drm_info
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/Config.in                             |  1 +
 ...0001-meson.build-Fix-Buildroot-build.patch | 34 +++++++++++++++++++
 package/drm_info/Config.in                    |  8 +++++
 package/drm_info/drm_info.hash                |  5 +++
 package/drm_info/drm_info.mk                  | 15 ++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/drm_info/0001-meson.build-Fix-Buildroot-build.patch
 create mode 100644 package/drm_info/Config.in
 create mode 100644 package/drm_info/drm_info.hash
 create mode 100644 package/drm_info/drm_info.mk

diff --git a/package/Config.in b/package/Config.in
index 83414b3e0b..f9f90ca8ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -307,6 +307,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/drm_info/Config.in"
 	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
diff --git a/package/drm_info/0001-meson.build-Fix-Buildroot-build.patch b/package/drm_info/0001-meson.build-Fix-Buildroot-build.patch
new file mode 100644
index 0000000000..b709ab8a1f
--- /dev/null
+++ b/package/drm_info/0001-meson.build-Fix-Buildroot-build.patch
@@ -0,0 +1,34 @@
+From 785525a74878bdf688c5466d83e193e207abed6a Mon Sep 17 00:00:00 2001
+From: Kory Maincent <kory.maincent@bootlin.com>
+Date: Wed, 11 Mar 2026 19:03:46 +0100
+Subject: [PATCH] meson.build: Fix Buildroot build
+
+In cross compilation case pc_sysrootdir variable contains the sysroot path,
+but includedir from pkgconfig already contains the full absolute path
+(sysroot + /usr/include), so concatenating them double the sysroot prefix.
+
+The fix removes pc_sysrootdir + so includedir is used directly, which
+already points to the correct absolute path on the filesystem.
+
+Upstream: N/A
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 5b94552..5a7cd0a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -68,7 +68,7 @@ if libdrm.version().version_compare('<2.4.125')
+ elif libdrm.type_name() == 'internal'
+   fourcc_h = meson.current_source_dir() / 'subprojects/libdrm/include/drm/drm_fourcc.h'
+ else
+-  fourcc_h = libdrm.get_variable(pkgconfig: 'pc_sysrootdir') + libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
++  fourcc_h = libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
+ endif
+ 
+ # The DRM_BUS_FAUX bus and its information is included in libdrm v2.4.127
+-- 
+2.43.0
+
diff --git a/package/drm_info/Config.in b/package/drm_info/Config.in
new file mode 100644
index 0000000000..a664485d03
--- /dev/null
+++ b/package/drm_info/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DRM_INFO
+	bool "drm_info"
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_JSON_C
+	help
+	  Small utility to dump info about DRM devices.
+
+	  https://gitlab.freedesktop.org/emersion/drm_info
diff --git a/package/drm_info/drm_info.hash b/package/drm_info/drm_info.hash
new file mode 100644
index 0000000000..21d104a251
--- /dev/null
+++ b/package/drm_info/drm_info.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  b1000e95eb4f57cfe7819c5b8afd880ac07dde25d9c3839ec52e0aeadeb83234  drm_info-v2.9.0.tar.gz
+
+# Hash for license files:
+sha256  05a54b690d8851143a8b923cfe8ac48f49050f9d2166e7eb0c1d340242d7f46a  LICENSE
diff --git a/package/drm_info/drm_info.mk b/package/drm_info/drm_info.mk
new file mode 100644
index 0000000000..dd2698247b
--- /dev/null
+++ b/package/drm_info/drm_info.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# drm_info
+#
+################################################################################
+
+DRM_INFO_VERSION = v2.9.0
+DRM_INFO_SITE = https://gitlab.freedesktop.org/emersion/drm_info/-/archive/$(DRM_INFO_VERSION)
+DRM_INFO_LICENSE = MIT
+DRM_INFO_LICENSE_FILES = LICENSE
+DRM_INFO_DEPENDENCIES = \
+	json-c \
+	libdrm
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
