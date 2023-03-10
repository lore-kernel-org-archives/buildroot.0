Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AABC6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D16E41BA6;
	Fri, 10 Mar 2023 19:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D16E41BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8evvM52UoxH; Fri, 10 Mar 2023 19:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEEF41C71;
	Fri, 10 Mar 2023 19:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EEEF41C71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0C461BF2F0
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A73F341B9D
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 19:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73F341B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-UCp61JVO7F for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 19:53:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2806F41B91
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2806F41B91
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 19:53:45 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id ay14so24993681edb.11
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 11:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678478024;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mvAB1/kSVBfQKf3Q5OweAoEN0w10ZsJx2lBMEabhWGo=;
 b=B2E2OH1rOs6cq5lawFky/MaO0otDFwmPwZEp8RaniuPwrGNquy8110C2xrrvQWafie
 ee/bwtPhH7kf5ejqmzHnSUOxfkkg00aaoom5NwH7tC6Ma/Q44NdLd/Vry2sUqjduQcdw
 t/rY+PBE+nitPLk3sDkYSjMkg9hQQJV4YZawmYygfMePDRyQRCk8UqS6Cz2Oa2dukjPW
 JttWUDZYnPMAvZeNSiN2PAlJ4mU+gVXIEwObJfa3Gae9/frkSPy7BgT6i6IOObGVkZOe
 f4tas/SbxHTyfJjKUqYT5NIjGtHJZlhJvviVM7V9g/7LGnDcyOjBm/xfS0HREqSSY8YL
 VqGg==
X-Gm-Message-State: AO0yUKUxAq/KQ+iuTD4YaUbVkm1MhVOuAMgyAhUi1vnLFIJG/i07HBeD
 3dm7yKSer1iE4nU/6TPIVWa1SQ==
X-Google-Smtp-Source: AK7set8v66utWdzSZ5qIOQuCv1Ez2aNSp3W7UoYh3fq4ttT5q/DeEx394KRIoUMEWQezHE4ndX4Qvg==
X-Received: by 2002:a17:907:80e:b0:90b:53f6:fd8b with SMTP id
 wv14-20020a170907080e00b0090b53f6fd8bmr33843899ejb.31.1678478023940; 
 Fri, 10 Mar 2023 11:53:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 dt20-20020a170906b79400b008ca52f7fbcbsm248991ejb.1.2023.03.10.11.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:53:43 -0800 (PST)
Message-ID: <27b9cb55-baef-0cc2-39e2-d0af894c0460@mind.be>
Date: Fri, 10 Mar 2023 20:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230310170611.425280-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230310170611.425280-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678478024;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mvAB1/kSVBfQKf3Q5OweAoEN0w10ZsJx2lBMEabhWGo=;
 b=U2yGDvIOHphw1ciFJS6fZw3o01UXO1E5lPjBmkiA7flKci2FhBikD6R3r+RaPgM2v/
 KVc2k3KAlj8TiOcy+s2M2t8E5oxxTw7Raoe2BYJhChxE0n6J3gXnhJF9O6Jgjp5hQ+js
 DJcCrTqdS/wO+6MINqc2MExp9YcWxmem4ALafFRb8Q9HwGVhWTNiO3KcdiHUDAL6MOFq
 ZlaXY/9bFvFx5wynit03tlMsBXuka5w14ZPiOLtXBN/7FwbqL69V07gY6Uea/FHgteS7
 JrkTZi38IXGBmf0ehiA/qi3hA0fYcas4iDwRcvT9DPFqFqj1bJoYZ0QwiLbOEZEEGohs
 bMeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U2yGDvIO
Subject: Re: [Buildroot] [PATCH 1/1] package/php: link with -latomic if
 needed
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



On 10/03/2023 18:06, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/112/112ec5cb0de6f55a29caf7ec563367afd28eb8a0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/php/php.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index bd7d5a8c3c..49f02d7f20 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -35,6 +35,10 @@ ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
>   PHP_STATIC_LIBS += -lpthread
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +PHP_EXTRA_LIBS += -latomic
> +endif
> +
>   ifeq ($(call qstrip,$(BR2_TARGET_LOCALTIME)),)
>   PHP_LOCALTIME = UTC
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
