Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B2C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 22:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F10AA8131E;
	Sun, 24 Dec 2023 22:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F10AA8131E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfBse_NnsXoH; Sun, 24 Dec 2023 22:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 468DA8175E;
	Sun, 24 Dec 2023 22:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 468DA8175E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 645C31BF86C
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A85C60BD1
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A85C60BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hH5tbtzXcI8u for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 806FE60804
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806FE60804
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F08982983; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 23:01:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5b18f9ebaf1c095df08dcf69418bccb4bc46b6c
X-Git-Newrev: b08df59fc61ebbcabf58ee706d74384cbb7dcb7e
X-Patchwork-Hint: ignore
Message-Id: <20231224222403.6F08982983@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: enable swaybar support
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

commit: https://git.buildroot.net/buildroot/commit/?id=b08df59fc61ebbcabf58ee706d74384cbb7dcb7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to build sway with swaybar support.
  - The bar requires dejavu fonts.
  - If bash-completions is selected, JQ is required.
  - Select dmenu-wayland as a runtime dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: jq is a runtime dependency too]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sway/Config.in | 12 ++++++++++++
 package/sway/sway.mk   |  7 ++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 08b6911069..6fd13636a3 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -24,6 +24,18 @@ config BR2_PACKAGE_SWAY
 
 	  https://github.com/swaywm/sway
 
+if BR2_PACKAGE_SWAY
+
+config BR2_PACKAGE_SWAY_SWAYBAR
+	bool "swaybar"
+	select BR2_PACKAGE_DEJAVU
+	select BR2_PACKAGE_JQ if BR2_PACKAGE_BASH_COMPLETION # Runtime
+	select BR2_PACKAGE_DMENU_WAYLAND # Runtime
+	help
+	  Enable support for swaybar
+
+endif # BR2_PACKAGE_SWAY
+
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
 	depends on !BR2_PACKAGE_SYSTEMD || \
 		!BR2_PACKAGE_HAS_UDEV || \
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 1e3dd279ef..6d924ca92e 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dswaybar=false \
 	-Dswaynag=false \
 	-Dtray=disabled \
 	-Dman-pages=disabled \
@@ -44,4 +43,10 @@ else
 SWAY_CONF_OPTS += -Ddefault-wallpaper=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR),y)
+SWAY_CONF_OPTS += -Dswaybar=true
+else
+SWAY_CONF_OPTS += -Dswaybar=false
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
