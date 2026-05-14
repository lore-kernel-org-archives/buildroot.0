Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D4CD37AC
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135DB6101C;
	Thu, 14 May 2026 21:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZEoovyWzVDt; Thu, 14 May 2026 21:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C7B60FD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778793881;
	bh=LDbpS34WVYcRdYrFmmPxBdZGnVdSs+9gRyqx/L7TCqw=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lb0eW4BfBI72x1cD5q0WuaDeN5vvJDMOVd8+yX4tDOeDhFd/YVbgkxKJwPii1nnwb
	 bOQadvL+ornr0wx9hLXRqxXGduPtgPlT0ji7kKJJu5olEZq64NzbLzRlUmmNDGQauc
	 15u25ZTdMhqcA9QpD6VQ8qzXpYo2tgo/sxzHkfuC8npV22YABJxJecwXcXKBUjP8V/
	 U7Ya6c40LOBz0KxIIj5N8FmSDSN0Az7mpJ60KP7pSqO2WRuX8B9Uk/v/68aLIAluRK
	 D+Wxt0Go9gwIovTgP/h38wAcyVXkO2syz2avtPI9U1jjDO78qg/wD0TOM51NC3nT++
	 5vC3wQKdrSLZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C7B60FD6;
	Thu, 14 May 2026 21:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B2DB37D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79D7B40D68
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aCLF8LPg0IU for <buildroot@buildroot.org>;
 Thu, 14 May 2026 21:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61B6940D57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B6940D57
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61B6940D57
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:24:38 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c798fc1a28cso4052839a12.3
 for <buildroot@buildroot.org>; Thu, 14 May 2026 14:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778793877; x=1779398677;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9U+R3hJwupYFJ3LrAjofCjFZ+7X8kvYlhFElsQF/jwU=;
 b=O2KxCi9UxL3/Atbj9wOy8ZD71C3wOe4kN5fr/pM7Zn0sPA9spoUdgPTLVqzRC5GYRp
 8/OjkIy9nCX4hqDs9vKnuHUseSZ1fvlRW6DwtzzotCBc31NBwK0iZiOX6EW2/YWa3fsL
 1q9GzKFz/2Ebk0QZSJRhNRddbIG8dF/GYnvghhuMjLujDElCehqJlEuG3gpsLJS4sF3+
 sn1XBnseL0JWpdgnL5tp0AwoVw1IC8WZss4Ti+hAXO0qWUrPx6jKsiZ7G1k5ELyeARzU
 +c6dYiW2uhDeZ2F2P58dFemBWTzpMwZSYA2/Y9c5FrCWUBAqFALAsPXIgnpYHSfDUYtG
 g98g==
X-Gm-Message-State: AOJu0Yzrjuq+1CHGzt4Gc+Nojj4SpQmOwTcN/5bFZGoVx2ebBFdToXif
 G9BqFr35fqd63QiYKsPM5RvhCzcGl7rzLlaF/vycV1xm7k8B7pajB2xAGmqfXt3aDlc=
X-Gm-Gg: Acq92OGyXb0kqA6JJ3w36wMP3mGnnesP2bdUKUuJT5yVIuPpybuJHMnarMRykbKIQLP
 ZQQiabc/DN2yPfZ6Ul7fqFKFVhCAXtGXLIjfEYgyofazfKbfnlaG0MIyP3RyiBMzWnt/8SopVCT
 G9oAiDdQcoMINOuYp7UW4b1R4Am6jSdpqdPFrZJH9PVjsEPq6062Kb0+hfB76axXfGJOaLfmjr3
 pJLWOCyq/u7xvl53vEuqu8IEyuHW32T215T4LtnJkL2mxo4sjPiXKA9NwqBtV7VubjTUQq+t7Fd
 UEzqqN4JGpjpcZjpWDYqF/0CEXaHDjKkqj7KCO/HIGh73gebS5047mZQNcc6TQdgw0Q7MLUxeyV
 Lxt/slDc7BlOvszYG2LIpHhDhq6f4REqu2LEun+X7vkNWkKEZXWGGLPcy7BnlltF1zzlHpVckoV
 M1pGbgNBM+U0fAesspaS0QWEk82gfMjw==
