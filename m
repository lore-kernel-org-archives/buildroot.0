Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD08C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D466260FD1;
	Tue, 14 Feb 2023 21:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D466260FD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FpOIAaKy2Fuf; Tue, 14 Feb 2023 21:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E75A460F9C;
	Tue, 14 Feb 2023 21:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E75A460F9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4001BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48B6E60F9C
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B6E60F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DxZnbMevYxP for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:23:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1CA860F80
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1CA860F80
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:23:04 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id dz21so7312703edb.13
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVCitqN04i2xlTT9hzj2nmDoinp+wAtKUJu2mUFwBwM=;
 b=gwP0pfzfHm1n8xHWjMFjFTEHQljcS/KJuJHU+WtfXjiRDvb4aflDFQpRb7CZ0Ba4oa
 Mm9orhR5UclRrBD29WB7PBFmwj9fNs39BwmuutJunRRIFM83HpX5bS6nJ9ipOX6+xpAS
 +Lsk/jlrBLSYROAS1D2eRAx+dxeDrGT6syyP2pZ1wJHZCfuugpyp+dk3RfeGbr7vKCfR
 bXl32Wqr7+JJYmTi7l+OSg59YGzQ+FbZWRWhgv9qN56blrN6s2+ZrwJZx8y4PE2sUFEM
 cUJvU1bWCnuFgiETXRjfTrKqMeYBmyFbREhl9CfBjDh8TytTaOqSx1QnVc4AXO8EtSkf
 JJtw==
X-Gm-Message-State: AO0yUKWdsb8TwlqgjMe4XS4Rx6da6cz7B8YCe7KRnws4H3kJcPO5Jmew
 xWL1x4YCafBZ4TfSVw1IxdM48Q==
X-Google-Smtp-Source: AK7set8piH10UpNl1rsNbxw6uV7KiG+c0R0OaizWxq4JF/ic+6VUIRIRPG27snVch+hs8mpTwwdvEg==
X-Received: by 2002:a50:9ea2:0:b0:4ac:bbaa:842f with SMTP id
 a31-20020a509ea2000000b004acbbaa842fmr4569727edf.39.1676409783103; 
 Tue, 14 Feb 2023 13:23:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a50d597000000b004acb7f05589sm5615647edi.94.2023.02.14.13.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:23:01 -0800 (PST)
Message-ID: <7d630b5f-69b3-6129-2426-7e9b7499f6d3@mind.be>
Date: Tue, 14 Feb 2023 22:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230212094205.GK2796@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVCitqN04i2xlTT9hzj2nmDoinp+wAtKUJu2mUFwBwM=;
 b=UDwIK9F7EVyrs2gVgB230eu4Dtmto5bLDBzpXAIJNqVD/HZ0f+Jhl+mxtoO6zauRi3
 mhc/dnGZPQqJARc00SL1tLuEUJUJpLebv9v1LPA9AjiCo7wKm+Zv3w1VeBxiPUzIyVr0
 oC376My21o8HI5wSwvUAcezeH+bW1LtoOyp4NH2ma6YJHXKcDMqj4cnzoLyhpDdetqLv
 1FmIkNXwqhlo2KOwGoLZh1Tuy1vFey8vd2GuiUcoKJ972xmg8BkLJmkBp3SGFrpRS52w
 S4RMlZ7Ytu4Zw4vQ4KAxknfXl+hN2YKfjwNDjYmo+O5rIE4ppexYexLA4GEKK8bD9DdM
 Lmxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UDwIK9F7
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2023 10:42, Yann E. MORIN wrote:
> James, All,
> 
> Thanks again for working on such grunt work, it's much appreaciated!
> 
> On 2022-10-17 21:46 -0600, James Hilliard spake thusly:
>> These command rely on the clean operations being first so that the
>> stamp files being deleted will rebuild the targets.
>>
>> The execution ordering of the clean and rebuild operations may
>> change, for example if --shuffle=reversed is set.
>>
>> To ensure the evaluation order is always correct use double colon
>> rules to make the evaluation order explicit as per make docs:
>>
>> The double-colon rules for a target are executed in the order they
>> appear in the makefile.
> 
> I am not convinced that we should switch over to using double-colons.

  Me neither.


> As I reviewed your other related patch about legal-info [0], the make
> manual [1] suggests that double-colons are rally intended for cases
> where "the method used to update a target differs depending on which
> prerequisite files caused the update" and "double-colon rules really
> make sense are those where the order of executing the recipes would not
> matter".
> 
> So, we'd use a mechanism where order should not matter, to solve an
> issue with ordering. That'd be weird...
> 
> Yes, the manual states that "double-colon rules for a target are
> executed in the order they appear in the makefile", but that really
> looks like a side-effect of another goal.
> 
> Also, we'd need to carefully review all our Makefile to ensure that
> there are no other cases wehre ordering of prerequisites matter.

  Well, we need to do that regardless of which solution is found, right? Unless 
we just disable parallel builds and --shuffle entirely.

> We'd
> also have to be careful every time we introduce a new rule and remember
> to check whether it depends on the ordering prereauisites or not, adn
> worse yet, also whether we can afford the rule to be parallel-safe or
> not (see the explanation for that in the legal-info review).
> 
> Having colons and double-colons is going to be quite a headache... We
> already have issues with remembering that we need to use $$ to expand

  Yeah, maybe we should have some check-package thing to verify that $$ is used 
everywhere in a macro definition...

> variables in some places, and the rules there are relatively clean and
> explicit, but for the :: case, I'm afraid that's going to be a bit more
> complex.
> 
> We currently have a single location where we use double-colon:
>      support/kconfig/Makefile.br
> 
> which is added by our patch against kconfig:
>      support/kconfig/patches/10-br-build-system.patch
> 
> which dates back to 2010:
>      7c524dd0b683 Clean up our patches against kconfig
> 
> which got in three in 2007:
>      a665ed34960b - pull kconfig from linux-2.6.21.5
> 
> So, I'd like that we get another way to fix that, if possible...
> 
> Again, thanks a lot for spending efforts in that area, this is really
> great!
> 
> [0] https://lore.kernel.org/buildroot/20230212091914.GJ2796@scaer/
> [1] https://www.gnu.org/software/make/manual/make.html#Double_002dColon
> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> ---
>>   package/pkg-generic.mk | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index f24e03a325..6cb461af90 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -1057,17 +1057,20 @@ endif
>>   			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
>>   			rm -f $$($(2)_TARGET_INSTALL_HOST)
>>   
>> -$(1)-reinstall:		$(1)-clean-for-reinstall $(1)
>> +$(1)-reinstall::		$(1)-clean-for-reinstall
>> +$(1)-reinstall::		$(1)

  I may be stupid, but what we want is to have an ordering between 
clean-for-reinstall and $(1), right? So, let's use an ordering dependency?

$(1)-reinstall:		$(1)-clean-for-reinstall $(1)
$(1): 			$(1)-clean-for-reinstall


  Regards,
  Arnout

>>   
>>   $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
>>   			rm -f $$($(2)_TARGET_BUILD)
>>   
>> -$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
>> +$(1)-rebuild::		$(1)-clean-for-rebuild
>> +$(1)-rebuild::		$(1)
>>   
>>   $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>>   			rm -f $$($(2)_TARGET_CONFIGURE)
>>   
>> -$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
>> +$(1)-reconfigure::	$(1)-clean-for-reconfigure
>> +$(1)-reconfigure::	$(1)
>>   
>>   # define the PKG variable for all targets, containing the
>>   # uppercase package variable prefix
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
