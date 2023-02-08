Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F59C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63EC982095;
	Wed,  8 Feb 2023 16:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EC982095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9cKTO_O05Wx; Wed,  8 Feb 2023 16:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 878AA82082;
	Wed,  8 Feb 2023 16:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 878AA82082
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D095F1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB67540C70
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB67540C70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xT5Gvsonie-D for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C51E540C61
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C51E540C61
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:46:31 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 j6-20020a9d7686000000b0068d4ba9d141so5361156otl.6
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srGKC0Nx0EYjPmet06SUaGeP0TagN/TWVFtJ8GVIp1Y=;
 b=Mad/cFqrS7/avXBv55R9slm8IpXIw2eWDRTK+v1+c93iuUWklcJqdvCN76h9Bnf+rk
 BToPWhaBo8p9ji15FlM2VVV7HHTtmSwg2kGaTGOalCcIerjjMmVikDDZKJ+KXjkopD8y
 Hh1vSTYxn2xw+UDUYzfTAKMaj+srWRMWD3OcF/qSK4RZr6ApxhJgRKEq2PhjCmauJ60+
 GBLvENjril2IuZfizwNPkUHnlPrMonPcP+8khRjnxPAVtQ6AWRM1XezGLF3bxPOl/x+s
 UifbsHcFA1OqhVnrz/7+XhO81dkVZOUgKv7lgwv2QdWDT9H+S+N7f/BaDt9v5AZriz7K
 72xg==
X-Gm-Message-State: AO0yUKXYuGS1RZmOi5tlmPe7mZfMTpmswpqkmrYWy6rzGiiaWukbysO6
 z0CZXMVq5jNVt8pbxrEvlWMlY0Y9BqebIuFAp4nqre3AkVw=
X-Google-Smtp-Source: AK7set+H3tSGt9mMrveWE+Fnv7YELDwDayRGXadk/Ul3+BqLjrxsjMJYuvtzIJiSaALWatt0gsOPpYGDEgjIAlIwoYU=
X-Received: by 2002:a05:6830:33e3:b0:68b:dd59:2157 with SMTP id
 i3-20020a05683033e300b0068bdd592157mr632222otu.45.1675874790770; Wed, 08 Feb
 2023 08:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20220607231211.533086-1-james.hilliard1@gmail.com>
 <20230208161527.31a28b3b@windsurf>
In-Reply-To: <20230208161527.31a28b3b@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 8 Feb 2023 09:46:19 -0700
Message-ID: <CADvTj4rZZ-yewR2utW7r7++y7HziG5CE2=_beWgskS1XXL4PQg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=srGKC0Nx0EYjPmet06SUaGeP0TagN/TWVFtJ8GVIp1Y=;
 b=prpS1p4LY5JDdSia16IBg62V1Mv0itty+MJJjSJyz3OeQxYus7eyxANDeoewD36gSF
 R50bqXZ2TxgbqLj7Ch59sjZf6z4Ayk7Y3N0XPsRhloYVicmv1eFmeHjwTNcP68BgEy4J
 Kh//7hsSdUEM2A5LXsH69hLOHKEPnEaXWA5eQvWABuMdTWz7gssD5DjrRM8cLXOI8uet
 BsMQzE/rcQcTqqqBq4AS1tM1WAXalMojj3n5Gqr4jKpTdJF+iGoUwqMRsBVTBjvTHgpL
 uoE0Qlc6lcIaiBhwjl5SC+7Rn1wYkadYEd9KXWLCT3PQDr0hgCDuslzIjsiA1pamTAu1
 dgTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=prpS1p4L
Subject: Re: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run:
 add support for --branch option
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 8, 2023 at 8:15 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue,  7 Jun 2022 17:12:11 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > In some cases it only makes sense to run tests against a specific
> > branch, such as when testing new genrandconfig flags.
> >
> > Add a config option to override the branch selection.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  scripts/autobuild-run | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
>
> We looked at this with Arnout, and we don't really see what this would
> be needed, and actually it could be annoying to have people test
> "random" branches. If you need extensions to genrandconfig, then the
> autobuild-run script should be backward compatible with older versions
> of genrandconfig to be able to support older branches for a certain
> while.

There are a number of other reasons this is useful, for example some
build hosts(for example my asahi-linux build host) have compatibility
issues in older branches so it doesn't make sense to run autobuilders
on anything other than say master.

To prevent testing of unwanted branches I could modify this to restrict
the branch override to only allow selecting the branches listed in:
http://autobuild.buildroot.org/branches

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
