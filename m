Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F9DFC6174
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 08:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC9A60752;
	Sat,  3 Jan 2026 08:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2aMpb-iJyl0; Sat,  3 Jan 2026 08:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEF5860756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767429622;
	bh=NXwac5mIlsGqVtfPznIE+TzJ7w0mpo/aJfKVsc3MVFU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kz1aV2nVwjaFmtCeNqiVILK48Df2NR+yb+dLdMlWcK99R3RJqSemSymUL7gFA4Xpa
	 8R8AYlDkSrtcDPK42+FLx+Du28VJm0YR2zybNRUSUoluE3PSOoOtpfegk30MGBb91h
	 WZdqgS/Eyko9aiiO4NUHCtM7xZWS/j/z68CD0yro8j4bhppO5+iIUD9SgHCLHXJOpT
	 aPXsuJB5tpIL6c2z2TaWsu/ECw6MihDunLM4ZVKa341J8G+o2urFwsSKqHNQAq6p/+
	 CGCr5XwiG95zA+MorBAx0HikggNYLIty0jCmv4JoyV8jzjlwyV1d64OgnTDLsZLACh
	 PZ4jRhn4rFfCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEF5860756;
	Sat,  3 Jan 2026 08:40:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 483DD249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 08:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A63860756
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 08:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOp6aC9HJQRn for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 08:40:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.44;
 helo=mail-ej1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 195F260752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 195F260752
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 195F260752
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 08:40:19 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so2289513566b.1
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 00:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767429617; x=1768034417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MbSrBuZoJ+FgR0qzJvdb/LF3LfYAWxmonUoawK1AABk=;
 b=KpnQb1CGbv7yKCOqsydg8uSry2wRGJkpZYiK9Rs1A0uxO+qUse9hLNw7htNO1uoqgu
 huQNjZsjqHrWKulLvp6dbqncZ4QT/t+1lmYQCAd7y6Mw7tm+AbBY5Uf99S/f5zlDk5/c
 VCeBLpTTGWjsXQmstJug4S0rbAuk2LP5VF0A8g+6p6bJLIR052VvQqV/s0MqLCvwSDUv
 It3P0MRndvpzvdUD8brZ7vwwziYjMmJCo0lk1omE0JLxR/eGzn5du9gqjB04SQTdoz7s
 TynXd8DIRT2kMhP2zMpdMIOZzG/hhLTzdQc+n/78oCMUjwOzPkDOU2itIndaBQHz277D
 Z1xA==
X-Gm-Message-State: AOJu0YwufCGXp1342LEZRu0eT15vjinvou6Iq9FG3BNW76eCFre14ohT
 VbTYsU5Gooc0+UhHa2LEOGADIIGPDBc45RvlhZkze30PJAA/JBfJ/nLzWofMmM1R
X-Gm-Gg: AY/fxX4WZSTf1/EgliYcWzYjZ6VQW/FNKzFAHpEebf8hSIJyGe9njnJrqpmyOSqqCGR
 xrOCRZo/llcFpB1zRq+UqIEiTS/sznrj3tde1+0dwD/xHz+1Bl0gl9KHor5N+NQLBM4jPiYG9bh
 lqqqc7TM+KvZ7KUqrwdhIhYVLJgHqhDoxu5Eu05J6zf94cVx+mJ0sWMkGDDPWP+oifserrLTZ8f
 O93OaxI+wAxrNSK/8qusfc2xIe2nDINnyDpvPtBElb9SeDBykAJaloGn3OSW3mLhZFFcjaLwZFr
 nviyoDMc0Y3GY3i4jDZhB+mz+PbydNn5Z6lfB0tbMJxP1lQ7RxxCU66B+akJQCRZgqO5CBjgmKT
 Uaq/5InYTSFl+32eDzn4//FKrMaqH1K1bXMG+vqFORal3zENcLRqysjzAt5t6MT5ciTAKWYFuvv
 19Gb7qoSjtXhh7xLnYLXpzZE78L4DOPor6LfCcG4F5v4pTY3UWBFpI1ILj77I=
X-Google-Smtp-Source: AGHT+IGpK3i+VlcRU1IQDxCVUHU6Gfblf4Eozxk0ntZWl+ryWiSm5pymepLFstJeKHfm6lnKWNHC7g==
X-Received: by 2002:a17:907:60d3:b0:b71:29f7:47dd with SMTP id
 a640c23a62f3a-b80371d5017mr4550879466b.46.1767429617259; 
 Sat, 03 Jan 2026 00:40:17 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:21fc:5b5e:13d0:2b7b])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8037de0deesm4845317566b.37.2026.01.03.00.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 00:40:16 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: bernd@kuhls.net, romain.naour@gmail.com, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com, thomas@devoogdt.com
Date: Sat,  3 Jan 2026 09:40:02 +0100
Message-ID: <20260103084002.2045193-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084002.2045193-1-thomas@devoogdt.com>
References: <20251226101445.2b29f439@windsurf>
 <20260103084002.2045193-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 2/2] package/mesa3d: fix compilation with
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

Fixes:

  llvm-config found: YES (/usr/bin/llvm-config-18) 18.1.3
  Run-time dependency LLVM (modules: bitwriter, core, coverage, engine, executionengine, instcombine, irreader, libdriver, linker, lto, mcdisassembler, mcjit, native, option, scalaropts, target, transformutils, all-targets, coroutines, frontenddriver, frontendhlsl, lto, windowsdriver) found: YES 18.1.3
  Dependency LLVMSPIRVLib found: NO. Found 15.0.0.0 but need: '>= 18.1' ; matched: '>= 15.0.0.0', '< 18.2'
  Run-time dependency llvmspirvlib found: NO (tried cmake)

  output/build/host-mesa3d-25.0.6/meson.build:1882:21: ERROR: Dependency lookup for LLVMSPIRVLib with method 'pkgconfig' failed: Invalid version, need 'LLVMSPIRVLib' ['>= 18.1'] found '15.0.0.0'.

  A full log can be found at /home/thomas/buildroot/output/build/host-mesa3d-25.0.6/buildroot-build/meson-logs/meson-log.txt
  make[1]: *** [package/pkg-generic.mk:263: /home/thomas/buildroot/output/build/host-mesa3d-25.0.6/.stamp_configured] Error 1
  make: *** [Makefile:83: _all] Error 2

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: Moved patch to the generic host-mesa3d section.
    Also updated the git message wrt LLVM_CONFIG option.
---
 package/mesa3d/mesa3d.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 09b098628ab..da380b3b389 100644
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
