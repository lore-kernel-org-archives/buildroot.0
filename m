Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA9AC6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D73B0410C8;
	Sun,  5 Mar 2023 17:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D73B0410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RebGRaf9MWqa; Sun,  5 Mar 2023 17:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C1F940A05;
	Sun,  5 Mar 2023 17:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1F940A05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65B291BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03E58817C0
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E58817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6w5NihIl80G7 for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EB7181A24
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EB7181A24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 102B88631A; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:36:57 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 1894957267d1cba00c94521548ec2d2b36bcc560
X-Git-Newrev: 1c00bbd2e7e382bd8a01209ee320d8fe765a51c0
X-Patchwork-Hint: ignore
Message-Id: <20230305173948.102B88631A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gcc: fix
 GCC_DL_DIR
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c00bbd2e7e382bd8a01209ee320d8fe765a51c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 6455558f6202663f21d8d72e430d73b13d5339cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ec6f3b550a..37a1c73171 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -280,7 +280,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
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
