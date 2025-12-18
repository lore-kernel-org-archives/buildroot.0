Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08E0D6ACFB
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4137383D94;
	Thu, 18 Dec 2025 12:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA1IajYRnlVQ; Thu, 18 Dec 2025 12:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 640F183D95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766062237;
	bh=1zJSmLx2vnTsCZOwrorlu26wtxPd/LPL1U6K3DB/638=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ekz3a8dnLufPjEIsszGGP83SOenelxpwVUekvNRQy0Ky5oyvd4HD2TTleA7z0PfDi
	 QelQ/Ekt800SXLU+D/LbD6UgV42ac3EaGtRJlm97XSklTRkJhVUCnxnTW2oYPOjoyM
	 des7ho+rh2oIi+bYEIFuV81Ii2iRobeftXc0+sh7YGYxVuBvZ2I/hKMK0hUgFCOCW7
	 yDw3exbsJeFFoX9op2+DCwUqmntGla7g40h9Iqv/5x3N/iznZKH1uGfD/ZBxHXejEA
	 6LasnmCg7cSiJsAsJIujbF7ytiPOzo5W4Yn50V/wZE0ctD6gCz5esl0A50AePV2/mE
	 l4koPuEjXowGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 640F183D95;
	Thu, 18 Dec 2025 12:50:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ADB3361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 12:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E50216115F
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 12:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkW4cE6QBxon for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 12:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.54;
 helo=mail-wr1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0286460D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0286460D61
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0286460D61
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 12:50:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so265974f8f.2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 04:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766062233; x=1766667033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djWNGR1dMVg6qd3reEpUbldb7tA+ZIybxxpaIVweS/s=;
 b=XcZY2AOV04nD4JIS8YVQoiTnl+BYvrCSfl2oWvBu9vNVhBLibeyDi9rMc/DyXwwR+d
 IqQ7zmJPiXCPDUpcF1NO0Lvb2spgtHuMo+PCGk57HiEqWCjY8ehEpslO0Y1+Sn2lD4UO
 MUqTsAHsjXiFNw4AFjezDdA62gkHMdreicKx79fe8qXsjptbUi3aOJv4OAvWGT0ktKM4
 iHa072Pq/fZFi/37g0HULpk+CGROzG09brpi86tVG5zuAx9Cr3W/dptZDwm9uizX5JYt
 9IzjwLJC73uSIC26CmIXkrMilqla9QBiIJtqPQx3p9xAPZMcpkxebP/eh/MkySf/S3G2
 83tQ==
X-Gm-Message-State: AOJu0YwXQc9ObgJt+gLC00GM8t1IFq5ookN3qxypVAveC7NWLz/at33g
 cOmmkjfXEP3amAR7YNtk8AKc3hW95gulN3DCe4Jcmx0RhCR2ju/PeUaksnOwYcda
X-Gm-Gg: AY/fxX7HoDwjKA4ejYNsqEafkupXfkKys00LsIbBW0vE5okNfPv0+Mc4PJ/RNxDPYOa
 /JMNlVZPRLNzD9SOirwLgAa+mWJzW9DoslX9zo58ATBZYpbhs0u66i81g5yFdfVqbsnZmB/cTy6
 9RAZqlm1z8thDGkFdN3BKMy6yG7MMxVeIxYAR2Hk+zOlSwbWpkcZNU6Oh/AYjAHz6L2l2vqnDhX
 TCzo3WswtMDgUPLWiVN4RKZhWxwOdFMeKOMEkwg7XcjaZ6dDQqxWgG0SWmuM54ZIQqjjNzuM2uS
 QONqq5VE0XWHNNOo+6IX2CmaUo0JK8ecettOVv9QR1e4jv0tflodq/ktWt7uvyLwgHh0UH212E4
 SnTFjvWtn+yobwdGAaGJDTFt2nMumHeNfA7U5khSS10FeU5zU6Ss9jWGvoHC456g0cJbWf5xwO5
 tqi+vGupoN4NVjhQPW3BL1VWB6CP4f7qKHJib8CKKKITHvOL4q86QKtIJKUquoBQvOPFQl/1FO9
 hsPKxrrRz5w3jZycBBa
X-Google-Smtp-Source: AGHT+IHcNLAcfXpNPqBcWRqqGgFXGNLU6WX5UjzLMxT9Fs7LGWGuVNflYrOfNtSYv6Ho0fIvPYBu4A==
X-Received: by 2002:a05:6000:24c8:b0:430:ff0c:35fb with SMTP id
 ffacd0b85a97d-430ff0c3838mr13686737f8f.52.1766062232449; 
 Thu, 18 Dec 2025 04:50:32 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43244998cf1sm4689472f8f.34.2025.12.18.04.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 04:50:32 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu, 18 Dec 2025 13:50:29 +0100
Message-ID: <20251218125030.154446-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/mesa3d: fix compilation with host-llvm
 enabled
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
 package/mesa3d/mesa3d.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6fcbf96c803..36bc3d6542a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -40,6 +40,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
 MESA3D_CONF_OPTS += -Dllvm=enabled
+HOST_MESA3D_CONF_ENV += LLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
 ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
 MESA3D_CONF_OPTS += -Dcpp_rtti=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
