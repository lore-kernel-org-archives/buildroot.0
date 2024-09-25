Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DD2CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3115E607C8;
	Wed, 25 Sep 2024 18:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTHFPw2XMwHH; Wed, 25 Sep 2024 18:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 563DA611C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563DA611C9;
	Wed, 25 Sep 2024 18:53:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC9C1BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D7C084ACA
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfopLd3tXX4k for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:53:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3036C84AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3036C84AC8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3036C84AC8
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:53:43 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so1016285e9.3
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 11:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727290421; x=1727895221;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6T6CUbp+8WA8XakfeAxLKIdVcgauDOzsCTqY7Ry2eo=;
 b=sG56wIBnazx6BiixTbohksZt0UKqf3JzQ1YjvCtzUzNycFFbFi7Tkzy46fJOWm4gHB
 6Ur2asrJonQqrT1Agp+UWRggR+jxvSofaVilOhGKXJ37hp+p0exC1t/iFGX1j9eFBT0m
 PCgf5SUoccAKashD7mH+pu/x9S4Ps5cgEhTIFgMMN27/Mv7BB61J8xcrKMTnHeTp/VGU
 H5uuJnV/SvHj3fi3parwPywJVwLaCqo4CMrTZQI0zKEET5rVeo9qbqWEfDLH+wVbVoI8
 BCylmKmFJ5xWCV2W9adyFSoqfFsrhj1CFkEvh8vTqUvZh9J9ujev/bQ+W6tRA430xchT
 TMvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdlsldmbms2g/sdwQIhztavfN3tyQ+JVisQS724xV/P9rR0xu5lBzljMVg6DDnMhKBH5fBslrojig=@buildroot.org
X-Gm-Message-State: AOJu0YyvQSKE8kY5PLjxJi6Esz9Ihzvq1CWVE1DW/XajPuqbJzQ01jkc
 UPMw2lTkPl0LT+a5neKuXKroD7oean/K99pB9/Rkz5zi3aWrFBVf/kkiqbzybAc=
X-Google-Smtp-Source: AGHT+IGgF+owWzPIGSANhLxRNbTm8zFpuxdgzP3flfH1jABNwqA3NkZMaqV7GYbbKrAAHumXx8xk+Q==
X-Received: by 2002:a05:600c:3b87:b0:42c:b9c7:f54b with SMTP id
 5b1f17b1804b1-42e96113bf7mr30263315e9.16.1727290421196; 
 Wed, 25 Sep 2024 11:53:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e9025c517sm49316445e9.0.2024.09.25.11.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 11:53:40 -0700 (PDT)
Message-ID: <5b231a63-4043-4446-97f5-97faf5546dfa@mind.be>
Date: Wed, 25 Sep 2024 20:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240924122406.1125261-1-peter@korsgaard.com>
 <20240924122406.1125261-21-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20240924122406.1125261-21-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727290421; x=1727895221; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y6T6CUbp+8WA8XakfeAxLKIdVcgauDOzsCTqY7Ry2eo=;
 b=SbSVzw0dOpKkD/aDQiHuII/mprC+bWbw5tKT/M6gpZvhDKtJdjRSiVq7rvTm7wu3sN
 mR5WD1aD9l9XAj2Wsfhpb7kfSuLIWszoggceHuuWL/viHlxeDYK+lddpi2i5iHc0VzFD
 MnNPqrGTKfGaEM890nufCdbaSCdqwKWgppvsAXD/NkfCUuOmsmVMN7tkxn19Y8Duo0wi
 YWr9JGfn8BZynI/s96TKm3gPa6Mp8mUovvQ3juPvY14IRFDoCGRQiYVfIrPmx6y1aV45
 0wBeBEZa8R5Oodo5XkqpubZKZ0pt50I0VxZpmcki1TZIeZ3vXChRiflQFETOSUZgor0W
 frhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SbSVzw0d
Subject: Re: [Buildroot] [PATCH 21/22] package/sysklogd: fix 'structured'
 typo in help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2024 14:24, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/sysklogd/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
> index c9b9fe8c35..1dffacb08e 100644
> --- a/package/sysklogd/Config.in
> +++ b/package/sysklogd/Config.in
> @@ -45,7 +45,7 @@ config BR2_PACKAGE_SYSKLOGD_LOGGER
>   
>   	  This version of logger is receommended for use with sysklogd.

  recommended

  Weird that your spellchecker didn't catch that one...

  Regards,
  Arnout

>   	  It makes use of the new syslogp() API for RFC5424 style logs,
> -	  e.g. MSGID, strucutred data (SD), etc.
> +	  e.g. MSGID, structured data (SD), etc.
>   
>   	  The BusyBox, or util-linux, logger tools can also be used, but
>   	  are limited to RFC3164 style messages.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
