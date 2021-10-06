Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C488C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B4AC610A3
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B4AC610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C21D8402F;
	Wed,  6 Oct 2021 15:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AersGTWnvLKt; Wed,  6 Oct 2021 15:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B77A83F32;
	Wed,  6 Oct 2021 15:52:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B81591BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79FC83F32
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Mo6KwqapTSi for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:51:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5847883B92
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:51:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id f9so11859800edx.4
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HW/VHIgMWp8A23qXDhY9cMSDXntz6xcVl0S8Lio8rz8=;
 b=TeS4bmF72hp/zF0fb0TRbkiXTJzyijmoZd5Za3abfoeBIQnen4n6jJ1IrYYM/ZKq0o
 CguaCyxLzEQPypnGkuhVgGJmbN3GkDTMkEHNWLC22mmoBtuH5+6mGiEAp/BLaOdlYEBH
 nSlKEXHUhx7j4rkHOMGXkj1/6meSlY+FrU5/NJPXwT6wZ5Nn5aVcdmu9SLUxEmGtwrg3
 QpiU4thulyjIY0hjzMWYvx7xtzLFEPv4YiC+is9gS1erz6TNrajn5YYtpeCjIfRzGE8a
 0VTlRYSBGG73A/SxdBq7qd1/kSJXIzTkStJS4i27rdyD01VkJ5ZmCgFv18+Z9o2WdBco
 bm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HW/VHIgMWp8A23qXDhY9cMSDXntz6xcVl0S8Lio8rz8=;
 b=GMdtlFUFvL7Mr0CyHUDd6swE0HqCXMfExgUfrpyA4vJDqEjayaPbaZN/akBVVno8d6
 Q3vjM2BKuHBMbqRaITiLQjEFaUNoW6IeA7gBFb0PBICKFFgFfmyIA1ouYlPoF6OoaGk6
 fUclWifxpAsFQ1M44TCGIhZgtXYJ2ZfPdwi+M5rljs/hsG4MzigjyL96oAyn4Lheda7f
 0lbL0Rtc8C6XhxYuVFZKEY3svVRWVdz9OtRVPHImQxmzoRtmb6kIibKGYjm0spyQBw6u
 6MqubfxTHsRGo/ba6g90bLXBwaP3a4KRwb3JWVPR9IXj8j+ipEzn7+JKnhaFTpdIG0VD
 wVkw==
X-Gm-Message-State: AOAM532CFmdEEH9Ymo9ep8A9mxhDV6856bqKN/XQGLFDjHd3TzoR1JLc
 ely3I+KesTnsqfsgNd31uCj7gqfXZxKoERPwhkov5du4
X-Google-Smtp-Source: ABdhPJxj4QE+tKjZTV+skFn3EYQNTpZhICe5vJgYZBCKtaJd/9Jqk5vDimzd6CBKjHMx1FhrsjC0rzooYg3/MoVOBac=
X-Received: by 2002:a05:6402:35c5:: with SMTP id
 z5mr11122362edc.388.1633535517311; 
 Wed, 06 Oct 2021 08:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210928064400.573159-1-asafka7@gmail.com>
 <20210928064400.573159-3-asafka7@gmail.com>
 <87o8825gyq.fsf@dell.be.48ers.dk>
In-Reply-To: <87o8825gyq.fsf@dell.be.48ers.dk>
From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 6 Oct 2021 18:51:45 +0300
Message-ID: <CALFsTFVRxx+eWKxK9oXVrq6kyOjW+-EGuK5At3bNhw6LjbiHtQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-meld3: bump to version
 2.0.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, Oct 6, 2021 at 6:08 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:
>
>  > Plus, indent with two spaces in the hash file.
>  > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>
> Looking at the 2.0.1 release, it seems to be unmaintained:
>
> https://github.com/Supervisor/meld3/commit/ed4e7b30eeae9e03170f388f5c6fc31aac21bf7d
>
> How about bumping the supervisor package and dropping meld3?

Actually, according to supervisor's documentation, our supervisor
version doesn't depend on python-meld3 so can just remove it even
without a bump.
I'll send a patch.

>
> --
> Bye, Peter Korsgaard

Thanks,
Asaf.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
