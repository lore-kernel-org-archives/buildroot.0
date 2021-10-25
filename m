Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CB8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BF260230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62BF260230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2CD4041B;
	Mon, 25 Oct 2021 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VosuUJyY1QJy; Mon, 25 Oct 2021 20:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3A14040C;
	Mon, 25 Oct 2021 20:16:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3AB1BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37EF880D69
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OF7TOvuqKnSk for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:16:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7295580D55
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:16:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a26so4256317edy.11
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FocsTdIL8bnS0917fIl+jhxrsU8B7BOkgnNZSnfNVAk=;
 b=b0it8Rf38uQDwFe3oKcVPP7QVdUx3GrJHecN7vpXyQgtsQhRGR6hTDB3i6BoEXvqDg
 FP6nq93JgBUfgBp3Q91tC6Wx+3BiPqwf7TDNav2xfCPs2yQFZn/8T8guK4Pok7pJe7QK
 BCLXtybVxreJmfMhNDP7s6VJ2uTBX2wB+ZbmcHMQ+0jatxnq1DENpp/GcAMgEKGpMxXP
 fCx8Qd8XsC9pg7xyU6SXCGhuG3FHPmMcPbcE1QvzBLNzhIeF1WUd6M16z/d9YzgPvJ78
 996I3Z8iKztltjpewcGwVatRO3Gyj2fJVaB0h9kacSkTsG8s6TsfpaoI/KD5u1PwaFJI
 xokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FocsTdIL8bnS0917fIl+jhxrsU8B7BOkgnNZSnfNVAk=;
 b=lGrzX5KWfx7padm95w7Lz8Yf+3fyq7jfRj0qgs3a+1DtH7H3q5AFkZ55jpCCa5Ynje
 LH6KE03mHMWBK5nc8keC4QDcXRkfqxkaWdXVGAQ4nriZuQ9od/e4XrIAVOfT6jaWGlAu
 55lQT6SwQ9TtHSLg8X4ijL0/OnnvnfmTgn8uoRLGsA6g3g55H3SmoDOvXmiXWTejsE0k
 OUMEW1OAphJytoa8e1ceJRdYqc3l9WNfKM0vQfhPJumcv2bosoNhpDe4UJt3NtMZ71Nj
 nSPIQSFwZDimQE1NvszoRRnxwJswnMhQMY8xHqs/swKloTjCddi4g6IHtnC4+GECdcK2
 Nmeg==
X-Gm-Message-State: AOAM532HzIlhXxkU7ITof/gtydBlRFf9eER2O06/OCh+IU73NBZgUhrl
 VCCCz/5kfLRnd084098GrIinGKFru9yL8w==
X-Google-Smtp-Source: ABdhPJzgQwEtFeXVraG7llNfZMQPXB/o1VJFxK8vgUGQRn9L0MnnXtQADq3y4J7yYmVK1zxgTefKlw==
X-Received: by 2002:a17:907:1c1d:: with SMTP id
 nc29mr4407874ejc.23.1635193006482; 
 Mon, 25 Oct 2021 13:16:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qk16sm3543222ejc.12.2021.10.25.13.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:16:46 -0700 (PDT)
Message-ID: <56769cf6-a027-636e-887b-e562a71c627e@mind.be>
Date: Mon, 25 Oct 2021 22:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211018214727.1514701-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211018214727.1514701-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: don't override
 dependencies
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



On 18/10/2021 23:47, Fabrice Fontaine wrote:
> Don't override SMCROUTE_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/smcroute/smcroute.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
> index 96da0dc346..913647e7bf 100644
> --- a/package/smcroute/smcroute.mk
> +++ b/package/smcroute/smcroute.mk
> @@ -13,7 +13,7 @@ SMCROUTE_CPE_ID_VENDOR = troglobit
>   SMCROUTE_CONF_OPTS = --enable-mrdisc
>   
>   ifeq ($(BR2_PACKAGE_LIBCAP),y)
> -SMCROUTE_DEPENDENCIES = libcap
> +SMCROUTE_DEPENDENCIES += libcap
>   SMCROUTE_CONF_OPTS += --with-libcap
>   else
>   SMCROUTE_CONF_OPTS += --without-libcap
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
