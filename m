Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF4E7E0D5
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 19:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C3183BE1;
	Mon,  9 Feb 2026 19:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJms27XnPZX3; Mon,  9 Feb 2026 19:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B8683C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770665664;
	bh=1mr0jLTY1wrnUo4+NNDDRndP6SLwCbYwxPXMsmCYl0Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jBFrvnqTjdByuozvqRLLnBOLx/G2fBTynguZa9zjjpnyf4vDnbKsUNUf214Cwp2yd
	 LXOsl7dtQJQtvSdyYm0Pj9JN+sMgWEX01ewCoxJoOxLqZ6LsexM/6u7cpT5qfFm8me
	 WGiDI2MlfMEa8HG7IJn665FdKbZeMlAw0QdFZTzGeujDpj+MiMg7vUeBqRzQ0ouSIB
	 qB8FsNTZYXTCLpe+8O5s4G+I9waRkRGpyFGqznWd+/0nI5oWU4xcub7g9/oxyeEvGz
	 niqH4cM/lRdOp5Wsl+DvKcjMVki0l+VXOTeiJAadEIIgHq1F/Eb7M/piXrsGyYO9Be
	 jZRUARS9HUIJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B8683C09;
	Mon,  9 Feb 2026 19:34:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B4B8F2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FFFD40C3D
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntRDq6MXCfZi for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 19:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7BC440C35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BC440C35
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7BC440C35
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 19:34:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.102.203]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1wDDlb3Gws-00JUkp; Mon, 09
 Feb 2026 20:34:17 +0100
Message-ID: <4e168b26-d3fb-472c-ae49-fa6adcc29691@gmx.de>
Date: Mon, 9 Feb 2026 20:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260209191737.69445-1-bernd@kuhls.net>
 <20260209191737.69445-2-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260209191737.69445-2-bernd@kuhls.net>
X-Provags-ID: V03:K1:kxqzWxgu4wGrCF/Nu1HYeF7LBCxT54yFGxIPAWitPov3WiBu0bB
 QH2LZW1BXRhOMxjovxODN/FjyM/jsqY/KFryVVvYw601wHBN3iKe/DgTspniZPjtxHX3HGW
 ycigHcvWbNH4olXQOOxpQ4jkkzhnt3NMVTzKNC5u6AXj8Bwsd89ztq0LAFRT0CbnyPzLKZk
 T0usQD441hclFNLai+r7A==
UI-OutboundReport: notjunk:1;M01:P0:59bdh/nIzY8=;JTfORSZyiIofrIOEWa4qJqm50Dm
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1770665658; x=1771270458; i=fiona.klute@gmx.de;
 bh=foEqWT6T/pgqpPsynqS8KmYt2H8mus9tpo340D3omUY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Uuz/atP1K1WkCef2MQxokZ3G2XM0i5BVVhyhAVgIPzAHdJQafJsO5TiTPIT2y0E6
 HpdKE4J4izwt629yObIvEbxzHzc5P2gMkqiviGnvAQoVp9MV2WQFBpNASOnhO1moC
 lU7hzlCR3xGWZlkGmS5XY+QHi7s86XB1JMrx8a6z5qJIAH15paJIVdLDQka9hHFQF
 I3PsevC1RAyz+mnHgOf+5DO8ZYxFp4N/uKReIm9G5sY3y0BNS5BdpvAJ2IGQvu2ee
 lptC80uXHmaXZX3qe7UQd8L27k8sBrD9mZp9qDVpcBr64H4nBFqMaGY5HJZEfN/Cy
 rjPjMLaeXwa6GickEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Uuz/atP1
Subject: Re: [Buildroot] [PATCH 2/2] linux: bump latest version to 6.19
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

this patch is missing an update to the versioned linux/ hash dir 
symlink. "git mv linux/6.18.9 linux/6.19" fixes it (assuming the 6.18.9 
symlink isn't needed any more).

Thank you for taking care of the kernel updates! :-)

Best regards,
Fiona

Am 09.02.26 um 20:17 schrieb Bernd Kuhls:
> For an overview of changes in 6.19, see:
> https://kernelnewbies.org/Linux_6.19
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   linux/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 48e5fc57ab..b4bb1263d0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -28,8 +28,8 @@ choice
>   	prompt "Kernel version"
>   
>   config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "Latest version (6.18)"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18 if BR2_KERNEL_HEADERS_AS_KERNEL
> +	bool "Latest version (6.19)"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19 if BR2_KERNEL_HEADERS_AS_KERNEL
>   	# mips always generates an ITB image
>   	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>   	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> @@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "6.18.9" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.19" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
