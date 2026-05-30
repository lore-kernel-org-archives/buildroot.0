Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEBECD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E026F55F;
	Sat, 30 May 2026 12:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAA_FmzNeObO; Sat, 30 May 2026 12:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA31A6F544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780144873;
	bh=P2h+Vzx2zljjxqri0hdlcmf9T1MnX/T7FLjp7hOJuz0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=IwWA6oBiQupK2x+Flw1fCj6hFbpIUaUS7OXmn74U+pDMYqlHMnIizq3YAT/0cZCxe
	 JUhqLJ8lOOPkCzmT0/hV/vEk1HvC8X160dzQrDfG+VjjouX7YjxLwpSaVh+ix+NB0k
	 8F99djH2huQXU4E13I4jyBwJpKkjB7XEinCpppqh11xpTxMlnk1sP3nZ/+b21qyP32
	 LcOyf+RI1WXc6t8AxdQ3g/o5RXQCO8wCbC73VZIfOCm4B+++lok0ZRoLVEzP7gpTmO
	 mcjyDfThC9bKvYTf9Ft+/Y4a4d7FEMg2erITdWthWy8CdMEOJjkZSV1U32NDJomOdM
	 RndyQyNXxKdHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA31A6F544;
	Sat, 30 May 2026 12:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E952FD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E7A6F544
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKyiRKlV-GL3 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E41156F4F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E41156F4F4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E41156F4F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:41:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4BBA8B97C71F; Sat, 30 May 2026 12:33:57 +0200 (CEST)
Message-ID: <cdc1a27c-15d9-4e1e-8fb2-6aa37ce1bd0e@rnout.be>
Date: Sat, 30 May 2026 12:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260503144908.2807535-1-bernd@kuhls.net>
 <20260503144908.2807535-3-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260503144908.2807535-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780137237; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gCxVY/lGLp7zpOf3gVdaTFtujEZFaWBF2BxPAJvQoAc=;
 b=JqrH5EgPwwUkzGeVAcZqs8H4+ipo2qwenFF2z5kNTS7JYEGW0bM9BtSvAF0w9dkUEj3Rc8
 I6mN5GkNGlCa60yNzvHJ5lFApfOZYQnQlubw/x7jpiVGLn5S9IqzMS9WfHjjN3F2VnIPUc
 LaNS/+pJ/qY4ESDGQKwzudLODUFlcDGJ4c9JBU6+LAjh8xEMyaktZSkSFSpacw4Y70ujdT
 YVmLIFQQgtU5XyVKNvmCDjIvXS2itsdom/x97T2BGzxPJk8gR8tkAdvZ/44m9m3uBxTwgP
 a+o5pVSC8BniHpHrs5TTstGhpQ/HP2ZPlfDTtvvcZEsroA4/z/ycVWbnCIv6kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JqrH5EgP
Subject: Re: [Buildroot] [PATCH 3/4] package/gdb: change the default to GDB
 16.x
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



On 03/05/2026 16:49, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gdb/Config.in.host | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index a2caa3d58a..fe639a4019 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
>   
>   choice
>   	prompt "GDB debugger Version"
> -	default BR2_GDB_VERSION_15 if !BR2_arc
> +	default BR2_GDB_VERSION_16 if !BR2_arc
>   	default BR2_GDB_VERSION_ARC if BR2_arc
>   	help
>   	  Select the version of gdb you wish to use.
> @@ -78,7 +78,7 @@ config BR2_GDB_VERSION
>   	string
>   	default "arc-2024.12-release-gdb" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
>   	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
> -	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
> -	default "16.3"	   if BR2_GDB_VERSION_16
> +	default "15.2"	   if BR2_GDB_VERSION_15
> +	default "16.3"	   if BR2_GDB_VERSION_16 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
>   	default "17.1"	   if BR2_GDB_VERSION_17
>   	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
