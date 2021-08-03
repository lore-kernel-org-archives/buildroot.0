Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E86FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 02:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C3260EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 02:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4C3260EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747C482F57;
	Tue,  3 Aug 2021 02:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pj8tBSNT7JXA; Tue,  3 Aug 2021 02:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 808B482FC9;
	Tue,  3 Aug 2021 02:43:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA3F91BF2C0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 02:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C352140261
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 02:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwRwFFGDFAIP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 02:43:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60EBE401EC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 02:43:44 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 c7-20020a9d27870000b02904d360fbc71bso19368677otb.10
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 19:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p6yUQSS2dRrQO9/gbcDjtNyoydi0RoT3QGsM4oy2hzo=;
 b=j4QTXMLnBjYI06Vaxqpck+I/ZgMboOk+k/MODQEeTg7cQxBxA+y3skYQYjOlCkoIX1
 uQApoCW2WqvgcWxgHsxeHEjvaG4XLMMi7kj9r+Khx5NFo9r06Fb2o/S7YvEr0zkiSSn0
 fImc3Xa/UgbQlA2qtIowxknD6zrNfJ7tnZ8jeBxV9k6LsCLzlBU67ixE52DjCVUJxOsx
 r/20jJHwuW5mc2/WdY9tz1Ut3Ir36q43Lry/yA+lsF7sQk/BIQFtB/TxB3/4wmflEYuW
 8m71j9NhpJS3J92wXR3yDPesMMrq9Xlxbdere5vZmrDzLFbQWha0mJm7Vo1bCQ7+utvb
 4FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6yUQSS2dRrQO9/gbcDjtNyoydi0RoT3QGsM4oy2hzo=;
 b=Pchrz5h8/2z7GbC+O1yoXGUQ7TFaWdY0Dj8iA1K4uZxM//N+aT2b1XSdtsZELjkHr+
 qFBGJzoQ+C9g1VZLUHwRuzfT4xvtPNCMkCCwIGP1R7KeFLK7fHMpGMaap3Z+hxu73Bx6
 mA446xP3jj0Roekm+X6TFo+LHXSmEfzRTgxuL3YuXTTMkFZSmPNRPHG1I+vnGPHO1m/P
 CpQolj6LSs+VTvhwPUv6zeLoVK6swlUykzPWYnljSTX101mAeKfn+J3ZjcDOqazPElGh
 mKMOYTHXyRxJcfTUMkNhvIHTocGgq1ZigmLtu1kzuINpBViI4QvcKohzLjcV3uo/4Mh/
 Mz2Q==
X-Gm-Message-State: AOAM532XVQqC0IBFZtSoNsY+6oVpj+tkxCw9tTrS2IPKIBDOGk5bIOQG
 3gqZzhIB6J0hgsJt3GdA9KnH6AGB2I3IcPukMS8=
X-Google-Smtp-Source: ABdhPJwWOL0St54x/68T+3JaGaOIO53NiCQwYn1eTEOM6Hw/VpmQIFCv0/czXpHQlJTc1JilNAYSmG2F+8w5QTL64a4=
X-Received: by 2002:a9d:5f87:: with SMTP id g7mr14174834oti.278.1627958623029; 
 Mon, 02 Aug 2021 19:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210802060946.C27006062D@smtp3.osuosl.org>
 <20210802234647.6f3df99d@windsurf>
 <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
