Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D15D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269DE616E4;
	Thu, 27 Nov 2025 19:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwcVjaCZbReV; Thu, 27 Nov 2025 19:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801F3608E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 801F3608E9;
	Thu, 27 Nov 2025 19:57:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29C95708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B7A640420
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmHIvXcba_ep for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:57:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 090EB4023A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 090EB4023A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 090EB4023A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:57:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1D42B979CA9; Thu, 27 Nov 2025 20:57:01 +0100 (CET)
Message-ID: <736a4a19-3b1b-4d13-952c-bdb725c92401@rnout.be>
Date: Thu, 27 Nov 2025 20:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>
References: <20251112110644.4054902-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251112110644.4054902-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1JMr4ucE1LoR+w7znmeObXVwOR2iV1nNaUxiZxHXbVQ=;
 b=dwGEwwGJjHA+rEQZDThIDFJFawSxiV3lIFL70v0ilfxZazuFjJYLmBHWm4TcWlGWw8AnN9
 MIVNgu/MVIDzeeveF6HM+bTx4co2NFYiHPPMpwe7OH7owbmNso8a3cknIuiWTGpJUExM1I
 OQDFXvnmYaUT174xqrW/k+BJa9PDLX/gtbMEWNjX8PeoQsvEtZIwAiyv1szfgXKADXpFwz
 Cz5cTcZ60WnuRXsHHD59TVIuZg3RaqgCJG93eMprXx5Cw2/ax3ZTb7LvljjPS8KZUteEwe
 Y+uyWWV9BbtWcQTHzv00SN8Fvkrzw+VgR132iHMU0FblP8Z88jeuOAJHv9n7Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dwGEwwGJ
Subject: Re: [Buildroot] [PATCH 1/3] package/psplash: drop 'default n' for
 fullscreen mode
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



On 12/11/2025 12:06, Peter Korsgaard wrote:
> Commit a028f0a51de0ed ("package/psplash: add support for fullscreen config
> option") added a 'default n' line to Config.in, but booleans default to 'n',
> so we typically do not add such redundant lines.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/psplash/Config.in | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> index ca39cd0ee3..118801e8ef 100644
> --- a/package/psplash/Config.in
> +++ b/package/psplash/Config.in
> @@ -49,7 +49,6 @@ config BR2_PACKAGE_PSPLASH_STARTUP_MSG
>   
>   config BR2_PACKAGE_PSPLASH_FULL_SCREEN
>   	bool "use fullscreen mode"
> -	default n
>   	help
>   	  Enable displaying the psplash image in fullscreen mode.
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
