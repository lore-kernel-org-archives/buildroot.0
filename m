Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6655C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E69D61029
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E69D61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B83624053C;
	Thu, 23 Sep 2021 21:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hI2_4YzbnXvf; Thu, 23 Sep 2021 21:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE7054052E;
	Thu, 23 Sep 2021 21:04:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 126301BF304
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 096F1404FA
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBm5lIN9vdWU for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:04:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D346E40530
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:04:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id v22so27082752edd.11
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y3kQR5L5hvAU1NwPuzFH5tqBoHQyJe9Pm2J9FUjWNQo=;
 b=KkZsBmYRJDEAdaQLd/rkuSuGQGCtj3vQP3qo62g8fcEZdKBe0WiBQZMAStaO/KfKVo
 UfSfXTWdzJs2bst+DPtDM8u/wpG2E0jn+7stE+NdaFRUvjdVtHzGtg26EnXLtOmurePh
 M2+b3ww3CXN9KD9noteUXfWaXz7Gr9ye3Y0d5WsMWhsS/JNz0jrjZdBYbexfEycpbbRi
 1YPLBenqXnWumwsmjV3My7f4fr7lyYJKlOHiar0t6ixwoOmpL0/F1KolsZAbWFsLF9An
 4uO0jRvihGNkkY9esFOjoiDvYuhkpkVfqibu/7qnWc7NlxG86G2Bp8LLjBzZBnxKN/qW
 zJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y3kQR5L5hvAU1NwPuzFH5tqBoHQyJe9Pm2J9FUjWNQo=;
 b=tCmhWi1SQCfqN5hVZhz/qCKLq5wX7nC4cilsCbmGOZxG3vYnihY3YpPMl3YKlMR4OU
 somkvpMwgjbFb/Mtz5iqMLsXzECHlwM8jkL7GX4O4z+m1AVo8jKaoNXg54MqSqT0TcEL
 +ec2WTiavl0fIOYabN9yhegPUUr3RbviMuhSfTtGEgvSgGpwDI+gCpHVpKQprULenK3b
 Oe9WpMc84putv3nC6b7/ZIjW6el6ShAzv1RLavTHQde5PAxxdNvv3CGcd5Vzbtx+p70D
 hcLxmlN34XmE3LrHv7LnoS1jHO3ubrWaMUf3wiSU3+C+adJeuPSeD+jWpvxayZq/ujYZ
 d3jA==
X-Gm-Message-State: AOAM533H6OFw7jv+UWikD5aKN1Y5PlGese1jSI952d9Q2oJrwlfbwGDQ
 +0t6jGHgCViO9V6bDzzIa0NWJssNC+4XwQ==
X-Google-Smtp-Source: ABdhPJzXhawmHJUpygQ+KnpcNVCEKvGHFEitJ7uQ5g+YRo4ASec4/T5L022OZXuBnNGOznEy3sXVlA==
X-Received: by 2002:a17:906:eb0f:: with SMTP id
 mb15mr7486605ejb.113.1632431052453; 
 Thu, 23 Sep 2021 14:04:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d9sm4335282ede.31.2021.09.23.14.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 14:04:12 -0700 (PDT)
Message-ID: <97189c5c-6d7c-1d09-a3aa-53f193591a43@mind.be>
Date: Thu, 23 Sep 2021 23:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210919141214.3283829-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919141214.3283829-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump to version 8.1.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 16:12, Fabrice Fontaine wrote:
> Update hash of COPYING (Change mention of PROJ.4 to PROJ and change 'I'
> pronoun to Frank Warmerdam:
> https://github.com/OSGeo/PROJ/commit/b56f39dec5464cecd7bc1dbb24042bb51e5c96e5)
> 
> https://github.com/OSGeo/PROJ/blob/8.1.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/proj/proj.hash | 8 ++++----
>   package/proj/proj.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/proj/proj.hash b/package/proj/proj.hash
> index 27cbc38490..96d94e458e 100644
> --- a/package/proj/proj.hash
> +++ b/package/proj/proj.hash
> @@ -1,5 +1,5 @@
> -# Fetched from http://download.osgeo.org/proj/proj-7.2.1.tar.gz.md5
> -md5  befbafd25e65ddf0c26a8321d8bcdcd2  proj-7.2.1.tar.gz
> +# Fetched from http://download.osgeo.org/proj/proj-8.1.1.tar.gz.md5
> +md5  f017fd7d35311b0d65b2cf0503844690  proj-8.1.1.tar.gz
>   # Locally calculated
> -sha256  b384f42e5fb9c6d01fe5fa4d31da2e91329668863a684f97be5d4760dbbf0a14  proj-7.2.1.tar.gz
> -sha256  2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6  COPYING
> +sha256  82f1345e5fa530c407cb1fc0752e83f8d08d2b98772941bbdc7820241f7fada2  proj-8.1.1.tar.gz
> +sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index 03ed9c0a2e..bc924b41fb 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PROJ_VERSION = 7.2.1
> +PROJ_VERSION = 8.1.1
>   PROJ_SITE = http://download.osgeo.org/proj
>   PROJ_LICENSE = MIT
>   PROJ_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
