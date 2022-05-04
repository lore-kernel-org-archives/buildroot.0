Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5942C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DA0040BBD;
	Wed,  4 May 2022 19:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKxkPdExAtrC; Wed,  4 May 2022 19:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4257840BB7;
	Wed,  4 May 2022 19:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61ABD1BF3BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB5E83F91
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPk9b9VMD0Zt for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:46:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FA7B83F7D
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:46:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g20so2872828edw.6
 for <buildroot@buildroot.org>; Wed, 04 May 2022 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y3e0RP1slomqMQjWSNqTqTNutZGdemXZhv5ZqMv8J3c=;
 b=A2c2OtTBB1bUHyl6Lp3+lLQOuragH82Dvpqs3ph4So2z1kDb16krVJyz9yuKOlW1kD
 j0VfIQ0JqIRr8TAbO8g+VRcmFvoKxodTcWW24beDYyRRkAPQE2sLGnU/MAW3LEetPafS
 uBX/1Z3/M+t2kQvfttv8i1u6tY45s7htzlkWxMQRAtjoB5VcIip+j8PpezcmnmI0Oej7
 Il+RO9JGbXhdjbI4PKcex2jQHHNXfd8ZBeCLcwJ4SadizoLaUyu9DcNjCf/S1MIce62g
 oDu6bmwGD6cUcrhprClU+YnR7zjOXl1FUwDtcWB0we5OLguUVx+fp43W2EUTNRG77WyZ
 D/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y3e0RP1slomqMQjWSNqTqTNutZGdemXZhv5ZqMv8J3c=;
 b=UswD4i1A5PZuwEWvlvcVCyebHn2YgHtjsx4/myRgy3gpLBxjK3YSsKLu9FtQ3U6YDc
 5ylFVugKdP2/auGNDKdji/AJAcVIRwrNjvi6dT61ltTvZHZVv509C6dqWgc3AjHJBEN/
 pMT2LQBG66bLnxhZLmY73w5mGJOTfkFvImv1tApP33Mr1zn3vdq+WKfyW5Iur8va5H8D
 LqPvAkIgxvqeN0+nPw6qS8GAoVUUlDzKXrbfKWWBCwbUPqtKNSC7Uc/9NcNOz+Pp7yDj
 iQV10wmKdM+EfW4DSOwP9PQU20N8grZ/ctdW/LNlWq53iTDLiX2X7BNTcTQwb4Gd+aBC
 ngDg==
X-Gm-Message-State: AOAM530perp8zqkcmg5vsST2SZ9ukgR9YBJGDsD+fOFiU60+jeKx9ZTR
 fFXI52H4Lcq0oS7XV/QDoogJ7g==
X-Google-Smtp-Source: ABdhPJx60gxmKyvPbt0fbPsMzTd4R91pSGYDHB0josVd7cYe0pp9IwYgQ64psgsSXsZJeR+IEc26Uw==
X-Received: by 2002:a05:6402:370b:b0:41d:8508:20af with SMTP id
 ek11-20020a056402370b00b0041d850820afmr25416258edb.16.1651693578157; 
 Wed, 04 May 2022 12:46:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a05640208c700b0042617ba63bfsm9403295edz.73.2022.05.04.12.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 12:46:17 -0700 (PDT)
Message-ID: <87ce0a58-6986-7596-9c8d-26e9fec07605@mind.be>
Date: Wed, 4 May 2022 21:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220503023117.266256-1-james.hilliard1@gmail.com>
 <82d1991b-48c4-c767-dfe3-b28264eca4d0@mind.be>
 <CADvTj4qXE3v_OrFT7m-M0qWnV7L7Tfa5eeM=7idg-Fpi8S_Afw@mail.gmail.com>
 <de87d7cd-45d4-1dd5-578a-c61c59ae7c09@mind.be>
 <CADvTj4pM2JJjuOigR8W5UnNxFFm2qgz+aY4JSvF5YdC_5q+qpQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4pM2JJjuOigR8W5UnNxFFm2qgz+aY4JSvF5YdC_5q+qpQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add DTS cuimage
 fixup
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/05/2022 04:02, James Hilliard wrote:
> On Tue, May 3, 2022 at 2:29 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 03/05/2022 13:16, James Hilliard wrote:
>>> On Tue, May 3, 2022 at 12:41 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>
>>>>
>>>>
>>>> On 03/05/2022 04:31, James Hilliard wrote:
>>>>> If we don't have a DTS name or path we need to also disable cuimage
>>>>> to disable DTS support as BR2_LINUX_KERNEL_CUIMAGE requires DTS
>>>>> support.
>>>>>
>>>>> Fixes:
>>>>> linux/linux.mk:591: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings.  Stop.
>>>>>
>>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>>>> ---
>>>>>     utils/genrandconfig | 3 +++
>>>>>     1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/utils/genrandconfig b/utils/genrandconfig
>>>>> index 70af84f002..b821e60114 100755
>>>>> --- a/utils/genrandconfig
>>>>> +++ b/utils/genrandconfig
>>>>> @@ -381,6 +381,9 @@ def fixup_config(sysinfo, configfile):
>>>>>             if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
>>>>>                 configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
>>>>>                 configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
>>>>> +        if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines:
>>>>
>>>>     Similar to the previous patch (only fixup host uboot tools ...), should this
>>>> be done only if no DTS is given? I.e.:
>>>>
>>>> if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines and \
>>>>        ('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines or \
>>>>         'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines):
>>>
>>> Should be ok already due to parent match conditions covering the invalid case.
>>
>>    No, what I mean is: it is only needed to remove the line if DTS is not set. If
>> either DTS_NAME or DTS_PATH is set, there's no need to remove the CUIMAGE config.
> 
> Yes, that's exactly what this patch does AFAIU, see parent match
> conditions here:
> https://github.com/buildroot/buildroot/blob/49f9a08223005584ca28c6f243ee5cb1d1e64f57/utils/genrandconfig#L377-L378

  Argh, I just should believe you instead of thinking I know better...

  Applied to master, thanks.

  Regards,
  Arnout

> 
> The BR2_LINUX_KERNEL_CUIMAGE removal only happens if both
> BR2_LINUX_KERNEL_INTREE_DTS_NAME and BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
> are empty.
> 
>>
>>    This is similar to the patch you submitted for
>> BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE and _SCRIPT: they only need to be removed
>> if the corresponding _SOURCE config is not set.
>>
>>    Regards,
>>    Arnout
>>
>>>
>>>>
>>>>
>>>>     Regards,
>>>>     Arnout
>>>>
>>>>> +            configlines.remove('BR2_LINUX_KERNEL_CUIMAGE=y\n')
>>>>> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
>>>>>             if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
>>>>>                 configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
>>>>>                 configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
