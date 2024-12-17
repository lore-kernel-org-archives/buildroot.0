Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20695E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 10:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E22580F0F;
	Tue, 17 Dec 2024 10:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr96Df9fk4fM; Tue, 17 Dec 2024 10:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB1281C0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB1281C0A;
	Tue, 17 Dec 2024 10:04:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A174C5
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 10:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2063480F0F
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 10:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-hcJ05OpnEa for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 10:04:12 +0000 (UTC)
X-Greylist: delayed 523 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Dec 2024 10:04:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED19B81C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED19B81C0A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED19B81C0A
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 10:04:11 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5CE4CBFBE9;
 Tue, 17 Dec 2024 10:55:24 +0100 (CET)
Message-ID: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
Date: Tue, 17 Dec 2024 10:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Buildroot development <buildroot@buildroot.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1734429325;
 bh=IsLDBpKQFGxGAwYNyawCuKqwCbZejD3dOJ3geeSJz7I=;
 h=Date:To:Cc:From:Subject:From;
 b=ESVZfSyKUkVbVUif2EsL9t4ssh3P04Yqr0C4Ajv789gAxsDjqi9EGOiDIT2MmtbP9
 /honqFS+x6/bcFHxs5CBqDGH3oYB/R0aa2sfyJTaLmuJ7d1CN6MG0+t9NHAmuFYnkL
 ppf849c9TuSS8rEqmZ09XUpaHHVl7ZGI3aXj1aBU0bhhX309hjSefARthJCAyR/lOH
 5CfNfmjpSnEGSMElaoT+H8fFHdewAeF4rXA79BC/KGMEG72DWFt4gz9yRc+mJrlfIz
 h8DBwbK4KgNV5E/go+E/f/q9myLrusmMurNSJWTl8mIC+0ypvBig01JwG6iN2tCgRL
 7q3NROLLy/w0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=ESVZfSyK
Subject: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work with
 newest kernels
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
Cc: Michael Walle <mwalle@kernel.org>, Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Linux 6.12 (commit e7e2941300d2, "kbuild: split device tree build
rules into scripts/Makefile.dtbs"), the kernel build process does not
build the DTBs from the source files listed in
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.[1] This is because it expects all the
DTS files to live in vendor-specific subdirectories of
arch/$ARCH/boot/dts/ , whereas Buildroot drops them in the top dts
directory.

Fulfilling this kernel expectation would require a new configuration
parameter for the name of the appropriate vendor subdirectory. It would
also require changing the relative paths to included .dtsi files.

Let's add instead a rule to the top dts/Makefile for each DTB we want to
build. This avoids breaking user's out-of-tree configurations.

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html

Reported-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Changes v1 -> v2:
  - define a hook for LINUX_POST_PATCH_HOOKS and LINUX_POST_RSYNC_HOOKS
    instead of modifying LINUX_BUILD_CMDS
  - use $(patsubst %.dts,%.dtb,$(dts)) instead of $(dts:%.dts=%.dtb)
both changes suggested by Arnout Vandecappelle.

I ran the folowing build tests:

    # Test with an old kernel: v6.6.30
    make acmesystems_acqua_a5_512mb_defconfig
    make linux

    # Test with a new kernel: v6.12.5
    make linux-dirclean
    git cherry-pick 0938346cde  # bump Acqua's kernel to v6.12.5
    make acmesystems_acqua_a5_512mb_defconfig
    make linux

    # Test the OVERRIDE_SRCDIR case.
    make linux-dirclean
    git -C $HOME/src/linux checkout v6.12.5
    echo "LINUX_OVERRIDE_SRCDIR = $HOME/src/linux" > local.mk
    make acmesystems_acqua_a5_512mb_defconfig
    make linux

 linux/linux.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1d3d8fffa6..eb509fd747 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -327,6 +327,17 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+# Kernels 6.12+ won't compile the custom DTS files we drop into
+# arch/$ARCH/boot/dts unless we add specific rules to that directory's
+# Makefile.
+define LINUX_ADD_DTB_MAKE_RULES
+	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
+		echo "dtb-y += $(patsubst %.dts,%.dtb,$(notdir $(dts)))" >> $(LINUX_ARCH_PATH)/boot/dts/Makefile
+	)
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_ADD_DTB_MAKE_RULES
+LINUX_POST_RSYNC_HOOKS += LINUX_ADD_DTB_MAKE_RULES
+
 LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH))
 ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
 LINUX_DEPENDENCIES += host-imagemagick
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
