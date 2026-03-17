Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4D5FD874A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 11:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C34C614D0;
	Tue, 17 Mar 2026 11:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ES436JAKDqgF; Tue, 17 Mar 2026 11:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE9B614CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773748714;
	bh=UOJDWocpCJ6di/SFhEa05TukHtl7+oqcxDYm/zPGpyc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sQFxSlIR35pym5ll72wo0EV246SmT3zHupbaJIpyRq+1wOQXntfoBkI1kIqPWqtPG
	 KouZ0nYXOqMF9FgbgKhc4GkCb/8pT+OOYWhKamw1q0e8MA1SxL9ExXdXBbir2o9FYS
	 AbPwANrhIotuH7XaOsd3v0+bZMQVTdfRQthA7/oLY7bdZWuWGtocuo0rwxXfsFPv8y
	 ZhyDkhs5uq3djTgPUTAuQP+l7Pq40g1DZcKWLK/bILy88lXmiaaS4B0CiMWUnhcbrt
	 7oCzH0o4sxKbgQE/wHrNkFNB2J9jVd5P6SgwjQwDNnUT8o19iOMpTQDX0Tl1V8D8Mk
	 sc5lR4f5SzmlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE9B614CD;
	Tue, 17 Mar 2026 11:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20E211B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 11:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC8B614A2
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 11:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P04g3hZ7NFcz for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 11:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79FD6614CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79FD6614CD
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79FD6614CD
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 11:58:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 634701A2DB8;
 Tue, 17 Mar 2026 11:58:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 25DDA5FC9A;
 Tue, 17 Mar 2026 11:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7BBB10450357; Tue, 17 Mar 2026 12:58:23 +0100 (CET)
To: buildroot@buildroot.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 17 Mar 2026 12:58:13 +0100
Message-ID: <20260317115814.323699-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773748706; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=hjk/juxxmmkDnnHkvtYGlcQfBrDG5iqQICKlZuyY+kQ=;
 b=AZsgJUz6PGcJMk7ltfFNrpN/RwoZR45x9COoJA005hYLTbAq8d+F8oexYLVh9OOQ/Z+XfR
 fMm2bBE575sOkh3xcKRTk2AGHY9SqrohqEC+Y2/yEuGm9tFou294/oZr2bajYoeB9S16Uv
 H2eM4YlQs8Qvd2f3NR62Hj53jHQZ38L/qQXq1Kz+v6YV0kzRrD3XdOJwl0hsaza+wC7fSI
 R8ndQS1FvpAiaJNW6wFMPAyKbuNiS3m3/JAj1NBbVjlNloTo7s5++RjiAEY7xjLIcRiWqD
 wVWh1RXcTroDRgvOue2sScm1kLddTIzGZtkoXohnfnd/6qi+svZ17HoTVgVP4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AZsgJUz6
Subject: [Buildroot] [PATCH v2] package/drm-info: new package
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

Changes in v2:
- Rename package to drm-info.
- Upstream the drm-info patch
- Add toolchain with thread dependency.
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...-Revert-Find-drm_fourcc.h-in-sysroot.patch | 47 +++++++++++++++++++
 package/drm-info/Config.in                    | 12 +++++
 package/drm-info/drm-info.hash                |  5 ++
 package/drm-info/drm-info.mk                  | 15 ++++++
 6 files changed, 81 insertions(+)
 create mode 100644 package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch
 create mode 100644 package/drm-info/Config.in
 create mode 100644 package/drm-info/drm-info.hash
 create mode 100644 package/drm-info/drm-info.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5293d94649..8bf3803711 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2103,6 +2103,7 @@ F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/
 F:	configs/octavo_osd32mp1_brk_defconfig
 F:	configs/octavo_osd32mp1_red_defconfig
+F:	package/drm-info/
 
 N:	Kris Bahnsen <kris@embeddedTS.com>
 F:	package/wilc-firmware/
diff --git a/package/Config.in b/package/Config.in
index fab482c52f..963d1c43ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -306,6 +306,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/drm-info/Config.in"
 	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
diff --git a/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch b/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch
new file mode 100644
index 0000000000..3e70f3d1cf
--- /dev/null
+++ b/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch
@@ -0,0 +1,47 @@
+From c94d00730d0c25a4a4c46abfcf27823919ac9854 Mon Sep 17 00:00:00 2001
+From: Kory Maincent <kory.maincent@bootlin.com>
+Date: Mon, 16 Mar 2026 18:50:09 +0100
+Subject: [PATCH] Revert "Find drm_fourcc.h in sysroot"
+
+This reverts commit cde94140f08775dc4df7eaac766556218d9e1321
+
+When cross-compiling, pkg-config's includedir variable already returns
+an absolute path that includes the sysroot prefix (e.g.
+/sysroot/usr/include). Prepending pc_sysrootdir to it duplicates the
+prefix and produces a broken path.
+
+The reverted commit introduced the double-prefix issue. Drop pc_sysrootdir
+and use includedir directly, which already carries the correct absolute
+path.
+
+The workaround was only needed for the legacy pkg-config 0.29 (2017)
+project, which did not apply PKG_CONFIG_SYSROOT_DIR to includedir.
+The actively maintained pkgconf project handles this correctly, and
+the legacy tool is no longer in widespread use.
+
+You can verify the behavior with:
+  $ PKG_CONFIG_SYSROOT_DIR="/bla" pkg-config --variable=includedir libdrm
+  /bla/usr/include
+
+Upstream: https://gitlab.freedesktop.org/emersion/drm_info/-/merge_requests/114
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1f80024..e4ce03e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -68,7 +68,7 @@ if libdrm.version().version_compare('<2.4.130')
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
diff --git a/package/drm-info/Config.in b/package/drm-info/Config.in
new file mode 100644
index 0000000000..dd6df44771
--- /dev/null
+++ b/package/drm-info/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DRM_INFO
+	bool "drm_info"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_JSON_C
+	help
+	  Small utility to dump info about DRM devices.
+
+	  https://gitlab.freedesktop.org/emersion/drm_info
+
+comment "drm-info needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/drm-info/drm-info.hash b/package/drm-info/drm-info.hash
new file mode 100644
index 0000000000..21d104a251
--- /dev/null
+++ b/package/drm-info/drm-info.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  b1000e95eb4f57cfe7819c5b8afd880ac07dde25d9c3839ec52e0aeadeb83234  drm_info-v2.9.0.tar.gz
+
+# Hash for license files:
+sha256  05a54b690d8851143a8b923cfe8ac48f49050f9d2166e7eb0c1d340242d7f46a  LICENSE
diff --git a/package/drm-info/drm-info.mk b/package/drm-info/drm-info.mk
new file mode 100644
index 0000000000..99c037bfb8
--- /dev/null
+++ b/package/drm-info/drm-info.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# drm-info
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
