Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF396C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9238C82E4C;
	Fri, 24 Jan 2025 18:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tmkr4iijsNRy; Fri, 24 Jan 2025 18:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE964831C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE964831C1;
	Fri, 24 Jan 2025 18:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE9E3944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D75E142036
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuWZhL74NPa4 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0C0A42037
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0C0A42037
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0C0A42037
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:31:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EA7E0B00576;
 Fri, 24 Jan 2025 19:30:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48868])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 19:30:57 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 19:30:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250121102222.1335874-1-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <abfe452fe20cd5cef0ac61dc04ff7022@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737743465;
 bh=dHzgBScSsXcLfjH/DGBpxwx1tAd0C1hd5lJuDilaQyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZyGnalV5/WgPeANOx6oYKL3h2sieUdq6w2WIlOBH4WBs2Y00vgHZVODu8Kl+WPo8a
 PnaZV6+kN7cf7qm/JigRdXLIJY/LuL6+GsV/o4FlgrtpBi6LXN7MDyfqaQ+HVpqDvR
 bdMnbkjqOdPpX6niLvt+xGGk9Cn+ypNGo9WHRJs4WDU5Mlv0tsgpJzuhp7/M6QKZ5o
 OGU3Rd7DbyiXATtpOenX/+hV3zP36awVmLroDInRk5d2dCyJGeMeQVC7hCfgyrNVJN
 Q8Zze73jpTkfkhtR7QSSBtEQo/fgomrx0+veACcpuDpOvnFG8GqrFYf5Cz7qJjn2Nw
 z9Qf1jZkVH+gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZyGnalV5
Subject: Re: [Buildroot] [PATCH v3 1/4] boot/xilinx-embeddedsw: new boot
 package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/01/2025 11:22, Neal Frager via buildroot wrote:
> This patch adds a new boot package to Buildroot for building boot 
> firmware
> applications from the https://github.com/Xilinx/embeddedsw repo.
> 
> If a user chooses to build a boot firmware application, it will not be
> installed by the xilinx-prebuilt package since it will come from the
> xilinx-embeddedsw package.  In this way, users can mix and match 
> applications
> to be built by the xilinx-embeddedsw package and applications to be 
> copied
> from the xilinx-prebuilt package.  This is necessary for the versal 
> platform
> because the pdi file can only be built by AMD Vivado.
> 
> Support for additional applications in the 
> https://github.com/Xilinx/embeddedsw
> repo can always be added to this package as needed or requested.
> 
> The xilinx-embeddedsw package replaces previous solutions including
> zynqmp-firmware, versal-firmware and xilinx-source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
