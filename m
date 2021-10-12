Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61338C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 13:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D9461040
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 13:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8D9461040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yuriev.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F718403C1;
	Tue, 12 Oct 2021 13:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ny7gIs4P7U4n; Tue, 12 Oct 2021 13:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD59B40364;
	Tue, 12 Oct 2021 13:25:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 611811BF5B3
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 13:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9C380E8D
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 13:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yuriev-ru.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8-Dc4tiUH2H for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 13:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4304380CD7
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:25:35 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id d125so7731059iof.5
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev-ru.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=7yorwJ4LMSBLR6lcu5+NttxpjXggT9gKzJAaCUflVVw=;
 b=5z97eKETwYbOYnf0OdN31y6d2stwPkyDuOLie7SbkJ4rFa9VlCwS1lL1ZXLrSicwT1
 FSSTtP/yMXsnhze3ZHrSlfQRPKeI2WdDcguxBclJJVNJIqnmbm58mwlMo+nujZI/hj7s
 qU/bDoSARg2Z0bf8CMl59e3XnJPSsnJnANBB9QzV8FrUMy6MIECIGvhmCgeomL911olk
 wTTyQBQz164VpKIgiS/bmeKgshpsMszXSrr0iHrc54Y1vcXKvISUtQJuBERsXfS7IcSj
 jSGpWa+RjWuPelXAtRSEq7hygoDACzqxE0qdPSOlTh0+5p89ueqL00XF7wWXNfrNgLxQ
 zS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7yorwJ4LMSBLR6lcu5+NttxpjXggT9gKzJAaCUflVVw=;
 b=Vr4lyPLfTP+eu0Ob99/IiLEBb8XVOWMJVpVEq9OPJQ1uBSJSFKiqRKcNZjdvIRTDaf
 NXJalrUOub2rlQ3bsWZopWr05Wqlyi2NIju440fqpEqaYuCrAcvR/BTuB5LzXvqY+kpE
 qv6fzJmWl12KzcUn3srBI9gxWoIikjbWPBfH122pWEE13Hejl4BLzM8W95tOIvLeY7Qy
 OSMkNLJcyfFO7F8HFHw8DOLYAnlhm9SVfIk6sG8JHI56uVoEGa+JDS5ENpg/qj085NJV
 vJ256wfysUcgmQoJxvzdROb4LJxajjrXPTVO3Pg4ler82bVNzkmSDacl9KRrsWXXNC42
 m/aA==
X-Gm-Message-State: AOAM532wWayogT4EWSnoUT2RKt7WU9abtj3L/LEothYXoMmahO2u4Hps
 TuZhBPZco9wGAMGeRymK/wJ7RaGWarCZBleWoOOHGAgoHzfjKFOn
X-Google-Smtp-Source: ABdhPJzyewMPNOquwCTpbWJH3qpzKsQcIn5fWj36ZZrIVG/UXF6MrGZHsN+Vrwv2fNwG75Dywb8AjLGSjHXnnnnOMQ8=
X-Received: by 2002:a6b:6b08:: with SMTP id g8mr2838880ioc.199.1634045133698; 
 Tue, 12 Oct 2021 06:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211010163934.3169734-1-leo@yuriev.ru>
In-Reply-To: <20211010163934.3169734-1-leo@yuriev.ru>
From: =?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
Date: Tue, 12 Oct 2021 16:24:57 +0300
Message-ID: <CAO2+NUB72pb3R5YZBdD49p1eCxj6MkHmiGUj2bUfOVhD9M7jBg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.10.4
 (stable, bugfix release).
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please abandon/cancel this patch from a queue since a regression was found.
Sorry.

Regards,
Leonid,

On Sun, Oct 10, 2021 at 7:39 PM Leonid Yuriev <leo@yuriev.ru> wrote:
>
> This is stable bugfix release of libmdbx.
> So it is reasonable to backport this patch to all applicable releases of buildroot.
> ---
>  package/libmdbx/libmdbx.hash | 2 +-
>  package/libmdbx/libmdbx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
> index 7cc835a96a..326cf57bb6 100644
> --- a/package/libmdbx/libmdbx.hash
> +++ b/package/libmdbx/libmdbx.hash
> @@ -1,5 +1,5 @@
>  # Hashes from: https://github.com/erthink/libmdbx/releases/
> -sha256  a8f2436c4d008886e044f568a22bda44329fb1c67f175d91a929ff8e2065340a  libmdbx-amalgamated-0.10.3.tar.gz
> +sha256  e11d5339a1e1cc34407898933b62a208936fd761a2cc31e11244d581d1d2b5d0  libmdbx-amalgamated-0.10.4.tar.gz
>
>  # Locally calculated
>  sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
> diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
> index 76bd56dfd7..f38e4a533b 100644
> --- a/package/libmdbx/libmdbx.mk
> +++ b/package/libmdbx/libmdbx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -LIBMDBX_VERSION = 0.10.3
> +LIBMDBX_VERSION = 0.10.4
>  LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
>  LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
>  LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
> --
> 2.33.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
