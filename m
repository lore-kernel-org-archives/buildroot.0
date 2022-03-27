Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A0AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D446409B2;
	Sun, 27 Mar 2022 16:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugzK55r5FPK2; Sun, 27 Mar 2022 16:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4B0B409BA;
	Sun, 27 Mar 2022 16:00:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4B21BF20B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F4460E2E
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGF00TjtkrtA for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DCBF60B03
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2682A85DB7; Sun, 27 Mar 2022 15:50:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:55:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d76b7564f1bb61762181ecd1fc69c72a925ed25c
X-Git-Newrev: 328516a5add9e6f260d3a8e0d372c474ae30b2c1
X-Patchwork-Hint: ignore
Message-Id: <20220327155020.2682A85DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: hid and hog needs
 headers >= 3.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=328516a5add9e6f260d3a8e0d372c474ae30b2c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with hid and hog raised since their
addition in commit fb9fc969d91f69851b4c70dba512b607e52bda7b and
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9b58288693680b021e5dcbc6f8bea80b5be89311
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=646db71713b05d50b2b0c421da34e80ed4c54fbd
because UHID_GET_REPORT is only available since kernel 3.18 and
https://github.com/torvalds/linux/commit/fa71f32b5de2be1644ee671ddbe211d79be7847f:

profiles/input/device.c: In function 'uhid_send_get_report_reply':
profiles/input/device.c:222:24: error: 'union <anonymous>' has no member named 'get_report_reply'
  if (size > sizeof(ev.u.get_report_reply.data))
                        ^
profiles/input/device.c:223:21: error: 'union <anonymous>' has no member named 'get_report_reply'
   size = sizeof(ev.u.get_report_reply.data);
                     ^
profiles/input/device.c:231:12: error: 'UHID_GET_REPORT_REPLY' undeclared (first use in this function)
  ev.type = UHID_GET_REPORT_REPLY;
            ^

Fixes:
 - http://autobuild.buildroot.org/results/1db406eac7620e3f76d997414eb7af7d2ac6cfe6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez5_utils/Config.in | 16 ++++++++++++++++
 package/brltty/Config.in       |  2 +-
 package/cwiid/Config.in        |  6 +++---
 package/kodi/Config.in         |  6 +++---
 package/supertuxkart/Config.in |  2 +-
 5 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 2eea8c7ced..49bb719102 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -79,15 +79,23 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	bool "build hid plugin"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	help
 	  Build plugin for HID (input) profiles.
 
+comment "hid plugin needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	bool "build hog plugin"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	help
 	  Build plugin for HoG (input) profiles.
 
+comment "hog plugin needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
 	bool "build mesh plugin"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
@@ -126,11 +134,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # hid plugin
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	help
 	  Build sixaxis plugin (support Sony Dualshock
 	  controller)
 
+comment "sixaxis plugin needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 comment "sixaxis plugin needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
@@ -142,11 +154,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
 	bool "build hid2hci tool"
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # hid plugin
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	select BR2_PACKAGE_BLUEZ5_UTILS_TOOLS
 	help
 	  Build hid2hci tool
 
+comment "hid2hci tool needs a toolchain w/ headers >= 3.18"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 comment "hid2hci tool needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index c728cb7e20..3527df6161 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_BRLTTY
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
 	help
 	  A daemon providing access to the Linux console for a blind
 	  person using a refreshable braille display.
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 6ae2ac9405..7e8cdc3086 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # bluez5_utils -> dbus, libglib2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bluez5_utils hid plugin
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
@@ -28,9 +28,9 @@ config BR2_PACKAGE_CWIID_WMGUI
 	select BR2_PACKAGE_LIBGTK2
 endif
 
-comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.4"
+comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.18"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 	depends on !BR2_USE_MMU
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c8e1e5d0ed..4c6e01745c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -130,7 +130,7 @@ config BR2_PACKAGE_KODI_AVAHI
 
 config BR2_PACKAGE_KODI_BLUEZ
 	bool "bluetooth"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bluez5_utils hid plugin
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
@@ -138,9 +138,9 @@ config BR2_PACKAGE_KODI_BLUEZ
 	help
 	    Enable bluetooth support
 
-comment "bluetooth support needs a toolchain w/ headers >= 3.4"
+comment "bluetooth support needs a toolchain w/ headers >= 3.18"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
 config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 1dd5dcf058..319415754a 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
 	help
 	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
 	  racer with multiple karts, tracks and modes you can play.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
