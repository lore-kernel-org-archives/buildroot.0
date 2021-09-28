Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342B9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E2761153
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1E2761153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7197B401C8;
	Tue, 28 Sep 2021 08:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghfASrqH4LCt; Tue, 28 Sep 2021 08:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C9A401E9;
	Tue, 28 Sep 2021 08:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03F491BF298
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E759480F51
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fr38mqq5HmIz for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 08:08:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 346DD80F29
 for <buildroot@busybox.net>; Tue, 28 Sep 2021 08:08:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id l8so32202528edw.2
 for <buildroot@busybox.net>; Tue, 28 Sep 2021 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rGMFo1V+iSXJv1D2Kd5vwn8iTCz3F72Yt3ePmESDGhE=;
 b=WT2X8BLIBZ7PAZgCtdQLEfL9PJxgDyvySjB3I7YXwRpElczNPQEjIBGM/z9l9VwWgR
 tUA3OqAJSIEGby3hRjtzwJGjjh9EYMBeA2FfLvKSAmXeztcH4fUt46s6cCYx9C5WauVb
 RPJjyMGyhMacvBCQl3JfA59skTEqcukfUQhkJ688FSqFR/GgCn1jb4KKq6+KE4iM5k37
 RiQ5iI+irfORO9rL5OVBdOkg8jlazqF80fwG/y/ctdx0Yxisr0m5Mu7qKvwbqYrC52xz
 ABJhuxjwSHY44uft2Pzy3qEAsx5IojPM2cACIWIqR0bdL4uTdQ+a3qyeo1+JeatEx9wc
 wbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rGMFo1V+iSXJv1D2Kd5vwn8iTCz3F72Yt3ePmESDGhE=;
 b=4FAIVB65RB+lepMr1vc/JYUgIzg+KmeiF69qAy4HDTBgbwWe51Qg4tplqygmfMPiG2
 iSduqAr2bWORAv8TxsrKQMzyplGCPh4ofCs5V1b+3fCuSKCuiM/RKEVMI6E/H3fb7xC6
 3Vcwc2/yl/CcQx7dEEO9e30VmJNec3Zg0gFoOGvQzzAle4cYAupzSPXlmfnY9DBUNfcL
 7OVU/BlivUa0bVjHXxA+jj9g/6OUvcvm/j8AZRwUNiaNkk6mFyHAgkwellGcVSpBo3ac
 u/Ag9USRfCOoAml5XKH01fxxcL8MCWdIXaDwLmVsgbtnYzkOt7B6Ii4OXjKJW1OOj8uH
 tdPA==
X-Gm-Message-State: AOAM531jJAI44iYAOvGwC+Br0p17IMQXhlI7dPMUavwb0vkFzpGJVNnD
 cUoMPsH1h+AVIttU4OtMucmLVFHYa1AC+jvR
X-Google-Smtp-Source: ABdhPJwCBQAC3NhJfS+gXdZzF/PrAbwQ5KwyPYauS3j9nHQVw6F7YRSOdSQuodFF9mYbbJjHNjUSYA==
X-Received: by 2002:a17:906:52d1:: with SMTP id
 w17mr3516748ejn.507.1632816507452; 
 Tue, 28 Sep 2021 01:08:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id de9sm9735301edb.8.2021.09.28.01.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 01:08:26 -0700 (PDT)
Message-ID: <c64d4acc-be09-fd97-5e0b-8f301164f89f@mind.be>
Date: Tue, 28 Sep 2021 10:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Vadym Kochan <vadym.kochan@plvision.eu>
References: <20210920192442.2784967-1-francois.perrad@gadz.org>
 <fba75762-e27c-7530-b133-b11735c24c7b@mind.be>
 <vrcxh2wnn2a1kd.fsf@plvision.eu>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <vrcxh2wnn2a1kd.fsf@plvision.eu>
Subject: Re: [Buildroot] [PATCH] package/mstpd: new package
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>,
 Vadim Kochan <vadim4j@gmail.com>, Serhiy Boiko <serhiy.boiko@plvision.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 10:02, Vadym Kochan wrote:
> 
> Hi All,
> 
> Arnout Vandecappelle <arnout@mind.be> writes:
> 
>>    Hi Francois,
>>
>> On 20/09/2021 21:24, Francois Perrad wrote:
>> [snip]
>>> diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
>>> new file mode 100644
>>> index 000000000..0e5c9714c
>>> --- /dev/null
>>> +++ b/package/mstpd/mstpd.mk
>>> @@ -0,0 +1,13 @@
>>> +################################################################################
>>> +#
>>> +# mstpd
>>> +#
>>> +################################################################################
>>> +
>>> +MSTPD_VERSION = 0.0.9
>>> +MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
>>> +MSTPD_AUTORECONF = YES
>>> +MSTPD_LICENSE = GPL-2.0
>>
>>    There is actually hmac_md5.c that has a different license. So I added that
>> one, and I added it to LICENSE_FILES as well and to the hash file.
>>
>>> +MSTPD_LICENSE_FILES = LICENSE
>>> +
>>
>>
>>    Vadim (in Cc) posted the same package a year ago. He had
>>
>> +# mstpd requires that it is installed into /sbin, not /usr/sbin
>> +MSTPD_CONF_OPTS = \
>> +	--sbindir=/sbin
>>
>> which he later explained with "it should point to /sbin because
>> Linux's bridge implementation calls /sbin/bridge-stp in case the STP
>> handling is delegated to user space." - which sounds pretty feasible to me...
>>
> 
> This is can be checked at least by this:
> 
>      https://elixir.bootlin.com/linux/v5.15-rc3/source/net/bridge/br_private.h#L51
> 
> So may be just create /sbin/bridge-stp link.

  I think the --sbindir approach is cleaner. Although I see that openwrt in fact 
uses custom install commands and puts mstpd and mstpctl in /usr/sbin, and 
bridge-stp in /sbin.

  Also note that a symlink is tricky in the unified /usr case, because then 
/sbin/bridge-stp and /usr/sbin/bridge-stp are the same file.

  Regards,
  Arnout

>>    Did you test this with STP and with a non-unified /usr?
>>
>>    I've anyway alreayd applied as-is to master (with the license fix), but please
>> check if the --sbindir is needed.
>>
>>    Regards,
>>    Arnout
>>
>>> +$(eval $(autotools-package))
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
