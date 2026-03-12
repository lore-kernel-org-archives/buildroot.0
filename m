Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71548105A583
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 11:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30AB44184A;
	Thu, 12 Mar 2026 11:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Qn4u8caCek0; Thu, 12 Mar 2026 11:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5153441768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773314020;
	bh=0mQBSCacwlVNaKeZwXLdt+uBjEIQ0/pLxXeRXp8nWxE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GU8JGlCXa4aH6DOkpH0mxS4jQ3q5Tl7rgYStjWhI3cGulPjWyy6yUxbr5OWqtI8hi
	 nilmYYCQI9eRXFMaIXlfSXUMgD1PpZ8cMHSzK/IDCIz43uwSLnu/y4o7e/hYmr4VlW
	 l93XzH0QIes8LzqgMaMB0wJ+5ZZoPN0VkbM7yIV17flDRJ4blzvyF+JK2076ihZsi8
	 Bt0fKEAqA/QZD692vwmM42ZF5ary66fEn5gSR5GIuH3ffjAb+WLUKbiZRoRPmK6Jfk
	 uKq+Uwk9q9T84oUtPX1WIk7zQ6eKyvo7xhwLoxgOynOJsZ9BvWJ4KnTkpLWQ11GI5/
	 XDgLIRaHo4JgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5153441768;
	Thu, 12 Mar 2026 11:13:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A5F7282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 11:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C25B409F2
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 11:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eU4HVlJdX0jj for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 11:13:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64DA7401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64DA7401F3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64DA7401F3
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 11:13:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 72C414E42658;
 Thu, 12 Mar 2026 11:13:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4A7525FDEB;
 Thu, 12 Mar 2026 11:13:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F55210369D92; Thu, 12 Mar 2026 12:13:34 +0100 (CET)
To: buildroot@buildroot.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 12 Mar 2026 12:13:30 +0100
Message-ID: <20260312111331.391639-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773314014; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=3jUaVqVpvzH5MM6tZBYHPJ1CjJ4kWyFX4jUHkguF1MM=;
 b=QCetkjH9qzBBkexMAV162ZBecl4LDZt4IdzVR9jcr0zy+egcYldCZEq09yqgj7+rq5Jazh
 s1dU9HXqgaiyu6QEeruGzubZpbsSbM9MRfzFjCubatbP///SWfFYJr2lXuRDTDsGA8Kp7z
 Emz0V1FsxuUl3P7BCGMc18ULrNMX49jDQWtttWQcpZYavcPsZusL1zP/EzIkovZuwJydC9
 CHfoc4I6E1V82auJnRRleX0K7atYWhK5Bzc5f5ct5PKuZr7G7nm0O99f8wDIDvYmXJtPJU
 LzVIywasMovvhSNxwSLG6i5aPxOCCNZHR3JSKF1egm6jo5OzHEDJW59uKEVebg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QCetkjH9
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
