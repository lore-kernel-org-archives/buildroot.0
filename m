Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D84FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 19:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3995403AC;
	Mon, 17 Oct 2022 19:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3995403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqSSnRZT6_c6; Mon, 17 Oct 2022 19:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6C4D4055D;
	Mon, 17 Oct 2022 19:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6C4D4055D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 263761BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 19:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3BF14183A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 19:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3BF14183A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kb6U37IUUNY1 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 19:02:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8270241735
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8270241735
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 19:02:45 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id i6so11601129pli.12
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 12:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4XDPf8+uvB5YDrOSvknym9lDFb5AQDbG4W6Qy8t7NoE=;
 b=FeK5mCRQBkei335HU4ehAf2PMZUTx6cKlR5kRuvOvVh5OJQzUwaf5ka2nQSWNPkHPT
 a//VY0mT+RzMRcsGJf1PF07mAfz+YQJp5UUKmz8Gd5H5nF4o9cXoHJ/7nawHOHOgOJHb
 1QQHwuyFXcl0t7k696A4wjzWLKSOEzkzYl+kumKf7pRNJGDIfMndEm4IZiN11N1mfZrc
 LnynT1I9CJLOSm7EP/qIO2iTmsIH9thWVleqOFhGJAA7kVCMHE2uMNw0vHHEHeXlVyeX
 H/SQCh6Sdc9J50fQNwSmj6eRJu88nqLZfpdmFU/s4Qrr6BEEvDrWGvepU2nKEFaUsLsX
 Etsg==
X-Gm-Message-State: ACrzQf31qlhV1JRWBpCTdjcsloPi56B4pCh1+3egRukDPlZfhX4lg3sr
 uRCrvdAD/d7y+zM9sTbfvHukXSortaG5xhYY7kk=
X-Google-Smtp-Source: AMsMyM7qgBSsYwlVVNubNjW1yQBWQ5QnljZKmT7+jPs9z7Y4HC8olKh3HPG2mqs4A2WohR+jDTPY4/ZwF2t+U5kqy80=
X-Received: by 2002:a17:902:b598:b0:184:e49d:3042 with SMTP id
 a24-20020a170902b59800b00184e49d3042mr13678741pls.16.1666033364764; Mon, 17
 Oct 2022 12:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
 <20221016075056.GI2503@scaer>
 <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
 <20221016160505.GK2503@scaer>
 <CADvTj4q+ztJca7+MEcOK5-gd94155C0X1s0_5-SvCxp=XXOptg@mail.gmail.com>
 <20221017091644.1104527b@windsurf>
 <CADvTj4qT7BZY4QhkC0A=LFQ5x2fgWBAdECaAGFxu5VUE=ukgxw@mail.gmail.com>
 <20221017142109.424863e1@windsurf>
In-Reply-To: <20221017142109.424863e1@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 17 Oct 2022 15:02:32 -0400
Message-ID: <CADvTj4rF54gTx6jUA9=3GZ4v-LW_b8=8JHG2caaKOVay3m_J-w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4XDPf8+uvB5YDrOSvknym9lDFb5AQDbG4W6Qy8t7NoE=;
 b=brAetdk6MgcUbHo0t6KU0SNPdimIA+yoJhWTSizrqPHKWqYP8Iki8is1WpQJenoDxu
 WIWLzAc/s+Rwz/xcT1C5H7XIwXNaH6s44O+H4qRUDiI8YQc6nZbdfjGPyNE0+tqjXIdO
 vr8G1/7XC6wESlTlT5KTtOf7jVjMNt6NVzIZsKOa4GJ5kQEk0jrKUD2I3HwX0ua5Beq1
 sEyMTEgXFoHUHjQxFgzW7A1v8e34mpRhRFO7GpfSwXmtJORwjpeVlXnrCNHHcIeh0rH4
 CTnKjje1Rfr4wnVL9wxack6pf9Go+esEBswoNakHwcjRAjEfaIVd7mPr+cd0Po7ri8cM
 FcSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=brAetdk6
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 17, 2022 at 8:21 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 17 Oct 2022 07:29:52 -0400
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > The shuffle=random changes don't require modifying autobuild-run, I'm
> > just tweaking the path to make in my autobuild service environment and
> > then passing an additional config flag to autobuild-run like this:
> > --make-opts="--shuffle=random"
>
> Right, but my point stands: it's custom usage/configuration of
> autobuild-run that we would prefer to discuss on the mailing list first
> before deploying/enabling.

