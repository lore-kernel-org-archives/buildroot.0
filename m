Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023DCCD98C1
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9920C6137D;
	Tue, 10 Oct 2023 20:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9920C6137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b55FVg2Fjs2o; Tue, 10 Oct 2023 20:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3C860F96;
	Tue, 10 Oct 2023 20:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3C860F96
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA351BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0359641731
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0359641731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSzFDvkcUsy7 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:51:17 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFD77416CA
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD77416CA
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53d82bea507so1735489a12.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696971075; x=1697575875;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yJDpRreS2uM0vVWNB9243pOfnDM3HcAmDcFzLyAeh50=;
 b=NOCsnfucGhlaJQrHL/5QMwdSiWCqSD1pMgNOQBsR3gNX/B/sU4cMRBH9MafWzk0RbM
 dBMhvn9hI0hyvyjiGObCc5V3AnR6sT0h1ACfFqTxXsgCP+Q8zkkRgUUSAd8kPte0WMuU
 nn2gcVp5O2UNAPmPs+G4xyOGYpw+OkAbhyOXyxfSJD7V2vlPaBvbTVyDdIqXMxmGX4wc
 oJcCRjuwF8yywRjjLeX1RdWKZ4pbKLbu5FhrypaNIeYe8IsY8/lYpFOJ69BPkI/QD0Ko
 hWSSZ3PeCKp2bQggErSgjm0rbpcZITt68LNzwfdGaUWDC2UQ/KadytBFRiUBDf1mVMra
 Bt9A==
X-Gm-Message-State: AOJu0Yygb0L92KVBtw3QO7p+xMt/Ztgsc7lulWExzVLPZ0NjKjSf10Rm
 pbi65Ys3aM4yzIsC75d06C9MPcwOyubytOghk0w=
X-Google-Smtp-Source: AGHT+IHtHX5WL6ailpn1wwfqIwQePoEnIDNRgqnENwK4D9f1BYAdCMXMpM9OUc9n+W98vIVu4ctwwQ==
X-Received: by 2002:a05:6402:a52:b0:53d:a1c0:410f with SMTP id
 bt18-20020a0564020a5200b0053da1c0410fmr1820761edb.2.1696971074947; 
 Tue, 10 Oct 2023 13:51:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05640214cd00b0053821dbd4dasm7941725edx.22.2023.10.10.13.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:51:14 -0700 (PDT)
Message-ID: <24908e21-304c-46f6-bc39-3c7e88d383aa@mind.be>
Date: Tue, 10 Oct 2023 22:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231007183053.12650-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231007183053.12650-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696971075; x=1697575875; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yJDpRreS2uM0vVWNB9243pOfnDM3HcAmDcFzLyAeh50=;
 b=QfEO6DpC/B4DNhFhEOwpoRLMc+pm/U5s9ANUFynYcZlaZqz6EZzGVYp/etH8mENq3j
 N4nb05dM4uFB8mBAgMAb9FdLeuZ3Rx4VjLdO2X4vxoyqI9o81lxYJva0/7gGLPRYB4dJ
 szGj6nRfdnFpidbO7YozhmI9jY/Jz8ILhcEFpJU9idZcwhmlfNmN7otuI9vBAGs1or53
 Hty4BmbRD1WNKu5+/va+0tvUGP3nlfEjaN540IU3W4i1ANP3zHjjzCyj6dpQcMofvKSM
 xU6G1Wo6LdTWlnEQ+avIu2bhsbsB1aOYLN7mLwK2oLBwr3mwuGOzy5djtQmLsehLkdaw
 GMpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QfEO6DpC
Subject: Re: [Buildroot] [PATCH 1/1] package/setools: bump version to 4.4.3
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



On 07/10/2023 20:30, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/setools/setools.hash | 2 +-
>   package/setools/setools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/setools/setools.hash b/package/setools/setools.hash
> index c353e1f609..6a61fc2809 100644
> --- a/package/setools/setools.hash
> +++ b/package/setools/setools.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  998d12d01852feed1889110a4ca81090a47a2d9b47368e4dfe2b94d68696c813  setools-4.4.2.tar.gz
> +sha256  29f5e7d98764a6942b2e32c8aa44da6a618882818c79599ade967ece0cf1dace  setools-4.4.3.tar.gz
>   sha256  0e58d74751e394f39748c7b7b4039d6a883b5def9711160668ba962b52e69e01  COPYING
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
> index b80d25a6b9..efb3869e5b 100644
> --- a/package/setools/setools.mk
> +++ b/package/setools/setools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SETOOLS_VERSION = 4.4.2
> +SETOOLS_VERSION = 4.4.3
>   SETOOLS_SITE = $(call github,SELinuxProject,setools,$(SETOOLS_VERSION))
>   SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-flex host-python-cython host-swig
>   SETOOLS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
