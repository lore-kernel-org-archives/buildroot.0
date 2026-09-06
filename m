Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54319C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A29E680D09;
	Sun,  6 Sep 2026 09:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzzNwctJP6zT; Sun,  6 Sep 2026 09:03:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8662980D2C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788685401;
	b=rB2ssaYA5dmTxhUJkqx6weksEYJT0CrUXCPyz4Wmq5lfPOAyd1aENRT1XeL59KIorn0w
	 d8+gVsPZyjQCE5XXSdHOTTcMz9BRxyoHhx9sCnY0ODs79t2ZlHFamhg9BSsXl/H7yzcLu
	 u0zgnwdrwPgHaSw4XhkmMCKPFb/EQKWKPLD++2eHQn0J83k1dE7/uWQGq5EyIa7AchYJD
	 XImTdI6kdQXy10aAoLDf21tg3n4e8Op4wLT6MigyABfGNMA0FT4LcEquCHBJZ/uCEu7K3
	 sWp9jyTFuVxjM941IQ9r5U2mvgAV6ySL7/2mIx+UqPmVXsHdnsmikrL8sxxc5XKU00Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788685401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pFIrOXwQuNRAFHkK25qXtyRf5LNPjtVBv2sqUSG9jXo=;
	b=SQ1fcShQZfJWhx2xGQMxk1WJITvM3qasBg+JGKduMVVlINhYb7D9NbTTGBrv+fusvHto
	 dcf7wYMS6B/llQFczdNZfDeFR6i5WXttAIsMeDhBwBn4U7EnXp9c6dCRhOrJn6NmvNejX
	 u8sM4fWsmrSlYUQMb0MKGzm+VORmKtrQqcnq5qg62s8lBHA13wby/sOUutUTTWEmwPe1y
	 K/9CwdPoVw+aRmQ6dIjXMSQKlLJzetLbLYvUje6w4z1XlNNkF1PFzu5KYT7tyIn8eANc7
	 8U8h9KSq4ZbDwAw/9pVdO5ELbvjBMUmbY+bJxCnkfBIRU5m4KQowcKYS3edPeajPf7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788685401;
	bh=pFIrOXwQuNRAFHkK25qXtyRf5LNPjtVBv2sqUSG9jXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ie85yvPf0wKUNhhOeIMKsvgP7kFn9zTbPIrgY6E99OwradR82UnuaS77qkBQvNmQr
	 di623MPCpQu6KlhczVq/I1e+gVQhp6poL3Jhcj+IAeUP50ZBKRzG+fc2Oah29X3dBC
	 wRDpgNXbcJds3OslW/UOqMW+qJ72PXYJDfzMm+mCVENdiP0hX5z4r//tVrwSo+VgCT
	 6aszUYOyn9QOAOijpp23bxWjvQ3ASDrdQQ+yKBlZnAgOVr5YSqo1OQob6h2sMKAm2W
	 xpGhLDhW25DQl9X5Tb/eCbI/0yGxrCOkkMyeSqTyDhaKPwfiRlLxyThp7KmdXAZnHT
	 IUtvUJc4CBnVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8662980D2C;
	Sun,  6 Sep 2026 09:03:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38AF972C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 257B44008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgmNPTvzVX7g for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:03:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BA7214007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788685397;
 b=cjDNP/wOBCLyMIVSYz5CXqkoGchPP36Lgr45qBT11ZZ+XH91Mu/2Xa5LXOEkWk8u74CT
 che0BAj4yTeKkojJLrsTRb8Y0cj0LmMMLaXA04gZLAQBJrJb6t82vL+EUPZbNHy5QkiqQ
 Y1wf/dtt20Msru08Q+hE+e/uYS/dbUJ3MJrgYoHdlYPiwncUFKS5GNRuxEuBgqP30ZIVd
 DTv2brUsMtHDbHO4WA+jQpqvMN6jIPbZGSD03Fov9nTMlR2CYJyxLxl/2LD3QO7N6PUZQ
 CFqbS+9PcC1kdefa04aN2Dmaop/QKryzFR6RcWqVAKR3NfZqKLepIZF5QRjQAKesgDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788685397;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uxZ8UmS2FPETo0ypv35CkdcQiIWKaEO5DIOqfRRuM1c=;
 b=e/ijXtM9+ERt6YulR2KcugoIRxOQRpyTeYLT9ksJdx4eHxGTPcDvCl1osnHbSRwPbVJB
 /f6Dq17pAaufeH5hhiO4CyyFj+tGlLKWYFop7+510GlAT0O5iWekZdzlmMnlxy1HBhan1
 d3XdwuQLLA/jKtk1pDIEQsp4yVibr90qJ8rOtlf5PMVgOZR46kqhhGH+4HkeRd9txbpvZ
 hCJuT1esdPjdIXLzSTt226ZQwnLGvs729QxIpA37+Q9eRSFFItnDyQf+4365z+dBlUGC0
 muzWbZFa1jLCQgxWTvOvyziMNd92/U4KLveunpZtRs+1Cdkq/PEeMBEUnnWD3FYoTcQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA7214007B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:03:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AD13952B4; Sun,  6 Sep 2026 09:02:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 10:52:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c6eed9ec03431079780ad9dac8dfb53c1ae3691
