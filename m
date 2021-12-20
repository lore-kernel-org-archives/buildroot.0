Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE288C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6124360E69;
	Mon, 20 Dec 2021 22:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXr2LMOktpou; Mon, 20 Dec 2021 22:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B833760E39;
	Mon, 20 Dec 2021 22:41:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFEEE1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB0A4019D
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88iSSmnHVY2a for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:41:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B48A440129
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:41:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b13so15788072edd.8
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vy/iJedRYAkPo2CszQ/IAZD+fQbqmk1lP9sTzafTJYA=;
 b=RYlqg+XnlX85XNB8tgk+SkMUC/M0iDBZe+P9H3xK71To4N2DWEuEN2/5VkNADabxwV
 KDslOv0mvkWhsjve8dpGhOuiq2X7Tr0tqEtDM6xx1MC7N1AkKmmwUOjUslao1rknbh1v
 V7Ctoql2ZWhxcHqdNVmJg+85/iTv02Fgco83Su0NqNL5GOcMECpahfrLIr++yj3YvcRs
 ZEVmzwRmONl1sJOTDUtZBu9j8SruX/TJggxUcD0AervnszjtMZS1vCkqpqwr9J5JgpwH
 WqfTsHdId+yrUWcWzM0Ia/Y39LuJNyHSzKh3e/Zh8F/DlvJDhX8r3FozENpptTQ3RyhO
 WjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vy/iJedRYAkPo2CszQ/IAZD+fQbqmk1lP9sTzafTJYA=;
 b=fjjsiqAAg5WBOgwBaKRLrZaiYdRnl1jopL0zdsZRgP4JMAtwOwsEqLQe3l6aHcwHR8
 M8hFshLReApxF34ia4rbT2jOqwdKd0Of5myNsyBZDWpJF4TicfLDcSWy9fg6HNEKvh2v
 OCuctlMztksnMFVeS/u2Q99lhOYU/7a5FBsnsbvJMKiGKLbcR0bdCWdvxAJiRPe7UU+R
 Pf1GVkmPDSoAGma+2RDfGi1kbYcctcRNKlnA8hEnDcJPV2TQZfGKevBXWbMWchADEUrg
 H4iTP8gOYuvNAWNhD4XYjs04/Ia89Pll+xYOm8X5yzCxw5iXl4FkSoFgn7icKpJWaNOQ
 1b/g==
X-Gm-Message-State: AOAM53392iqYTMAaR8+n+vsn4Oa1s+LcKv2wAswBRnVvlTu1DcXgQxgV
 I1ACxIzf6W8fi6lMvWj4unkSjQ==
X-Google-Smtp-Source: ABdhPJyNfUTo1SqlKW3/b7xeoAlUnIR/zwVBcWRiDAghbo+GtSHxtYGetw63LYQck5jUo7UhB06vTw==
X-Received: by 2002:a17:907:98b8:: with SMTP id
 ju24mr261394ejc.516.1640040099744; 
 Mon, 20 Dec 2021 14:41:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qf14sm2765758ejc.18.2021.12.20.14.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:41:39 -0800 (PST)
Message-ID: <949ff591-96c1-3514-0c1f-3f6569ef467c@mind.be>
Date: Mon, 20 Dec 2021 23:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20211220084621.3346121-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211220084621.3346121-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/grpc: bump version to 1.43.0
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/12/2021 09:46, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/grpc/grpc.hash | 2 +-
>   package/grpc/grpc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
> index 0e81410358..3da1d9a323 100644
> --- a/package/grpc/grpc.hash
> +++ b/package/grpc/grpc.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b2f2620c762427bfeeef96a68c1924319f384e877bc0e084487601e4cc6e434c  grpc-1.42.0.tar.gz
> +sha256  9647220c699cea4dafa92ec0917c25c7812be51a18143af047e20f3fb05adddc  grpc-1.43.0.tar.gz
>   sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 025ab40777..2e8bc5049f 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GRPC_VERSION = 1.42.0
> +GRPC_VERSION = 1.43.0
>   GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
>   GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
>   GRPC_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
