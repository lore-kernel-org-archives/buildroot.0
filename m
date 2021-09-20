Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32035C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:52:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F3C606A5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62F3C606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B8E840106;
	Mon, 20 Sep 2021 18:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIIl42gUxo-x; Mon, 20 Sep 2021 18:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46FA24012E;
	Mon, 20 Sep 2021 18:52:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63C231BF23C
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 513994045C
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlMIexNtHMaO for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 18:52:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56F3C4041B
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 18:52:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t6so64828756edi.9
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 11:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1dpTdxzhBPz3rms+LXuPAq7MQd7qxOxlRQZHO67oeIU=;
 b=PpQNc67DyEek4A4t5kdtan9ubmlYRD9xvyrNOpH4EJWYIQLob8CVtKKTs+K2HZO1uH
 OCSeE/KsLEtXyyGIJLcmLpP2CR/T/FUJjA9vnp/2ir4+8HxqVHU56NXAigztgZ9cl2y9
 XnbpRgJP9GhUaeYRug7X6ZXC9piJyZqN5CmhGwHoBC3zVDb1652X1TY2JTJ7FFxYMR/v
 VtCtVatS1SC8dFQlOI3PpLjLs0KgF+1tI/yHQR26zBjZDTfprizvli7/aIOxCEVyPa88
 CReg9weE47WKjPtO0g/8v0uI6g4uJOGY5495FraZueJ+hLoyW460i0KwiNDenW8JlQem
 ZWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1dpTdxzhBPz3rms+LXuPAq7MQd7qxOxlRQZHO67oeIU=;
 b=rDdd2FP/t78a+xEGj53rpmzFsLrGXxKciBEFMciRLVYRRxH/vyPvOdGS79BsR9sNFe
 w25eY+7zs3dcv2BGkrAEBk5B9FO9qXbl77WhoVJg8B6JnNRizD4cUDFROziO0+dwSxtK
 r7tSfTxOoajlzXASLWloTAtUx0RLwFwyUEvLc7QUpfBCCLBFmRI3df2E0e0M21G45pfX
 QuO7hwJRV5//ghrhqGsH2t0uc1nWIEWxSQOGW8B5t4MEPPTZJyDvurVmN27clhSz2UYe
 csdG5ZUD93AS6VRYLGrrQe52H8FBj3UCHn30rsdu9ZO52xxFou7TH7ijl9SUkMtwr7It
 yNKg==
X-Gm-Message-State: AOAM532t5tamGb5YHuqgW6eomIRSnMykYw1rlcLrzFaAqFsuPz4XlsF+
 LXXalysiGnGIwvdgN9IAEJaUaiknmtFYBQ==
X-Google-Smtp-Source: ABdhPJxZUJBLjPZIqDGL3E+Y4QGyNB/OoN1X50nW87C0b0AfTNjjpZCBP8MGfQnNgDXQmbU6IV4uLg==
X-Received: by 2002:a17:906:49d0:: with SMTP id
 w16mr29441696ejv.455.1632163950555; 
 Mon, 20 Sep 2021 11:52:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e21sm7336567edj.47.2021.09.20.11.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:52:30 -0700 (PDT)
Message-ID: <ad51da8c-2b94-3969-b26c-2d8b168d198b@mind.be>
Date: Mon, 20 Sep 2021 20:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
 <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
 <20210919150904.04051568@windsurf>
 <f8756bf0-c955-f301-299e-f5d8c0aabe04@mind.be>
 <20210920140127.1de86c50@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920140127.1de86c50@windsurf>
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 20/09/2021 14:01, Thomas Petazzoni wrote:
> On Mon, 20 Sep 2021 11:18:34 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>    Yeah, you get libgcc and libstdc++ from the gcc source. libstdc++ is probably
>> not used . libgcc may not be linked in either if -nostdlib is used (which it
>> probably is).
> 
> I think there's more than that, there is a c_nano library integrated in
> this toolchain. I'm not sure what it is, but the Cortex-M4 code we're
> building links against that library (I haven't investigated further for
> now).

  Obviously, I can't comment on some mysterious out-of-tree package you have...

  If that package (which I guess will eventually be upstreamed) links with 
anything that is part of the toolchain, that's still fine as long as there's no 
other package (i.e. ATF) links with it (and expects a different target 
architecture).

  However, if the intention is to use the toolchain for a Cortex-M and you need 
any of its libraries, it's probably a lot cleaner to simply have a separate 
arm-gnu-a-toolchain and arm-gnu-rm-toolchain. It's definitely a bit weird to 
have a package "arm-gnu-a-toolchain" that actually uses the -rm one...

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