X-Received: by 2002:a05:6a20:7f83:b0:3b1:a9ce:507e with SMTP id
 adf61e73a8af0-3b22ec9f1e9mr942989637.32.1778793877346; 
 Thu, 14 May 2026 14:24:37 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82bb07b007sm3369265a12.11.2026.05.14.14.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 14:24:36 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Thu, 14 May 2026 14:24:32 -0700
MIME-Version: 1.0
Message-Id: <20260514-radeonsi-aco-compiler-v2-1-d7dbeca185ca@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WPsW7DMAxEfyXQXBWRYllOpvxHkIGWaJtFLAWUa
 zQx/O+V3KFTEHA68PiOt4iETJjEabcIxpkSxZCF/tgJN0DoUZLPWui9rvdGacngMYZEElyULo5
 3uiFLwArro/VVUzUi394ZO/rZuJfrn07f7Re6qcCKo+M4ymlghH/+QdkX/FnJPMp4DapRFo7nf
 gS6fWZDgbWQULYMwQ0FNkKakMtioDRFfmz1ZlW+eddkS6qNsbW23cEbc4YQPT1xy7qu6/oLmGV
 tujQBAAA=
X-Change-ID: 20260512-radeonsi-aco-compiler-ae4e697d4848
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph@anodize.com>, Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778793876; l=2509;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=+hL1+gZFgjcFU3tkzP01F6tkeF8+3W0VbgC9+4WzFG4=;
 b=yftKTTEVrASNQb3N/l1ynD7St3YVmMz2kw5SIgaC1HmZNxjqTWWTw3aWFT1KuRi85lYCosPpB
 HKGK34WKMemAVvnpo7x3iFuZbK1PofrVI8CANxJVWwCPZ1XiUdA2nBo
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778793877; x=1779398677; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9U+R3hJwupYFJ3LrAjofCjFZ+7X8kvYlhFElsQF/jwU=;
 b=HJA3qOMiIfmOxAWlakiWKWtB8ode9gHwzvK1cr3XwCS3N/DC1yyN859SsLQwFvKA4y
 Z++eYEvNAa9JhbILXKl17UuakyKGEORNWBn8ZvYd3jrIoTzXif03EZ/WnJi1Bj3sAP7L
 63NK7Yq7G5Ik4R8F/VmMfDR5u6dLJwrEyRWd2s/+jBVNDpe8YSxLRjWU91hsJ2yfwIPX
 /v05RnmZalymjIz3Du38LfAIv0qe7xYl+GCw3GCml7y5IzdQ4AlOgPJmXlJSzKG8uXuo
 s/xyp9r8qW27X3KiQRcEzwcnDzGhEnzxtb3IO4SEwXMSv98PrBOybEFh/LXzG2GmSjPT
 83Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=HJA3qOMi
Subject: [Buildroot] [PATCH v2] package/mesa3d: make LLVM optional for
 radeonsi
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

Since mesa3d v26.0 [0], the ACO compiler has been the default over LLVM.
This shader compiler backend has been used for even longer by the RADV
vulkan driver.

Let's make LLVM optional.

Users who wish to continue using LLVM must enable support in Mesa, and
override the default ACO compiler at runtime using an env var. [1]

Users who only want to use the default compiler backend may disable LLVM
support, and save a lot of time during the build.

[0] https://gitlab.freedesktop.org/mesa/mesa/-/commit/e26c28f311cc5416f6c7f5b09a53ca2b14dfb955
[1] https://docs.mesa3d.org/envvars.html#envvar-AMD_DEBUG

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v2:
- Update mesa commit URL from cgit to gitlab
- Document forcing LLVM compiler at runtime
- Link to v1: https://patch.msgid.link/20260512-radeonsi-aco-compiler-v1-1-6557627f3d55@anodize.com

To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/mesa3d/Config.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 66ebe04394..8cdb548fb6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -252,17 +252,24 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_LLVM_AMDGPU
+	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
 
+	  Since Mesa 26.0.0, the default shader compiler is ACO,
+	  even when LLVM support is enabled at build time.
+
+	  Use the env var AMD_DEBUG=usellvm to override the
+	  default and use LLVM at runtime.
+
+	  https://docs.mesa3d.org/envvars.html#envvar-AMD_DEBUG
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64

---
base-commit: 9684cb9b4406e01683a9b5136100d81040d56aa0
change-id: 20260512-radeonsi-aco-compiler-ae4e697d4848

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
