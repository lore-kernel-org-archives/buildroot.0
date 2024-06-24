Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F204CC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5FAC817A3;
	Mon, 24 Jun 2024 13:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EObJbFekYxnK; Mon, 24 Jun 2024 13:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60CF081E7D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CF081E7D;
	Mon, 24 Jun 2024 13:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42F041BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F73881145
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XjiyDLPAdZX for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80578818C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80578818C4
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ACB482B2E; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 15:48:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffd1ca4ad5c1ac481ff5844591000b39b05cd6f8
X-Git-Newrev: 3f464c2e2826f02d9ee6f738df67c078e37cb327
X-Patchwork-Hint: ignore
Message-Id: <20240624135304.7ACB482B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: convert to cmake build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f464c2e2826f02d9ee6f738df67c078e37cb327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use direct equivalents where available. The following autoconf options
don't have a direct equivalent in CMakeLists.txt.

- '--enable-checks=crc32': CRC32 is always enabled; the equivalent CMake
  option is therefore calles ADDITIONAL_CHECK_TYPES.

- '--disable-external-sha256': external sha256 is not supported with
  CMake.

- '--enable-assembler': No direct equivalent, though there is an option
  ENABLE_X86_ASM which must be enabled explicitly (no auto-detection).
  Since this only works on x86 and we're not sure if it works on all x86
  variants, leave it disabled.

- '--enable-assume-ram=128': hard coded in the CMakeLists.txt file
  1732     target_compile_definitions(xz PRIVATE ASSUME_RAM=128)

- '--enable-xz', '--enable-xzdec', '--enable-lzmadec',
  '--enable-lzmainfo', --enable-lzma-links': The decoder programs are
  always enabled if they're enabled in the library. The symlinks are
  controlled by two separate options: CREATE_XZ_SYMLINKS and
  CREATE_LZMA_SYMLINKS.

- '--enable-scripts' (see [1]: 'CMake: xzdiff, xzgrep, xzless, xzmore, and
  their symlinks are now installed')

- '--enable-symbol-versions': hard coded in the CMakeLists.txt file
  1297     target_compile_definitions(liblzma PRIVATE HAVE_SYMBOL_VERSIONS_LINUX=1)

- '--enable-rpath': There is no CMake equivalent for this.

- '--enable-largefile': see CMakeLists.txt
  245 # Check for large file support. It's required on some 32-bit platforms and
  246 # even on 64-bit MinGW-w64 to get 64-bit off_t. This can be forced off on
  247 # the CMake command line if needed: -DLARGE_FILE_SUPPORT=OFF
  248 tuklib_large_file_support(ALL)

- '--enable-unaligned-access=auto': see CMakeLists.txt and cmake/tuklib_integer.cmake
   250 # This is needed by liblzma and xz.
   251 tuklib_integer(ALL)

- '--disable-unsafe-type-punning' see CMakeLists.txt and cmake/tuklib_integer.cmake
   250 # This is needed by liblzma and xz.
   251 tuklib_integer(ALL)

- '--disable-werror': There is no option to _enable_ -Werror in
  CMakeLists.txt.

- '--enable-year2038': There is no option to enable Y2038 support in
  CMakeLists.txt, but we anyway do that globally.

host-xz is itself a dependency of host-ccache, so we can't use ccache
for building host-xz. For autotools, this was handled by setting CC and
CXX in the environment for the configure script. This doesn't work for
CMake, however. Instead, we must override the CMAKE_C_COMPILER_LAUNCHER
option. Xz doesn't use C++, but for completeness also override
CMAKE_CXX_COMPILER_LAUNCHER.

[1] https://github.com/tukaani-project/xz/releases/tag/v5.6.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: fix ccache bypass for host-xz]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/xz/xz.mk | 65 ++++++++++++++++++++++----------------------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index fa4f6dbda9..b22b96849d 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -8,60 +8,45 @@ XZ_VERSION = 5.6.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 XZ_CONF_OPTS = \
-	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
-	--enable-checks=crc32,crc64,sha256 \
-	--disable-external-sha256 \
-	--enable-microlzma \
-	--enable-lzip-decoder \
-	--enable-assembler \
-	--enable-clmul-crc \
-	--enable-arm64-crc32 \
-	--disable-small \
-	--enable-assume-ram=128 \
-	--enable-xz \
-	--enable-xzdec \
-	--enable-lzmadec \
-	--enable-lzmainfo \
-	--enable-lzma-links \
-	--enable-scripts \
-	--enable-sandbox=auto \
-	--enable-symbol-versions \
-	--enable-rpath \
-	--enable-largfile \
-	--enable-unaligned-access=auto \
-	--disable-unsafe-type-punning \
-	--disable-werror \
-	--enable-year2038
+	-DENCODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
+	-DDECODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
+	-DMATCH_FINDERS="hc3;hc4;bt2;bt3;bt4" \
+	-DADDITIONAL_CHECK_TYPES="crc64;sha256" \
+	-DMICROLZMA_ENCODER=ON \
+	-DMICROLZMA_DECODER=ON \
+	-DLZIP_DECODER=ON \
+	-DALLOW_CLMUL_CRC=ON \
+	-DALLOW_ARM64_CRC32=ON \
+	-DENABLE_SMALL=OFF \
+	-DENABLE_SANDBOX=ON \
+	-DCREATE_XZ_SYMLINKS=ON \
+	-DCREATE_LZMA_SYMLINKS=ON \
+	-DBUILD_SHARED_LIBS=OFF
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
-XZ_CONF_OPTS += --enable-nls
+XZ_CONF_OPTS += -DENABLE_NLS=ON
 else
-XZ_CONF_OPTS += --disable-nls
+XZ_CONF_OPTS += -DENABLE_NLS=OFF
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-XZ_CONF_OPTS += --enable-threads
+XZ_CONF_OPTS += -DENABLE_THREADS=ON
 else
-XZ_CONF_OPTS += --disable-threads
+XZ_CONF_OPTS += -DENABLE_THREADS=OFF
 endif
 
+# we are built before ccache
 HOST_XZ_CONF_OPTS = \
 	$(XZ_CONF_OPTS) \
-	--enable-nls \
-	--enable-threads
-
-# we are built before ccache
-HOST_XZ_CONF_ENV = \
-	CC="$(HOSTCC_NOCCACHE)" \
-	CXX="$(HOSTCXX_NOCCACHE)"
+	-DENABLE_NLS=ON \
+	-DENABLE_THREADS=ON \
+	-DCMAKE_C_COMPILER_LAUNCHER="" \
+	-DCMAKE_CXX_COMPILER_LAUNCHER==""
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
