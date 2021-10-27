Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3ABC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 12:49:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2B5D6109D
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 12:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2B5D6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABE3404DE;
	Wed, 27 Oct 2021 12:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSer1VRAYz8H; Wed, 27 Oct 2021 12:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C8540225;
	Wed, 27 Oct 2021 12:49:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0DA01BF368
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 12:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFC4C4019F
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaf1T28vERTc for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 12:49:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 588E6400BD
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:49:37 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g10so10153391edj.1
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5bjeThecFzaY9caWaOfzuLT1DWeBNVOL6+cFAPflLzo=;
 b=FMV1pmWQgqKeB2+qtXoQy1kQCXeenOPfJXeSjEmvwkTp4c2iFvDpSkaN3wDy/7fbaL
 yPYp6llIAq0opRXWPS85+nA424ObUF0FiSnZl9qEexUcJeitkEcrigzylZgXz6S10I0A
 lT3uV9Ay8DlrzGdVKn37W3Hed6eXOoPu0/IXGeSYhD3sho/0825K3BBk55QtREVgrGTf
 aLxQTshH/5dotngnnQr7HAWYLZcfStnDlgj1pfVJE9TlgOPrOmcj5+trmF3zSZ7dNNw8
 cAecRDkoUol57enmMTXbs4pwcCEiwM8p/op0n7+l0FawTGn8vV3GnuVFIJx4vVdIJdmc
 CNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5bjeThecFzaY9caWaOfzuLT1DWeBNVOL6+cFAPflLzo=;
 b=a6PLoibv+gFzQKAcKyLy43p+Qo1MKufKFv1GgdD+TpgkE8sm+whA9SBUyQJpKcB7IU
 yPHQlK0NLf0Ws8GP6Vt1KX1v59J7GbNnSmdPLYalmaKyoCSJ44/3LFuKfJ4xB5WGwt+h
 1tFNWbph81bn+Y76msEeZtDRv6RfNIIFpEg2XqLj2JdbRINv1lSSNM0ITquphJq8EiAv
 BE0dVWx+65f8SHOWvJlzbiAZ7MHDr6bIaf54v24bMD694xv00yppBQBLyA4LOvlMMBXY
 hrgPuRcqq41bQuEerwAiJU/JzS25YwGmOaZaElVkR1qEBtpNNaSbqBa5wrtd/z7dc8Gw
 37vw==
X-Gm-Message-State: AOAM533ApyOqd+HXwRJQMNMcyGwxSuv3qy60om38TCGfM3QzpfpNzgQr
 4camHDZETyXCZ2Eg/sGL+pgWcABn0HYWKxAl9+I=
X-Google-Smtp-Source: ABdhPJyTfejsU+Bm6TvmkpoZhD/Q7edUPWuRkXjRAr5N+CmGDm7vIJMy4FlvChZUJvE7cUS05HnStBywmYZtS5rDilE=
X-Received: by 2002:a17:906:8478:: with SMTP id
 hx24mr38647713ejc.67.1635338972474; 
 Wed, 27 Oct 2021 05:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211025064938.2279526-1-james.hilliard1@gmail.com>
In-Reply-To: <20211025064938.2279526-1-james.hilliard1@gmail.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 27 Oct 2021 14:49:19 +0200
Message-ID: <CAGm1_kte4RY7McVzFVRfUQ86=GiCG_cQjFaneowib7mTSkgicQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.60.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Mon, Oct 25, 2021 at 8:50 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

Best regards,
Yegor

> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index f3cfe66072..0702a7685a 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.59.2/meson-0.59.2.tar.gz.asc
> -sha256  13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49  meson-0.59.2.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.60.0/meson-0.60.0.tar.gz.asc
> +sha256  080d68b685e9a0d9c9bb475457e097b49e1d1a6f750abc971428a8d2e1b12d47  meson-0.60.0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index bd03a7cd67..0f989ac8a1 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -MESON_VERSION = 0.59.2
> +MESON_VERSION = 0.60.0
>  MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>  MESON_LICENSE = Apache-2.0
>  MESON_LICENSE_FILES = COPYING
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
