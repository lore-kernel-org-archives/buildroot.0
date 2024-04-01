Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C33CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18C884052E;
	Mon,  1 Apr 2024 13:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6Wu0VnFQe-B; Mon,  1 Apr 2024 13:03:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3A44053D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE3A44053D;
	Mon,  1 Apr 2024 13:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12FC41BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F408480E5F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4gfShl9ZAAC for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:03:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1686680E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1686680E46
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1686680E46
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:03:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4156dfa8a75so939675e9.1
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 06:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711976622; x=1712581422;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvyT+OzHtBRG/3NA0prCbTyuf8QVRhmsW7z8WM7AbDk=;
 b=gXm7excFZrbjL3M7LzxdTW2FqMvGPObj0FQmZZ6V5Mwmm+RciunYUCkB4QDvrvj+7Y
 qwd9WuyLjQjv7S+i9Wjdi2x8Ye5eaiW0fK2LpG3YyGnIbmwmXv+4rOgRCEH6yufc76mW
 vUKe7y4mzMnMTE35kjwzEcLqplNaY67JduCOe3TJvUjUZQiyO1QFhKbjR6XHrPnM8T8n
 ZVFjg1l2DRG+SsjsTLmevM2znBOzZ+cn7jGlXfkoWaeyeghWea6R9qA+HWHdt/FXA0LU
 GVRElul3qkvAICwCs0sDWt/5LwDcy2gIyPhkhMgJfiPRCnBIC8VG5zluJcY02VYmOtm7
 DpPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqP2FdR7AurCuStpmM8+J/pqOMhXqNB4mauUWz7MygT9q9nqjzH69QkxQQkRA0djvMRYkbgw9zRclUSrBORVYMMz7k1XgQcQ==
X-Gm-Message-State: AOJu0Yx4vQ5ykvGXr+xgIZFi3C8t/xfVYyuplqnykFcNXOuuhPonIkiI
 He4Z31NIvACUfudJ3D3ABHsUeqe16Qfh5nRbTuthooXiFr5qmGpIcDt7HBwqRkzvUXqD73qZQOt
 T
X-Google-Smtp-Source: AGHT+IEwCtvqbVORV4OA7tiO1hYVUX31kq+fnbIxaZyuuoB2L+YbTT4JVElT+mSLDzTp7e6Ye6Om1w==
X-Received: by 2002:a05:600c:b44:b0:413:ee4a:c9a7 with SMTP id
 k4-20020a05600c0b4400b00413ee4ac9a7mr8741769wmr.20.1711976621467; 
 Mon, 01 Apr 2024 06:03:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cp32-20020a056000402000b00341c88ab493sm11660729wrb.10.2024.04.01.06.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 06:03:41 -0700 (PDT)
Message-ID: <e00353d3-683e-472e-822c-b6b5d612e6a8@mind.be>
Date: Mon, 1 Apr 2024 15:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240331203354.815139-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20240331203354.815139-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711976622; x=1712581422; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hvyT+OzHtBRG/3NA0prCbTyuf8QVRhmsW7z8WM7AbDk=;
 b=bcH1SqkmzPYEUiD0tmCvZxcEvFkE+Rgh7nLEKr1FZrIBQm93aOnGQVgoKd8iIBUxBh
 IIsJYqBMJ/6wRTa+I8uQS+V0EpkXQegGYFB8/6u/EDEYt81ySyZVryHT3G/TrwTjnWrw
 zf2HReDZMS11TkN5BXFAg4/S7ENRxtZyhbK6S1x8Z9+9oRkozyu4xpnfxG7a9EC80Hkt
 HPAqNR9t5al/SdDtB2sw41rUpaFJDA8f2f83M1SZ5UBUVMY0m8ueSINhN3vmYCoa3tYD
 G0ADvZsvl5Ajy5E0/Qa7ci5eNFEs4MEA4fdtTndPvZYnGeGigIpfYVHRZUpyD3LXtrh0
 qEmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bcH1Sqkm
Subject: Re: [Buildroot] [PATCH] utils/check-package: emit library name
 along with check function name
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2024 22:33, Yann E. MORIN wrote:
> Currently, when we generate .checkpackageignore, we store, for each
> error, only the name of the function that generated that error.
> 
> Although we currently do not have two check libs that have same-name
> check functions, there is nothing that would prevent that, and there
> is no reason why two unrelated libs could not implement checks with
> the same name.
> 
> If such a situation were to arise, we'd have no way, when parsing the
> ignore list (in-tree: .checkpackageignore), to know which of the libs
> the exclusion would apply to.
> 
> Fix that by storing both the library and function names together. The
> leading "checkpackagelib." (with the trailing dot, 16 chars) is removed
> for brevity, because it's present in all libs' names.
> 
> As a consequence, regenerate .checkpackageignore.
> 
> Note: people using that script to validate their br2-external trees will
> also have to regenerate their own exclusion list if they have one.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> 
> ---
> Note: for ease of review, .checkpackage has *not* been regenerated in
> this commit; I'll re-submit the patch after reviews, or comitters can
> decide to regenerate it when applying.
> 
> Note: for example, hypothetically, we could have a lib_hash (that checks
> .hash files) and lib_mk (that check .mk file) that both implement a
> CheckHash() function, the first to validate that hashes are of a valid
> form, the second to validate that a git hash (in _VERSION) does exist in
> the repository pointed to by _SITE.
> ---
>   utils/check-package | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index de41891b56..373bc63f52 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -224,7 +224,7 @@ def check_file_using_lib(fname):
>           print("{}: would run: {}".format(fname, functions_to_run))
>           return nwarnings, nlines
>   
> -    objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
> +    objects = [[f"{lib.__name__[16:]}::{c[0]}", c[1](fname, flags.manual_url)] for c in internal_functions]

  Bikeshedding time! I think, since this is Python, we shouldn't use the C++ 
convention of ::, but rather the Python convention of .

  Otherwise, you can add my Reviewed-by: Arnout Vandecappelle <arnout@mind.be>

  Regards,
  Arnout

>   
>       for name, cf in objects:
>           warn, fail = print_warnings(cf.before(), name in xfail)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
