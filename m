Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBF7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:23:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1775B60EB2
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1775B60EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yuriev.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0437400FD;
	Sun, 10 Oct 2021 17:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kgue58h4atBV; Sun, 10 Oct 2021 17:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA1C0400EE;
	Sun, 10 Oct 2021 17:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3A231BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA90E40235
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yuriev-ru.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlqRK_dFngOB for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:23:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4DDF40229
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:23:38 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id a8so3363728ilj.10
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev-ru.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=jYKZMIhORoVLA/kt6CjwX+LOBWEWtTv3IPgJ4nmz7h0=;
 b=g5d5r7ZONVX70zeNGsyAS1yTQUarqpiAoHEtgjddnj7c4m2d2p2GTvdfQ6zRN+vg0K
 aee8STM9tGafjQIY6dgfgUKi72bFfF4q88aXaUeQDOkhhEYbQbjT1DUN2efpT6fVZ80T
 gJefos52oQ9V2AL7pPLUev2D6KFyoxeDiGZ1PWifuiXhhnJ6qgoxfFgkxyUpweOfNI7L
 6xx7DmEHgz+/uzzv2TvaejiNj2YdyZ4lCpyCjmqeYBHoPlcIkSEmaD8Adg3VRNMOT3Z/
 ZEMv9TbzH1bn7RrctlE/QP4pJtIVCuKdpJFTuViFjLIObJcreH96uVC3MlYU1fE5hbnD
 7ygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=jYKZMIhORoVLA/kt6CjwX+LOBWEWtTv3IPgJ4nmz7h0=;
 b=jHSFjgPS7LRymkYs3FK9cRk9SQ/Shf6jO9MZxlzTN5uyOjToceNTdKzcNLgZnobM8S
 GuJVdg7u/m0gRZlfXZK0BWKpoW1S1DctBcUJh2suQWTiIkudcCaPnuof+A0qy37zzPY9
 IyMMJDgLxXKg1WiwfHhUgh0t9IcwW39H8IG0eoog64mpd64pjW79yJCKVsHWjLLSfMq+
 ADBOk1SDwLy46nHVaP1eiyW4vzzH1Zhs3gEcvVv/uBiTGkbFgWc0AMFwNAFmwi7tlrJq
 G6uYwqdnx7zACGEjt3liA5g754mVVmtQPOi1Cto9nuTCGR/kv/ZMLhIFMIVPLjUaIJmy
 P9XA==
X-Gm-Message-State: AOAM530ahOsXwBXCQmjZczNidXyL99UH3+vJwzDO8qaJU+heTtkpdme5
 33pNOtTZsS1eiuDwlxLSwpXIM/d/VLMPUOo1/KUIoIgCboRHlSO4
X-Google-Smtp-Source: ABdhPJxETnLhJUYRupspIq8pjh06vSqYyltDYuFX0CdJJcXpEOux9401epJyUABYrUOAYm9nu7DHo85mBuCsQPmcZ9I=
X-Received: by 2002:a05:6e02:1403:: with SMTP id
 n3mr16617511ilo.245.1633886617803; 
 Sun, 10 Oct 2021 10:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211010163934.3169734-1-leo@yuriev.ru>
In-Reply-To: <20211010163934.3169734-1-leo@yuriev.ru>
From: =?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
Date: Sun, 10 Oct 2021 20:23:01 +0300
Message-ID: <CAO2+NUAyEud4cWLVY0DkPHciePGa7aEh9HeuzMX40mQnfEEL_A@mail.gmail.com>
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

ChangeLog: https://github.com/erthink/libmdbx/releases/tag/v0.10.4

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
