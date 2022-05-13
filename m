Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535968336D;
	Fri, 13 May 2022 20:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v50gdXARPyI9; Fri, 13 May 2022 20:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E4C83F84;
	Fri, 13 May 2022 20:26:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AFEC1BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 558D740494
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp2ruILeiTTG for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:26:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB7E400EA
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:26:07 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w24so11234773edx.3
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=83e3AqvvISSnFbKbjmfKIAb5KFxX9Uf6iB5I3BWqtsE=;
 b=bWhTVDJNCNqClloSmYgWvU3KjMkkNE3K9C465KJuy0gdWYHTJ+Jcpx7tuQCl5C7Mk2
 zbchx0eIMgKu/SatCAq6eux6PG77vE7tjXg9mJv3AOKDctTRZhqcYmYx9gTlbUKwZEl0
 2ca/5wAr/lM8zdJ1VmrefuiuqZqWBSi96DdSlSY1eGFKiWFyVgDxGz+DMtX42iScK/cb
 HpShizTDfSy0U9hydCPs3SB+zrrfaMX1iceFwjfRz9+cRIYqQptQ3v6qRVE7nvRcTWUF
 aM4qVt5gjj3NqUct55T60VNaSQbhyBh1gSWBIDLGCtGMiQ+HuJ/S6kQKxsTCDRhPfv4y
 sAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=83e3AqvvISSnFbKbjmfKIAb5KFxX9Uf6iB5I3BWqtsE=;
 b=lZWeXdaqd3LB3Qa5iBn8jVw8yc4jXyJzPt9PVEnMLLvAE3tBea3QjDWkNf8CqAVSkj
 KRoJwSRzD3LXZqXk+h93nleA0EZV7ULy4WPaXJKNZB55O+1pQRiV/XZhiu5X1s8jKJKH
 GAExv6GcXMunKlbU4luFcygBg5XCEC5j/mBYYHiuOIpgIy9W4k/grMSKz359EHKG3iHt
 wtqOCD7FvZUMtAaM/FGdbw+zz11cjEshV8ki8aioOfDU+G8E5XRA/9Z4Mc2N0dwIt6D8
 9evaWljao1OO0cK0je1IOOZh8dAF8cnV245nGpORXZ5NyUiwDMmCRNa4VbFerq7pOsBa
 5odg==
X-Gm-Message-State: AOAM5319pHC6fmcIz6wXCzWX+FYXrEcDw60g14gvomxbpg6x7GR5+WSp
 TZlJkw2z/TCOYtnqzWdj7m4TW1CBhCfXZQ==
X-Google-Smtp-Source: ABdhPJzFNzxbveVkYvUVeZWxyScfSgPzdnOWlYqJ0eo6SnVsvNrPHiN/A05R5HnRBofb8qU2BVh7/A==
X-Received: by 2002:aa7:d3ca:0:b0:427:b3b2:2d03 with SMTP id
 o10-20020aa7d3ca000000b00427b3b22d03mr398368edr.357.1652473565818; 
 Fri, 13 May 2022 13:26:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a17090629cb00b006f3ef214e7bsm1067172eje.225.2022.05.13.13.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:26:05 -0700 (PDT)
Message-ID: <2543a2cc-ba2a-21f0-4828-e5595e71f325@mind.be>
Date: Fri, 13 May 2022 22:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>
References: <8c2fc8d9-5bc7-1982-35ed-1fc31e1bb470@mind.be>
 <87bkw17l9r.fsf@tarshish>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87bkw17l9r.fsf@tarshish>
Subject: Re: [Buildroot] Article for the German Linux magazine
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
Cc: Jens-Christoph Brendel <jens-christoph.brendel@computec.de>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/05/2022 12:33, Baruch Siach wrote:
> Hi Arnout,
> 
> On Fri, May 13 2022, Arnout Vandecappelle wrote:

[snip]
>> Apart from the flexibility of the choice of packages (e.g. 4 different init
>> systems, 3 different C libraries, 15 different root file systems, more than 10
>> different web servers or web frameworks), the flexibility is mainly in the
>> possibilities to modify the root file system, to add configuration files,
>> etc. Because of the large amount of freedom, the choice of packages is often
>> limited to a few lines.
> 
> What does that mean?

  Err, I have no idea... Maybe it means it was late at night when I wrote that? :-)


[snip]
> Hope this helps,

  All other points are very good, it will certainly help, thank you!

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
