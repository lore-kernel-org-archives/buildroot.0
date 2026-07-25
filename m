Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5412C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 15:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6720340595;
	Sat, 25 Jul 2026 15:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7ZtkLIzLZCo; Sat, 25 Jul 2026 15:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F4B40793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784992608;
	bh=uWblEgScBwkd0one+z9F0ipe1Cb1j7MW+tYynDkhD3w=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WG7bjeLrHG6W5FaTqUnPpFGXOncXLv2VDBOpbk+x9VWxJNnVNtV69S2RxMJzsqsDT
	 neY98y09d8Gb+AKlmGBRjdSua9Uj5/KbB8nmOMSGiPKGeRSgD2FzhCzVfHgC/XzqSM
	 d1KQBllnDlzMA3PFeZPzKQWpNiwFbkDkEKEFqCv2OxKUOdvRVUlhJqcpoQM/K32NLj
	 OuHIr61IA16HrzlmHu4D/HTLTAofFPsFPvLLKmntfVUkwNgeVN2RxP8oDl7Bz17BzL
	 coBeP8nHZJuxkYYytz5gdeXCEilVoZgvj0OxwsrsbfTm3ZKhqID7TiaLL73fpWH/S0
	 qKeeUfxlZA8Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F4B40793;
	Sat, 25 Jul 2026 15:16:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE6CB977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 15:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3A5E80CA4
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 15:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Csx4E8we2mdK for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 15:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DE1580CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE1580CA3
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DE1580CA3
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 15:16:44 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:66ff:fe4c:e46c:fa32] (unknown
 [IPv6:2a01:e0a:12:eba0:66ff:fe4c:e46c:fa32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 7C7E0C1387;
 Sat, 25 Jul 2026 17:11:10 +0200 (CEST)
Message-ID: <499674f6-6f37-400f-95b6-bb690ab203c4@grenoble.cnrs.fr>
Date: Sat, 25 Jul 2026 17:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1784992270;
 bh=FFs6AYuqOsW1nSWeyWa5ysvbTWFP5YGNKsuyXA9Uh1Y=;
 h=Date:To:Cc:From:Subject:From;
 b=bho1brWG2CDN8WgqCQKXRJDJlCH0eexBMBAWp1RA/HUT5OIJkjEFpraEjEjIIQOXo
 obnBv+dqZiJj4FdVsP2PEELwT3QCHFRn3h03Vbw6nIxVneWFNK7BM9NT4gDxjjAJKR
 N+DJzKZyMuZpsL5WMYHc3k2NndGa5KqprW4PnDyP3npGzDNkd1d2ImuwcfCuVifUjZ
 OF8zUj5Kp0TRZDD/IUkCQX8ZEdAnZ2FtxYe0AV1miokqMjJZoiJ9Gtu3TbxynonH98
 G39RxBMPv9F/SQaUnfEvCxnXThr9WugztB0Cug144qmqgDk36v+5IUWdyjlUU788d4
 6kogism0XRWsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=bho1brWG
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.40
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

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Note: this is meant for the Buildroot master branch.
 * on 2025.02.x LTS, these defconfigs are based on the 6.12 LTS kernel
   branch; I sent a separate patch for this branch
 * I don't know whether it is worth backporting to 2026.05.x
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index f83883b936..67e419e2f0 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
+sha256  3712fc1ec839e4daac981176c8518912e8f452650aaedfe4381da4419613a431  linux-6.18.40.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index f2ab66631f..3eb805b530 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 172eaef39f..0664a268b0 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
