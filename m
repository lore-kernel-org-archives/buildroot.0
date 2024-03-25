Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785EDC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 14:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F323802B8;
	Mon, 25 Mar 2024 14:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKDhKRHtawy9; Mon, 25 Mar 2024 14:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2047C80AD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2047C80AD2;
	Mon, 25 Mar 2024 14:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCEC1BF358
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 14:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4759D80AD2
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 14:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSDVkaZOLsrL for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 14:39:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1C1F802B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C1F802B8
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1C1F802B8
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 14:39:22 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rolTr-00F660-B5; Mon, 25 Mar 2024 15:39:19 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id bb6357b4;
 Mon, 25 Mar 2024 14:39:17 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:39:15 +0200
Message-ID: <20240325143917.2620448-1-aperez@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o4BHhbbpu+wSoC7pZv2+0Q4b3Oa6P54LEwceFzOdT6A=; b=HitA5ew8ZTfzpwgnZIoqmrzi0q
 JIloY7a39QKFw34p/4fzw1Bz57G6v1WPeSoJymyg1l7QKsoNEW2Ayrx56AToLCGIP91dinJPhBVxi
 G9s3KX5ZwUZo029eIaQux5GA5PKQfvOyNCW+uCVQMjIzNsw2p4xYpd+BEoDKcUdX0Wm5UzEgOj8Lb
 Fz0ZropL4ojWhxBAJjay6Xa4d06GS2GIgH6s7/pXJ6tzmooKisWE5l83r+fW6jZ+dCUneJN9FY032
 YfUyZ5a8EJIteFgibTOfLxf1ncKrze+FkjxgqfhbOUHzG5F2hh1cGZhOfQm5WW3RiwxWNnWioAF0E
 52K+Oe6Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=HitA5ew8
Subject: [Buildroot] [PATCH] package/libmanette: bump to version 0.2.7
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bugfix release which mainly imroves device detection,
specially inside the Flatpak sandbox. Additionally, this version
includes the patch for building as a static library, and the patch
file can be removed.

Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/commit/27554bd118c08141134d4147cc34794057eb36e2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...n-hardcode-building-a-shared-library.patch | 34 -------------------
 package/libmanette/libmanette.hash            |  4 +--
 package/libmanette/libmanette.mk              |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch

diff --git a/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch b/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
deleted file mode 100644
index a93a1f72193..00000000000
--- a/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 003c2e84d95357bbbef72fb395ef85f1650097a3 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Fri, 23 Sep 2022 14:35:51 +0300
-Subject: [PATCH] Meson: Un-hardcode building a shared library
-
-Use library() instead of shared_library() to allow specifying which kind
-of library to build with "meson setup --default-library ..."
-
-This allows more easily incorporating libmanette in an application e.g.
-as a Meson subproject which gets built into a program as a static
-library.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://gitlab.gnome.org/GNOME/libmanette/-/merge_requests/84]
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index c140cac..b71d090 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -63,7 +63,7 @@ if gudev.found()
-   libmanette_deps += [ gudev ]
- endif
- 
--libmanette_lib = shared_library(
-+libmanette_lib = library(
-   libmanette_module,
-   libmanette_sources,
-   c_args: libmanette_c_args,
--- 
-2.37.3
-
diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index 96089f971aa..b1da3c19f62 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.6.sha256sum
-sha256  63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac  libmanette-0.2.6.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.7.sha256sum
+sha256  cddd5c02a131072c19c6cde6f2cb2cd57eae7dacb50d14c337efd980baa51a51  libmanette-0.2.7.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 10f2b8a4663..42fb4797957 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).6
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).7
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
