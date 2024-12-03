Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5946E74ACF
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CED3600B9;
	Tue,  3 Dec 2024 20:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yv5e-Uc6SKew; Tue,  3 Dec 2024 20:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4807F605EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4807F605EA;
	Tue,  3 Dec 2024 20:11:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE95236E
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286C340295
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Cg-CzRGo7FJ for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D630540296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D630540296
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D630540296
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:11:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 835962003DE;
 Tue,  3 Dec 2024 21:11:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52250])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 21:11:04 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 21:11:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
In-Reply-To: <20241202064842.3705597-1-neal.frager@amd.com>
References: <20241202064842.3705597-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <72d38922e8b03cf60ab30f94165eef45@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733256672;
 bh=1VlQOuV4l1c+QNv8be2QtHtKM2idgAJ/kugPvhFM28E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o97zcGWgssbP28kl/zfGHxh1dls1RVrvF1G4COzs/ZElWxjK9nD6dM8a0b7t4nBK9
 BiZuUEtJ7kqzHARKRUbJWV6RLZUtclUVBGyFGCfxv/2xoZ5GQtJU61VQ3vdrmWfRQG
 7/2eMtreFBxBvZdw4UW+cqrEqw9VuistUnPkH+SJVEmVkamCXzANz95Jykw4GHnIxV
 AfwgULeQIrsO+YstVzo1ILvVfn/d9yE+Oe9g4kjCRTEN2yd8BfThuuLMv63qM79eAh
 XDjZcnNXeYc1hjrHfExM123VCIVGFLtnBz+NG+G7lfKNdYT8v3J22BiYHSV3QpDuPg
 KcfY4BL393Eqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o97zcGWg
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/readme.txt: add
 usb start
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

On 02/12/2024 07:48, Neal Frager via buildroot wrote:
> When halting the boot process in u-boot, the 'usb start' command does 
> not
> automatically run.  Since the SD card is connected over a USB to SD 
> card
> bridge on the kd240 and kr260 boards, the readme.txt instructions 
> should
> document that the 'usb start' command needs to be manually enterred 
> when
> following the reflashing instructions.  Otherwise, the command to read 
> the
> boot.bin and u-boot.itb files from the SD card will fail.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.

> ---
>  board/zynqmp/kria/readme.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/zynqmp/kria/readme.txt 
> b/board/zynqmp/kria/readme.txt
> index ca3164383a..7d3a520fde 100644
> --- a/board/zynqmp/kria/readme.txt
> +++ b/board/zynqmp/kria/readme.txt
> @@ -101,12 +101,14 @@ Flashing boot.bin:
> 
>  KD240 / KR260 Flashing Instructions:
>  Flashing u-boot.itb:
> +    $ usb start
>      $ sf probe
>      $ fatload usb 0 0x1000000 u-boot.itb
>      $ sf erase 0x280000 +$filesize
>      $ sf write 0x1000000 0x280000 $filesize
> 
>  Flashing boot.bin:
> +    $ usb start
>      $ sf probe
>      $ fatload usb 0 0x1000000 boot.bin
>      $ sf erase 0x200000 +$filesize
> --
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
