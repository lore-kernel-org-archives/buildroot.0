Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5B4C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428A160BEB;
	Fri, 22 Jul 2022 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428A160BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LeCk7vMR_pX; Fri, 22 Jul 2022 21:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B5B960A72;
	Fri, 22 Jul 2022 21:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5B960A72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 923471BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B90E60A72
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B90E60A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyjOFuois4ja for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:05:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A5F60797
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0A5F60797
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:05:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v13so270841wru.12
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 14:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9o/BaK7wftLJB4/B0VOZVM9run46EGJbPX5ha7J6o18=;
 b=gh8zY32UbsMeZht7rT1dcr9PidlpQ5nHuEjkd6h4H8ynMUQHQYSHy9AlI8nVu+twk4
 heWRlVgdBJXTHbrwBzTWWjxmYa/QbIuPlDcigs9hKg06KbExfU6jZXhhHFKtSyvmoVFe
 XBRexXiyrD6hmswkavxq4c6mgYuIHvDK28XLLCIyBNcM5EDnQb8nLxoRFOBDzO/RRdcY
 JlOIYXrC+Yj0uhHDLvS8RLLsO57xE9F7B0FgKl/9yPxUKwd4A8QfqGk+M2ENXlLGjilb
 LVmEssUMDlXZgL4oskwE8hkxH+T+LKofRPakZNHFn24JKoVbMj6cnXq10EQF8cqrs08d
 IiYg==
X-Gm-Message-State: AJIora/1s9JL1AIcR7YRedqqiKUPZB+E1LgokXvPOo+bPFIPNPIs1aLJ
 YHwaSTP5mEjgjtA19SPr6owtIg==
X-Google-Smtp-Source: AGRyM1tlkMi29ZNkzeJUqTpQyZ8RqGx/FiZoGlbUKGiG0AwP8pMn0U6v8guq8bYJdD2NO1pJGIAExA==
X-Received: by 2002:a05:6000:178d:b0:21d:a3cc:54c8 with SMTP id
 e13-20020a056000178d00b0021da3cc54c8mr1031539wrg.602.1658523900044; 
 Fri, 22 Jul 2022 14:05:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff2d0000000b0021d4aca9d1esm6458368wrp.99.2022.07.22.14.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 14:04:59 -0700 (PDT)
Message-ID: <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
Date: Fri, 22 Jul 2022 23:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Barisani, Andrea" <andrea.barisani@withsecure.com>
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
 <20220720222430.7eb519f6@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220720222430.7eb519f6@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9o/BaK7wftLJB4/B0VOZVM9run46EGJbPX5ha7J6o18=;
 b=A1KBtwjXauoQmmxe90UQa29xM34bTk8yhBIqw84OZPdUy/pVk71S5w9iWT/PtZojun
 THQ/SgROvvxwPwO6PCxybpHT/PUAaH97LFCzucHoZYI9mB9zVtq8QfpAvNeBlYykEXnF
 qUHn5jtbGzGOdQekDW0/v8Ye4pZsihHh5PzwnD45pgcbFnpQpq3vBgB9G/EVTs6uXdQn
 n6iY45Ua5Rr+ChcUoPuFQYscP5kaSFSMWlYIOXFUrr9fwzKxYWUoazQxfNqMI0CZlV17
 /XOCzFTRUogtRBsRx4zb3shbAZTT46IjNJC0F8kXOBwjvXOu5dUNq5Ov6h8T9cigdJHD
 gwNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A1KBtwjX
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: Fabio Estevam <festevam@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/07/2022 22:24, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Wed, 20 Jul 2022 17:05:42 +0000
> "Barisani, Andrea" <andrea.barisani@withsecure.com> wrote:
> 
>> These flags are not crucible specific but they are necessary when
>> compiling static Go binaries with CGO enabled (which crucible does
>> not require by the way) to ensure portability as cgo versions of net
>> and os/users are not portable.
> 
> Thanks for your feedback, much appreciated!
> 
> So, I see we're passing CGO_ENABLED=1 (when thread support is

  AFAICS, CGO_ENABLED is only set in HOST_GO_MAKE_ENV, which is only used in the 
host-go build commands. So it's not really possible to set it per package. 
However, apparently it is possible to override it:

DOCKER_CLI_GO_ENV = CGO_ENABLED=no

the commit message that introduced that unfortunately doesn't explain why, I'm 
not even sure if it does anything.



  Regards,
  Arnout


> available) to all packages, and you're saying that this is incorrect as
> not all Go packages need CGO? Passing CGO_ENABLED=1/0 should be a
> per-package decision?
> 
> However, when CGO is enabled and we need static linking, passing
> osusergo and netgo tags is needed, correct?
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
