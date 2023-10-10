Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A502DCD98C1
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5910360FD4;
	Tue, 10 Oct 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5910360FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCezHQAqJarc; Tue, 10 Oct 2023 20:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 664C46137D;
	Tue, 10 Oct 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 664C46137D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4E931BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE19481CDC
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE19481CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qEkuELcGErH for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:52:19 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B16D881C6F
 for <buildroot@busybox.net>; Tue, 10 Oct 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B16D881C6F
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b29186e20aso1041991866b.2
 for <buildroot@busybox.net>; Tue, 10 Oct 2023 13:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696971137; x=1697575937;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p70uXzybSed+O1z4NcBj6g5E0FRbj9jLhVvAW4A35oo=;
 b=YJ7sxQG5US7w6RutpNvhFBrwYNeddTauoPPDr2mA/xuZqXuvmdHo8Yq61iaGszs8c8
 pFe6/JRHSdVhkVGs+tVLRl3RjMJGV5DvYCa+/Ts/2M2tfTMKpSJ40+0DKPGCFPW94pmE
 /xTR9dmFZQszagGopsicl4RpYrEQ7ckzilJJV8EIA7A+MzOmLrV5YqgDR6veP/mJU5m6
 7R9dI1M9pTiLj4F/YNPKtsY9banEcXK/rJVZz5dYuvCZH/O1e8mFcgs/YrfFlk0u+vAD
 u/u54jWRxj8Ixnnf1mANerFXRfWUYrE7qcgV1E6iF26fL8+3ByByb7etrOohK9ZYhg9T
 je5g==
X-Gm-Message-State: AOJu0Yz2wB9Qb3mh6YXah7q/DF/MevwUQdpNRJmVgyrJFdxMMymx3up3
 jehOdmOx4oKz/FXfM5CF1G4Dochg2f33vBfQkcs=
X-Google-Smtp-Source: AGHT+IGxNtFHqZWDkgOB6zYxEHZmnP1uOWPhuOR2QpxQrTWxllofknd0E5xU5DbrJIcQbAqOtzajAA==
X-Received: by 2002:a17:907:7897:b0:9ae:3c6c:6ecd with SMTP id
 ku23-20020a170907789700b009ae3c6c6ecdmr18269659ejc.19.1696971136688; 
 Tue, 10 Oct 2023 13:52:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a17090622d700b009930308425csm8807412eja.31.2023.10.10.13.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:52:16 -0700 (PDT)
Message-ID: <f341237a-ed98-f1b5-73d5-0ca8692b6c8c@mind.be>
Date: Tue, 10 Oct 2023 22:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20231007192225.3670096-1-francois.perrad@gadz.org>
In-Reply-To: <20231007192225.3670096-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696971137; x=1697575937; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p70uXzybSed+O1z4NcBj6g5E0FRbj9jLhVvAW4A35oo=;
 b=P2w+jvkFmF2LCAZykgzrCE0TNvOPMa/u7ue3pabUwynDSILFjkk/nn7y7ruNFRq3fK
 zMKobyHIsKb3OoXLeymByDXt9bD9pJpjQhSmDZowq8NKr/TgLQf6tOpcs/pn8tBGmOss
 mCCoSiMuOlQvz+Zx9DFaaXWnOexri8f8jp3B5W2GCr2NMk1+TV1OifwxGrmNLfQwwfAh
 zzSfrtBJprGo9CJcrw8Apz2xmwIXeID4F9wLvOXE/SCfxDRkephpAbtcnTuZCHCebXQI
 BYdLl8sb7uioQdpObx9svNe4gP7lVE1EKdaMlcWnsLsg6QcO0gWialwfsO+bP0D7UrO8
 wkQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P2w+jvkF
Subject: Re: [Buildroot] [PATCH] package/mbedtls: bump to version 2.28.5
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



On 07/10/2023 21:22, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mbedtls/mbedtls.hash | 2 +-
>   package/mbedtls/mbedtls.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index 6aa6d0235..d0cd0b210 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
>   # From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
> -sha256  578c4dcd15bbff3f5cd56aa07cd4f850fc733634e3d5947be4f7157d5bfd81ac  mbedtls-2.28.4.tar.gz
> +sha256  849e86b626e42ded6bf67197b64aa771daa54e2a7e2868dc67e1e4711959e5e3  mbedtls-2.28.5.tar.gz
>   # Locally calculated
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 62eda6ec9..1b941e04f 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MBEDTLS_VERSION = 2.28.4
> +MBEDTLS_VERSION = 2.28.5
>   MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
>   MBEDTLS_CONF_OPTS = \
>   	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
