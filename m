Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538D6D10DCE
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 08:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E322981F33;
	Mon,  2 Dec 2024 08:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XdbEL5pmskC; Mon,  2 Dec 2024 08:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028CB81F30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028CB81F30;
	Mon,  2 Dec 2024 08:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D7B976
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 08:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B0926072C
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 08:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhhkXRHQSo9W for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 08:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83E576077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E576077B
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83E576077B
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 08:45:11 +0000 (UTC)
Received: from 91-153-34-109.elisa-laajakaista.fi ([91.153.34.109] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tI23H-00FFfT-DO; Mon, 02 Dec 2024 09:45:07 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id d99ab907;
 Mon, 2 Dec 2024 08:45:06 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon,  2 Dec 2024 10:45:03 +0200
Message-ID: <20241202084506.3251747-1-aperez@igalia.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8/Sqgve+VvnHOizZfNw+16+IZWEEFbnL9XWMyd505iU=; b=YHA2bntVVhEgFH8L6BK/b6cewX
 IWpMF/WUDw+rtp9JCdYLWvxKNJ68hd9YHZTJ4uVUrZNo2UPWoti+Dx95UuhGMxzwaEtTrKhRjQi3F
 0Qd1o7QP7gokUjNS3jAugB/Jnx357Mw4VN/wsXg6kaizs25TLAvttA8mzd369kqE6Z81QDzpRaGhc
 QN6px16++IiZzwfzz4vMTx6uqsYdOhzwsANKbjgrrvoiJFCSTUw0cfr/+AQm6wgV3JWTJDQzCs/Ks
 w8r5akmIVO5BDNnkKpc3OhwpAFRhKyjmufG5o4n+4ZCXSxJXnt3YENlgD8oBpabKy9ZdjZXKtBAPJ
 8GpX+l7w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=YHA2bntV
Subject: [Buildroot] [PATCH/next] package/sysprof: bump to version 47.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bugfix release, which mainly improves reliability, fixes a
issues when profiling WebKit, and adds a new counter for dropped perf
events. Release notes:

  https://gitlab.gnome.org/GNOME/sysprof/-/blob/47.2/NEWS

The patch to allow building with older GLib versions has been included
in the 47.1 release and therefore gets dropped.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../0001-build-reduce-GLib-requirement.patch  | 30 -------------------
 package/sysprof/sysprof.hash                  |  4 +--
 package/sysprof/sysprof.mk                    |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/sysprof/0001-build-reduce-GLib-requirement.patch

diff --git a/package/sysprof/0001-build-reduce-GLib-requirement.patch b/package/sysprof/0001-build-reduce-GLib-requirement.patch
deleted file mode 100644
index fb83e210fe..0000000000
--- a/package/sysprof/0001-build-reduce-GLib-requirement.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c34fba6fe5c3ecd2028461a4317bd2916e2a09d7 Mon Sep 17 00:00:00 2001
-From: Christian Hergert <chergert@redhat.com>
-Date: Mon, 16 Sep 2024 09:48:15 -0700
-Subject: [PATCH] build: reduce GLib requirement
-
-This is kept lower so that you can build without GTK on older systems.
-
-Related: https://gitlab.gnome.org/GNOME/sysprof/-/commit/530b4a9d121c8659148c36ce67f2ce415443baa5#note_2223853
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/e5382d1b8cae4d829751938ce39c2e5fbc419064
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 63a31894..696b87be 100644
---- a/meson.build
-+++ b/meson.build
-@@ -45,7 +45,7 @@ need_libsysprof = (need_gtk or
-                    get_option('tests'))
- 
- dex_req = '0.6'
--glib_req = '2.80.0'
-+glib_req = '2.76.0'
- gtk_req = '4.15'
- polkit_req = '0.105'
- 
--- 
-2.46.2
-
diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index ca025674a7..1d7373e16d 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/47/sysprof-47.0.sha256sum
-sha256  7424c629434660654288c04248998c357d1ce87ee1559fd44df1980992ef5df5  sysprof-47.0.tar.xz
+# From https://download.gnome.org/sources/sysprof/47/sysprof-47.2.sha256sum
+sha256  e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f  sysprof-47.2.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 81c0a4a6ee..13b3de175e 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SYSPROF_VERSION_MAJOR = 47
-SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
+SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).2
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
 SYSPROF_LICENSE = GPL-3.0+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
