Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4181C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8023861050
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8023861050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5507183ADE;
	Thu,  5 Aug 2021 14:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03yRniqddk2h; Thu,  5 Aug 2021 14:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955E483ACF;
	Thu,  5 Aug 2021 14:54:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25C661BF44C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1408B404BF
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 640Dmr43i8pj for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 14:54:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5E19404C9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 14:54:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id k9so8779434edr.10
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FKglIc6OtYKXcWwMfpRkbd89GIR1uzflz9l9AC7vjbM=;
 b=DOKPmWENezLe9OUa3pNUORQEgOJJj8rOPfyBd8SS1BwCOAsvi8MVMrs/W4+dYmWwkH
 mH39y+gnu47MknFKBDP+HlIH0h6c4oFCdztCmL9QlD5PwqoVzkeKTlydMgbQuAHKC2VR
 yOTkOz77jDF1g+Fma3ns47m0e8FSQyH2rc0uSamUyQUL6nMSHwk5fnj05wDth9dQlBA5
 RjNQee204+bruoOyME8y5Wv6lUyXsCZUBSe6ez9WjrO+9zyN/hoJHRjUB3TkhU9iq++L
 yw+UOHx4Bt9d8xbGvTzw3RRIDeIVIyfs0i1WM3e8W6Z91BiR252Vm/ipJr8pORleCera
 t7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FKglIc6OtYKXcWwMfpRkbd89GIR1uzflz9l9AC7vjbM=;
 b=mPPibwScgvs0wz6trnlMlLudmui0plkah0ZSNuvvFtSbmrfGcj1iq5bkFNcSwyCW82
 3QozftQJmlCAMa7ALzlkXcEDbzl+VFKH9bjVo6fDR17Yk7HMoojalWaBx6mr4mEfMv9o
 za/m6sbA6z3ok7A4TL2siTKLIgD8/3X8uwLTD6K0MuTR63gF6eIdPWL8+B+4BPKFnA7J
 RgM+ni/FNFfu9tAGAhOepcC8hifaSjpNoivBJerzjZ46fBPGMWj5SvQdhuzdOOLBcluv
 v7BeLwyUhcGaOv8AgvwtwA0eJnTqsb7luF8x14wEjmTfQiiWLj6hK5tyWMImimFNZ3Qn
 vckA==
X-Gm-Message-State: AOAM530DSfO9ElFTj6jbdezBYedJm4kUqjY9vIijD2a3zL4eJiHS7Ad6
 K2423YbbgLAMOMjBELcimY9LEQ==
X-Google-Smtp-Source: ABdhPJy1+gwXawSdlG1terLAx+SmlO8EcrNrQl8+KT08bejxb4CmYYrp4rNUkHSzBz2QQkBrxzk9Nw==
X-Received: by 2002:aa7:ce08:: with SMTP id d8mr7249359edv.174.1628175245941; 
 Thu, 05 Aug 2021 07:54:05 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id ks26sm1792519ejb.58.2021.08.05.07.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 07:54:05 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805113609.2151894-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <2e92c225-5710-516a-c6f4-bf519fe73d1d@mind.be>
Date: Thu, 5 Aug 2021 16:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805113609.2151894-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmiutil: needs autoreconf
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
Cc: David Bachelart <david.bachelart@bbright.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 13:36, Fabrice Fontaine wrote:
> Build fails since bump to version 3.1.7 in commit
> 011f31ee244b7fe4621b3f69ca3d7e7b1cfdb5bb because ipmiutil
> unconditionally uses autoheader:
> 
> make[1]: Entering directory '/tmp/instance-4/output-1/build/ipmiutil-3.1.7'
> (CDPATH="${ZSH_VERSION+.}:" && cd . && autoheader)

 The problem is that aclocal.m4 is newer than config.h.in. It should be
sufficient to just touch config.h.in.

 Regards,
 Arnout

> /bin/bash: autoheader: command not found
> 
> So add back autoreconf
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2005af881726473f2cda176e90c1e41e4baea67c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipmiutil/ipmiutil.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
> index d85b9643f0..a12146062c 100644
> --- a/package/ipmiutil/ipmiutil.mk
> +++ b/package/ipmiutil/ipmiutil.mk
> @@ -8,6 +8,8 @@ IPMIUTIL_VERSION = 3.1.7
>  IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
>  IPMIUTIL_LICENSE = BSD-3-Clause
>  IPMIUTIL_LICENSE_FILES = COPYING
> +# needs autoheader
> +IPMIUTIL_AUTORECONF = YES
>  
>  IPMIUTIL_MAKE = $(MAKE1)
>  
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
