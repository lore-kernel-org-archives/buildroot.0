Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990D0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61A7F40B73;
	Tue, 14 Jun 2022 16:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHx4o6SU4Tor; Tue, 14 Jun 2022 16:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5268640B72;
	Tue, 14 Jun 2022 16:57:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1A1E1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C044E83312
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZSLjmk0UFR6 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEDAA832B3
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:55:30 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id x62so12497681ede.10
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vGCn3BX0t/2tjbHg7/g7ACQfaGM7uwoUUq6UIlkxbB4=;
 b=B/pl3COq4TuU1FlOTJTbMWgB/Q/zjEzYrGGIkPwXc/8dvlNIEV7S2sFJ6I7qVt2bnf
 p83LW/IngqEl5EfyU2SO+1w0IXINInsDFuM2/403X5loNyjA19/DGFCNBZmfn9KNKIpE
 7+lJ1U1sPWrSUL3qoF1ArB83AXTZNkPkgNnRIZoc3oqNRU7GTxzu49bjoptS6fX8FW6Y
 9lBbSZYgHzJ2dsaR/IvvtVS0LhIaqRaaFpItb6bb8rbwdpqFJ3IBDUx+uJRfO+gDYcmH
 +bJNwMLmJLj/OtZLdssgFqM0yXr6kdtX2oRMi71jhMwL4Woaos+Gvy/1MHm/O9NDwMNJ
 IKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vGCn3BX0t/2tjbHg7/g7ACQfaGM7uwoUUq6UIlkxbB4=;
 b=sIcLMLNQoRqIrZnrsPSlIWQynSGNwhe+FbtarbXuDjDnMI4LdBD3A5Sr/tqkVw3fFM
 wET3DWzOR5jw3cghVLNbyedgSQu4Y0LfbeGJ4UJ4OJdZThBNYCAe5/zkqlir8SV1G6qV
 Zwx0cPGReW2F+Ng4sUZ95qC2lhm5AFPV0MAJLUc8Tv7yR/PCgGExcH7k9r47rVWWA5B9
 TkS3RExEwmf4Be/jLBuvpu4w30umHy8cbcqVsMaGvcf/yWeN3v2KwPLoc/0jnNRMC98y
 A++cUR2rExfECkLD7BXSh1dwJaVTir+bT61Md94Mphr5Z2HUuwEmZyRLT38cnLyd8XVn
 WvwQ==
X-Gm-Message-State: AJIora9+UGol415KS0wJ23NFpvX2RszeYoQODVzbjfGBfSeXX1mL1wXb
 8ThJsI9HUO62ssxd6CvJTtfiycugQsaclQ==
X-Google-Smtp-Source: ABdhPJx4iII0z/UM2ss+mEiTHH80Rs/Nt9JZp2fzmtkmt7XLgiX/MeJYLaw3kapOxrDwlwZr11Kbig==
X-Received: by 2002:a05:6402:322a:b0:42e:1778:1f1f with SMTP id
 g42-20020a056402322a00b0042e17781f1fmr7334952eda.115.1655225729177; 
 Tue, 14 Jun 2022 09:55:29 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 z15-20020aa7cf8f000000b004307c8e1c3fsm7320676edx.34.2022.06.14.09.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:28 -0700 (PDT)
Message-ID: <d818eb1a-387e-f46d-71e3-850cf7470ea7@mind.be>
Date: Tue, 14 Jun 2022 18:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220610205419.1913-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610205419.1913-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediasdk: bump version to
 22.4.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/06/2022 22:54, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-mediasdk/intel-mediasdk.hash | 2 +-
>   package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
> index 8e7db05e6d..d0604cebd2 100644
> --- a/package/intel-mediasdk/intel-mediasdk.hash
> +++ b/package/intel-mediasdk/intel-mediasdk.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4e53b750b1e5423c154a7abb56747a5892e27f3c848af8cc6692d208b9063360  intel-mediasdk-22.4.1.tar.gz
> +sha256  edaba06c0d190d8029ae1eed039f3c6c4cdc60ced3fe2e88788659294c31c23c  intel-mediasdk-22.4.3.tar.gz
>   sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
> diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
> index 33ec994f91..17f06b1f92 100644
> --- a/package/intel-mediasdk/intel-mediasdk.mk
> +++ b/package/intel-mediasdk/intel-mediasdk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INTEL_MEDIASDK_VERSION = 22.4.1
> +INTEL_MEDIASDK_VERSION = 22.4.3
>   INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
>   INTEL_MEDIASDK_LICENSE = MIT
>   INTEL_MEDIASDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
