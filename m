Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851BBC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:36:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A9861371
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33A9861371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED65340167;
	Tue,  5 Oct 2021 19:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfLnlJ6qAL4H; Tue,  5 Oct 2021 19:35:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 127674023C;
	Tue,  5 Oct 2021 19:35:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBD7E1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D935983BDF
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GS4WkQMs9c3B for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:35:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9DB283BE4
 for <buildroot@busybox.net>; Tue,  5 Oct 2021 19:35:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z20so715222edc.13
 for <buildroot@busybox.net>; Tue, 05 Oct 2021 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=d2AFCKDYYkywi8kEaQzMXIzg1LnTEWZm/O+iNJ1g9hM=;
 b=cMl2h/t/vEjPDZTxK5CXGDyN2LEhK3yeTf8XSFnbBmeg8RsKYOfcljdmdd+oKmtsD1
 BRHcYpREZKAfZLFYUrCHx4KJTeh1H5jLC+AExVIIAJyeh+SqLXWvtJFRzhBo+ADOKFGS
 uYJmH3xut1l6jqqxQj7tF0OBjiMdtCxyKtmCV6SRIYCry7wG8BwFN1UBHo8VOxjg4urZ
 tGwOkFKnj9Ro+HQyboN4xLbvp6FQIbq7tLiOmLl2snhpIUHFcFoGjT+IDDxrk4y1TZnq
 4J72bjhOBLR+MQVkYOaRn+kuWO8XFx+5nRhwgPtZffew5mwugQ4anwWFrGU3izhrlDmN
 zTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d2AFCKDYYkywi8kEaQzMXIzg1LnTEWZm/O+iNJ1g9hM=;
 b=Rq5yqotNGBgEvXamFZuLQNT7FQQSZVvDxJ7BmbTmf7qcVtDNnJTaY/kkDLv5lHt8oJ
 nelGhHTtkHC8Z1OltGkUvAGWE4w5ekpAXHGW4dn8jfy9GWvmVhTd99ggJvG5AwpHFSVt
 OkM9e/izmdyRB0Pw1yxvEKxUJbu0rjekYYLAoJrOEFauksPOjivFp+S4/Q5L4Aea2W30
 UDhL28b0/IT3TA3u18JyXylbhqGSB0XeLdVWbnMNTE+4byVmel157rLQ0szRmKeOFrJ/
 RISkTi0bpaUlaiEiqpJgFnvKEPpe2EYBGrewLsSn9KvlLXfmWIf8unTX1NHuHqFf0Iah
 qgFg==
X-Gm-Message-State: AOAM533AUFBt2wcHTbfsGM20nRM4GDPgPZso3ZJfY2GGiCR2ScXftj31
 zpSmIy4npBcB+2KR3cJGJJLEgg==
X-Google-Smtp-Source: ABdhPJxJlmLwTya/Ga3XW1mK5g8t+bvGKRMVWy0NoWGwm4raV+IXgfi1yU+B5GOEc7vE66Akk+ClAg==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr6067679edd.395.1633462551787; 
 Tue, 05 Oct 2021 12:35:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e13sm8167680eje.95.2021.10.05.12.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:35:51 -0700 (PDT)
Message-ID: <51bb3a95-1ed0-4bf2-afca-43bd08351646@mind.be>
Date: Tue, 5 Oct 2021 21:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210927201740.122649-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927201740.122649-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.11.5
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



On 27/09/2021 22:17, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dash/dash.hash | 4 ++--
>   package/dash/dash.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dash/dash.hash b/package/dash/dash.hash
> index 24cc7318b..1803bcdb2 100644
> --- a/package/dash/dash.hash
> +++ b/package/dash/dash.hash
> @@ -1,4 +1,4 @@
> -# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.2.tar.gz.sha256sum
> -sha256  62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a  dash-0.5.11.3.tar.gz
> +# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.5.tar.gz.sha512sum
> +sha512  5387e213820eeb44d812bb4697543023fd4662b51a9ffd52a702810fed8b28d23fbe35a7f371e6686107de9f81902eff109458964b4622f4c5412d60190a66bf  dash-0.5.11.5.tar.gz
>   # Locally calculated
>   sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index 1712dcf59..fed3a9955 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DASH_VERSION = 0.5.11.3
> +DASH_VERSION = 0.5.11.5
>   DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
>   DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
>   DASH_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