I've generally been deploying autobuild-run tweaks after initial local testing.

Typically I send them to the mailing list after running them deployed for
a little to clean them up and make sure they work as expected and verify
the builds that are failing are not due to bugs in the autobuild-run tweaks
themselves.

They don't usually get looked at for a while in patchwork so I haven't really
been bringing them up on the mailing list until after I've tested/deployed
them myself for a little, I have a couple pending in patchwork at the moment
for autobuild-run for example:
https://patchwork.ozlabs.org/project/buildroot/patch/20220607231211.533086-1-james.hilliard1@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20220718043901.873466-1-james.hilliard1@gmail.com/

Sometimes I override genrandconfig as well to test patches such as:
https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/

I have a local patch to autobuild-run that redirects to an out of tree
genrandconfig so that I can test tweaks there. I also have it validating
that the in tree version of genrandconfig hasn't changed by comparing
against a known sha256 hash before using the out of tree tweaked version
to ensure that autobuild-run automatically falls back to using the in-tree
genrandconfig if genrandconfig gets changed/fixes in upstream buildroot.

For autobuild-run changes that increase error rates significantly due to
higher rates of bugs which need fixes in buildroot I sometimes have held off
on sending them as patches until the rates of errors triggered get low enough
that it would make sense for others to use those changes as well.

In this case I was also holding off on a patch automatically enabling shuffle
mode to autobuild-run as using that feature currently requires running a yet
to be released version of make and was triggering a few issues in buildroot
that needed fixing on the buildroot side.

I also figured that by testing master make using the autobuilders we can
get make issues fixed upstream before the next make release, such as
this shuffle mode bug so far:
https://savannah.gnu.org/bugs/index.php?63215

What sort of autobuilder changes would you like me to discuss on the mailing
list before deploying? I tend to experiment a bit but am usually pretty careful
to make sure that my autobuilder tweaks only cause build failures due to real
bugs that need fixing in buildroot/buildroot packages.

>
> > Well builds were mostly failing in the same place due to deterministic
> > build ordering, I was trying to make it so that we would see failures
> > in different places as that's more useful compared with always seeing
> > the same errors.
> >
> > To me seeing the same errors most of the time indicates there's some
> > major coverage issues with the autobuilders which need fixing.
>
> I think you're missing a point here: many of the builds today are
> failing due to the glibc 2.36 bump. So pretty much every single build
> that is glibc based will indeed fail with some error related to this
> glibc bump.

Probably a lot were failing for a couple days due to this glibc bug:
https://github.com/buildroot/buildroot/commit/b749d6dd7b5fc6cc8b85a316878721d42654759c

There's probably some failures still due to this issue but most of the others
seem to be dependency bugs in package makefiles:
https://patchwork.ozlabs.org/project/buildroot/patch/20221016193014.3384022-1-james.hilliard1@gmail.com/

However I'm actually referring to a separate issue with test coverage
that has always been present.

>
> Your additional randomization will not change anything to this. It's
> just that we now have the glibc bump issues + the newly discovered
> issues related to the extra randomization + the usual amount of build
> issues.

When I brought patch up this on irc:
https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/

arnout mentioned:
2022-07-25.log-[03:28:02] <arnout> Lightsword: about the build time: I
think the issue is that if you increase the number of selected
packages, you also reduce the number of successful builds (because it
fails as soon as one failing package is selected) - and that way,
packages that get built late (i.e. that come late in the alphabet and
have no reverse dependencies) don't get built.

This is indeed the case when I tested increasing the probability further,
however by randomizing the dependency ordering using make 4.4's new
shuffle mode we should be able to mitigate the alphabetical ordering bias
issue and thus get better test coverage of packages with larger dependency
trees by increasing the number of selected packages while using shuffle mode.

Looking at the current autobuilder failure logs I'm seeing that most
autobuilders
other than my own have much lower build failure rates and not much variety
in terms of failure reasons due to poor coverage of packages with larger
dependency trees.

For my own autobuilders running with shuffle mode I'm seeing much higher
failure rates for different reasons so these changes do appear to be
increasing out test coverage overall, there's a lot of issues with makefile
dependency ordering that are new and I suspect once those are fixed
we'll be able to get much better overall coverage of more common issues,
especially issues hit when running parallel builds.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
