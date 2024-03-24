Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2596DC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDBA0405E7;
	Sun, 24 Mar 2024 14:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUpBWWFOixYL; Sun, 24 Mar 2024 14:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95DAE40619
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DAE40619;
	Sun, 24 Mar 2024 14:57:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42EF31BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302A5400E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7AFkhT_FcnR for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 354E2400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 354E2400BA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 354E2400BA
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:57:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33e570ef661so2006383f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292219; x=1711897019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lfal/cS6Me0H3y+zRaqCJKpMfmQtnioRCqkjk7hNu8E=;
 b=oht/0q1oOFUt7uco16+ZWMnA+/iP0hJ/x26Nra7d2ZVipXLxWi3AFCgvDqqKvGiTfC
 SLa/7BuEiNCqRNSbuYe9vRw8XjNStFDBwcnE3DI47RswyVueJWbSrwbeiOOwygj9egyM
 mnzSbdV1NtFdrgtWIN1EFOkgYRd/cCfc9vToSLocw6i2OGVFcU9VVIwdKgGqF+/+h+dJ
 /Wo+6sDEBvpbmisZfD913TtVRN8y3zZ6atakOFhv31lpHNoAk3EPIVX/YUuF6W97/w7r
 G7bI77T84BKfEj4v6X9c7ey9qynOlZ1BxTgq+1Vd/dsOx+To+5TX//dsEwn1a1IuqACP
 qEPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5z1yoFuxMVfS3EXNAm8fzFI5ISRb728R1hjg4lc9iQa96rNdZHIYcjXF9PB49d0msiSXWUF86FwWJMDtUF8mD7ANyDuZtlw==
X-Gm-Message-State: AOJu0YwihHBwyCElNg2ZMmeXdheCvhe4fLOJW1oW1v3s2HJphVmQgE2t
 zAHVpDijV5RU3Vx1uguBjFzB+EpYaeISZBlgnVfBBq1H8CqtOjeCjjDVRAq1wQQ=
X-Google-Smtp-Source: AGHT+IGp+0aDfrW+p63zKoC/qm030MmlUzLMz0XIhftQCObvsZ11WNpBLCWs361Cdn3hUO/0kGndCQ==
X-Received: by 2002:adf:eb89:0:b0:341:a8c3:61c9 with SMTP id
 t9-20020adfeb89000000b00341a8c361c9mr3166896wrn.57.1711292219249; 
 Sun, 24 Mar 2024 07:56:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:56:58 -0700 (PDT)
Message-ID: <85ad5272-0ca0-4c1c-9b00-96e5d7e8e076@mind.be>
Date: Sun, 24 Mar 2024 15:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240324130529.29785-1-bernd@kuhls.net>
In-Reply-To: <20240324130529.29785-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292219; x=1711897019; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lfal/cS6Me0H3y+zRaqCJKpMfmQtnioRCqkjk7hNu8E=;
 b=IkAY0Dom9kcOd6ZwOnObZBrWbaJTizI9seabuANQhnlqGP2Ygah2EtBLykmAcEvheJ
 95Cq4XdWgkn5xied1DqYafUegw4GtjXLGiSiw4zW9i58LV6zrdKKArUD6ZQNuRw5YgvI
 NMnuIJwq8F9Btdu/LebvHTYt47IWwTfkC9YD4M/xKglBgKcR61jhRfxRpy2yc6J1k6Eh
 IVBgw1ijiizt2WuEW7hiKG1oCxqeHQ8TOYJ4NP2HJBn8ln0ER70GOmQNBhKEgL7ku/Z5
 0cnXsKgsepLct47hweqkwD480dp76J85VJVfdR4CaNagR5eXo4m/QqUnAmEinPaanT1/
 e/sQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IkAY0Dom
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.12.6
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 14:05, Bernd Kuhls wrote:
> https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.6/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libxml2/libxml2.hash | 4 ++--
>   package/libxml2/libxml2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
> index 959887ab0e..086bb41098 100644
> --- a/package/libxml2/libxml2.hash
> +++ b/package/libxml2/libxml2.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.5.sha256sum
> -sha256  a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21  libxml2-2.12.5.tar.xz
> +# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.6.sha256sum
> +sha256  889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb  libxml2-2.12.6.tar.xz
>   # License files, locally calculated
>   sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 6070c07b03..e7ed6fb752 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBXML2_VERSION_MAJOR = 2.12
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
>   LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>   LIBXML2_SITE = \
>   	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
