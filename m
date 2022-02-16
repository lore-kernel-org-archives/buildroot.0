Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3381BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0355400A6;
	Wed, 16 Feb 2022 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMbBfPjW0oow; Wed, 16 Feb 2022 19:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CC7F400D6;
	Wed, 16 Feb 2022 19:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A587E1BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EF3E4026B
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUI0AVEcaG8D for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 946104013D
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:53:18 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bg10so1715379ejb.4
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Zh31pMjQdbLwBkN+MxNle08ivmG+hbh2Iy1qGcFTkzg=;
 b=g9nrvDFhbidUiSLC8ss3knlvDFDxBUvP3PEYu5DP5LBimHm869ERw64FSKwTCUdCY9
 qxKj7XsZQn9+/MhFCTBLKhv5KcETMfCGyDSdZYqhZiE9o1+uxlI4RKdc5GmYKOICnOSq
 bfOSmf1URkgNhXbR+fFGcCUAiyyw4r8GLZx6u91cSl1KbsBRmhcnXwpfG/B5NPhTBMt2
 25Usa/eKNW0fMpIAKFhrb3xe++ixcETJyDvPk7UYG3A453wY/ngEyfUHY8mZR5EWjILE
 0NDywHU6kBQVw/Nnbm0kpp9y8r+mC1vOtws/nNIGO5aNypoyETMszFhR/9vSpBcBgN5X
 liIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Zh31pMjQdbLwBkN+MxNle08ivmG+hbh2Iy1qGcFTkzg=;
 b=0A2uYPb1CXGAUPXEXiUpgvVgGFRxncha6G9rQ38fNPKVBhAFYapRbHdvxwYc8kkrgE
 rwiuuD/8Tu59sQi4WwhUWfriQGBiSlccH63EHoU9d/Jq7iyAknodsbyaorZZZRXGJ5ua
 ZtV+1DyjthJLmJhgKWQbNhz6uAdo7uCN3lY+5ZSqAX1m6MlDHF863aWjXiqwXDfcW9fC
 gwERxlTO/XZaqpt4WNzTXxSe5Mx6ukkcvJzdkplxlNpAumbAuWeF109VoBECOxg3leKg
 n/0UydYZQN9582ZeTJ/U2eUEumwAwkdXmHFrd2TKTFkccjXT2mdPbnMNJEELdxyI5rYY
 SOEw==
X-Gm-Message-State: AOAM530b1DB/7pj1Z2fzPM0atWL0mDPwpKYZlZW00sVB/J8mZraD71JP
 G0xSB4VDvKXDFZ6tYy7fIQbCiQ==
X-Google-Smtp-Source: ABdhPJxjIwhKmGGVTgT40nmLTh04qyKr+Li7gVjyJYODMmXzlncCX4PDcjqCcfbhuZ0xFBsXUZCO2Q==
X-Received: by 2002:a17:906:f1cf:b0:6ae:9992:484 with SMTP id
 gx15-20020a170906f1cf00b006ae99920484mr3580848ejb.607.1645041196820; 
 Wed, 16 Feb 2022 11:53:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 23sm273434ejf.175.2022.02.16.11.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:53:16 -0800 (PST)
Message-ID: <82c196f4-b147-ad0b-d20d-addc721c5c30@mind.be>
Date: Wed, 16 Feb 2022 20:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213215159.1533045-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213215159.1533045-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/mutt: bump to version 2.2.0
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



On 13/02/2022 22:51, Fabrice Fontaine wrote:
> libgsasl is an optional dependency since
> https://gitlab.com/muttmua/mutt/-/commit/68caf9140c8217ecf6c848460c4b4d27996b2922
> 
> http://www.mutt.org/relnotes/2.2/
> https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-rel/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/mutt/mutt.hash |  2 +-
>   package/mutt/mutt.mk   | 12 ++++++++++--
>   2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
> index d439b23aa3..bbc9d459b0 100644
> --- a/package/mutt/mutt.hash
> +++ b/package/mutt/mutt.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  92a309e47e363a97d62425bcb71adceae5ab5c4c413dbcac37fa98ed70c12be0  mutt-2.1.5.tar.gz
> +sha256  e84597f06d03ca82f8ca3b5ec8bc294c150709b43ed2a0177bf479c3e3345314  mutt-2.2.0.tar.gz
>   sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
> diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> index 7e9046fe8a..51178ef03d 100644
> --- a/package/mutt/mutt.mk
> +++ b/package/mutt/mutt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MUTT_VERSION = 2.1.5
> +MUTT_VERSION = 2.2.0
>   MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
>   MUTT_LICENSE = GPL-2.0+
>   MUTT_LICENSE_FILES = GPL
> @@ -53,8 +53,15 @@ else
>   MUTT_CONF_OPTS += --disable-pop
>   endif
>   
> -# SSL support is only used by imap or pop3 module
> +# SASL and SSL support are only used by imap or pop3 module
>   ifneq ($(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
> +ifeq ($(BR2_PACKAGE_LIBGSASL),y)
> +MUTT_DEPENDENCIES += libgsasl
> +MUTT_CONF_OPTS += --with-gsasl
> +else
> +MUTT_CONF_OPTS += --without-gsasl
> +endif
> +
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   MUTT_DEPENDENCIES += openssl
>   MUTT_CONF_OPTS += \
> @@ -72,6 +79,7 @@ MUTT_CONF_OPTS += \
>   endif
>   else
>   MUTT_CONF_OPTS += \
> +	--without-gsasl \
>   	--without-gnutls \
>   	--without-ssl
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
