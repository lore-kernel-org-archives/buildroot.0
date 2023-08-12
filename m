Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151FCEC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1154835FB;
	Thu,  7 Sep 2023 15:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1154835FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-93pYx1LqBB; Thu,  7 Sep 2023 15:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B61D83611;
	Thu,  7 Sep 2023 15:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B61D83611
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 326BF1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 033A8612A1
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 033A8612A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEho3zySHvF0 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A9366126F
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A9366126F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28E0886A22; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 17:44:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 534c22dd606e200969fce49b8d23b27902dec94e
X-Git-Newrev: 40ff422160e1a5018bbfac53fd9acec702123d8f
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.28E0886A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: introduce _SIMPLE_CLIENTS
 package option
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

commit: https://git.buildroot.net/buildroot/commit/?id=40ff422160e1a5018bbfac53fd9acec702123d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit "package/weston: fix the configuration of simple-clients"
fixed the configuration of Weston simple-clients by always enabling all
supported applications.

Since it is not desirable to always have all those applications
installed on target, this commit introduces a new package Kconfig
option to control this.

Since there is already a BR2_PACKAGE_WESTON_DEMO_CLIENTS option present,
this commit also update the Kconfig "help" entries, to clarify the
difference between those "demo clients" and "simple clients". Those
clients groups are directly coming from the upstream package (and are
directly mapped to Meson configure options).

Signed-off-by: Julien Olivain <ju.o@free.fr>
[yann.morin.1998@free.fr:
  - set -Dsimple-clients= only once, outside conditional block
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 24 ++++++++++++++++++++++++
 package/weston/weston.mk |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 1a7c27a715..db6a78ee8a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -174,6 +174,18 @@ config BR2_PACKAGE_WESTON_SCREENSHARE
 	bool "screenshare"
 	default y
 
+config BR2_PACKAGE_WESTON_SIMPLE_CLIENTS
+	bool "simple clients"
+	help
+	  Simple clients includes application such as:
+	  damage, dmabuf-feedback, dmabuf-egl, dmabuf-v4l, egl
+
+	  In the target filesystem, simple client program binaries are
+	  prefixed with "weston-simple-".
+
+	  Note: Weston has two sets of clients. See also the weston
+	  "demo clients" option.
+
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
@@ -188,6 +200,18 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	help
 	  This enables the installation of Weston's demo clients.
 
+	  Demo clients includes application such as:
+	  clickdot, confine, content_protection, dnd, editor,
+	  eventdemo, flower, fullscreen, image, multi-resource,
+	  presentation-shm, resizor, scaler, smoke, stacking,
+	  subsurfaces, tablet, transformed...
+
+	  In the target filesystem, demo client program binaries are
+	  prefixed with "weston-".
+
+	  Note: Weston has two sets of clients. See also the weston
+	  "simple clients" option.
+
 comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5f8d915d5a..6a5c0e57f5 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -22,6 +22,7 @@ WESTON_CONF_OPTS = \
 	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
+ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
 WESTON_SIMPLE_CLIENTS = \
 	damage \
 	dmabuf-egl \
@@ -35,6 +36,7 @@ ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
 # dmabuf-v4l uses VIDIOC_EXPBUF, only available from 3.8+
 WESTON_SIMPLE_CLIENTS += dmabuf-v4l
 endif
+endif # BR2_PACKAGE_WESTON_SIMPLE_CLIENTS
 
 WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
