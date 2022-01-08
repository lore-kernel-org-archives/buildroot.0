Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BCAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBB234011F;
	Sat,  8 Jan 2022 16:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LQKIeMGopxG; Sat,  8 Jan 2022 16:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0921B40119;
	Sat,  8 Jan 2022 16:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DECC11BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA5F0607FF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_87EEiHl5Fu for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:23:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F52E607C9
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:23:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so2345041wmi.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDMK+SRj4qAlwziH1FVj1jP4w7zbWdjjqwqygqHLw7A=;
 b=luC5FkVQDG529TJPiL5ln5NKxFvz2qfG+PE7w7gz4cvLJusGSE2Ko4L/5JVYhAbnlE
 4HCfZq2nNvM0bwXX5DHPOmoPr1Kz2caRZ8xQ0H/QmWqer98eA9EU+i+QpJisCvIV7MM4
 fdLRm0rlGVw1oUoZaP6BLxgrVYS4MOlydcs29R1m2NZ4RyhZYJYs4umwsKz8alZx+R13
 T/QKFgF3iq0P6LzgoCMdiQluWDTcjBuxznhLPjSp4AviOlkA19yG4cRf56vhbAnKErsF
 PGLKg0Xbve3458TCCvVCKHlAMaVtJnppErViQ8EWN4TqwetCDncpDDWsRvfbVzMssJQz
 aaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDMK+SRj4qAlwziH1FVj1jP4w7zbWdjjqwqygqHLw7A=;
 b=KgbyNF6yJZcqP1x1NUX1+5ILxc2+cnQ36/LaqiWZNjTpbO/u772csSza3TiuVfykSe
 3NxmMgWAW1n4B06sVScK5u0CT4Y0wilpBXKsGk95JJoLFNck439UbIBYFJnPBpp2BBnS
 utwzMOiT2blOt6SvubkTdmKlZJDX6LIY+jPGcwQxj/JnXHHDlPB5NdJzBnK6loDBGBis
 ipJyHrUu674y+Chi+a31Qstgl+EghCWtLDQYdHdcR45559QmnhRhRbzo4BJQrG07CM1H
 isblb2RMFSfK4OZjncArI7/BR/3V8IGeY23Dq6RSvei3lINk73zhlYLhSt4c+fIr+rz7
 SY+Q==
X-Gm-Message-State: AOAM5336teirAfeBKiPc5/fVgi4WNtdh5K4XkADDBVkuBzNk1G3rRqjJ
 tbMTtMDJGcywSn2DwmAKXwQyb11yGok=
X-Google-Smtp-Source: ABdhPJypOvXg+nJ4+y/xziLVLkveBo7KqxRrUUXeK8zFYtnZRaj/vVIEJh3FqkqSPv2poK8V8m4jMw==
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr15079407wmq.19.1641658978286; 
 Sat, 08 Jan 2022 08:22:58 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id s194sm2428762wme.45.2022.01.08.08.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:22:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 17:21:46 +0100
Message-Id: <20220108162146.2735403-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump to
 version 2021.07.01
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/raspberrypi-usbboot/raspberrypi-usbboot.hash | 2 +-
 package/raspberrypi-usbboot/raspberrypi-usbboot.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
index 3f66b12ff1..cedc5fb7e1 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e4a07df05c23e0eba100d4013367e7823e3b8bc72da7b79b031bd346616c6ae5  raspberrypi-usbboot-9324fd7034b9d3606aed8a27da74d6d57e066e7e.tar.gz
+sha256  4565314b38e7c7505b7d32a3b51b49f79c7dd5767d45b86d38e5255ae7489a43  raspberrypi-usbboot-2021.07.01.tar.gz
 
 # License files
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
index 5d7b433c64..2e4194da0b 100644
--- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
+++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-RASPBERRYPI_USBBOOT_VERSION = 9324fd7034b9d3606aed8a27da74d6d57e066e7e
-RASPBERRYPI_USBBOOT_SITE = $(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
+RASPBERRYPI_USBBOOT_VERSION = 2021.07.01
+RASPBERRYPI_USBBOOT_SITE = \
+	$(call github,raspberrypi,usbboot,v$(RASPBERRYPI_USBBOOT_VERSION))
 RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
 RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
