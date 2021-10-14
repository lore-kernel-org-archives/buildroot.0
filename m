Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1ACC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E1F60FDA
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21E1F60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E909983ABD;
	Thu, 14 Oct 2021 21:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hppJzohvjYm; Thu, 14 Oct 2021 21:08:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4765183ABA;
	Thu, 14 Oct 2021 21:08:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B59051BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A60D083AB9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWSLCrLGiBYq for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E308783AB8
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t16so29364236eds.9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Nk02kHQKiro9EKBj1DbSpumeZgb+5IU478XW+54dyFs=;
 b=AWiZS6MxdkofqkQMnPX/p65NBGFoZgZWsct2awTXQRr81PSkFiZXuTZUgVe+nm7Xhw
 q1Nrqoldlc7CDYoD7iHpTHP11WTveIV/xEhuSIyCDngaSBEm/gXdEX8qgqoPrq+juDqp
 DVL+95pvYQnwdtxFQgoTXZYe3HOxF4J+E4ohaBaroD8lwm3StXHEtfkACzsqm+ADUwAT
 bwdyVR4V4aIsalLu6yX2trAmhndnxEH5C/tqGtEI0nWIH1pVgI0LCX/x4/obWN+EiM0b
 TpbB41Y4pBoF82D+B1RWOXAnetzuG6aOTD26oksc1fvZXzwSI1FZ07PQVT3hN6SH9Y7I
 JGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nk02kHQKiro9EKBj1DbSpumeZgb+5IU478XW+54dyFs=;
 b=yMe4xOTUm+yPgQzbqQzfnuOfBRUd6tYkXTNGEwya1U8lJiwFuXCAIlbg5rHLq7Dx9m
 GLqHSKxQqFbjW/Yo5iczDHeBHiskP2BpO0DUVjSXRqpIu49beCOiDbnqOqbbGkPs2eVp
 FLVbkxEPsDveoyfyvG0s0t/+V7ZPPkgxG0kcxGHtt3GC4OmguSbQz6xmRob298EZf7Kw
 0GflbyDxLAr+jRKK3vGCv6ldns7SgZseh27jwR6NoOlzF0GZZWs4uY5oFnK/LQBJghMV
 hMa0B1LYRf7BiiGHlnaKHAp0agBWaE8g254zOpwx2zSZGY3eYdgQqJcDV+yo3b9dtgT4
 ul1g==
X-Gm-Message-State: AOAM53101/7FYS+KWBSDzVXFQvQ8vrun2sKgw9vPTVG89BjO+t9GhD4T
 kUu3SQKzXPShzjHJy1+BbFMz7g==
X-Google-Smtp-Source: ABdhPJy2pg3XgPv8tDm7zFVmf+nhFdxpXJbE6Baz0wAgWmdPCSwomCGCTAmlIU5hHD1e5VFJiQiPsQ==
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr11848447edd.365.1634245696023; 
 Thu, 14 Oct 2021 14:08:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a1sm3091123edu.43.2021.10.14.14.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:08:15 -0700 (PDT)
Message-ID: <0d7ca1e8-1254-821d-5781-6212ee7f261e@mind.be>
Date: Thu, 14 Oct 2021 23:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211009182525.3675076-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009182525.3675076-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-peripheral-xarcade: bump
 version to 19.0.0-Matrix
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



On 09/10/2021 20:25, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 2 +-
>   package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
> index a971493c02..7defa8cee3 100644
> --- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
> +++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  6fa8e1d0e6ebb6c385a7aef6e6c7629d2f1f52601ade7839093c1c3abb844894  kodi-peripheral-xarcade-1.2.0-Matrix.tar.gz
> +sha256  b6d6161bdfd3cc4d60d3cd7f3452b1101fad48eea1816fed28865af4b985c244  kodi-peripheral-xarcade-19.0.0-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
> index fe5a9e41a0..8e9d2a8a62 100644
> --- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
> +++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PERIPHERAL_XARCADE_VERSION = 1.2.0-Matrix
> +KODI_PERIPHERAL_XARCADE_VERSION = 19.0.0-Matrix
>   KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
>   KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
>   KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
