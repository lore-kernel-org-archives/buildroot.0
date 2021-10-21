Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B4BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:25:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E2E60F9F
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3E2E60F9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6109F40301;
	Thu, 21 Oct 2021 20:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-OYS2c7hc4s; Thu, 21 Oct 2021 20:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACCD540391;
	Thu, 21 Oct 2021 20:25:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA891BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78CE683B69
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlooq4u0n0B5 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:25:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BF0E83B68
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:25:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id ec8so2827525edb.6
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i5FgqMl4qjqk3PHu1J1LhcJzIF4BA1RKVNb63tECKF0=;
 b=VlVJpcdrTW0LQKi2KGS9cxa24UzV/15YS6LLbQGynnJA2E13/laeLuwYwdLg7BIfgz
 BfzqN36e4xSMxITI1pjY7apUhiwqsH4dhD+LS2gmwuE1WnMB8Og1ju0TS4C9sHSpmbtk
 dW/ANLQHf2xm01QfqyQI9ZKHw14e9b+kd5Qz6TJxs6fo97Kxmrowd8Hs7pU09nfiWpPx
 CybaGjoMif/e8SuKbmiyZnAkJYD24uAcPcUfi6p9reZ19F2u7qFeAN4tG3Ij7MLLWpUN
 3ChZTSeibc1xTGBGQf4PF9gp9ZCuUAba2LGS9IoXqfk1QFE2Bd6dOjPLXKk+u/6bmpTm
 36cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i5FgqMl4qjqk3PHu1J1LhcJzIF4BA1RKVNb63tECKF0=;
 b=QEWLwnXJrfD1wkRkgws/O2bh5FeIljnjYztzlByc8EI25Ap1Cu4qUa1pwykvJeyqZL
 sTmS7548VhP3VFMLVQp45tQJfHH7V0LgtM8B/u+WJomcSKLoJJERcoKJh+BhylpNAYdo
 aqE24F/LxD10TPivne3hJ7U6FgQV2jbNBabyK/X9NcqcdX+grktKQtRgHREGsQCWrV0f
 OGzlZI4Z8bBvYlrFkTYJEUOrY/sK3lOEKbEAKA+uZ0hjg/zB6cJOXL2NzBnzjECuqXVD
 n9q/olr0DeUAu6tMGnCvMmgiG2YcWb+nOwFHS5iqIAMMGSXahPWY8eeRZP4OiS49QvW+
 YikQ==
X-Gm-Message-State: AOAM53309lVHaOJJLSKJxnelC45Nvuxoxed6tJs5f1Odlwue51iCHjN5
 DB9+O0C2443F6JTOFXIvN94F1w==
X-Google-Smtp-Source: ABdhPJxdOl1Snjs8DJyn2lhNwp6g+OqDeImgZImcwcHiPlUrd0Lw5i18gKI5SeNo71ANTl1HjgXwaA==
X-Received: by 2002:a17:906:a1da:: with SMTP id
 bx26mr10033397ejb.558.1634847917253; 
 Thu, 21 Oct 2021 13:25:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u23sm3380625edr.97.2021.10.21.13.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:25:16 -0700 (PDT)
Message-ID: <f0ed3181-5ef3-d561-4e5d-384ae735fb08@mind.be>
Date: Thu, 21 Oct 2021 22:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
 <20211016093234.2477835-2-fontaine.fabrice@gmail.com>
 <20211018220427.5971bba1@windsurf> <20211018201808.GT2400@scaer>
 <88c82aa8-d532-eeb1-bc77-796eafa0d06e@mind.be> <20211021201236.GG2400@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211021201236.GG2400@scaer>
Subject: Re: [Buildroot] conditional assigment check in check-package [was:
 Re: [PATCH v2, 2/2] package/knock: add knockd option]
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
Cc: Michael Rommel <rommel@layer-7.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/10/2021 22:12, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-10-21 20:43 +0200, Arnout Vandecappelle spake thusly:
>> On 18/10/2021 22:18, Yann E. MORIN wrote:
>>> Thomas, All,
>>> On 2021-10-18 22:04 +0200, Thomas Petazzoni spake thusly:
>>>> On Sat, 16 Oct 2021 11:32:34 +0200
>>>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>>>> +ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
>>>>> +KNOCK_DEPENDENCIES = libpcap
>>>>  From commit 97f3ad7af3dd54a15a10aa35786e7fa08cf5e7b1:
>>>>      Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
>>>>      conditional is the root of all evil."
>>>> Care to repeat after me ? :-)
>>>
>>> OK, I missed that in my review of v1...
>>> /me hides in shame...
>>>
>>> But seriously though: why is that not caught by check-package?
>>>
>>> Because it is not actually an override: the variable is not yet set
>>> there, so it is valid to unconditionally set it.
>>>
>>> check-package should probably recognise that the variable is
>>> <FOO>_DEPENDENCIES and consider that conditional assignment should
>>> still be forbidden in that case.
>>
>>   I had a look at this, and it is not entirely trivial to test for in check-package.
>>
>>   Basically, this is allowed:
>>
>> ifeq(...)
>> FOO_VAR = ...
>> endif
>> ... $(FOO_VAR) ... # Empty if condition not true
>>
>>   And this as well:
>>
>> ifeq(...)
>> FOO_VAR = ...
>> else
>> FOO_VAR = ...
>> endif
>>
>>   But this is not:
>>
>> ifeq(...)
>> FOO_VAR = ...
>> endif
>>
>> ifeq(...)
>> FOO_VAR = ...
>> endif
>>
>>
>>   So basically:
>> - after a variable is assigned, it can't be assigned to any more in the same
>> conditional branch;
>> - it can be assigned to again in the else branch (including else ifeq constructs);
>> - it can not be assigned to any more after the endif.
>>
>>   In addition, conditions can be nested...
>>
>>   The only way I can think of implementing this is by keeping a stack of
>> conditionally assigned variables. In the else branch, the top of the stack
>> is saved en empties. At the endif, the top of the stack is popped, merged
>> with the saved one, and merged into the new top of the stack.
>>
>>   Wow, by writing it down, I almost implemented it :-) Let's see if I can
>> still find the time to actually do it tonight...
> 
> Sorry, but I think I got lost somewhere...
> 
> Currently, check-package does not whine for:
> 
>      ifeq(...)
>      FOO_VAR = ...
>      endif
> 
> but it does whine for:
> 
>      FOO_VAR = ...
>      ifeq(...)
>      FOO_VAR = ...
>      endif
> 
> And these two behaviours are, I think, correct.
> 
> What I am arguing, is that FOO_DEPENDENCIES should be treated specially,
> where check-package should whine for:
> 
>      ifeq(...)
>      FOO_DEPENDENCIES = ...
>      endif
> 
> as well as for:
> 
>      FOO_DEPENDENCIES = ...
>      ifeq(...)
>      FOO_DEPENDENCIES = ...
>      endif

  Yeah, special-casing DEPENDENCIES is definitely an option.

  My "wanted behaviour" was for other variables which can have the same problem. 
Probably doesn't happen very often though.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
