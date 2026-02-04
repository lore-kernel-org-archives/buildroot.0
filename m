Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964D8E95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A04C60A80;
	Wed,  4 Feb 2026 12:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SizRhPfVhW23; Wed,  4 Feb 2026 12:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6046660AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770208578;
	bh=woQdqYQr1hrQb621du5nYDpu8D2c7ZQhbuAX27GvttM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aLlb/n+oJffhvoJyFSBONjYL79VW28PeAHgho4m8pdDSDxk37B/MrN5GIK+DNbTX8
	 +DGbWE6wIoE6SluRk8yyROStNUo/u/75yZ85P9NZGC55+4+83F9iIZvkCTIwQTCnBZ
	 /P/TUyT+f/byw29L0x6T9m7xkxsgp+HCV0dSD1cBiEBtSOOIviWYjw0PhKd+UmBeNF
	 eUBAntjXDp6Op+ljPH5vtOlBLwy3jKlWsHkGXJ5uPjsLUn0K1smuylUgWCjVywXBIl
	 CA7qHiPxHAoxwm9YRIBBImpAtIFEZiR8jtGm0NuB16FK71GbT/3yNXpJYg0A7iwjjN
	 bZEWu1k76LCKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6046660AB7;
	Wed,  4 Feb 2026 12:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48162F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3371E40363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFoT6tVPcZs1 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.50;
 helo=mail-wr1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAF53400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAF53400FB
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAF53400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:36:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-432d28870ddso472796f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 04:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770208574; x=1770813374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nqtz78UQTskiyV66z8c6TXHsZlVav3zvjGq4N6eC5h0=;
 b=mnfYiRL5K2cOm4wXoeUrWFogw/bhXl7B8LPjWLrq/RYvqag5O71VLkDWO/X2jYMzQn
 5XWhDZaEroNIKBaTJR49u5Di6qOJxLXBRofnw6EjtoxN3WnH9nWM0VLbGTxBpqmT77yG
 LA24NbaX1GtCbszwcD1SQiJwSaTJet5l1rfNocHA8tn2Ko+nTv0ZFOagoW5cR7JqAPVG
 oJE81na2hmCyY8+nFnyFQANHxQV0e6Gl2M852fFRoqd3TJ2oSXeulbmarJCa3O/KnB7m
 0zzJe6OMOryOK3u0kKimOWAhCbsUWcyNLCl/7+QSw6YWA/L/x1fdIoPpOcNC1yFyk3vc
 iMDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJcq2iwdWmEVvvC1byjfh2af26nwgYnexsL701MVjWSLzwjUehbvcV9Wcx+lljN6qYc8fxrKV/MGU=@buildroot.org
X-Gm-Message-State: AOJu0Yw0Q7Zb1pv2NlliQ9pZynFm2QZ1qhiQE02WD/6e9zu46pxN3jwS
 iv+9uZ8EpOAleNRqJ7Y7x+Pc+zEbwN7MNNQVHYj2c1Y05tqj/jGFxtp+
X-Gm-Gg: AZuq6aK9sSY1TJVMt76Ph4gAdZfXpYG+l518NOL/WtZYDYyBy/mQlnoNz+xlz35ZrpF
 MafRNa5V2HGy57EmDQ3wvTW2aOihQO+rlDrPJOgJ+TkOVkozOu4dRSKdsWal+c+92UMuKpYL5gI
 8mGghyX73uD/oR1Q4gzFFG8tnPzC4GRx3zFN4Ehhro4N3YJK/mUGA8j37mlWj7kgr0qoOrePZ17
 f8md0pkw6xZzKJOzwlLU6oacrK82R3cwDFnOpNxyMFgvdC1vUiQprE2HaHCv1zN9we6EnK3ZPVs
 NNvIpfluCE0BTV2JaWsG/ryKZ+qhdr6w7rbmCB+zuPwy3MFH5kNhd6Mb7RLcedxPs7CA12Tqvoj
 NyqVf/ozPgZ99zSONS+ZXKO2Kej3Uz4AXU9XpLtrrNM72TxLLmoPE0nw70BWMOXe6bgQeMu0J6U
 77UsETcj0+Ybvz+iWKv6i/KM2FZLjrcrXdEif9sOM7sT8OMeaAN3y2Hj4zrhyOcoyCHCNGCm/dC
 zvWaoJQbCSDgZpLkQ==
