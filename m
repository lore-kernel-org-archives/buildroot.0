Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C460EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 662FF859B9;
	Sun, 12 Dec 2021 12:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRhGEYcaMWcw; Sun, 12 Dec 2021 12:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B273B859BA;
	Sun, 12 Dec 2021 12:15:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC05E1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAB9C60E8E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fLCIRvA3HTTb for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:15:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2027606BA
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:15:44 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z5so44408410edd.3
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YK+NzYmlXqdL32anM5hk0KmUheB2nmvswLFJ2fQYSLM=;
 b=WFOZY3F5T//ArtX/dSqYF2E7WgMatQjDmd3CmJjfuT3xoDpXfEUGbcsA1/TGN5aYng
 1lm0E9f8OeVUGxoIAaJpuk44Ud86zNg+m1jGWjmSaIujZIpAiZ25vpmR/p7FOIN+vRQH
 odXINGcXXQhr19e1OUXavuWDpF1In9QSkUYUFipk4vxyRsTQ7jZpARncilj/b9lAd34e
 659s62ZhdXcBxQaUNNqT4/jhl6j8zUskjzINsYKAP8vNP3K1TWeIlVUV+8I3M5aGQ7hR
 SQNcReL0JjUScjPs1rxTXn04GnjakP0sATJubiQ2+zUvMYokdRyy6A2F0ZhnuCqdIY4I
 3C0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YK+NzYmlXqdL32anM5hk0KmUheB2nmvswLFJ2fQYSLM=;
 b=lmRyCt6X/f/N0+j9LDh6tDPocFYD1MhFydcOTLsY1kNsbpwPEUJMDkgycSVHlnwYl4
 4SQ6u0+58bE1xmbpjSEfcBUNYBQ54Mkh3cLlGPJllpCE79ZoSMu/aOajPh7F8LjTuaOZ
 DwYokv/or0xbDDgfe13zMnq4yUGa+MfYzCkniVIss6Qj8MkXPGM6Bu4CwnMOioW6WSaa
 s4sHDOeLFqEAtRsqg/tSKjdS+n7XlbzfrHM0Z0fj7EljZV3H0O7BI+9Rtc8TirBOXUzS
 OBIjX4jnRnnhtrm56boBC0IlGKrzehpvmnocnONE3KpGvjQmaIz039dhUxzRi7BDOprd
 7VNw==
X-Gm-Message-State: AOAM531HJ+DmN73tB8I3mxq/TUycDhOzivJKMfArLPaG/WzclJkYgGok
 jh4cPGMPkwmDDnSu5Ju2CBleJWX2MOIBzQ==
X-Google-Smtp-Source: ABdhPJxFyNGrsNdqSxOL3BImd/37wk8ts2+/i5DmlstYh2vglC6LqulkwJVYWAjgUZMuLB9l/1S0YA==
X-Received: by 2002:a17:906:d9c8:: with SMTP id
 qk8mr37621322ejb.306.1639311342882; 
 Sun, 12 Dec 2021 04:15:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hx21sm4310108ejc.85.2021.12.12.04.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:15:42 -0800 (PST)
Message-ID: <8aac2cd7-7975-b41a-fc70-41b6c90e0c78@mind.be>
Date: Sun, 12 Dec 2021 13:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211206213336.1673418-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206213336.1673418-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.16.2
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



On 06/12/2021 22:33, Bernd Kuhls wrote:
> Changelog:
> https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xmrig/xmrig.hash | 2 +-
>   package/xmrig/xmrig.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index 23efe9fbd8..7960522f35 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  fccb413927921c43d2eed5bd5abdc8f335d9960ceb3611851aff5f3b1edc79ff  xmrig-6.16.0.tar.gz
> +sha256  ee07a66a2cd8332695fb377b685ccf90e56fcff1717316211dee22bde7357d1f  xmrig-6.16.2.tar.gz
>   sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index c6fec680ac..ff2e8d6c1f 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XMRIG_VERSION = 6.16.0
> +XMRIG_VERSION = 6.16.2
>   XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>   XMRIG_LICENSE = GPL-3.0+
>   XMRIG_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
