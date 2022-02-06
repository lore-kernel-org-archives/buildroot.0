Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A183C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 13:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01C8040289;
	Sun,  6 Feb 2022 13:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t64mer52SnBe; Sun,  6 Feb 2022 13:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1AE64026F;
	Sun,  6 Feb 2022 13:35:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA84E1BF36F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A82AF40289
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzxYEWzwtxaO for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 13:35:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B23E400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 13:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 092ED81970; Sun,  6 Feb 2022 13:28:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 14:33:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4da031a77f200515bcc5b2e0fe665a7b4f2a780
X-Git-Newrev: e6a2903946b9083ec764e7e4619abb93951f3c4f
X-Patchwork-Hint: ignore
Message-Id: <20220206132801.092ED81970@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6a2903946b9083ec764e7e4619abb93951f3c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now upstream.

Set new x11 and libcanberra meson config options.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...spa-meson.build-add-atomic_dep-dependency.patch | 40 ----------------------
 package/pipewire/pipewire.hash                     |  2 +-
 package/pipewire/pipewire.mk                       | 10 +++++-
 3 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch b/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch
deleted file mode 100644
index b91adbe7e4..0000000000
--- a/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8d9dc023ac12cf305c28786891d5b15e13f29a3d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 25 Jan 2022 17:22:02 +0100
-Subject: [PATCH] spa/meson.build: add atomic_dep dependency
-
-Commit fa64d93e64592d5edd8767f722cf4ea093641052 moved the atomic_dep
-from pipewire-jack to pipewire_dep however atomic_dep should also be
-added to spa_dev to avoid the following build failure when building
-examples (which don't depend on pipewire_dep):
-
-FAILED: spa/examples/adapter-control
-/home/buildroot/autobuild/instance-0/output-1/host/bin/sparc-linux-gcc  -o spa/examples/adapter-control spa/examples/adapter-control.p/adapter-control.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group -lintl -ldl -pthread -lm -Wl,--end-group
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: spa/examples/adapter-control.p/adapter-control.c.o: in function `spa_graph_node_trigger':
-adapter-control.c:(.text+0xdf4): undefined reference to `__atomic_fetch_sub_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/192f40a5c6e05fc11507494e19db52a47082fc35
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/8d9dc023ac12cf305c28786891d5b15e13f29a3d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- spa/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/spa/meson.build b/spa/meson.build
-index 4ad37cdb4..2404748df 100644
---- a/spa/meson.build
-+++ b/spa/meson.build
-@@ -9,6 +9,7 @@ spa_dep = declare_dependency(
-   include_directories : [
-     include_directories('include'),
-   ],
-+  dependencies : [atomic_dep],
-   version : spaversion,
-   variables : {
-     'plugindir' : meson.current_build_dir() / 'plugins',
--- 
-GitLab
-
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 8464a56338..a9d59663ae 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2e91f228ffb93494f2423956b930014de20e15639a03f3df4fca4ebf4bc51fc0  pipewire-0.3.43.tar.bz2
+sha256  76291373f7ab271664df5b6a22b678ad57e485e25c73ee9c78e049a67b7886d2  pipewire-0.3.45.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index b05ce2bcc2..fc521c86ac 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.43
+PIPEWIRE_VERSION = 0.3.45
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -29,6 +29,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled \
 	-Dsession-managers=[] \
+	-Dlibcanberra=disabled \
 	-Dlv2=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
@@ -128,6 +129,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+PIPEWIRE_CONF_OPTS += -Dx11=enabled
+PIPEWIRE_DEPENDENCIES += xlib_libX11
+else
+PIPEWIRE_CONF_OPTS += -Dx11=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 PIPEWIRE_CONF_OPTS += -Dlibusb=enabled
 PIPEWIRE_DEPENDENCIES += libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
