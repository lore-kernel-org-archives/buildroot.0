Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ED4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 19:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EF760F6B
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 19:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69EF760F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEC814040C;
	Thu, 23 Sep 2021 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NaVCvH1Fcqb; Thu, 23 Sep 2021 19:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4306040201;
	Thu, 23 Sep 2021 19:39:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23B1C1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 19:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 114F240201
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 19:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwKrB3_eDyAs for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 19:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38125400B5
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 19:39:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y89so16238262ede.2
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 12:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NzskM8+iihE5MTUQ6a1M7q8CHxCXKzwC0UF4rvupNu4=;
 b=FQ5+r+bAnd+F6b6cjdl0QDz5rje5Nu4/Dyc2Fnp3h56MPr0P9T2znOWmqens9OryKe
 bvL8DwBVKG9q6xFhAPHb1emfM6FKCXZQ+6BMr76a2Mdsr4Y2nbovNA0gitPs9vem7kv5
 Ywlgri/wbsOer153N7qXRsaL/vtzKXm1WXeo/iNEzlGb2QOMZJHtNg0N/YsMN9Gzrv1Q
 dAg1D/pOVfwzEybboFGLxy1BUuv+D5WxOYg04ZPW9kaJ/hzpVRmCVttxqXu6eAfVQNzu
 uMpsiOkBV0ShezfBo2s+FpNrapuXurmqU6Xh3sBD87Lzg/KyxJCf/7SXy2Krr9wPx1fV
 7pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NzskM8+iihE5MTUQ6a1M7q8CHxCXKzwC0UF4rvupNu4=;
 b=fXu/Y+xJ/oYL8tQzK6Ex4XaMo+8Un2OPndJMAh37odI/V3SadynMXqTUv9dVLDE08b
 b8viXy/DLzKbwgoSwAKEbzM37EY4NQ8MNgvfCFhu2/6pJ1+q47+9kAOu3OXuL3zUOLww
 ruUwTkRU4CO07xIlaUUldSBOl2NFG78sgw08ggrHcLcJkJqHJ9Z/EFDQvhpWcAtcmbVi
 RBVvljJkw1bg1zOvoPtxdIDkTshZVCpHxYsopLgPvLVMuRk+1N4XvqxMa/xXAOLPXzLX
 USkpvRAHAOwXt/JHPU0U69bmfWdGSCNnvTXRrP0fRgSGs+GZ+V7dYzfFuupHGGPzSQUq
 r/1Q==
X-Gm-Message-State: AOAM533+Z++opvq6vvkfH99rSzqXVhs939M8yJALmmrAHGfHcHi38Tws
 xLfZRd00GsMv3rV/syTK9IaDug==
X-Google-Smtp-Source: ABdhPJwCF8PzWweOLWUk1BJWtZoHi22NEYWRsO7n4Dqk8lYO+wMFO3jZm67vsgNlfupDSZ9GaUOCnA==
X-Received: by 2002:a50:da8f:: with SMTP id q15mr590728edj.139.1632425990217; 
 Thu, 23 Sep 2021 12:39:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bc4sm4172175edb.18.2021.09.23.12.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 12:39:49 -0700 (PDT)
Message-ID: <1f3c7f9b-4edc-5929-e29c-1536de3bfd5c@mind.be>
Date: Thu, 23 Sep 2021 21:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210923183751.361386-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210923183751.361386-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-attrs: remove
 _next_gen.py on python2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 23/09/2021 20:37, Asaf Kahlon wrote:
> The _next_gen.py file contains python 3.6+ API and it's not
> useable with python 2.
> In addition, this file is imported on __init__.py only after
> checking the version of python is above 3.6, so we can safely
> remove it.

  Although this solution is OK, I expect it's only a matter of time before attrs 
drops python2 support anyway. So I'd bite the bullet and simply make it depend 
on python3.

  We're anyway not going to keep python2 around for too long any more, so 
progressively dropping python2 support in packages seems like a good idea.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.net/results/5774c6237b72b6f5e005bb5b229c078235ff2741/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>   package/python-attrs/python-attrs.mk | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
> index b99a98501c..f23cabd998 100644
> --- a/package/python-attrs/python-attrs.mk
> +++ b/package/python-attrs/python-attrs.mk
> @@ -11,4 +11,13 @@ PYTHON_ATTRS_SETUP_TYPE = setuptools
>   PYTHON_ATTRS_LICENSE = MIT
>   PYTHON_ATTRS_LICENSE_FILES = LICENSE
>   
> +# _next_gen is usable only on python 3.6+ and it's not imported
> +# on __init__.py in case lower version of python is used.
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +define PYTHON_ATTRS_REMOVE_NEXT_GEN
> +        $(RM) $(@D)/src/attr/_next_gen.py
> +endef
> +PYTHON_ATTRS_POST_PATCH_HOOKS += PYTHON_ATTRS_REMOVE_NEXT_GEN
> +endif
> +
>   $(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
