Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F07C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DC160B6B;
	Tue, 15 Mar 2022 21:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1ujDKqsCCdx; Tue, 15 Mar 2022 21:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3558860AB1;
	Tue, 15 Mar 2022 21:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21A511BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E91440877
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwVuYuw3iBSs for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:19:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 256E44086A
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:19:46 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id dr20so298487ejc.6
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EbbZaTkjUzUuHktiErek4rVhYPscs7EAz8XPyluk1fo=;
 b=Sb4RGzjAmK3KFpRYw3zC0lGMeryk9WBDAAeDOQ+vVjytASFKu68YHHvDYAdH3iyaCa
 5T56lVHcK2FJXJ0Y1kul7lRrrQHTEqz0McwK+UQ7LMtQv1u/tV5mHQCI+pUzeINboGiY
 U5MdybjMMZShH/vl75amAfXOWTF6Im3lSYqV3SlR0q8fqRYMeEOt9ao4464TBShF0pj8
 ypgdLW8eVdUaw5qKMkPBkOQMdn1LFz5DAA+sm300+XRlkGsdnOqzEQo1NceUQgoIL1Sh
 xMozUTRixKHhC4NGI6iFpEOEDYafFQ49A+6it5H5PSj1cPXBNhdevj0jeHT2jv5686k/
 0R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EbbZaTkjUzUuHktiErek4rVhYPscs7EAz8XPyluk1fo=;
 b=yT3IWn1D9gDdaqtoei/4X1ZUL+dF8+h6vnqyCL/viaFrP/clauZgGfalMmim9xVFnB
 luEE1ahexXHJfseoRffJWadcLOHasL3JpPkyerBnTeh7GcnM5DEzS7qJ0Kx8+c99wJ0o
 V9yb6SLsHd4GiwUcN9CL6CMX1nW0ZQhJJ5y54/RTv1NahRpk3/zqAh7gqepznRGI56zu
 i+BlTr4w1URywv2zCwIJK5k/N7ws5DaMuo/vieEQAEjqHEeeCKtOKROG/TdaIznAY0Cs
 byKYIXP2QYR0v1/xL4gSznBM2m84BzcTdYOMXcdmoSTsrsrhj+wDlEMQEsqQYBCd9peF
 KlJQ==
X-Gm-Message-State: AOAM531WqwxfjnlHcSDiWqPV4R5PMrIJwhX3QjaMPGLoCwPcZyZNyWNk
 g9LlVrDU+zKGWGmpi9aZv2/ULw==
X-Google-Smtp-Source: ABdhPJwPCyF7Msda/ipZjhfhQ0ivihsz5wfaUTfo0DS2iEWlvJaaZX0rF6F09pCq+fEME1tO+2S6ZA==
X-Received: by 2002:a17:906:3a84:b0:6cd:e829:ca37 with SMTP id
 y4-20020a1709063a8400b006cde829ca37mr24618150ejd.83.1647379184427; 
 Tue, 15 Mar 2022 14:19:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm47362edt.80.2022.03.15.14.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:19:43 -0700 (PDT)
Message-ID: <650ae221-efed-6e35-a653-ff2170f915a1@mind.be>
Date: Tue, 15 Mar 2022 22:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220302212621.2357671-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220302212621.2357671-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libss7: bump to version
 2.0.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/03/2022 22:26, Fabrice Fontaine wrote:
> http://downloads.asterisk.org/pub/telephony/libss7/releases/libss7-2.0.1-summary.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libss7/libss7.hash | 4 ++--
>   package/libss7/libss7.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libss7/libss7.hash b/package/libss7/libss7.hash
> index 8e1d6635db..442422fcd9 100644
> --- a/package/libss7/libss7.hash
> +++ b/package/libss7/libss7.hash
> @@ -1,6 +1,6 @@
>   # Hashes from http://downloads.asterisk.org/pub/telephony/libss7/releases/
> -sha1    7112a0717293fc273d5d488e1387ad28abe4e9b3  libss7-2.0.0.tar.gz
> -sha256  5af00853cfb2bc6bcf050947804db132ae6872db0cd2ab24b5378828f78eda52  libss7-2.0.0.tar.gz
> +sha1  301fd3eff4387db6407cbc72c3fec9aed5bc3860  libss7-2.0.1.tar.gz
> +sha256  091f1c14dcf13a094021334218cde363041816fa5b5037caee38719e4e6891c7  libss7-2.0.1.tar.gz
>   
>   # License file, locally calculated
>   sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
> diff --git a/package/libss7/libss7.mk b/package/libss7/libss7.mk
> index 151b6a61b5..faa147c78e 100644
> --- a/package/libss7/libss7.mk
> +++ b/package/libss7/libss7.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBSS7_VERSION = 2.0.0
> +LIBSS7_VERSION = 2.0.1
>   LIBSS7_SITE = http://downloads.asterisk.org/pub/telephony/libss7/releases
>   
>   LIBSS7_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
