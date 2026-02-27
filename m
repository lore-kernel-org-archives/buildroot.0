Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED89104891E
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 23:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E0383CB0;
	Fri, 27 Feb 2026 23:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXUopWhDqppk; Fri, 27 Feb 2026 23:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 493E883CA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772234070;
	bh=9fbXTeqedlstWgcripu3Vy6MNIlBmJnymGzU09s7hSg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Il3KBgNZccvYIIrUsGQv9qB95gR88Hz5uOVU1s0qKwdyzHHHQDubs3wM7iNnsGYky
	 UPaJzYVzprqUctKK3RH49h/A8XqiCW7L1Zcqyox7FH/uqC4IkLsV+jkfOpTHOciLhr
	 oeSVnrewPuEYAsLC9teWoZSmYBPCgV0htbvUMkb5NuKur308Qlpcr8EzlgnKnjtWhF
	 8ROzfusRwWKvyr/CHR8TsE+/a3g+erx/RL6DkEhIo8AQ4pGllRmmCEQafQe+/hsx2l
	 SERu0RHC4my1U1hpkdDPd+hQTbzu3bviouveRu94CjUkNBxr29Md7jnOcNEtU2GzzQ
	 Vq38rdUYTufvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493E883CA2;
	Fri, 27 Feb 2026 23:14:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4DC81F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B26E283C9D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX6QSjLq7oDg for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 23:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A06183C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A06183C2D
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A06183C2D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 23:14:27 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c70378ddaafso1705164a12.3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772234066; x=1772838866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lEl/K5fj6DBbaWzyZSi6Mtj833Pytfn4wOIHMvkOwt0=;
 b=sshR7rVRj36+8GLKI3jDXzWfFD6Ko9WkZnkSUkWjt+s78WGtl9zHRSAI5vLuWrVQJa
 1+XjJh1TkG4EntdRGJiZB3tFnYlfzXET2LK8kBPmdLaXr5VstlwKpNLi/WGByJF5InwX
 APfUbQ3UVUS4+HXu2zm0+ClCQaJW2kVWxKqLAST1le2hyWV+z0iprlKTBL/CgjHcwLkv
 0JpWyI1jpccGS9NoJUnTy/v8tjrQs9zJUUZx10FG5H8qx4Tq5ZLDE2Vv8EvjnymhblGy
 m0wT13/GBjpIglWF0trDcvoIgBugYZqXYJasGGVQX30TYu40GN2eE0krejAUydapJuyx
 8SVQ==
X-Gm-Message-State: AOJu0YwgSGcKNNMs/yJPdHFL/XOMunAgE34ImVE72X6DmcRhdBbPtvLA
 h4uxAKFMSugg5MggQsvB83q1SrtomteXuRdLwnixQlH0jBiALRK0k+23wmD6kWfvMyHT0LoQPGI
 vVGXT
X-Gm-Gg: ATEYQzxcOnH+WnXE2LBJtrBeIbSLFKqFkYoeEpht1VLBrIWe3EPVsRZiPMcpm4HB0i3
 Nv6in65Pp/h+HGfU/x9Qu63hMiSEPQDypm2sSxf0EW9EFete4kspMewFwjhstioNzR50BfyJwvC
 anakZzDjxElaIz14R646TINvQ1zNxCMurL58gmjNVOiBB+cdavJyNO3K7MjHmkDKZEE/KpD/2ta
 HtUistokNfrmD2DQtbMA0aN2Nf2PP2XuQB3wjoWdRN2e2cCdZpMqnYqXIS8ZaLuI7zyDP7xmBZu
 /t9ed3zBik3weU9kiM1ps3Fpqyaie1Me3upYbJ12J7V0j600WUWyMiC3q+m0UsjS9wTQFNSoR0v
 khAF+y7RQX7AFAWw6J4r/p3w8qY2OJ9FfcgRV6ZgrGHMInuGa/q6znNXXYX1LKg4MsFadsgVQww
 ZPH/vGOIFAey/C8F4pEm3gHEtTCr+gy/4I9gE=
X-Received: by 2002:a17:903:22d0:b0:2aa:d7fe:8611 with SMTP id
 d9443c01a7336-2ae2e46bef8mr42793535ad.27.1772234065915; 
 Fri, 27 Feb 2026 15:14:25 -0800 (PST)
