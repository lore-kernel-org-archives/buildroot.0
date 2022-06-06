Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910D6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB62611E5;
	Mon,  6 Jun 2022 10:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBxrF7f7N14o; Mon,  6 Jun 2022 10:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5749561051;
	Mon,  6 Jun 2022 10:32:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9A501BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E98360F41
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBBUL14Njyeu for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B9A60F38
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0C02686CBF; Mon,  6 Jun 2022 10:19:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:05:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7d3f1549617084ba45f3024820d2ad88fc87d9ee
X-Git-Newrev: 9d471142493dd011681c7d2236e86da6ad04c4d5
X-Patchwork-Hint: ignore
Message-Id: <20220606101958.0C02686CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/edk2: fix gcc 11
 Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d471142493dd011681c7d2236e86da6ad04c4d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Backport a patch [1] included in edk2-stable202202 release.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2510255569

[1] https://github.com/tianocore/edk2/commit/ae8272ef787d80950803c521a13a308651bdc62e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 51316159c8b2ea247510c234b35288e292e474e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
