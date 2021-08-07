Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E2DC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 12:04:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2EBF610FC
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 12:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2EBF610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6461F4000B;
	Sat,  7 Aug 2021 12:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgUGnBaHcCs4; Sat,  7 Aug 2021 12:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DFFE40165;
	Sat,  7 Aug 2021 12:04:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2C111BF32B
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 12:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF73D607EC
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 12:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dARFkeVZLpoE for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 12:04:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2168606AE
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 12:04:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B448D78033D;
 Sat,  7 Aug 2021 14:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628337869;
 bh=ODNlIQ6VR5UkJoVqxv5myrOsgLx617bBfPCDQ0bcj6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bb1R0+fyyedk4sS1XmEBG7aaHpl+4LreepKzYSh1PkNM6Kbuc1x4mCXgko7eHTJKH
 w4qXSG2MQWa8wV9s0dyAwxTFY8i0ZUQodT48zEKtvnSJ49oBUXCehlEX1Tjw+9fahH
 LlHwCYRoa0ZTOZBDrZgQjQj4EYlUXoJNmW8wU+9EdNThfWN45N6C4YF5WYTYaX3sTQ
 XG9AfJ1YnDvblfBE9l1gSneuEVTwjCNw7kAJcGMzDzCEi9Y4HCTCCvIDuIXGsI3pBN
 c6QDU4wVqBbZm+xdoD8fkyCoecxkcTQBPaYNtFQyQG5mCZWMjDQsoUvLO28Um0b9lv
 E+ryL6WUb771w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 14:04:20 +0200
Date: Sat, 7 Aug 2021 14:04:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210807120420.GC27036@scaer>
References: <CAFSsvmpnjAFHs6SxcgLe1=smtJes=4f=qm2wi7W9D8qcC+kYEg@mail.gmail.com>
 <878s1ezzle.fsf@oc8242746057.ibm.com>
 <CAFSsvmpxdF3s-OBcPwMJw8Fp=6wGNib+7YddWoWELCKztEVn_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFSsvmpxdF3s-OBcPwMJw8Fp=6wGNib+7YddWoWELCKztEVn_Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Buildroot, S390X,
 and gobject-introspection build error help
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Adam, Alexander, All,

On 2021-08-06 09:55 -0700, Adam Duskett spake thusly:
> On Fri, Aug 6, 2021 at 2:34 AM Alexander Egorenkov
> <egorenar@linux.ibm.com> wrote:
> > Adam Duskett <aduskett@gmail.com> writes:
> > > My name is Adam Duskett and I maintain the gobject-introspection
> > > package for Buildroot. S390x has never been able to
> > > build the gobject-introspection package and has always failed with the error:
[--SNIP--]
> > buildroot seems to use a very old version of prelink-cross and
> > the error is reported in rtld_determine_tlsoffsets() which has a switch
> > case handling multiple architectures but s390 is missing for some reason
> > and then falls back to the default case.
> Ah! That would explain the issue.
> > Furthermore, this function
> > doesn't exist anymore in the lastest prelink commit. Do you know the
> > reason why buildroot uses such an old version?
> >
> The prelink-cross package comes from the OE/Yocto project,
> and we are using the version that was specified in the
> prelink_git.bb at the time. The latest version in the OE prelink_git.bb file
> is f9975537dbfd9ade0fc813bd5cf5fcbe41753a37 which is also from
> 2018 and still has the rtld.c file. Since the prelink-cross package has
> worked for quite some time, we never needed to update the package.

If I look at the git history (ellided for brevity):

    * 440c005 (HEAD -> master) Add SPDX license headers to all source files
    * dfacd42 Updated email addresses
    *   d89fb60 (master_staging) Merge branch 'cross_prelink'
    |\
    | * f997553 (cross_prelink_staging, cross_prelink) Detect PIE executables w/ COPY relocs, and prevent ru>
    | |       `-> as used by OE core as of today, commit 9159db64d3
    | * bef24e6 Add option to return an error if all binaries cannot be prelinked
    | * 68b79b3 testsuite/order.sh: Make it clear what the error is
    | * 990c806 testsuite/reloc12.sh: Detect if compiler/linker support test
    | * d73bf2e src/arch-mips.c: check info->resolvetls before use its member
    | * a89297f x86_64: allow prelinking of PIE executables with COPY relocs
    | * bd6e69d testsuite/functions.sh: produce deterministic GNU_PRELINK section
    | * 312b2f5 Fix prelink testsuite/unprel1.sh for cross-testing
    | * 265e205 Support copy relocations in .data.rel.ro
    | * d4eabd2 rtld: get machine from undef_map for protected symbols
    | * 53da4ff README: Indicate we now are requring a Signed-off-by line in patches
    * | 1f2b546 Merge branch 'cross_prelink_staging' into master_staging
    |\|
    | * a853a5d prelink: Add RISC-V support
              `-> as used by Buildroot as of today

There are only 10 commits between a853a5d7..f9975537, and only 2
non-code commits on master after the merge.

Adam: would you test that we update the prelink-cross version in
Buildroot? At least updating to the version as used by OE would seem
like the minimal, and then maybe check if we can update to master.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
