Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB50C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A5A407E9;
	Tue,  1 Sep 2026 21:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9-BHBP7ecGq; Tue,  1 Sep 2026 21:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788297512;
	bh=U+KQl5qiCdDzNajatoDRy0iQ+eEbnHs7Y4lvxKVxW3M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eP/INOnrxjI12k7QZg7F8Sv9fimk8MQd+LX2fRMlKP9q/TJcpusIbx5DhNFrAFcua
	 O/2/NZH1KPyrbH/QRQozq/oyalvJc9s1QfJc9fgoLlOmdDdij6IQ5UyNPmi9T+aGdQ
	 Ctj6wrcq8r3EyfsWGFc6kdDvZri7UUcmoPlyWZdejs2UtrAIsmE4fwvcT7jjZNj9os
	 wnXl8Xc02YJ9fqqw6zt5WxFIUDQU2BqW1/yPcyiQ5FFEQe56Z/tgcLJ8LyqaRWyZi2
	 1k5YaukyoqtkYLlYTr1pNm2+YV0939IubfXoAhZzN75e4yASBCk90V+ljD7vps1oVd
	 fs/JMjutwM08A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B3EE407F9;
	Tue,  1 Sep 2026 21:18:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14018127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEC0360802
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Z3vTfdGm17C for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:18:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E3166080E
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:18:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E195993574; Tue,  1 Sep 2026 21:17:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 23:00:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45636d67c93e3722543e181900bcb74a52b01bbb
X-Git-Newrev: 32b4f3f942a26476da9533cb11afdeb5a27861ba
X-Patchwork-Hint: ignore
Message-Id: <20260901211730.E195993574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: disable SSP support when needed
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32b4f3f942a26476da9533cb11afdeb5a27861ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

x86 and x86_64 kernels >= 6.15 now requires ssp toolchain support
when CONFIG_STACKPROTECTOR is enabled [1].

For toolchains without SSP support, make sure to disable
CONFIG_STACKPROTECTOR to avoid link issues when building kernel
modules.

  MODPOST Module.symvers
  ERROR: modpost: "__stack_chk_guard" [drivers/<module>.ko] undefined!

While the SSP support is mandatory for glibc and musl based toolchains
[2], it's still optional for uClibc-ng based toolchains and not enabled
by default when building a new toolchain.

The Toolchain builder project enabled recently the SSP support for all
uClibc toolchains [3] to avoid such issue.

But x86 (32bits) musl based toolchains lack of SSP support due to a
long term gcc issue [4]. For a decade Alpine Linux, OpenWRT and Yocto
povide additional gcc and musl patches to workaround the gcc issue [5]

We may consider in the long term removing the support for toolchains
without SSP and doing so removing x86 (32bits) musl toolchain.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832356731 (x86-64--uclibc--bleeding-edge_test)
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832356104 (x86-64--uclibc--stable_test)

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832355429 (x86-64-core-i7--uclibc--bleeding-edge_test)
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832354341 (x86-64-core-i7--uclibc--stable_test)

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832326525 (x86-64-v2--uclibc--bleeding-edge_test)
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15832316220 (x86-64-v2--uclibc--stable_test)

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139512 (x86-i686--uclibc--stable_test)
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139511 (x86-i686--uclibc--bleeding-edge_test)

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139510 (x86-i686--musl--stable_test)
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139509 (x86-i686--musl--bleeding-edge_test)

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139506 (x86-core2--uclibc--stable_test)
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139505 (x86-core2--uclibc--bleeding-edge_test)

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139504 (x86-core2--musl--stable_test)
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15819139503 (x86-core2--musl--bleeding-edge_test)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0ee2689b9374d6fd5f43b703713a53227
[2] e811f5154944147e4fceb8d199321aba91070587
[3] https://gitlab.com/buildroot.org/toolchains-builder/-/commit/90413f665735e1786cca2403cd1ff997920c99ae
[4] https://www.openwall.com/lists/musl/2016/12/04/2
[5] https://git.alpinelinux.org/aports/tree/main/musl/APKBUILD#n65
    https://git.alpinelinux.org/aports/tree/main/gcc/0018-Alpine-musl-package-provides-libssp_nonshared.a.-We-.patch
    https://github.com/openwrt/openwrt/blob/v25.12.5/toolchain/gcc/patches-15.x/230-musl_libssp.patch
    https://github.com/openwrt/openwrt/blob/v25.12.5/toolchain/musl/patches/200-add_libssp_nonshared.patch
    https://github.com/openembedded/openembedded-core/commit/77fb841f2e747dc7fb5e9234d870a7a32a74d09b

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index e790daff66..e3c89282fe 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -419,6 +419,17 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
 endef
 endif
 
+# Since kernel >= 6.15.y, x86 and x86_64 kernels requires a toolchain
+# with SSP support when CONFIG_STACKPROTECTOR is enabled.
+# For toolchains without SSP support, make sure to disable
+# CONFIG_STACKPROTECTOR to avoid link issues when building kernel
+# modules.
+ifeq ($(BR2_i386)$(BR2_x86_64):$(BR2_TOOLCHAIN_HAS_SSP),y:)
+define LINUX_FIXUP_CONFIG_STACKPROTECTOR
+	$(call KCONFIG_DISABLE_OPT,CONFIG_STACKPROTECTOR)
+endef
+endif
+
 define LINUX_KCONFIG_FIXUP_CMDS
 	@$(call MESSAGE,"Updating kernel config with fixups")
 	$(if $(LINUX_NEEDS_MODULES),
@@ -429,6 +440,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	)
 	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
 	$(LINUX_FIXUP_CONFIG_PAHOLE_CHECK)
+	$(LINUX_FIXUP_CONFIG_STACKPROTECTOR)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
 	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
