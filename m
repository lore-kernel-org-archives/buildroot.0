Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41A1C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 366204023B;
	Thu, 11 Jan 2024 21:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 366204023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4nafE-Vh0szC; Thu, 11 Jan 2024 21:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42E43402DC;
	Thu, 11 Jan 2024 21:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E43402DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7551BF275
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEA67402DC
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 21:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEA67402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCgU5LMYiG4Z for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 21:10:50 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65BE14023B
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 21:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65BE14023B
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-337874b8164so820849f8f.2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 13:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705007448; x=1705612248;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDQ6Yis7SuPA6dgbQAtgZvGrv520+5bymMWly2iO2Og=;
 b=wB85YfL1s+EpBY3SM8jG6s29GWyIrm9ZfG2ficaAgNFfnYYltTpMRFphuAFOJEIl4k
 ME+E6Rmu1vEBHfK3AlE3dyM22CbaOFNX/ous+s/6+hu/uamcpVeEK/NDXmTiVCWNAZDT
 2M1vcTIcNmcQOUUvXclgkwHBLe43v90BkgKxIMMqaWep+EUBS0KWEhs4X/vNXuYj9Aw+
 +Cyq/RhOQcdm+88VnsFSo8i588eQgJk60Jg1ytkUszUbiH/isLenzzfnxGvfJiQcadso
 BV7uOGsWAIO2QSrgVemvo0H5LlmOMG529oAFQUSbOMXES/iqipX0k6b+Kq8M3XUkjcwZ
 swjA==
X-Gm-Message-State: AOJu0YyU1Fm4jDLfMCJc+73wkTf0cb0WhV/NZ8kR7jrTKxLngJIz8zZl
 PDkaIFuIM80Rop1od/pJlDQ7Eks7p8spdMi+r7EFJ0RyjXI=
X-Google-Smtp-Source: AGHT+IFu4YAmxi7vvN8zLzze43n0LKR92Za3TxjDyUcwDf2ATaXpxjzJW72gqWM+rM4fobZj5/DiLw==
X-Received: by 2002:a5d:6790:0:b0:336:6dad:2c71 with SMTP id
 v16-20020a5d6790000000b003366dad2c71mr207875wru.111.1705007448450; 
 Thu, 11 Jan 2024 13:10:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056000010300b0033776a50472sm2065241wrx.10.2024.01.11.13.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 13:10:47 -0800 (PST)
Message-ID: <d2672443-90dc-4e4f-b3d7-f592b8d26b0c@mind.be>
Date: Thu, 11 Jan 2024 22:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240111105621.2321957-1-peter@korsgaard.com>
In-Reply-To: <20240111105621.2321957-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1705007448; x=1705612248; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LDQ6Yis7SuPA6dgbQAtgZvGrv520+5bymMWly2iO2Og=;
 b=SIO5OEBuR7B8EVP+aNYLFCiJrlyHT0vl86iq0Gho+WO5GNdsTeD7qOnZRix5SCW68h
 RyvVjcr2Nx5orFGf+BmzNVNkoPlLIzYLfAL4jwIZkFjDh102tni5Rk7I/rdznLNjHbJc
 XQ2wnbNwIovq0wZ5sdPbD9wqafHxcNvUdS88QVc3g3/AHDxjYOO/H8BZ7bNBOYtiubBk
 H11JIwhGyXw/4HIYMwgrNIAnjfEhdnzHGzOuteRel46z+LLBOxLHRhasnnhYYTG5kHuf
 s6w1kFjDUBESTrjv0cpJ/AYPLWuD1PaQ2NaRgSB1s5zMyTOEIghKh8StsMOVCzWxhEGG
 50vQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SIO5OEBu
Subject: Re: [Buildroot] [PATCH 1/2] package/Makefile.in: set GIT_DIR=. in
 {HOST, TARGET}_MAKE_ENV
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 11:56, Peter Korsgaard wrote:
> A number of packages try to detect if they are running in a git repo and run
> git describe at build time instead of using the hard coded version number if
> it succeed, leading to odd version numbers as they end up picking up the
> Buildroot git version if building inside a Buildroot git checkout, E.G.:
> 
> rauc --version
> rauc 2023.11-562-g9c954953b4+
> 
> This is because rauc builds with meson and uses vcs_tag:
> 
> https://github.com/rauc/rauc/blob/v1.11/meson.build#L168-L171
> 
> https://mesonbuild.com/Reference-manual_functions.html#vcs_tag
> 
> Another example is micropython, where we already work around it by passing
> GIT_DIR=.
> 
> In the context of Buildroot the packages are never built in their own git
> checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
> directory tree and finds the Buildroot git repo, which fixes the rauc (and
> similar) issues.
> 
>>>> rauc 1.11 Building
> ..
> ninja: Entering directory `/home/peko/source/buildroot/output-rauc/build/rauc-1.11//build'
> [1/29] Generating version.h with a custom command
> fatal: not a git repository: '.'
> 
> cat output-rauc/build/rauc-1.11/build/version.h
>   #define PACKAGE_STRING "rauc 1.11"
> 
>   #define PACKAGE_VERSION "1.11"
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/Makefile.in | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 9fbe960759..3e276d23d6 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -263,7 +263,9 @@ export PERL=$(shell which perl)
>   # finds this perl module by exporting the proper value for PERL5LIB.
>   export PERL5LIB=$(HOST_DIR)/lib/perl
>   
> -TARGET_MAKE_ENV = PATH=$(BR_PATH)
> +TARGET_MAKE_ENV = \
> +	GIT_DIR=. \
> +	PATH=$(BR_PATH)

  There are a number of infras that don't use TARGET_MAKE_ENV: golang, luarocks, 
perl, and python. Of these, I think only golang has a big risk of having the 
same issue. So shouldn't we add it there as well? And perhaps to python as well.


  Regards,
  Arnout

>   
>   TARGET_CONFIGURE_OPTS = \
>   	$(TARGET_MAKE_ENV) \
> @@ -307,6 +309,7 @@ TARGET_CONFIGURE_OPTS = \
>   
>   
>   HOST_MAKE_ENV = \
> +	GIT_DIR=. \
>   	PATH=$(BR_PATH) \
>   	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>   	PKG_CONFIG_SYSROOT_DIR="/" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
