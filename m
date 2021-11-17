Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE809C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:03:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5046061BF4
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5046061BF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2391A40549;
	Wed, 17 Nov 2021 21:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCn-6mgMVrdB; Wed, 17 Nov 2021 21:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6243C40494;
	Wed, 17 Nov 2021 21:03:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0DBF1BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFD0360A85
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vohl83VtcsQg for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:03:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1020F60A71
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:03:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t5so17224385edd.0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 13:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=WECrRE4uqKxT8Dk+ZgHdPKjQMUBcS7tHOrV+ua8md4k=;
 b=U9JHKNdnnsGygkiZH63zG9hCLU5m2xXlMw494wm0Izvd4YPGBoF9lxKBI5O6d4rLTi
 aN/axEu4Go34zWXmoCh4sAviCVex5JvXGUeoYNB07d+q7DciOIftEMwrTqTLUBx5QxGS
 i8r3gUaWQwEdk/q3UM7yozRVylnt83XQmlKbRohKn+NL7lc3lEAi6WphsqO/pWgQ82Vi
 RJCOfbjxV54Q40EHXElgjwTYwshAp2k/5UMAAzCvtrl6XC9u6Nnq45AhesM+PARh0U/H
 zVSd5Df7VG5THRxEYMIVB3OApqZUR+4+hfVuEmAukNsg1bih7ZafeieFNFVpnkcZ/8T0
 M75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WECrRE4uqKxT8Dk+ZgHdPKjQMUBcS7tHOrV+ua8md4k=;
 b=OngxSXLJmiZghGykPiE5z49qRHzf68MWcHynGx8QJidJ7SO0a0D5BgFOiKP22I86qn
 +k/aMyNTHORhf3wkSDLvBYt3rvR6mET7DEgljKdMDQR/Zgl4esntoA88xem9rEtv5kY6
 eXGH1z65wFVj35SgvWIsXTMVuZli2dbskwRxSxUsKyuSh+slJUkKr/AQwXQYaRfVmJQs
 +yYvTrqpKhZRtKp482e66QPshWC2Qg9qegW7wj3KnJZz4knhrfg6+ZgJ9hU6TjdH8tjs
 VCEEbAPXtRXeP9+wVXIsI8Ll2kq8yrUmcTNoNbv473PFckDJlpesLlL9tKZLMfUMfi19
 zpJg==
X-Gm-Message-State: AOAM530Mz0Yx9UlezYMirXFEmORkeXgUZJUj5YJmki5XUWOvnpUOJwj5
 zY1GsoGKOD2md2fcHeZP6R1SgQ==
X-Google-Smtp-Source: ABdhPJySWhSRYtyW9166jSm++gUA+LpXPGmfQreCd47a/B0eJZWCvHx4dyYfg8f8R9kg13IRhWLaJA==
X-Received: by 2002:a05:6402:3481:: with SMTP id
 v1mr2592907edc.337.1637183011255; 
 Wed, 17 Nov 2021 13:03:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d10sm429246eja.4.2021.11.17.13.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 13:03:30 -0800 (PST)
Message-ID: <9c4a4548-1512-f2cb-78a9-0671aa077a9a@mind.be>
Date: Wed, 17 Nov 2021 22:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20211025224403.979315-1-aperez@igalia.com>
 <20211025224403.979315-5-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025224403.979315-5-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 4/4] package/wpewebkit: use lcms2 for if
 available
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



On 26/10/2021 00:44, Adrian Perez de Castro wrote:
> Make wpewebkit support color management if the lcms2 package
> has been selected.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>   package/wpewebkit/wpewebkit.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 606a1531c0..ab45d4a67c 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -67,6 +67,13 @@ else
>   WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LCMS2),y)
> +WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=ON
> +WPEWEBKIT_DEPENDENCIES += lcms2
> +else
> +WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=OFF

  There was already a -DUSE_LCMS=OFF in the unconditional optoins, so I've 
removed that one.

  Regards,
  Arnout

> +endif
> +
>   ifeq ($(BR2_PACKAGE_WOFF2),y)
>   WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
>   WPEWEBKIT_DEPENDENCIES += woff2
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
