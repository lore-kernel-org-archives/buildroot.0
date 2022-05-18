Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5776BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151614035D;
	Wed, 18 May 2022 19:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3lgsFeNY3kW; Wed, 18 May 2022 19:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A293B40278;
	Wed, 18 May 2022 19:17:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3FAC1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B27C640198
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8bRUKZ7R0zi for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:16:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C600B40101
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:16:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id er5so4201109edb.12
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t/4yl7Acslf9wW1qphWEEIS/GK1c+aTLX6fovqGGh+c=;
 b=LUl4DYZvNaRgTxok6MK6et129GlnCqoknp0+xsMsETRd71ebBnDgGtjHdvAHSDlHkI
 +6GBEKRd9wo3bo/aSrWnwVI3ewNrLjWLcFx01VYTa+Hml959nKT8GV9onA0VYDsVNrZ/
 zks97JxR8A2ZQP3oJMaoC52A7Dp4y2aCLsW8cF4zi4l9uMhE2QSvo6M8OvNbwwMGaPDD
 e/G2ZtG5Dne5QH6PTlIthcXG+fnncMZMoEP2QtO8DutrfJfancVKYGo++0odj+Xihwzh
 DmPIGvUJK/KZOXBZHrshaKNEMYA8+AKSWaQIaieWWRoWnyAHxSIKAGrVWt2rli+kCv0c
 TWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t/4yl7Acslf9wW1qphWEEIS/GK1c+aTLX6fovqGGh+c=;
 b=hzvR3zqpErc1oCSQSPh3Ut7Y994Zj+VVkEoxBvfCUUwdUMNxjTFpC0kX2LzueLKC2I
 EHJKI08z/CJUudOIHYKSfBOa8n1WrIJHKlfhq+CSrNQnzf/Y3NCCqCW/BCnTp/bEq5PG
 9FbfQIUspKMREWfZX5j9Mg+U6M1Tna6HDfa0f+OUHrEpEOx3gnOGOK2v9KIzg7TkDrV6
 LytnOtVk9oRrlrcU1OknoF4xHkKgF94I8Xc9R3pFwbf8DJtCh8TfagaLJxVDQiR/qDs9
 xRC4CctfEruIPD222dWyI+SweNqjY0tmhX9FkUKOsnlGGBgkhrjE+X1PAwhSEUYSJxVH
 rygQ==
X-Gm-Message-State: AOAM532Un3kj9CRorCiMTcEPZCiVZ0FVAacU3yeBYB3CCsgbG5+J0HOr
 xWScFd2r6ZvdhyYifigANQd6FA==
X-Google-Smtp-Source: ABdhPJzy6n/uaAu1TdqSYPDvAkaiAC7P/9ycH8dk3Pa17VxJvsZe6wZH1q7HyyKJOA6PjdFEDtMGDA==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id
 g12-20020a056402090c00b00415d3404ae2mr1328187edz.331.1652901414052; 
 Wed, 18 May 2022 12:16:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a17090674d200b006f3ef214e42sm1282420ejl.168.2022.05.18.12.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:16:53 -0700 (PDT)
Message-ID: <15c79636-4e4b-0478-4f88-558d5d7bb5d9@mind.be>
Date: Wed, 18 May 2022 21:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220513215947.1454212-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220513215947.1454212-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: fix build with
 argp-standalone and NLS
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/05/2022 23:59, Fabrice Fontaine wrote:
> Fix the following build failure with argp-standalone and NLS raised
> since commit 5430c8fedd0392e79e0c011825b056fea129980a:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
> /home/buildroot/autobuild/instance-0/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'
> 
> [...]
> 
> configure: error: libargp not found
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f7ee27fb4c3253f351deee9867a3b98128f079af
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rng-tools/rng-tools.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index 8b195ea875..f736193a23 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -20,8 +20,8 @@ RNG_TOOLS_CONF_OPTS = --without-pkcs11
>   # Work around for uClibc or musl toolchains which lack argp_*()
>   # functions.
>   ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> -RNG_TOOLS_CONF_ENV += LIBS="-largp"
> -RNG_TOOLS_DEPENDENCIES += argp-standalone
> +RNG_TOOLS_CONF_ENV += LIBS="-largp $(TARGET_NLS_LIBS)"
> +RNG_TOOLS_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
