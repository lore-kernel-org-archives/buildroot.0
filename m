Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE390C6FA89
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A7861091;
	Sun, 11 Sep 2022 09:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A7861091
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkRuNDh62R1l; Sun, 11 Sep 2022 09:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D85A6FB39;
	Sun, 11 Sep 2022 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D85A6FB39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 384E61BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF0986FB2A
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF0986FB2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_oe8ILcfu-r for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 062CF6FB23
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 062CF6FB23
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0294883620; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:08:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0520470951528eb07710338e7427a1fd0159b48
X-Git-Newrev: 8bf3d6a1b7f1584344d39e14f6e275cf14b1b4fa
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.0294883620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: enable installation of
 python tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bf3d6a1b7f1584344d39e14f6e275cf14b1b4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a python-libevdev package, let's allow the
installation of the libinput Python tools, using a new
BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS option.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/Config.in   | 22 ++++++++++++++++++++++
 package/libinput/libinput.mk |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 14e4e70f96..1a8fcc7ed4 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -13,5 +13,27 @@ config BR2_PACKAGE_LIBINPUT
 
 	  http://freedesktop.org/wiki/Software/libinput/
 
+if BR2_PACKAGE_LIBINPUT
+
+config BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS
+	bool "install python tools "
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_LIBEVDEV # runtime
+	select BR2_PACKAGE_PYTHON_PYUDEV # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	help
+	  Install python tools:
+	  libinput-analyze-per-slot-delta,
+	  libinput-analyze-recording,
+	  libinput-analyze-touch-down-state,
+	  libinput-measure-fuzz,
+	  libinput-measure-touchpad-pressure,
+	  libinput-measure-touchpad-size,
+	  libinput-measure-touchpad-tap,
+	  libinput-measure-touch-size,
+	  libinput-replay
+
+endif
+
 comment "libinput needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 1529411355..3454907bab 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -30,6 +30,7 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS),)
 LIBINPUT_PYTHON_TOOLS = libinput-analyze-per-slot-delta \
 	libinput-analyze-recording \
 	libinput-analyze-touch-down-state \
@@ -46,5 +47,6 @@ define LIBINPUT_REMOVE_UNNEEDED_FILES
 	)
 endef
 LIBINPUT_POST_INSTALL_TARGET_HOOKS += LIBINPUT_REMOVE_UNNEEDED_FILES
+endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
