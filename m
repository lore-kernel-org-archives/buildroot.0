Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F24EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:28:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EF36109F
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48EF36109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226F2840FE;
	Wed,  6 Oct 2021 19:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3Pox1CaMKtH; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671B184100;
	Wed,  6 Oct 2021 19:28:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDCAC1BF9B6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9F5A60F28
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_Ra6E4Ar2CQ for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:28:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7BB960F25
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:28:10 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id dj4so13878159edb.5
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a1dw+gg50+kTE7r/FJ8fwn4PJeX7wHNKzH1Mi3js2Ho=;
 b=Mpys7rbN+fcD6tO1vBMojVDTfqu+bcIQ4Pqmm/+19LGkfVzRZmyuWPc4/z1YBwuQxA
 bOmxtfr0Y/yy6Kv+lhFEsA9NKLl/Q6o9Nd3Szvo+QYoVT2hQiFKb2OpYIBYCH1hd6Qb2
 yhSQGglD1JXBUVOuOcvp2kwDeW3GrgFi5EAL7KXzCO/haJg/Y95tCP8+Sh0Qk6x7kKzK
 MUSzRTQh6b+2/aZCr1dPWhEneRWaqeMIL5Q8BWN4sDJX7/puX0zlpxTFgGqJ5/F4Kl1J
 T2cDj3CUt0zNf+HSphZfUGKUx0jCihSVur4wW6afTLsi6rCgV9BKI8OVXd3ayW4AYHmu
 s6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a1dw+gg50+kTE7r/FJ8fwn4PJeX7wHNKzH1Mi3js2Ho=;
 b=VcrwQ1KN6VrLWa1pcReoJSXeifV3Pg+U3m7oPy9qkz/rPiOH0oM9EoxNI/XI2DtvNc
 Jp3KSeHNPf9OECozUt4f1f1CwQP5+xz3aBkVXEuOtuZuE4t7RuXQFx2rw0ROcR9c5ASE
 wRoONLIs1WQTWviVt7o44fgdPuyijxtuSX4R2Fr8ElElhFf0TmIlclha4UF/l/Cg/snl
 UUIkzr4FlyUhRrh66C0+1Awzmjqj0xX0/3lQf4aWDRxnuLGtOmE8hzrmWBzp+/ntfs39
 7tGgbmA2e2itE+0TlucMXibvMUKNhGXggRznQvho2YOSDurVf/3hX2wslOpynjkZE6L9
 x8Ag==
X-Gm-Message-State: AOAM533nkvI1jMi5L/d08z/Vw2PMmewxuBlzZQURZGWDHcjbr6JMuym0
 9X0fBoEoF9Ixjkb/lxlm0D5KqEh2r9ap9H5I
X-Google-Smtp-Source: ABdhPJyZiEBg+m9EhLwDFiG1tJKfdcp/hfdAZRYGo/f4Z2i8/sdR1pSQe94D85S+gh0bBIw9MvrvbA==
X-Received: by 2002:a17:906:1553:: with SMTP id
 c19mr71761ejd.266.1633548489017; 
 Wed, 06 Oct 2021 12:28:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s3sm9440815ejm.49.2021.10.06.12.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:28:08 -0700 (PDT)
Message-ID: <ca569822-bede-32ed-5a31-bde21ac75b0b@mind.be>
Date: Wed, 6 Oct 2021 21:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210924160345.1994773-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210924160345.1994773-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/log4cxx: fix build without wchar
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2021 18:03, Fabrice Fontaine wrote:
> Fix the following build failure without wchar raised since bump to
> version 0.12.0 in commit 83a0e8dea203dc37c6c207a36b3f46160578dcc2:
> 
> /home/buildroot/autobuild/instance-0/output-1/build/log4cxx-0.12.0/src/main/include/log4cxx/helpers/transcoder.h:113:33: error: 'wstring' in namespace 'std' does not name a type
>    113 |   static void decode(const std::wstring& src, LogString& dst);
>        |                                 ^~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/7d0297b071df06bc312b9927396021aa6fe401f4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/log4cxx/log4cxx.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index 49f4667a9a..8a7ca8ef17 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -21,4 +21,10 @@ ifeq ($(BR2_PACKAGE_LIBESMTP),y)
>   LOG4CXX_DEPENDENCIES += libesmtp
>   endif
>   
> +ifeq ($(BR2_USE_WCHAR),y)
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=ON
> +else
> +LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=OFF
> +endif
> +
>   $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
