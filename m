Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FB9C27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 19:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4714C410E5;
	Wed, 26 Jun 2024 19:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgY1PEK38kEy; Wed, 26 Jun 2024 19:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB30410D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB30410D5;
	Wed, 26 Jun 2024 19:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D85191BF41A
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 19:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1470410D5
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 19:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJlE2fMxgmXd for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 19:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D549410D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D549410D4
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 19:11:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46FA882DF6; Wed, 26 Jun 2024 19:11:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Jun 2024 20:49:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f1b7d0ef00af527f6a5c1fcfd18ce204a7d78e8
X-Git-Newrev: de278d626b63f69557d13a5fb330b6bdc5b71f6b
X-Patchwork-Hint: ignore
Message-Id: <20240626191150.46FA882DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/xz: convert to cmake build"
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

commit: https://git.buildroot.net/buildroot/commit/?id=de278d626b63f69557d13a5fb330b6bdc5b71f6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The conversion to cmake was supposed to be an RFC, and was not supposed
to be applied [0], as the cmake support is not yet complete, while the
autotools buildsystem is still functional [1].

The host-xz uses the target options, which is plain wrong. The target
options forcubly disable shared libraries for no apparent reason, which
causes the host build to also disable shared libs, which in turn causes
host-python3 to fails to build. host-python3 has no dependency on
host-xz, but it autodetects its presence, so if the build order caused
host-xz to be built before host-python3, its presence will be detected
(this needs to be fixed in host-python3 anyway, though) [2].

It also creates build issues in our reference envirnoment [3]

Finally, there was a typo in the CXX override:
    -DCMAKE_CXX_COMPILER_LAUNCHER==""

This reverts commit 3f464c2e2826f02d9ee6f738df67c078e37cb327.

Fixes: #5

[0] https://lore.kernel.org/buildroot/20240626103623.7d7412c0@gmx.net/
[1] https://tukaani.org/xz/#_building_from_xz_git
[2] https://gitlab.com/buildroot.org/buildroot/-/issues/5
[3] https://lore.kernel.org/buildroot/ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xz/xz.mk | 65 ++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index b22b96849d..fa4f6dbda9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -8,45 +8,60 @@ XZ_VERSION = 5.6.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
+XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 XZ_CONF_OPTS = \
-	-DENCODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
-	-DDECODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
-	-DMATCH_FINDERS="hc3;hc4;bt2;bt3;bt4" \
-	-DADDITIONAL_CHECK_TYPES="crc64;sha256" \
-	-DMICROLZMA_ENCODER=ON \
-	-DMICROLZMA_DECODER=ON \
-	-DLZIP_DECODER=ON \
-	-DALLOW_CLMUL_CRC=ON \
-	-DALLOW_ARM64_CRC32=ON \
-	-DENABLE_SMALL=OFF \
-	-DENABLE_SANDBOX=ON \
-	-DCREATE_XZ_SYMLINKS=ON \
-	-DCREATE_LZMA_SYMLINKS=ON \
-	-DBUILD_SHARED_LIBS=OFF
+	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
+	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
+	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
+	--enable-checks=crc32,crc64,sha256 \
+	--disable-external-sha256 \
+	--enable-microlzma \
+	--enable-lzip-decoder \
+	--enable-assembler \
+	--enable-clmul-crc \
+	--enable-arm64-crc32 \
+	--disable-small \
+	--enable-assume-ram=128 \
+	--enable-xz \
+	--enable-xzdec \
+	--enable-lzmadec \
+	--enable-lzmainfo \
+	--enable-lzma-links \
+	--enable-scripts \
+	--enable-sandbox=auto \
+	--enable-symbol-versions \
+	--enable-rpath \
+	--enable-largfile \
+	--enable-unaligned-access=auto \
+	--disable-unsafe-type-punning \
+	--disable-werror \
+	--enable-year2038
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
-XZ_CONF_OPTS += -DENABLE_NLS=ON
+XZ_CONF_OPTS += --enable-nls
 else
-XZ_CONF_OPTS += -DENABLE_NLS=OFF
+XZ_CONF_OPTS += --disable-nls
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-XZ_CONF_OPTS += -DENABLE_THREADS=ON
+XZ_CONF_OPTS += --enable-threads
 else
-XZ_CONF_OPTS += -DENABLE_THREADS=OFF
+XZ_CONF_OPTS += --disable-threads
 endif
 
-# we are built before ccache
 HOST_XZ_CONF_OPTS = \
 	$(XZ_CONF_OPTS) \
-	-DENABLE_NLS=ON \
-	-DENABLE_THREADS=ON \
-	-DCMAKE_C_COMPILER_LAUNCHER="" \
-	-DCMAKE_CXX_COMPILER_LAUNCHER==""
+	--enable-nls \
+	--enable-threads
+
+# we are built before ccache
+HOST_XZ_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
 
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
