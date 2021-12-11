Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ED1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949C7426E3;
	Sat, 11 Dec 2021 20:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mgZFYkiCwQLT; Sat, 11 Dec 2021 20:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C720B426DF;
	Sat, 11 Dec 2021 20:50:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAC3A1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA5DE84ED2
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93fypyllDib3 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:50:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F200084ECB
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:50:51 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r11so39657935edd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3pcGWL58FFEfAmgeWT7kl2hebwFYsGpkiJgDEqureMk=;
 b=V5UwvckgM4M/A5k51krOhw7aPcIfKSYkoAEy2z+4vKOF8SxNkBdBVw1flQCmUyoc6T
 NvepoukjTn4Duia2rY904l+T06vXeaeZcP37jltj4BhZYavNoXXYfuJZtxXGsb+3YD48
 SrbAdbav4T0AMm485Ax4RzJUoCW+lcWcl2YoeSH/9WL6gTSSmTwFL6W3fwaVAQNCAyCg
 75o4FQc9g7A98oFBj/cOfqQ2blT+2K6Ja77kFj3uE3y7UHRsZaGidpWCRDvFqGfAs68A
 CZFngrLbDdko7wes5pPIr5GGC2fMLMRZJc0FuW5ZyMltmZDoyVpwQhOmzFj8+UA4AILV
 hLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3pcGWL58FFEfAmgeWT7kl2hebwFYsGpkiJgDEqureMk=;
 b=XQUHLoIv+I7VC9JDlawRd/zoMPa+x9spdPawcRQbEuZ6O5QndSee3zbJPY1wd/BQmb
 G4rfn2hzFyCEB+nxAl5tZrkAqETcIsB7cS2+CZ0lqoiRDcdNL7o+bLVcppJ5F1PdH2le
 MKBtbjGrt4m+89Jo0QQD3nE/vG2JALOE185fuQvpDkBKA5X0zmMVZrVHYOTkjvN47TjT
 Sxr8ckALnTPSl64idmehzLzNRcUSe8jiiYOAu9dPAD99mYdCwB7sPqRtjjmSKS0xbagG
 iLtbZGk9+29HWjIKhSkIJg8dP0lsx/WO6lFn2nTgmr0Y71ILpAvJ88YSs0wAiNsETLfC
 WRMw==
X-Gm-Message-State: AOAM532+jiVAcpmsnHsw9kog+3uyoPpMw+iS6Y63wIxn5a/7ZA87Docl
 BUFTYXkhZrdWORtuFSWZwfF5zw==
X-Google-Smtp-Source: ABdhPJz6BLzC89uGBaufzQA8AeXJERaCo0gK4FwJ5Gmq25PexCdiX46yJ/r6glX+WozECtXUFlVWxA==
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr34300362ejc.417.1639255850043; 
 Sat, 11 Dec 2021 12:50:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q21sm3615004edt.45.2021.12.11.12.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:50:49 -0800 (PST)
Message-ID: <fd726696-4b37-4ea8-8957-ad7e175981d4@mind.be>
Date: Sat, 11 Dec 2021 21:50:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org,
 Peter Korsgaard <peter@korsgaard.com>
References: <20211124205919.25777-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124205919.25777-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/grpc: bump version to 1.42.0
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/11/2021 21:59, Michael Nosthoff via buildroot wrote:
> * update patch 0001 to match changed target code
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[snip]
> diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
> index 26d0d315d8..978d5e4fe3 100644
> --- a/package/grpc/grpc.hash
> +++ b/package/grpc/grpc.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e5fb30aae1fa1cffa4ce00aa0bbfab908c0b899fcf0bbc30e268367d660d8656  grpc-1.41.0.tar.gz
> +sha256  b2f2620c762427bfeeef96a68c1924319f384e877bc0e084487601e4cc6e434c  grpc-1.42.0.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE

  The hash of the license file has changed: the BSD-3-Clause and MPL-2.0 
licenses were added to it. Indeed, it turns out that some third-party code is 
BSD licensed and that the certificate store is MPL-licensed. So I created a 
separate commit that adds those to LICENSE [Peter: for stable]. And of course I 
updated the license hash in this patch and applied to master, thanks!

  I think that this is the first time that I see the license hash doing what it 
was meant to do: detecting that we need to update the license information.

  Regards,
  Arnout


> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 1bb4bd2b98..df23a4a3ff 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GRPC_VERSION = 1.41.0
> +GRPC_VERSION = 1.42.0
>   GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
>   GRPC_LICENSE = Apache-2.0
>   GRPC_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
