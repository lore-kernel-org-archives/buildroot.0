Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFBDCDB474
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 07:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51AFC40158;
	Mon, 23 Oct 2023 07:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51AFC40158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oh5nKJHuGifZ; Mon, 23 Oct 2023 07:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D52840CBF;
	Mon, 23 Oct 2023 07:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D52840CBF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B45081BF41D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 07:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C95C80BCC
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 07:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C95C80BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqHs2agf4TTZ for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 07:45:13 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAABB812A1
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 07:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAABB812A1
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99357737980so468117166b.2
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 00:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698047111; x=1698651911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtZtPUqi7aOSFFGlPdYPkfefWZldgq6XJhYyLBR1EEw=;
 b=ecgI2rkbgZwTPxmy9UpxIIGxLCyPWFV83j/2qNtpr/5TeAifK6gDgT+mvqp5Wi8O89
 SWYoSgil7tL9pg0vp6AcE152dUmLsSrlqq2Fd1vyaBIGetRSUS97Wqes/McfKLUeVPWa
 NN2R8YaLcJRDiP/+wV70UeLnynQOQM+GwC65hl4gtqcryRuHCw4YhdNj6s1ALDdv0l5C
 w8FxniJ1Vg+lIksnYM4nlmpWWGnUerl/Q3pzytn/otYl1ievnh0jExqHFBW+qzd8DOQU
 yok4oOJ60Z5s6cUTnIUvL8lm4NTM+iZsUuiZF7rVEN9SzwMSL/deME/cPmYPfnX61hvl
 6mhw==
X-Gm-Message-State: AOJu0YzuywFvaHmlqW9Y2nDgEx/nX66B9DHWjYPcRNIGzDND6zGPeznb
 M6zsUtg96nDtFAJZvLAbEu/d/w==
X-Google-Smtp-Source: AGHT+IEhtDV1zFfGqVzttehM/B/yCuJ/F/eQxrPYSd30rlUSxOC621arxl83yqz0mcZishANECRy9w==
X-Received: by 2002:a17:907:70e:b0:9ae:5270:46d5 with SMTP id
 xb14-20020a170907070e00b009ae527046d5mr5776056ejb.73.1698047110782; 
 Mon, 23 Oct 2023 00:45:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a170906261900b0099293cdbc98sm6326871ejc.145.2023.10.23.00.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 00:45:09 -0700 (PDT)
Message-ID: <93a0d852-000b-d36e-df54-e7aab3cc3a6a@mind.be>
Date: Mon, 23 Oct 2023 09:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231018141155.533944-1-vfazio@gmail.com>
 <fc416325-98e6-04e2-6ea9-e48053c2c302@mind.be> <20231021202525.GD2607@scaer>
 <20231021203618.GE2607@scaer>
In-Reply-To: <20231021203618.GE2607@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1698047111; x=1698651911; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BtZtPUqi7aOSFFGlPdYPkfefWZldgq6XJhYyLBR1EEw=;
 b=R/+a10RcJUidh/cZzgryCYvp6VL4nJrwZVe9kkLMdxZiyNa73fRE3pSKRPD4HN3+0V
 svj28Pno+TanwIkOa3lf/OUOskg2lDKtyptLqDAodZywDJELgIHMZE2BfPpCd4TqxeTo
 KGnO6OazKfnNjpU4gAOjfplD9qrYAjNnRWg0JRp4GgxM4WY1g1EiOqZyZM0F8SLe+smF
 avITND5+/OVbB4Ym8/QNEpsJXqXWV0ni5TD4K/gZcbGzZTbgbhKcLng/qBsYHG6vJgsQ
 UmrLZ/irBSxnBTxWZ4n+se8+hqrixT9unb7vHFoL8WMPIhKRU7z90ue4UeRWZSLK/gdK
 WSvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R/+a10Rc
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies: bump minimal tar
 version to 1.35
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/10/2023 22:36, Yann E. MORIN wrote:
> Vincent, Arnout, All,
> 
> On 2023-10-21 22:25 +0200, Yann E. MORIN spake thusly:
>> On 2023-10-18 19:43 +0200, Arnout Vandecappelle via buildroot spake thusly:
>>> On 18/10/2023 16:11, Vincent Fazio wrote:
>>>> GNU tar 1.35 includes a breaking change [0] that changes the tar header
>>>> created for each regular file even for "stable" formats like pax (which
>>>> we use in support/download/helpers::mk_tar_gz).
> [--SNIP--]
>>>> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>>>> index e5cd83d859..d33eb2d811 100644
>>>> --- a/package/pkg-download.mk
>>>> +++ b/package/pkg-download.mk
>>>> @@ -20,8 +20,8 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>>>>   # Version of the format of the archives we generate in the corresponding
>>>>   # download backend:
>>>> -BR_FMT_VERSION_git = -br1
>>>> -BR_FMT_VERSION_svn = -br3
>>>> +BR_FMT_VERSION_git = -br2
>>>> +BR_FMT_VERSION_svn = -br4
>>>   Vendored cargo and go packages will have the same issue, no? Those will
>>> need to be updated as well...
>> Good catch, indeed. I'll try and resurect my patch to add a -br suffix
>> to those...
> 
> I think it was basically just that:
> 
>       b/package/pkg-download.mk |    1     1     0     0 +
>       b/package/pkg-utils.mk    |    2     1     1     0 +-
>       2 files changed, 2 insertions(+), 1 deletion(-)
> 
>      diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>      index e5cd83d859..5ad3f2baaf 100644
>      --- a/package/pkg-download.mk
>      +++ b/package/pkg-download.mk
>      @@ -22,6 +22,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>       # download backend:
>       BR_FMT_VERSION_git = -br1
>       BR_FMT_VERSION_svn = -br3
>      +BR_FMT_VERSION_cargo = -cargo1
> 
>       DL_WRAPPER = support/download/dl-wrapper
> 
>      diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>      index 7c670ee615..95a8452db8 100644
>      --- a/package/pkg-utils.mk
>      +++ b/package/pkg-utils.mk
>      @@ -48,7 +48,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
>       # Helper to build the extension for a package archive, based on various
>       # conditions.
>       # $(1): upper-case package name
>      -pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD)).tar.gz
>      +pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS)).tar.gz

  When POST_PROCESS is used, the SITE_METHOD is not actually relevant (we don't 
actually make a tarball of the git, or at least we don't hash it). So maybe:

pkg_source_ext = $(or 
$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS)),$(BR_FMT_VERSION_$($(1)_SITE_METHOD))).tar.gz


  Then we an also make BR_FMT_VERSION_cargo = -br4 (not -br1 or -br3 to avoid 
conflict with already existing git or svn based tarballs).

  Regards,
  Arnout

> 
>       # Define extractors for different archive suffixes
>       INFLATE.bz2  = $(BZCAT)
> 
> Toally untested.
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
