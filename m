Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9328C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:18:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE706611C0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE706611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 813D6406BA;
	Sat, 11 Sep 2021 14:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyCL8HNhQ4SX; Sat, 11 Sep 2021 14:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CF05406B0;
	Sat, 11 Sep 2021 14:18:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACEBC1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B5FD83684
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZXgyRlZRBM7 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:18:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 941E8835C6
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:18:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id j13so6886011edv.13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qT0W0J61v7WnRuxAly0JtP3EuL44Jv/PZiE6JZFPrx8=;
 b=M59jNEvTkwDrdvzITblxtgBg/s1wUETRj6xh90G/tZ4qDN3zveRRTukYwlj5DGC2uL
 /75BmWfUFPjgKGTh/n+Y1JudT+nHZT/X3wEVhqngb/OQ3XLcr3MfX7zFEIY1tvGnylnr
 WDxMkiQ7fCiDxO3SEiuJcgRATZ87/XXd9jnYYq+kYnTGQQu3VRPftPU/TWbsMOLCPal5
 zQvmA8KxF2rz46tvK3GCn427TblvZsIxztQUN6I4Q8t6uMq/l/Lve8K9UbWw2VOAF8yc
 N1famTlKOevxF/tPonF+4fF3/5G18hTPt9tUiOfuomkJCp/CtMgK4rbYJ1CryAUMO3rg
 Lu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qT0W0J61v7WnRuxAly0JtP3EuL44Jv/PZiE6JZFPrx8=;
 b=JlrEw+wc0sB4DhotImC4AucDQmxEpwZpIM4ZhCkwGF3ebNo0D60p6MNv9IFM6NxezB
 /bCDMhXY7ocz39kq/wESU4rtii0kWyi8vSjdG1ZwtQf3VlFqIs+vBmv782PQgW2De5cZ
 XrO8x1m0zs/lDt+nWCq04Q2jVuayvOLxCjlBAnp/KUxVCuwdCTlf9ClVz/QkTG0gYGKa
 xatsRHQMV32NB9cnNADknmKQg3z2ors4zaa7ZGQNmJ2evVfHjhS9lYAUqsxJVqg5JrVh
 LjZ3fIia69MxH/mYoerw9X6jFo6jfE+KNIJslyX4YcUx9It3YPqPO7QT2tMzIpaRG3YM
 5i+g==
X-Gm-Message-State: AOAM530wsZ4KptFccfCYFyawBVGCZvByDNFbLy+t3lrijufNXt9XJnPH
 pvd+t5U1QjjXAHDBMRfH+yTsrx2CS3tv9g==
X-Google-Smtp-Source: ABdhPJwwsMriQno6ycBkYm6Vy6P6wWVdxhML4OPxl5UXzWHk/E5H7iUmWp5+1osNywYoP/V2eTgusA==
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr3524692edd.98.1631369915940; 
 Sat, 11 Sep 2021 07:18:35 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k12sm1003492edo.9.2021.09.11.07.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:18:35 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905192648.1378685-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <bd5d8f1b-6149-a8f4-585e-f8a1ec52efca@mind.be>
Date: Sat, 11 Sep 2021 16:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905192648.1378685-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: fix python build
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 21:26, Fabrice Fontaine wrote:
> python bindings needs setuptools since bump to version 0.23 in commit
> 50b6d7d69f880e940d7c281c493a6a6694d6ebe3 and
> https://github.com/analogdevicesinc/libiio/commit/21023a538b125dee966bf496dcad019ee20967bd
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a26cce9760c75c44ebdcf21dfb4a69aad5702de4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libiio/libiio.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> index aec251e9a1..8c2e126592 100644
> --- a/package/libiio/libiio.mk
> +++ b/package/libiio/libiio.mk
> @@ -71,9 +71,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
> -LIBIIO_DEPENDENCIES += python
> +LIBIIO_DEPENDENCIES += host-python-setuptools python
>  else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -LIBIIO_DEPENDENCIES += python3
> +LIBIIO_DEPENDENCIES += host-python3-setuptools python3
>  endif
>  LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
>  else
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
