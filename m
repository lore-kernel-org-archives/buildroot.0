Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C0C02188
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC0D40E37;
	Sun, 19 Jan 2025 13:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dk_bPfYHMEoV; Sun, 19 Jan 2025 13:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57CBA40E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57CBA40E46;
	Sun, 19 Jan 2025 13:16:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEEE3D2
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 13:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 989EF40E5A
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 13:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fInwc8kMl7sB for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 13:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BD8C40E37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD8C40E37
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BD8C40E37
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 13:16:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EBF7719F740;
 Sun, 19 Jan 2025 14:16:23 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48782])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 14:16:23 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 14:16:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250107111540.1548042-1-neal.frager@amd.com>
References: <20250107111540.1548042-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <51444d47c6d11c0e28f5cc634a4d8272@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737292591;
 bh=/iYIh+QXtapPPSkYM+jAqIlfCXvgtWok8EXek1fb5Bw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bYx7vDgM7Cz1lyqm53zqFZ8qjX6HPJ6lThrDKeGdloJFJ5e2rP9LEjbsWNS/sDVAA
 LR2TjHNWgAo/VqdmnRpx50x6CLbRdjjbXztjg/fTsFR9B/UD5x9tabDVe1GBj/NcZE
 1QTXNqe4TsSbWwHm3ypAWV3ZIYDoMAlVGx494Rhi7Yj0OIFNh8KhBdKJr8K8diRP/F
 90HHiny2ih9fr4qxzgtcHoWZxUlLsxdmuFeT2MkX5SHHQ6GEDzTlILSSddZZwt4ay2
 YrUee+vP8ZLBHLyVhICp8AS2yPIKF5TV01kBcGKx3qGOeUTuzklWKa8oj+u1YWVC1l
 x5k+dkKA0S5kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bYx7vDgM
Subject: Re: [Buildroot] [PATCH v1 1/4] boot/xilinx-embeddedsw: new boot
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

Hi Neal,

Thanks for the patches.

On 07/01/2025 12:15, Neal Frager wrote:
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

It generates few check-package errors. Running:

     utils/docker-run make check-package

Outputs:

     boot/xilinx-embeddedsw/Config.in:6: help text: <tab><2 spaces><62 
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
     boot/xilinx-embeddedsw/Config.in:7: help text: <tab><2 spaces><62 
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
     boot/xilinx-embeddedsw/Config.in:9: help text: <tab><2 spaces><62 
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
     boot/xilinx-embeddedsw/Config.in:10: help text: <tab><2 spaces><62 
chars> (https://nightly.buildroot.org/#writing-rules-config-in)
     boot/xilinx-embeddedsw/Config.in:12: line contains trailing 
whitespace
     boot/xilinx-embeddedsw/Config.in:35: line contains trailing 
whitespace
     boot/xilinx-embeddedsw/Config.in:45: line contains trailing 
whitespace
     boot/xilinx-embeddedsw/Config.in:55: line contains trailing 
whitespace
     boot/xilinx-embeddedsw/Config.in:62: line contains trailing 
whitespace
     boot/xilinx-prebuilt/Config.in:9: line contains trailing whitespace

Could you fix those errors, please?

> diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash 
> b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
> new file mode 100644
> index 0000000000..fe0f1388b7
> --- /dev/null
> +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> 550ba0b206848adb0085bc1ca5a6b6731681335c92912afb4a6a8dbb4c489a0c  
> xilinx-embeddedsw-xilinx_v2024.2.tar.gz

The hash for the license file is missing here. In a config enabling
the package, running:

     make xilinx-embeddedsw-legal-info

Fails with output:

     ERROR: No hash found for LICENSE

Could you add the license hash which is valid for the default version?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
