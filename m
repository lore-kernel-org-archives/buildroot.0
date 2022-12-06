Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAD7C4708C
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 18:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D911C6103B;
	Tue,  6 Dec 2022 18:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D911C6103B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ivaPWYRGPcs; Tue,  6 Dec 2022 18:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B8161023;
	Tue,  6 Dec 2022 18:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B8161023
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA0251BF306
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 18:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90DFB81E4B
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 18:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DFB81E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXoxZH31hotx for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 18:20:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40AEA81E08
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40AEA81E08
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 18:20:25 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id d20so21550366edn.0
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 10:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nbp+vtHkMW6JD+y/d7gOigA1wc2pJPiCOTWBKRVbznI=;
 b=L1NXI1nRL1+aMY4W8qX8I15ded0jjvePePk6Mnk0UBDuORNOXaSiC3DBiDkoEgPeZU
 ULphZblOA7P+zfTPwhszWGCDINweepUZ+9DcKGvi3jFWHslEi2GrCMOe4I4SyE67C7QH
 FOICsSvCsk8dWC1UAdvB9uofTADg5uQcY8dxgpZmX60gGX7xKJ6XrSWgt78BRXbqo1wF
 PCAKBCyCZUqaI416HwGKgpKAuoSSMistAt09VftdA6NrL4eWnjK1H4KNSNi2r9uttgY6
 m1gRDQS7UZy7qnJQSu/nPZZqM/eqW+U3Vz9dcz+SmN4g4E9fJZMpRAPLCG9hRpG598pF
 pOAw==
X-Gm-Message-State: ANoB5plB8H9G+9PXju2LIWoxnMfwF123LI6hLmH29O931HajYIg+HAxv
 icRsncQG+yEiRQv6XAN0Lic=
X-Google-Smtp-Source: AA0mqf4/WfgQ6lQrMxD9QlvqgTh3alu36tSjlLx+lA8QAbOlls+w4GDVx1x4sqU2izOgNRAW7imXIg==
X-Received: by 2002:a05:6402:360a:b0:469:f59f:352e with SMTP id
 el10-20020a056402360a00b00469f59f352emr58486136edb.241.1670350823381; 
 Tue, 06 Dec 2022 10:20:23 -0800 (PST)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a0564021f0b00b00461816beef9sm1277348edb.14.2022.12.06.10.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 10:20:22 -0800 (PST)
Message-ID: <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
Date: Tue, 6 Dec 2022 19:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
 <20221205215558.GI2855@scaer>
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20221205215558.GI2855@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nbp+vtHkMW6JD+y/d7gOigA1wc2pJPiCOTWBKRVbznI=;
 b=iWwx/V4sM+eOpBYpUy/psreWv1WG19WL+X1TbmNx9rP/MZGuW6AwsYSenwWb6GZtcK
 UGKWjk7Ud0lhGI6A3pIbanVMI50m01sN0YAAHdDykulSyte+mU2P0Xc4kTEaf0QQMe4B
 6F5mRmYQ9fXyW+XEqaZ/3KidiTZk0n3aO0CEXD7W4/m21G670GGOyPGpI6YTQA3oeqvq
 CrEL81rlOW+aPVYY0AlIgm5bX/N/R6ER1ehAaOkbZHEGqJbo+PjDgYcqoHNiWf1k7xoe
 Z0UjP3rJsV1Eermn9XRXf5bfyoDtdxD+5LqhUkq7OHBUVUMZ0zoQq8tIPZgiEA6/zzj9
 nN5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iWwx/V4s
Subject: Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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

Thanks for your review, again. I will create a new patch and add Nicolas 
to the CC.

Regards,
Raphael Pavlidis

