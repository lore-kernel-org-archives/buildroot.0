Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FA8C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 06:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6B382768;
	Tue, 14 May 2024 06:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MP5msoD_yPaJ; Tue, 14 May 2024 06:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA9C82784
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA9C82784;
	Tue, 14 May 2024 06:27:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8C9E1BF38D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 06:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9689060AC1
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 06:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bx6Kp383lioI for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 06:27:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0D4460ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D4460ABE
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0D4460ABE
 for <buildroot@buildroot.org>; Tue, 14 May 2024 06:27:03 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 52BBC35208EF; Tue, 14 May 2024 08:27:01 +0200 (CEST)
Date: Tue, 14 May 2024 08:27:01 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkMENQAeyRGMVX5x@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715668021; bh=zE4SCOITj2LzD9DF9Rlv1jiC6daH5uBvaO4rp7o5V4U=;
 h=Date:From:To:Subject:From;
 b=Se0XC4JHI5ZgRT/wlpc2KeJ1XdFa8y0jGiUJtyL7mWw4JXTHEmzpfTF9jDN7uk6/B
 dphzFrSimvyNwKsf9oHnSVXOZTd4XLm49AUPgUworP1K8YLiw5IZFw50Yn5Y2ryryZ
 jaDAAF1g+Ja/ByekBLgKU7mmp6Pbb0ZsDuctUfhD9cKE7oL9phE9z3oeYzKEfee2qD
 k6qCekqXeteinkyrHJHOJ3pKEBpvSBgg+0v5NHpkp1sctwKzTnsXpKji4uJXmas+Fy
 NLzP3JZMK25zo/+URQeKDA3QCe1N6XE42IRzsVoOBN32o0no0QiEe5OPq/lGl4yrBz
 gTO7lCEN4J9tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Se0XC4JH
Subject: [Buildroot] [PATCH 2/3] linux: add support for vmlinux.efi
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
