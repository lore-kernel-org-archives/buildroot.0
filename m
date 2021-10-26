Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D78DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:24:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F247860FC2
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F247860FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9588A40220;
	Tue, 26 Oct 2021 07:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNWupRSLKYPE; Tue, 26 Oct 2021 07:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1B9540225;
	Tue, 26 Oct 2021 07:24:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4924D1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8D064023F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21JI_Dcp1exZ for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 620CD40259
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233076; x=1666769076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/R9ul6e/1iFb/g7zsQnJ9wxw3o53LzHWFRae1obXFM4=;
 b=KMyyyQIru3Im1Moqe2NyYrLnniUe6HAlZg4QFcA4TJYmbRjUJmGFMgj/
 QDMVqX6ymdmikBCNSCSsKJJubpZQXAbzDzhbMAczJMxoaREvi6FtldWgc
 anM1lER5X9bEpfn/nS+ViPDptlMraSs17LlgVxOsqQqHCy/Kyriu8MIjr
 kE6orgTJSRlj5bO4mA2IAsthVufvAIXcPYgTblODSTSd7ULlaopKVjMNW
 whhK1/dHYe/Tj70n2HAl0FEZeHqbeSD0o2rIBVoDwsrbnP6J+6cAfx8I1
 8bbLfAwgoTg+jBNN5wkpXCxv2cG7tjXwq3+1sbD8/+aNs9YEBMASwc8nh Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623066"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:32 +0800
IronPort-SDR: eO6DRRR9B26ALUBgI8hd8TYJRJkcAJsY381y95tBCRoVvn6PwjsK486YEkB0xMXDujvYbNDAMP
 QixnGcCuBWEkGIW+B952qMXSUvoqpe7AtmVHIZpCZbrcYvSOXMy3Sor36vKlZtvD3ECIWW0eLP
 zPNbuAoILYAm/fu9wygEOTJ5iXLp7aBK+plEh73iNk1GaDyt//mVIbQlY095wlyGhADHkXbLuw
 391YIK/Urso7Otx9wmBYCRtMFVlybpBlyCmBnMP7UPq8975Dy7YBS7YAlugHAEM51ScMGh7sZQ
 VhP94G1fb+p/P6QkXmqU36ci
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:31 -0700
IronPort-SDR: PfNuhct2vcMMtCKVLd63e2wrolQ4FA2a5A88+7UBinMi6SH8hV8/JGw2AWo99wpROqcHf0wpa1
 I8mZoFcJ8/HtZ+2ndSUPe5N3VP1ioPHWXt4GgAxkw1rHi0exxg37DwT4kyPOLLyeNgn4M3p0tc
 RyrGQuutYZ2LkxdktHRgSP5Gl7/31lwLRD82AFv3P/AJBnOg0ZdvtszSjerc0aOj+5zS1owTi9
 OSoQoFZOaNZY1MSc5mVbiFm2gyuMY6ksWisHZdlM/FFKrVLiJ4XuVY/r8jKVLo3Fhl36CxW+Z9
 ytI=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:34 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:22 +0900
Message-Id: <20211026071728.954356-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 04/10] arch/config: Make RISC-V 64-bits MMU
 optional
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux supports No-MMU RISC-V 64-bits since kernel version 5.8. Make
MMU optional to enable building for RISC-V 64-bits boards that do not
have one. MMU use of RISC-V 32-bits builds remains mandatory for now.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/Config.in       | 1 -
 arch/Config.in.riscv | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index d50718e2d4..c99af89efa 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -209,7 +209,6 @@ config BR2_powerpc64le
 
 config BR2_riscv
 	bool "RISCV"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	help
 	  RISC-V is an open, free Instruction Set Architecture created
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 1fc20e5de7..e6436d7c39 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -71,10 +71,12 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 endchoice
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
