Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8B2E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 21:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99EDC4052C;
	Thu, 19 Dec 2024 21:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifcDBfRC7mqc; Thu, 19 Dec 2024 21:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 499A94054A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 499A94054A;
	Thu, 19 Dec 2024 21:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D35056C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD49F40288
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 21:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20wGisOG8cBR for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 21:46:10 +0000 (UTC)
X-Greylist: delayed 1763 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Dec 2024 21:46:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 886AB40177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 886AB40177
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.153.107;
 helo=usb-smtp-delivery-107.mimecast.com; envelope-from=jkastelic@thinksrs.com;
 receiver=<UNKNOWN> 
Received: from usb-smtp-delivery-107.mimecast.com
 (usb-smtp-delivery-107.mimecast.com [170.10.153.107])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 886AB40177
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 21:46:10 +0000 (UTC)
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-8-zUFuGUS0OPavRAOuarF3Ng-1; Thu, 19 Dec 2024 13:46:07 -0800
X-MC-Unique: zUFuGUS0OPavRAOuarF3Ng-1
X-Mimecast-MFC-AGG-ID: zUFuGUS0OPavRAOuarF3Ng
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-29fb38de98eso239434fac.1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 13:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734644766; x=1735249566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FRlQQ/ZJbBOMf+d53C6DuMx58xTf4a+Kj42cLywn7tk=;
 b=JiN4ko3dzPW+UV1TFcz5FniRjdQk/maZqBI8ydb8HGVn3IMXmzEFMSW4ZqO3O/YqBd
 Ru253K2x07elEYx6IdEr+I8L1FvGIp94SkN3JeD8NDobkbX+9ySKHesQReE+QiVYgUXg
 T5WcLnex+lwzG5WgSCppQ4yi6MklCuhZU3ebfmzOTGtyuTUzxRQ7g5qlSK+qfAA/qIKk
 xy6E4aaeiH7XLY58Gta3bFRFW04GBf+i/YGKj5dXqbHnlIflnkjxUke2l7qwgS2oOitJ
 aHlmUgAijktt3rWXsbAHNo8uNwqxOAJA/H5ZitpIH/2rb8gnfl3BTK/EnAobiznyHZTJ
 6Rdw==
X-Gm-Message-State: AOJu0Yy6mymrduVRJQBiEiFSySp0lfpOTm6qeJmMZe97bN7a/+Y4yOtq
 abuQEgL2lYbBuBLZIgcyKNhu+Mn+/uTxOOu3VPU7hM3ilWMBNGRD21wXYFlBbzQmhAUVCOlanuJ
 fztts7rQE+KLx9nQRTPNHf86O/01mR8t+89IBeUvX/5bqHEFXb+vT5vddl6RJvy0=
X-Gm-Gg: ASbGncvEhESx4vZ5ZG+lQPDM+LQLy/YbZdeidj3jOVUgB9vK49/AOIKi+9b++cBHOJ/
 t31cw8ke333u3nDRFh8MDKTXQccFRGg0kJOB+l/MEcP1+hJnYz5rveC/E1tY581+k8+TFpq4/P/
 vx2bbI1QbKpHKdkO0lv35wa29cEDUn/MQpubln3xhGovfVdSH4TtAStzQmsGChMVsyWSmH2p2Bh
 FJde48KE6gXJuzTt2RR4EFnRF+t1vkMrjcdsOdDMggwktMeAP1JG4BZaI+IfLal+DznDzcmpV4l
 3OI9UDQ6fJ2ojyF7hP1K+IvRklsEfF3+O+xwQFzBKlYMIRB3z7btnnfsUJQ=
X-Received: by 2002:a05:6870:1592:b0:2a3:a40a:a3bb with SMTP id
 586e51a60fabf-2a7fb4181c9mr315364fac.39.1734644766137; 
 Thu, 19 Dec 2024 13:46:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzUzmLdGKP+Yx0XohG9a9KtErxyUS9hwHOfCmTDd5TWz1bWlyd/0NmYp2JCda/XKY4iht4HA==
X-Received: by 2002:a05:6870:1592:b0:2a3:a40a:a3bb with SMTP id
 586e51a60fabf-2a7fb4181c9mr315350fac.39.1734644765767; 
 Thu, 19 Dec 2024 13:46:05 -0800 (PST)
Received: from SRS1720.corp.thinksrs.com
 (107-207-172-155.lightspeed.wlfrct.sbcglobal.net. [107.207.172.155])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2a7d6f3e028sm544288fac.0.2024.12.19.13.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 13:46:05 -0800 (PST)
From: Jakob Kastelic <jkastelic@thinksrs.com>
To: buildroot@buildroot.org
Cc: Jakob Kastelic <jkastelic@thinksrs.com>
Date: Thu, 19 Dec 2024 13:45:55 -0800
Message-Id: <20241219214555.3435133-1-jkastelic@thinksrs.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ujbYJxAxl69Jg-u6BrJWRRocTz8I0dkkOaoJCJE_TEk_1734644767
X-Mimecast-Originator: thinksrs.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinksrs.com; 
 s=mimecast20220819; t=1734644769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WDq5iyN5sbOVW/yCaz+EBaTNwJjvhbNb3PTU5QTrJgk=;
 b=k6/pWUwzg8NXcV+4ZhqT9uAsZc8X+8aElmzVDD7wwbdITrZAyP66uvd5z2pY3Ymf/3u1m7
 haB+p9kD3TNkd6uRL8UG2zFpwTqUcCk/UyGXaaR68upVnybz7J7ds7O0lO1bS5EOfdAAEN
 /mn53O5B/eXpFIKfDCu1/gpyABWbzT8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=thinksrs.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=thinksrs.com header.i=@thinksrs.com header.a=rsa-sha256
 header.s=mimecast20220819 header.b=k6/pWUwz
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: optional Linux
 as BL33
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arm Trusted Firmware (TF-A) can be used to load U-Boot or another
bootloader, which in turn loads the Linux kernel. However, TF-A is
capable of loading the kernel directly. To this end, we need to define
the BL33 and BL33_CFG compile options containing, respectively, the
zImage and the DTB.

This config introduces a new config option,
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33, which sets the BL33 and
BL33_CFG parameters, and ensures that the kernel is built before the
TF-A by having linux as a _DEPENDENCY of the TF-A.

Signed-off-by: Jakob Kastelic <jkastelic@thinksrs.com>
---
 boot/arm-trusted-firmware/Config.in           | 19 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index c8deede9cd..929561fc87 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -182,6 +182,25 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
 	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
 	  build system, the dependency between ATF and EDK is reversed.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33
+	bool "Linux kernel"
+	depends on BR2_LINUX_KERNEL
+	help
+	  This option allows to embed the Linux kernel as the BL33 part
+	  of the ARM Trusted Firmware.
+
+	  Do not choose this option if you intend to use U-Boot or
+	  another second-stage bootloader. With this option, TF-A starts
+	  Linux directly.
+
+	  With this option chosen, whenever the Linux zImage changes,
+	  TF-A may need need to be re-built to create the latest FIP
+	  file. Since Buildroot does not track package dependencies,
+	  this has to be done manually by invoking `make
+	  arm-trusted-firmware-rebuild`. The final boot medium image may
+	  need to be re-generated as well to include the latest FIP file
+	  version.
+
 endchoice
 
 if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 172a930b5c..6fc15ab700 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -132,6 +132,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UB
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/zImage
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33_CFG=$(BINARIES_DIR)/$(LINUX_DTBS)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += linux
+endif
+
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
