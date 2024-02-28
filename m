Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D36C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B159A60BF2;
	Wed, 28 Feb 2024 16:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxzO3vLjGV1F; Wed, 28 Feb 2024 16:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0F860E9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D0F860E9A;
	Wed, 28 Feb 2024 16:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0021BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FAFD80B1F
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFRSc-JJ5CoO for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB0D180D04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB0D180D04
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7EF487BFB; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:39:37 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 39ae2f26f30a908fe6bb93dd3247f6afb5fc5cc9
X-Git-Newrev: 90c05d1abfef4f42e7e576601b3964b8b5d2b57f
X-Patchwork-Hint: ignore
Message-Id: <20240228164457.A7EF487BFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/weston: fix build
 without gbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=90c05d1abfef4f42e7e576601b3964b8b5d2b57f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 611c0cb198041f518f2be3e0f5236d5c6ef93f58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
