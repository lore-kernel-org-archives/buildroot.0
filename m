Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE5AC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 14:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0319F81E12;
	Fri, 25 Nov 2022 14:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0319F81E12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltCnu29gfwOq; Fri, 25 Nov 2022 14:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3675F81DEA;
	Fri, 25 Nov 2022 14:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3675F81DEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6140C1BF30A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4608040017
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4608040017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZeXwmzL6lJb for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 14:06:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDFCF4000B
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDFCF4000B
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 14:06:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r26so4441963edc.10
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 06:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C6D36R+FvMToInqvukRj9VtEMQ0EKHL4/yEfOJnQbN8=;
 b=VFrPFq2VaCeZ1w/WnxJI3RnRpbOUt0vHc6z3PNd7Ong0gy65be3pV2ndrM9FzTjz3f
 CChVhbQ18GjMyUxpFlA9r/7JNMlOSQ293Gxr3x46npofNhuLBiGZm/oN2HjKkj9bA7oT
 zz6cEnoaICGYX8E2A7+6GcFdCfeJcTktdzTd6T5jjbkmB6GGDranVtZI3zQzYc0VAdJZ
 5enflpsXZBis/+THEEJqCOZIPqpyIwkolRjAulNHv1NxCRQidqvx9K467vfFCcLkw+aV
 eqN9b1LO2dAi/axNprZG3Anq7+E/mFqBVNgdHNB2bkvuvHydMSowF97wDo97LgWWuOCg
 c+EA==
X-Gm-Message-State: ANoB5plGabQdOzsxflZTGkNwkDpuSMTQkk2xhCm+V765dtCcPeR/5DXF
 YDV8oV2/fG3k1bKZpCExQwv8Tw==
X-Google-Smtp-Source: AA0mqf6lWtuJ9m/QDfhVXOFFy+fVEfFnfEuiEO1VGOF+OMUi3unVBLRV9ApXNl9OKkeUfVQtwMAf2A==
X-Received: by 2002:a05:6402:548a:b0:468:e8e2:31c9 with SMTP id
 fg10-20020a056402548a00b00468e8e231c9mr9833838edb.310.1669385183998; 
 Fri, 25 Nov 2022 06:06:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a1709064b0400b0073c10031dc9sm1582313eju.80.2022.11.25.06.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 06:06:23 -0800 (PST)
Message-ID: <620448da-4dda-3d9d-cb39-5c8a278767d6@mind.be>
Date: Fri, 25 Nov 2022 15:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221028223844.1180418-1-james.hilliard1@gmail.com>
 <20221030083033.GC1058960@scaer> <20221117085339.4a4d5d8f@windsurf>
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221117085339.4a4d5d8f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C6D36R+FvMToInqvukRj9VtEMQ0EKHL4/yEfOJnQbN8=;
 b=fK+EvExI0XyfFG+JuiPTdx7XnqOVZyRMLx6kw4g6fkUG1yjH8KrsHeFr7miNA0KkNB
 X7feFAdV7TmxVn1MkuoVez2Q9fi0pLccbRtPrTsrfdhny++Vx5y1XeKDcNNEYqoGc4t1
 0DTQiDzvIqndRxosPrQ9+ayl298dTSNYmKiByS2F0TJbokO1AQeGRL3TaMV6fncPeWWU
 zLoq9bWGs26FS6DxIHRtBizEjf9IC5ZiVkoGH6rC4AIFtrkisDQcuKfC+vGlMxrPNixO
 tqiwlbABfcCB2/+zP+OQnyOXGOo4umj9MZrDbB58f/7nrsaCFNQanVQqqTrJjX+qVOb3
 e9EA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fK+EvExI
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: ensure __register_frame is
 optimized out for glibc
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/11/2022 08:53, Thomas Petazzoni via buildroot wrote:
> On Sun, 30 Oct 2022 09:30:33 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> Should this not be limitied to the intial compiler only? Otherwise, why
>> would we need it for the final compiler?
> 
> I confirm limiting the work-around to gcc-initial works.
> 
> However, I have reported the bug to gcc upstream, and they say the
> issue is in glibc:
> 
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728

  James previously already reported the problem to glibc:

https://sourceware.org/bugzilla/show_bug.cgi?id=29621

  I picked up the thread in both issues, I was able to narrow the problem down a 
little more, but in the end the conclusion seems to be "We can't support that on 
the glibc side at present."

  So I applied this patch to master, after making two major changes:

- move it to host-gcc-initial only;
- instead of putting the full condition in the .mk file, make a Config.in symbol 
BR2_TOOLCHAIN_HAS_GCC_BUG_107728.

  ... And now I notice I forgot to put the changes I made in the commit message. 
But it's pushed already.

  Anyway, applied to master, thanks!

  Regards,
  Arnout

> 
> To be honest, even after reading multiple times the feedback from the
> gcc folks, I'm not entirely sure that I really understand their
> explanation nor how to move forward with investigating the issue.
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
