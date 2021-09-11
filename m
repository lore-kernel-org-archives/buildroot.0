Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4420FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 10:00:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA05A611CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 10:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA05A611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7619C837A4;
	Sat, 11 Sep 2021 10:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3aX3n4n3-CBs; Sat, 11 Sep 2021 10:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8EF78364B;
	Sat, 11 Sep 2021 10:00:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9681BF955
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 10:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C79C6061D
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 10:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYtfSBAiOJyJ for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 10:00:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 761AF6058B
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 10:00:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B4507B0057F;
 Sat, 11 Sep 2021 12:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631354430;
 bh=5GE1ZJUulrH9fAcqCGE/Anj54qHssfCmiL5RqB3hhN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FKE/hQNewxoUYIg5MO7mVem80A1jYHNGUwQDNxeHFgBVGZPSmFqTEsWNaPprQ+Gig
 CZD7S70JGy6xgsRo96WiD6s0gIJgUPWknbekJ9wPMgtqwrS8bNLidwVMr9bk5L3vEx
 iFECxju1w9lUXY0hVw/cQIJ55hYJPR1XDh1lrmNj05jD6rnV90otpt/JbRtKuBUyof
 Yl3xC5eEXDQ7mw/pQlWlCBcPbjUK8mhQR5oy9XEmwZfrAbPKw+NBifcRRhsAPgNyH2
 BafvObQ0Wq44jH8RzgfWKIVIlvT7DOBLVsmk698gS1rJdQ/wYuQmg7F++zgRu5QhIA
 1ZwnrjQvdT7QA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 12:00:26 +0200
Date: Sat, 11 Sep 2021 12:00:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210911100026.GK1053080@scaer>
References: <20210911070859.4638140463@smtp4.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911070859.4638140463@smtp4.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-09-10
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

All,

On 2021-09-11 07:08 -0000, Thomas Petazzoni spake thusly:
[--SNIP--]
> Gitlab CI results for 2021-09-10
> ================================
> 
> Detail of defconfig failures for master
> ---------------------------------------

A lot of our defconfigs have been failing, with error messages like:

    mke2fs 1.46.3 (27-Jul-2021)
    mkfs.ext4: No such file or directory while trying to determine filesystem size
    *** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)
    fs/ext2/ext2.mk:46: recipe for target '/builds/buildroot.org/buildroot/output/images/rootfs.ext2' failed

Note that the error message is misleading; indeed, the size issue is
most probably spurious.

Instead, the issue was with e2fsprogs 1.46.3, which had a regression,
that was fixed in 1.46.4, which we recently bumped to:

    https://git.buildroot.org/buildroot/commit/?id=4ad23552c6

So, before you take action to increase the size in an attempt to fix
the issue, please first test on current master that the error still
occurs.

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
