Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A394C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512A560F1C;
	Sat, 14 May 2022 09:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwv62MvpD0VH; Sat, 14 May 2022 09:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA1260F18;
	Sat, 14 May 2022 09:49:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0E641BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C04B483FA7
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFBrcFBXLADN for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:49:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD5AF83F9B
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:49:24 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y21so12623112edo.2
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6jgeGXnFgwkUK+rQmFbBK9PVhOs5m/Ho7msZ3J/dbYA=;
 b=OQ1kULTSERtwEhKZBPbJqFQpTW8yrJd3YvtV8xeXXELjmb54kTipXtSoC6weIxFZaK
 mWj7xvD3ySuw+c/VAV4zPawb5+QSQe/g67JBsNRVoR8+qWxvoA4gHlYd1s6wMmLQMpvz
 OHumk+bp5S7IuYOGz7nzZf3Q1acL5GaH2NwE3vvefVgrHyYzZeaaEknliJoxzaMF6kKB
 2jUsd7wPj77sfY10/omlf5475R0GwJUz1K4Ix2czA6h2VLJj59hILq0nhsnuvTAH8ULy
 CEsaukFQuiTqQiUDiuA5uqM5lWlfEHl49xGU1XnPQaddZITfVEqbvDtI8VVvI9eGkhLx
 +exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6jgeGXnFgwkUK+rQmFbBK9PVhOs5m/Ho7msZ3J/dbYA=;
 b=p4Vn+Zf6EoiHX8Evc5iwozWonoX7jHON77LmrrBdFcxyEOaT+UHjHkqHw/lcA2jIDt
 pQuq5ZP57yErXiRfIKNU4q8lzUMO6kWEAB4r9jp7eO1cJ3NJdcp8gjo9sp5/hoRX2W0y
 Q59Frjtq2JxVXt9NO7nfoY/3KBQcApnYXJWoMdppqxULj3rEnwREDnO3bafzi0mx9lcB
 vKHrx3DAQVm0u0ywdVHE8Mls/u7HgLPA20co0Q7hpQVc2Zrt85zoBU398BGMP0KKoaWZ
 CC2fhUcvjnjw1IgrrJd5PLmPY2rgXmBdh1U9jPEforfIATySsSC7Di9naosdhQrUnjkf
 PeHA==
X-Gm-Message-State: AOAM5306K6vEOdYohbajmEFs5G4z/vFPMAnk+iAt3mK1ZjOgn2NTD3p8
 k89e76CojJ2Uk3STBifEs7dh+A==
X-Google-Smtp-Source: ABdhPJxlhuCSdB8iaw83YnNvmvBRnSYngCcv+IPuWd1dwY7Wh9etCp/MseV4vWj5YwJ10cOVWLeuYA==
X-Received: by 2002:a05:6402:2811:b0:42a:570e:1915 with SMTP id
 h17-20020a056402281100b0042a570e1915mr2897179ede.93.1652521762994; 
 Sat, 14 May 2022 02:49:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a170907271b00b006f3ef214e12sm1568830ejk.120.2022.05.14.02.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:49:22 -0700 (PDT)
Message-ID: <3083e622-5e98-29a0-45f4-cb570f31390a@mind.be>
Date: Sat, 14 May 2022 11:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220512211713.2653126-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512211713.2653126-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pcsc-lite: link with -latomic
 if needed
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



On 12/05/2022 23:17, Fabrice Fontaine wrote:
> Link with -latomic if needed to avoid the following build failure since
> bump to version 1.9.6 in commit b02f13cd54912f3dffd0e0863378050104430d77
> and
> https://github.com/LudovicRousseau/PCSC/commit/d56ed18dbebc4423506ce7f61d3e3bcf4bdc4cb0:
> 
> /nvmedata/autobuild/instance-11/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: pcscd-readerfactory.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/80b2197a37073976a7dcec7b0f92dba1b26fb3f5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pcsc-lite/pcsc-lite.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
> index a5ff074b2c..5bf9ce7f30 100644
> --- a/package/pcsc-lite/pcsc-lite.mk
> +++ b/package/pcsc-lite/pcsc-lite.mk
> @@ -45,4 +45,8 @@ ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
>   PCSC_LITE_CONF_OPTS += --enable-embedded
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +PCSC_LITE_CONF_ENV += LIBS=-latomic
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
