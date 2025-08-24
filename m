Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE460CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 11:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC37660A78;
	Sun, 24 Aug 2025 11:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdNSrmXB2T9e; Sun, 24 Aug 2025 11:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB46460AE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB46460AE6;
	Sun, 24 Aug 2025 11:03:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E070ECA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 11:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6ECD60AE6
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 11:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z9QU_Aiq-1M for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 11:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0985160A78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0985160A78
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 11:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04099879E0; Sun, 24 Aug 2025 11:03:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 13:01:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9
X-Git-Newrev: 0f20d9a9b8a7520ec747c785de9f522f5f81374d
X-Patchwork-Hint: ignore
Message-Id: <20250824110318.04099879E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-userland: fix build with GCC
 15.x
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f20d9a9b8a7520ec747c785de9f522f5f81374d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following defconfig:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_RPI_USERLAND=y
 # BR2_TARGET_ROOTFS_TAR is not set

will fail to build due to two issues in various part of rpi-userland
making GCC 15.x unhappy.

Patch 0008-Fix-conflicting-types-build-error.patch is taken from a
pull request already submitted by a contributor to the upstream
project.

Patch 0009-Fix-raspicommonsettings_parse_cmdline.patch is backported
from upstream, and can be dropped next time we bump rpi-userland.

Note that there are no autobuilder failures for this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0008-Fix-conflicting-types-build-error.patch   | 41 ++++++++++++++++++++++
 ...009-Fix-raspicommonsettings_parse_cmdline.patch | 28 +++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch b/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
new file mode 100644
index 0000000000..349ef2027e
--- /dev/null
+++ b/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
@@ -0,0 +1,41 @@
+From c2337c83c627dd94f9b673361dca6ffafca7f59b Mon Sep 17 00:00:00 2001
+From: Jonas Kvinge <jonas@jkvinge.net>
+Date: Sun, 6 Jul 2025 20:21:00 +0200
+Subject: [PATCH] Fix conflicting types build error
+
+Upstream: https://github.com/raspberrypi/userland/pull/744
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ interface/vchiq_arm/vchiq_lib.c       | 2 +-
+ interface/vmcs_host/vc_vchi_gpuserv.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/interface/vchiq_arm/vchiq_lib.c b/interface/vchiq_arm/vchiq_lib.c
+index 133d5ca..7a2dae5 100755
+--- a/interface/vchiq_arm/vchiq_lib.c
++++ b/interface/vchiq_arm/vchiq_lib.c
+@@ -537,7 +537,7 @@ vchiq_bulk_receive_handle(VCHIQ_SERVICE_HANDLE_T handle,
+    int size,
+    void *userdata,
+    VCHIQ_BULK_MODE_T mode,
+-   int (*copy_pagelist)())
++   int (*copy_pagelist)(char *vcptr, const struct pagelist_struct *pagelist))
+ {
+    VCHIQ_SERVICE_T *service = find_service_by_handle(handle);
+    VCHIQ_QUEUE_BULK_TRANSFER_T args;
+diff --git a/interface/vmcs_host/vc_vchi_gpuserv.h b/interface/vmcs_host/vc_vchi_gpuserv.h
+index fc0bfee..ce6cb58 100755
+--- a/interface/vmcs_host/vc_vchi_gpuserv.h
++++ b/interface/vmcs_host/vc_vchi_gpuserv.h
+@@ -58,7 +58,7 @@ struct sync_job_s {
+ 
+ struct gpu_callback_s {
+   // callback to call when complete (can be NULL)
+-  void (*func)();
++  void (*func)(void*);
+   void *cookie;
+ };
+ 
+-- 
+2.50.1
+
diff --git a/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch b/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch
new file mode 100644
index 0000000000..df11d591fc
--- /dev/null
+++ b/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch
@@ -0,0 +1,28 @@
+From cf6d0ac0d31fcc2e64c83b8105b078e792f2d441 Mon Sep 17 00:00:00 2001
+From: Krawlow <mglarecerca@gmail.com>
+Date: Wed, 23 Mar 2022 16:46:18 +0100
+Subject: [PATCH] Fix raspicommonsettings_parse_cmdline
+
+Fix raspicommonsettings_parse_cmdline's definition to match declaration
+
+Upstream: c4fd1b8986c6d6d4ae5cd51e65a8bbeb495dfa4e
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ host_applications/linux/apps/raspicam/RaspiCommonSettings.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host_applications/linux/apps/raspicam/RaspiCommonSettings.h b/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
+index 75b2937..2e9de7d 100644
+--- a/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
++++ b/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
+@@ -54,6 +54,6 @@ typedef struct
+ void raspicommonsettings_set_defaults(RASPICOMMONSETTINGS_PARAMETERS *);
+ void raspicommonsettings_dump_parameters(RASPICOMMONSETTINGS_PARAMETERS *);
+ void raspicommonsettings_display_help();
+-int raspicommonsettings_parse_cmdline(RASPICOMMONSETTINGS_PARAMETERS *state, const char *arg1, const char *arg2, void (*app_help)());
++int raspicommonsettings_parse_cmdline(RASPICOMMONSETTINGS_PARAMETERS *state, const char *arg1, const char *arg2, void (*app_help)(char*));
+ 
+ #endif
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
