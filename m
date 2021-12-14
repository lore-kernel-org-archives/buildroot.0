Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13B1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A430281839;
	Tue, 14 Dec 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9oB8MZ0sGAd; Tue, 14 Dec 2021 19:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFA3817C3;
	Tue, 14 Dec 2021 19:55:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 258601BF5DD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2EB6405F9
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uv03Nybd5EmX for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4232405EA
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C446681E71; Tue, 14 Dec 2021 19:48:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:21:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ae728cc0167c31ca3642d50e396b5bd1ce00852
X-Git-Newrev: 18c37ace7648baefd277e18468ba4915ec8ccda7
X-Patchwork-Hint: ignore
Message-Id: <20211214194841.C446681E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmediaart: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=18c37ace7648baefd277e18468ba4915ec8ccda7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since bump to version
1.9.5 in commit 3db4d486d689b4a9d59c8f7637211893b0a1cb1b:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...diaart-meson.build-replace-shared_library.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
new file mode 100644
index 0000000000..d4b377d327
--- /dev/null
+++ b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
@@ -0,0 +1,35 @@
+From 2272d762436a3b0d2e4fef8fb4f1669814904620 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Dec 2021 20:14:54 +0100
+Subject: [PATCH] libmediaart/meson.build: replace shared_library
+
+Replace shared_library by library call to avoid the following build
+failure when building statically:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
+__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libmediaart/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmediaart/meson.build b/libmediaart/meson.build
+index 2f44e63..1fd3b99 100644
+--- a/libmediaart/meson.build
++++ b/libmediaart/meson.build
+@@ -30,7 +30,7 @@ marshal = gnome.genmarshal('marshal',
+ 
+ libmediaart_dependencies = [glib, gio_unix, gobject, image_library]
+ 
+-libmediaart = shared_library(
++libmediaart = library(
+   'mediaart-' + libmediaart_api_version,
+   libmediaart_sources, marshal[0], marshal[1],
+   version: libmediaart_ltversion,
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
