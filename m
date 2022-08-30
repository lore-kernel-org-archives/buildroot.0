Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1DFECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE8C540BE1;
	Tue, 30 Aug 2022 19:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8C540BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1zzQpC2ZNL6; Tue, 30 Aug 2022 19:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04E3D40BD7;
	Tue, 30 Aug 2022 19:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E3D40BD7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DFCA1BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05BA9417A6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05BA9417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_R1aA6FdfCx for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:15:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB8D417B9
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB8D417B9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DE3C888083; Tue, 30 Aug 2022 19:00:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 21:12:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81dd6f1b73ae2359ea8aeda66d0a993393673e33
X-Git-Newrev: 8520058ac097284dd4c5676e264fc1aa444c1127
X-Patchwork-Hint: ignore
Message-Id: <20220830190034.DE3C888083@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rustc: needs C++ compiler with
 musl based toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8520058ac097284dd4c5676e264fc1aa444c1127
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Nicolas Tran <nicolas.tran@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
