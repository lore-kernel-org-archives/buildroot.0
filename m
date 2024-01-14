Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAF7C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 10:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C4440159;
	Sun, 14 Jan 2024 10:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50C4440159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id km2wm9lZ0_0S; Sun, 14 Jan 2024 10:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DEDB40187;
	Sun, 14 Jan 2024 10:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DEDB40187
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 109441BF2E4
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB26160BDE
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB26160BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zFgPtclmEbM for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 10:16:27 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 006A960BD1
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 10:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006A960BD1
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e6944a1caso17219555e9.0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 02:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705227384; x=1705832184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tCR0FUhid76us2sFDXdmog50kI+s1C53GfvtitrqoL0=;
 b=odkIL6XnNIZGG76ld5UAOfw6UnxNfijxC9vQMW7vElK92UFio5Kc2skhURBniVaaRh
 LTOJawmQiXZRr8At9OEzFA8E6wizG9ajtNaa95g3NF5DdIKsolY/hHnYtW014+8w6wiq
 pJyABWjLFkQ4Fm3LlDzLVH0qBtmjpEXq7dltXZr4DBuF6opyNhpsYLCkw0o2uh+3yXWv
 iSyjT73IvZpNSmxk66XL0GyMzZr8qdV/dLHU7hzzRfuli5JZ99Vb7fODXvMl/8Jxxnfc
 Gz4bkSiBNh+hGatFz+ksBzfk1kaMe0d/e9jHp4uNcytt4oaNYUiylyJn3q8EaOWclHPR
 2uew==
X-Gm-Message-State: AOJu0YxesNJecfZo9K7fIZ9kH+BQUZT32qGydSsu1/qALJQTmBP5jR/a
 9infzae1QPg9iuwWhNMBDX+437bu4R8=
X-Google-Smtp-Source: AGHT+IFn3L09U1RZhWsIP5QRqrHZkyTda1oTvQ0nDSMqtO5MBl82sJj5VIAosSg8srufpxI2PB/8jw==
X-Received: by 2002:a05:600c:4b0f:b0:40e:48e2:7715 with SMTP id
 i15-20020a05600c4b0f00b0040e48e27715mr1901661wmp.233.1705227383671; 
 Sun, 14 Jan 2024 02:16:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040e3bdff98asm15750452wmn.23.2024.01.14.02.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 02:16:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 11:16:19 +0100
Message-ID: <20240114101619.7120-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705227384; x=1705832184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tCR0FUhid76us2sFDXdmog50kI+s1C53GfvtitrqoL0=;
 b=hSHwluh4e/GndaiBuH8FV4wdnJEcUdLNu3Sxke0PzQjksa0tU79rQpAeuQ8FrKdSxJ
 W5WIGFWxEfgs74sovze2U+pPcVj3FaRPSK0Y/1tKBKIpbirkiA4m3TO4kxl+2OVSPe6b
 lSscXnUctqEuvgx14tSulLpZ69BwfkAkNmEn7e+kUoDmyx0SBJmzN0p+BUK9yN6a2jN2
 heLE5BVvjMmxegsSBnV7TzM/wsnmFJm72PrPNgf7miJPwsi3ninyJTwf/jlGIIpX+7+0
 jfv3KOueSeUQ2OfNV0xIqIv4NqEYXQU75+CW2WxGp6KaNyrJ+dQ3OT0x1HQynzszcLTf
 NNYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hSHwluh4
Subject: [Buildroot] [PATCH 1/1] package/criu: disable on aarch64_be
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

armv8a aarch64_be raises the following build failure since the addition
of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

Error (compel/arch/aarch64/src/lib/handle-elf-host.c:30): Unsupported Elf format detected

Fixes:
 - http://autobuild.buildroot.org/results/8eaa881a926d138a0bfd3f1076246088994e883f
 - http://autobuild.buildroot.org/results/8de9b4d6b26e06f6b4457a31366bdc0d8a8c34ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/criu/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index fc0da823b3..02d000e49b 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -1,10 +1,10 @@
 # criu only builds on certain architectures
 config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARM_CPU_ARMV6
-	default y if BR2_ARM_CPU_ARMV7A
-	default y if BR2_ARM_CPU_ARMV7M
-	default y if BR2_ARM_CPU_ARMV8A
+	default y if BR2_arm && BR2_ARM_CPU_ARMV6
+	default y if BR2_arm && BR2_ARM_CPU_ARMV7A
+	default y if BR2_arm && BR2_ARM_CPU_ARMV7M
+	default y if BR2_arm && BR2_ARM_CPU_ARMV8A
 	default y if BR2_aarch64
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
