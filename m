Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5412BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 09:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE75B81750;
	Thu, 13 Jan 2022 09:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQTioMUjszFi; Thu, 13 Jan 2022 09:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0159B8146A;
	Thu, 13 Jan 2022 09:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 561281BF425
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 09:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D557401B9
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 09:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enNdcNJy1SEZ for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 09:46:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AB5741615
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FxIadvrz2kHQo8bmB8kTC+S4ysMrD9rnUJWkYk4pwcY=; b=f/3B08uOwTQt3A/MyvECQiVN1T
 kfC8wDZJwcD7ptv184Dr97i64densFl7fD6mo3e6xP21JV/BQND0Hh6holVAkvfKqO7QMF4ylwsCY
 i66C9cdalgRSgIBRUd8YSp7WlWYZfalcCxdIzNhjlDYKopggCV9hvvc/8xsTNbpBQ3ZaNxldOBH5B
 M4u/OfHRMp2fJUe1sdXHRSuh454jGFkCyFiXr+j7PsuakAq/1/LZKswsQ4FtuSeH9P3VUEc4wtYbb
 7WKZCOhRyXAlOeUPnfrsrxwok3P7WZepaAuHqSyD6TwxhvVAt7GGsTPO54GRc5D74/tFZQsIWWHNX
 H9YhJwVA==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7wgr-0000u7-5y
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 10:46:41 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0b2d3527
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 09:46:30 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 11:46:30 +0200
Message-Id: <20220113094630.2322090-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gcr: add upstream patch to fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Import an upstream patch which removes usage of an invalid keyword that
was being passed to Meson's gnome.generate_gir() function.

This fixes the following autobuilder issues:

  http://autobuild.buildroot.net/results/cdd5c721544d6f07c51be536e414fa474f4b907b
  http://autobuild.buildroot.net/results/8cecd33d7772b19d60f70a097dcb1623bb3ee7de

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...wn-kw-argument-in-gnome.generate_gir.patch | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch

diff --git a/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
new file mode 100644
index 0000000000..e672b5e2ac
--- /dev/null
+++ b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
@@ -0,0 +1,62 @@
+From 145bea264bed98cd435d8babfdee702c06c0afaa Mon Sep 17 00:00:00 2001
+From: Jakub Jirutka <jakub@jirutka.cz>
+Date: Wed, 12 Jan 2022 00:24:20 +0100
+Subject: [PATCH 1/1] meson: Fix unknown kw argument in gnome.generate_gir
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
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream-Status: https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/81
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
+index 06c3a63..f998336 100644
+--- a/gcr/meson.build
++++ b/gcr/meson.build
+@@ -189,7 +189,6 @@ if get_option('introspection')
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
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
