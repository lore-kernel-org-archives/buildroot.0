Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0210FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC3F406A3;
	Tue,  5 May 2026 19:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6Sk5KO5OxjI; Tue,  5 May 2026 19:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28E5640B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010308;
	bh=cPIhCr5Bd9DtHn/zB1h+V/OH/bFflihfyZTRuh67/2Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qz6a61fAaE+dQB/nydOgxymSoHgHPgUTDbJ7TnUH/kBuhYuMn9Gerlo5not7t2M2C
	 QPotdUHJ2HGfiagRNGtDF0NmEALm6ZNgMXE469u/TdOiCymOuFsQs59b/DyobdBETm
	 v8gCYjh9IIT012p1F7tH2BSHSvHcqXpx5wC+rFs/kgIbprRX3UuGI9b3Qy6Aut61g3
	 BRwupSqbBP24QDk7LR0h3g2GLw3hvF7wBn9ctQBO4PAtsEBfEMGZo7Ke9PcikY09wU
	 2odtDXF+eiSNtHUizj0Spr08pSxg1B3REsq9FApkOOQSsVzQW7iKmaGDUyZE/tz+Bl
	 yy9aZ8DKH39Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E5640B9A;
	Tue,  5 May 2026 19:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2125C2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 132A460B04
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSn-zqXea4tw for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:45:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF36D60B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF36D60B01
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF36D60B01
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:45:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BEA4CB97C2AA; Tue,  5 May 2026 21:45:03 +0200 (CEST)
Message-ID: <e6facbfa-f762-4da5-817a-d94ee1d9ecea@rnout.be>
Date: Tue, 5 May 2026 21:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <20260426153334.1026982-4-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426153334.1026982-4-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778010303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GEOiR4yqn4O9WxPPLW4rZ71vwIAFwbAcxa1vSxTLjzY=;
 b=PnQzP5gaH2SUmPj+gJbKZXUL+9J1H9DbBYZ0axoGwrueaDmYbeeyYYZOnUz702Er/fsM/o
 hAHs6kNIAZZyX0d2TF7QrUWTJ83lx5JlyJU5jatw7W1l200l76bMVmMqoIMJh2cWrAsc06
 /LYpcxAnuAi71BEMoQozt7HXdPNdWjCPXE8YJeMMuRsMLuDpc9/KKdMTgP9YYyyPqZYqF7
 x4P9EuIWirfYC/MplRYO4pcPlH+DWk86dGAKUqnqo/0MkEk2sax3KpZhLyd77uV82L5zv3
 M4fNLcQtwBDYx+/OiaXbL9vrNgKw06zjvC/8IDEE6qpmvU+3P7UJEGam6L0MQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PnQzP5ga
Subject: Re: [Buildroot] [PATCH v2 3/6] linux/Config.in: add kernel.org URL
 as BR2_LINUX_KERNEL_LATEST_VERSION help
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



On 26/04/2026 17:33, Fiona Klute via buildroot wrote:
> This makes it the first URL in the file, so it shows up correctly in
> pkg-stats output.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
>   linux/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 8633ddbc82..1104902b4b 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -33,6 +33,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
>   	# mips always generates an ITB image
>   	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>   	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	help
> +	  https://www.kernel.org/

  I don't see any reason to put it here rather than in the top-level option 
BR2_LINUX_KERNEL. So I did change that and put it there (and stripped most of 
the commit message).

  Regards,
  Arnout

>   
>   config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	bool "Latest CIP SLTS version (5.10.246-cip66)"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
