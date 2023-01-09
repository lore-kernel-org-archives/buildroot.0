Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAE6C67871
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 20:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DC6A4023B;
	Mon,  9 Jan 2023 20:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC6A4023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9F0MFUXEJHy; Mon,  9 Jan 2023 20:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D0C840245;
	Mon,  9 Jan 2023 20:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D0C840245
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22B721BF239
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 20:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AD9F80C4D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 20:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD9F80C4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gG1_cv8P3FBC for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 20:18:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A796880C03
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A796880C03
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 20:18:32 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 x25-20020a056830115900b00670932eff32so5812063otq.3
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 12:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jJxH5rHaS4X613KaKX7Sa0uR5zJkGQHt6g63TL7XmGA=;
 b=YRqmLVk2/a7vWzxHZL/vuRWiZLPEsCCvc/5dGcN/gO2NNtixSBCv2WwLV8kDKf8TRk
 HGcJgpZtMT63GEfBHcjL4Gr9as/dKVrsOOx4jZXjTlULcTI/AiiDrBKC9mhU6puFq4L6
 d5wyyGbnHBp/w4SaGcrYVxnrO/9v3xGGCCo6tqpHVS/UsKlT/hpCxWVNYz70Acqr4B5B
 hV+jfwgdZeQu2vdcgaUeHWgDEzRjXU///MuaZy0kLtoBgATThBWMPVk1MG1U18wUdAna
 gungmhNb5CKzBoJdOBfgH07pDr3prXYubl8s4IpaIen71UL2xfsHIXqejTYTSXgD+gd+
 9z6A==
X-Gm-Message-State: AFqh2krQxm5DbplrOPe8nPyobmfVIRuSW6rMonc3r0EGMjLZbh3gabOl
 97mtB9xpyjq+cNG34nu9C3wDT6zbYJWMerUQ6rM=
X-Google-Smtp-Source: AMrXdXs8ljQXroBuv2LbLTJ80mgnS3XtxBKk8VF8WRFJfwTP5HieV2kVZGzpnvskWd4yrGrLl/vRUlvmDUFWj7UeqyI=
X-Received: by 2002:a05:6830:1052:b0:676:c98a:e8cf with SMTP id
 b18-20020a056830105200b00676c98ae8cfmr3567290otp.376.1673295511613; Mon, 09
 Jan 2023 12:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20230109004748.1372-1-ckhardin@gmail.com>
 <CADvTj4rTjzyLAYRe0dO+=9=ZmX1odPjDFjs6mN_fwd62Z8ac8w@mail.gmail.com>
 <CAN=fXj0kB6ys61DqspLtG6_ipD-CVYigxDwaseofsvOUwWZTrA@mail.gmail.com>
 <CAN=fXj140d4Rdh2ybw=wP-evB34PTTqz6qNpue=4JPrahu8dOQ@mail.gmail.com>
In-Reply-To: <CAN=fXj140d4Rdh2ybw=wP-evB34PTTqz6qNpue=4JPrahu8dOQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 9 Jan 2023 13:18:20 -0700
Message-ID: <CADvTj4pvwru8zPxDqAsxkEgvjnQ=pJEY4t_cuk=b-MBdEFrKow@mail.gmail.com>
To: Charles Hardin <ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jJxH5rHaS4X613KaKX7Sa0uR5zJkGQHt6g63TL7XmGA=;
 b=RdI/2JnwGYn1s5Fx/rmIhq3gpirsqC1Ta86bKsG0Mgt8f27bc9xBr6Y6znu4nLzlVw
 kFlYFWHCdrk0hGraA92DuAQr1NF9qLV55GUrl5e0Hl6DE6Zj262LpC4OktK67VdISTjU
 uxJptCCNddimHwc5c4aA16Pf9p+G8QxqxgXw44ouacwZdeZDoAfleyMijuyY6ayxuvZR
 kvTBt7o3rI9n/kE9IwasvryJjcCeIGef3xGp0ra3faGmQDVKX7+oV1JzKwDCKnX6WpnA
 77c5DQzN6l+HHBVk24esjREFD6OJyjNXgLYRJHi0ofU4neikajU6eAZEUm9JNiK4F42n
 FdCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RdI/2Jnw
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: additional
 dependencies for rebuild/reconfigure
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