X-Received: by 2002:a05:6000:400d:b0:435:e3c6:554d with SMTP id
 ffacd0b85a97d-43618059d02mr3672580f8f.52.1770208573279; 
 Wed, 04 Feb 2026 04:36:13 -0800 (PST)
Received: from KORLIN44614.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43618064813sm6338305f8f.38.2026.02.04.04.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 04:36:12 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: bernd@kuhls.net, buildroot@buildroot.org, romain.naour@gmail.com,
 romain.naour@smile.fr, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com
Date: Wed,  4 Feb 2026 13:36:09 +0100
Message-ID: <20260204123609.3607193-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACXRmJgF31hdsS_wY2tt6ok=CqMXbWwmy227s42jPw_tOZcPyw@mail.gmail.com>
References: <CACXRmJgF31hdsS_wY2tt6ok=CqMXbWwmy227s42jPw_tOZcPyw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3] package/mesa3d: fix compilation with
 host-llvm enabled
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Meson's custom LLVM parser uses llvm-config with a default search path of
/usr/bin, causing it to detect the host system's llvm-config (version 18.1.3)
instead of the buildroot-compiled one. This forces all LLVM-related packages to
match version 18.1.3, but since the host system lacks llvmspirvlib, the build
fails. This patch forces Meson to use the buildroot-compiled llvm-config.

Note that LLVM_CONFIG is a CMake option, not a Meson one. This is because
Meson has custom dependency resolution logic for LLVM (see
https://mesonbuild.com/Dependencies.html#llvm). The EXTRA_BINARIES mechanism
cannot be used here, as it only applies to cross-compilation scenarios, which
does not apply to host-mesa3d builds.

Reproduction (On BR2 tag: 2025.05.3):

BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y

Fixes:

llvm-config found: YES (/usr/bin/llvm-config-18) 18.1.3
Run-time dependency LLVM (modules: bitwriter, core, coverage, engine, executionengine, instcombine, irreader, libdriver, linker, lto, mcdisassembler, mcjit, native, option, scalaropts, target, transformutils, all-targets, coroutines, frontenddriver, frontendhlsl, lto, windowsdriver) found: YES 18.1.3
Dependency LLVMSPIRVLib found: NO. Found 15.0.0.0 but need: '>= 18.1' ; matched: '>= 15.0.0.0', '< 18.2'
Run-time dependency llvmspirvlib found: NO (tried cmake)

output/build/host-mesa3d-25.0.6/meson.build:1882:21: ERROR: Dependency lookup for LLVMSPIRVLib with method 'pkgconfig' failed: Invalid version, need 'LLVMSPIRVLib' ['>= 18.1'] found '15.0.0.0'.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3: Added reproduction info.
    Actually, I saw the issue first on 2025.02.x with these commits cherry-picked:
    - 317260f336b65ff0b41a953882cb8cccb789e010
    - 8b5dd49c5b2eb52e71ba9dff67b1ba54d0e00ac3
    - 4890415aa9e918bdbb52414e0e53f29e93315291
    - b08bc5b9e94269adb4a1c5771c8c26c8c87e5b5a
---
 package/mesa3d/mesa3d.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index db46d7bc7c2..b5300df2ba3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -292,6 +292,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
 HOST_MESA3D_TOOLS += imagination
 endif
 
+HOST_MESA3D_CONF_ENV = \
+	LLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
+
 HOST_MESA3D_CONF_OPTS = \
 	-Dglvnd=disabled \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
