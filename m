Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B2AC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B4D60F0B;
	Mon,  5 Feb 2024 13:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B4D60F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ya0Fj9FnEjTZ; Mon,  5 Feb 2024 13:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F4260B50;
	Mon,  5 Feb 2024 13:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F4260B50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2BA1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D927241828
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D927241828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qjbVIOpMlTs for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:35:37 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C986141805
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C986141805
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40fdc653665so6298715e9.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707140135; x=1707744935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AOMLLtzXhVQ4WxfMMoi0ZciI1kaVUxKGnld/TmKR+hI=;
 b=WBJ+c5/a1KIJaokx2iBUKV9r+Jll53u35mNfjXNbkbblilOV5qDi0hL0wqUwq0LV+L
 RSu7T9RjFxo1Qphu0M1Hm7bdxG9z5h+tMgmBLj2bEAT1VMYrVNQrIdVPLxeBwqjRSBkX
 xsGuVpM6QqbaTcsUAUtosMuzGweQr57apdeynuBkLtEIZf8dv10IwtcH9hoFVQcjv5by
 CRy0w9hm/xjk60E/X5UWeDfugS3abHGLmnoFASTZTXFIL8lmoIBqb8HCZjcMQbQ+0mXA
 o01WazdJN6v/btFbNURIwSNBK+9iG3Bg6tkJ+nYpKT7sgs7yMnMpHehRugo0KVsmJPXi
 ddTg==
X-Gm-Message-State: AOJu0YyVAaa2MBGlMLTry//npuf53boSHr82c3CNn9Y8yxTZwDRTCoUu
 DuyNnzMX1I6L2eDVcYO6hgPStCqoKSO9H4bia6NONl3UCwBI6cCPK9tso8205c0W0qldWjckvxY
 qKYA=
X-Google-Smtp-Source: AGHT+IFVWtz+R0Q+3uYxzPeSxc8Xqo2Xte4DvJqdG7R0geZ1QwVt73yjjdZujl/0VfGfnGRQ5ziJPw==
X-Received: by 2002:a05:6000:1e0e:b0:33b:2c2a:934f with SMTP id
 bj14-20020a0560001e0e00b0033b2c2a934fmr8653947wrb.44.1707140134980; 
 Mon, 05 Feb 2024 05:35:34 -0800 (PST)
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0033b3c03053esm2714617wrx.78.2024.02.05.05.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 05:35:34 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 14:35:30 +0100
Message-ID: <20240205133530.1188319-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707140135; x=1707744935;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AOMLLtzXhVQ4WxfMMoi0ZciI1kaVUxKGnld/TmKR+hI=;
 b=YevwwtMxfG2FZkYoVanIsEI90hEcMhgwqXnekK35Xex2q4iFs70lOwQIg84Yeln2oE
 1syBXJS1ZOPrkY+vgacG4UgQzKd898yHeOkyajQv8YJcQjq4d7bwOwVVzA25yYgKkaQv
 KDScpVpW049DMaLwxJw7tVy+LUqmDKZCVPQWjfOunMozfcHN6K6K9U+ak0DnPuw1Wtyv
 yYmCsPXkykng7Ko/afWijMUCclAj+OXnw2bhYffsBTrgEHwX3MftGo3zTTGjORzCiK1H
 8AQIZsu8gPmYb0MAegtwVxVqjnoA6I1j6rMqAZPR2GUOF+Oyu+d1qDVi4t/3JXxfB9Xw
 mw3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YevwwtMx
Subject: [Buildroot] [PATCH] support/testing: TestGrubX8664EFI: use Nehalem
 cpu emulation
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the Bootlin toolchain bump to 2023.11-1 [1], the
TestGrubX8664EFI failed with this error:

  # efivar -l
  traps: efivar[86] trap invalid opcode ip:7fc187f4c7f4 sp:7fff9bbaa930 error:0 in libefivar.so.1.38[7fc187f4c000+16000]
  Illegal instruction

Actually this error can be reproduced by installing other packages like
"file" because the qemu emulation doesn't provide all assembler
instruction emulation required by x86-64-core-i7 target used by
TestGrubX8664EFI.

A similar issue has been fixed in toolchain-builder by adding Nehalem
cpu emulation on the qemu command line [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6093853712

[1] 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
[2] https://gitlab.com/buildroot.org/toolchains-builder/-/commit/f2b253732b4d1fc5b87badba7c2d48f12a197f76

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_grub.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 9f3a6a8495..5315fa23ba 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -120,7 +120,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
         # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
         qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
-        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
+        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-cpu", "Nehalem", "-hda", hda, "-fw_cfg", qemu_fw_cfg])
         self.emulator.login()
 
         cmd = "modprobe efivarfs"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
