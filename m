Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829C8C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12294400BF;
	Tue, 17 Jan 2023 09:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12294400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxK1bNucDFqQ; Tue, 17 Jan 2023 09:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4049F4021C;
	Tue, 17 Jan 2023 09:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4049F4021C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC0F51BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B4C60736
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B4C60736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoS9YcBn6gSu for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:07:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1967460701
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1967460701
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:07:27 +0000 (UTC)
Received: from 91-153-34-153.elisa-laajakaista.fi ([91.153.34.153] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pHhw7-00AW4F-4s; Tue, 17 Jan 2023 10:07:19 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id afd8cab2;
 Tue, 17 Jan 2023 09:07:18 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 11:07:17 +0200
Message-Id: <20230117090717.2657216-1-aperez@igalia.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G20NfA8FBWOJoEcJlHmy41Z0h72LCiBJIhtlGNDIR+A=; b=Pqafp48HqjJk+v+WRYWMJEISCw
 1ev5oZM5Fa7zE7EkGkkDBZgovGK7ExL72zLPlV78XNljgwb2xjn4arIk0fik8UKkvff5nehu4xvob
 Qk//21st63LDHvswyukekn5fH7Hz/tYDV3wVxvCerkuehvO6hPeHXvZ6XcG+o7pemwGEuM5JIUWvK
 /3ql9pqWkUyqKWQGWzWLpkuIL9hiCoJf4TxQzx/DzEFfmflBsoz5qCL+sKjd0ucZq4cEeplYUu3t7
 vj/y+CY7bWbLqJpTUfl8TZ5Lq1KIwYSu+ySL3mU6ExyxMSn0jYxMWU9ImsJefSWvoqoUYe+cLIjmJ
 79dTNCfg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Pqafp48H
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.16.1
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

This is a small bugfix release which solves build issues. The patch
to fix the libdrm dependency is included in this release and can be
removed. Release notes:

  https://wpewebkit.org/release/cog-0.16.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...m-dependency-when-protocols-are-used.patch | 36 -------------------
 package/cog/cog.hash                          |  8 ++---
 package/cog/cog.mk                            |  2 +-
 3 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch

diff --git a/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
deleted file mode 100644
index 44e555c121..0000000000
--- a/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9a1982c563e218b7695e6a174c8230d3b063eb27 Mon Sep 17 00:00:00 2001
-From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Thu, 6 Oct 2022 09:04:22 +0200
-Subject: [PATCH] wl: Fix libdrm dependency when protocols are used
-
-As the comment says, cog-platform-wl.c needs drm_fourcc.h to build
-properly when wayland_weston_direct_display is enabled.
-
-However, libdrm.pc doesn't specify "include/libdrm" as part of its
-includedir but whether in its cflags. So use the compile_args dep
-instead of includes to fix the build failure.
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
-(cherry picked from commit 32c1d9533bcdc22cbc01d02bf2e6ac0d4bda2dc2)
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://github.com/Igalia/cog/pull/501]
----
- platform/wayland/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
-index f1e18ec..31e4460 100644
---- a/platform/wayland/meson.build
-+++ b/platform/wayland/meson.build
-@@ -67,7 +67,7 @@ if wayland_platform_weston_protocols.length() > 0
- 
-     # The code uses definitions from the drm_fourcc.h header, but does not
-     # need to link the library; libdrm here is only a build-time dependency.
--    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(includes: true)]
-+    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(compile_args: true)]
- endif
- 
- 
--- 
-2.38.0
-
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index a2c55c4b94..2ea3ddee08 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.16.0.tar.xz.sums
-md5  2705472ea4f333290973722c0862b21d  cog-0.16.0.tar.xz
-sha1  ef16e5e3d91d0da056fe5e4f596c211af7453b4e  cog-0.16.0.tar.xz
-sha256  2956f719d36c9a6368f63901a0d1ceaf4d27f529f7df441b3748c36d72906fc6  cog-0.16.0.tar.xz
+# From https://wpewebkit.org/releases/cog-0.16.1.tar.xz.sums
+md5  1489740db6b4ea568578035c30b8b2f4  cog-0.16.1.tar.xz
+sha1  1235203085e7ccd8fc76eab6bdfcdb2e3ae38ea9  cog-0.16.1.tar.xz
+sha256  37c5f14123b8dcf077839f6c60f0d721d2a91bb37829e796f420126e6b0d38b5  cog-0.16.1.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 241c4e309c..da4bfc7ac6 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.16.0
+COG_VERSION = 0.16.1
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
