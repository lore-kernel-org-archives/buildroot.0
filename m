Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB66C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B942684CE9;
	Thu, 13 Jan 2022 17:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adlm-bDYdXqp; Thu, 13 Jan 2022 17:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF5784CB3;
	Thu, 13 Jan 2022 17:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1881BF4DA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 168C060AF7
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9bte5A_pbtXa for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:48:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58FE060A99
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:48:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4D77F82127; Thu, 13 Jan 2022 17:41:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 18:47:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dda369e7e8a4bb77b4449818a16b13c4f530e07
X-Git-Newrev: 4eec4c13633500fb4688b2c28d033551dda5ea9c
X-Patchwork-Hint: ignore
Message-Id: <20220113174146.4D77F82127@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcr: add upstream patch to fix
 build with meson 0.61
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4eec4c13633500fb4688b2c28d033551dda5ea9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import an upstream patch which removes usage of an invalid keyword that
was being passed to Meson's gnome.generate_gir() function.

This fixes the following autobuilder issues:

  http://autobuild.buildroot.net/results/cdd5c721544d6f07c51be536e414fa474f4b907b
  http://autobuild.buildroot.net/results/8cecd33d7772b19d60f70a097dcb1623bb3ee7de

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...unknown-kw-argument-in-gnome.generate_gir.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
new file mode 100644
index 0000000000..a1d4e1b46f
--- /dev/null
+++ b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
@@ -0,0 +1,64 @@
+From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 2001
+From: Jakub Jirutka <jakub@jirutka.cz>
+Date: Wed, 12 Jan 2022 00:24:20 +0100
+Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_gir
+
+This argument has been removed in Meson 0.61.0:
+
+    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
+
+https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de:
+
+> The packages argument to gnome.generate_gir was allowed, but never did anything, so stop passing it.
+
+Fixes #89
+
+[aperez@igalia.com: backport from upstream]
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[yann.morin.1998@free.fr: make it an actual backport]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ gck/meson.build | 1 -
+ gcr/meson.build | 1 -
+ ui/meson.build  | 1 -
+ 3 files changed, 3 deletions(-)
+
+diff --git a/gck/meson.build b/gck/meson.build
+index 756b486..a21a1e9 100644
+--- a/gck/meson.build
++++ b/gck/meson.build
+@@ -131,7 +131,6 @@ if get_option('introspection')
+     sources: gck_gir_sources,
+     namespace: 'Gck',
+     nsversion: '@0@'.format(gck_major_version),
+-    packages: gck_deps,
+     export_packages: 'gck-@0@'.format(gck_major_version),
+     includes: [ 'GObject-2.0', 'Gio-2.0' ],
+     header: 'gck/gck.h',
+diff --git a/gcr/meson.build b/gcr/meson.build
+index 2233a44..c83641b 100644
+--- a/gcr/meson.build
++++ b/gcr/meson.build
+@@ -190,7 +190,6 @@ if get_option('introspection')
+     sources: [ gcr_base_public_sources, gcr_base_headers ],
+     namespace: 'Gcr',
+     nsversion: '@0@'.format(gcr_major_version),
+-    packages: gcr_base_deps,
+     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
+     includes: [
+       'GObject-2.0',
+diff --git a/ui/meson.build b/ui/meson.build
+index e656ea2..32ee057 100644
+--- a/ui/meson.build
++++ b/ui/meson.build
+@@ -152,7 +152,6 @@ if get_option('introspection')
+     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
+     identifier_prefix: 'Gcr',
+     symbol_prefix: 'gcr',
+-    packages: gcr_ui_deps,
+     includes: [
+       'GObject-2.0',
+       'Gio-2.0',
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
