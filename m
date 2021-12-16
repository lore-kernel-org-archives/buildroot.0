Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82160C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 17:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2295361031;
	Thu, 16 Dec 2021 17:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rWzB-0oeu60; Thu, 16 Dec 2021 17:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6759461034;
	Thu, 16 Dec 2021 17:17:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9FEC1BF3AE
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 17:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B976282F9E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 17:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRAiI9Ln4unC for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 17:17:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE6282D57
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 17:17:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EE3FAE0005;
 Thu, 16 Dec 2021 17:17:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mxuNL-00077l-85; Thu, 16 Dec 2021 18:17:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 18:16:55 +0100
Message-Id: <20211216171656.27339-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: security bump to
 version 21.1.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerabilities:

* CVE-2021-4008/ZDI-CAN-14192 SProcRenderCompositeGlyphs out-of-bounds
  access

  The handler for the CompositeGlyphs request of the Render extension does
  not properly validate the request length leading to out of bounds memory
  write.

* CVE-2021-4009/ZDI-CAN 14950 SProcXFixesCreatePointerBarrier out-of-bounds
  access

  The handler for the CreatePointerBarrier request of the XFixes extension
  does not properly validate the request length leading to out of bounds
  memory write.

* CVE-2021-4010/ZDI-CAN-14951 SProcScreenSaverSuspend out-of-bounds access

  The handler for the Suspend request of the Screen Saver extension does not
  properly validate the request length leading to out of bounds memory
  write.

* CVE-2021-4011/ZDI-CAN-14952 SwapCreateRegister out-of-bounds access

  The handlers for the RecordCreateContext and RecordRegisterClients
  requests of the Record extension do not properly validate the request
  length leading to out of bounds memory write.

For details, see the advisory:
https://lists.x.org/archives/xorg-announce/2021-December/003122.html

Builds without systemd unfortunately got broken.  Add a patch fixing that
from an upstream merge request:
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/827

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...error-when-built-without-logind-plat.patch | 90 +++++++++++++++++++
 .../xserver_xorg-server.hash                  |  6 +-
 .../xserver_xorg-server.mk                    |  2 +-
 3 files changed, 94 insertions(+), 4 deletions(-)
 create mode 100644 package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch

diff --git a/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch b/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
new file mode 100644
index 0000000000..164c0039bd
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
@@ -0,0 +1,90 @@
+From 17b6ab4d8cecf55a3784dbefbef9bfcf84ee3b1b Mon Sep 17 00:00:00 2001
+From: Jocelyn Falempe <jfalempe@redhat.com>
+Date: Thu, 16 Dec 2021 15:46:43 +0100
+Subject: [PATCH] Fix compilation error when built without logind/platform bus
+
+This was introduced by commit 8eb1396d
+
+Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
+[Peter: from https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/827]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ hw/xfree86/common/xf86Events.c               |  9 +--------
+ hw/xfree86/os-support/linux/systemd-logind.c | 16 +++++++++++-----
+ include/systemd-logind.h                     |  4 ++--
+ 3 files changed, 14 insertions(+), 15 deletions(-)
+
+diff --git a/hw/xfree86/common/xf86Events.c b/hw/xfree86/common/xf86Events.c
+index 6076efa80..395bbc7b3 100644
+--- a/hw/xfree86/common/xf86Events.c
++++ b/hw/xfree86/common/xf86Events.c
+@@ -383,14 +383,7 @@ xf86VTLeave(void)
+         xf86GPUScreens[i]->LeaveVT(xf86GPUScreens[i]);
+ 
+     if (systemd_logind_controls_session()) {
+-        for (i = 0; i < xf86_num_platform_devices; i++) {
+-            if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
+-                int major, minor;
+-                major = xf86_platform_odev_attributes(i)->major;
+-                minor = xf86_platform_odev_attributes(i)->minor;
+-                systemd_logind_drop_master(major, minor);
+-            }
+-        }
++        systemd_logind_drop_master();
+     }
+ 
+     if (!xf86VTSwitchAway())
+diff --git a/hw/xfree86/os-support/linux/systemd-logind.c b/hw/xfree86/os-support/linux/systemd-logind.c
+index 35d5cc75b..f6a223a55 100644
+--- a/hw/xfree86/os-support/linux/systemd-logind.c
++++ b/hw/xfree86/os-support/linux/systemd-logind.c
+@@ -308,13 +308,19 @@ cleanup:
+  * and ensure the drm_drop_master is done before
+  * VT_RELDISP when switching VT
+  */
+-void systemd_logind_drop_master(int _major, int _minor)
++void systemd_logind_drop_master(void)
+ {
+-    struct systemd_logind_info *info = &logind_info;
+-    dbus_int32_t major = _major;
+-    dbus_int32_t minor = _minor;
++    int i;
++    for (i = 0; i < xf86_num_platform_devices; i++) {
++        if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
++            dbus_int32_t major, minor;
++            struct systemd_logind_info *info = &logind_info;
+ 
+-    systemd_logind_ack_pause(info, minor, major);
++            major = xf86_platform_odev_attributes(i)->major;
++            minor = xf86_platform_odev_attributes(i)->minor;
++            systemd_logind_ack_pause(info, minor, major);
++        }
++    }
+ }
+ 
+ static DBusHandlerResult
+diff --git a/include/systemd-logind.h b/include/systemd-logind.h
+index a8af2b96d..5c04d0130 100644
+--- a/include/systemd-logind.h
++++ b/include/systemd-logind.h
+@@ -33,7 +33,7 @@ int systemd_logind_take_fd(int major, int minor, const char *path, Bool *paus);
+ void systemd_logind_release_fd(int major, int minor, int fd);
+ int systemd_logind_controls_session(void);
+ void systemd_logind_vtenter(void);
+-void systemd_logind_drop_master(int major, int minor);
++void systemd_logind_drop_master(void);
+ #else
+ #define systemd_logind_init()
+ #define systemd_logind_fini()
+@@ -41,7 +41,7 @@ void systemd_logind_drop_master(int major, int minor);
+ #define systemd_logind_release_fd(major, minor, fd) close(fd)
+ #define systemd_logind_controls_session() 0
+ #define systemd_logind_vtenter()
+-#define systemd_logind_drop_master(major, minor)
++#define systemd_logind_drop_master()
+ #endif
+ 
+ #endif
+-- 
+2.20.1
+
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index d389e6713a..6008661db1 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-November/003116.html
-sha256  782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd0363e1c2346ea755  xorg-server-21.1.1.tar.xz
-sha512  8608ed9c1537c95e8a3adea5e3e372a3c5eb841f8e27c84283093f22fb1909e16a800006510da684b13f8f237f33b8a4be3e2537f5f9ab9af4c5ad12770eef0d  xorg-server-21.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2021-December/003125.html
+sha256  c20bf46a9fe8e74bf4e75430637e58d49a02d806609dc161462bceb1ef7e8db0  xorg-server-21.1.2.tar.xz
+sha512  6d7a0d29d5be09f80ed505c4d6ae964795127525a0ab73a4eab4f601788ab3627033143e5aeb4c2565c6683dd3402084d13acab5554606fbd519c4aec0a79def  xorg-server-21.1.2.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2518776da8..0cadba92a3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.1
+XSERVER_XORG_SERVER_VERSION = 21.1.2
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
