Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B270C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11ECA40471;
	Wed, 27 Jul 2022 08:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11ECA40471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2wvEK11oQBt; Wed, 27 Jul 2022 08:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1944C401C5;
	Wed, 27 Jul 2022 08:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1944C401C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE6511BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6AF960B0C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AF960B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9gMmhntjsvw for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2494460B0B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2494460B0B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:37:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bn9so12307253wrb.9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JYLibAYJVHyCozuilxRv5cfXiLdxUpXfDTbjPgh1MMk=;
 b=FVxvsu+byRKPfQ3fsqM92t8RzZV/AKchbnWh2k5/6tam7WYEGxcHcn8vBWdVhsiB7M
 3vNQ8fdbTQqS8gRmCJD2WZQRmpQAIqO3z/eHI3nY3fKHb9cJ34Flt1gPJCeSZqqNm1m9
 nSMAdqfs3jQRYYuCGxuNnyLxZoDPM4Jgsgyu/RlGplKP92NOiHg6lLsnBnxyuL+o5VOC
 vPDiiiQcJUL0jSa/OVU4T6UgO/fyBdfY/gOxJitq4YwZdIEf44eHlQsYF8US6KViE437
 yRX7w1KbyRtkBWQ3Lg+zFukIDJ5ldy0eDQuJ1sdc+5Xsg8sbuMWqZtIeNOHOs9223vVX
 Kh6A==
X-Gm-Message-State: AJIora/+Ne2UXayw255Nrb9/IrX6/XsK2sj7vxdpXToHv8AKFzTl4odD
 ZX383HhZp2b5rgckIwiSMrIGs/4DaPf7UA==
X-Google-Smtp-Source: AGRyM1utXbM0hjAo/zuFwQXSRujEVpt4q9MEBisxwG6lBKlv+wQhYZY2/H3Ul+oIWHdPwTrOYM9M/g==
X-Received: by 2002:a5d:594a:0:b0:21e:81a6:d713 with SMTP id
 e10-20020a5d594a000000b0021e81a6d713mr10608120wri.318.1658911075936; 
 Wed, 27 Jul 2022 01:37:55 -0700 (PDT)
Received: from P-NTS-Evian.home ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adffac7000000b0021e3e73dec6sm19586853wrs.72.2022.07.27.01.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:37:55 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:37:53 +0200
Message-Id: <20220727083753.935654-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JYLibAYJVHyCozuilxRv5cfXiLdxUpXfDTbjPgh1MMk=;
 b=FhLdndvv6Jsb5IVss9GG7raGtrQJzgUW3LDatmHWDtyhq72WgIoihd5o/1xI1otw/6
 XfOxjl0262sTMBd0Mt7nqx1PQjco0CQbI3Dvt2eoSp3ecywNH+eUbE9abeflp0PN5GWX
 Zw85JIlWYVGUquhq62SDnjpspPM36YlfFw6/ed1aQ4LF+hGCK9cQQQfIp9R5Q5D+R5Gu
 YdDGKG04Pg+PP7nTzOOOT8VuxTVvZsL6ox4yYohD0kmv0zC9Pd7xurT3tfEgnm+mMMwJ
 Z8JCnFe1mPXOLgbLpPFMl0bb9oI6q+Tfj7UXXBcWpGtznJaXgdJBir2Tewn59q66La4v
 ms+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FhLdndvv
Subject: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with musl
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
v3: add a global C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS (Yann)
    update comment to use "C++ cross compiler"
v2: move the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
    after James's review and discussion with Thomas and Arnout
---
 package/rustc/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index fec8726aee..822de68dbb 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -110,11 +110,15 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
 
 # All target rust packages should depend on this option
+# Note: With musl based toolchain, we need a C++ cross compiler to
+# build host-rust some target libraries (libunwind) from llvm source
+# code bundled in rust sources.
 config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
 	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 	default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
+	depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
