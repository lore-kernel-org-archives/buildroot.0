Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFA5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:23:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC5B660EFE
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC5B660EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FBFB4039E;
	Mon, 11 Oct 2021 21:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6a2UcF2sfwx; Mon, 11 Oct 2021 21:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79AFC4039C;
	Mon, 11 Oct 2021 21:22:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12E791BF989
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 031B681839
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nd5hyA9uFmOU for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:21:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E642A80D85
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:21:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g8so72782673edt.7
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nlZy92TbN7qYKZ5iiXMU7QwVxRuPZuXJmSjk7jEbBs0=;
 b=azbe81HgRA9sHpYBn+f4nn4FQuwi5kV6IIYe3O/IAlg8wxO/15zNHquMXNX7DQGUpw
 8eMxbS8HY50JqSYjtU+VXJ/SzlD2uDYn9e4JU9FoAFFbcWKHrsTdg5ltfsw9Rf37Sd8l
 vkIPjJm/8fmLOO+UpfOENoH24VzZI56UqV9S5GyAfH97r+z6Lx3HOXCn8RymwuNAZ0/N
 7hZR6rUgdB3FBES6qerxQKkNRsrVR5t4eHJGOSkj+hrWwM5WmszXKFsIZuCYS7hEWBfh
 Lqz0O/xsH213KY/pMkNFpEbxKYjkPNtJxljp1404VpvjFcqP9rtbNxVZwBsOEzpUH5N5
 DWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nlZy92TbN7qYKZ5iiXMU7QwVxRuPZuXJmSjk7jEbBs0=;
 b=ZYCQOu5YvsiQQPiFGhzSAQjMvFBioD9wWK3IOTMxo3kUNNX1kkg0uUWp61Mr/48ZPr
 Q2UG5exMBF/hKNeFSSw+L5TvsCoLcuHLr2FVwR88IhELjZUIbreWcntiL4o4djxmLyWq
 r+2OD8IISvZh0cS/PYltoBiaVj6eACSXm/b2FZz5CXLnYAnMn2pFmUCAgcrRCZi25zR3
 yOzyhEGlh81vTjr8+k6V4+raJmBpwnF66iQ+G32qCwnhBjMbhDPSWJd+pYEgfreEnIkP
 GSwR0dK2pXnSIJapYGS6zpuORuOmutXCH7B4k9yPtanFaIBococT6Yeqq4gGzMveDogX
 k+WQ==
X-Gm-Message-State: AOAM531LQ7uxrziXVH274GUUhQHfwFsIzwldMjOZBfeXs6+r7Logjzad
 AF2Y1NMbg/rT8AjpKY9WnPibZQ==
X-Google-Smtp-Source: ABdhPJxDuCVRS6rno9MwzIrKNqu7dwCEj6Dq1dj0TFzqoyhThXad7igeC7xd7PmJpQWxLR1Tk8vnvw==
X-Received: by 2002:a05:6402:411:: with SMTP id
 q17mr45372681edv.35.1633987302875; 
 Mon, 11 Oct 2021 14:21:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id fx4sm3993694ejb.113.2021.10.11.14.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:21:42 -0700 (PDT)
Message-ID: <22594d2e-c474-a820-2cce-d7476f7f8b5c@mind.be>
Date: Mon, 11 Oct 2021 23:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211003093240.958158-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211003093240.958158-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: bump version to 0.21.2
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
Cc: Fabio Urquiza <fabiorush@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/10/2021 11:32, Bernd Kuhls wrote:
> Release notes:
> https://github.com/bitcoin/bitcoin/blob/0.21/doc/release-notes.md
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bitcoin/bitcoin.hash | 4 ++--
>   package/bitcoin/bitcoin.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
> index 6ea3398037..643fcbc141 100644
> --- a/package/bitcoin/bitcoin.hash
> +++ b/package/bitcoin/bitcoin.hash
> @@ -1,5 +1,5 @@
> -# From https://bitcoincore.org/bin/bitcoin-core-0.21.1/SHA256SUMS.asc
> -sha256  caff23449220cf45753f312cefede53a9eac64000bb300797916526236b6a1e0  bitcoin-0.21.1.tar.gz
> +# From https://bitcoincore.org/bin/bitcoin-core-0.21.2/SHA256SUMS.asc
> +sha256  4146f751fc5691bdcf911cbdb8d32d8d25c297d29d58173227ae1ae6438edb9e  bitcoin-0.21.2.tar.gz
>   
>   # Hash for license file
>   sha256  96fe807030b21f88305adc32af62f9aa19915f2783509fd6f52aea02cf83f644  COPYING
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index 142521835c..10ae32202c 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BITCOIN_VERSION = 0.21.1
> +BITCOIN_VERSION = 0.21.2
>   BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
>   BITCOIN_AUTORECONF = YES
>   BITCOIN_LICENSE = MIT
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
