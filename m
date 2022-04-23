Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E99C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82BAD41A4C;
	Sat, 23 Apr 2022 15:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPZu77aJvpMR; Sat, 23 Apr 2022 15:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C4441A07;
	Sat, 23 Apr 2022 15:13:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5891BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55F5F40A6A
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqGIE5ifG-5M for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC838400DA
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 738A883FD4; Sat, 23 Apr 2022 15:02:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 16:43:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a96dbad7e7f9a049d8d152ab15c056ff468c591
X-Git-Newrev: d0b467436ccbdda862f93a9d0933b0c0dfcf2a2e
X-Patchwork-Hint: ignore
Message-Id: <20220423150245.738A883FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0b467436ccbdda862f93a9d0933b0c0dfcf2a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 1.20.0 in commit f94ba5c31cf7f863e6fae996fc042a56e20118f3 and
https://gitlab.freedesktop.org/wayland/wayland/-/commit/80164ef3005e8bb5f785082b97a75cab15444f82:

../src/wayland-util.c: In function 'for_each_helper':
../src/wayland-util.c:373:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (size_t idx = 0; idx < count; idx++) {
  ^
../src/wayland-util.c:373:2: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/3040c9a8cf08415a7f4338185f6dc7245c68c64c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wayland/0001-build-set-c_std-c99.patch | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/wayland/0001-build-set-c_std-c99.patch b/package/wayland/0001-build-set-c_std-c99.patch
new file mode 100644
index 0000000000..69f728aa11
--- /dev/null
+++ b/package/wayland/0001-build-set-c_std-c99.patch
@@ -0,0 +1,34 @@
+From 40c275f642e3895aeb748403fcdfd92d7d875d65 Mon Sep 17 00:00:00 2001
+From: Simon Ser <contact@emersion.fr>
+Date: Mon, 10 Jan 2022 14:54:02 +0100
+Subject: [PATCH] build: set c_std=c99
+
+Set explicitly the C standard to use to make sure we don't use
+features not available on our target platforms.
+
+Signed-off-by: Simon Ser <contact@emersion.fr>
+
+[Retrieved from:
+https://gitlab.freedesktop.org/wayland/wayland/-/commit/40c275f642e3895aeb748403fcdfd92d7d875d65]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index cab267e9..e9691ffe 100644
+--- a/meson.build
++++ b/meson.build
+@@ -5,7 +5,8 @@ project(
+ 	meson_version: '>= 0.52.1',
+ 	default_options: [
+ 		'warning_level=2',
+-		'buildtype=debugoptimized'
++		'buildtype=debugoptimized',
++		'c_std=c99',
+ 	]
+ )
+ wayland_version = meson.project_version().split('.')
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
