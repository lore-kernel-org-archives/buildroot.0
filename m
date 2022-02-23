Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61294C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A90F415B1;
	Wed, 23 Feb 2022 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6P91YqoprPWK; Wed, 23 Feb 2022 20:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2297C41513;
	Wed, 23 Feb 2022 20:03:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D455C1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEBDD403B3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5DQUKAVyhfO for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36D140502
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5059C83879; Wed, 23 Feb 2022 19:55:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 20:59:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 833f79fdeff1433396b7fa680fb6cbd6f1c65f36
X-Git-Newrev: 72021742574acd4d43ee1977cd2af3133245787a
X-Patchwork-Hint: ignore
Message-Id: <20220223195526.5059C83879@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: drop fbdev
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

commit: https://git.buildroot.net/buildroot/commit/?id=72021742574acd4d43ee1977cd2af3133245787a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fbdev raises the following build failure since bump to version 10.0.0 in
commit f67a6e9b7a7be9adbc405b3126000056120a01af and
https://gitlab.freedesktop.org/wayland/weston/-/commit/6338dbd5816689b2f08f48b359a972e16ff038d8:

../output-1/build/weston-10.0.0/meson.build:133:7: ERROR: Tried to access unknown option 'backend-fbdev'.

Drop fbdev to avoid this build failure as upstream is reluctant to
properly fix this issue by renaming the fbdev option in stable release:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/791

Fixes:
 - http://autobuild.buildroot.org/results/e669a6237c19783c627169c819d7372e20daaf54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy         | 12 ++++++++++++
 package/weston/Config.in |  8 --------
 package/weston/weston.mk |  6 ------
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aefb0ba6ea..b90b9dbcbc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
+	bool "weston fbdev removed"
+	select BR2_LEGACY
+	help
+	  fbdev was deprecated in weston 10.0.0.
+
+config BR2_PACKAGE_WESTON_FBDEV
+	bool "weston fbdev compositor removed"
+	select BR2_LEGACY
+	help
+	  fbdev compositor was deprecated in weston 10.0.0.
+
 config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
 	bool "bpftool was moved"
 	select BR2_LEGACY
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 073a3ae567..6ad8241caa 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -34,10 +34,6 @@ if BR2_PACKAGE_WESTON
 choice
 	prompt "default compositor"
 
-config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
-	bool "fbdev (deprecated)"
-	select BR2_PACKAGE_WESTON_FBDEV
-
 config BR2_PACKAGE_WESTON_DEFAULT_DRM
 	bool "drm"
 	select BR2_PACKAGE_WESTON_DRM
@@ -62,7 +58,6 @@ endchoice
 
 config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 	string
-	default "fbdev"    if BR2_PACKAGE_WESTON_DEFAULT_FBDEV
 	default "drm"      if BR2_PACKAGE_WESTON_DEFAULT_DRM
 	default "headless" if BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
 	default "wayland"  if BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
@@ -71,9 +66,6 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
 
-config BR2_PACKAGE_WESTON_FBDEV
-	bool "fbdev compositor (deprecated)"
-
 # FreeRDP needs threads and !static, already the case for weston
 config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index a0a18d9358..90cf160688 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -85,12 +85,6 @@ else
 WESTON_CONF_OPTS += -Dbackend-rdp=false
 endif
 
-ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=true
-else
-WESTON_CONF_OPTS += -Ddeprecated-backend-fbdev=false
-endif
-
 ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
 WESTON_CONF_OPTS += -Dbackend-drm=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
