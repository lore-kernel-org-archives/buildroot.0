Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AB6C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 14:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785214118E;
	Tue, 26 Jul 2022 14:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785214118E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cX9iKcsXsEZa; Tue, 26 Jul 2022 14:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71E2241171;
	Tue, 26 Jul 2022 14:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E2241171
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5BC1BF9AF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E93DD41171
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E93DD41171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGmfDNuDaSVd for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 14:03:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFA9F404C5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFA9F404C5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:03:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so8230228wmm.4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3G2fInxdYQKd03+7Z+kbozQTIH1b2pIs7J++ECxaL/Y=;
 b=iCEE4ve59+AmSmJjOPfiihFb1SNwbsCLBv2fuuBfoq5UnnJiy7twm5S/+OdIvDlxVQ
 68Ctzz+swttZdEaLM3hEBzMhBbxpX93MOafDxek5tiCA134ys3NbZLbuEOqWzTLwqAxD
 1QaD8F4JEMxYMm6w2qlf0nmszO4EKoAH6Gr6djXcknPFYJ8E9TgZ9iUK08EM3V7B5jel
 l5pnfikRUiHaA0DEu4PQOhi5DfxORCuV4AQ0p3AsgenJa8zx9/B3xWHWrwhbFH0cQDMC
 DOWRJupSZiRCce2QzSDzx0HrdtwJGrd3v8q+8goMe/m2zm7kE2N3wtrpR47J57tj0AS5
 K7+w==
X-Gm-Message-State: AJIora/UMY+3SEUyvjwiE5dEI1ZfvHdhaqTCFGmA0jpU1kvgh0m6w3MD
 fJhAuyaTRlIo1Jfo1VufaeueZXlLthSvXA==
X-Google-Smtp-Source: AGRyM1uBSWmBEOaRUzAMf8JkQUIrJOl3+WZOFhFsdConrcKNWWUt2HTjyhgP6KUGcNKB+Wir24kkKw==
X-Received: by 2002:a05:600c:4e12:b0:3a3:2fe2:7d0e with SMTP id
 b18-20020a05600c4e1200b003a32fe27d0emr20254305wmq.151.1658844198474; 
 Tue, 26 Jul 2022 07:03:18 -0700 (PDT)
Received: from P-NTS-Evian.home ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a1ce905000000b003a0323463absm18501163wmc.45.2022.07.26.07.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 07:03:18 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 16:02:45 +0200
Message-Id: <20220726140245.692606-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3G2fInxdYQKd03+7Z+kbozQTIH1b2pIs7J++ECxaL/Y=;
 b=64IHNP5sILg/neIT5UXAlXqG5wfi2ct9CobjaEkaCsVBoK9M47xUjencVMXr32W+mO
 S/56+Vp65B0T3bEjdN0/U8aCKtao+LEcqJ9R97BbSLA2rvDn5D4CvgPvlygAQa1+bOuX
 MfkAnH80PTh9ew7Fmfbqyv0k2zokPj8J1lou2ZrvSPUPS9kFUFInFFIdhqqgJSXHcc2a
 +xmQj9KPxJPoPRHiOcesbMox5GdkZLgCQN/wyvFC3iGT+iZDHrJ/EiMPxBY/W4jVL4NV
 UxRh5y35QYo6rJWyzfEwA/yKL7Re4XQGvs0jP0u9styQRwzEb1m0M7fG708ACx8tlPbN
 fMBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=64IHNP5s
Subject: [Buildroot] [PATCHv2] package/rustc: needs C++ compiler with musl
 based toolchain
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

While building host-rust with a musl based toolchain without C++ compiler,
the build fail since libunwind bundled in rust sources needs a C++ compiler.

cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error: [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not installed on this system

Note: the issues can't be reproduced with a glibc based toolchain
without C++ probaly due to extra steps required to support musl libc.

We could add the C++ dependency direclty to host-rustc but it would
requires adding the C++ reverse dependencies to all rust packages.

Instread, we add the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
only when a musl toolchain is used. So we can still install a prebuilt
rust compiler but without the rust standard library (rust-std).

Usually we should not add toolchain dependencies in a _ARCH_SUPPORTS option but
BR2_PACKAGE_HOST_RUSTC_TARGET_TIER... options contains already some
BR2_TOOLCHAIN_USES_GLIBC or BR2_TOOLCHAIN_USES_MUSL.

Fixes:
http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: move the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
    after James's review and discussion with Thomas and Arnout
---
 package/rustc/Config.in.host | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index fec8726aee..32decba7c1 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -110,11 +110,17 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
 
 # All target rust packages should depend on this option
+# Note: With musl based toolchain, we need a C++ compiler on the host to
+# build host-rust some target libraries (libunwind) from llvm source code
+# bundled in rust sources.
 config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	bool
-	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
-	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
-	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
+	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS && \
+		(BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL)
+	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS && \
+		(BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL)
+	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS && \
+		(BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL)
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
