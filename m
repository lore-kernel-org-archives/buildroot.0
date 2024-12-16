Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACDAE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019E440679;
	Mon, 16 Dec 2024 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4pb4n9zndLE; Mon, 16 Dec 2024 16:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C802740687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C802740687;
	Mon, 16 Dec 2024 16:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C39CE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 16:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DB6761214
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 16:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDKjrskXUS4z for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 16:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DD6C61053
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD6C61053
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DD6C61053
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 16:37:48 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 24836C1A51;
 Mon, 16 Dec 2024 17:37:45 +0100 (CET)
Message-ID: <cc0e87ea-5830-4b14-86eb-b021bc5b254a@grenoble.cnrs.fr>
Date: Mon, 16 Dec 2024 17:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Buildroot development <buildroot@buildroot.org>
Cc: Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Michael Walle <mwalle@kernel.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1734367065;
 bh=mvFRz5BBRs9g/g875M2GqNKv/e+vzSM4PmN8xI3LCo4=;
 h=Date:To:Cc:From:Subject:From;
 b=PCRtt1/yQy/ggg8SOYcYvwAJUoZJZOFLjVb5tAuhuR38qp4xJSVjfejgGaIx7O7Po
 3O7GZd2pCGPACbld9KjpvcpU3xaw3Uk14ePz20TzFO9kTRSKMGyHWEdmfhlG0x2XPd
 ArLB51hDCaEng5m7QqkMBRDLf00im2wUibcsvptU/6FpuCpgMe6FNjngmydsDJGx6N
 jT/jdDSCnkjEQ2yifGlz9/4Bd/Iv9g5v1iVqjuH4IofkUn/H7OWavAs3Bl+YQUqkJt
 ynJ+NMXkYHUeC9phIEHd53zh4oGzgSDCEkgHobPiWylAU2sMSuxQNQtkDMBK28vwqV
 PfvOSNKzjBKng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=PCRtt1/y
Subject: [Buildroot] [PATCH 1/1] linux: make out-of-tree DTS work with
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
 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1d3d8fffa6..35f358c56f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -517,6 +517,7 @@ define LINUX_BUILD_CMDS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
 		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+		echo "dtb-y += $(notdir $(dts:%.dts=%.dtb))" >> $(LINUX_ARCH_PATH)/boot/dts/Makefile
 	)
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
