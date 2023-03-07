Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C3DC678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 16:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B24040B26;
	Tue,  7 Mar 2023 16:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B24040B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOy_-_VoaAH0; Tue,  7 Mar 2023 16:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED63C40B23;
	Tue,  7 Mar 2023 16:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED63C40B23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D03C11BF3D8
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 16:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA91240B22
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 16:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA91240B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lh4zN65G1-no for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 16:10:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68B3340B1D
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68B3340B1D
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 16:10:42 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id n2so17702445lfb.12
 for <buildroot@buildroot.org>; Tue, 07 Mar 2023 08:10:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678205440;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sa7iiuLtBgc6FvDwhbM67+gZSe9bptk18RuXb62THHk=;
 b=jpkHPifGryleqzXDD64ARBTqeFL+oStVmaaK1DcLXHGIlvlv2U4xkxB6nWRplwpM5E
 68hw6lEWA73AT6Q4p6NtuUpYEMB7/jjNJmIwf9unwxlyPQJxELoe7a5t7z5x8yr2smEV
 nK44scSyDDer/QqW216FyhxIcSyUjBFQoQAGhcgXrnxXp1mVVx14bvfB4KhAF02ouq4w
 bArQlgueh5Vu/WhG0bNWLdcHGVtuLAJd/UzgUob0/aDFHIHCL3en9/9CzFOT2XwNohjN
 jRrm8jr+JlMKz8oD8E9Is2cCId4dy2DfxSAETMK3hW8G67Tlh8TQOBMHY53VFGgX2uN3
 TIKQ==
X-Gm-Message-State: AO0yUKXM6dxXYBf2SJLsEzhEhUlzPFqzHLIiT02lfwVDpzEgPTeRu8CT
 +ao1WMxFqD6N/zV8hOGzCy3+VQn4SVF/nHqI
X-Google-Smtp-Source: AK7set9XTbAnq4cH0PAhTXgDMyBMg60IIofS8/tCAqpOqJT6bBYXhT9WfiMxDph4ieHnRWifpBIHPw==
X-Received: by 2002:ac2:4255:0:b0:4cb:2aa:9e58 with SMTP id
 m21-20020ac24255000000b004cb02aa9e58mr4345822lfl.13.1678205439940; 
 Tue, 07 Mar 2023 08:10:39 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 i19-20020a056512007300b004db508326c0sm2083397lfo.90.2023.03.07.08.10.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:10:39 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id y14so13707974ljq.4
 for <buildroot@buildroot.org>; Tue, 07 Mar 2023 08:10:39 -0800 (PST)
X-Received: by 2002:a05:651c:11cb:b0:295:b2f0:a857 with SMTP id
 z11-20020a05651c11cb00b00295b2f0a857mr4613800ljo.10.1678205439297; Tue, 07
 Mar 2023 08:10:39 -0800 (PST)
MIME-Version: 1.0
References: <Y/4etrPX5MZiUpdq@donbot>
 <20230228155528.2430203-1-thomas.devoogdt@barco.com>
 <33536034-5b9e-e1f9-86eb-b64bb4691940@mind.be>
In-Reply-To: <33536034-5b9e-e1f9-86eb-b64bb4691940@mind.be>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 7 Mar 2023 17:10:28 +0100
X-Gmail-Original-Message-ID: <CACXRmJjeRm3+zZTkOLoZ4NPu7bgi_udWmc=KBLD2KcTRQiHOhw@mail.gmail.com>
Message-ID: <CACXRmJjeRm3+zZTkOLoZ4NPu7bgi_udWmc=KBLD2KcTRQiHOhw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, John Keeping <john@metanate.com>
Subject: Re: [Buildroot] [PATCH v3 1/3] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Thx for the review John and Arnout.

I updated the commits on my private git branch:
https://github.com/buildroot/buildroot/compare/master...ThomasDevoogdt:buildroot:thode/cmake-ninja

I will do some tests, and if all is ok, then I will send a new series of emails.

Kr,

Thomas

Op ma 6 mrt 2023 om 12:02 schreef Arnout Vandecappelle <arnout@mind.be>:
>
>   Hi Thomas,
>
> On 28/02/2023 16:55, Thomas Devoogdt wrote:
> [snip]
> >   ifndef $(2)_BUILD_CMDS
> >   ifeq ($(4),target)
> >   define $(2)_BUILD_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> > +     $$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$($$(PKG)_GENERATOR_PARALLEL) $$($$(PKG)_BUILD_OPTS)
>
>   To avoid breaking existing (external) packages, I would add something like:
>
> $(2)_BUILD_OPTS ?= -- $(2)_MAKE_OPTS
>
> (inside the CMAKE_NINJA condition, only for make)
>
>   That way, existing packages would work unchanged (and it would remove the need
> to change gdal and racehound in this patch).
>
>   Similarly for the environment.
>
>
>   Eventually we'll completely remove those variables, but then there should
> still be a warning about their use, like we have for BUILDROOT_DL_DIR in
> Makefile.legacy.
>
>
>   Regards,
>   Arnout
>
>
> [snip]
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
