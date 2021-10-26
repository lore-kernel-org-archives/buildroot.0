Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F362CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:25:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9978160FC2
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9978160FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5A5404DF;
	Tue, 26 Oct 2021 07:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_UvO7k7pZbA; Tue, 26 Oct 2021 07:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C98404D3;
	Tue, 26 Oct 2021 07:25:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 136B81BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D534140262
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHzk67MMdP3p for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B2A340257
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233076; x=1666769076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9295OeBBas0A0votrxUs1hTzC1qjfdk4pM6FTB9CIA8=;
 b=SsB9Nfgu8OJuBuYFrYfAUuHVs9oqdYB6NWXvDnFtdbosDtQeFfeob1xh
 PgOJUmsyNDEZjdKZsK0yej8UmYtb4vir8EFwemN31K2+Z6h1ws4FCImjU
 LPp6Ffm3ICLF2binem0oxLDa5HcCT/WZRP6oZKZ6e44PuzBpr5oVXHGqx
 iiGaJrrqtd0B9Hwb3t8jKxl+XlomJ3WhV15nGXp5ASunCmeKI2ao+eRhN
 cETfy3C/nj8/Bn8kJ3U0sTD9O3LZyhMchaENHR7F/3j3CEO7tlaZIE9A9
 Fu5JaRuKTlObmhRw9a9GdTto6yOxCpRyaoINdc2USLpVFiereIMZK8Uzl Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623063"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:31 +0800
IronPort-SDR: 5SFmv64xR62SM4ohqBSjEAQ6g1pdzg2/EQIL0kXRDButY2M91JKCBS8WUkON1scC9MSkpl5K4F
 NWSdHGY6yJYP65qz2bgbAk5kMH5UpAcoBMUYS+hLI7ls5XzmIKT395Ob2xWLCNL4tE9VD7cKc1
 hTk5DiSYmAqaj/bTpYHNA+BqIHn9kSQtnOcUMEVIaVHMgjUc4oa8GhQIz7BM/vA8iYR7VMzjnA
 BdT5j4riWWkbx8iAandg1pa/zTfiwJpsNtCvr6T7jR+PGaWEFd0di4+FXr6MqIqsDKWEiDPw9N
 1i7RPYhm4llqubhnyNEAO+Bl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:30 -0700
IronPort-SDR: jxR6bJYqTQgNzFSUaaRLvF1bU3Yfdk8ELPWiDfQ21ZKfTDKYTjy3iMiOXPImcSOXSKC8sDJXwk
 HpZYcOaMm6tZZU7oBXPSAfLMwxYgHCn7tq67Si7Vs+Td7StWPo54UgMR6yxgFnOsUDze4Zo1LP
 yiXoZiUfCYXofq0fOhiJl86sBppMk/ZxthSO/1cuIVQfHw+2hB1Pygjur2LiT39Xux/+OLlK/o
 /HA1l6yhnp5GkaJGZ+PEBOOkse8nsxchL2lxvnTI8eSk4DyUV+TBqfPh4jw34eKnk9Lam8wSui
 7i0=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:33 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:21 +0900
Message-Id: <20211026071728.954356-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 03/10] package/Makefile.in: Fix NOMMU RISC-V
 64-bits toolchain base name
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

From: Christoph Hellwig <hch@lst.de>

Using *-uclinux-* seems like an only partially followed convention.
And at least RISC-V 64-bits gcc does not know about uclinux tuples.
So switch back to the normal "linux" one for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>

[Damien]
* Make the change conditional on BR2_RISCV_64 being "y".

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 package/Makefile.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 04347d2d84..dae7a859fd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,8 +39,9 @@ endif
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# FLAT binary format needs uclinux
-ifeq ($(BR2_BINFMT_FLAT),y)
+# FLAT binary format needs uclinux, except RISC-V 64-bits which needs
+# the regular linux name.
+ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
