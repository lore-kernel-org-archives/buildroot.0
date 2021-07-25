Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5DDC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 09:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052C760E09
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 09:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 052C760E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C99F982848;
	Sun, 25 Jul 2021 09:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5eN0bZ-6m0M; Sun, 25 Jul 2021 09:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1867282BE7;
	Sun, 25 Jul 2021 09:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97EDF1BF398
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 09:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 877BC82BE7
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 09:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykjwCnNKM7Cn for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 09:36:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6860D82848
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 09:36:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jg2so5770491ejc.0
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B/KTC4RwqA1OtrEmd3oqCB4qBqDJjbjyLbif6miJfpA=;
 b=RndxfJXP6HiU0QDIxjaChexkiiOcHFua3Bq6m1Us+Vv282pHlR+CqsvL3BJ3WIi5W8
 /bp1FcyUI76+BZ+WGhlkGVMPMjaBr3oZ+yiqGalUKi93d5BmXHmpPN0NtibRB0Q/ALJN
 /FT+5ghVh+dVyF4FuGRyeRvraibZKk74mUxxnYy2d0djDw8+NyTHe4RWFME1IQo63b2P
 HNiv7n4bEq70sz7elnwnRp3nsXJFetpIgmutSJY1o3ZPOan8cNNKJP52JQ5uM+xu2b9L
 z61e9/7sqIKW6A37m9826f5xgs9SDBnpyLwQ9sQjsoee7xpV5MIAbotfkzOb6RhaQTF0
 713Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=B/KTC4RwqA1OtrEmd3oqCB4qBqDJjbjyLbif6miJfpA=;
 b=D+fy5k0KgtByDQ7FqX16uc41KHAtQdkUx6wpNS9QU9CbzQ9YP9pKqU11wID6fcSsAJ
 MqmnjyppjacVBKP3RUfTA8KSY5flnzMv7xEY6BHkwliRIVkb037Pt1RoXv1m7a7mnnG+
 Ui3gtyzdtDEc9yw5Y9IcqAAefZfbD8Iq85zEWHzYWpTgQWJZN7Gg+W3XN+kePOksiWxO
 ZUEY1osMP7q4jqqdoMG9bGPO1RtnuMJkWm0JPOP6cYxn77B41Ymd6zsFesUGsBTI1Eit
 krJXWqWainK9m0O6WISx/Lq0mHXQpLYyDT08YwB3ZqlWx0MPSZQWxJBIWQh5srYIRsvT
 ilEg==
X-Gm-Message-State: AOAM532q/7og6KfQeR3ihz8+jROPGxQcKX00wjcldrsk3mbygUEFZZB3
 grCoZws0735dCBq2Oa93D93WMg==
X-Google-Smtp-Source: ABdhPJzsbEw9bYEqvgg8lKm/CxL9y4FfM2mXCze5DVYU1f5VupF6iiP8UEtrOp/D1/0lf/4SooR3PA==
X-Received: by 2002:a05:6402:1768:: with SMTP id
 da8mr15292717edb.43.1627205772364; 
 Sun, 25 Jul 2021 02:36:12 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ee29sm17656305edb.39.2021.07.25.02.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 02:36:12 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210724214526.47637-1-arnout@mind.be>
 <20210724214526.47637-3-arnout@mind.be> <20210725075725.GP2382418@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <f3776222-ad4d-2d73-9bf7-a79b335d10f3@mind.be>
Date: Sun, 25 Jul 2021 11:36:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725075725.GP2382418@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4 3/3] package/armadillo: allows to select
 between clapack, lapack or openblas
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/07/2021 09:57, Yann E. MORIN wrote:
> Arnout, All, 
> 
> On 2021-07-24 23:45 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

[snip]
>> +config BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS
> 
> Note the option name here ^^^ [...]
> 
>> +	bool "use openblas"
>> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>> +	select BR2_PACKAGE_OPENBLAS
>> +	help
>> +	  Use OpenBLAS as BLAS library. Without this option, clapack or lapack
>> +	  will be used.
>> +
>> +endchoice
>> +
>> +endif
>> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
>> index 624b842ef6..82df7602be 100644
>> --- a/package/armadillo/armadillo.mk
>> +++ b/package/armadillo/armadillo.mk
>> @@ -7,11 +7,37 @@
>>  ARMADILLO_VERSION = 9.900.2
>>  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
>>  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
>> -ARMADILLO_DEPENDENCIES = clapack
>>  ARMADILLO_INSTALL_STAGING = YES
>>  ARMADILLO_LICENSE = Apache-2.0
>>  ARMADILLO_LICENSE_FILES = LICENSE.txt
>>  
>>  ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
>>  
>> +# blas support may be provided by lapack, clapack or openblas
>> +# blas library from (c)lapack is libblas.a, libopenblas.a otherwise
>> +ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
>> +ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
> 
> [...] so I guess you meant BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS here, no?

 See, that's why I resent this patch rather than just applying it :-)

 TBH I meant BR2_PACKAGE_ARMADILLO_OPENBLAS in Config.in, but it doesn't matter
much.

> 
>> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
>> +ARMADILLO_DEPENDENCIES = openblas
>> +else
>> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
>> +ifeq ($(BR2_PACKAGE_CLAPACK), y)
> 
> We don't usually add a space after the comma in an ifeq, especially in
> cases like this simple test.
> 
> Why duplicate the dependency on lapack/clapack in the !openblas case,
> when the same dependencies already exist, below?
> 
> I mean: in the !openblas case, we know that either lapack or clapack are
> enabled, so we know will hit either case in the block [...]
> 
>> +ARMADILLO_DEPENDENCIES = clapack
>> +else
>> +ARMADILLO_DEPENDENCIES = lapack
>> +endif
>> +endif
> 
> [...] here:
> 
>> +# lapack support may be provided by lapack or clapack
>> +# but not by openblas
>> +ifeq ($(BR2_PACKAGE_CLAPACK),y)
>> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
>> +ARMADILLO_DEPENDENCIES += clapack
>> +else ifeq ($(BR2_PACKAGE_LAPACK),y)
>> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
>> +ARMADILLO_DEPENDENCIES += lapack
>> +else
>> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=OFF
>> +endif
> 
> Additionally, this block will be hit even in the openblas case. Is this
> expected?

 Historical accident. This is reworked from v3 which had an explicit Config.in
option for the lapack choice

 I'll send a v5 which fixes it. I still want Gwenhael to confirm that it's good
in this shape though.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