Received: from wash.clouded-fir.ts.net ([50.120.91.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69fff3sm72007995ad.48.2026.02.27.15.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:14:24 -0800 (PST)
From: Joseph Kogut <joseph@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Joseph Kogut <joseph@anodize.com>
Date: Fri, 27 Feb 2026 15:14:06 -0800
Message-ID: <20260227-mesa3d-amdgpu-virtio-v1-2-3e6d10d4eaef@anodize.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
References: <20260227-mesa3d-amdgpu-virtio-v1-0-3e6d10d4eaef@anodize.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1772234066; x=1772838866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEl/K5fj6DBbaWzyZSi6Mtj833Pytfn4wOIHMvkOwt0=;
 b=UcxDSRGdvp+XCN8Gx0Ep6PtDgJ+kg/QRv9Ur8ZFxMopCHnr0VgPPLVZfCCeKg9R4YB
 Cp1NtZzFojM0+7xLUlXeDRvxT7HnLnRgUvN7GarGnHPHsfCS713OKjga2DOY4BaouLZT
 8EP69hDhHqZuK3rVtb1QH3PhVQWw/83M6KSf4ZVGHk9QEU3WdpCuxQTbyu2F0GwJYK+0
 DsTE6UuNOvrAzF0sp6nWNHV3//GhxXAWLJCD6FvnhBHa7Nm6TtkYuMmIeriQTGmbxu1B
 lj7Mu16SvzxQEEaLA6alT4rHO+SgHEixjQUR72CSdXjxf5N/D0GWZVim7mN717fVo8q+
 0Y5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=UcxDSRGd
Subject: [Buildroot] [PATCH 2/4] package/mesa3d: add freedreno-virtio config
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

Add a config for enabling the freedreno virtio KMD backend, in the same
pattern as amdgpu-virtio.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Tested with:
  BR2_PACKAGE_MESA3D=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO=y
  BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO=y

$ utils/test-pkg -p mesa3d -c mesa-freedreno-vdrm.config -a
                             arm-aarch64 [ 1/32]: OK
               bootlin-aarch64-glibc-old [ 2/32]: SKIPPED
                   bootlin-aarch64-glibc [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: SKIPPED
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                      bootlin-armv7-musl [ 7/32]: OK
                   bootlin-armv7m-uclibc [ 8/32]: SKIPPED
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: SKIPPED
             bootlin-microblazeel-uclibc [11/32]: SKIPPED
                  bootlin-mips64el-glibc [12/32]: SKIPPED
                   bootlin-mipsel-uclibc [13/32]: SKIPPED
                bootlin-mipsel32r6-glibc [14/32]: SKIPPED
                 bootlin-openrisc-uclibc [15/32]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [16/32]: SKIPPED
        bootlin-powerpc64le-power8-glibc [17/32]: SKIPPED
                   bootlin-riscv32-glibc [18/32]: SKIPPED
                   bootlin-riscv64-glibc [19/32]: SKIPPED
                    bootlin-riscv64-musl [20/32]: SKIPPED
                 bootlin-s390x-z13-glibc [21/32]: SKIPPED
                      bootlin-sh4-uclibc [22/32]: SKIPPED
                    bootlin-sparc-uclibc [23/32]: SKIPPED
                   bootlin-sparc64-glibc [24/32]: SKIPPED
                    bootlin-x86-64-glibc [25/32]: SKIPPED
                     bootlin-x86-64-musl [26/32]: SKIPPED
                   bootlin-x86-64-uclibc [27/32]: SKIPPED
                   bootlin-x86-i686-musl [28/32]: SKIPPED
                   bootlin-xtensa-uclibc [29/32]: SKIPPED
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED
32 builds, 27 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 package/mesa3d/Config.in | 12 ++++++++++++
 package/mesa3d/mesa3d.mk | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 015c47af54..b5aaec5e1c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -144,6 +144,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	# the toolchain having sync4 primitives, which is always a given
 	# for arm/aarch64.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	help
 	  Mesa driver for Freedreno GPUs.
@@ -422,6 +423,17 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 	  Select this when running Mesa inside a virtual machine
 	  with virtio-gpu host native context support.
 
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
+	bool "freedreno-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	help
+	  Enable VirtIO support for freedreno native contexts
+	  used by the freedreno (OpenGL) and turnip (Vulkan)
+	  drivers.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	bool
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5405aa3d50..e6f44ad73c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -157,6 +157,16 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+MESA3D_GALLIUM_DRIVER_FREEDRENO_KMDS = msm
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
+MESA3D_GALLIUM_DRIVER_FREEDRENO_KMDS += virtio
+endif
+
+MESA3D_CONF_OPTS += \
+	-Dfreedreno-kmds=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVER_FREEDRENO_KMDS))
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif

-- 
2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
