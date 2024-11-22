Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F9DE6918F
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 20:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0292C61481;
	Fri, 22 Nov 2024 20:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygc1bmjUGSYV; Fri, 22 Nov 2024 20:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F09A614A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F09A614A3;
	Fri, 22 Nov 2024 20:32:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5095E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 20:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D273742DB1
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 20:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEwvDHdpjyvm for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 20:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CA2742DA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA2742DA9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CA2742DA9
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 20:32:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1F1D12003BE;
 Fri, 22 Nov 2024 21:32:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54486])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 Nov 2024 21:32:29 +0100
MIME-Version: 1.0
Date: Fri, 22 Nov 2024 21:32:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20241119134559.3891625-1-neal.frager@amd.com>
References: <20241119134559.3891625-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <174269433fece4f1c4d1d2cb74e84e83@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732307557;
 bh=zq1QKDO+oxNQEwQ0nX95Y3CcDJqgUJXGuyGp4IpOn5I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VGP9QXrby1hiMuFp77edWRw+DblaEAJTpXrEVdirMxyKq8CmnfBnZCTL5TWLO9MgK
 wCIPgMsmA+89D3+d07qWIQY7lxjPt0wp8E01s+AIY8q+Y0oBaSN/mnLshPoYwWFM6l
 OaYDzoVLD4tvb4CgHaHPBRlDBd2IoLOXBeLFR8zoxpWhka7XAE4laORbMhS92dbvOI
 cq+7RT/CNtdJhio6A26F4UptHEDxzVT19VnluUxM9XBIn4JNlditeIhOmVMcmBe/YH
 BFmOCHy/vzsHhIzzDAjeRr1vPh8GaggJXGEgHmCdHRHlADQCjSFyDf4mEdEbDadY4Z
 rzbIqx/EhUL8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VGP9QXrb
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches: add
 xilinx_v2024.2 hashes
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
Cc: martin.chabot@gmail.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/11/2024 14:45, Neal Frager wrote:
> Add hashes for xilinx_v2024.2 release for zynq boards.
> 
> xilinx_v2024.2 release includes:
>  - linux 6.6.40
>  - uboot 2024.01
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks!

> ---
>  board/xilinx/patches/linux/linux.hash | 1 +
>  board/xilinx/patches/uboot/uboot.hash | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/board/xilinx/patches/linux/linux.hash 
> b/board/xilinx/patches/linux/linux.hash
> index b007db4303..6f269e1c71 100644
> --- a/board/xilinx/patches/linux/linux.hash
> +++ b/board/xilinx/patches/linux/linux.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  
> 6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  
> xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
> +sha256  
> 8ebbbe2d40597d9a5f36d47a1dfe4caffcef3d9f5ffa059ed4504bb761282593  
> xlnx_rebase_v6.6_LTS_2024.2.tar.gz
> diff --git a/board/xilinx/patches/uboot/uboot.hash 
> b/board/xilinx/patches/uboot/uboot.hash
> index a5ab9fae05..1fb12d1a11 100644
> --- a/board/xilinx/patches/uboot/uboot.hash
> +++ b/board/xilinx/patches/uboot/uboot.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  
> 58e391a001d9d8ed347ab3258ff7c8435c866b1ff2b2c22ebc95af592444c0f5  
> xlnx_rebase_v2024.01_2024.1.tar.gz
> +sha256  
> f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  
> xlnx_rebase_v2024.01_2024.2.tar.gz
> --
> 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
