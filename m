Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA83D75E5D
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 18:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52DF613CA;
	Sat, 23 Nov 2024 18:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hH17tlGnbh8f; Sat, 23 Nov 2024 18:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEEA2613C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEEA2613C4;
	Sat, 23 Nov 2024 18:02:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5635A1D93
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F4581179
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3ONl5vtrnKr for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 18:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F43B84AD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F43B84AD6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F43B84AD6
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:02:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4906760128;
 Sat, 23 Nov 2024 19:02:41 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60974])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Nov 2024 19:02:41 +0100
MIME-Version: 1.0
Date: Sat, 23 Nov 2024 19:02:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20241123111150.2124027-1-neal.frager@amd.com>
References: <20241123111150.2124027-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <40603de53cd91122083a8e7a198a6048@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732384970;
 bh=UJXjG26LHXoHSZNOhsc6ehyTB5uG5winS0CLfmpBHdw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s9eCCbz7hGGBfFphyMPBwP8EssMmGJYgblp7BxM1wGsO1mJ8uIUbEH4K+PEIammbM
 dttp7M6ylN2YC0MB3xdPVYEhAZ6jstGuW+YQJgQ+fDLhlfULvP2xZ5DXDnAOe3DcnA
 Ax0xKix54tJU9qS6OyG+CWI0E7SkQYWozPg+hsUrcINf68zCIl3HhwKkEB6WMtHT1L
 GVubFUkJoPA4nDHt4WMwPtAvN6J3MfJCVn95KqqJNF1YK5QsgRbtKKMr7IV2bonJI0
 hKaOwRdDZPZ0cTF9iRTNM5lOoZJtRkp9/6o2H0X+/eI1rz+8K6itYGuLRNwGdVl5/6
 BQjvXOKIhoHVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=s9eCCbz7
Subject: Re: [Buildroot] [PATCH v1 1/6] board/xilinx/patches: add
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/11/2024 12:11, Neal Frager wrote:
> Add remaining hashes for xilinx_v2024.2 release for zynqmp and versal 
> boards.
> 
> xilinx_v2024.2 release includes:
>  - atf 2.10
>  - linux 6.6.40
>  - uboot 2024.01
>  - xilinx-prebuilt xilinx_v2024.2
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks!

> ---
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 1 +
>  board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git 
> a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash 
> b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> index e300398541..2ef3a98196 100644
> --- 
> a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ 
> b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  
> c3369c89eab4e452bbc76c630e5dccb6c0ae588c0175b6c8549aa0241deb06ef  
> xlnx_rebase_v2.10_2024.1.tar.gz
> +sha256  
> a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  
> xlnx_rebase_v2.10_2024.2.tar.gz
> diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash 
> b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> index c955cd79f5..3bd33a29a0 100644
> --- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> +++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  
> 7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  
> xilinx-prebuilt-xilinx_v2024.1.tar.gz
> +sha256  
> ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  
> xilinx-prebuilt-xilinx_v2024.2.tar.gz
> --
> 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
