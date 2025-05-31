Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CDBC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB0681328;
	Tue,  3 Jun 2025 06:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_74NT4wsXx7; Tue,  3 Jun 2025 06:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2061812BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2061812BA;
	Tue,  3 Jun 2025 06:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EFD2255
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3960D8128D
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueugHBXt0ZIo for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88A0C81281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A0C81281
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88A0C81281
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 498651C1413; Tue,  3 Jun 2025 08:21:58 +0200 (CEST)
Message-ID: <d2c9fc73-c70d-4610-bd19-221c07a10a7f@rnout.be>
Date: Sat, 31 May 2025 18:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
References: <20250515154504.929058-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515154504.929058-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4F26vG5WQal9qhtCxoGl7013FyNgQlsZzYHGk1VabsM=;
 b=LZpU/ya16vwJO77bVsuGDMMSMLU5MpPFRQ+lLSKl3RZoLkcA40m0ob9mzwyemcGBXZkLUO
 XUJiWFbeNdgcoZqyEnMeB70aRZX2qceSsCxMHRtPI1fw7BsQL6RDwPHVRgSxTBIfgEC5Yr
 lKR9bMky5VTc/s7Nswbs/02D8+va0QVV8Lr1xIeUrYXXZcquJwq9ogh5Mm1LLaPy1Hw9F9
 AeYYaJ7DHM2Az+u5arJTfg+awH9omQ8n6ck+D9ntdILQ3Nk2SDqmsuiLkDbVewkXz1Hvur
 HJnQbCWWFSdWtUJzH6aPJrkItJGuRK90fAely7fgCCfy+tOp2yzmRYjwZr+piw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=LZpU/ya1
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2: erase the
 entire NAND chip
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/05/2025 17:45, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> If an attempt is made to create a UBI volume and it already exists, the
> operation fails. Therefore, before requesting the creation of a UBI
> volume, we erase the entire NAND to ensure that no errors occur.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   board/bsh/imx8mn-bsh-smm-s2/nand-full.lst | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
> index c01d2d6c1dac..f5b94c24d83b 100644
> --- a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
> +++ b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
> @@ -10,6 +10,8 @@ SDPS: boot -f _flash.bin
>   
>   FB: ucmd setenv fastboot_buffer ${loadaddr}
>   FB: download -f _image
> +FB[-t 10000]: ucmd nand erase.chip
> +
>   # Burn image to nandfit partition if needed
>   FB: ucmd if env exists nandfit_part; then nand erase.part nandfit; nand write ${fastboot_buffer} nandfit ${filesize}; else true; fi;
>   FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
