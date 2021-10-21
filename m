Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC52C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:43:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BD261221
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4BD261221
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7205083D2C;
	Thu, 21 Oct 2021 18:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghTxkXGRyK_x; Thu, 21 Oct 2021 18:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B790283D43;
	Thu, 21 Oct 2021 18:43:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C97FE1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C293160F38
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czuMtTrW5wdZ for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 18:43:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0592606ED
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 18:43:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g10so4519659edj.1
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g4Tg+M10GKLau5R4cO3qkVPl146XXho08SOJ2BB9NVc=;
 b=OltuWOZBP0p7ZH8B8L4WgH662GMnM/TyEnmk6b2cXSJGlt4U74LLQ1IqFOGInw52A9
 IGU8FZwN1ZzpUrFLdyr0mtyJnImJTNuGuRQClfCSLOQNm7H31TRR1NP6au9lb8kgpu7V
 eGVoj1VEd80nuaNrz8oF2kyj7zQNDIhGRCYAcZmHO21vBWs4hku4YAitQtrYXNuNuwHH
 M4PX/V+22hMcDhxjszRTS9SXfYTfbow2qw1EB+vO5XadV/jgBBT0+By5i65UuWfXX46q
 vIfk86yDvw+LaAEthuf3w2RvjZC8wMynoM15EX73ZGn1xty75p/m3FKuVvgqtYs0IWlL
 5t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g4Tg+M10GKLau5R4cO3qkVPl146XXho08SOJ2BB9NVc=;
 b=50rZZQEgGah0qXP9N8gQrx6y6DdUP9r01EUnsykspCW4yqbM68SjojB/q6lRRVCX5z
 PNk/SwlISGl2wr5aUvvlbhfn26P5ekshnr+iTnGiClKVTeNXwPYmKcaTotndh2upYG0B
 Y8D/9Mh3MQKqUvsv+EvInk2LIg7FBpv91urwi+Ec/iWI0rDCpVMPJDbUhsvf6qOaXj01
 PLhzBy9rMDKUUQKm4iDiL6FwLZKk5ocEtSjnuWEDjpGsaoFjAa0tycQefyTSYFmVey2R
 AuL3JoyQWyOKma4VyZQeHbchS2F12dBB7NkwmVkLoXdQUYpfNrSCbioQKqREwYbIG+Aq
 IJTA==
X-Gm-Message-State: AOAM5317MTIrU+9/cZgmKyofUtneb51XrpEh5tWB1nkiNbt4Ohn4fc0G
 23LMjpuWeGFTSNpIHcDMhdViBQ==
X-Google-Smtp-Source: ABdhPJxkyOl25lqnvyoPSXYdHxBbib8K5okhy402YHta8Pnu80oXjwi2mijZuEPuRXB4GbXH34dzuQ==
X-Received: by 2002:a05:6402:2712:: with SMTP id
 y18mr10493578edd.392.1634841789897; 
 Thu, 21 Oct 2021 11:43:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p10sm3262055edj.91.2021.10.21.11.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 11:43:09 -0700 (PDT)
Message-ID: <88c82aa8-d532-eeb1-bc77-796eafa0d06e@mind.be>
Date: Thu, 21 Oct 2021 20:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
 <20211016093234.2477835-2-fontaine.fabrice@gmail.com>
 <20211018220427.5971bba1@windsurf> <20211018201808.GT2400@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211018201808.GT2400@scaer>
Subject: [Buildroot] conditional assigment check in check-package [was: Re:
 [PATCH v2, 2/2] package/knock: add knockd option]
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/10/2021 22:18, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2021-10-18 22:04 +0200, Thomas Petazzoni spake thusly:
>> On Sat, 16 Oct 2021 11:32:34 +0200
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>> +ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
>>> +KNOCK_DEPENDENCIES = libpcap
>>  From commit 97f3ad7af3dd54a15a10aa35786e7fa08cf5e7b1:
>>      Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
>>      conditional is the root of all evil."
>> Care to repeat after me ? :-)
> 
> OK, I missed that in my review of v1...
> /me hides in shame...
> 
> But seriously though: why is that not caught by check-package?
> 
> Because it is not actually an override: the variable is not yet set
> there, so it is valid to unconditionally set it.
> 
> check-package should probably recognise that the variable is
> <FOO>_DEPENDENCIES and consider that conditional assignment should
> still be forbidden in that case.

  I had a look at this, and it is not entirely trivial to test for in check-package.

  Basically, this is allowed:

ifeq(...)
FOO_VAR = ...
endif
... $(FOO_VAR) ... # Empty if condition not true

  And this as well:

ifeq(...)
FOO_VAR = ...
else
FOO_VAR = ...
endif

  But this is not:

ifeq(...)
FOO_VAR = ...
endif

ifeq(...)
FOO_VAR = ...
endif


  So basically:
- after a variable is assigned, it can't be assigned to any more in the same 
conditional branch;
- it can be assigned to again in the else branch (including else ifeq constructs);
- it can not be assigned to any more after the endif.

  In addition, conditions can be nested...

  The only way I can think of implementing this is by keeping a stack of 
conditionally assigned variables. In the else branch, the top of the stack is 
saved en empties. At the endif, the top of the stack is popped, merged with the 
saved one, and merged into the new top of the stack.

  Wow, by writing it down, I almost implemented it :-) Let's see if I can still 
find the time to actually do it tonight...


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
