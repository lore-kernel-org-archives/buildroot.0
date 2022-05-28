Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EB4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 10:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 877B94016B;
	Sat, 28 May 2022 10:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7r-sq2oENvU; Sat, 28 May 2022 10:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91BAF405CD;
	Sat, 28 May 2022 10:04:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0A1B1BF4D7
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFA2984C8F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELU-pM-cQJSh for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 10:04:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D8184C7C
 for <buildroot@buildroot.org>; Sat, 28 May 2022 10:04:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C445A84526; Sat, 28 May 2022 09:53:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 12:04:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45115ea557f0c6b8a522cf222351a650160391a0
X-Git-Newrev: 51316159c8b2ea247510c234b35288e292e474e1
X-Patchwork-Hint: ignore
Message-Id: <20220528095328.C445A84526@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: fix gcc 11 Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=51316159c8b2ea247510c234b35288e292e474e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch [1] included in edk2-stable202202 release.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2510255569

[1] https://github.com/tianocore/edk2/commit/ae8272ef787d80950803c521a13a308651bdc62e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
new file mode 100644
index 0000000000..15abdb2840
--- /dev/null
+++ b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
@@ -0,0 +1,48 @@
+From 59aa67f7a4d8efc564b46fe467aaf6eccec17183 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 20 Dec 2021 22:32:38 +0800
+Subject: [PATCH] MdeModulePkg/UsbBusDxe: fix NOOPT build error
+
+gcc-11 (fedora 35):
+
+/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c: In function ?UsbIoBulkTransfer?:
+/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c:277:12: error: ?UsbHcBulkTransfer? accessing 80 bytes in a region of size 8 [-Werror=stringop-overflow=]
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Hao A Wu <hao.a.wu@intel.com>
+(cherry picked from commit ae8272ef787d80950803c521a13a308651bdc62e)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c | 2 +-
+ MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
+index 7529e03e85..b2ce97ca37 100644
+--- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
++++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
+@@ -285,7 +285,7 @@ UsbHcBulkTransfer (
+   IN  UINT8                               DevSpeed,
+   IN  UINTN                               MaxPacket,
+   IN  UINT8                               BufferNum,
+-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
++  IN  OUT VOID                            *Data[],
+   IN  OUT UINTN                           *DataLength,
+   IN  OUT UINT8                           *DataToggle,
+   IN  UINTN                               TimeOut,
+diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
+index 1d2b8a6174..1316a5981f 100644
+--- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
++++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
+@@ -149,7 +149,7 @@ UsbHcBulkTransfer (
+   IN  UINT8                               DevSpeed,
+   IN  UINTN                               MaxPacket,
+   IN  UINT8                               BufferNum,
+-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
++  IN  OUT VOID                            *Data[],
+   IN  OUT UINTN                           *DataLength,
+   IN  OUT UINT8                           *DataToggle,
+   IN  UINTN                               TimeOut,
+-- 
+2.35.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
