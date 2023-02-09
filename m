Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9ABC636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E223405BD;
	Thu,  9 Feb 2023 20:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E223405BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tw5N1nl4Bx19; Thu,  9 Feb 2023 20:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 670D4404D3;
	Thu,  9 Feb 2023 20:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 670D4404D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6A371BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFB83408CF
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB83408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOogOe7s7phN for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:32:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA41840258
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA41840258
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:32:17 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-16ab8581837so4044901fac.4
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A47SUgZiUpyny7sijH3RahXdL9mRZ8HJCi2mhCHcMBk=;
 b=kfIC5hv9MzHkrBJYJXPBriEpdbiDU+S6nWRwFf+8QHz5VAotjKx+qbDbJiCFsKWgUP
 KR8bf3UfKqFP0CZHGIP346aBDFlRpI5mZ4UDKQP9+nvBtDZdQz0OMyL+ia5oXm4gwV1g
 QE34ONNG4uo3V1O3vn00pF7qz8MMkviUZqJlUZqyBYnOVoKBZ8KoA0dVs+u33nSkeUXA
 a+CK4CwiaH5yJ3v/jU5XHuvVNdGZw9MGq1kh2mWTTk7/NbOB9mIbOlmt18J33068u3IB
 e0JOKZBxUakT86N9j7LdKr0ITvHqKs/tSN2sWkPxUOTxGKs0PNiBaBNvkXl4hRtCv2oi
 7amA==
X-Gm-Message-State: AO0yUKWlAnrT5QBiYN4qAQi9iXv1irswF+faUj4EztiIOXLapiR4cCv8
 Fvz3M2sQessQ8790uCpGuVVqRuI9n9Sne5evLY8=
X-Google-Smtp-Source: AK7set9/KqkSSso8ZP5IDbShVDxi8ZChW3JpmveoKRIP0pv1UlYNsMAqkdxbj9h5KGiPTrgbRBmeI3UdjFx+sobrVx0=
X-Received: by 2002:a05:6870:468c:b0:163:501b:e7b with SMTP id
 a12-20020a056870468c00b00163501b0e7bmr725469oap.18.1675974736551; Thu, 09 Feb
 2023 12:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20220607231211.533086-1-james.hilliard1@gmail.com>
 <20230208161527.31a28b3b@windsurf>
 <CADvTj4rZZ-yewR2utW7r7++y7HziG5CE2=_beWgskS1XXL4PQg@mail.gmail.com>
 <eca0040f-d111-2b84-f086-a1f9f26b53da@mind.be>
In-Reply-To: <eca0040f-d111-2b84-f086-a1f9f26b53da@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 9 Feb 2023 13:32:05 -0700
Message-ID: <CADvTj4qOOh89a1NOHD8mkNSBAdGPz3aOgvv_LOKgi8L1-LjE4A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A47SUgZiUpyny7sijH3RahXdL9mRZ8HJCi2mhCHcMBk=;
 b=Cc5QdfhqpGZ/Q/OKRKnCyWrfOrxy4w0Arw2CymgANiXReKwRxnwAEuJA4bZlMjE1CW
 d6ufoKekKJyRMi6oCXNbCaVwUUuT7ZWgP/oOg1vanBNbfoxj5NhmRUlerdo9BAB4QD2y
 575QgkFDTL32rvKCUWkv8J2CAtVFCNSvoBlnA7OjB8wh76M1KthCOXBeHmmjHtkNxT2h
 ad/Dv8+E9H3U4Q8at+4NLy6tU2TdjvOdWsB4+nFYGCakx/qYJPXV5kp+LmqTJxVziZHv
 PqFQ62FV7ikdFaBoURA3yVb4HHvTUwuWE1WQI/NJpJSKn+QNhpKn9muXJhR2N+0YDLFB
 RuYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cc5Qdfhq
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 9, 2023 at 1:19 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 08/02/2023 17:46, James Hilliard wrote:
> > On Wed, Feb 8, 2023 at 8:15 AM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> >>
> >> On Tue,  7 Jun 2022 17:12:11 -0600
> >> James Hilliard <james.hilliard1@gmail.com> wrote:
> >>
> >>> In some cases it only makes sense to run tests against a specific
> >>> branch, such as when testing new genrandconfig flags.
> >>>
> >>> Add a config option to override the branch selection.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>   scripts/autobuild-run | 11 ++++++++++-
> >>>   1 file changed, 10 insertions(+), 1 deletion(-)
> >>
> >> We looked at this with Arnout, and we don't really see what this would
> >> be needed, and actually it could be annoying to have people test
> >> "random" branches. If you need extensions to genrandconfig, then the
> >> autobuild-run script should be backward compatible with older versions
> >> of genrandconfig to be able to support older branches for a certain
> >> while.
> >
> > There are a number of other reasons this is useful, for example some
> > build hosts(for example my asahi-linux build host) have compatibility
> > issues in older branches so it doesn't make sense to run autobuilders
>
>   If there are compatibility issues, the fixes should be backported to the
> stable branches...

Some of the changes would be rather difficult to backport, for example
the 2022.02.x branch doesn't have support for --no-toolchains-csv which
is effectively required for supporting non-x86_64 autobuilders as we
obviously can't use prebuilt toolchains that only run on x86_64 hosts on
an aarch64 host.

There are many fixes related to various  --no-toolchains-csv build failures
that would also need to be backported as well if even feasible.

>
>   Regards,
>   Arnout
>
> > on anything other than say master.
> >
> > To prevent testing of unwanted branches I could modify this to restrict
> > the branch override to only allow selecting the branches listed in:
> > http://autobuild.buildroot.org/branches
> >
> >>
> >> Thanks!
> >>
> >> Thomas
> >> --
> >> Thomas Petazzoni, CTO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
