Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB47C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B67AF415C6;
	Thu, 17 Mar 2022 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E20SE74ASVmC; Thu, 17 Mar 2022 21:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA84A40882;
	Thu, 17 Mar 2022 21:08:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A28EE1BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 917FC81332
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRTkjZbRqG53 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:08:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65C4E8132C
 for <buildroot@busybox.net>; Thu, 17 Mar 2022 21:08:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g20so8078165edw.6
 for <buildroot@busybox.net>; Thu, 17 Mar 2022 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rIqLT4aWQM+VQmsFCVWA7O72ooPOlbQPYzlS3sPvpkc=;
 b=fljdb6kuxNG6P+vIlrjt4DzTpXF7l4+H0cabnJ6CZRtPh1MCqxqRmkH6VmiaSQ99WL
 qLRl/A+NAotZQYDCZGzh0FcnSbqTc/Jb0TtEX+56j/fgJN9v1aCjZSJaJ6CcZEwE3Cki
 vBNAmKfSlGFYL+FyvezIktCJr/Vn7AQWkfxn4A1uQgKLZ1eBXsGLL9mIK5DOdpCQWoMB
 p1L3BoKCDLZQDWbSbWRy32BNKIR+yI9Ud1BNZwcJJJVbZLU4M6zYgEwX3/vipJOiSqYn
 5yhnmT0SF90UKZDFARHy5u5ZpHzNEEii470hi4fJKIECCGJXkU68xaxr3/2hIXJWsJca
 FnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rIqLT4aWQM+VQmsFCVWA7O72ooPOlbQPYzlS3sPvpkc=;
 b=ezhonIyuaArDFw5KWffniCoZCGZQaHVsrh77D6XUAcOI804qwccVKaYbTUZMlj4uvP
 2PvvwuA53IEAhKzCWe+jDP/fg9gaC1Io/+tXMhoHI9d6pyAHcEFfM++xGx+dEesugwmK
 5+LUBaERTrjQgA6UFYwPA2do2A0Fs8nRNaxuDCkxFh1lE+e9BqMG4/bz8knWMBO0dnqG
 b0sETK5WuArdZOkL44Szyw0uqP5XnXrnYdSwz4zVkPLTWpnyNBGH2xCwLCq50jlAXlnd
 5GBdSIrXJgUffIrH+Dscdlfhn8SGshY18mj3OuRJeA0eH0SqYHbelXgW7/71dxLhYkCo
 0dvQ==
X-Gm-Message-State: AOAM533fEs0oJlnoxW73m0ZEc+v96+1Zp9M2YNvqFvXZUi0BsESTc4MM
 Y4XOFls/dFcU4+Dtw7GQww5eQA==
X-Google-Smtp-Source: ABdhPJzxjSRTmez19TKDxC+9y9pjxQ8LLLVfYD16tVfrJ6zmlu42BjazSy7x+PBo/wRt66cYgVG1hA==
X-Received: by 2002:a50:a6c8:0:b0:418:60c9:6a6a with SMTP id
 f8-20020a50a6c8000000b0041860c96a6amr6446546edc.327.1647551318458; 
 Thu, 17 Mar 2022 14:08:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a50955a000000b00418ebdb07ddsm2885168eda.56.2022.03.17.14.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 14:08:38 -0700 (PDT)
Message-ID: <2af0a832-8418-1837-ce41-aedebb52cbf1@mind.be>
Date: Thu, 17 Mar 2022 22:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Grant Edwards <grant.b.edwards@gmail.com>, buildroot@busybox.net
References: <t0t2su$mdo$1@ciao.gmane.io> <t0t95p$8on$1@ciao.gmane.io>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <t0t95p$8on$1@ciao.gmane.io>
Subject: Re: [Buildroot] Can buildroot use existing host fakeroot?
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



On 16/03/2022 19:10, Grant Edwards wrote:
> On 2022-03-16, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> 
>> I maintain some firmware that uses buildroot 2016.11.2 (with some
>> local package upgrades). Unfortunately, it seems I can no longer do
>> builds because host-fakeroot won't compile (it's too old for my
>> kernel/libc version of stat?).
> 
> I've updated fakeroot, acl, and attr packages so that I can build
> again, but I'm still curious about whether you can tell buildroot
> to use pre-existing versions of host-side tools like fakeroot.

  Not as is. If you want to support that, you have to add a fakeroot handler so 
support/dependencies/, and you have to update all places that use fakeroot to 
use $(FAKEROOT) instead of $(HOST_DIR)/bin/fakeroot.

  (Or actually, what we should do is to create a symlink from $(HOST_DIR)/bin to 
`which fakeroot` in the check-host-fakeroot.sh script. We don't do that for all 
the other dependencies, but it would be a nice approach I think.)


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
