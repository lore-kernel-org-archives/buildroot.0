Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAF6C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34742405E5;
	Sun, 24 Mar 2024 14:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4iO1TLaGxi9; Sun, 24 Mar 2024 14:56:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7634405E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7634405E7;
	Sun, 24 Mar 2024 14:56:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF8A91BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD07400E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WamfWT6cvkH for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1014E400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1014E400BA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1014E400BA
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:56:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso2176608f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292201; x=1711897001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JK8OuIy66K/Wflp9Hjh49pyWTMBFaoRaoFXVccEf8cI=;
 b=OiWm6q+oQ44tpevlYaUwHWVvloQlXJVL3MZsNoCmcelRPstpVSswXe38tL8LRB3Xpq
 n944l6jhONF6qoB0hH5YknEcnShzgeVrOMkhDFLptj9KgPWGeuutlNxkrAK8sGBq+/G5
 YNR4IBXnrghFrFhF5KYhyMxUgHw9Xgr8gdTn+Tn8b7dTzfu1rRy8dW+f+IJH7KtK8/vI
 J4YhWzRwVy0qPQpUuT0bnCC1JwV/OF0DLI7uPLrMOvT8jHbx2Jaf6vyVs+VV3QrRFLOo
 xzSn+O9x8za6Ml3j5o66q5IHs/aDRdM0Jrt8T+GHgda60vrbU+bN3sCaM+gYISBCRCQk
 ubsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3K33DKdO/otnm2d+F6/66Is6YTLTjFxyq8vTlnKzj491PrbRSiVSB/5dGSpHHdoTONqRDRVQp+OXX4So7Vv7sWH8F5ThDDg==
X-Gm-Message-State: AOJu0YyAmoVMiuomzKF1GMcCERSvU/is+F75DlFbpaKLfKGegEmUhWjO
 sG0SkbWEjN1vANmUJPmxFfT0n/nVqaIIhXbp9tL1UC6pepfSSyG10focREA7+R0=
X-Google-Smtp-Source: AGHT+IE0VKqD7Oblff0sQMTee3EMkgqzYbtQE6NDKZSivnIt0vb51lnlDSXwt0Lbwyu9h5+xIDunpg==
X-Received: by 2002:a05:6000:174a:b0:341:c53b:edb4 with SMTP id
 m10-20020a056000174a00b00341c53bedb4mr2580920wrf.8.1711292200956; 
 Sun, 24 Mar 2024 07:56:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:56:40 -0700 (PDT)
Message-ID: <622060a2-a7bc-4370-b5c0-8fdbd6fb9fdd@mind.be>
Date: Sun, 24 Mar 2024 15:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240324130638.29838-1-bernd@kuhls.net>
In-Reply-To: <20240324130638.29838-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292201; x=1711897001; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JK8OuIy66K/Wflp9Hjh49pyWTMBFaoRaoFXVccEf8cI=;
 b=hcAhNhdenPJXpyk8SL3++vgAoP7pNkJeT0IDhekN49nG8jhzNkN7T2pHULN7whxwPY
 2/waTn4HfzTmR7XaQYAQMd4Eoa3BqiyjucOhH4TPYoW2gG/H73I+faY1oG0prvCgY375
 z30Imgc3JI5qmdfIXS5xTwF1DKt8s320j2wBrOha84mFKI2dlcAhubsqFdD4LcqlmwL9
 sX/ZeveclRze6HVYXpNEzs/ZulPdFhDuUBJApr+f3TASeUdB8cTa6ASqqPKhzR4Ri5NM
 xFiCMWxTYxHPxK0re+yMNHgTjewl9VeSXVsdfEQheGDcgLKlq1U736mCR51JUEGAYgFR
 WNdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hcAhNhde
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 14:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tvheadend/tvheadend.hash | 2 +-
>   package/tvheadend/tvheadend.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
> index 62c954234d..972db9300e 100644
> --- a/package/tvheadend/tvheadend.hash
> +++ b/package/tvheadend/tvheadend.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  99a2fd954d8e620029759f5a65dc09271c168cd047a6a152a0fe643de64823cf  tvheadend-b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f.tar.gz
> +sha256  e3f05da73596097757fb4c0f9306e415b1772f26a52b5b86c50d63811e7e65af  tvheadend-c63115464d8f6556fb4cac93ce8740afea1b00d5.tar.gz
>   sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 816ec6e161..8f2e37b122 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TVHEADEND_VERSION = b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f
> +TVHEADEND_VERSION = c63115464d8f6556fb4cac93ce8740afea1b00d5
>   TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>   TVHEADEND_LICENSE = GPL-3.0+
>   TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
