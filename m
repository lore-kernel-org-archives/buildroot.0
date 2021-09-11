Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C7DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:24:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED30B61208
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED30B61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 943C1607EF;
	Sat, 11 Sep 2021 15:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHznR3eTP6vX; Sat, 11 Sep 2021 15:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F17607A7;
	Sat, 11 Sep 2021 15:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E34481BF35A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D26EF8105C
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gojFd-shQ6h for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:24:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A750F8104B
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:24:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7D9A1B0053E;
 Sat, 11 Sep 2021 17:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631373842;
 bh=zwQ/7eay4o9oaGlCFKF8b5SYnM2eItZEkbrgOBd1qhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RqlxapWCH1R2rRnr4XCi+0uJaeAYaAxqWZtR5I85xns710OwfnRkxnBlA7nIzXBn+
 qC5tMgkmLSBr8fn7znpCixuZ8EhBvoDGM9fqhgd09q5tx93YS6t1wKTWHZs0fBCpn4
 CnDtCR2tNCRL6WJ8CW2KJzu/ELwhtaTkcKBY6FQsOtavRX+sG/+GPNqcafQzYkH1Hv
 xpWU5hgJA+OUZiEl9ebBG9ZsBiJY3N89FZwrsl+yoy7saJ/UA46Ybx1qhxKJqRDqEi
 w7G6TBBj3U7P/DMhPbukdRTyRhBtlzs0HwVV3Oau0+u3d2Yymj7hWcMcHHVStJpQr7
 5xWpQ7MwLN9tw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 17:23:58 +0200
Date: Sat, 11 Sep 2021 17:23:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: daggs <daggs@gmx.com>
Message-ID: <20210911152358.GP1053080@scaer>
References: <20210911084204.22150-1-daggs@gmx.com>
 <20210911092713.GI1053080@scaer>
 <trinity-8842de39-896a-41dd-9128-939d22dcb2f8-1631370558915@3c-app-mailcom-bs14>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-8842de39-896a-41dd-9128-939d22dcb2f8-1631370558915@3c-app-mailcom-bs14>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/ordeidc2: increase image size to
 256M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Dagg, All,

On 2021-09-11 16:29 +0200, daggs spake thusly:
> > Sent: Saturday, September 11, 2021 at 12:27 PM
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: "Dagg Stompler" <daggs@gmx.com>
> > Cc: buildroot@buildroot.org
> > Subject: Re: [Buildroot] [PATCH] configs/ordeidc2: increase image size to 256M
> > On 2021-09-11 11:42 +0300, Dagg Stompler spake thusly:
> > > following Commit 9f127cc4, the resulting image is bigger than possible.
> >
> > I fail to see how commit 9f127cc4 can be the culprit:
> >
> >     9f127cc4 utils/getdeveloperlib.py: explicitly set devs document encoding
> >
> > > so BR2_TARGET_ROOTFS_EXT2_SIZE set to 256M is required.
> >
> > The default is 60M; bumping to 256M is surely a big jump. Can't we
> > settle for something smaller, like 128M?
> >
> > Also, note that the default is 60M, as we consider a 64M SDCard, and
> > thus some space is reserved at the begining for the boot blobs; see
> > board/hardkernel/odroidc2/genimage.cfg
> >
> > And as a consequence, the size of the SDCard must also be updated in
> > board/hardkernel/odroidc2/genimage.cfg.
> >
> > So, maybe:
> >   - update board/hardkernel/odroidc2/genimage.cfg from 64M to 128M
> >   - update BR2_TARGET_ROOTFS_EXT2_SIZE to 124M
> >
> > Regards,
> > Yann E. MORIN.
> >
> 
> if you open the link stated in the commit msg and look at the right,
> you see the commit stated in it.
> I didn't thought I should verify if it is that commit.
> this is the first error the autobuild  finds which I can reproduce,
> so I assumed it is related to that commit.

Ah, the gitlab-ci job that tests the defconfigs only runs once a week,
so you'd get the commit that was current by that time.

Also, the e2fsprogs bump to 1.46.3, which had the regression, was
applied to the 'next' branch, which is not tested by the gitlab-ci
infra, and thus the first issue to be reported was when next was
eventually merged into master last week.

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
