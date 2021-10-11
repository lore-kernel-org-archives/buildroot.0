Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98155C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:13:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1E160EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E1E160EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1629881AF6;
	Mon, 11 Oct 2021 07:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEVFi5Z2DYsz; Mon, 11 Oct 2021 07:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E8B81AEF;
	Mon, 11 Oct 2021 07:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61ED01BF29D
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50A3481AEF
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GIc9iVSJbSpn for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 07:13:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A6888194A
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 07:13:26 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id h125so4090599pfe.0
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 00:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oIQcx6TVRII4i5vdJgksnVCOGFVTsotFJQcSjTuKnc4=;
 b=PYqK6D7iCsA9eGsB13SSrk0xZBOfdXuLGqpSLctnmI/9miRKVNd2PdUd7hNGkKR8YE
 Kt0smWTd09g31H9Gthckyrr+ri7CPjKVUG5b8zjjJufAa4tkmlFVgotXeTkx/NGz6gtB
 nTXVaPGj/EcF0DyrfjivsdRKuU3M+lpeqCeKpeKzpv+wplYqnBvpt0ArWHaNapo067Qj
 bapaspmtXBUPlEmSnBWbr2G5/lMJ3y5Hni3K3WmqC9nOfeyOn6kXO+IZqkxFOeIGBZh3
 vjpjbqfJVcRf5Gnoy6uPQmWgUoKrm7726+0DEfv7egoL4RnDmz8l6LkEEQOGbj6V0/e9
 5zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIQcx6TVRII4i5vdJgksnVCOGFVTsotFJQcSjTuKnc4=;
 b=3R/+nN4Bj0VkVAysDVtqLqGX7+B847oo4ASCSZ/x6bOVP1FdDhiL4KW9EDRamjy1Kl
 lbhQQFGcmqZmBkRXhlYERiNZch2/h08qAOtEUmpzghgChTMhkyxxSUADUU+DSRHA3S4m
 XSyxOr2yYUXiMXgKakGTU097UNZXmaBU1E5WKHc4vqAo10fQOvIyVyPe8U/NdtKohX+B
 E5tpvmql7lUFI95PyBAmg9PYvpp7lP8ir0+8lC8jmtUDc3NZcyuRyf9FqSkrSQmU9AVI
 YFdwSgmee8GTqV0QB6i8tql9E+VmORlNilV3CqE7cWUkZT8D+wrvmPBR0EcZAJjoax7D
 Zxow==
X-Gm-Message-State: AOAM531V9zECP2HbGg7ZYJMxAEls3ZwQhN308wETWZPF0b3MnAHvQdxn
 Mdb+46cdy5Zln6fDMk+Wf+X2WQeFaFkqgA==
X-Google-Smtp-Source: ABdhPJwq22CZqdY+VisaVNH1vg1LmOs9oV9ro00lj7Ny4ROkWIXMBieG3VJdTv/4tfIWaEKqwD2+Cg==
X-Received: by 2002:a67:e087:: with SMTP id f7mr19429308vsl.48.1633936394419; 
 Mon, 11 Oct 2021 00:13:14 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id j11sm2717046uaa.6.2021.10.11.00.13.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 00:13:13 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id i7so689158vsm.4
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 00:13:13 -0700 (PDT)
X-Received: by 2002:a67:2f0d:: with SMTP id v13mr21588664vsv.18.1633936393291; 
 Mon, 11 Oct 2021 00:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211010234655.585526-1-christian@paral.in>
 <20211011090428.50e68324@windsurf>
In-Reply-To: <20211011090428.50e68324@windsurf>
Date: Mon, 11 Oct 2021 00:13:02 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pf-df3MF1z5Rgi1ez5i1FBUDBiPh4R=CvzKqynBaeddg@mail.gmail.com>
Message-ID: <CA+h8R2pf-df3MF1z5Rgi1ez5i1FBUDBiPh4R=CvzKqynBaeddg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH-NEXT v3 1/6] support/download/dl-wrapper:
 add concept of download post-processing
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon, Oct 11, 2021 at 12:04 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Christian,
>
> Thanks for your work on this topic! I didn't review the patches in
> details, but here are a couple of comments on the form:
>
>  - The initial series also had support for Cargo, I think we want to
>    retain that as the idea was to solve both Go and Cargo at the same
>    time, to make sure we have a solution that works for both.

I don't have the experience with Rust to sign off on the Cargo
portion, and I was unsure if it was confirmed to be ready for merging.
So in the interest of getting these packages in (including gocryptfs)
I sent the Go portion only.

Can send the full thing with the Cargo as well... if really necessary,
but can't we just do it in 2 patch series?

>  - PATCH-NEXT doesn't make any sense right now, there is no "next"
>    branch.

Ok, was just indicating that it's somewhat "next release" material
(not for backport), I guess.

>  - Your patch series lacks a cover letter with a description of the
>    changes between versions. So of your commits have a v1 -> v2
>    changelog, but we don't know what changed in v3.

I just dropped a "TODO."

Best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
