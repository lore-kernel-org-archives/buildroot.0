Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8C0C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 16:23:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C550F60041
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 16:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C550F60041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8462E4041F;
	Mon,  9 Aug 2021 16:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EajURS3TL1T1; Mon,  9 Aug 2021 16:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE594041C;
	Mon,  9 Aug 2021 16:23:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 293D71BF2A6
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 16:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 161A140221
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 16:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMIa2sfglivw for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 16:22:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3380400CE
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 16:22:59 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so18647795otq.3
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 09:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MppzSc5m7l3i5B5FW/Dat605Li52gD0FjsR0I/JWgkQ=;
 b=HFW4lgbpnGKzBNfmrfjyRM+d9CCu8Hmada0hoEHmIXalT8+ywuOV93Zu9uQziZTHWk
 LXU4QOIJMo5Tz48B4GjUS0j3j2rhNHxhS8rYSSoraFcaoom4Q9PbdcdXqa3Q+MFOzkiQ
 lsceVFgkszyN6YQr3ZNEjcVYvzAYzv4eV0kEi3WQWGRjb7YkIyXnkumXwBKHPlZRxSuu
 aAvdprgqECUHc2UuyE0y36g24FQDeNnSAQD0Yq5jMin817F0XnRFPwQ3mEdKk6K8hwO4
 rIjqV5TQSUZi9XW9JfFtUUonyUJ4QebLnjNf1p2O6IROUDsaT3oSjMhSy3abFW79+sAk
 TGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MppzSc5m7l3i5B5FW/Dat605Li52gD0FjsR0I/JWgkQ=;
 b=n90/6fzegH6uU+BnVkpdi4i7UHc8i0jJSF1/+iJgWGAIlKFcd3fzAlblw5i+eU5fjS
 yIKs6+dzaDww0bYHOdWk3UAHqeg/QsT/GVU8t1a2w0mY1CF9QKw4LGAT4EyEleNCNFle
 2IREp02F2ko7GYufWZDYosqHyxCt6XnnmxNBmi/k+cdNArdz7chAW4+KGiDr6uW55Pn+
 jzCNHqyT2ZFp+d/oI+jO6DSTKCEBrVu/pP2gq/FlkhjtVAN8Bi5eSU8J1ii2QJ+lKTx5
 x3IIeiD99nYqWUaKTKenfAjXqavwqI3j/fqjoot/3RtvmK/c+yaI0lortJVli4CTKbW8
 kXLw==
X-Gm-Message-State: AOAM531zocs4MByE4a/USVwNUao2d3zhzdZtWzj89YjVLTV69ohJZoLQ
 nNM2YERxJberhk1FXwV2/XR+Wsf5i+L+DvUL474=
X-Google-Smtp-Source: ABdhPJwnnGm6ioe/hASqLvi7dM4hAoCdmT3CwiY7b+Vzh/RwHu5kIok2/R0WocMZjo/y2Km/LQA9+QzlQrXDMpJ9YSU=
X-Received: by 2002:a05:6830:410f:: with SMTP id
 w15mr17310319ott.141.1628526178647; 
 Mon, 09 Aug 2021 09:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSsvmpnjAFHs6SxcgLe1=smtJes=4f=qm2wi7W9D8qcC+kYEg@mail.gmail.com>
 <878s1ezzle.fsf@oc8242746057.ibm.com>
 <CAFSsvmpxdF3s-OBcPwMJw8Fp=6wGNib+7YddWoWELCKztEVn_Q@mail.gmail.com>
 <20210807120420.GC27036@scaer>
In-Reply-To: <20210807120420.GC27036@scaer>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 9 Aug 2021 09:22:47 -0700
Message-ID: <CAFSsvmqHjEoN4r5Atj0jDMLr-CcY8SyQ1C=FYg1hywKrrn=2GQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
 Alexander Egorenkov <egorenar@linux.ibm.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hey Yann;

On Sat, Aug 7, 2021 at 5:04 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Adam, Alexander, All,
>
> On 2021-08-06 09:55 -0700, Adam Duskett spake thusly:
> > On Fri, Aug 6, 2021 at 2:34 AM Alexander Egorenkov
> > <egorenar@linux.ibm.com> wrote:
> > > Adam Duskett <aduskett@gmail.com> writes:
> > > > My name is Adam Duskett and I maintain the gobject-introspection
> > > > package for Buildroot. S390x has never been able to
> > > > build the gobject-introspection package and has always failed with the error:
> [--SNIP--]
> > > buildroot seems to use a very old version of prelink-cross and
> > > the error is reported in rtld_determine_tlsoffsets() which has a switch
> > > case handling multiple architectures but s390 is missing for some reason
> > > and then falls back to the default case.
> > Ah! That would explain the issue.
> > > Furthermore, this function
> > > doesn't exist anymore in the lastest prelink commit. Do you know the
> > > reason why buildroot uses such an old version?
> > >
> > The prelink-cross package comes from the OE/Yocto project,
> > and we are using the version that was specified in the
> > prelink_git.bb at the time. The latest version in the OE prelink_git.bb file
> > is f9975537dbfd9ade0fc813bd5cf5fcbe41753a37 which is also from
> > 2018 and still has the rtld.c file. Since the prelink-cross package has
> > worked for quite some time, we never needed to update the package.
>
> If I look at the git history (ellided for brevity):
>
>     * 440c005 (HEAD -> master) Add SPDX license headers to all source files
>     * dfacd42 Updated email addresses
>     *   d89fb60 (master_staging) Merge branch 'cross_prelink'
>     |\
>     | * f997553 (cross_prelink_staging, cross_prelink) Detect PIE executables w/ COPY relocs, and prevent ru>
>     | |       `-> as used by OE core as of today, commit 9159db64d3
>     | * bef24e6 Add option to return an error if all binaries cannot be prelinked
>     | * 68b79b3 testsuite/order.sh: Make it clear what the error is
>     | * 990c806 testsuite/reloc12.sh: Detect if compiler/linker support test
>     | * d73bf2e src/arch-mips.c: check info->resolvetls before use its member
>     | * a89297f x86_64: allow prelinking of PIE executables with COPY relocs
>     | * bd6e69d testsuite/functions.sh: produce deterministic GNU_PRELINK section
>     | * 312b2f5 Fix prelink testsuite/unprel1.sh for cross-testing
>     | * 265e205 Support copy relocations in .data.rel.ro
>     | * d4eabd2 rtld: get machine from undef_map for protected symbols
>     | * 53da4ff README: Indicate we now are requring a Signed-off-by line in patches
>     * | 1f2b546 Merge branch 'cross_prelink_staging' into master_staging
>     |\|
>     | * a853a5d prelink: Add RISC-V support
>               `-> as used by Buildroot as of today
>
> There are only 10 commits between a853a5d7..f9975537, and only 2
> non-code commits on master after the merge.
>
> Adam: would you test that we update the prelink-cross version in
> Buildroot? At least updating to the version as used by OE would seem
> like the minimal, and then maybe check if we can update to master.
>
Yes, we can update to the latest in OE.
No, we can't update to the latest in master, as it doesn't build prelink-rtld,
which is super weird.

Adam

> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
