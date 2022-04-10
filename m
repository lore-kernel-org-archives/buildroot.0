Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2B7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2557829EE;
	Sun, 10 Apr 2022 15:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oFpNVQqvt8l; Sun, 10 Apr 2022 15:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A2F8294A;
	Sun, 10 Apr 2022 15:08:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 906B71BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E2E2827F3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a7dkEOdVOKCo for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:08:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEFBC824DD
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:08:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1F87783875; Sun, 10 Apr 2022 14:58:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:53:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9ac22b7e2565ec678b244701b92009701856583
X-Git-Newrev: 7e8f0d95a0243cf413ec18903c1cf990b17b4beb
X-Patchwork-Hint: ignore
Message-Id: <20220410145854.1F87783875@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: use the WPE renderer if
 available
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e8f0d95a0243cf413ec18903c1cf990b17b4beb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If enabled at build time, WebKit's internal nested compositor can work
more efficiently when targeting Wayland, by avoiding one unneeded buffer
copy. The build option has been available for a few years in WebKitGTK
releases.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8d8f083ea2..eca175d1bd 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -28,8 +28,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_SOUP2=ON \
-	-DUSE_WOFF2=ON \
-	-DUSE_WPE_RENDERER=OFF
+	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
 WEBKITGTK_CONF_OPTS += \
@@ -101,6 +100,13 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
+WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=ON
+WEBKITGTK_DEPENDENCIES += wpebackend-fdo
+else
+WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
 WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
