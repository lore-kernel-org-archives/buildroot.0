Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D70C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3FAC42042;
	Sun, 12 Dec 2021 14:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W33EPl4EnjOi; Sun, 12 Dec 2021 14:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A46041C99;
	Sun, 12 Dec 2021 14:49:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 813E61BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 781EA84B34
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2BQx8eV2HCD for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57CA684B2E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:49:50 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r25so43974133edq.7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vEjn0yzLsGSFw0NRjaHyEQulRpVg3rIrGuytkURJZqw=;
 b=Efl9vmmAUEToB4nXqhSg7I42XzUhl43UvUkhLHjV89D6RI8ha17IDMsdKjPEur4xY3
 UX3/uRQJ1vluorVapr2KSU1vzJJS62FWnLZBPX4L93Xs6AuEjhSSBWZ2tXkLMWcXyLcm
 NsSB6GVinjFaqvjTsnLCqQ1KKLx95DYHETOtuU1GI/4u6OGitoVob+9K0kE0VXB1nuMh
 1gEQXgA3jB+V5UZX9WnrpiEty8FxiQGur3tv/GlTl0gb53vUvE0AvmzyKwp99ksua/03
 Zx2NtAmt+M0wqnP84B7+Juk6WVjvC7qnoTCV9aQMvO1klQl2WbItuq0rAyBshNVoEJAp
 bzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vEjn0yzLsGSFw0NRjaHyEQulRpVg3rIrGuytkURJZqw=;
 b=TsxfrtnTVzYhThLiQNle5N279RIyu68z0nN4EHlc8E4Pbx3hX/SwhkmDXEIMqNzIkH
 7DhPrlNPXlI+6VaxSpGWkRfgDy2+DIqILRn32tPXuFmHb7OqTr6H9K4KwJwGc6CVsT3q
 oNzsDZLlI6qONFSW7XvwjD3fsG5w1AJwCcatDrmTzeadBler2aXphHKg4YbZxRJ0aq8c
 DZRQT1no0jPBz8SGHTPXGgN+K5HptZ1dLBONEYgy+LvBEWPKhITP+wAnJXftjvzLi+hb
 i4leSgtmSfJAApsNfmJoFX6L8YqtJ/sASAZF6eaOKLQzlQ/gjhE4OHzxHvF02aWlhJ/X
 EUpA==
X-Gm-Message-State: AOAM533Ww15zVYtYZYYpX01F3mOl6pArSd9sRZfJCNbtOfoXljfeHBG8
 HPeY7EfB25TAeQWlvAUdlFP/9hIw3GyldA==
X-Google-Smtp-Source: ABdhPJxE33fyeQ+occMD3HfeHWa3+t1Tf+NHgGaINOKrqSyBG3mXzshQtXZH8YPjbX/FELyqoPuwiQ==
X-Received: by 2002:a05:6402:1e93:: with SMTP id
 f19mr56592732edf.60.1639320588626; 
 Sun, 12 Dec 2021 06:49:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z25sm4482584ejd.80.2021.12.12.06.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:49:48 -0800 (PST)
Message-ID: <ab2a6950-fcaa-018b-33e7-3e0dc45998db@mind.be>
Date: Sun, 12 Dec 2021 15:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211205506.215848-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211205506.215848-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.40.0
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



On 11/12/2021 21:55, Fabrice Fontaine wrote:
> https://github.com/PurpleI2P/i2pd/releases/tag/2.40.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/i2pd/i2pd.hash | 4 ++--
>   package/i2pd/i2pd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
> index 4eceddba0a..99c474a2e5 100644
> --- a/package/i2pd/i2pd.hash
> +++ b/package/i2pd/i2pd.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/PurpleI2P/i2pd/releases/download/2.39.0/SHA512SUMS
> -sha512  6b38e6e2e763e94ffe9d11eb2f9a0e9554560bb4fec95891240adf5bc0a9639f879dac4ff3712a9f8e00895b7bbeabc854887e61fe9f9755c33f96899e20aa76  i2pd-2.39.0.tar.gz
> +# From https://github.com/PurpleI2P/i2pd/releases/download/2.40.0/SHA512SUMS
> +sha512  58d10417f3fd2c2fb427fb88b30ccd3e03053c84aa7ac6d3e346c388f2376d1768846bec5ee8d5134dd62d5712b20f890af11083634f94095b1117f6494c25fd  i2pd-2.40.0.tar.gz
>   # Locally computed:
>   sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
> diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
> index 348311277d..8eea09493f 100644
> --- a/package/i2pd/i2pd.mk
> +++ b/package/i2pd/i2pd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -I2PD_VERSION = 2.39.0
> +I2PD_VERSION = 2.40.0
>   I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
>   I2PD_LICENSE = BSD-3-Clause
>   I2PD_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
