Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07660C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C594B60F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C594B60F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B028444B;
	Wed,  4 Aug 2021 01:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pd9MJC7KzZz; Wed,  4 Aug 2021 01:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE7084422;
	Wed,  4 Aug 2021 01:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB621BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7781040356
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNae-ax1dcPw for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:23:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6126540353
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:23:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h14so26709954wrx.10
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=31XSieIahPHSDpPYU0w1l8mzZyLGWv65hLEzkGLBXEo=;
 b=cBzLtPx46duH4qBuonkrgQBRgMtbCS1YBUvgBiDFbZfK3vBW31BEYs8YZsFx2Fplts
 qWvwzh5CrpuI9Oa1SdgMGIufPK8tuqbxXfxeL9cnsOPGGa5YWqr/jxqDkNREFPBqKsYT
 S5WeU6KVMKROwYhhNerBraSAhpt882MhQqVGyFuDafhhNIBPXaMwuHJkIPxbaMHwcoZJ
 Uz7zlUuziwc+sX8nrYxCBo5UGrowrDJV1lW7AzLIEx6Q5hrQcDl5Q6jisBDwpJbPL7Qd
 mLjRL3mB6Mz7s59iO9Rj1o1PWS/3eainZLOgzVaYdKpJ6mJAn2/NBDaOT1Yu6CtSbCbJ
 XubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=31XSieIahPHSDpPYU0w1l8mzZyLGWv65hLEzkGLBXEo=;
 b=Xp8yGT0zgyYns6XC7i/QQBMAGSTgy4zNKLt4ulznqPqEHo0HgBlddjfcL5ualGOAgp
 4zgo1olh+GJ5O6UyqZlgiXZCagZAUWRMnC7CX64b2BrGQsoISoZy6mE+0dAtusuvc1qP
 A4lqWH3kmj+ul+YAoSCE31yvv+lMe8wwCj4JZsL6Vxouim6TqqzTE3Jl3I7kXSfse+fq
 4vMbjxRKkI+WXqpv/r8u0V7T19sTQih4lkCUO4yQNSZc57X+OdAldfehLGOcxbI/urCQ
 yYiTpyQIo4w8Dk4knta3PlyQog4TQ0HnUJk4IPKqe+3ZbWKumL9gFDi/8kGAxHXefLEw
 j0+Q==
X-Gm-Message-State: AOAM5314zUeJ5QKwqMYpmgoFufu0DLT8GsS7OKjQIZrdMuroGYx6rHyV
 9LDLJDn5H3liKeRJYzDiTV85GcW9LJd5JUYg
X-Google-Smtp-Source: ABdhPJzVzAPmoH3Ome8x2SArgTOyxJ23anx5Vl+deTTNErBxiNdDMDrIsanyoZsRgpMFP2ICumi3Bw==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr25385793wrl.61.1628025789501; 
 Tue, 03 Aug 2021 14:23:09 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id k186sm4557082wme.45.2021.08.03.14.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:23:09 -0700 (PDT)
Date: Tue, 3 Aug 2021 23:23:06 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YQmzukxuQe6kgNEg@pevik>
References: <20210802172116.10073-1-petr.vorel@gmail.com>
 <2A61C2B3-401F-459C-9DD1-727E041D1A20@benettiengineering.com>
 <YQhEuH0okQM/3P03@pevik> <20210802221341.760ffbf0@windsurf>
 <YQhsdkzd/vbHXA94@pevik> <20210803085745.6c7e4ce2@windsurf>
 <YQl6KMAf4XfXnfrG@pevik>
 <aa6abbe9-7d0e-b273-9768-bf95ae408773@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa6abbe9-7d0e-b273-9768-bf95ae408773@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Backport yet another
 printf fix
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



> On 03/08/2021 19:17, Petr Vorel wrote:
> > Hi Thomas,

> >> On Tue, 3 Aug 2021 00:06:46 +0200
> >> Petr Vorel <petr.vorel@gmail.com> wrote:

