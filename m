Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4D2C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:13:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779F360EE9
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 779F360EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A693400F2;
	Sun,  8 Aug 2021 18:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k463Jq5_BAta; Sun,  8 Aug 2021 18:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AF9A40171;
	Sun,  8 Aug 2021 18:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4189A1BF4D8
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 310FB6064D
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19g5V1boLlnl for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 18:13:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7049605A8
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 18:13:05 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEF8B4A3;
 Sun,  8 Aug 2021 20:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628446382;
 bh=CFEbBo1tSk/nxe4UZOE8SJq0aVPCqNhPiUXCvAInPOY=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=vH2ZiPlq+b7T2TdqNsgf5hgEtu0KgE4W5g1MElVNrQaB3e9mg3AT/4LDT4+W8lnNq
 P0qU7HDfW6n0zNxVqaBH1UiznvqnHV6CvSYIe+EEuHEA3LenARB3Uzz+SIWOqZHFqP
 nuJbQFuxpENmJF8bnfYG9Le0vrjx18SkDzr0rUwQ=
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
 <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
 <20210808092935.GK27036@scaer>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <ee9c4a7c-82c2-3b5e-7e41-0bad306e80fe@ideasonboard.com>
Date: Sun, 8 Aug 2021 21:12:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808092935.GK27036@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 2/2] package/kmsxx: update to latest
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On 08/08/2021 12:29, Yann E. MORIN wrote:
> Tomi, All,
> 
> On 2021-08-06 15:50 +0300, Tomi Valkeinen spake thusly:
>> We can drop all the patches as they have been sorted out in upstream.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
> [--SNIP--]
>> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
>> index 871ecaf85c..ab0158d1ed 100644
>> --- a/package/kmsxx/kmsxx.mk
>> +++ b/package/kmsxx/kmsxx.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -KMSXX_VERSION = 548905611c130ea9d31929a0caf7a198d8bac462
>> +KMSXX_VERSION = 824bbb1f4cd062d66b457faca50f904b34dfd96c
>>   KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
>>   KMSXX_LICENSE = MPL-2.0
>>   KMSXX_LICENSE_FILES = LICENSE
>> @@ -13,9 +13,7 @@ KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
>>   KMSXX_CONF_OPTS = \
>>   	-Dkmscube=false \
>>   	-Dpykms=disabled \
>> -	-Domap=disabled \
>> -	-Duse-system-fmt=true \
>> -	-Duse-system-pybind11=true
> 
> Those options have been dropped upstream. Does that mean that they now
> always use a system-provided fmt and pybind11, or that they always use
> their bundled versions?
> 
> The answer is mixed.
> 
> For fmt, the option was dropped entirely, and upstream dropped their
> bundled version in fdffbcdc0b0e (Use system libfmt). So we can indeed
> drop -Duse-system-fmt=true.
> 
> But for pybind11, the option we added in our patch, was added with a
> different name upstream. We had 'use-system-pybind11' as a boolean, they
> added 'system-pybind11' as a feature.
> 
> Applied to next, with the above changes. Thanks.

Actually, looks like I messed up a bit. I was probably a bit tired on 
Friday...

- I didn't push kms++ 824bbb1f4cd062d66b457faca50f904b34dfd96c to master 
branch. But it's in 'travis' branch, so it's available for fetching.

- I dropped both system-fmt and system-pybind11 options, as they didn't 
seem necessary [*]. However, I forgot to remove system-pybind11 from 
meson_options.txt, even if it's not used anywhere.

- My patch descriptions were shamefully terse. Sorry about that.

  Tomi

[*] For fmt, I didn't see a need for using meson subproject at all, as 
fmt seems to be available "everywhere", and afaics it's been quite 
stable. For pybind11, I still like to keep the option for meson 
subproject to easily test/use specific versions. However, this doesn't 
need an option in meson-option.txt, as the behavior of the 
fallback-to-subproject can be managed with meson commandline options. 
Also, if 'pykms' option is set to disabled, pybind11 is skipped also.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
