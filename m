Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A116FEFB7C
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C5D8407E6;
	Fri, 27 Feb 2026 19:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aVv1_HCpZQH; Fri, 27 Feb 2026 19:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8622540D45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772220498;
	bh=9/I78p+AWZszq+zBMMbrelRXAa+X75afhxi0oMteJJU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qmI/0w2m+5TdieRZSVo8hF2T3oq7lzF0V6lbfUK8r2zEDLtxrZjzeEA2IZZ59ZwDU
	 C8gqpBIMPAsnxYReSIu+DDY6ZS3jyygf3p11OjTA2n5Pxxr+y56w16e/7o+Yyoy8QV
	 58AKjRvP/6mAAlQTkxRWuBIH1Uh48FPlia8jKy2/52f3u2xbt56vWLVTKYzACfaeV1
	 FrTtiirc0au0grzskVxrEgHren0xYmK1iXO1uaciz6llvupL+G1nWOyA1+pHmnfEn8
	 YSQxYdL05Qo8QFqCN+auZigXKkh8Xq5oDPVs6SKhZvtuNIjUzdVRUIIEPKSLl9X6jF
	 +u7XCLYXJz1EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8622540D45;
	Fri, 27 Feb 2026 19:28:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AC0D204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B4F540D45
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIYTeiUJZa9W for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A33BB40D4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A33BB40D4A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BA4F846DF; Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 20:24:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13daf36ee2dc089d9bb22d9c2b5c3da2499e4bb0
X-Git-Newrev: 3fcfe01d70cb0f8f350cd6bb1bda914fc7fc8609
X-Patchwork-Hint: ignore
Message-Id: <20260227192813.8BA4F846DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: fix build with libinput
 1.31
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0236384920664602119=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0236384920664602119==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3fcfe01d70cb0f8f350cd6bb1bda914fc7fc8609
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 0433c8d02af803de90b41c42bb41bbc9f2d436ff bumped
libinput to version 1.31.0 which causes a build error with wlroot:

../backend/libinput/switch.c: In function ‘handle_switch_toggle’:
../backend/libinput/switch.c:32:9: error: enumeration value
 ‘LIBINPUT_SWITCH_KEYPAD_SLIDE’ not handled in switch [-Werror=switch]
   32 |         switch (libinput_event_switch_get_switch(sevent)) {

The build error was not yet detected by the autobuilders but can be
reproduced using this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_WLROOTS=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...end-libinput-fix-build-with-libinput-1.31.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch b/package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch
new file mode 100644
index 0000000000..c5ef11ecf0
--- /dev/null
+++ b/package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch
@@ -0,0 +1,51 @@
+From c1452d88114710f5772662b1d8efb9c71edaa34c Mon Sep 17 00:00:00 2001
+From: Aleksei Bavshin <alebastr89@gmail.com>
+Date: Sat, 7 Feb 2026 17:48:16 -0800
+Subject: [PATCH] backend/libinput: fix build with libinput 1.31
+
+Upstream: https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/c1452d88114710f5772662b1d8efb9c71edaa34c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ backend/libinput/meson.build | 4 ++++
+ backend/libinput/switch.c    | 5 +++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/backend/libinput/meson.build b/backend/libinput/meson.build
+index c244eb77a..091b0e0eb 100644
+--- a/backend/libinput/meson.build
++++ b/backend/libinput/meson.build
+@@ -29,3 +29,7 @@ features += { 'libinput-backend': true }
+ wlr_deps += libinput
+ 
+ internal_config.set10('HAVE_LIBINPUT_BUSTYPE', libinput.version().version_compare('>=1.26.0'))
++internal_config.set10(
++	'HAVE_LIBINPUT_SWITCH_KEYPAD_SLIDE',
++	libinput.version().version_compare('>=1.30.901')
++)
+diff --git a/backend/libinput/switch.c b/backend/libinput/switch.c
+index abeec86d7..9dde3c9cb 100644
+--- a/backend/libinput/switch.c
++++ b/backend/libinput/switch.c
+@@ -2,6 +2,7 @@
+ #include <libinput.h>
+ #include <wlr/interfaces/wlr_switch.h>
+ #include "backend/libinput.h"
++#include "config.h"
+ 
+ const struct wlr_switch_impl libinput_switch_impl = {
+ 	.name = "libinput-switch",
+@@ -36,6 +37,10 @@ void handle_switch_toggle(struct libinput_event *event,
+ 	case LIBINPUT_SWITCH_TABLET_MODE:
+ 		wlr_event.switch_type = WLR_SWITCH_TYPE_TABLET_MODE;
+ 		break;
++#if HAVE_LIBINPUT_SWITCH_KEYPAD_SLIDE
++	case LIBINPUT_SWITCH_KEYPAD_SLIDE:
++		return;
++#endif
+ 	}
+ 	switch (libinput_event_switch_get_switch_state(sevent)) {
+ 	case LIBINPUT_SWITCH_STATE_OFF:
+-- 
+GitLab
+

--===============0236384920664602119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0236384920664602119==--