On Mon, Jan 9, 2023 at 10:42 AM Charles Hardin <ckhardin@gmail.com> wrote:
>
>
>
> On Sun, Jan 8, 2023 at 6:21 PM Charles Hardin <ckhardin@gmail.com> wrote:
>>
>> inline
>>
>> On Sun, Jan 8, 2023 at 5:58 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>>>
>>> On Sun, Jan 8, 2023 at 5:48 PM Charles Hardin <ckhardin@gmail.com> wrote:
>>> >
>>> > While testing incremental changes for a kernel build using the
>>> > LINUX_OVERRIDE_SRCDIR, the following behavior was observed.
>>> >
>>> > - edit a file in the kernel tree and save
>>> > - make linux-rebuild for buildroot to pickup the changes
>>> > - rsync occurrs and then the install target is run (no build)
>>> > - run make linux-rebuild a second time and the build is compiled and run
>>> >
>>> > To get the changes in on the first invocation of the rebuild requires
>>> > a dependency on the build target to re-evaluate the stamp dependencies
>>> > after the remove. This is a function of make dependency order evaluation
>>> > so that the install steps will see the missing the install stamp but
>>> > that evaluation doesn't require the rebuild because of the file being
>>> > removed internally on the evaluation.
>>> >
>>> > Explicit $(1)-build and $(1)-configure deps are added that will evaluate
>>> > after the cleans remove the stamps and cause them to be re-invoked.
>>>
>>> This isn't correct from my understanding as you aren't actually specifying
>>> the above described execution order.
>>>
>>> I think this should more correctly fix the issue:
>>> https://patchwork.ozlabs.org/project/buildroot/patch/20221018034605.800593-1-james.hilliard1@gmail.com/
>>>
>>
>> Yup, the evaluation is dependent on the make behavior in the parallel prereq - tried the double colon rules and those work as expected - the rebuild will trigger the build and install and the reconfigure will do the configure, build, install steps.
>>
>
>
> Oh - I thought that double colon patch was already merged into mainline. It is pretty useful to be able to use rebuild and reconfigure on systems for a bit quicker turnaround.

Not yet.

I had discovered the issue when testing with make 4.4's shuffle mode which
is designed to make dependency ordering issues like this much more obvious.

>
> The testing we use is pretty simple.
>
> touch arm64/kernel/setup.c in the local linux directory
> make linux-rebuild
>
> Will see the "Building" notification with that patch - without it will just rsync and then "Installing"
> Watch the CC arm64/kernel/setup in the build
>
> The rest proceeds as expected with Installing - etc.

If my patch does indeed fully fix the issue can you reply to it with a
tested-by?

>
>>>
>>> >
>>> > Signed-off-by: Charles Hardin <ckhardin@gmail.com>
>>> > ---
>>> >  package/pkg-generic.mk | 4 ++--
>>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>> > index f2bea01d7d..da99d9622a 100644
>>> > --- a/package/pkg-generic.mk
>>> > +++ b/package/pkg-generic.mk
>>> > @@ -1062,12 +1062,12 @@ $(1)-reinstall:         $(1)-clean-for-reinstall $(1)
>>> >  $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
>>> >                         rm -f $$($(2)_TARGET_BUILD)
>>> >
>>> > -$(1)-rebuild:          $(1)-clean-for-rebuild $(1)
>>> > +$(1)-rebuild:          $(1)-clean-for-rebuild $(1)-build $(1)
>>>
>>> You aren't actually specifying that $(1)-clean-for-rebuild runs before
>>> $(1)-build but rather are specifying that the $(1)-build target can be
>>> executed in parallel to the $(1)-clean-for-rebuild and $(1) targets.
>>>
>>> Parallel targets can effectively be executed in any arbitrary order and/or
>>> at the same time.
>>>
>>> >
>>> >  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>>> >                         rm -f $$($(2)_TARGET_CONFIGURE)
>>> >
>>> > -$(1)-reconfigure:      $(1)-clean-for-reconfigure $(1)
>>> > +$(1)-reconfigure:      $(1)-clean-for-reconfigure $(1)-configure $(1)-build $(1)
>>> >
>>> >  # define the PKG variable for all targets, containing the
>>> >  # uppercase package variable prefix
>>> > --
>>> > 2.24.3 (Apple Git-128)
>>> >
>>> > _______________________________________________
>>> > buildroot mailing list
>>> > buildroot@buildroot.org
>>> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