On 05.12.22 22:55, Yann E. MORIN wrote:
> Raphael, All,
> 
> On 2022-10-13 18:34 +0200, Raphael Pavlidis spake thusly:
>> shadow provides utilities to deal with user accounts.
>>
>> The shadow package includes the necessary programs for converting UNIX
>> password files to the shadow password format, plus programs for managing
>> user and group accounts. Especially it is useful if rootless podman
>> container should be used, which requires newuidmap and newgidmap.
>>
>> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> 
> I was about to apply this, after fixing the minor issues (see below),
> but there is a rather major blocker, see below too...
> 
>> ---
> [--SNIP--]
>> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
>> new file mode 100644
>> index 0000000000..6b1fe0a61f
>> --- /dev/null
>> +++ b/package/shadow/Config.in
>> @@ -0,0 +1,61 @@
> [--SNIP--]
>> +config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
>> +	bool "account-tools-setuid"
>> +	depends on BR2_USE_MMU  # linux-pam
>> +	depends on BR2_ENABLE_LOCALE  # linux-pam
>> +	depends on BR2_USE_WCHAR  # linux-pam
>> +	depends on !BR2_STATIC_LIBS  # linux-pam
>> +	select BR2_PACKAGE_LINUX_PAM
>> +	help
>> +	  Install the user and group management tools (e.g. groupadd) with setuid and
> 
>      $ make check-package
>      package/shadow/Config.in:24: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
> 
> [--SNIP--]
>> +config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
>> +	bool "subordinate-ids"
>> +	help
>> +	  Support subordinate ids. Helpful to use container solution like podman
> 
>      $ make check-package
>      package/shadow/Config.in:39: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
> 
> [--SNIP--]
>> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
>> new file mode 100644
>> index 0000000000..261f28dd28
>> --- /dev/null
>> +++ b/package/shadow/shadow.mk
>> @@ -0,0 +1,133 @@
>> +################################################################################
>> +#
>> +# shadow
>> +#
>> +################################################################################
>> +
>> +SHADOW_VERSION = 4.11.1
> 
> Why 4.11.1? It was released in 2022-01-03, and is affected by
> CVE-2013-4235, with version 4.12.2 being the first to include the fix
> for it, and there is now 4.13:
> 
>      https://www.cve.org/CVERecord?id=CVE-2013-4235
>      https://github.com/shadow-maint/shadow/releases/tag/4.12.2
>      https://github.com/shadow-maint/shadow/pull/545
> 
>> +SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/v$(SHADOW_VERSION)
>> +SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
>> +SHADOW_LICENSE = BSD-3-Clause
>> +SHADOW_LICENSE_FILES = COPYING
> 
> And:
> 
>      SHADOW_CPE_ID_VENDOR = debian
> 
> => https://nvd.nist.gov/products/cpe/detail/11DE0412-97D8-4ABC-9807-101628A40DBE?namingFormat=2.3&orderBy=CPEURI&keyword=shadow&status=FINAL
> 
>> +SHADOW_CONF_OPTS = \
>> +	--disable-man \
>> +    --without-btrfs \
>> +    --without-nscd \
>> +    --without-skey \
>> +    --without-sssd \
>> +    --without-su \
>> +    --without-tcb
> 
>      $ make check-package
>      package/shadow/shadow.mk:15: expected indent with tabs
>      package/shadow/shadow.mk:16: expected indent with tabs
>      package/shadow/shadow.mk:17: expected indent with tabs
>      package/shadow/shadow.mk:18: expected indent with tabs
>      package/shadow/shadow.mk:19: expected indent with tabs
>      package/shadow/shadow.mk:20: expected indent with tabs
> 
>> +ifeq ($(BR2_PACKAGE_SHADOW_SHADOWGRP),y)
>> +SHADOW_CONF_OPTS += --enable-shadowgrp
>> +else
>> +SHADOW_CONF_OPTS += --disable-shadowgrp
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
>> +SHADOW_CONF_OPTS += --enable-account-tools-setuid
>> +define SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS
> 
> This is named SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS, but [0]...
> 
>> +	/usr/sbin/chgpasswd f 4755 0 0 - - - - -
>> +	/usr/sbin/chpasswd f 4755 0 0 - - - - -
>> +	/usr/sbin/groupadd f 4755 0 0 - - - - -
>> +	/usr/sbin/groupdel f 4755 0 0 - - - - -
>> +	/usr/sbin/groupmod f 4755 0 0 - - - - -
>> +	/usr/sbin/newusers f 4755 0 0 - - - - -
>> +	/usr/sbin/useradd f 4755 0 0 - - - - -
>> +	/usr/sbin/usermod f 4755 0 0 - - - - -
> 
> What about userdel?
> 
> [--SNIP--]
>> +define SHADOW_PERMISSIONS
>> +	/usr/bin/chage f 4755 0 0 - - - - -
>> +	/usr/bin/chfn f 4755 0 0 - - - - -
>> +	/usr/bin/chsh f 4755 0 0 - - - - -
>> +	/usr/bin/expiry f 4755 0 0 - - - - -
>> +	/usr/bin/gpasswd f 4755 0 0 - - - - -
>> +	/usr/bin/newgrp f 4755 0 0 - - - - -
>> +	/usr/bin/passwd f 4755 0 0 - - - - -
>> +	$(SHADOW_ACCOUNT_TOOLS_SETUID)
> 
> ... [0] here the expansion uses the wrong name...
> 
> So, I had fixed all the minor issues, but the version bump will require
> a bit more testing that I can do locally. Nicolas (in Cc) who reviewed
> this patch, said he had a runtime test; maybe you can both sync to get
> that test part of the series when you respin?
> 
> Regards,
> Yann E. MORIN.
> 
>> +	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
>> +endef
>> +
>> +$(eval $(autotools-package))
>> -- 
>> 2.35.1
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
