Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3788C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9835960EA6;
	Thu, 11 Jul 2024 10:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTGjpZBCA0He; Thu, 11 Jul 2024 10:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9752660FFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9752660FFE;
	Thu, 11 Jul 2024 10:21:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0AF1BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9664415A9
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcLsCPhXzUlH for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 939764155A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 939764155A
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 939764155A
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:21:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52e98087e32so801425e87.2
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 03:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720693279; x=1721298079;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rd47P4hUDNk3eP177R2GWYm3QAZQy2tqXbu98YSQj6w=;
 b=IYuXfw0Aqss/b2iZcu9OemgYjdeUWCrVmT/tnOf9L2Vtyh6UWsPN/XRblTHS6P9bH4
 lKWb1XHgzfS/vbDUlnqMOT/jrECDWDIia5gEE7xZVDw1Q1WalwEPwh/txvUYtnIUBkA4
 RYLtx9uVs6Jytc2d0TR4JL/e6xtQ8f9SL6pvLD/N8LXlwzVljXBw7vi5RsPQG0UHAj2t
 3QRVYaAAVj6TS2Sjifx8EZv6C2Do3ii7+cpvzE9RqiHpewogk8f3A+Nef3FI3AP3nhv+
 qZCoX+a+M8sInWD6RSC0GMnn6tYYpvLnfy7LK78zkYU7KuqNlp4iuXFo/BAofyGa8rry
 AuWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPesejLh6H8NtIfc7z3DjVCD6kxTnTjqkDGnW2/C+d9vmSzhrIf3SSXGjyQUfSbc2rUYezwt+Sfrc/XqXwDLNm6eh2HVRnZQ==
X-Gm-Message-State: AOJu0YwMWG8RpOURZnzUlrf9hcD2WRyNZDsNYxujm37+CQ+3joWYYDj4
 iLRdvBN4tTQ1fmPPJkv2Dw4UIzwKd5phZK2gygHAHEXZ/6f0S84OQCP8aMADTHfqs0ULqy2eBTt
 V
X-Google-Smtp-Source: AGHT+IE24mdeY4lfRkZwY9OQEod3KX3+LKSW/iOusludXQJGuj//2N2rC3vvNfYzLa09zMy3iEvXDA==
X-Received: by 2002:a05:6512:3d05:b0:52c:dc4a:fb14 with SMTP id
 2adb3069b0e04-52eb998e77emr5555813e87.14.1720693279045; 
 Thu, 11 Jul 2024 03:21:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5f25sm115417535e9.26.2024.07.11.03.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 03:21:18 -0700 (PDT)
Message-ID: <6178bded-a2a4-4ff5-ac58-011ee5929f19@mind.be>
Date: Thu, 11 Jul 2024 12:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240711070525.1406612-1-dario.binacchi@amarulasolutions.com>
 <20240711105200.292f5783@windsurf>
 <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
 <20240711120439.3c5eb010@windsurf>
Content-Language: en-GB
In-Reply-To: <20240711120439.3c5eb010@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720693279; x=1721298079; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rd47P4hUDNk3eP177R2GWYm3QAZQy2tqXbu98YSQj6w=;
 b=ENS2E49QWxifQtjPdyfzntMALA+02czC0AOtWVbfMLMjHteGnPU6wkCNFpTC/ao00v
 PGLR+gT5Z2ZHJvT3DWgoWPjNkblHqi1fEcMK+zmeudm/0UwGLG3iW/BlUJEt3h5guMc7
 FeQ60vUtUwJSnk/u76IUn9+L5vB4zaXmMDB4+Aj5QqlBmmsr+nZ6lqHd7QUhSkYDx78v
 obd+G+2ihazvGUzD6YbAsAXtfDGI3arWchDaP3g7P85WolzkZMGF0AnqJgkDOS/8INe/
 Nx2EVYiA5woQAzT5ZS9nR0pURg2GCAhQehh0huvdR0qdWka2DshWgzMOP02JE5Z0wlb+
 vOFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ENS2E49Q
Subject: Re: [Buildroot] [PATCH 1/1] package/sunxi-mali-utgard-driver: fix
 patch fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/2024 12:04, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> On Thu, 11 Jul 2024 11:51:11 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> Thanks for the patch, but I'm not entirely sure that's how we want to
>>> fix this issue. Indeed, apply-patches is used in quite a lot of
>>> packages to apply patches from Debian. Do we want to fix all those
>>> patches, like you did for the sunxi-mali-utgard-driver? I'm not sure.
>>
>>    AFAIK, Debian patches should apply without fuzz (unless we do stupid stuff
>> like applying our own patches first).
> 
> Is this "should" based on actual experimentation/validation, or just
> some general assumption?

  It is based on memory, from 10 years ago when I did something with Debian 
packaging, that patches are applied with fuzz 0. (Or at least, in most cases, 
when the packaging uses one of the standard packaging helpers.)


>>    I think this is the only case where we are downloading patches that have
>> incorrect fuzz - or did you encounter any other case, Dario?
>>
>>    And in this specific case, upstream is Giulio, so I expect that the PR will be
>> accepted soon and we can simply bump.
> 
> Ah, I didn't realize we had an active upstream for this package.
> Indeed, it means we will be able to drop our patch.
> 
>>    I agree, but only if we actually encounter a situation where this is the case.
>> Note that the implementation will not be super trivial (will require something
>> like FOO_APPLY_PATCHES_FUZZ).
> 
> Well, no, I was assuming $(APPLY_PATCHES) that is used in packages
> would default to accepting fuzz, and only the $(APPLY_PATCHES) call in
> our package infra, which applies our patches, would pass an option to
> disable fuzz.

  "Our" patches and Debian patches (i.e. stuff specified in FOO_PATCH) are 
applied in the same APPLY_PATCHES call at the moment I believe. So then it is 
only relevant for the 7 packages that have their own APPLY_PATCHES call, and of 
those sunxi-mali-utgard-driver is the only one that fails.

  Unless you want to make a case for allowing fuzz in custom patches e.g. for 
the kernel. But I don't actually think we want that (same problem as the thing 
that caused to fuzz to begin with).

  Also, apply-patches.sh currently doesn't have a way to specify fuzz.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
