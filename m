Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B90D5CC89
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8DDF822F4;
	Tue, 16 Dec 2025 09:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdgD5MjpsXcr; Tue, 16 Dec 2025 09:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1861C821D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765876385;
	bh=I3ZxMoqRTeRwFsNysZkm6My2TTLpN54Sb2GdstrXIsk=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WaE65BU5lOyL8f9W8iEKYFvdrB0Mi6ZCrHlfqCJEM0m4blTGfU2OBx8pZvkCUCMFZ
	 dJzCR8w1YCVZiJYXVGdaE+sI5wthL92bL3GPLz6sMLa1v5pON6yUX909HV1U6c78Wz
	 7zIKML0AQOpAmDkTqn0ZSFNEN0EtFSEmoSIwAkJLro/U9F6idwBrJHvC8iEJSXz6Nv
	 PkBodBzE9TRUctfyBLK1ONKtATj2FkA07ue8xTuD4h1SJrBN7oMdv6U89riZo5w8XH
	 3tOsa5qD5Wyj4PsY8GMIuwb9eTh1sdGUzwCIYUj9jQnYGldVB9mfBLwFahH6vI4hZh
	 DlaCbRN9YkfhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1861C821D9;
	Tue, 16 Dec 2025 09:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB931372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD85E606C8
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkbV-WGfIvAt for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BF8A60598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF8A60598
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BF8A60598
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:13:00 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 514A2C05A8;
 Tue, 16 Dec 2025 10:12:58 +0100 (CET)
Message-ID: <c46ebb5e-ee04-4e67-8883-db808aa2161a@grenoble.cnrs.fr>
Date: Tue, 16 Dec 2025 10:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1765876378;
 bh=Pyf4O9PquJTZ3Z5QxB1sW6vj+qtM581ScMoE9TGKGmg=;
 h=Date:To:Cc:From:Subject:From;
 b=W29Z8RZK3lup7kxLCSamT+evRX0XchSNSs+EAVP5Y1ii+AFiNEx5QUQAZ44ieic0i
 MgAIfv6n5xPQ2Xw3ApiUSlO9+0aFbvi++TruA0NN9QswYgBlaxKkHKXU3Rv8q3qvYq
 NM7KYpQ5ZU2O59zk/8pQErYD6jXTAGWPfcM8NakSCHPVprIdPQY7x9gTxnyvu3uM3H
 h7L6jf4NJLLqREThcO036jnUdShIAAn65THsmV1RqCBQrhnsrKcjvAyCugRlSy44bm
 oHjs6Iu+DjV7AHxdvmyyX7LiA/ZEjqjbjrYf0qLaOKy7rnu1uWQNagcC1fwzYsMf/V
 sj31ObavMlMhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=W29Z8RZK
Subject: [Buildroot] [PATCH 1/2] configs/acmesystems_acqua_a5_*: switch to
 Bootlin glibc stable toolchain
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the Acmesystem's Acqua defconfigs to the Bootlin glibc stable
external toolchain, as per[1].

[1]: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 3 ++-
 configs/acmesystems_acqua_a5_512mb_defconfig | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 9e6d35a859..f693ad9baf 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,7 +2,8 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 8e6d9774da..3e243cd45e 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,7 +2,8 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
