Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB34C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E30D83E52;
	Mon, 20 Jun 2022 19:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E30D83E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4lOult5zIEC; Mon, 20 Jun 2022 19:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3F083E4E;
	Mon, 20 Jun 2022 19:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3F083E4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1783A1BF9BA
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6DAF60F71
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6DAF60F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHqJcot528Pu for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD6D60FEE
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD6D60FEE
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1AF25874DE; Mon, 20 Jun 2022 19:22:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 21:32:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45adbd4cd11bf6d0383c8ee713eb8eb4ad9f17b0
X-Git-Newrev: 5e9417e3b4a72d7c3cd00b0d7e93db47125917d6
X-Patchwork-Hint: ignore
Message-Id: <20220620192232.1AF25874DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clang: install a toolchain-wrapper
 for the host clang cross-compiler
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e9417e3b4a72d7c3cd00b0d7e93db47125917d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to use Clang as a host cross-compiler for Buildroot, we
need to provide at least the path to the sysroot (using
--sysroot) and some other compiler flags.

This series looks to reuse the toolchain wrapper for GCC since
Clang support most of the gcc flags used in the Buildroot's
toolchain wrapper. The only flag -mfused-madd (deprecated
since gcc 4.6) for mips is not supported by clang. Since
Clang require gcc >= 5.x this flag can never be used.

host-clang refers to an existing GCC-based toolchain (internal or
external) for libstdc++. However, a Buildroot external toolchain
gets a different BR_CROSS_PATH_SUFFIX. Therefore, we can't reuse the
toolchain-wrapper that gets built for the GCC-based toolchain, but
instead have to compile an additional clang-specific wrapper, called
toolchain-wrapper-clang.

After building the clang toolchain wrapper, create the symlinks needed
to force package infrastructure to use clang througt the wrapper.

Initially clang install the clang-8 binary and create all other symlinks:

 # clang -> clang-8
 # clang++ -> clang
 # clang-8
 # clang-cl -> clang
 # clang-cpp -> clang

Use a post install hook to rename the clang-8 binary to clang-8.br_real
and recreate all symlinks:

 # clang -> toolchain-wrapper-clang
 # clang++ -> toolchain-wrapper-clang
 # clang-8 -> toolchain-wrapper-clang
 # clang-8.br_real
 # clang++.br_real -> clang-8.br_real
 # clang.br_real -> clang-8.br_real
 # clang-cl -> toolchain-wrapper-clang
 # clang-cl.br_real -> clang-8.br_real
 # clang-cpp -> toolchain-wrapper-clang
 # clang-cpp.br_real -> clang-8.br_real

NOTE: *.br_real symlinks are needed as the wrapper references them

Use the previously introduced CLANG_VERSION_MAJOR variable to create
theses symlinks.

Set BR_CROSS_PATH_SUFFIX to ".br_real" as for the Buildroot's internal
GCC toolchain backend to find the "real" clang binary installed in
$(HOST_DIR)/bin.

Borrow TOOLCHAIN_WRAPPER_BUILD and TOOLCHAIN_WRAPPER_INSTALL to
build and install the specific clang toolchain wrapper.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/clang/clang.mk | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 95b4964be3..3c75f8d6b1 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -112,5 +112,33 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
 endif
 
+define HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+	$(Q)cd $(HOST_DIR)/bin; \
+	rm -f clang-$(CLANG_VERSION_MAJOR).br_real; \
+	mv clang-$(CLANG_VERSION_MAJOR) clang-$(CLANG_VERSION_MAJOR).br_real; \
+	ln -sf toolchain-wrapper-clang clang-$(CLANG_VERSION_MAJOR); \
+	for i in clang clang++ clang-cl clang-cpp; do \
+		ln -snf toolchain-wrapper-clang $$i; \
+		ln -snf clang-$(CLANG_VERSION_MAJOR).br_real $$i.br_real; \
+	done
+endef
+
+define HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
+		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
+		toolchain/toolchain-wrapper.c \
+		-o $(@D)/toolchain-wrapper-clang
+endef
+
+define HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-clang \
+		$(HOST_DIR)/bin/toolchain-wrapper-clang
+endef
+
+HOST_CLANG_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
+HOST_CLANG_POST_BUILD_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
+HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
+HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
