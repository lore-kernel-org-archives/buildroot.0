Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54185C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 22:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 038BA40277;
	Thu, 11 Jul 2024 22:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lPzcqVYFgks; Thu, 11 Jul 2024 22:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A54444027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A54444027D;
	Thu, 11 Jul 2024 22:10:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1051BF860
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 062654027D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q52Q4PzHA1Ti for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 22:10:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEF3E40277
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF3E40277
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEF3E40277
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 22:10:14 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so19437771fa.3
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 15:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720735812; x=1721340612;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hzXFFvwF5iOCh0DHfukvn8+Llj9sd1PQqdwTOE74EZ8=;
 b=W/+1VfXFPSdOXMs43zJFVy4JezXr41D+lQ+DsnxqUM//YzkFK8XhpE9+UagvW7jRef
 BlsCyY0q6SkQ3hoPcJBHxFDOToPiWLw46SZQRqbkqec5RT2vSTPNKXEG0nlhg5FVz8kI
 kNhK4FWJ5Gs7kG3po5IVq8B5PVlq0VDmJlTrQj5Gq/d9uKayB01KxebTzVAny6u8e2mf
 nocU5xOzTsUlIELuAgX94+tkNRu1B9BGB83TLdfEqFSfeJfG+DjW60bWkOSIeJP9U8Jt
 VAaXqiiWdFgRKn4RNTMMV4wW+VXHm620HsWBXHEJkNk/h3fNKA/RlEbCpR63WbZJ3njA
 OpMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+F1fCofO8mZ6I/YBgk1XXiA1JhwDHfQtjyTPJlusmBnTGOlOxjlUgXojAdlBakbhRECdwmQFx+DbpP6orx1BRm3jHxY2J6A==
X-Gm-Message-State: AOJu0YwEDkZUF3jnnPT5iWjD/fMMNRJq4JU8TWmzHUACmalkODO9ep2F
 vWd/KzTSsW+5KTEHMnHJOFWXag8xcpOjznP5VFmAtCQnRxtPUQKkSv0e/TJuSN+vCQtRmfoJ4G0
 H1qs=
X-Google-Smtp-Source: AGHT+IH5kgSdAQ/2Nr+K5aRFqabyHJ5bzLG+IxrpXVMbcg9tKc8dcUJBbpMhztySBB8w4znh4b9+PA==
X-Received: by 2002:a2e:9845:0:b0:2ee:7740:aa74 with SMTP id
 38308e7fff4ca-2eeb30bbf36mr57329211fa.3.1720735812212; 
 Thu, 11 Jul 2024 15:10:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde84655sm8686604f8f.32.2024.07.11.15.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 15:10:11 -0700 (PDT)
Message-ID: <573976ce-c9eb-47e1-86f1-1d498391fd0b@mind.be>
Date: Fri, 12 Jul 2024 00:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
References: <20240610124539.1851720-1-wdouglass@carnegierobotics.com>
Content-Language: en-GB
In-Reply-To: <20240610124539.1851720-1-wdouglass@carnegierobotics.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720735812; x=1721340612; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hzXFFvwF5iOCh0DHfukvn8+Llj9sd1PQqdwTOE74EZ8=;
 b=I7giR0cDX1oEaxwKc5Ds1vXXecA5wkRuPMCEqS7mm5ZlUIOS2Jeg6PGJbUBRLkKDwV
 Xf0GnLgKwW9suGVip9s8uc3hAbozX8l4VmHuVq26vaTgDNo1ZNBXNgpk2XIEW+Z6O682
 2bxnRWzEOy1ez2qZr5xajOxSlLQQouXqpTMsi1T8V2xrg8NEgcmtBf6SD/OLd+OkWDit
 9H3EEbrpxXNCnHRd0BDj1VCKUh6uuR+4rKmyakp3GoR6p9hKI0ZKuFkagrMc8xxdkT3g
 8MiLQQ9DDWxz6a1a+KISIr3T8vMrLCNuURPnKgzia6im/k7TuppLb/SQcIWWbE0xud8R
 UT3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I7giR0cD
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: bump to version 4.10.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/06/2024 14:45, Woodrow Douglass via buildroot wrote:
> https://github.com/opencv/opencv/wiki/ChangeLog#version4100
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opencv4-contrib/opencv4-contrib.hash | 2 +-
>   package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
>   package/opencv4/opencv4.hash                 | 2 +-
>   package/opencv4/opencv4.mk                   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
> index 2e20717c76..05c30ea250 100644
> --- a/package/opencv4-contrib/opencv4-contrib.hash
> +++ b/package/opencv4-contrib/opencv4-contrib.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8952c45a73b75676c522dd574229f563e43c271ae1d5bbbd26f8e2b6bc1a4dae  opencv4-contrib-4.9.0.tar.gz
> +sha256  65597f8fb8dc2b876c1b45b928bbcc5f772ddbaf97539bf1b737623d0604cba1  opencv4-contrib-4.10.0.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
> index a4d0179472..ed00a317c9 100644
> --- a/package/opencv4-contrib/opencv4-contrib.mk
> +++ b/package/opencv4-contrib/opencv4-contrib.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENCV4_CONTRIB_VERSION = 4.9.0
> +OPENCV4_CONTRIB_VERSION = 4.10.0
>   OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
>   OPENCV4_CONTRIB_INSTALL_TARGET = NO
>   OPENCV4_CONTRIB_LICENSE = Apache-2.0
> diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
> index 15f5e37278..ae407e4381 100644
> --- a/package/opencv4/opencv4.hash
> +++ b/package/opencv4/opencv4.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  ddf76f9dffd322c7c3cb1f721d0887f62d747b82059342213138dc190f28bc6c  opencv4-4.9.0.tar.gz
> +sha256  b2171af5be6b26f7a06b1229948bbb2bdaa74fcf5cd097e0af6378fce50a6eb9  opencv4-4.10.0.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index e50e0f99a9..989d32b91b 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENCV4_VERSION = 4.9.0
> +OPENCV4_VERSION = 4.10.0
>   OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
>   OPENCV4_INSTALL_STAGING = YES
>   OPENCV4_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
