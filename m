Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CB2C43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 05:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA9060E94;
	Thu, 23 Jun 2022 05:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA9060E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgRYyJvGev0q; Thu, 23 Jun 2022 05:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E5160BF2;
	Thu, 23 Jun 2022 05:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E5160BF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C19C61BF20F
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 05:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A910284608
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 05:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A910284608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOUORgtyvOkr for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 05:52:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5507F84571
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5507F84571
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 05:52:10 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-101ab23ff3fso21584697fac.1
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 22:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tu4nfJkbgp2LrUMiWAtEpUbXzbMSOo5Ewo5Drz/56tg=;
 b=uhJX8O6p7HfDRwFsAb6qyvQXfIXs5b4v3mPAz4hzCs7QQlSOI35zCvxVvMh61/gVtu
 z3/8KTagnuk/pH7dd3gsjEMksY6whyHap2jdEcYKoVapqheS5Bsq+o4a/OSJJ3EuuE7f
 gUhX2Rqefi76psh2BmiTjvGMcq4Iu4tXQkIUncdEvo/yxaej/M5mc38itNSrEdqa6aPN
 IAQHa42TqYR4skMmdmA0Ur5xum00a1FVS3SNMC+EmmbW1g8nNdAXDNi6J823oOdy8qu5
 xw27wvB6vQHgk0JQVZqnu6FzhxGyBeiD17xBYf9bjXnkFA4McYfWpx3iaqike1uwI1Cz
 V9jQ==
X-Gm-Message-State: AJIora+hYP9wu9MOpjsYmtyU9bedm+TytKT9czx4rFFdk3pBOsVq7C7L
 tPZuBu6bD6R5+0xxovFGSt1s11rUfY3WiXjpU3A=
X-Google-Smtp-Source: AGRyM1sJ7ZEnv9xh5h0hQ57zwTATDbpL6B7pnkD3g3Ud/N27bc/C+hCNKGsgqZcD1jTqkKjw/2ID1LD+glF4e/frCdY=
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr1425413oaa.99.1655963529205; Wed, 22
 Jun 2022 22:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220622212045.573-1-james.knight@collins.com>
 <20220622212045.573-2-james.knight@collins.com>
In-Reply-To: <20220622212045.573-2-james.knight@collins.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 22 Jun 2022 23:51:58 -0600
Message-ID: <CADvTj4oBhC8JWcr3M_4fEfwtR2ANCg1F5BU1dWNuqytJTLvFTQ@mail.gmail.com>
To: James Knight <james.knight@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tu4nfJkbgp2LrUMiWAtEpUbXzbMSOo5Ewo5Drz/56tg=;
 b=iwRjAI1xlSQ28M9Vqi6sNuxMIvyIYjtHzPwcf0C/DAcrdFspd3v/vD1hUxQEXFYRY6
 1EvIbmnfLw3SF5NncrP4UVlA4brGC8Ry1iVnaYI6VGJ25D66UfEGiIW1aIs9xxQ69cxp
 7BZN9gwWs+YJSpRpf7BPfjl403G8SXROHDit9yyBrqsbMmrFAewSclQ6k/tU1W9+PtjY
 yNr5KceM7wQia9xcZ6HaVgu45pwzUiMn73kyGpdYH7rjkAbHzTxJzLzWsvPjmQ103g5u
 n35DLohgO/ioXqRGbMKFK8PZ7em0HlRaAPpbMj5oGqsxrdqfjEyoF94U/9IwKobteoAs
 +oFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iwRjAI1x
Subject: Re: [Buildroot] [PATCH 2/2] .gitattributes: default lf line endings
 for text files
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jun 22, 2022 at 4:09 PM James Knight via buildroot
<buildroot@buildroot.org> wrote:
>
> Default the line endings for text files to be LF. The building of a
> Buildroot project is most likely always invoked from an environment
> using LF line endings. For developers working with various environments
> (e.g. Linux and Windows), defaulting to LF can help improve a
> developer's user experience. For example, with a clean checkout on a
> Windows environment, a developer can trigger a configure and build with
> two commands in their desired VM/container, without having to worry
> about configuring `core.autocrlf`:

Been a while since I've tried sharing a Linux cross compile env with windows
but I recall things tended to break horribly due to filesystem case sensitivity
issues on Windows based hosts.

I'm curious if that's an issue you've run across with these hybrid setups.

>
>     make O=~/buildtest qemu_x86_defconfig
>     make O=~/buildtest
>
> Signed-off-by: James Knight <james.knight@collins.com>
> ---
>  .gitattributes | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .gitattributes
>
> diff --git a/.gitattributes b/.gitattributes
> new file mode 100644
> index 0000000000000000000000000000000000000000..74dcc97d294192e61f4b241dbf4aa10449de5626
> --- /dev/null
> +++ b/.gitattributes
> @@ -0,0 +1,2 @@
> +# default lf for text files to help with cross platform development
> +* text=auto eol=lf
> --
> 2.30.0.windows.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
