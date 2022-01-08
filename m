Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886ABC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492CB81470;
	Sat,  8 Jan 2022 15:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_t_CPc6zVmC; Sat,  8 Jan 2022 15:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E339813E2;
	Sat,  8 Jan 2022 15:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14A931BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02D89409A2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbnSs56DJ63Z for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0022640942
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:14:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r9so15395725wrg.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KMURj4mub3bkHjrG77WsHlqKBTcYz1nXz45k3sqQi/A=;
 b=cMMWN/jL7Q39uoWykmZeAJ9Ut14fOed24r+ky2gnvuKMDqmLnxplisdvm5bJvebXrB
 0b4k8iWYfS3Lsl6X9U86+PP6mkzytB8nThsOH+KH6QXM8/b0qBA/mYEc4+sIZgLD/bHe
 q+DLr7UZEmkUwtzBynODcVde9p3dUhk0AJSk0nUxLXNCktInOIyMJAd13dFdsK3uiW/k
 Xij25dMz5r+RSyPbbBQCZtaJCJDaxyLkOFpVIpb72GZFKXXIoL6+I+xmCjAETIhrQQ9G
 ORb4gvemLQn2xBtVAzdUjPwRPw4mrtnmK7tk79HpeUer+NbDe0V2IRObQh8hRDUsIUkg
 freg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KMURj4mub3bkHjrG77WsHlqKBTcYz1nXz45k3sqQi/A=;
 b=A6LTz98HCk0d2gG5ynqConeNfFKo9uOtX3wbZPlO1r3TtTacpiDnJPBVZkpy+KeKJM
 EqrBUxW4utkyahmNLJBzkVp5qMv3m+aCgZgWZ4EA1i4MqdHUG0UMsWxJEF2z/4QdB1d1
 FgEdDn8evEQTh5oSBGyMYT0HLICZ5F0e4xwvP0mVsRy+kE6+me55Zttr5ud4WT1SVWUd
 7NvGsR3N9KqlXJaHc/abylXjwTndxpd7TrxuOjWP+raFEJJG3DbWWTBJUkhaNbmUSGe3
 TUaXweVwKHHMKMzoNov6fgv7PuCMu6S3YwQBtjdIRSqnbVLlw38fCUSuWcyZ9+fvOosV
 mdbQ==
X-Gm-Message-State: AOAM531l3ei1zNQaVpL8DMjYRttN6bhMhAs5vrI4r4GcuPiqRKVjaiyb
 I15MJgHDDBBZ+Zm3x2vxdeUjFQ==
X-Google-Smtp-Source: ABdhPJzpwjVYCV0pY2DJg/HoZfLt/tyqRZbCLnphLRoX6rRNcnEaar8uuTlxMvyO93zmjRt5LItr+Q==
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr5816057wrx.12.1641654898285; 
 Sat, 08 Jan 2022 07:14:58 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b1sm1978013wrd.92.2022.01.08.07.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:14:58 -0800 (PST)
Message-ID: <3ecdadc4-142b-2806-69d1-43675bc81814@mind.be>
Date: Sat, 8 Jan 2022 16:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220108124922.157020-1-romain.naour@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108124922.157020-1-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH] package/terminology: bump to version 1.12.1
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



On 08/01/2022 13:49, Romain Naour wrote:
> See:
> https://www.enlightenment.org/news/2022-01-03-terminology-1.12.1
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/terminology/terminology.hash | 4 ++--
>   package/terminology/terminology.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
> index 7e9658482a..2ad10af76f 100644
> --- a/package/terminology/terminology.hash
> +++ b/package/terminology/terminology.hash
> @@ -1,3 +1,3 @@
> -# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.0.tar.xz.sha256sum
> -sha256  74d2d3b253a77bcb215fc36eedf0ccb59643452e2ef15c510430ffaa6034dcf0  terminology-1.12.0.tar.xz
> +# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.12.1.tar.xz.sha256sum
> +sha256  f8ced9584c2e9ae87452ce7425fd25b2d3e122c7489785d2917890215c6b5aa9  terminology-1.12.1.tar.xz
>   sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
> diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
> index 787c9ad137..c3125c71ec 100644
> --- a/package/terminology/terminology.mk
> +++ b/package/terminology/terminology.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TERMINOLOGY_VERSION = 1.12.0
> +TERMINOLOGY_VERSION = 1.12.1
>   TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
>   TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
>   TERMINOLOGY_LICENSE = BSD-2-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
