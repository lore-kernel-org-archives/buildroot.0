Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174DBC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE91D81E85;
	Mon, 24 Jun 2024 13:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLEY7sfwkNds; Mon, 24 Jun 2024 13:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE26781E7D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE26781E7D;
	Mon, 24 Jun 2024 13:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BDDB1BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 857FC40564
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAQ_hP47YIPw for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FD74053C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77FD74053C
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6263482B31; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 13:56:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1d77eb274761d1f2d24ee4b55a374e917c67a8e
X-Git-Newrev: 25254458bde6befcbf93b746d994f94665741c42
X-Patchwork-Hint: ignore
Message-Id: <20240624135304.6263482B31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: explicitly specify all
 autoconf options
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

commit: https://git.buildroot.net/buildroot/commit/?id=25254458bde6befcbf93b746d994f94665741c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly specify all autoconf options with their default values, with
the following special cases:

- sandbox: use 'auto' (which will compile detect landlock in case
  kernel headers >= 5.13)

- unaligned-access: use 'auto' (which will default to yes for x86, x86-64,
  powerpc, powerpc64 and powcerpc64le and use compile detection for arm,
  aarch64 and riscv, see xz-5.6.0/configure line 21323 ff)

Since there are so many options, we reuse the target options for the
host. The options that are set dynamically need to be explicitly
overridden in that case.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Arnout:
 - fix type Z_CONF_OPTS, detected by check-package;
 - move setting of HOST_XZ_CONF_OPTS after all the target options.]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/xz/xz.mk | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 10590f6be8..dff4ec4be9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -13,12 +13,51 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
+XZ_CONF_OPTS = \
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
+	--disable-year2038
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+XZ_CONF_OPTS += --enable-nls
+else
+XZ_CONF_OPTS += --disable-nls
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XZ_CONF_OPTS += --enable-threads
 else
 XZ_CONF_OPTS += --disable-threads
 endif
 
+HOST_XZ_CONF_OPTS = \
+	$(XZ_CONF_OPTS) \
+	--enable-nls \
+	--enable-threads
+
 # we are built before ccache
 HOST_XZ_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
