Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68D4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CB4D416A3;
	Sat, 23 Jul 2022 20:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CB4D416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XHSGnVGbk5w; Sat, 23 Jul 2022 20:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62535416A8;
	Sat, 23 Jul 2022 20:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62535416A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B90FC1BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9388284BA1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9388284BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ighChxcf9Pek for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:24:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD5B684974
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5B684974
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3FCF78513F; Sat, 23 Jul 2022 20:10:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:23:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81ad39d62f660a1409e96d1dbd405d6dab16c0f6
X-Git-Newrev: 624f2e658d09d13cb9e61a8a52f2227d2a60d7f7
X-Patchwork-Hint: ignore
Message-Id: <20220723201033.3FCF78513F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox-player: drop
 BR2_TOOLCHAIN_HAS_THREADS workaround
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=624f2e658d09d13cb9e61a8a52f2227d2a60d7f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We used to have a BR2_TOOLCHAIN_HAS_THREADS dependency at the
top-level BR2_PACKAGE_GLSLSANDBOX_PLAYER option to make sure that at
least one of them windowing system was selectable.

However, thanks to the recent introduction of the support for the null
windowing system, we now have a windowing system that doesn't require
any special feature, so we can drop this dependency from the top-level
option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/Config.in | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 19536c8546..2b049357a9 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -2,9 +2,6 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER
 	bool "glslsandbox-player"
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
-	# Doesn't really depend on threads, but this makes sure we have at least
-	# one native windowing system available, and is good enough in practice.
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GLSL Sandbox standalone player allow one to run and render
 	  (most of) nice shaders available online on the
@@ -117,6 +114,5 @@ endif
 
 endif
 
-comment "glslsandbox-player needs a toolchain w/ threads and an openGL ES and EGL driver"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
+comment "glslsandbox-player needs openGL ES and EGL driver"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
