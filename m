Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15ECC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A2E61184
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87A2E61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC8760AEB;
	Mon, 20 Sep 2021 19:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJj_Xz0YPiLD; Mon, 20 Sep 2021 19:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C015C60AE9;
	Mon, 20 Sep 2021 19:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6E6F1BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3FC1403A1
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-l8naUWUv34 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C6AA40352
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:46 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v24so65409913eda.3
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wW1Tj+sbMHH2hEQJ2Qc9IW/td3TM0edwcwvrNtb28HU=;
 b=Ism4HEX8jsg+KAqwAZMyS2pCefeJ1Nk2LmtPpVtMRQ/iCsxPnGXTrFVuLuKIWmaR7G
 hOp52xoeZSzN9L6CFOhZeArnrWBa/+FZ6KlXdqAqxK1N27ZdVyN88yenW2um7GzgLXK2
 hqacTr0mLS1ZovSc79MefYts+Brwl5VbJRaTSae8rDJy0QMkALig4X2ZB1HKba+Dxexq
 vyN7eZ+psoAvRAG1UpJa73y3upUeoEdXirPP+XnKgnPvbmX9ewXx5VBsuzQRkYyrjYH/
 0zPzuS40+jbpe8f3XbQa6L1lgERAy5BxybfV+3C27A2aXT/EmSN3qRZn8C4dDwrxjslp
 YZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wW1Tj+sbMHH2hEQJ2Qc9IW/td3TM0edwcwvrNtb28HU=;
 b=6eMmZNiiWVSmcBRRXTXCdct5mf+xBYwu0BjeYVPYoKIzGAP8EaYH2ijMlxcbJnmVz9
 5LLJuYhECKRkvyyi8pxhGJlQPvjGsGouIik8+mx/gBK7JciwXnWNi8dRupt4zojEBvfn
 U3gR++M8rFpvVuoyiCY9lRMjKSD4Sw1hqe4fXx2rg78M9xqROPHpYO6YnFouOQD2bB5y
 drM8xrNEQwQagRA8GyvPGzBrhuzeKsVliTO/Qe3qwx0WZosOqCBpTECRL3nfBTDYzPcw
 yu0C38J+zL2A34k+SMmQDqvsYSCAww0R3brBLG34FZCczTBUQnvoajIMCgyTRD1TKfjY
 tl3w==
X-Gm-Message-State: AOAM530dGjc+imZykozYgSW/GNrl20h+pG8+AC/JnOIAFCkQZsJKAVnZ
 29GUPeSBBTddUVo6hOU12cal0w==
X-Google-Smtp-Source: ABdhPJz8aicNGmsVkZFidP7rng/5PgQw+Ve5FV9uqrjxNPkANZhi+iOyS1y9F1JsfXC+u7icD2q+5g==
X-Received: by 2002:a17:906:7208:: with SMTP id
 m8mr30194465ejk.82.1632165765237; 
 Mon, 20 Sep 2021 12:22:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y13sm6481759ejl.125.2021.09.20.12.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:44 -0700 (PDT)
Message-ID: <d82d4d10-6925-f5ed-c9a3-ad87aed078ac@mind.be>
Date: Mon, 20 Sep 2021 21:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210908201037.729001-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908201037.729001-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.14.10
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 22:10, Fabrice Fontaine wrote:
> https://github.com/pupnp/pupnp/blob/release-1.14.10/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libupnp/libupnp.hash | 2 +-
>   package/libupnp/libupnp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
> index f7fdb6d521..1c8a302682 100644
> --- a/package/libupnp/libupnp.hash
> +++ b/package/libupnp/libupnp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  7b66ac4a86bc0e218e2771ac274b2945bc4154bf9054e57b14afb67c26ac7c24  libupnp-1.14.7.tar.bz2
> +sha256  dc417f5ef0a9182d76b6cf38bdf863e2fb1ee3c353c56fa82e354edef7ba50f2  libupnp-1.14.10.tar.bz2
>   sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
> diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
> index 7457d2644a..ef2b724efa 100644
> --- a/package/libupnp/libupnp.mk
> +++ b/package/libupnp/libupnp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBUPNP_VERSION = 1.14.7
> +LIBUPNP_VERSION = 1.14.10
>   LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
>   LIBUPNP_SITE = \
>   	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
