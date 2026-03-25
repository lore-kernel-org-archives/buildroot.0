Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCD5109C04D
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 17:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E2580821;
	Wed, 25 Mar 2026 17:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dv89ACpibIV4; Wed, 25 Mar 2026 17:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B75580994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774461101;
	bh=NUQauyh1XTCfYB2Ue9UM16UDm8+KSNcpxaVm5DI+HtY=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WkkeNDvac/VHrVnL80Xyn8wW+e6izm7/GYpb87y4qvC6tX4p6J9uKcGTDH8gKKE3t
	 bwhg7it43i78ahMjyxjxvL4cZeQpkfh6fPKfR29DuO7pXnD6jhtIpM+PQAGTJAdJWT
	 3+tfKRGD0oZXyfT+JAXUePe5yTWkALdcQadJkMe/X8QwSCYgH5aKE4YFizShOnRiof
	 jEXwmE95BrH4ovMmdX8zWgPEFvngs5OtxIgyz2Zt5i71QrNxL+aX+IhamjH0bNuEZO
	 MOz3Pm1uB3slGCulmvBIh+upbadx32JhiaxL7wIQymcyZ2nQKoNJ6TtlHQ1qvat0So
	 8wY0xGm5eKQvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B75580994;
	Wed, 25 Mar 2026 17:51:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 739FF353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 657B1819F5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-5_6tXty6XB for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 17:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.14;
 helo=smtp-190e.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7E4C819D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E4C819D5
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch
 [185.125.25.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7E4C819D5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 17:51:37 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246b])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fgvbp1lnxzKpm;
 Wed, 25 Mar 2026 18:51:34 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fgvbn5jSxzd6J; Wed, 25 Mar 2026 18:51:33 +0100 (CET)
Date: Wed, 25 Mar 2026 18:51:25 +0100
MIME-Version: 1.0
Message-Id: <20260325-linux-werror-v1-1-2b98ff2a2cdd@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWpKglXEQs/U0akZKpIxN0Vy
 2/x3gUOmdBBGV3AuJOjxQYkcQTd2NgBBfXBoKTKZaoyMZP1pziQeWFRmBx102vdSgMhWRkNnd+
 uqn87307Ybe8D7vsBjN0z13AAAAA=
X-Change-ID: 20260325-linux-werror-9f6e4ad44b0f
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774461094;
 bh=c5LTU6ee/k6bUjb3dO9Hlcb6kpPSnYcT0kghqEkpiXk=;
 h=From:Date:Subject:To:Cc:From;
 b=H2k99MnKf2ACxnfRQ87RR8jiMqQuEdyey7lZgmEEwNvogt3bvbCG2fDgPFQ2M10yn
 nEMHMZslhZ0/zKa+fFd1YD+51exSk2ynkwOQutIm3V1CooB2J2aPAFF+82/XdRRXbz
 7SwHDD6lmfOlQ5PRD5sboI8kWZDS7V/AUZAVRXj8ok8ufxPQLdVHiMH7ZyiN3Hpn35
 52pY7408ShWeIj5F/5ouvCXtP0FJcTQPQ9KK8aHDxhjmyHmlek8nzBJVLo6WLWRLvk
 loXX15TlMqJ0Lg288qqf7UfiTuH4bLkRBEXK/vmOtFh/PyR2l0qop0lAt0iEnNLztX
 Pk2u0lbqWmwIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=H2k99MnK
Subject: [Buildroot] [PATCH] linux: allow the user to respect Linux kernel
 defconfig's CONFIG_WERROR
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

Buildroot forcibly disables WERROR (and PPC_WERROR via
PPC_DISABLE_WERROR for PowerPC) for all kernels since commit
6b56e0b4f09b ("linux: disable -Werror") for the former and 1713c3c344be
("linux: disable Werror for powerpc kernels") for the latter.

Some users (me :) ) may only build kernels within Buildroot and may be
required by audit companies to ensure that no warnings are generated
when building them. While we could look at the log manually and report
that indeed no warnings are seen, better not even build if there's a
warning and catch them as early as possible.

Thus, let's allow the user to not override the WERROR state gotten from
the defconfig. It is left as force-disabled by default as upstream
Buildroot likely does not want to fail builds when bumping the
toolchains with newer warnings and no bandwidth to fix or backport fixes
for kernels for upstream Buildroot defconfigs.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
I believe that commit 6b56e0b4f09b ("linux: disable -Werror") should
rather have disabled WERROR from ESP_HOSTED_LINUX_CONFIG_FIXUPS in
package/esp-hosted/esp-hosted.mk instead of disabling it for everybody.

I understand Buildroot not wanting to respect WERROR if in the kernel
defconfig to avoid additional friction when bumping toolchains, hence
why I made this into a Kconfig knob.

I'm assuming we do not want upstream Buildroot defconfigs to have this
set to N. I can add this info to the Kconfig help text. I can also make
sure defconfigs aren't setting this to N by adding a check in
utils/checkpackagelib/lib_defconfig.py. Let me know if this is something
you're interested in.
---
 linux/Config.in | 14 ++++++++++++++
 linux/linux.mk  | 12 +++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 44f8b08e71..43397d52af 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -223,6 +223,20 @@ config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
 	  A space-separated list of kernel configuration fragment files,
 	  that will be merged to the main kernel configuration file.
 
+config BR2_LINUX_KERNEL_DISABLE_WERROR
+	bool "Force-disable Werror"
+	default y
+	help
+	  This allows to force disable CONFIG_WERROR (and force enable
+	  CONFIG_PPC_DISABLE_WERROR for PPC) even if set by the kernel
+	  defconfig. This is typically wanted for third party kernel
+	  trees or old kernel releases when attempting to build with
+	  newer toolchains. Since 2019.08 for PPC and since 2024.05 for
+	  the other architectures, the default has been Y.
+
+	  You may want to set this to N if you want to make sure your
+	  kernel builds without warning for your specific setup.
+
 config BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
 	string "Custom boot logo file path"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..f7f2dfe107 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -419,6 +419,14 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
 endef
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_DISABLE_WERROR),y)
+define LINUX_FIXUP_CONFIG_DISABLE_WERROR
+	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
+endef
+endif
+
 define LINUX_KCONFIG_FIXUP_CMDS
 	@$(call MESSAGE,"Updating kernel config with fixups")
 	$(if $(LINUX_NEEDS_MODULES),
@@ -431,8 +439,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(LINUX_FIXUP_CONFIG_PAHOLE_CHECK)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
-	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))
 	$(if $(BR2_ARC_PAGE_SIZE_4K),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
@@ -474,7 +480,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
-	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
+	$(LINUX_FIXUP_CONFIG_DISABLE_WERROR)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 

---
base-commit: c8dd9e9a011f1a5755df62baceb865efc09862fe
change-id: 20260325-linux-werror-9f6e4ad44b0f

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
