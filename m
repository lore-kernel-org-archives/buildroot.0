Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E81C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 448E541B6B;
	Sat, 27 Jan 2024 17:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 448E541B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LrF5c7dYOKMK; Sat, 27 Jan 2024 17:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CF62417A0;
	Sat, 27 Jan 2024 17:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF62417A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F59B1BF2E3
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED04C417A0
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED04C417A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRDy0ViJlmDj for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 17:06:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6CB41766
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 17:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C6CB41766
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0915E864FA; Sat, 27 Jan 2024 17:06:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 18:04:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e53a8593b4edf5df1771692df6764b3bc385c6f4
X-Git-Newrev: 611c0cb198041f518f2be3e0f5236d5c6ef93f58
X-Patchwork-Hint: ignore
Message-Id: <20240127170611.0915E864FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: fix build without gbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=611c0cb198041f518f2be3e0f5236d5c6ef93f58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without gbm raised since commit
534c22dd606e200969fce49b8d23b27902dec94e:

Message: dmabuf-feedback requires gbm which was not found. If you rather not build this, drop "dmabuf-feedback" from simple-clients option.

Move the option assignment further down, below all the simple-clients
lists; in Makefile, and because we are usign simply expanded variables,
this is not necessary, but it is easier on us humans when we review the
code.

Also add a comment explaining why the initial list is incomplete.

Fixes:
 - http://autobuild.buildroot.org/results/ebbba1d73ceeaacee17fde0c6c853415cd316091

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6a5c0e57f5..b07e798765 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -23,11 +23,9 @@ WESTON_CONF_OPTS = \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
 ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
+# Note: some clients are conditional, see further for the others.
 WESTON_SIMPLE_CLIENTS = \
 	damage \
-	dmabuf-egl \
-	dmabuf-feedback \
-	egl \
 	im \
 	shm \
 	touch
@@ -38,8 +36,6 @@ WESTON_SIMPLE_CLIENTS += dmabuf-v4l
 endif
 endif # BR2_PACKAGE_WESTON_SIMPLE_CLIENTS
 
-WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
-
 ifeq ($(BR2_PACKAGE_JPEG),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
@@ -57,6 +53,9 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 WESTON_CONF_OPTS += -Drenderer-gl=true
 WESTON_DEPENDENCIES += libegl libgbm libgles
+ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
+WESTON_SIMPLE_CLIENTS += dmabuf-egl dmabuf-feedback egl
+endif
 ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
 WESTON_CONF_OPTS += -Dpipewire=true -Dbackend-pipewire=true
 WESTON_DEPENDENCIES += pipewire
@@ -70,6 +69,8 @@ WESTON_CONF_OPTS += \
 	-Dbackend-pipewire=false
 endif
 
+WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
+
 ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
 WESTON_DEPENDENCIES += freerdp
 WESTON_CONF_OPTS += -Dbackend-rdp=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
