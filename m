Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899D6C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 06:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18DE826FF;
	Wed,  4 May 2022 06:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZi7UAqdow-b; Wed,  4 May 2022 06:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6536881A12;
	Wed,  4 May 2022 06:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3C501BF8B4
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 06:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91D79408D7
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 06:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linenoise.info
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRBrTmNn4Ouz for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 06:08:14 +0000 (UTC)
X-Greylist: delayed 00:06:29 by SQLgrey-1.8.0
Received: from ibeerc.linenoise.info (ibeerc.linenoise.info [130.61.186.89])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABA61408CE
 for <buildroot@buildroot.org>; Wed,  4 May 2022 06:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linenoise.info;
 s=ibeerc; t=1651644101;
 bh=kC9b5e3v/OuiFEavuckUo39DXnaIfbCwuqjyh0JjLxo=;
 h=Date:From:To:Subject:From;
 b=nLXaGtkEoniozsgwcSAidvfTlKiGPNiMuR3R7FSWQb6CR/6kb3S6KFkQ/ZVTo4doj
 lUfZ5n2cf9W9MpgxrGbd/q6s9hSyaoEv9PpnA3h81FFIju6yq3E2BvOtP9NzKViJs8
 DBDir26pd60ixtfhcQWG+iKWT7QukYA6ZM4Zf5ATkp41onoliThvuMjp5NaTiQ/6mm
 55NVgewoH6zzx2rxqcF4HxchS95ZyNmULHODevFlEy71y+wtRofshx0SJhxHdfN1AO
 k7O1qknvSXh0iucWY/ktvQqrs2RI0iwBmJrynW5HsK4ioz4mMpiPQYFuRQofNoSWBO
 ZFVxNX1rC7mAw==
Received: from salem.gmr.ssr.upm.es (unknown [109.227.153.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ibeerc.linenoise.info (Postfix) with ESMTPSA id 6064321801
 for <buildroot@buildroot.org>; Wed,  4 May 2022 08:01:41 +0200 (CEST)
Date: Wed, 4 May 2022 08:01:40 +0200
From: "Alvaro G. M." <alvaro@linenoise.info>
To: buildroot@buildroot.org
Message-ID: <20220504080140.03e99fbf@salem.gmr.ssr.upm.es>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Kernel and u-boot DTS include paths
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

Hi

I'm building a system for a zynqmp SoC from Xilinx and I'm facing a
problem regarding device tree include paths.

The thing is that the kernel has placed zynqmp .dtsi files on its own
folder under dts/xilinx, such as xilinx/zynqmp.dtsi and xilinx/zynqmp-clk-ccf.dtsi

On uboot, these same (or equivalent) files are placed in the same
folder as any other .dtsi files, meaning that there is no xilinx/
directory.

So, now, since my custom DTS for my board starts off by including
those two files I mentioned (along a few others):

/dts-v1/;

#include "xilinx/zynqmp.dtsi"
#include "xilinx/zynqmp-clk-ccf.dtsi"
#include <dt-bindings/gpio/gpio.h>
#include <dt-bindings/phy/phy.h>
#include <dt-bindings/net/ti-dp83867.h>

Well... you can see where this is going. Linux kernel builds without
any issue, but u-boot fails because it cannot find xilinx/ directory.
But if I were to make uboot happy, then it would be the kernel the one
who complains about it.

I could just use two different files, but this duplicity doesn't sit
well with me. Am I missing some option that coould make this work?

Thanks, best regards!

-- 
Alvaro G. M.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
