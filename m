Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689D2ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 18:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E608F402E2;
	Mon, 29 Aug 2022 18:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E608F402E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdyuKWJKj8Cm; Mon, 29 Aug 2022 18:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E81E9401AE;
	Mon, 29 Aug 2022 18:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E81E9401AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F88E1BF23C
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 18:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39C05813FB
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 18:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39C05813FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9as6GHzINiB for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 18:55:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F7B813F4
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00F7B813F4
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 18:55:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id nc14so12649231ejc.4
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8EbNQ0aBlqXiNwc+YtXbrBk5i0oD1zuwAg4hGgB40dg=;
 b=K4GLylvtQANNXFD+64Egn++SaleTyQpIC24NSFzOXiM1rOgNAJBiHL+8DeoIgfn3AS
 fHhqJL1Hb3goP5qdb4dFehX785HAt30ITg1DeXq7NYQ3b11972e/Pv7vEYRZOoZAX5tX
 BAYaOAV5JpZoev4lZBjSX4sqJA01B0blDtydZwhTpppthSrdBpTqXcalBntdndEcJszi
 pv7kOxQi6gwUYEDCx2GmrG9fPrzhr4boFFUNQ1023TKKp27ViOikOKb0YL41LFcC4VFp
 Hy3UfslCjElhdEjTOH5JRrakfp2RNzP16AT3RoOAbXhEXaS0Bl2ZfRWRnRCu8B1dU3OV
 D30g==
X-Gm-Message-State: ACgBeo3wKD+eZgVsnRK9TkcJWiqWqRdeZndXWpHRUYlpuN0nMp3UME9F
 73RuRBdXAE0FpuKRasFndohplTt6dNzBZjwX
X-Google-Smtp-Source: AA6agR7/VhJr0NTUEyLjkG+Iy2Uld9lrmkIkAPCYuNcYtZyX1JQeRcU1ddYBb6dqK90rvYrQI6CFjA==
X-Received: by 2002:a17:906:cc4a:b0:73d:d3b9:b263 with SMTP id
 mm10-20020a170906cc4a00b0073dd3b9b263mr13314346ejb.130.1661799300216; 
 Mon, 29 Aug 2022 11:55:00 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a?
 ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a50fe99000000b00447bd64d4f6sm6084343edt.73.2022.08.29.11.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 11:54:59 -0700 (PDT)
Message-ID: <553c9903-0b75-d35b-cd30-848a05168eb7@gmail.com>
Date: Mon, 29 Aug 2022 20:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
 <20220614180152.15846-1-raphael.pavlidis@gmail.com>
 <a7ed0285-fea7-16f6-6ef8-9ff93fee1461@googlemail.com>
 <20220827120837.GV37358@scaer>
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20220827120837.GV37358@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=8EbNQ0aBlqXiNwc+YtXbrBk5i0oD1zuwAg4hGgB40dg=;
 b=SO4txLtuVeNqqodcAyjPw01iahR5f4mv8N4BbtQ0+2Fb54byCHEtko8mVXbFnaKTW8
 vAJKTUVUFkKAM40EGn7w7PnIROPQeX2tD+8z3DiL7GOtfvrqO5waNo9Acf5xai5IOoIv
 1zHP9hV/LmxXC1z8a36IF2K4nrn8QTmLTK51PM2fOh2oZ6T5+9UzWCA/pJq6pAI+8ZH0
 4pRiiUaPkuxzDS1HrQs94rXgqPqn9Nl0MwP0krj+93If7eNNYqarSxX7kPDUXyKBVvL6
 zgGp/XeC40AjYe0vSLZVPNeyEzTdhDCo2Bn5GEFXkxQILLVGN21cg/kDEyN25OTvjvT4
 aiEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SO4txLtu
Subject: Re: [Buildroot] [PATCH v2] package/slirp4netns: new package
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

Yann, All,

On 27.08.22 14:08, Yann E. MORIN wrote:
> Raphael, All,
> 
> On 2022-08-27 12:57 +0200, Raphael Pavlidis via buildroot spake thusly:
>> Can I do something, so this patch is accepted? :)
> 
> Just a little nudge... ;-)
>

:)

