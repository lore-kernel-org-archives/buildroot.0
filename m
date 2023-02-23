Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7ABC64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AC0D405B8;
	Thu, 23 Feb 2023 22:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AC0D405B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dP0Gbsv8oxkK; Thu, 23 Feb 2023 22:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8945B405D4;
	Thu, 23 Feb 2023 22:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8945B405D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE46A1BF97F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5DFE41874
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5DFE41874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsEU-WQYmmop for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:44:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 990014183D
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990014183D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83D41869E1; Thu, 23 Feb 2023 22:44:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:44:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93b461bb5e34ec25c9aac3024b41d132736c5dd7
X-Git-Newrev: 6455558f6202663f21d8d72e430d73b13d5339cd
X-Patchwork-Hint: ignore
Message-Id: <20230223224433.83D41869E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: fix GCC_DL_DIR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6455558f6202663f21d8d72e430d73b13d5339cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC_DL_DIR is empty as gcc is not a "real" package, as a result, the
following (silent) error is raised when BR2_CCACHE is set:

/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/bin/ccache /usr/bin/gcc -O2 -I/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/include -DBR_CROSS_PATH_SUFFIX='".br_real"' -DBR_CCACHE_HASH=\"` printf '%s\n'  --target=aarch64_be-buildroot-linux-gnu --with-sysroot=@HOST_DIR@/aarch64_be-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --enable-plugins --enable-lto --with-gmp=@HOST_DIR@ --with-mpc=@HOST_DIR@ --with-mpfr=@HOST_DIR@  --with-bugurl="http://bugs.buildroot.net/" --without-zstd --disable-libquadmath --disable-libquadmath-support --enable-tls --enable-threads --without-isl --without-cloog --with-abi="lp64" --with-cpu=cortex-a53 --enable-languages=c --disable-shared --without-headers --disable-threads --with-newlib --disable-largefile  | sha256sum - /gcc-11.3.0.tar.xz package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch package/
 gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch | cut -c -64 | tr -d '\n'`\" -DBR_SYSROOT='"aarch64_be-buildroot-linux-gnu/sysroot"' -DBR_ADDITIONAL_CFLAGS='"-Wl,-z,max-page-size=65536", "-Wl,-z,common-page-size=65536", "-fstack-protector-strong",' -DBR_CCACHE -DBR2_RELRO_PARTIAL -s -Wl,--hash-style=both toolchain/toolchain-wrapper.c -o /home/thomas/autobuild/instance-0/output-1/build/host-gcc-initial-11.3.0/toolchain-wrapper
sha256sum: /gcc-11.3.0.tar.xz: No such file or directory

This patch replaces GCC_DL_DIR by $($(PKG)_DL_DIR) as suggested by
Arnout Vandecappelle.

Fixes:
 - Found when investigating: http://autobuild.buildroot.org/results/ae75f5cdd4a1fe97359b99b2bcade258097c86dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6dfd93f2a4..25cb4ce8e2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -284,7 +284,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(GCC_DL_DIR)/$(GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $($(PKG)_DL_DIR)/$(GCC_SOURCE)
 
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned
 # and unversioned patches unconditionally. Moreover, to facilitate the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
