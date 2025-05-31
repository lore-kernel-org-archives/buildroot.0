Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA78AC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A593540B26;
	Sat, 31 May 2025 16:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RrA9j42dVWO; Sat, 31 May 2025 16:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBC4E40AFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBC4E40AFB;
	Sat, 31 May 2025 16:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D9D3127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F13881F48
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZXTossgdodH for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:44:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9409680EB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9409680EB3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9409680EB3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:44:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9EB921C0D7C; Sat, 31 May 2025 18:44:35 +0200 (CEST)
Message-ID: <422384be-ca5c-455c-a2e7-be201ae7c176@rnout.be>
Date: Sat, 31 May 2025 18:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
References: <20250512170255.1526135-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512170255.1526135-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UNa9MyflpL6rBa+EKht6zSl4t4yKbtInni1mXogm/z0=;
 b=eXPU+XPaWlqIwXFF0qXOW0MZ4FK1zOowBoJj/etnRrFbkhPZfqhGk5yB27Ohu3eJtq3ni6
 eKceTGXxCY7xFVGSeVBtemG3tQYIQDIBe4LGeZEcHzSrBNGLPb4+YcqicY9DFFHPYgdsq2
 YNkbcYfRvTyrQPsyi9EU4x+nAXzi2U6XF+Oejo+bUHl+V9Xiv1UBc+D9lwbzZh5FsCybyd
 v3nqG4fXhPRcPW58Gds0KBjJxoAjDUQo7X+66esevBkziyvpGldU8Gq0GGpx7CDo4o4BmW
 JPllSJ7rmW5ZxsIB0vMxL6OmNJ2r+fkNr111kglWVXoShrTY7ssZi8yQbVNm4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eXPU+XPa
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx6ulz-bsh-smm-m2: flash
 U-Boot
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



On 12/05/2025 19:02, Dario Binacchi wrote:
> Fix the board flashing by adding the bootloader, which I had mistakenly
> forgotten to include in the script.
> 
> Fixes: 322e8d845196 ("configs/imx6ulz_bsh_smm_m2_defconfig: new defconfig")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst | 2 ++
>   configs/imx6ulz_bsh_smm_m2_defconfig       | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
> index 7c5a884d65c8..bf3866e414b8 100644
> --- a/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
> +++ b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
> @@ -25,6 +25,8 @@ SDPV: jump
>   
>   FB: ucmd setenv fastboot_buffer ${loadaddr}
>   FB[-t 60000]: ucmd nand erase.chip
> +FB: download -f _image
> +FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}
>   FB[-t 60000]: ucmd ubi part rootfs
>   FB[-t 60000]: ucmd ubi create root -
>   FB: download -f _filesystem
> diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
> index 2169ab446581..ffb0c691fd33 100644
> --- a/configs/imx6ulz_bsh_smm_m2_defconfig
> +++ b/configs/imx6ulz_bsh_smm_m2_defconfig
> @@ -42,3 +42,4 @@ BR2_PACKAGE_HOST_E2FSPROGS=y
>   BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UUU=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