X-Git-Newrev: c5c0a76751a7e9ba1a8816da68218db9e1379eb9
X-Patchwork-Hint: ignore
Message-Id: <20260906090216.4AD13952B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump version to 16.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3511791445424907049=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3511791445424907049==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5c0a76751a7e9ba1a8816da68218db9e1379eb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announce:
https://lore.freedesktop.org/wayland-devel/alXq76OX4dVWoP3M@xpredator/T/#u

Removed already-deprecated config options:
  * 'deprecated-backend-drm-screencast-vaapi' [1].
  * 'deprecated-shell-fullscreen' [2].
  * 'deprecated-screenshare' [3].

The 'pipewire' and 'remoting' plugins has been deprecated in [4].
They have already been removed in the main development branch in
upstream commit [5] and [6] (not yet in this version 16.0.0).

This commit removes the "remoting" option (rather than changing it to
"deprecated-remoting") because Buildroot was not enabling this option
and this deprecated option is now disabled by default.

This commit also removes the "pipewire" option (rather than changing
it to "deprecated-pipewire"). The commit log of [4] says the
replacement is the "pipewire-backend" option, which is already used
in Buildroot.

Tested on STM32MP157C-DK2.

[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/7c3e3d754404453483ffb362be8ab8afb89d3eb2
[2] https://gitlab.freedesktop.org/wayland/weston/-/commit/29b740ffee98236c5ccb93c09d750b07d37fb8fd
[3] https://gitlab.freedesktop.org/wayland/weston/-/commit/3bd77f781766abaf8aa9fe55d4f9b98c03e29e42
[4] https://gitlab.freedesktop.org/wayland/weston/-/commit/ec74bd040389291f0b8d3162506560a8adae31a4
[5] https://gitlab.freedesktop.org/wayland/weston/-/commit/4606c49d2851a99064cae5e93fe9f464db3a2c58
[6] https://gitlab.freedesktop.org/wayland/weston/-/commit/d587dfea5bf4816afdb0b7f4c9835956250ab395

Signed-off-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>
[Julien:
 - update link in hash file comment
 - add removed options in Config.in.legacy
 - add back package patch which is not included in release
 - reword commit log (fix and add links to upstream commits)
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy           | 14 ++++++++++++++
 package/weston/Config.in   |  9 ---------
 package/weston/weston.hash |  6 +++---
 package/weston/weston.mk   | 27 +++------------------------
 4 files changed, 20 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aeb9b9676e..6975f1f15f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,20 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.11"
+
+config BR2_PACKAGE_WESTON_SCREENSHARE
+	bool "weston screenshare option removed"
+	select BR2_LEGACY
+	help
+	  Weston screenshare option was removed in v16.0.0.
+
+config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
+	bool "weston fullscreen shell removed"
+	select BR2_LEGACY
+	help
+	  Weston fullscreen shell option was removed in v16.0.0.
+
 comment "Legacy options removed in 2026.08"
 
 config BR2_PACKAGE_FLUIDSYNTH_SDL2
diff --git a/package/weston/Config.in b/package/weston/Config.in
index abd996482a..dcb5c7544e 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -164,11 +164,6 @@ config BR2_PACKAGE_WESTON_SHELL_DESKTOP
 	bool "desktop shell"
 	default y
 
-config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
-	bool "fullscreen shell"
-	default y
-	select BR2_PACKAGE_WESTON_HAS_SHELL
-
 config BR2_PACKAGE_WESTON_SHELL_IVI
 	bool "ivi shell"
 	default y
@@ -188,10 +183,6 @@ config BR2_PACKAGE_WESTON_SHELL_LUA
 comment "lua shell needs a Lua >= 5.4"
 	depends on !BR2_PACKAGE_LUA_5_4
 
-config BR2_PACKAGE_WESTON_SCREENSHARE
-	bool "screenshare"
-	default y
-
 config BR2_PACKAGE_WESTON_SIMPLE_CLIENTS
 	bool "simple clients"
 	help
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index b002942696..e8d11ca64c 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lore.freedesktop.org/wayland-devel/aespQ3LKAOy5O3Hx@xpredator/T/#u
-sha256  551d039bfb0c837ba5a4d027cdb8ee16bded0eedb789821f8025d8a64b791f6d  weston-15.0.1.tar.xz
-sha512  555731ddfaf7e3ef9bf43be682e20338ee207b434a72011b730c9b0ebde4daeaeb9cc9d09a707c32798f0184a55144f64e818551efe7e71413876e45e3cb3523  weston-15.0.1.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/alXq76OX4dVWoP3M@xpredator/T/#u
+sha256  dfb32e2bccabda957b94a8d0ec6075acd18c71c87ebc543ee3e618d294ca0f7f  weston-16.0.0.tar.xz
+sha512  23b7a1138833f8aacc57758231d14c2f1bc9ec20ad2fef125ffffb8d63853968e8a8ed2d8bbf6ad1600d7f40358a705ca24838a683e01b1c84279cf8ae1cfe48  weston-16.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5caf5903d1..522365e06e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 15.0.1
+WESTON_VERSION = 16.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -18,7 +18,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	-Ddoc=false \
-	-Dremoting=false \
 	-Dbackend-vnc=false \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
@@ -58,15 +57,14 @@ ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
 WESTON_SIMPLE_CLIENTS += dmabuf-egl dmabuf-feedback egl
 endif
 ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
-WESTON_CONF_OPTS += -Dpipewire=true -Dbackend-pipewire=true
+WESTON_CONF_OPTS += -Dbackend-pipewire=true
 WESTON_DEPENDENCIES += pipewire
 else
-WESTON_CONF_OPTS += -Dpipewire=false -Dbackend-pipewire=false
+WESTON_CONF_OPTS += -Dbackend-pipewire=false
 endif
 else
 WESTON_CONF_OPTS += \
 	-Drenderer-gl=false \
-	-Dpipewire=false \
 	-Dbackend-pipewire=false
 endif
 
@@ -121,13 +119,6 @@ else
 WESTON_CONF_OPTS += -Dxwayland=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-WESTON_CONF_OPTS += -Ddeprecated-backend-drm-screencast-vaapi=true
-WESTON_DEPENDENCIES += libva
-else
-WESTON_CONF_OPTS += -Ddeprecated-backend-drm-screencast-vaapi=false
-endif
-
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 WESTON_CONF_OPTS += -Dcolor-management-lcms=true
 WESTON_DEPENDENCIES += lcms2
@@ -155,12 +146,6 @@ else
 WESTON_CONF_OPTS += -Dshell-desktop=false
 endif
 
-ifeq ($(BR2_PACKAGE_WESTON_SHELL_FULLSCREEN),y)
-WESTON_CONF_OPTS += -Ddeprecated-shell-fullscreen=true
-else
-WESTON_CONF_OPTS += -Ddeprecated-shell-fullscreen=false
-endif
-
 ifeq ($(BR2_PACKAGE_WESTON_SHELL_IVI),y)
 WESTON_CONF_OPTS += -Dshell-ivi=true
 else
@@ -180,12 +165,6 @@ else
 WESTON_CONF_OPTS += -Dshell-lua=false
 endif
 
-ifeq ($(BR2_PACKAGE_WESTON_SCREENSHARE),y)
-WESTON_CONF_OPTS += -Ddeprecated-screenshare=true
-else
-WESTON_CONF_OPTS += -Ddeprecated-screenshare=false
-endif
-
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
 WESTON_CONF_OPTS += -Ddemo-clients=true
 WESTON_DEPENDENCIES += pango

--===============3511791445424907049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3511791445424907049==--
