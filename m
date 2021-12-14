Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E20C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B06148128D;
	Tue, 14 Dec 2021 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m11JJbmOl-Gt; Tue, 14 Dec 2021 20:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06FF881290;
	Tue, 14 Dec 2021 20:06:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A649A1BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9089E4060C
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piyjPME-kp62 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:06:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4171540114
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:06:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id e3so67897582edu.4
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=w4OhNmjrhcNujMbYYvmZxGj5w168Pu6JlaY1VEfUus4=;
 b=f2FLN0m1mXxTqTtcoPsziZpYno9URTtagS8et1ZD/U5yiiafFzev7/KMN0M8JGG+mN
 tlj73r6aoJJbBQrs0PL8J8KWe2s3PxtBEFpCFiVf09RTW/CfXeEUdFTdoQBCA9e6ZAM8
 fVyUUty0eHPK1h5XbOuuZugLaMHQ+ymWEP4zww6u/01x2XBEz/10DD+HBPGUQlvZRVqF
 yhYMDv/yFn+9U3oJmjnOdS4sQ1zAM6lrBYKPXARSk7SlX92ZbRyOeIuao9JTpLWe/Afe
 obyUyTxHPsNHBmRxQ9fWK3WVzxxkZToc/KKs+hxG1B4J0cZiCUctEL/wpKQnX1Ow7sSh
 WuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w4OhNmjrhcNujMbYYvmZxGj5w168Pu6JlaY1VEfUus4=;
 b=7MqDeuVvlAzWIUv0fDUoeZFlrGWSmxBQRc71R7JbbZ1RmK6qoaVOSJ6qHb8bMW2Iqk
 AK7L4FV/5JpXksgS4rAAeCYB0VxVvM/CTYVh6sewBURH2kCsd8dyEp4+XTQMw8DXrLgM
 j+q2781eUkaAFAZewaLKj558pFB26BnCbmQhtrSr3ZQQ2C2dUWXqCwq5IJ8Az+wkOBLA
 b2S6YFJHjO2GIBU8CGsoMjwzABXiEjM6LYtbqJV8oTgahdrTGXcygq1aJuuK6uJxxPS+
 TsVCcY/kYPjPOik8Ftc0VQYzz9YczYJDwnsTYQ9wvb82xrZ0AgEgRBrz9h5n0+IzvbP/
 niVg==
X-Gm-Message-State: AOAM530sek7sgJxijPsbzUJkYX50xWO7IP6cvFfYt5CvC+HCf0Bwbr4G
 CKUrdqpqwj9//zSqsIyBTBaUIEZHVb74qw==
X-Google-Smtp-Source: ABdhPJzDAFG88E8F76HgMBQTFx8aU+tA6fDdNUCgxTKYy8zSRdin08nOEVx6E8vAvya6GKlID8nRPg==
X-Received: by 2002:aa7:c78f:: with SMTP id n15mr10789266eds.344.1639512389392; 
 Tue, 14 Dec 2021 12:06:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dy4sm292551edb.92.2021.12.14.12.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:06:29 -0800 (PST)
Message-ID: <02c00ad0-598f-aec9-1307-a508c35c750b@mind.be>
Date: Tue, 14 Dec 2021 21:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211213180710.23890-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213180710.23890-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/bcm2835: bump version to 1.71
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



On 13/12/2021 19:07, Peter Seiderer wrote:
> - bump version to 1.71
> - change home page and download URL to https
> 
> Changelog (since 1.71):
> 
>   - 1.71, Added SMI bus support, courtesy of Benoit Bouchez, including new
>     functions: bcm2835_smi_begin(), bcm2835_smi_end(), bcm2835_smi_set_timing(),
>     bcm2835_smi_write(), bcm2835_smi_read().
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bcm2835/Config.in    | 2 +-
>   package/bcm2835/bcm2835.hash | 2 +-
>   package/bcm2835/bcm2835.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/bcm2835/Config.in b/package/bcm2835/Config.in
> index 4c3eb2cbfc..8c77a62a11 100644
> --- a/package/bcm2835/Config.in
> +++ b/package/bcm2835/Config.in
> @@ -16,4 +16,4 @@ config BR2_PACKAGE_BCM2835
>   	  the kernel drivers are doing, and potentially conflicting
>   	  with them.
>   
> -	  http://www.airspayce.com/mikem/bcm2835
> +	  https://www.airspayce.com/mikem/bcm2835
> diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
> index c9f7acfd01..2cdc35fcee 100644
> --- a/package/bcm2835/bcm2835.hash
> +++ b/package/bcm2835/bcm2835.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  c062a8a1cf1dc1ba1ca3978451d2f668b66f7ce5548200a0f4a8bb2117b1b2c9  bcm2835-1.70.tar.gz
> +sha256  564920d205977d7e2846e434947708455d468d3a952feca9faef643abd03a227  bcm2835-1.71.tar.gz
>   sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
> diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
> index e9d7256f19..4870aa10ba 100644
> --- a/package/bcm2835/bcm2835.mk
> +++ b/package/bcm2835/bcm2835.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -BCM2835_VERSION = 1.70
> -BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
> +BCM2835_VERSION = 1.71
> +BCM2835_SITE = https://www.airspayce.com/mikem/bcm2835
>   BCM2835_LICENSE = GPL-3.0
>   BCM2835_LICENSE_FILES = COPYING
>   BCM2835_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
