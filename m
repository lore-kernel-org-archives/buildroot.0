Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C1CC53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 19:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D33980F0D;
	Wed, 29 Jul 2026 19:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5XAdXaiXmpg; Wed, 29 Jul 2026 19:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C4C80ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785353896;
	bh=YXU4wffKNrYBwxoggFEKji/h50EX8Bau7lNn9yUAOas=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s93UhnJThOX8sZwltmAKeFrToBr5RE+wuhd/wq6B2yxC/PzhJe9LvcHPFiIGSmSoJ
	 tkRc52lzM0dD9X9viHOt9CJZPRZk4fX6au3q7fKfq4jTy2DygQZMtxhj9TCi6Y0513
	 Glr3c4XZd0BrkvIUz00cJjR8z2++tPBprAxL1M12MmDV2ZPje82/7G7Dc5zrJX62Hf
	 p50PhDx7/KQ8ULCYj1d1fzApQY/KI1CJEfFRrR6OKFLUNZro8Zt36wyBIh+jr82fG/
	 z+fj9YvE8GAP31FH4cxc/q+xX2sHwtVWGQOsvWIyHZMZ61b25gP8sZuqO86C20aruQ
	 FX2tE0vGtK7cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C4C80ED9;
	Wed, 29 Jul 2026 19:38:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 805C22CE
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65B2C40629
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfoOYFZ6dAu5 for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 19:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9121640624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9121640624
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9121640624
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:38:14 +0000 (UTC)
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com
 ([174.115.41.146]:38336 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.5) (envelope-from <rpjday@crashcourse.ca>)
 id 1wpA6V-0000000Gmbq-0WsC for buildroot@buildroot.org;
 Wed, 29 Jul 2026 15:38:11 -0400
Date: Wed, 29 Jul 2026 15:37:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: buildroot@buildroot.org
Message-ID: <5477f9d2-e090-aa01-a74c-4ccabc787d01@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GubE28CEFdHLFoAiav5nNN+v78MgedrJ7VDWf5GqNUk=; b=xBip8fbI5bdSBdmBtIU1bbkeuP
 rkDwgQXP6JlJqjoOQ6TAfZRM4tdKwqXRlyp5+cWcFTBCz1tmSlDwfLFI4oWOdWEw878C38DRG3REM
 bMbKzashlHjFj02iblju7PA5p5igk2M3bHIdlYKTXAWcexiyPSq/XMLXDkIAtd/5Pn9ZodL2BgEnw
 hVptaG//tAe1taDRH5lQy74S0GSa/TmXOtLuDK3fC8+fuoprnKaTF7calK/AjN3Zqu4jFn3HKYGLN
 rKji25Zj2/UTrg7JlyJbkBxJ/M5+8PwMhLe1DNHQTEzAZejeQTQTltVlx3gd6OJWhOEkoh45kRfZb
 9wSByH+g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=xBip8fbI
Subject: [Buildroot] Error building "host-uboot-tools" for imx93frdm with
 latest master
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


  After resetting my buildroot checkout, pulling master and once
again:

  $ make freescale_imx93frdm_defconfig

it appears that that recent patch related to host-uboot-tools is not
playing nicely with my build:

$ make host-uboot-tools

... snip ...

>>> host-uboot-tools 2026.04 Building
/usr/bin/make -j1  -C
/home/rpjday/bootlin/buildroot/labs/buildroot-bbb-labs/buildroot/output/build/host-uboot-tools-2026.04
HOSTCC="/usr/bin/gcc" HOSTCFLAGS="-O2
-I/home/rpjday/bootlin/buildroot/labs/buildroot-bbb-labs/buildroot/output/host/include"
HOSTLDFLAGS="-L/home/rpjday/bootlin/buildroot/labs/buildroot-bbb-labs/buildroot/output/host/lib
-Wl,-rpath,/home/rpjday/bootlin/buildroot/labs/buildroot-bbb-labs/buildroot/output/host/lib"
CONFIG_TOOLS_MKEFICAPSULE=y tools-only
  HOSTCC  scripts/basic/fixdep
  UPD     include/config/uboot.release
  UPD     include/generated/version_autogenerated.h
  UPD     include/generated/timestamp_autogenerated.h
  COPY    tools/version.h
  HOSTCC  tools/mkenvimage.o
  HOSTCC  tools/os_support.o
  WRAP    tools/generated/lib/crc32.c
  HOSTCC  tools/generated/lib/crc32.o
  HOSTLD  tools/mkenvimage
  HOSTCC  tools/aisimage.o
In file included from include/u-boot/sha1.h:17,
                 from tools/imagetool.h:22,
                 from tools/aisimage.c:7:
include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: No
such file or directory
    4 | #include <generated/autoconf.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.host:113: tools/aisimage.o] Error 1
make[2]: *** [Makefile:2501: tools-only] Error 2
make[1]: *** [package/pkg-generic.mk:273:
/home/rpjday/bootlin/buildroot/labs/buildroot-bbb-labs/buildroot/output/build/host-uboot-tools-2026.04/.stamp_built]
Error 2
make: *** [Makefile:83: _all] Error 2



rday
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
