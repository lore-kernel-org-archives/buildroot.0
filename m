Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2D9C54EBC
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 16:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C01740004;
	Thu, 12 Jan 2023 16:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C01740004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6swTic1PV3h; Thu, 12 Jan 2023 16:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C22BB400F6;
	Thu, 12 Jan 2023 16:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C22BB400F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB811BF3CE
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 16:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7934281DF9
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 16:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7934281DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0KPLbhIfNO6 for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 16:14:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1737981E0A
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1737981E0A
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 16:14:37 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ud5so46012744ejc.4
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 08:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9e4unr8OgLPtOHWJ/WmecCnZXTFK0oWFxQvJHp7X83s=;
 b=5JzoXvU5TgAjY07GdE1bO5izn+GhXQnokCpE62v9NH/xAka5pB7Ek4VfgZjpVPtYmH
 Ul4e6Rk/oQWHnHX903On0DdM+7MenmO2LtCU4go0eqzyqg738ITN7wVRzOs5BmVcom+I
 CcaKtWA+YYb1C+javNgdZo7EIASBQbXZ4TNCBa16/NAbVFlFRXDFdtjBC3IHfAvhPjER
 xMZ//I8t8MkCXRki05Is2boZx5+V8JLztFLGdLK+/BEr/Dlg21mAf5cm1bh+zW3ZbetF
 p5aQblcno/xh+CL0Vb78M6Rl6E2dl8na7ZDviTL4XVdIoJxa4Ty3zUlBw864uMDhXXx0
 q8ZA==
X-Gm-Message-State: AFqh2kp37qg4u0Z1AHvQo8GdsYpbJ8ZpbuCR16Hkg3erhduznbKlhqwo
 OYMgOTKHBqLOyzlbCbUd+dYaiJquMh01LNnY
X-Google-Smtp-Source: AMrXdXsTWi7CldIJWDbgi69aiE2Q6XzI4vgABI3zTWiKjKQMPaXWYfpiEE0POg8OVJEl0gYUcI3FbQ==
X-Received: by 2002:a17:907:c388:b0:849:e96f:51f4 with SMTP id
 tm8-20020a170907c38800b00849e96f51f4mr58200921ejc.23.1673540076233; 
 Thu, 12 Jan 2023 08:14:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b0084cc87c03ebsm7544091ejh.110.2023.01.12.08.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 08:14:35 -0800 (PST)
Message-ID: <ffe43fbb-135f-1657-80ee-c5cc61079948@mind.be>
Date: Thu, 12 Jan 2023 17:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Nicolas Carrier <Nicolas.Carrier@orolia.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <e8d2f77866056eea5e9e928ce07952d7cf5ac124.camel@orolia.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <e8d2f77866056eea5e9e928ce07952d7cf5ac124.camel@orolia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9e4unr8OgLPtOHWJ/WmecCnZXTFK0oWFxQvJHp7X83s=;
 b=NgTHX/tuIwfmeWNdnTiSPGFcGGGnLbXqxqCLl9bN1s84yBdHYfVtztibukjxit1KYm
 3hmsOM/mkBCXRiJGZRYuUCTwZDK259TtdMdybhHoqgOE/xXD/mr152/HHw5bMtV/K6Om
 CTsYjiX+YJcKm5UzeHImmjuSJ4j+htnywRLzB34UP48A+NY4ePcnE+kM/ZiJHEGYRy2f
 lwZFdUX0pbIKLlZOjBMIGzjEFjzaPQBcCywDhzh+bNKgWcjMh/BvO752sCfRsCigrGxv
 CUHStk0nYoUsBuasH10VB1rjyW8eHVWicTuBIs57hD4TRWbSIlcJqI0T2nJqU2vSZl8Y
 tIkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NgTHX/tu
Subject: Re: [Buildroot] Saving
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/01/2023 16:46, Nicolas Carrier wrote:
> Hello!
> I'm having a look at legal-info generation, the source saving step saves neither local nor override
> packages.
> 
> This is a problem, because it's those packages, when forked from OSS, which would require publishing
> the modified sources.
> Is there a technical / philosophical / whatever reason for no supporting them?

  I think the reason is purely technical: for these packages, we don't have a 
tarball available that can be readily used. Sine we now have post_process_repack 
in support/download/helpers, it's actually fairly easy to add this feature.

  A secondary reason is that the idea for "local" packages was that they're 
probably proprietary. However, in reality there isn't too much correlation 
between download method and proprietary. And we anyway have FOO_REDISTRIBUTE to 
handle this.

  Regards,
  Arnout


> If none, I'd be willing to develop support for that, if anyone has pointers as how to proceed /
> where to patch / mistakes to avoid, don't hesitate to share :)
> 
> FTR, I'm using a (lightweight) fork of 2022.02.
> 
> Thank you by advance!
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
