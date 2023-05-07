Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523FBC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05EF140642;
	Sun,  7 May 2023 21:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05EF140642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aw_P8ehYBUn; Sun,  7 May 2023 21:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F25024059C;
	Sun,  7 May 2023 21:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F25024059C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8C51BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5BB24059C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BB24059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39pzqsH7yTdc for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:12:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 200244013B
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 200244013B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E74886077; Sun,  7 May 2023 21:12:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:12:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a5d8d5f85506e0fe0633e192defab2ce32cb1c0
X-Git-Newrev: 73e3a8f8a8d906627a15f4f5be81ce0ceca4aeb0
X-Patchwork-Hint: ignore
Message-Id: <20230507211246.0E74886077@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxkbcommon: enable wayland
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=73e3a8f8a8d906627a15f4f5be81ce0ceca4aeb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tweak the applied configuration options to flag support for Wayland if
the wayland package is detected. This will allow the generation of the
`interactive-wayland` utility (when `BR2_PACKAGE_LIBXKBCOMMON_TOOLS` is
also configured).

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxkbcommon/Config.in       | 1 +
 package/libxkbcommon/libxkbcommon.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index e9f61227a0..c7fe188a0e 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBXKBCOMMON
 
 config BR2_PACKAGE_LIBXKBCOMMON_TOOLS
 	bool "tools"
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	help
 	  Tools: xkbcli, xkbcli-compile-keymap, xkbcli-how-to-type,
 	  xkbcli-interactive-evdev, xkbcli-interactive-x11,
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 236bf4c5d9..882791b917 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -14,7 +14,6 @@ LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
 	-Denable-docs=false \
-	-Denable-wayland=false \
 	-Denable-xkbregistry=false
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -30,4 +29,11 @@ else
 LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS)$(BR2_PACKAGE_WAYLAND),yy)
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
+LIBXKBCOMMON_DEPENDENCIES += wayland wayland-protocols
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
