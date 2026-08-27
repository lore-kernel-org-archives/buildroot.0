Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC4EC61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7467607E6;
	Thu, 27 Aug 2026 21:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZCfAfsO2eR4; Thu, 27 Aug 2026 21:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787865692;
	bh=UFaA4L/k2mXoU/EM14OU9uCpDjApUCVXhIscQ4qDB9w=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=T/A6hJWWRbpuE7TnlBn3LuiM2I2I0zAdErZOCHWrXfYhu1MSSyDOzPZQDqA/YJ2aH
	 QpK8Qc0ChsCoY1L1TzvygwXSo2aW0n8bnc31YaM5vzHEsGBfEM25ZNE3E9rwlB/6Xo
	 rzLUpc6P9VbPv45zzrmq9tmnF2enfYFDUMr7953tevQbVGu9ZAaqNWzNpkgRylF3hw
	 HnFUPQOSRJb5bV1t/R6BJjlvOAJZ7o2ttJu2Xo0aUmnQBmsEfodQfVliSEdSIOJcqZ
	 mEP17vII/L/JSdo+fu2+mMYywALyqR/GFctu0t280OHvnj68PmXn6U6+cfYzLmBVGm
	 buxTtrKR/QOGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C89607AD;
	Thu, 27 Aug 2026 21:21:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6052465
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC44080E9E
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDX3AIB5kw8C for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AA4980E9C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-482f2ee53e7so54198f8f.1
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 14:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787865688; x=1788470488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZjHs2oFBhom+on19y9oieHDE4aA3G9KmL4Gl0I/Yfok=;
 b=YtNzjisCkGovnp/iCYpcXld3qaZQQ1m8Y0bQHTIWhExuXfDcL6sU7v9vE26BdXVRMS
 3GsD1Kcsw6dCyRCaKk+wey/1TrEfyROON8U6mFDZ51jy5lEoVq9ztNBOdjwmPPRFwOS7
 0yC3JnYta07aMci77m5ttDld0mfPfQlFietHHM9pKk4UJ3BOhTx0QtAuIwrkljELhQoF
 cgFMjCQvqpOBfnxfiR3OTo3CzUPss3l+HDYZrj08rHxzntC+1iuxzQ9aGRrfaTh82vun
 aaK1gD9mXl3jlVY99dq9wNBrBBrGFeSiK63vNVBnZXT4WJw5iR6dirSILAT3XZBWEVQq
 Kzmg==
X-Gm-Message-State: AFuF++mVV6s23T0eoNvgtzu1QF0iobOnboopeZQPOcXouXMIWKwDxXsY
 LVtz7D4XQpDIDwM/7+Oz/XUCnoq7xpQuwQoiIjCYLhr9XNGmkhow2c9MyaJcpbCdhg0aqkFTq97
 hzgdaiuA=
X-Gm-Gg: AR+sD12kHC461zXdMyjF0n09+qmclPdbEADZ7dMI6wTjkVVpDgTWX0+BaM3DlWTrYFT
 VgrxI29wzqCpprhVuyMdflNGBZLECSpdM3Y+vv0vwafLPseNDf+ZNYAvHe495SjiLFtwtP8bIUv
 LxYqZ4VbH6S1rekQWKliNdZbAPgEcIrCmLjEEKy/S38zvyDvxcbs1rgk7aYxkVuQYX+5rc9BV13
 JiZNfsC5vpqVkp0hfj16GcwAVFx1KdIag2ueFG6rbEdA67/PHS3e6pDvC++7LcCXqkmDzd+MKOJ
 EeUyVd0bJiFPdcv+MrE+i9Q0FAD1Tic38OYLK0uJfnamAhGC9gX6W0G0Ul+AtWwKvRMDmstfoVU
 hDMSkBBo38XqgdlFcfwdBUl7EVrIAi43iFx7M7rDgVoO3DvzJ2Spi+db3ZW+2///Up6MecZqinX
 I9yV3dEJj+V7F4l3kNj2Oq/mHqLsvVLwFJ9GFCYnjytw9mojMYMAIyiIw4M/cpMC5PIuX/UPR2k
 JAHiGUWtIJrt8FRv9iMFhigPgcu/7QLUA7N5hb5TuYm/7D4sBSe130hoovywQg=
X-Received: by 2002:a5d:5885:0:b0:481:5167:abda with SMTP id
 ffacd0b85a97d-482f7999dbbmr1707364f8f.9.1787865687896; 
 Thu, 27 Aug 2026 14:21:27 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27a9945sm11303467f8f.9.2026.08.27.14.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 14:21:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2026 23:21:23 +0200
Message-ID: <20260827212125.1988552-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: disable SSP support when needed
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
