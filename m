Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 16:26:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE32B60D07
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 16:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE32B60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 552CA40494;
	Sun, 19 Sep 2021 16:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSTFy0ZcAMsv; Sun, 19 Sep 2021 16:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A33A04046D;
	Sun, 19 Sep 2021 16:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3E01BF4E4
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 16:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B39580F75
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 16:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wv57OTwbGEbg for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 16:25:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B526880F69
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 16:25:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9F9132003DC;
 Sun, 19 Sep 2021 18:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632068752;
 bh=yfnluv1MWYHETVpYerDvDK8I8LZO21JedAE17pgQR+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dcQS9uz+oAbWdSqAVoGoV37v/r6IsqZ7UGhoDZkKZJ5YkanCGVPOaBNvksehAy/M4
 CtvOdGwEre3A9pkcQ8edEqtzmxnHJcn0sOx0Oa5F195YX/KsSgBGKcRHHzzY7vQAoO
 vsXnwGLtgolkjJcGODWvG9JtWz4jkS14Vljh/3zwIWKP/7YvngI3sSG5ghW6IFddv/
 F/ZW/NLKgvnIBdtvUdmlkWffgoKzVm1Yh+lyqhZfAFDZYdoFB2iREegv4PcVCIrhab
 FMdvdoatmhaZTEoy1WPOLScp/v/0RuX1t9PYp0HP+/EhHcg/cWaEpJdhnZr9F9ciV3
 y7kNfaurDpBNg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 18:25:46 +0200
Date: Sun, 19 Sep 2021 18:25:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210919162546.GU1053080@scaer>
References: <20210906213938.201161-1-giulio.benetti@benettiengineering.com>
 <20210919071555.GF1053080@scaer>
 <1a389193-3d8d-ffad-b744-7cf5f7412c7d@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a389193-3d8d-ffad-b744-7cf5f7412c7d@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.10.5
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Giulio, All,

On 2021-09-19 17:13 +0200, Giulio Benetti spake thusly:
> On 9/19/21 9:15 AM, Yann E. MORIN wrote:
> >Giulio, All,
> >
> >On 2021-09-06 23:39 +0200, Giulio Benetti spake thusly:
> >>Bump libfuse3 to version 3.10.5 and remove local patch that has been
> >>upstreamed.
> >>
> >>Release notes:
> >>Various improvements to make unit tests more robust.
> >>
> >>Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >
> >Applied to master, thanks.
> >
> >It should also fix the same build failure that occurs with glibc 2.34 on
> >the old libfuse (pre-3).
> 
> I don't understand here. There is a patch already applied for glibc 2.34 on
> the old libfuse:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210912194057.2556882-1-fontaine.fabrice@gmail.com/
> 
> I don't understand how this version bump of libfuse3 can help. Have I missed
> something?

libfuse and libfuse3 are really just the same upstream project.

The patch that Fabrice submitted on libfuse is a backport of an upstream
commit that was applied between libfuse 3.10.4 and 3.10.5.

So:

  - libfuse is fixed thanks to the backport of the upstream commit;

  - libfuse3 is fixed thanks to the version bump that includes the
    upstream commit.

But we so far had no such build failiure on libfuse3, probably because
the autobuilders have not had time yet to hit it.

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
