Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6099CC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 12:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D5960D4E;
	Fri, 11 Jul 2025 12:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4VNAYfObhyV; Fri, 11 Jul 2025 12:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DFEF60D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DFEF60D50;
	Fri, 11 Jul 2025 12:06:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8FCB1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA86240A02
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8M0CW4-dv8j2 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 12:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63EF240A1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EF240A1F
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63EF240A1F
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-607cc1a2bd8so3282475a12.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 05:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235565; x=1752840365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3FbuPlr6/SuwaO0gHUDcIF6SsWwYpSdV+RqVKIBEbg=;
 b=Q2rdWqduufBkzEjkQ+BYdDROCK6F86N1JaK1xI6vG/PMsv7lcXEVEurA0GBZvbG52T
 OA+6VQEUr0Jjet9SCq5pn1iKns0unGSxLvqxBxRvK7WpEtspW35P6JgZpEf9+twt+3uq
 IE1kzwYI93omXMpBBOUwwt5aOCWDIW8a+UOXLI8hcs+g9NpcBWlCapi9E1+yY1nmjblc
 0SiDQj4W8IpN4FEJo+2Ds/+KLlnWv3Gm0PGXkjb08nmXXbrp53Ir+evQ0bWNd2M4S44g
 PcGGItJr3SvG3vPeQ4YqCcwlcDFTjFFMjEzq00izQ5iTMP0PQZu/INPNHpFSNQWkdTcd
 JOEA==
X-Gm-Message-State: AOJu0Yzt1qXKJDGRsrnNtxqiJYSwCprseEHOV8dMiBO/NlnToFSJtZ+y
 YqD6W/0GwM+p6i6+YXRx6FVphi4Ez8PqkQSZghjpKzjzBWBhKBkuyeebyeVnnw==
X-Gm-Gg: ASbGncvwA8w7CYzX3v9NAE1kSEHAwa2RivuasAlZKG/8PGQwNtOJu2SQWZGfbbx7ASf
 lBdW0zfk+kIEAdJJSKZ6NRQjyO5dhvPUhQODg+oSUdyhCZsur2b2y0S1/WQjcLwTynT6HlFLmbx
 FC2JN4j4Hm9H6P3x7oC1Z0v49Bm0A34J11lstyZEBDL7mKiVQJ0V42IJw0i8RTkkplkQw0bJtWj
 fwN5qSklUuJsM5fhdGbxAp2o49CzMNRZScGgVyRG6DwqBJdf4z8jvb53LbWr4O/NSYECr0zkFno
 FyEqUteAMzSElwaqIki0zMmVaUN5or3FnWe1qsmqKEBz3gwVDvruHV+dEIgSH6FJGn1lQsxMSFo
 +6mH4acUH9PVdNbrIryN0QXu6W4PMVa8JSSFUtA==
X-Google-Smtp-Source: AGHT+IFOrqXQPcrVp1hInH+NPDWnvlDaM8tMO6lOMC6HyNHqS9bsBmwB4esHZg1lTRdgk/BBf25fSg==
X-Received: by 2002:a05:6402:35d5:b0:601:ad95:ca6d with SMTP id
 4fb4d7f45d1cf-611e763839cmr2649491a12.8.1752235563695; 
 Fri, 11 Jul 2025 05:06:03 -0700 (PDT)
Received: from hthiery.kontron.local ([77.21.162.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611d50d6715sm1595944a12.6.2025.07.11.05.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:06:03 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 14:05:46 +0200
Message-Id: <20250711120544.315926-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711120544.315926-1-heiko.thiery@gmail.com>
References: <20250711120544.315926-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752235565; x=1752840365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3FbuPlr6/SuwaO0gHUDcIF6SsWwYpSdV+RqVKIBEbg=;
 b=U07dXXkbcp3g+cu12gKJHl7iCcM27KxZXVy70bKXjfDB53YQBXqGf3To0TBis5gIxd
 XudchWU4prAWFlI2zg4nrcHjJPrf48bx4LLEVjr59G30SYqxR39Bpq6I2+fAlS5YW/fI
 r5yDNQ5+x6lKOh32aoXzzt/VkhGFD2w0kubHejfJCfJupzz7F9vxBiiS2G9T/ZYKJjS5
 7uqaN+hXQfJ1PBIU+vfZxRlGllQ24NhoS0hWDvKJSI5QRpDg/rwlMqOm6XFe98t+PyAq
 iqQxtRZQNB4GyL1g5OE2S/76JLchZ/Pwwh9Q4hydEx6oGWXIbeU8O42qqjJBJ4QBoCY3
 vfgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=U07dXXkb
Subject: [Buildroot] [PATCH] package/linux-firmware: add support for PowerVR
 rogue
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Michael Walle <michael@walle.cc>,
 Bryan Brattlof <bb@ti.com>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This "powervr" directory has been present in linux-firmware since
version 20231211.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 34f3fb7691..54910df6fd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -729,6 +729,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
 	  Firmware files for Arm Mali 10th generation GPU
 	  needed by the linux panthor kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE
+	bool "PowerVR Technologies Rogue GPU firmware"
+	help
+	  Firmware files for PowerVR Technologies Rogue video cards.
+
 endmenu
 
 menu "Serial adapters firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 38212e12ac..b9fd471e85 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -931,6 +931,11 @@ LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE),y)
+LINUX_FIRMWARE_DIRS += powervr
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.powervr
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
 LINUX_FIRMWARE_FILES += rp2.fw
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