> >>> I believe all 3 patches (2 already merged + this one) should fix the problem.
> >>> But I was not able to verify it, because ./utils/test-pkg didn't catch even
> >>> this error (I tested all available toolchains), IMHO -Werror=format=2 and other
> >>> -Werror are probably only on http://autobuild.buildroot.net/ (not in Buildroot
> >>> config for users). It'd be great if ./utils/test-pkg had the same CFLAGS.
> >>> Or have I (again) overlooked something?

> >> No, the autobuilders don't do anything specific with -Werror CFLAGS.
> >> The configurations tested by the autobuilders are generated by
> >> utils/genrandconfig in the Buildroot tree. Besides the obvious package
> >> randomization, there is some randomization of "global" options:

> >>     # Per-package folder
> >>     if randint(0, 15) == 0:
> >>         configlines.append("BR2_PER_PACKAGE_DIRECTORIES=y\n")

> >>     # Amend the configuration with a few things.
> >>     if randint(0, 20) == 0:
> >>         configlines.append("BR2_ENABLE_DEBUG=y\n")
> >>     if randint(0, 20) == 0:
> >>         configlines.append("BR2_ENABLE_RUNTIME_DEBUG=y\n")
> >>     if randint(0, 1) == 0:
> >>         configlines.append("BR2_INIT_BUSYBOX=y\n")
> >>     elif randint(0, 15) == 0:
> >>         configlines.append("BR2_INIT_SYSTEMD=y\n")
> >>     elif randint(0, 10) == 0:
> >>         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
> >>     if randint(0, 20) == 0:
> >>         configlines.append("BR2_STATIC_LIBS=y\n")
> >>     if randint(0, 20) == 0:
> >>         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
> >>     if randint(0, 5) == 0:
> >>         configlines.append("BR2_OPTIMIZE_2=y\n")
> >>     if randint(0, 4) == 0:
> >>         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
> >>     if randint(0, 4) == 0:
> >>         configlines.append("BR2_FORTIFY_SOURCE_2=y\n")
> > Thanks for valuable info!
> > I need to have look into https://git.busybox.net/buildroot-test/.

>  The genrandconfig script is in utils/ in the buildroot tree itself. The
> buildroot-test script just calls genrandconfig, followed by make and make
> legal-info. The only interesting thing for you in there is how reproducible
> builds are handled.

Thanks!


> >> For example, did you test with BR2_FORTIFY_SOURCE_2=y ?

> >> Could you point me to the autobuilder failure that you had, but was not
> >> able to reproduce with test-pkg ? We should be able to point out the
> >> difference.
> > Actually, I thought I submitted 0ce30de72f ("package/nfs-utils: bump to version
> > 2.5.4"), but I didn't thus I did not run the verifies.

> > I now tested b2857786f1 ("package/nfs-utils: needs uuid") (which I also didn't

>  The recent issues happen on basically any config and were introduced by
> daa5459b6aaa which fixed it for riscv and broke it for all other 32-bit
> platforms. Only, the two files concerned are only built if sqlite is enable
> resp. if NFSv4 is enabled, so if you don't add those to your test config,
> test-pkg won't catch it.
Yes, the problem was that I didn't realize that running test-pkg with default
options isn't enough. Because that I validate - my patches for fixing RISC
(problem which I found via autobuild), but I didn't check what needs to be
enabled to actually trigger the bug. I usually found arch/toolchain specific
problems with autobuild. But I see I need to do more investigation before
running test-pkg. Lesson learned, thanks!

Kind regards,
Petr

>  Regards,
>  Arnout

> > submit thus didn't tested and all verifiers are OK. I believe that was the first
> > build which failed due warning on printf format. And now:

> > grep ^BR2_FORTIFY_SOURCE_2 ~/br-test-pkg/*/.config
> > # nothing

> > I'll try to test next time with snippet with BR2_FORTIFY_SOURCE_2=y.
> > Anything else it's worth of enabling? E.g. BR2_STATIC_LIBS have at least some of
> > them, also BR2_FORTIFY_SOURCE_1 (but that's not enough)

> >> The thing is that test-pkg cannot test all possibilities, it would take
> >> way too much time.
> > Understand. I just didn't know about the randomizer on autobuilders. I did
> > noticed that sometimes error was reported even I was not able to spot it during
> > test-pkg testing :).

> > Kind regards,
> > Petr

> >> Thomas
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
