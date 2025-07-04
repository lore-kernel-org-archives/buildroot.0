Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05B3C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D2941195;
	Fri,  4 Jul 2025 16:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27iSWxg5eplP; Fri,  4 Jul 2025 16:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EA154116B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA154116B;
	Fri,  4 Jul 2025 16:54:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2806D12E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1BA400B3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DclF8YCX0ucI for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:54:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DDA140089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DDA140089
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DDA140089
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:54:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 597AFA4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:54:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41056)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjg2-000000005vg-164T
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:54:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:54:17 +0200
Message-Id: <20250704165417.3683051-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648058;
 bh=gid6uaImqr75Ki82q7VAdC3PEfaH3Wwi7EMw8XMwCNQ=;
 h=From:To:Subject:Date:From;
 b=JjLE+4RBla6jbnD8EbhZ49vFamjfirZPWjupi99fg0NrnyWQc6if2o05iw4WRC52a
 TPeuXHXAn2pPl0SYxDtwF3/e26DgmJxPM4A/tnxBBb8gJRzi4bnDDoS/0XJH0624aF
 BD0D9qeqtNB54H6BmNfsBKgX6EcdVl8dqtnNyRx2jDub8HbMJLNuxKaxNCpBBFwRDu
 729/oaq6WGD+PMkwe72BQDszirJRkdH4YjM9FoqdfjLyTEc/lbSteYjV2LiBctjxXy
 VgorX3o7evQJogeUkkiEIlgXmtNjQ5A9r5T3hf0kEB2YJyKSHxjweaesu/hE4BpnS5
 NzBSXyuSupEgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=JjLE+4RB
Subject: [Buildroot] [PATCH 1/1] package/fontconfig: bump version to 2.17.1
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

Removed patch which is included in this release.

Switched _SITE to gitlab:
https://lists.freedesktop.org/archives/fontconfig/2025-March/007154.html

Release notes:
2.16.1: https://lists.freedesktop.org/archives/fontconfig/2025-March/007154.html
2.16.2: https://lists.freedesktop.org/archives/fontconfig/2025-April/007168.html
2.17.0: https://lists.freedesktop.org/archives/fontconfig/2025-June/007224.html
2.17.1: https://lists.freedesktop.org/archives/fontconfig/2025-July/007229.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...explicitly-check-for-pthread-support.patch | 37 -------------------
 package/fontconfig/fontconfig.hash            |  4 +-
 package/fontconfig/fontconfig.mk              |  4 +-
 3 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch

diff --git a/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch b/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch
deleted file mode 100644
index ca394ab7d5..0000000000
--- a/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3c9de31dda1a1d44fade7a61e66c989178d6c2a4 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sun, 26 Jan 2025 10:15:39 +0100
-Subject: [PATCH] meson.build: explicitly check for pthread support
-
-Tested using buildroot. The br-arm-full-nothread fails
-because meson assumes thread support when cross-compiling.
-
-Dependency threads found: YES unknown (cached)
-Has header "pthread.h" : NO
-
-Upstream: https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/aad470dad519b6fe3459023b82941b4414b71313
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- meson.build | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 4439758..07e242b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -383,8 +383,10 @@ endif
- 
- if host_machine.system() != 'windows'
-   thread_dep = dependency('threads')
--  conf.set('HAVE_PTHREAD', 1)
--  deps += [thread_dep]
-+  if thread_dep.found() and cc.has_header('pthread.h')
-+    conf.set('HAVE_PTHREAD', 1)
-+    deps += [thread_dep]
-+  endif
- endif
- 
- fc_templatedir = get_option('template-dir')
--- 
-2.43.0
-
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index b9c95d40b2..e6f2e0771c 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,5 +1,5 @@
-# From https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.16.0.tar.xz.sha256sum
-sha256  6a33dc555cc9ba8b10caf7695878ef134eeb36d0af366041f639b1da9b6ed220  fontconfig-2.16.0.tar.xz
+# From https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.17.1/fontconfig-2.17.1.tar.xz.sha256sum
+sha256  9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541  fontconfig-2.17.1.tar.xz
 
 # Locally calculated
 sha256  51a51aa9823704fd90bccc616cdd17ebabb5b2b3e9cbde886ca02c7002288067  COPYING
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 7ac8872e82..d9f5dbefad 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.16.0
-FONTCONFIG_SITE = https://www.freedesktop.org/software/fontconfig/release
+FONTCONFIG_VERSION = 2.17.1
+FONTCONFIG_SITE = https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/$(FONTCONFIG_VERSION)
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
