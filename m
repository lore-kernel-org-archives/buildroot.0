Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803BCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E8D61101
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1E8D61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9578C607A3;
	Sat, 16 Oct 2021 21:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhpENVCpLgIi; Sat, 16 Oct 2021 21:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D3060705;
	Sat, 16 Oct 2021 21:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C258C1BF2B1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1C3D403B7
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lechnology.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8vWbapKeHg3 for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 21:56:05 +0000 (UTC)
X-Greylist: delayed 00:19:06 by SQLgrey-1.8.0
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D8DE40390
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 21:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lztirQQ/unz6S59esvuRoecQ0n+D3hfAk4aJrKyJupk=; b=DWodCFgwlJ4HeVHBltNMdihzQq
 k0gyCxK/exTotCs3uRIPKJi7x7qeC0jQstCgQOgTvFV8XIeZG2F5he7DYrf9qKfX11iWHHSNlu3G/
 emzyTRnQfiakEQhHov7CUCygIJ/DJzy30/GZJ8p/C6YnGECF6aYK61e1MmckxiyYmJHOMm7hNCvr8
 tQHHt7SunoH9R4amFJNw7HAa25be4BCmLGe57Wx3N9EtIEFYEFq/hx4Qiv4H1TSKuEFTXTl0wxEmK
 sOlsbQfohjQene+PDubUkpT3CUARNvyq7btFnfyXMd+2LYhmQ9odcOuiskORyG3sDREz2xxijFmQj
 CkXIzSAw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:36016 helo=freyr.lechnology.com)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1mbrMN-00020S-D4; Sat, 16 Oct 2021 17:36:57 -0400
From: David Lechner <david@lechnology.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 16:36:26 -0500
Message-Id: <20211016213626.3264701-1-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [Buildroot] [PATCH] configs/lego_ev3: update to U-Boot 2021.07
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
Cc: David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot CI has been failing due to 404 error on older U-Boot. Updating
the U-Boot version should fix it and it doesn't hurt to use the latest
U-Boot anyway.

Signed-off-by: David Lechner <david@lechnology.com>
---
 configs/lego_ev3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index b4a1000036..555a63e36c 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -43,7 +43,7 @@ BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
 
 # host
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
