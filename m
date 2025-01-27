Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7056C0218C
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 04:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C0BA402F4;
	Mon, 27 Jan 2025 04:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBLbRZYBOqJp; Mon, 27 Jan 2025 04:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CE8F4003E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE8F4003E;
	Mon, 27 Jan 2025 04:42:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DE9094A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 04:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D91640139
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 04:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mf7GrYgZPUUl for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 04:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=patrick.oppenlander@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E1FC40156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1FC40156
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E1FC40156
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 04:42:41 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so6914812a12.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 20:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737952960; x=1738557760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=guNhg2RNL136/kMWZbLX15ZtV+jeNF7HAHPl4H+R2e4=;
 b=gxOG4nqmI4bsnhYtb79oom6isqHf6rF0uddtupWaFEgmw7T8OxiQ1Ohu550tnDMMuu
 CJ3KVHYs46ZYrJoGlf58cLDw/HZFAjrzn3jGTiAt2ZfTIYYTzutL/fFVRUJ9JwH/8X0q
 eVWYU0gxaJRfOBTbXyrCKK4n5G1zGehCkevpJl4EKAKXpfgy2IIf2tjwUlAtIeAOX90h
 zHQuTxBLBno0MMbxQCA0URZlRrzQ3nk3HHaq3ETLwqkmFaP7MwYhMIFw/ofWzrf2gIzy
 RGUpZ8HYbZKo1rhBbJfsQeSm0ENNSt411uSwYYCLDkkTHl+oyDwixo+HJnSYXQO4T/Oy
 LlWA==
X-Gm-Message-State: AOJu0Yxy0ap7PykPr3xrH4Uo+nCXBb7shkrSsvQorsLZJPPfqEz3YZlI
 +xwctZltVDwTzZPsR3WwO64Jrqv2g4UYH+6E2zFEQ6RICBPeRF7SESSMXOqC5Osva4i/GO8aI+y
 vLl9VnRAaqFJrzL3hSZSTu5uz6n8=
X-Gm-Gg: ASbGncuHHuqwf3wU4kZ6uiHMxHjlidsdLHH/vT+Z523wBrxWfrEghq2TVYy/u9KzEkb
 J+37YQvHnQzJ/3HzFv34tj3FfHVoJoOlgfuc+QzpU8gj7anXfiCFm8zsjCKk40dTwU4LElu34+I
 yYgacjKijYW8wMMg==
X-Google-Smtp-Source: AGHT+IEUDYK6SDWjCK3pipGZKr4CS35Pi7TXFHkSg8HMyLeVXdqphojWJ2QXhk3ID3uAviU5JZIQXmWqQlGPuNarkjg=
X-Received: by 2002:a50:f610:0:b0:5db:fc7c:be43 with SMTP id
 4fb4d7f45d1cf-5dbfc7cbf3dmr11821373a12.32.1737952959692; Sun, 26 Jan 2025
 20:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20250121031414.5907-1-patrick.oppenlander@gmail.com>
 <81e6726e7ebcce7cbf78df44fafe366a@free.fr>
In-Reply-To: <81e6726e7ebcce7cbf78df44fafe366a@free.fr>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Mon, 27 Jan 2025 15:42:28 +1100
X-Gm-Features: AWEUYZlqiTuyZJDfWSuvhjQncGeHRwCzbz3FLh_q9SYiveeJfTu5kU5Mc_FsrbM
Message-ID: <CAEg67GmDfqCn5w=XoNyTm7EDFgUOr0kZjgtnbk0A5ZtPHd7HXg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737952960; x=1738557760; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=guNhg2RNL136/kMWZbLX15ZtV+jeNF7HAHPl4H+R2e4=;
 b=f/wS52r6XnrMHq1Vyjm6Fi2nXBzSXM/dMRSkIo3rYQ9021iVlb3TsptbPy818rBYfJ
 NpNQoKaYaQO3ULIPhtpSvQMo4d7qVeOGRCzijkvQs8xPASMHhPj4MVkRQswZkHR89JX8
 TQtfHnt/0vXHnVHamKtRztGygwwUAqr1nztm9jtoUZUbU0fCTPH3dIabA2oYpcsL76te
 GRdygKVaIR/Jzs1w1a4ikIvq/jbtFxFyr4WFfjPeD9agRrveIeFQ7ZPzTGDHxI/DqmDW
 zVwyv3Te882d2Gm2gq7FQCwmefGVDFLcQFbK56Kuo6+W/Ev2jgxmldhcPdyLDVNhY9ek
 1l/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f/wS52r6
Subject: Re: [Buildroot] [PATCH] package/minisign: bump to version 0.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Julien,

On Sat, 25 Jan 2025 at 07:29, Julien Olivain <ju.o@free.fr> wrote:
>
> Hi Patrick,
>
> Thanks for the patch.

Thanks for the review!

>
> On 21/01/2025 04:14, patrick.oppenlander@gmail.com wrote:
> > From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
>
> Could you add a link to the change log in the commit log, please?
> Something like:
>
> Changelog: https://github.com/jedisct1/minisign/releases/tag/0.12

Will do.

> Also, reading it, I see that the libsodium is now an optional
> dependency.
> Do you think it is worth reflecting this change in the Buildroot recipe?

It's only optional if minisign is built with a zig toolchain.
Unfortunately it's not optional if using cmake.

> > Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> > ---
> >  package/minisign/minisign.hash | 2 +-
> >  package/minisign/minisign.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/minisign/minisign.hash
> > b/package/minisign/minisign.hash
> > index 12cde42a43..74941163e9 100644
> > --- a/package/minisign/minisign.hash
> > +++ b/package/minisign/minisign.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> > 74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55
> > minisign-0.11.tar.gz
> > +sha256
> > 796dce1376f9bcb1a19ece729c075c47054364355fe0c0c1ebe5104d508c7db0
> > minisign-0.12.tar.gz
> >  sha256
> > d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b
> > LICENSE
>
> Running "make minisign-legal-info" fails with output:
>
>      >>> minisign 0.12 Collecting legal info
>      ERROR: while checking hashes from package/minisign/minisign.hash
>      ERROR: LICENSE has wrong sha256 hash:
>      ERROR: expected:
> d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b
>      ERROR: got     :
> 01aa50818d6609e85a9610b7d04da037e8b28bcf3bb5b5b4963c0c3f7abdabbd
>      ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> Could you check what has changed in the license (you can provide a link
> to the
> upstream commit change, or describe the change) and send an updated
> version of
> this patch?

It's just a date change:
https://github.com/jedisct1/minisign/commit/12333fd7d11180e90a473331fcd628452af061ed

Sorry, I forgot about the `make xxx-legal-info` step.

>
> Best reagrds,
>
> Julien.

Patrick
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
