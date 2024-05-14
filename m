Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D0EC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 16:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9101141521;
	Tue, 14 May 2024 16:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tqeb1AK_yO0R; Tue, 14 May 2024 16:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7948D415AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7948D415AF;
	Tue, 14 May 2024 16:16:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8DAC1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A55F581E8A
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id af7JApDMYOds for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 16:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A768A81E52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A768A81E52
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A768A81E52
 for <buildroot@buildroot.org>; Tue, 14 May 2024 16:16:21 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B03683521163; Tue, 14 May 2024 18:16:19 +0200 (CEST)
Date: Tue, 14 May 2024 18:16:19 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkOOU715VxIiR3KV@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715703379; bh=FanOUHXVVgJU3q+mib+S/F2gLKHEBtKseaNX6mGNonA=;
 h=Date:From:To:Subject:From;
 b=D51rUktLrqcXyL8pR9FcKIzW7mK0W0BHCxB2vDa5rxC8zPTaY/FZNKx7HQIe9w/8p
 QKrVgf8pMe547tCsnZWBj9gHgX/rFM3umFVMq7gi70sZ7aa0nfhiHz9XPscTkZ9gz7
 3uIa1vapEoWDvr9M+BQlEtVO3U1CmFtbme81siptWMiT3+cKMsgEtxWO/s6vSr5dCi
 R8I3oyVPOcA6IhYYzEDns8hPBFA/aAFFbZT5x8QO8AcXrfjFgnFOnHMYy/aAkk/SoG
 e9WyPqZ493PCIuoqoWATxz7RhLCXD+iWU/l4koBqXA5IRq1rq97qEQ2WouyBiLi8HZ
 KEVuwlAcxtvvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=D51rUktL
Subject: [Buildroot] [PATCHv2 2/3] linux: add support for vmlinux.efi
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2: 
 - no changes
---
 linux/Config.in | 4 ++++
 linux/linux.mk  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index d3d4c42910..8aab953ddf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -285,6 +285,10 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh
 
+config BR2_LINUX_KERNEL_VMLINUX_EFI
+	bool "vmlinux.efi"
+	depends on BR2_loongarch64
+
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 16d9f19470..3e0e728656 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -231,6 +231,8 @@ else ifeq ($(BR2_LINUX_KERNEL_IMAGEGZ),y)
 LINUX_IMAGE_NAME = Image.gz
 else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
 LINUX_IMAGE_NAME = linux.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_EFI),y)
+LINUX_IMAGE_NAME = vmlinux.efi
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME = vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
