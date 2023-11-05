Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DF5C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 09:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776F060FFF;
	Sun,  5 Nov 2023 09:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 776F060FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uhdkb023Hz93; Sun,  5 Nov 2023 09:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C361560FFB;
	Sun,  5 Nov 2023 09:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C361560FFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C341F1BF57F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A79134051F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A79134051F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSxmHik8zekh for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 09:28:51 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50644400A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 09:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50644400A6
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso20799635e9.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699176528; x=1699781328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56jpO2/yM4yAtFsSG2RjMA3UvTF+48dLjEolUCjAuos=;
 b=ZtiLyj0U4LT8sreExvURLUERVaCBPEf6mIfTzHPHUFwlznZEduffUGdE2Hkn4fz2GY
 XpnEkBMnRygpFk51RQqt9oQ5vkk6QNetHxMD1wmVub69gYvNIEDWBbJJH2sI7sg+GhLX
 jx6JUhJbRBKmAUuYoQuznC/8jJWhSPEo8o42AcfQFkfZdOpyq5ixJcbBBDLpzL+NyK4r
 mQdYkGI0rTRmJgBVxUjMmgYXC0IpLmZ6wr0NFJmJfox4xAKD7HS6boJZ9GO19M3fwtjO
 yYyecT4Qk/SGV7daSBAQDNc3W61M96ZxVPhXbKts6iVVGj5PoyW0SjfyzZ2MZRuQBnLg
 mxiA==
X-Gm-Message-State: AOJu0YzEuvs2wRB3oAWb/Uo2cq52pMLhYiKfcPzRzTaOsdNSbl0573Dk
 Qs+ploOmUQzm5GyjGWWTe6CquG8/E+s=
X-Google-Smtp-Source: AGHT+IHVM3D+OT26h3dat193/ycWWMIavJVaALFAFGixGrajin98htTe2xg6lpFw+qvZuh7x8Zy6Gg==
X-Received: by 2002:a05:600c:203:b0:406:5a14:5c1e with SMTP id
 3-20020a05600c020300b004065a145c1emr8062567wmi.1.1699176528383; 
 Sun, 05 Nov 2023 01:28:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b004078d71be9csm8429520wmb.13.2023.11.05.01.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:28:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 10:28:28 +0100
Message-ID: <20231105092828.458265-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699176528; x=1699781328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=56jpO2/yM4yAtFsSG2RjMA3UvTF+48dLjEolUCjAuos=;
 b=VFry78pAdNUczmTIVUWssTLtfcOzgs3vkJ64AYoKPWlTMNnEQxKkcuhJUxEnjj6/GT
 7x/oFyCo2m5whzhYJTpo3QpxxWB9Z+99qkXM7D6IW8T0bCIKVZX0TEdpuLJQ2nqy9lmE
 IDIX0AX20NZGMIJuxP8ol0kzmaMCDAlB/KWoDTNip8hACU8kORNfwaGA0BfUmR/OaB6g
 tNt4bvQb3RUVAZaMuS6R7+rbYk1YvcFzWF36Ijux5TJ/jGZcQ2HR5mENK9dPKIr0UYQr
 kj/JvIFcXmQcqgPUTTJTzYHpJNtvWF0OlXHwNJxqXLancgUGNLCDPYrI/aQ4mKAq3mkb
 YNlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VFry78pA
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix libftdi build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

flashrom depends on libftdi1 since bump to version 1.3.0 in commit
073b0fc9c1fe9945eccf4b792b948633aae9a9b8:

Dependency libftdi1 found: no
[...]
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/mips64el-buildroot-linux-gnu/12.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: libflashrom.a(ft2232_spi.o): in function `send_buf':
ft2232_spi.c:(.text+0x20): undefined reference to `ftdi_write_data'

Fixes:
 - http://autobuild.buildroot.org/results/11fae0933b38d82f15fec37e78298df232321bcd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/flashrom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 1ccef572da..86bfec40cc 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -11,8 +11,8 @@ FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_MAKE_OPTS = WARNERROR=no
 
-ifeq ($(BR2_PACKAGE_LIBFTDI),y)
-FLASHROM_DEPENDENCIES += host-pkgconf libftdi
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
+FLASHROM_DEPENDENCIES += host-pkgconf libftdi1
 FLASHROM_MAKE_OPTS += \
 	CONFIG_FT2232_SPI=yes \
 	CONFIG_USBBLASTER_SPI=yes
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
