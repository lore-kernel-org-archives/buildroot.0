Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC77C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DAE440602;
	Tue, 14 Dec 2021 20:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdeiPMl9zTly; Tue, 14 Dec 2021 20:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BB83405EA;
	Tue, 14 Dec 2021 20:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5F81BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B084402C9
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxE4riAEaaen for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:08:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86E7C40261
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:08:15 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e3so67912136edu.4
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WfxFZf9lubaye6en+2tkP+8UD6ig2Gu7Y92EsVisUG0=;
 b=OrTftvnGRrX7A0Rpawa04YaOuBqaHdG5xszAqlGC6DAz0YJXWr6G7PeKG+uvCiGZ9C
 2bkH2J0QQCGhrxjk2VevEfmZpmWf2vtbjRISnnilvY2iRrBf9PvcekjA4nAntNed5FMf
 78b239Te1mj7wY/BOYWLkQ5o//f9lHgrafC1XiPNBI58o3HPJ9uSaiZCvRzzoVqwreOI
 bGFEb/ZyM3y99JobvL6aGys36hj/q4p0Ql3f1TbYR6lO1MY8GlxGdzM2l141DhbPk1N4
 vB7aTpepRgx6HPemaNWhvDz+MtAiD8YYXzcXy/HlOfqNS31JGuYV632+ltIRvNMuqe6S
 1oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WfxFZf9lubaye6en+2tkP+8UD6ig2Gu7Y92EsVisUG0=;
 b=aTAoPlUxqXuKwVjw3F5CxY9KnSdk1/auxIZLUyfryewcUqazmOI0H7r9lfaAC0JWgL
 mjbiN5ae//bhQSWo2FLf9LqyuhwJ7Hk/5WpqiK3ET4OC7bpQq8Hjb4u+itulOjSYgUgP
 QrqYu4AaM9PkIrInHvr0laDuHmxtRR7DU/+v6xL34mKHFzhZZKDu9rNSNaZSQ9X8rTSe
 xHJyr20xL7zuY2sAMxmHB7aXniH4q/0QaPhM/oV0mcUQRLVr8o27L7aYHtYePmq3vlKY
 /mbR6zbeGzbExyKqfqSawCwoUeU/UstQxsd3MofU5sikpWFA2CYlIcdTj3JzHUJim55M
 5gGA==
X-Gm-Message-State: AOAM531BZy4gIcID+6td3mMin8HfNUCZPeQqWZjuxo1gNOu7VQp0oUyX
 aEBQYbJyfOg6USm/1QaXJyQuKg==
X-Google-Smtp-Source: ABdhPJzIctazJ6YJvaetzp4nOfwePDIqpK+NIxFViA/P2yg8vCknZMkv5B2x/MLrpriyh64RTVP9Pw==
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr10820019edc.138.1639512493728; 
 Tue, 14 Dec 2021 12:08:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sc27sm246970ejc.125.2021.12.14.12.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:08:13 -0800 (PST)
Message-ID: <82bc6bd5-70b5-924a-9c32-2d951453ff36@mind.be>
Date: Tue, 14 Dec 2021 21:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211213203208.10983-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213203208.10983-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/iw: bump version to 5.16
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/12/2021 21:32, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/iw/iw.hash | 2 +-
>   package/iw/iw.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iw/iw.hash b/package/iw/iw.hash
> index 126b1cb673..33dd117368 100644
> --- a/package/iw/iw.hash
> +++ b/package/iw/iw.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
> -sha256  293a07109aeb7e36267cf59e3ce52857e9ffae3a6666eb8ac77894b1839fe1f2  iw-5.9.tar.xz
> +sha256  4c44e42762f903f9094ba5a598998c800a97a62afd6fd31ec1e0a799e308659c  iw-5.16.tar.xz
>   # Locally calculated
>   sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
> diff --git a/package/iw/iw.mk b/package/iw/iw.mk
> index 32ecf93c19..9bf6ddbfc6 100644
> --- a/package/iw/iw.mk
> +++ b/package/iw/iw.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IW_VERSION = 5.9
> +IW_VERSION = 5.16
>   IW_SOURCE = iw-$(IW_VERSION).tar.xz
>   IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
>   IW_LICENSE = ISC
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
