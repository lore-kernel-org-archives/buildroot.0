Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1389EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D25F81E56;
	Sun, 25 Jun 2023 19:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D25F81E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCj7nxE1NZO7; Sun, 25 Jun 2023 19:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D7781340;
	Sun, 25 Jun 2023 19:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D7781340
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 275FB1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DF2D40159
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DF2D40159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnGT55cngQl7 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:58:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B00AD400C8
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B00AD400C8
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:58:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so3887307f8f.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687723079; x=1690315079;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zARi9OIhl0xV6B0q0lHg5XanrsqN5+sCfBQqBOPkWzY=;
 b=R6ImxqP6qdfU7AtdLbG8yU5AziGZTr7o9vQCH+WYUHksczptusg06b5AVaLpDJgnAa
 5OyOUm5L3IEws+1pd7QgMk2rwNakKMiPkAkc1sWYsurzplUVa39R5rrIXmXHzHS5YKeV
 28Awdi8fWxumZc6E/X8TZXbm5ySD1TXixzu244VfxO8+YvY9ESGZYyP+W3Hn1LF0khkv
 zqVv35txmjWFIyQnbc0aB1sNUeuMT3JxCcZTyAhVqIwgiCrU+BD/EfDeBWinleYnjsA8
 swVP/8YiO/Xa4NYKI4NWU5JYPRZVLwOs0QqBESz9laNz8M2VwwCrisUh2CjfsMuI2TA0
 ae6A==
X-Gm-Message-State: AC+VfDzpBecD3tPf5pwb6+9pWS3lVoyRIszbxJMMzH85n7kBmWqJatab
 r2cWgcnL1mj3RxUXTwtky//Z4/yzTwOYmXCsJic=
X-Google-Smtp-Source: ACHHUZ4Kzw3Pxnpq5J4GBj+hraDevVyu/fGuePEmQY+fyzvFHF/bXKxRcXMAjCIiE3NK8dEfWDMrng==
X-Received: by 2002:a5d:453b:0:b0:313:e897:67ef with SMTP id
 j27-20020a5d453b000000b00313e89767efmr4878653wra.47.1687723078836; 
 Sun, 25 Jun 2023 12:57:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170906130d00b009821ad6ad8fsm2401686ejb.71.2023.06.25.12.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:57:58 -0700 (PDT)
Message-ID: <43466a26-b5d6-e314-b04c-cabe06cd8f24@mind.be>
Date: Sun, 25 Jun 2023 21:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
References: <20230620173813.4590-1-ckhardin@gmail.com>
In-Reply-To: <20230620173813.4590-1-ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687723079; x=1690315079;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zARi9OIhl0xV6B0q0lHg5XanrsqN5+sCfBQqBOPkWzY=;
 b=MJXUYfhDgIAv/dusIKt1Lf8eJNFuer63EZsif4Gb8Gx7oydI/MysOTWvNJZgo0ZDuH
 EHrs21NFETtTSVli/RnCGjxMp9Kh9x8NtpqN9/nk2zycjauLW5UIOkg9/OkBc5CzLyZb
 K9Etp7qkUd1y1VraLXZXvmw+eHP78OWELWiyvkw/g56iuLGh1NR8w3mzfixIBgHcwnix
 mTNwq8VjHpbxfW78yUabuw8j5D/myFxtLZFy7eX7GEmLN2Au5FaSuNCYlLO8RWN+yuDL
 FgAeb9pfkMZUONN+DRf4+OaWb6ZAXK18VLqrnSZRW5hzJjnc228PhdnpGPTqOPhyuSM1
 UKdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MJXUYfhD
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-plugins: fix dependencies
 for the alsa plugin package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2023 19:38, Charles Hardin wrote:
> The alsa-utils will remove and create the /usr/share/alsa dir
> as a whole and since the alsa plugins needs to add config into
> this same directory it should come after those install steps.
> 
> Also, the bluez alsa needs the plugins installed to find them
> during the configuration phases - so, interlock the plugins
> when configured.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/alsa-plugins/alsa-plugins.mk | 4 ++++
>   package/bluez-alsa/bluez-alsa.mk     | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
> index 5728ebfe37..d23a81c5ee 100644
> --- a/package/alsa-plugins/alsa-plugins.mk
> +++ b/package/alsa-plugins/alsa-plugins.mk
> @@ -20,6 +20,10 @@ ALSA_PLUGINS_CONF_OPTS = \
>   	--disable-maemo-resource-manager \
>   	--with-speex=no
>   
> +ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
> +ALSA_PLUGINS_DEPENDENCIES += alsa-utils
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
>   ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
>   ALSA_PLUGINS_DEPENDENCIES += libsamplerate
> diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
> index 83dfce6177..649810b0ad 100644
> --- a/package/bluez-alsa/bluez-alsa.mk
> +++ b/package/bluez-alsa/bluez-alsa.mk
> @@ -20,6 +20,10 @@ BLUEZ_ALSA_CONF_OPTS = \
>   	--with-alsaplugindir=/usr/lib/alsa-lib \
>   	--with-alsaconfdir=/etc/alsa/conf.d
>   
> +ifeq ($(BR2_PACKAGE_ALSA_PLUGINS),y)
> +BLUEZ_ALSA_DEPENDENCIES += alsa-plugins
> +endif
> +
>   ifeq ($(BR2_PACKAGE_FDK_AAC),y)
>   BLUEZ_ALSA_DEPENDENCIES += fdk-aac
>   BLUEZ_ALSA_CONF_OPTS += --enable-aac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
