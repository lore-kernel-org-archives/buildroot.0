Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A841C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:54:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D066560F6F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D066560F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2BED6088B;
	Mon, 25 Oct 2021 18:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuJUg9dMf7SZ; Mon, 25 Oct 2021 18:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1912D60890;
	Mon, 25 Oct 2021 18:54:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA5401BF989
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D59AD40467
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kkzpEovH0dG for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:54:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3339A4025D
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:54:37 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w15so3200708edc.9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=K01DXqcfz7uBPr6++nMnfJ+Ky3lVLzJtiPKZSAQ9vfo=;
 b=R9hV1iUK+g6OJbQcsFrsAPT+6eX91n49qvFVKBFjc4Chh416+3mKliV7SfzhSnKIbp
 rbxe2c3HR1HlHZ98n+XNHtH7Ar67bjcBSHeifVEcW+i4zwlgu6Y4gWle0huWgEWASIXI
 2ahiDX5BZEovln5gRrbcWjhT6grj0JXHKftQmca+pzUjDnSc6yNze2uA7dCbRgpC3trX
 B+Wn8vpSySPJm1qMXJYNP89fyBV6Y8gK7xSUYFLGFB8Omo2kAzwMlxpqeZcYuZLqWO8f
 xaWHzHbOJ/a3YE6xR6BvEfd3X+wf5eCtvk5zxAO8BJeAWhudzNY/QYCj+WqHcxYesRBQ
 /ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=K01DXqcfz7uBPr6++nMnfJ+Ky3lVLzJtiPKZSAQ9vfo=;
 b=mOjrfl1neyNgPVOlkQWCzUU/Y0xNRe6zUUsrArfqmvRWY21EebFM79hwtpUsGgWP9L
 9hY5t7I1ps7/nUl/1bPZwkG+2Grgy8zUkwf/uj+UjBloFTMgSc5xQMA+Me+iqijCANUS
 0FTT+Ng9JqXYCiEy5u6/0GJ19WpWDnwxYe6vb+PeFyEdTdKt637z3ZJha9bzB3MDOzxh
 xaPvTh42dNR1Mz36OKzqAUUZ8wn+wgQ8pzhrPXbstEsMfr9gs5V3iOeDRoTBW+/rhJAY
 q16c0O7lrPOa0Ql/OeXGXBzL/axk2tAHYT1w8F5HimtCG4GJSQA5HKf+77vaTahTljDH
 8PPA==
X-Gm-Message-State: AOAM531pqYAnhCT9nYA9Gmse8c2RoP2ugS0gcueR9yk+sm4y5pH6ihUh
 xjtsrJRCXOE3FC97uFdMSlfsIArs8EgLgLuH
X-Google-Smtp-Source: ABdhPJzgzaYvipiVVM9rod1JdpCMadLbvLlvIN7k+oL+mXEDOt8GwC0hCiWUZe+GOtXIFO5sWeMGaQ==
X-Received: by 2002:a50:e043:: with SMTP id g3mr29118345edl.196.1635188075432; 
 Mon, 25 Oct 2021 11:54:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j11sm2863628edt.49.2021.10.25.11.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:54:35 -0700 (PDT)
Message-ID: <782a9bea-cf76-3123-a700-761749f2d34a@mind.be>
Date: Mon, 25 Oct 2021 20:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211010224220.1111960-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010224220.1111960-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/gqrx: add missing reverse
 dependency for gnuradio
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/10/2021 00:42, Giulio Benetti wrote:
> gnuradio suffers from gcc bug 43744 but gqrx that depends on it doesn't
> take into account the gcc bug. So let's add it as:
> 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio'
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/gqrx/Config.in | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
> index 60942c36c8..9faa50603e 100644
> --- a/package/gqrx/Config.in
> +++ b/package/gqrx/Config.in
> @@ -8,7 +8,8 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
>   comment "gqrx needs qt5"
>   	depends on !BR2_PACKAGE_QT5
>   
> -comment "gqrx needs a toolchain not affected by GCC bug 64735"
> +comment "gqrx needs a toolchain not affected by GCC bug 43744 and 64735"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
>   	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735

  This should have been an or instead of an and.

  Committed with that fixed, thanks.

  Regards,
  Arnout

>   
>   config BR2_PACKAGE_GQRX
> @@ -21,6 +22,7 @@ config BR2_PACKAGE_GQRX
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on BR2_PACKAGE_QT5
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
>   	select BR2_PACKAGE_BOOST
>   	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
