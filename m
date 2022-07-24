Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3565C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C45A424C6;
	Sun, 24 Jul 2022 12:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C45A424C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmPE_gunL-9c; Sun, 24 Jul 2022 12:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3427B42492;
	Sun, 24 Jul 2022 12:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3427B42492
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 428AC1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB8F84C44
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB8F84C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuqdyOZljyy3 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C355D84BD2
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C355D84BD2
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 12:17:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h8so12309978wrw.1
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 05:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3R5QGru0NODLyP6moQaDVNL7Mhpg9L0xGwO6ziKLDlc=;
 b=I24kzKJzlJihucHnQYPwsFqazcQaqYVgzCHQijVIznzGyihskZEU3hanxJPCfUBIRe
 HYiVqoMzjbrx+lw+qKAKK4QtlqqnxfI4/X9gF+kn6hwL9vQUgI2kRv7dZJ8jZUX9bb4G
 GMAIfd73YW1CSRZpkSpf1B9gBROTKaqjizKPdTh2CLkxTf4fr3uB2tO3cmRLgEyA/dhV
 w3kG7N6FTSy6X6rDay3qL5ugmLDOTMaLxeigkU7I/4BYKO3c/1c/n+jL1mMJDjZ+uKJf
 5o6zvZMEu0QtUHWjzwZ0jCGv2x/N5g8V+zxOL5Ru520/EDvPZDaycRSw5V5erlcStcWZ
 X87A==
X-Gm-Message-State: AJIora80Kz3hb03J5/LNpU6eDzBDpckG0jEywclmUsPzQcBArTsZb2Wx
 khEPJGbagCQTezvUvTzTryjCicLDdKEr1g==
X-Google-Smtp-Source: AGRyM1stLH7qNjHxrZjYTwQvyDCKJQ1eLAHeegUCuDeD1uZ11OChr9GM68Uryy63W6Btq/9/KfLDGA==
X-Received: by 2002:a05:6000:1a89:b0:21d:ab1a:b177 with SMTP id
 f9-20020a0560001a8900b0021dab1ab177mr5021160wry.594.1658665053518; 
 Sun, 24 Jul 2022 05:17:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4fc9000000b0021e6277bc50sm7445024wrw.36.2022.07.24.05.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:17:33 -0700 (PDT)
Message-ID: <4c3a8b85-6028-23d1-2b3a-707b1a8632df@mind.be>
Date: Sun, 24 Jul 2022 14:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220724063254.3305395-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724063254.3305395-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3R5QGru0NODLyP6moQaDVNL7Mhpg9L0xGwO6ziKLDlc=;
 b=Yo2nkP54zeS2eRm/zurW/isEwZtnfPM0rMZQpt3OlRjx32OfByXmPCPm/ESbxhNGuA
 Qt7TLAL6zxQIWtaN+Y/GRpmDwbsr3fcCBk/2yfwCDEC5jcUjV6UhHAXM317lt4k2PF87
 fQzbM8VHATzH9lM6Zu731vcgG698xUqRmjBmyixQusMvX1NABoRkyFBGN403FbZUmzxn
 KTeSHSgdj4D+SxJReRtzh9kqM3p6i60AS0O9sjtmVh68xzB9BA77TNd1gF+leMBQ1pn3
 tMzL2G6+tNmy+zk58dPHUwucQZSYmLcSDmj+1WHdkNtaryYFnvcTX3ROGC/WXTL9oAYy
 i3rA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Yo2nkP54
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.23.0
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



On 24/07/2022 08:32, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/janet/janet.hash | 2 +-
>   package/janet/janet.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/janet/janet.hash b/package/janet/janet.hash
> index a93129cfa..473955e39 100644
> --- a/package/janet/janet.hash
> +++ b/package/janet/janet.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  7c6969f8e82badc7afa28aa1054555c1c91d2858f9f45c41a82557f5c5ce85bd  janet-1.22.0.tar.gz
> +sha256  0b4d5d3632e0d376d9512ea8ea262f31f75c132b488dd7870f472acae709a865  janet-1.23.0.tar.gz
>   
>   # Locally calculated
>   sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
> diff --git a/package/janet/janet.mk b/package/janet/janet.mk
> index ad09d47c6..070eae1cf 100644
> --- a/package/janet/janet.mk
> +++ b/package/janet/janet.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -JANET_VERSION = 1.22.0
> +JANET_VERSION = 1.23.0
>   JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
>   JANET_LICENSE = MIT
>   JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
