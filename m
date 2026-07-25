Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31314C531D0
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 15:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99CDD6066F;
	Sat, 25 Jul 2026 15:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUBa3xLxgGzo; Sat, 25 Jul 2026 15:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D67060668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784992607;
	bh=8sdzsnx0ZS46BiJIxnP39L8b8at19gJnGEcp/7s4e40=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lP/fF+JB15rv0uSYrJTNFz+KUGG1ciyw59HYjVVOAwS6ETQgTl1cuqsMkjMAG4PQP
	 x+kUx4QiQLeA2H5OzC7K4YxiPBRJppTyhhk3+UJ2NoTWPzjeKfx0ev6Lpd6zBwsqdy
	 NmPxJdTTw4dgILN9+P+h01NQnC4Z+5psJw/b5Msqy57eOsyR7GDqsrjkX/vEbP5Lrh
	 OrwmBl+0+ZnOwXFyiDr51SCYaZ26Q7HQPM03afrmY5bClMItxN8pwVlFj5jLTeOTem
	 ZSlDM9KHHQpecHkHA/DWInruQ9slYWDzbtDCJpnXdJ7bIdXfDdU/M9p/sHWGKi080Q
	 8HGAsu1Ngj0ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D67060668;
	Sat, 25 Jul 2026 15:16:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD77D490
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 15:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA6CC40793
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 15:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_0jX8ZAZtxl for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 15:16:45 +0000 (UTC)
X-Greylist: delayed 360 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 25 Jul 2026 15:16:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4CF740595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4CF740595
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4CF740595
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 15:16:44 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:66ff:fe4c:e46c:fa32] (unknown
 [IPv6:2a01:e0a:12:eba0:66ff:fe4c:e46c:fa32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id B4403C1371;
 Sat, 25 Jul 2026 17:10:40 +0200 (CEST)
Message-ID: <fb861da0-a232-43e4-923e-15a1ece7017c@grenoble.cnrs.fr>
Date: Sat, 25 Jul 2026 17:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1784992240;
 bh=26sVyCBmLg5hddzIRM5ZAPxxseHAv1KTlKMZluVCm48=;
 h=Date:To:Cc:From:Subject:From;
 b=V1KNm6XvFkPv2uvSYBWVMm1dyeqEDzMaPaAslViNU6eQ03PEgs6Ek0bLOY40Me4A4
 9i5w73MRgYOwgM6lxefhep4tiLkviSd3uPAbf+nMiKdB1GgyPOGe/JoMMrn3D/SW5y
 xhx2uBX/eKTwl29jzx7ytAb2YDZZfJBi44hcaHC6HQZLqs6umwj6jD8PSmfPpuvhpW
 MtA3viF/zM7kcecOBJSy/PqhD7cLL3WmyDAqsaJrG1b868ax+3iB63xnQp2KpO2GBx
 2TQtWDLulz7CU0c0rOxxBnO5jT7hM+E1/nwtw2wf8OrP4YXXXYnla1ZN9/rjo0m3us
 UavXYaeH95dvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=V1KNm6Xv
Subject: [Buildroot] [PATCH 2025.02.x 1/1] configs/acmesystems_acqua_a5_*:
 bump to Linux 6.12.98
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
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 4 ++--
 configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 2c86a53263..6ce8a07bdc 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  a62b6a2d207ff72510e5f47156b7078e1e71797357412411b8e4fff97fc8f4c7  linux-6.12.98.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index e3cca2408c..71a559df96 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 1a38c742d8..32d7692ce4 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
