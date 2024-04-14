Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B4AC4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 18:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8038128D;
	Sun, 14 Apr 2024 18:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsCYIPF0Y-aH; Sun, 14 Apr 2024 18:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF06812C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF06812C2;
	Sun, 14 Apr 2024 18:14:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92DD71BF3C3
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 18:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8073B40154
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 18:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qx0BaYJU4nsz for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 18:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 910944013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910944013B
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 910944013B
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 18:14:26 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so3273279a12.3
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 11:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713118464; x=1713723264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kcqczHhr9DeTLEjS9ulWz3q1e5f9VlWTXEb+X8CJerg=;
 b=AKtW9XOIUyoOrnLDgHWytKjGLWR6TJm9r7n3X2w9Is/EwnSJjSwqGXyOo4gBV8YkFa
 XrfORF9PWW4lM4Jo/JWlX3xKOUBZ+W6Y9xdzlXGqv9VzGpY3k7gp8rzNogdQFcQhpKdF
 uHFjuaFDets4mL5PDMkpglEd5e/m0kU9VimAgYyxJhmYUVeQ0ixdtPTtqQCeKf6cwpiE
 6Z97rPyShkoV50kVgDI1eekQ/WVTxukvijr7tXq6iWgF/nF1YI++T1hXduaKPCrwjb51
 CI/+xn54a14gFNjRulVps4BItqcR+ZEAmu5G4KOUP4jkYhsn7cslkhwf3gRU1aVgzUZO
 lGOg==
X-Gm-Message-State: AOJu0YwopS224yZO2det2IJy1T0RhcM/Qa4Jc9HDKGtPYsruh0fBNARS
 ZRgjm3n6D4CzQmc3FrtG1/Wq5f4Q/SgDCwOws5qrBy+R3zQCcu0Tq+FFgg==
X-Google-Smtp-Source: AGHT+IH3OTdiGvS/nbc1bmlKPefyv54I7c8Utuwd9hEWaHr+FjA2XOhgkX2FubbFoTWT+8rllkN4WQ==
X-Received: by 2002:a50:d797:0:b0:56e:2aef:f92e with SMTP id
 w23-20020a50d797000000b0056e2aeff92emr5109886edi.17.1713118464157; 
 Sun, 14 Apr 2024 11:14:24 -0700 (PDT)
Received: from yoga7.fritz.box (ip5f5bff47.dynamic.kabel-deutschland.de.
 [95.91.255.71]) by smtp.gmail.com with ESMTPSA id
 di22-20020a056402319600b0056e5a095c49sm3889779edb.78.2024.04.14.11.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 11:14:23 -0700 (PDT)
From: Lukasz Tekieli <tekieli.lukasz@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Apr 2024 20:14:08 +0200
Message-Id: <20240414181408.535765-1-tekieli.lukasz@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713118464; x=1713723264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kcqczHhr9DeTLEjS9ulWz3q1e5f9VlWTXEb+X8CJerg=;
 b=BOY31OzwdsZtahx+AKogPw6XFrIUoc7nl8bp1vo8SjnsdFA+zT4NvjSImnpIPZJ57t
 6HSLEzh9RiSNkKqaj/DC/tsjtzZI51QtOf8GmhA9YbwKauFc7bnifKh35DNFVVd9w8wG
 qvocBCh5SNZOz1c/7YwAtZtrg8OVanlmtUYa8ihBvfQkcIHfoJ1kLv9VNkvlkLGb8IEj
 z4oBC3jS8oTA8eA/nxvP46VMGWARWEgKTmaWjV+mvmZN/H9OZZUfl4GwMBfopNKuB4FD
 HKCO7DaUFCZBkHSdryLrA7zyZW2JfZrr0iBrU9pzIHCTsa6CW8mbptM/EYAhBf5G1js8
 PYaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BOY31Ozw
Subject: [Buildroot] [PATCH 1/1] configs/visionfive2: update u-boot to
 2024.04
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Lukasz Tekieli <tekieli.lukasz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
---
 configs/visionfive2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index c8576a35a7..8b65e4e93d 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