In-Reply-To: <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 Aug 2021 20:43:31 -0600
Message-ID: <CADvTj4rCinUU+QmWmtELNvVHz+cdDc9-K0jsCYsvRcWY3RW0Bw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] Some analysis of the major build failure reasons
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Adam Duskett <aduskett@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon, Aug 2, 2021 at 4:56 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Hello Thomas, James, All,
>
> On 8/2/21 11:46 PM, Thomas Petazzoni wrote:
> > Hello,
> >
> > Giulio, Bernd, Adam, there are questions for you below. Thanks for your
> > support!
> >
> > On Mon, 02 Aug 2021 06:09:39 -0000
> > Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >
> >>      master   | 1903 | 802 | 53  | 2758 |
> >
> > So it's getting a bit better, but we still have lots of build failures.
> >
> >> Classification of failures by reason for master
> >> -----------------------------------------------
> >>                   pixman-0.40.0 | 31
> >
> > I have investigated this. It fails only on sh4, due an internal
> > compiler error. It only occurs at -Os, at -O0 and -O2 it builds fine. I
> > have reported gcc bug
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737 for this. Since I
> > tested only with gcc 9.3.0 for now, I've started a build with gcc 11.x,
> > to see how it goes.
> >
> > Based on the result, I'll send a patch adding a new
> > BR2_TOOLCHAIN_GCC_HAS_BUG_101737 and disable -Os on pixman on SuperH
> > based on this.
>
> I can do that since I've treated a lot of gcc bugs. Is it ok?
>
> >>                         unknown | 31
> >
> > I did not look into these for now.
>
> I've taken a look into the last ones of today(the 31 ones)
> @James: lot of your builds simply stuck after Make has finished(not on
> linking but exactly on 'make: Leaving directory').
>
> I've noticed it time ago some time, and now it became very more
> frequent. This is 9/10 your autobuilder giving that problem.
> And this happens at different Build Duration:
> http://autobuild.buildroot.net/?reason=unknown
> Also I see you use /tmp/ folder but I don't see anyone else doing that.
> Isn't it maybe that your distro automatically cleans /tmp folder up? Or
> it is mapped somewhere where disk gets full randomly?
> I would move it to a specific user folder(i.e. buildroot user) and that
> should fix the problem. If you're trying to do such thing to save disk
> space I tell you that I've already done it time ago with this patch that
> now needs to be rebased:
> https://patchwork.ozlabs.org/project/buildroot/patch/20180919114541.17670-1-giulio.benetti@micronovasrl.com/
> But in my case NOK was clear. I'm pretty sure /tmp/ is the problem.

The autobuild service is run with a private temporary tmp directory,
I use a similar setup for my x399 autobuilder:
[Unit]
Description=Buildroot autobuild
After=network.target
ConditionPathExists=/etc/default/buildroot-autobuild
StartLimitIntervalSec=0

[Service]
User=autobuild
Group=autobuild
Type=simple
PrivateTmp=yes
WorkingDirectory=/tmp
ExecStart=/opt/buildroot-test/scripts/autobuild-run --config
/etc/default/buildroot-autobuild

Restart=always

[Install]
WantedBy=multi-user.target

>
> On @Thomas autobuilder I see failure for:
> - optee-client(already found NOK):
> http://autobuild.buildroot.net/results/5e9/5e91bc53c3fbcd2ed232db79dc5c947394d66a1e/
> - failure on fetching as mentioned above
>
> >>                    zeromq-4.3.4 | 30
> >
> > Giulio: this is happening only on or1k, with a binutils assert. Do you
> > think this is solved by your or1k fixes?
>
> It is. Those build failures are due to the use of binutils-2.33.1 that
> have not patches for or1k. While all the other binutils versions have
> local or upstreamed or1k patches.
>
> Of course this can still happen with actual external Bootlin or1k
> toolchain that use exactly binutils-2.33.1 not patched. So the problem
> will be solved once you recompile and bump them with patches provided. I
> still see that we're on 2020.08-1:
> https://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk#n586
>
> >>                 libfuse3-3.10.4 | 23
> >
> > This only happens on Microblaze, with:
> >
> > ../lib/fuse_loop_mt.c:361:1: error: symver is only supported on ELF platforms
> >
> > Giulio, does it ring a bell to you ? It's weird because Microblaze is
> > using ELF binaries.
>
> I'm going to look into this.
>
> >>                 nfs-utils-2.5.4 | 19
> >
> > I assume would be fixed by
> > https://patchwork.ozlabs.org/project/buildroot/patch/20210802172116.10073-1-petr.vorel@gmail.com/
>
> Yes, it does. This bug confused me because of lacking of -werror.
>
> >>                       gpsd-3.21 | 17
> >
> > Giulio, the workaround to pass -O0 no longer works for some reason. -O0
> > is still passed, but -O2 is passed *after*, causing the build issue to
> > pop up again. Could you have a look ?
>
> Sure, some upstream change that makes my work-around useless.
>
> NOTE:
> I also add libnss-3.68 new bug on Aarch64_BE to be fixed. I'm already
> working on it on spare time.
>
> PS: I've found my autobuilders stopped, I think I've forgotten to
> restart the daemon after updating the Distro. Now they're up and running.
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
