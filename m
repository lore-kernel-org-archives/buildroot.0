Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E483EC072A2
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 15:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD42420A2;
	Fri, 17 Nov 2023 15:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BD42420A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_iEzjCJ8FGI; Fri, 17 Nov 2023 15:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B1641FDB;
	Fri, 17 Nov 2023 15:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B1641FDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 974C01BF303
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 15:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7989D41FDB
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 15:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7989D41FDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCB1G_eo58oW for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 15:51:54 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC5BD41FC5
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 15:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC5BD41FC5
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40a48775c58so17581785e9.3
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 07:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700236311; x=1700841111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Y5xE+XnAgjE+WK1UV0zuvHwncuxwMbyfOMnSYLL468=;
 b=iptOPu/EMUxWvht6BM4Ejg8NJPf12zCKswW+hI1EWRJDqp4SqwJWm7Y8Ye5mBoaTx+
 gaCAhp5BqKd8DBAZTy2g5Gnv4Z5ejKQq6NkYASS81oexyInTDs3rmfaXluAmCAWAFAxo
 fve6wM6rY49fqxpuWmJegNaPLKPwDJGedf3V0h6L4UH3+kV63Imb4fD1/Z5FlBsX/Ci6
 I0sGjBFh7RqhlBD7vIX0+pS/RGs/LL6IzptiX7pbGVpxucLEVR5JVmPOarkdTZLV7Joh
 aNQ/B8COPFIX/nN+4ILqN6pFt1aY4WAs8lcm5SNIaZbnywp3ConKIwhvU2kIoIrMZ6+c
 ksng==
X-Gm-Message-State: AOJu0YyGLWok/m1LN6DJOJy3p4vfmeEilGRnWsoCZNNPDkaXYA99j6Vt
 TFXziS4H0lgyD2yubTVbtTZ2Of2YssFjlRoXPYUb5Uyn
X-Google-Smtp-Source: AGHT+IGSv12E5LyE9x6byYru/udaIrPM8/ynmYRTcq4mM8s/nPrWD3K3pcSzugRfMYsP0Z1yglwkPg==
X-Received: by 2002:a05:600c:1c92:b0:402:f501:447c with SMTP id
 k18-20020a05600c1c9200b00402f501447cmr5118773wms.0.1700236310798; 
 Fri, 17 Nov 2023 07:51:50 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c2e0500b003feea62440bsm3124983wmf.43.2023.11.17.07.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 07:51:50 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 16:50:33 +0100
Message-Id: <20231117155033.69419-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700236311; x=1700841111;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Y5xE+XnAgjE+WK1UV0zuvHwncuxwMbyfOMnSYLL468=;
 b=bxKJVtU3K3y3l1BJkP/utkDkL4Uebv9YwUHAnyXkiBU+pI5cpZTtg+FAuI8TsoIdr0
 Aiyh2NJZ8yt/jky1H/gbOUYSkg9FQbNhIkcXkYBMeRTFAb49O7wBS9hObutBHMROhx3x
 M4Qcpi2c9/ZZj9fWydJ/bm7ez/pVu/ChxQbV+FZhYwq9qPfkcdZwcR7XxHOLR3zmfC6X
 OJuFhfY/tUGHQcvc3Cn6HH/4VmPk97dpHWs92wpTwvJgs5O5Tqf4ZMD+TRab5OIhOLRG
 4DsrJgtqoYIsU0Lm39YChq5OQE/803opYmAJvH8c+dxEhq9aycEu/PfGXHBDpoFOiQUM
 uE6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=bxKJVtU3
Subject: [Buildroot] [PATCH] board/khadas/vim3: add the path of the
 devicetree in extlinux.conf
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Without this patch, the devicetree used by linux at runtime is
the u_boot devicetree.

While using rusticl on the khadas vim3 board with the default
extlinux.conf, mesa's panfrost driver return "gpu shed timeout"
errors. Adding "devicetree /meson-g12b-khadas-vim3.dtb" to the
extlinux.conf file solve the problem. Linux successfully boot
with and without the change but without this patch the devicetree
used by linux at runtime is the u-boot devicetree.

The differences between the u-boot devicetree and the linux
devicetree are:
-The u-boot devicetree contains two more nodes than the linux devicetree. Those nodes are:
    - smbios : compatible option is set to "u-boot,sysinfo-smbios".
    - __symbols__ : present if -@ or --symbols is used during the devicetree compilation.
-Most of u-boot devicetree nodes have a "phandle" property.
-SoC and vpu have a "u-boot,dm-pre-reloc;" property.
-Some aliases are different.
-The u-boot operating points tables contains more nodes.
The size difference between the u-boot devicetree and the linux
devicetree is approximately 3.5kB.

During runtime, the linux devicetree have the "phandle" and
"u-boot,dm-pre-reloc;" properties and the smbios node. So,
The runtime devicetree is the one from u-boot.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---

Without this patch, there is 18 lines modified in the runtime
devicetree compared to the u-boot devicetree. These 18 same lines
are also modified in the runtime devicetree with this patch
compared to the linux devicetree. Those lines may be modified by
u-boot during the boot process.
The 18 lines added/modified by u-boot during the boot process are:
-The comments about the device tree characteristics are modified.
-The memreserve is added.
-A serial number is added.
-The u-boot version is added.
-The bootargs are added.
-The CVBS framebuffer is enabled.
-The local-mac-address is set.
-The memory size is modified.
---
 board/khadas/vim3/extlinux.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/khadas/vim3/extlinux.conf b/board/khadas/vim3/extlinux.conf
index fede99b502..2b1544a5cc 100644
--- a/board/khadas/vim3/extlinux.conf
+++ b/board/khadas/vim3/extlinux.conf
@@ -1,4 +1,5 @@
 default buildroot
 label buildroot
    kernel /Image
+   devicetree /meson-g12b-a311d-khadas-vim3.dtb
 append root=/dev/mmcblk0p2 rootwait console=ttyAML0,115200
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
