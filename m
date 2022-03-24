Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47117C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDDE7415DC;
	Thu, 24 Mar 2022 21:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXUdfWtJfyws; Thu, 24 Mar 2022 21:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC78415D5;
	Thu, 24 Mar 2022 21:14:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7ADDA1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7387D40C15
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1bKhJN5cKgA for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:13:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B048401B3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:13:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id dr20so11676100ejc.6
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d4aHHaor9MMi7vcLAYBD3usNq5xCxfuzEEPWZV5uHDU=;
 b=B5HacMHwoQATS3WjLCcFTddA813clFxQAQa39nkyykOWTFuysznHmu/3Kgjn4BdIH6
 +rffs+IiT1DbI3BDlc4sgC7/8vV1U7lZqalO3bs5r8YObJDEEs+tzIYY8dsmQjxFRMVX
 2uGkhp54oLmYFdZr3MmAuWr30frPXdZbLmVGXxSBo9HgBqkHaw7DHVpjK0tJIPcN2I0b
 pb7KKzAGFXLPqDT5I5AxgvchrTKDY9xz0szqLs71DTksZHOCD2DrCjU4QcfP0zwTT64f
 +GU8cDdx04dD6DtIiNHFGYcLVRCtBjJhAkmVR6i4y6PYxy0KOQXekFgzLPq6wcwcgnrF
 52aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d4aHHaor9MMi7vcLAYBD3usNq5xCxfuzEEPWZV5uHDU=;
 b=iyhMz/SwiEYLHosjLRW0hDPZ/1YJ8QB/Ho8uw3J96q5F0kYe6j1E6+vq7KXYyXXYhv
 ujE2ulENQn9mQ9sWPt0G+ridiaYDiVFOWJbLzmJQcW6IaKr+b6BQkgiU/rYSF9gZKIIv
 +ueTQIMMI9uQ03aAEl5NxtUu3niZ6C9UTz50cHgzFfinX+WtNNAi0H6n4QXjzu+mfrIT
 k7w8ZPRaSyyOVXTWXhVFL2GU8ivwuf+X5T08bNoa1uOty37KfWUuOwFN0NrnWKhrub9q
 5LZmmy52EkplKR9olqPJHD70lI0eTNDZuFBJPnkVZPOeN8LtyQqcLl8EwKAiDjIWkU99
 I5BQ==
X-Gm-Message-State: AOAM533lfDHm5TNk9yRm/I/yJsSB39aZvZ1XBQ7JxBNOK8pQqmduqnVW
 cqUuMV7KRMJFSMqZuZPVeLwvnw==
X-Google-Smtp-Source: ABdhPJy/brVNpI57mAeMrDqBWkVnwlIHk7S0xKP8eF8oHo29uAtvoBsasvHs5QnkyfCjMByW9SroRw==
X-Received: by 2002:a17:906:3144:b0:6ce:de5d:5e3b with SMTP id
 e4-20020a170906314400b006cede5d5e3bmr7997260eje.689.1648156436502; 
 Thu, 24 Mar 2022 14:13:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a170906161900b006d43be5b95fsm1601971ejd.118.2022.03.24.14.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:13:56 -0700 (PDT)
Message-ID: <f1dd3a5c-d860-16c6-32a0-b07d33e429d0@mind.be>
Date: Thu, 24 Mar 2022 22:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220315214113.2322315-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315214113.2322315-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libbdplus: bump to version 0.2.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 22:41, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://code.videolan.org/videolan/libbdplus/-/blob/0.2.0/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libbdplus/libbdplus.hash | 6 +++---
>   package/libbdplus/libbdplus.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libbdplus/libbdplus.hash b/package/libbdplus/libbdplus.hash
> index 6abc0e4970..2445af6e82 100644
> --- a/package/libbdplus/libbdplus.hash
> +++ b/package/libbdplus/libbdplus.hash
> @@ -1,5 +1,5 @@
> -# From http://download.videolan.org/pub/videolan/libbdplus/0.1.2/libbdplus-0.1.2.tar.bz2.sha512
> -sha512	e00e7bc9f52b9275646593b753ba646b052255be94a7241965f4dbe4734f8f6a072973ed4b9997957f939236b0633897c295749f79e232188430795be5b5087b	libbdplus-0.1.2.tar.bz2
> +# From http://download.videolan.org/pub/videolan/libbdplus/0.2.0/libbdplus-0.2.0.tar.bz2.sha512
> +sha512  172e4932fb5540fbdb5b86e1d42cfaddf60b81416d2de50c8add83fb7f1bd7c296c975fd84a6ec42566977086dccfe07db5ce696038862bc75c6494c647998d6  libbdplus-0.2.0.tar.bz2
>   
>   # Hash for license file:
> -sha256	592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c	COPYING
> +sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
> diff --git a/package/libbdplus/libbdplus.mk b/package/libbdplus/libbdplus.mk
> index b0e8b1488d..600cb6b545 100644
> --- a/package/libbdplus/libbdplus.mk
> +++ b/package/libbdplus/libbdplus.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBBDPLUS_VERSION = 0.1.2
> +LIBBDPLUS_VERSION = 0.2.0
>   LIBBDPLUS_SITE = http://download.videolan.org/pub/videolan/libbdplus/$(LIBBDPLUS_VERSION)
>   LIBBDPLUS_SOURCE = libbdplus-$(LIBBDPLUS_VERSION).tar.bz2
>   LIBBDPLUS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
