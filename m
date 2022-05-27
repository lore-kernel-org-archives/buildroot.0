Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9E5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 11:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FCB42603;
	Fri, 27 May 2022 11:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqzGnvVx0GNk; Fri, 27 May 2022 11:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97154428D1;
	Fri, 27 May 2022 11:22:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 271B51BF40B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 11:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19E1584342
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 11:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGDeumpxNLFk for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 11:22:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18CB684060
 for <buildroot@buildroot.org>; Fri, 27 May 2022 11:22:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u3so5481279wrg.3
 for <buildroot@buildroot.org>; Fri, 27 May 2022 04:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/BgwOqfuoGJZjijGmG0Yg8zZg63L6jQZEXGgD/6esA=;
 b=lKCB1+cVXj9MI0eJ7UwE/hl3wz9XhaCKbY3Kz2tMpRrVcwMCTvzryy8O0ue6JINXzp
 lr86oZP/Pg75t1+u8W1BsgZ/hNLwzU6BILQWuCYE5ZFOat+rvq2HjYGYZ9LxLqPRQU05
 cmpfVSNHocyFJ4RKidIWn2AAkolrHp3XOtO3KjSwqeB6zdkK3uoD5ys24SRpeIlwwT6g
 158FaI80rdbF28TNjJUBuplDNSILYsiO3rcYJz0jrKyFcFD/LGHEpCjVR2pyg79n/Fa6
 vts19LFnz2eLmtJUeqIRwzkkfPmqRmdDtBc/nGPzxetGpapViNQmMU9J0FyGwWh3MKPu
 pizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/BgwOqfuoGJZjijGmG0Yg8zZg63L6jQZEXGgD/6esA=;
 b=Ts5AdxRrx0+SAj5dMCEfl6gpceJ4vSQiFCLTUPvUgr76IczCYi1nSahum1uFZ2uorF
 YNeCxpP/KlJbcrrUlZMXFfZAeUtOULYObPlud5qbzS+RvpVpUlBz4ZdCuVHs8nDKCVRI
 6J+r2oxos82OXwCS2GLOc1RcFwBLnDLGpsTSyElvsej896JfUD38f9wCLg0cR7AgaTzV
 ShK+MaeIr3PD2dnSMrU5zCHp2Hd5mP17RzFrH40Au+EXjlmeTf3yX2Y0GzJyrqiYAWWD
 fz8RFl9dUeSj+mCgHi/uNOXvcMU3Mt9L9z69IxwSS2b8KLdDBxk5t2EUUPK68Rq9O5Fh
 RdzA==
X-Gm-Message-State: AOAM530rV3V28s3IofeNwTunrXLv/zyULMIsICBbnEnrDThvKqp9lA0T
 l0FMvMmK00gxRnrtgItfOD29DV5Z4b0=
X-Google-Smtp-Source: ABdhPJzvcl/5hpOVISc8Gh7sobU6GJ06WXvYTPpvHyY1alDsZJ6UfEmLBbxQIkUE1g0/k+MDJ0fl7A==
X-Received: by 2002:adf:d1a8:0:b0:20f:f808:2ac8 with SMTP id
 w8-20020adfd1a8000000b0020ff8082ac8mr13643891wrc.495.1653650521981; 
 Fri, 27 May 2022 04:22:01 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a5d5592000000b0020c5253d8dasm1496424wrv.38.2022.05.27.04.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 04:22:01 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 13:21:46 +0200
Message-Id: <20220527112146.387164-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/edk2: fix gcc 11 Werror
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch [1] included in edk2-stable202202 release.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2510255569

[1] https://github.com/tianocore/edk2/commit/ae8272ef787d80950803c521a13a308651bdc62e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
---
 ...ePkg-UsbBusDxe-fix-NOOPT-build-error.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch

diff --git a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
new file mode 100644
index 0000000000..f4f1b1565a
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
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
