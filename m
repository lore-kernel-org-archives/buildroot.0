Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FD5C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A86261793;
	Thu,  9 Mar 2023 20:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A86261793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amZOtbPLNfoJ; Thu,  9 Mar 2023 20:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CA261795;
	Thu,  9 Mar 2023 20:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50CA261795
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F04AB1BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C95F4418EB
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C95F4418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmie0wj8fYL1 for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:24:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E1F418E7
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4E1F418E7
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:24:38 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i34so11914995eda.7
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678393477;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ja445wT1wDDQpqTe8+7Fpy+rLIYrfbKpurGSr+EWC24=;
 b=qv0e7iJ3tbN4yy/20HqScAvIsYPnN+nM3e4ICNEAj3BYoQH4pMveU/khlQW5Ab+imF
 p9mpL5eOGeSZXql6FMHnCH9b4DINWQNyr0sdQSdjELB640diwZKqCyBK3GgwSDIp+bB9
 voNrlQ86GVewRqdygvOjph8vHsQpgoZSYiZUL0n4cLkFNdAALlUIIa1zRe4Sk+3hsuUA
 /cYGYDnM+sjp3fGVi/UoK/YauN6fZVsG52wi62DWBCHHj+o6VjGPeom8gD9YEc9PY3uz
 EWCGwvBjR+ihBwuYcPxTLUUh9Q97QqQXxCPqe6h4qqOhS7fRIrb8rWfXiMaLeKKhfzhz
 tz7A==
X-Gm-Message-State: AO0yUKWd4BoTm8ZPQvf32q6uqrqNxUFS+Gj1cT81hkbtMpVBgJ60YV/8
 NVLXOooRCSUOgW2FwjcVoQI7iNI/Kvmlr5zrYIM=
X-Google-Smtp-Source: AK7set+CGlCQ8SdVsxO2yz5j4lGHPOzJh956byXlbQwQ8r4Z/QN0EBG0J5DPBMyTPnjZhRUaB3iV8g==
X-Received: by 2002:a17:906:cccf:b0:870:94e:13f9 with SMTP id
 ot15-20020a170906cccf00b00870094e13f9mr22407861ejb.0.1678393476800; 
 Thu, 09 Mar 2023 12:24:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a17090636c900b008c801141d58sm9269161ejc.109.2023.03.09.12.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:24:36 -0800 (PST)
Message-ID: <4f8f9633-0338-f21c-0ec0-078bf8dcff31@mind.be>
Date: Thu, 9 Mar 2023 21:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230227214220.12101-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230227214220.12101-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678393477;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ja445wT1wDDQpqTe8+7Fpy+rLIYrfbKpurGSr+EWC24=;
 b=bXzYGmPGn28db7ggo+5EOIgX3FX8wcMbOoUk3Kcw/s6BhveuTbwHPbT8JD9D39W2sC
 NSMrF+YdtEkZgqDqX2MfJDkqBrt+R0wO1Et081Et00sBW8/J7R7gEZtfj8ZeJZfmOMK4
 URdFPWSwJ8A3Wv8uoLQ6sj8U4hP51lVivhKEIxEMx3SXPKGQlQq1bqOBBk760HA6UrrB
 OSmYnPGLHICB+WajkHKkqrWut7cFxSWdengAdpCUljRCYmRMg1w0NRBE1xaZIBvFWS9v
 Hm6P2Ld5Ki7n6o8TB6o2RYLxw4UpDFx49msfbALFXLx9scpeIRJl65ewYbe4ZUazwAeV
 K8ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bXzYGmPG
Subject: Re: [Buildroot] [PATCH v1 1/2] package/speechd: fix libltdl
 enable/disable configure option
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/02/2023 22:42, Peter Seiderer wrote:
> - libltdl usage is configured by --disable/enable-ltdl (see configure.ac
>    'AC_ARG_ENABLE([ltdl], [...])')
> 
> Fixes:
> 
>    configure: WARNING: unrecognized options: [...] --with-libltdl
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/speechd/speechd.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
> index ec62980986..b545863035 100644
> --- a/package/speechd/speechd.mk
> +++ b/package/speechd/speechd.mk
> @@ -24,9 +24,9 @@ SPEECHD_PRE_CONFIGURE_HOOKS += SPEECHD_TOUCH_CONFIG_RPATH
>   
>   ifeq ($(BR2_PACKAGE_LIBTOOL),y)
>   SPEECHD_DEPENDENCIES += libtool
> -SPEECHD_CONF_OPTS += --with-libltdl
> +SPEECHD_CONF_OPTS += --enable-ltdl
>   else
> -SPEECHD_CONF_OPTS += --without-libltdl
> +SPEECHD_CONF_OPTS += --disable-ltdl
>   endif
>   
>   define SPEECHD_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
