Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41703CA0FFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 07:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E94C7606CC;
	Sat, 30 Aug 2025 07:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVyrAJbzgTAu; Sat, 30 Aug 2025 07:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC5A60672
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC5A60672;
	Sat, 30 Aug 2025 07:16:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36C4AD2
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D500402EE
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEIlHyxwLsE3 for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 07:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C0DE402ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0DE402ED
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C0DE402ED
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:16:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ce4ed7a73fso1346035f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 00:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756538207; x=1757143007;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KFSDhKFTjUxPFFr635Ic7hh8RrBi/jdqStEYlOLRDK4=;
 b=okWyPf5+xtjHOQJZ7m/k4+Dnja3BPlSP6CLbG4xXuamf+zIREqfCgqIZaXiEqsxbNj
 nbEXwaM4RiVx2HwTf6GErdEBqWHyb/1pObKV5D0XM1Oag57y9lag9m1XFnG6aWzPlEoS
 l13EwJm96lPE+bB533xUBckwqiaEOJVxE+Rqq6JTfSfM3yAx3+3D9CKobobAZmn6RFlT
 tiiO4mxcjO99Nk1wQzuchjBC9egd+kNoRlscGcGZhfTOV1jzn/8JuNMtVd+byGZZIean
 QdcE3bZyxlIG+jf/IX/+jsxCZ7YoPFcgx8fQR269WXMeiuOT+klMNpyzpgffp7XIg6WJ
 2Z+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsxd1b+Wpewz0DG2YMvDou7U9WbGzeuCuJ0v12ZpqPNzapCaBLU6jkzLOzcNqLvxquL3KX9wXroiM=@buildroot.org
X-Gm-Message-State: AOJu0YwS21m4HKnf6csFwW31uYUfjo+1HctQAdU1XcUORF+dT49oeqaB
 EwLibIv8sz+AREY9+M83Qm+Hju2ZbkU/EBVhqggWC8Aa1SCalhxjvOMz28kuyoYRC2w=
X-Gm-Gg: ASbGncsit5FnJ9sq0/57UlarMAMMyqh7bDsgvqbWtevaDDmcObX75hRx/mCLOyLp0Vv
 hsSVh6HPFM+Gf6jsWHETf4IRt1Lw/8sMUlYmDTxMPA+8irrnaLq5JUKoF1oqqRJKfuDbiDqLz0G
 gSyp7d4K2/KEJtnlbFKKIK/QJ++OJiWGKeOBOskKGEWh1VWxMQbcYBvLBAlcic31MAUfjIpOf9A
 qSKxZUGp6hLT7KjSqunY1YFVIxzpkPmC1Tw+bI0WF+qRyjcxZ3FNB7x34j9/fg84cOBJ8N/AvtZ
 OJbGS0P7hwPKBC5G0OSbQYmvogwaLygkmr7LSC4Y8gM42zj5SvXBLOJYu9GHb7GoRBoocLLbi+P
 n875jQ4Hd1S+yf8bNHOIIGGiAkDfAmeKZNIGiv9A=
X-Google-Smtp-Source: AGHT+IETYDSuvf4p3ieyvrpX+DC44ivxasG/EDBcAdQitwUYj/Sld9EZiXM2La5AtA+lYegJNfPZNw==
X-Received: by 2002:a5d:5f84:0:b0:3b7:8268:8335 with SMTP id
 ffacd0b85a97d-3d1e01d1ea1mr730456f8f.42.1756538206716; 
 Sat, 30 Aug 2025 00:16:46 -0700 (PDT)
Received: from [192.168.4.20] ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7d141esm70561485e9.2.2025.08.30.00.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Aug 2025 00:16:46 -0700 (PDT)
Message-ID: <bc3e6066-7c2e-483f-8ee3-468fea4586b9@mind.be>
Date: Sat, 30 Aug 2025 09:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
References: <20250709211636.846101-1-thomas.petazzoni@bootlin.com>
 <20250710081059.482390-1-thomas.perale@mind.be>
 <20250829235511.1fd98d89@windsurf> <20250829235943.11bb6d76@windsurf>
Content-Language: en-US
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250829235943.11bb6d76@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756538207; x=1757143007; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KFSDhKFTjUxPFFr635Ic7hh8RrBi/jdqStEYlOLRDK4=;
 b=HKxMQB+G533qZt8JTk4zUd0k6h9jiW5GWUo+Jmgpcx16zYlnx2Apq+HJkx2BcQuWQ/
 iNeixlcs/wLhK9xG3SYcHI0if0pUk65LwYV5HtWZDQntJenk/ZF//CdvKVYcGH/vY/01
 9jGjyJRYvW6AVsrZREh5yK9D2wLotmxUV/4is8ei9I4Z6hhCNXwzNFqcvzm+hZcXqdN6
 l0jew121aTiAdMOu61TXtk2d3OUlXiXwot9jDVhaweBhBs16xDv+b1whd9BZ8cDkFzOU
 TjZZ2nJLv8jFoPkSssRVKHaCNvwGWeIEusm/LqUeQwKxsfucRsw9peDTUN5y8udRlMIe
 NNwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HKxMQB+G
Subject: Re: [Buildroot] [PATCH] package/bctoolbox: disable mbedtls support
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Agree.

I'm adding Fabrice Fontaine in CC to the thread as a last hope. He's 
listed in the DEVELOPERS entry for 'belr' and 'belle-sip' which depends 
on bctoolbox.

PERALE Thomas

On 8/29/25 11:59 PM, Thomas Petazzoni wrote:
> On Fri, 29 Aug 2025 23:55:11 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
>> Nobody stepped up to fix this issue, so I suggest that we apply my
>> patch disabling MbedTLS support in bctoolbox for the time being. If
>> someone, one day, needs MbedTLS support in bctoolbox, that someone can
>> always fix it up.
> One gotcha though is that crypto support in bctoolbox is needed for
> belle-sip, which in turn is needed for linphone.
>
> But oh well, if nobody maintains this stuff, we could also just drop
> it. None of bctoolbox, linphone or belle-sip have a maintainer
> according to our DEVELOPERS file.
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