>> On 14.06.22 20:01, Raphael Pavlidis wrote:
>>> slirp4netns is for user-mode networking for unprivileged network
>>> namespace.
>>>
>>> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> 
> Applied to next, thanks.
> 
> You forgot to add an entry in the DEVELOPERS file, and I forgot to
> commit-amend my change, so I pushed a follow-up commit to add it.
> 

Thanks. I did not know that I have to add an entry to DEVELOPERS. So, 
the creator of the package have to be in the DEVELOPERS?

> Regards,
> Yann E. MORIN.
> 
>>> ---
>>> Changes v1 -> v2:
>>>    - Fix typo in SLIRP4NETNS_LICENSE_FILES
>>>
>>>   package/Config.in                    |  1 +
>>>   package/slirp4netns/Config.in        | 20 ++++++++++++++++++++
>>>   package/slirp4netns/slirp4netns.hash |  3 +++
>>>   package/slirp4netns/slirp4netns.mk   | 15 +++++++++++++++
>>>   4 files changed, 39 insertions(+)
>>>   create mode 100644 package/slirp4netns/Config.in
>>>   create mode 100644 package/slirp4netns/slirp4netns.hash
>>>   create mode 100644 package/slirp4netns/slirp4netns.mk
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index 3b089166da..216e04e98b 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -1903,6 +1903,7 @@ menu "Networking"
>>>   	source "package/rtmpdump/Config.in"
>>>   	source "package/siproxd/Config.in"
>>>   	source "package/slirp/Config.in"
>>> +	source "package/slirp4netns/Config.in"
>>>   	source "package/snmppp/Config.in"
>>>   	source "package/sofia-sip/Config.in"
>>>   	source "package/sysrepo/Config.in"
>>> diff --git a/package/slirp4netns/Config.in b/package/slirp4netns/Config.in
>>> new file mode 100644
>>> index 0000000000..22414dfbc9
>>> --- /dev/null
>>> +++ b/package/slirp4netns/Config.in
>>> @@ -0,0 +1,20 @@
>>> +config BR2_PACKAGE_SLIRP4NETNS
>>> +	bool "slirp4netns"
>>> +	depends on BR2_USE_MMU # libcap, libglib2, slirp
>>> +	depends on BR2_USE_WCHAR # libglib2, slirp
>>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, slirp
>>> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
>>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
>>> +	select BR2_PACKAGE_LIBCAP
>>> +	select BR2_PACKAGE_LIBGLIB2
>>> +	select BR2_PACKAGE_LIBSECCOMP
>>> +	select BR2_PACKAGE_SLIRP
>>> +	help
>>> +	  User-mode networking for unprivileged network namespaces.
>>> +
>>> +	  https://github.com/rootless-containers/slirp4netns
>>> +
>>> +comment "slirp4netns needs a toolchain w/ wchar, threads, headers >= 3.17"
>>> +	depends on BR2_USE_MMU
>>> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
>>> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
>>> diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
>>> new file mode 100644
>>> index 0000000000..e3115c1be0
>>> --- /dev/null
>>> +++ b/package/slirp4netns/slirp4netns.hash
>>> @@ -0,0 +1,3 @@
>>> +# Locally computed:
>>> +sha256  b584edde686d3cfbac210cbdb93c4b0ba5d8cc0a6a4d92b9dfc3c5baec99c727  slirp4netns-1.2.0.tar.gz
>>> +sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
>>> diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
>>> new file mode 100644
>>> index 0000000000..7ff594cc44
>>> --- /dev/null
>>> +++ b/package/slirp4netns/slirp4netns.mk
>>> @@ -0,0 +1,15 @@
>>> +################################################################################
>>> +#
>>> +# slirp4netns
>>> +#
>>> +################################################################################
>>> +
>>> +SLIRP4NETNS_VERSION = 1.2.0
>>> +SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
>>> +SLIRP4NETNS_LICENSE = GPL-2.0
>>> +SLIRP4NETNS_LICENSE_FILES = COPYING
>>> +SLIRP4NETNS_DEPENDENCIES = libcap libglib2 libseccomp slirp
>>> +
>>> +SLIRP4NETNS_AUTORECONF = YES
>>> +
>>> +$(eval $(autotools-package))
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
