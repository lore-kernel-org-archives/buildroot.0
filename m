Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC24C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 05:30:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49195610FA
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 05:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49195610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0625460649;
	Thu, 19 Aug 2021 05:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eniE09TTBgfu; Thu, 19 Aug 2021 05:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C0D6070A;
	Thu, 19 Aug 2021 05:30:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51AD1BF94B
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 05:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2FE640183
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 05:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWPbNe-UdHpd for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 05:30:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B66B400E7
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 05:30:40 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id n11so5940626qkk.1
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 22:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/C7OOgnMvNWNjXog+c84BeyMvX/7wrYiqLi7RQUnrR4=;
 b=QKCA8ydgkfZcCae8b1prsmBD6tQbq5fRLIymSxXsZZufj/O2CmfDz429e1NrqHIft/
 AX1J2vWe+D/ZLZ3C6QFCt22zGqzKuDaTS7juioRnTjsgysjmIrtP9srkMgt32odR8rPL
 eUzmFLwHNVC6HsyJ0VpxVYLvFOk2w6kOcoyn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/C7OOgnMvNWNjXog+c84BeyMvX/7wrYiqLi7RQUnrR4=;
 b=XIeoYawXnLDCQW6605f/m7pTSiz+yKUwa1i5dbU5Mb8vttAQaiRlY5s8Bb8HJd2tot
 R+KR9kwgGFKnbJMhjYlBhVc8UgaCYzc4nihMx+KkZC2uwkpjBbMn0bQb5FS6oU5HsOwb
 TWJ8HW8L8GpUhZLuGKfOKaasfHoUeJ7ZCzc4BKxXkxlGpElp04+iZURTPhnmKYC5s6ym
 w+k8HdPL+KDt6Q3JLY/ze5IoU/5DLIt5/tF9VtgW2ufdYKMsglZD14YQYY0S/+8zItYd
 SP+A/CYLeIo6lj2DWRGWKRiMe+GeY2bsfFwfhXyBKt6tXklJ3w0nVLkZRFi1sXdhKWG6
 EuRQ==
X-Gm-Message-State: AOAM533xtGws3tkbvzYxJRC/d2wHDXq5ejVBvoNpTCiTVRH/yEF6efe6
 HNY0woYggqGL8xrZnQCgIOV7n2zLIgKbO4b0Fs9fqrFT
X-Google-Smtp-Source: ABdhPJy3bWigwyi6eppDLAi4ScLXarGL/zI2IaDF5o4tbVY+aE/irA2HkapbUF7Iyv/1jKiWXdeeNflKpwU9jaI1EkY=
X-Received: by 2002:ae9:e407:: with SMTP id q7mr2050250qkc.55.1629351039148;
 Wed, 18 Aug 2021 22:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210803081615.879069-1-joel@jms.id.au>
 <a67de0fb-78da-bbe6-e2f7-a58c126ee43c@mind.be>
 <CACPK8Xf9-KOSRourfGbqjFLciO4oVazz4Hv2Cf-bO8phhrcSug@mail.gmail.com>
 <489e7bc6-dbf1-b12d-23ff-7dfa478ab69e@mind.be>
In-Reply-To: <489e7bc6-dbf1-b12d-23ff-7dfa478ab69e@mind.be>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Aug 2021 05:30:26 +0000
Message-ID: <CACPK8Xd4P+FJ=Cb6ONdayFsrP7GHe46OcsT1rRprmQ9XdmGiQQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/pdbg: Fix alignment error on
 autobuilder
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 5 Aug 2021 at 11:43, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/08/2021 00:50, Joel Stanley wrote:
> > On Wed, 4 Aug 2021 at 20:46, Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 03/08/2021 10:16, Joel Stanley wrote:
> >>> The autobuilder fails when building for sh because of an alignment issue
> >>> in assembly that includes an external data file.
> >>>
> >>>  http://autobuild.buildroot.net/results/457b88c4ba85edb42b3a36cce48bf90712f590bf/
> >>>
> >>> This fix has been submitted upstream.
> >>
> >>  Has it? I'm looking at the PRs and issues on github and can't find anything. Is
> >> there some other upstream that I can't find?
> >
> > The project development happens on a mailing list, like all sensible projects:
> >
> >  https://lists.ozlabs.org/pipermail/pdbg/2021-August/002373.html
>
>  Our Config.in help text refers to the github repo, and I couldn't find anything
> about a mailing list in the README (or a specific contribution document). If
> you're close to pdbg upstream, perhaps suggest an update to the README as well?

That's a good suggestion, I've done this and Amitay has merged it into
the repository.

>
> >
> >  http://patchwork.ozlabs.org/project/pdbg/patch/20210803080305.866765-1-joel@jms.id.au/
>
>  In the future, it's nice to include such a reference in the patch itself.
> That's obviously a bit of a catch-22, so what I do is:
>
> - prepare git commit;
> - send to upstream;
> - git format-patch -N -o <buildroot>
> - edit the generated patch(es) and add the upstream reference below the SoB.

I'll keep that in mind.

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
