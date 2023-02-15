Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6163FC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 10:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFDDB40556;
	Wed, 15 Feb 2023 10:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFDDB40556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UlHR7Nzkuzo; Wed, 15 Feb 2023 10:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2770140119;
	Wed, 15 Feb 2023 10:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2770140119
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85AAC1BF315
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 10:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A6540119
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 10:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60A6540119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_qR-a8WJDxp for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 10:55:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20107400B8
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20107400B8
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 10:55:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mc25so9819456ejb.13
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 02:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A8PvpVafkijamB8cxdxIvX6qb84W335GCXKFrtGnSXU=;
 b=6Z0CDZlBQfkmX+juBcQnITUZiD4GXhIR65eXOPdBdS0c45CK4iF12XRKJVLpNuRKyv
 a69gO0YCZJUrYaBHbl3U70EhgvLZR3xSH6Im5v2FgaS48NfMMiF8SqC/tsSzPpsi0sOe
 Fds6UAlg9YstnmR3ti9wq9PnnFR68MCPMiHWufnL9YcJ0f09Aad1WhTHOnTP7kbm6BHn
 zvdiALRo4919Kt4x/nh6Y9/2I0rV1qtGH4Kk/GJIaIWJSSeao3XUgHz54hXUZE+AQf0o
 SsOTg9Y37YjK0S1h74OhLuxoXqnbKw57RZkh2PiQSOrGEW1KAkVYRmQsIV9e0bEK++Qs
 Y/dg==
X-Gm-Message-State: AO0yUKV3wFubAdgA6HCXUvFew/WpicX0unCV2gVQ47ejW/1Yzhm3gObV
 HpdOwVGQMTs4WQl60dBMVyGOmI1HOtPxLP6o
X-Google-Smtp-Source: AK7set8o27pZW4Yw5fUGwPo0xPc9qrrCqf89lsE8mkOwhhXZlcuttIWFmnp5ybnNjwEJPthDyXsiXQ==
X-Received: by 2002:a17:906:1190:b0:888:7ac8:c0f4 with SMTP id
 n16-20020a170906119000b008887ac8c0f4mr1638495eja.25.1676458513040; 
 Wed, 15 Feb 2023 02:55:13 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm9641340ejg.177.2023.02.15.02.55.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:55:12 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id t24so6921696eji.4
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 02:55:12 -0800 (PST)
X-Received: by 2002:a17:906:4e84:b0:877:7480:c75d with SMTP id
 v4-20020a1709064e8400b008777480c75dmr879159eju.0.1676458511819; Wed, 15 Feb
 2023 02:55:11 -0800 (PST)
MIME-Version: 1.0
References: <12a7772dc9c30d31bc4dd7a4e15ca12425c14834.1676297701.git.stefan@agner.ch>
In-Reply-To: <12a7772dc9c30d31bc4dd7a4e15ca12425c14834.1676297701.git.stefan@agner.ch>
Date: Wed, 15 Feb 2023 02:55:00 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qeMthPt0qoiqSV3s=vAUbgY706MdVNjuXowXSLu61ArQ@mail.gmail.com>
Message-ID: <CA+h8R2qeMthPt0qoiqSV3s=vAUbgY706MdVNjuXowXSLu61ArQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A8PvpVafkijamB8cxdxIvX6qb84W335GCXKFrtGnSXU=;
 b=T3tiqC8GuaKKRP84yBR+FdZmO55c3gW8FAyeqU3wTle6Sr6pefkUSyKdcgHcHAEwhQ
 SU0EHpjJQQLuqI8g4LzV6FLUzh32Lpdl+uONgZ0R9EgTCwBNPE5qNAmqZBeWoH70olaS
 xRs7gikbOWFSf06divWcJ96NGgn1ENT8i902z9ydYL2J4qyt8bs9aeB+ThTb9snyQlEr
 AD77uQYBKBuUUjF6pGhTFB8kH2QQj1jDzqMYGrJbJo9A9bSHIUQ4sJzCcEz/Wet+6eW8
 qIe2S4Vst4Ay2pSus7GShAD1iTANlLzWJMWH8GRaUKwnI9NBh12n5/y7sOcGA+mQsAt0
 1mgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=T3tiqC8G
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: disable version control
 information
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Stefan,

On Mon, Feb 13, 2023 at 6:16 AM Stefan Agner <stefan@agner.ch> wrote:
>
> By default go tries to include version control (VCS) information in
> binaries. Since Buildroot separates version control from the build
> process it is sensible to disable this behavior.
>
> This avoids build errors when building with a git repository higher
> up in the tree owned by root. In this case the go build system
> calls `git status --porcelain` which returns with an error:
> fatal: detected dubious ownership in repository at '/build'
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/pkg-golang.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index cdc67b32c0..da9c9a21ac 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -45,7 +45,8 @@ $(2)_BUILD_OPTS += \
>         -modcacherw \
>         -tags "$$($(2)_TAGS)" \
>         -trimpath \
> -       -p $$(PARALLEL_JOBS)
> +       -p $$(PARALLEL_JOBS) \
> +       -buildvcs=false

Lgtm & tested

Reviewed-by: Christian Stewart <christian@paral.in>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
