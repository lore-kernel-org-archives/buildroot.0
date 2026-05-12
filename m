Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6749CD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB7C40A96;
	Tue, 12 May 2026 19:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5175Dbm4_qhF; Tue, 12 May 2026 19:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB41040A63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614157;
	bh=qMRe6UGBhbrBs58uirCOhz+0euCYLJPUcpXsE+MCecM=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jd+FGPL906R33UElb2eFo5RVken4GMNaxc2xeBtf3g9WESHWk2FBBkb1MSQeyXJmT
	 nf4p0uRi8xEy/VQuCVINXZAFrTgczQGmrgdTCRxDlXEwH4nlwsqndDcyhz7cQl5oO6
	 cYalrtQfzn1qL5UkfQPA4tx/1QaB3MTRlvjTU7vVK52ahSXd3JUhKaW8KOiDQvxwyW
	 kuob7rgcQTei34AWZyxFaSQwLShyrDcM56ixiGW3FE9YU9IKsCr7EFhFRtT5vMt4Ht
	 /61JEJFaYfxihGf05bQPD6HSeBqy1qsj3koM3bWJtT8hsnptzJpW/zaVbJOn7zvXgB
	 1lykrpKmZNHNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB41040A63;
	Tue, 12 May 2026 19:29:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C672219
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88F538237E
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_oYjAMpPigF for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8EE898237C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EE898237C
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EE898237C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:29:15 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bd2051167eso3288965ad.1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 12:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778614155; x=1779218955;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGliL++l3wc0XoPl38Wy20ZSEmMp/xQ6cYBnPpahu4Y=;
 b=J+45myvbOUwlB5Xg4CEHzWujZpWzvZWVL/whlUWk3UXXLlJX+W4Itpz1zpz2udGxpW
 q7FZuuccfcWY8fut8b901mgTfHgiVwPKw7gMM82FSLdE02OzyzLncfqoAqYjCCODzQKS
 LykkBxQ65GiSMI6ab4llt9UubU27rIQcMjPEmjWORRkwJDjuLdPYm9vryBbbacGLSilR
 Dw5Vvo53x4QyBB/m6QXt1J3hkvhO8GwhYf0lJ5qvoBsDzQPbv/lzCiIGYj9yFRgsCWce
 SeH08hStHauwX2RE9sskon8XNIFcXpjsLQzG/B2fT03yc3Y5H46IYKfWakcys2HCwxHj
 rDUg==
X-Gm-Message-State: AOJu0YxloVcKv9dMkxZhRgRcxOovBtfWcBQ+Z5h+P+QMcFZWdbfrK8fo
 xA8nTyCzku7vy+kmFL3BSnd+k1dmdyY1ZC+tb3c2dGgxPnIefNMhBLDdVmQRGZGfhOA=
X-Gm-Gg: Acq92OFqbDDtLZFEQIMvczu5ak/L4UttkO6C0dSU4MtTwwSNC4CUl1tol+gRsybiGb9
 QukYeCW9bEGtsqFcKD+ZjSAuxzOhyI5h00ekXh7b2pbxZcZuw6k+cKYUoa1SjQwJ1x4kH4bLl/L
 e8lZd63/h6CC2WOlgN4Qa7fvDJL3cMLlglkDt7gGKIUV5b/8x4avF7A4ufcR7ZwReafQpyErtq5
 iMBqUlAQaddR/iU2qqjS8va+JmL/Bn8fcryE5WNBS6skUUVWEEWfIpVaiTosRm/njf/u+RlOrp8
 UNE7TEEvGNOS2LvaqPp2rmkYe9/ipmrFfO4NQTtkj68GJFbjJF+sktEIXYcAV3WnJfpBGAqjzyv
 EnqERkLWJYvdzeuln2BB5Pem+appEx/E5te2qta+HOPrG+fia8Zg3p5SRo5EyvekX3Uy1JgCuao
 CMaPU2tw+Su15E3ln0Cag=
X-Received: by 2002:a17:902:db0c:b0:2b2:4ffc:a7c4 with SMTP id
 d9443c01a7336-2bd2717d396mr3863445ad.24.1778614154673; 
 Tue, 12 May 2026 12:29:14 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e90854sm142712895ad.66.2026.05.12.12.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:29:14 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 12 May 2026 12:29:09 -0700
MIME-Version: 1.0
Message-Id: <20260512-radeonsi-aco-compiler-v1-1-6557627f3d55@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNvQ6CQBCEX4Vs7RkO+dPKQloLLY3FcixwhuPIH
 hITwrt7aGFlpprJzDczOGJNDg7BDEyTdtr23shNAKrFviGhK+8hCqM0TGQkGCuyvdMClRXKmkF
 3xAIppnSfVXEe5+C3A1OtXx/uDS7FtTif4P7N3bN8kBpX6Nqs2Roxtkz4+9nJ7M/PJIWXTKoIZ
 S4z3B8bg7rb+sIKK9GRKBl71a4wg24khmV5AxQBlq3nAAAA
X-Change-ID: 20260512-radeonsi-aco-compiler-ae4e697d4848
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614154; l=1333;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=LdT1OWcMklrwDWveHlOO+BR8ZqX9H5S2O/UL38uzpT8=;
 b=c56KXzvFAwmqHq2s68DVs4IzgWBaFJBMPmIKd9HWi6jLbFwhp9wqY++3umPb3Q4QH5TXQn0I/
 L6OvlyZeE+8DZXqvSRjHeiIDUMKqkCJ4OhkczjF0dnZQh6YS0tiRwkb
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778614155; x=1779218955; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cGliL++l3wc0XoPl38Wy20ZSEmMp/xQ6cYBnPpahu4Y=;
 b=QniMCiUnKPD+G/7rEbHd6zWnuoCHrFyYLKoGOgLLwdvNMetuk+MBeqUPn8YP8LsXVr
 UnmzeZG5Y0eJnEkKNaYY8WYtm9ipPNj7YgNPV5C6zBL6jxCloUnjfs73Mud/x+Bmd81P
 HYSLcB0Jt5EKN3tG+5NUFJP38tqYhBqobBos4iM2Ht09o75U5Sk8NvLe4ga0BtfXtzh3
 tmI/SEoN4iKgoUd3FNBSRniTFHg+zvNVIgP0u0ukd1sr6SEfOXDzQ4LGSSTW97VKXFz5
 MShIVkMl568xWbl1NZMDfXj5uj8l/PPHZoX+FnwTmTnBjtVq/t4QWzIO/GkMuU4xhQg6
 88WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=QniMCiUn
Subject: [Buildroot] [PATCH RESEND] package/mesa3d: make LLVM optional for
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

[0] https://cgit.freedesktop.org/mesa/mesa/commit/?id=e26c28f311cc5416f6c7f5b09a53ca2b14dfb955

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/mesa3d/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 66ebe04394..08881af5bd 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -252,11 +252,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
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
