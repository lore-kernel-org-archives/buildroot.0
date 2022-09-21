Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF189ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5501481391;
	Wed, 21 Sep 2022 18:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5501481391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQiIW7_pzgVV; Wed, 21 Sep 2022 18:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B038135A;
	Wed, 21 Sep 2022 18:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B038135A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C62B1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D349E8133F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D349E8133F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id giGS0_p0HsOQ for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:28:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D4F78131D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D4F78131D
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:28:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3556:b9e6:5304:8eb5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 709095FF27;
 Wed, 21 Sep 2022 20:28:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Sep 2022 20:28:35 +0200
Date: Wed, 21 Sep 2022 20:28:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220921182835.GS1419013@scaer>
References: <20220920194645.670432-1-yann.morin.1998@free.fr>
 <20220921201320.0a7f80c0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220921201320.0a7f80c0@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663784918;
 bh=GXoXG/3miCn6qVAnGQoxOn8N0HOh/lJeDzjnBMkt/rY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGdyjFmm8At3iaJSPtcLFhp+rMpzJwOt7Rj7SjSzZL55HyZbCi5jCPqgy7My8yLcp
 P0HT4NLJgY/9BdY3SVTXxZHM/y2Npcvl8mYV4l31bxOcsPYpsPbjPsBXya9sMgOdgB
 hj2vRb1d69Ey6bkwpqucUP0FEGCA8dzu2SNEDyZAEQh/A+VhIU/c77qEbYyXXFwDFL
 LVRoZl6kSoUhjO8OZDbd30EzpP2wJQjk+WczrB0uaF4s0CVQwG1vRdPflUqmBOgN6u
 eAFWzFbYzv1TGm1PJVHEqeTdO4AIDxeLXvqb6vs4LlEJnpnA699TXfo5LSzlbj4iE/
 gNvdKNJzVs54w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mGdyjFmm
Subject: Re: [Buildroot] [PATCH v3] Makefile: fix use of many br2-external
 trees
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
Cc: David Lawson <david.lawson1@tx.rr.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-09-21 20:13 +0200, Thomas Petazzoni spake thusly:
> On Tue, 20 Sep 2022 21:46:45 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > One of the rationale behind this code, is that we want the defconfig
> > files from br2-external trees further down the list, to override
> > defconfig files from those earlier in the list, even overriding the
> > defconfig files from Buildroot itself.
> This is the part I would like to challenge. Why do we want to allow
> BR2_EXTERNAL to override defconfigs from the main tree? We do not allow
> this for packages, why should we allow it for defconfigs?

This patch does not change the actual behaviour: we've been allowing
this for the past 6 years, we've documented it; all that patch does is
actually fix using more than 5 br2-external trees.

> To me, allowing the override of defconfigs is actually a bad idea: when
> you run "make foo_defconfig", it's no longer really clear which
> "foo_defconfig" is really going to be used. Yes, it's well defined, but
> it isn't "obvious".

I think initially, it was far simpler to do it that way, since we did
not have a list of defconfig files, and so we (ab)used make ability to
override a rule, to justify a simpler code on our side.

Changing that behaviour is now easier, now that we do have a list of
defconfig files, but if at all, that should be done in a follow-up
patch.

However, the multi br2-external support is there to cover one case: a
br2-xternal tree provides basic support for a board (e.g. by a team in
charge of the ardware support), and a second br2-external provides
defconfig for an actual product. In this case, given a board named
'foo', it is understanble that the harware guys name their defconfig
foo_defconfig, and that the product team also name their defconfig
foo_defconfig. So, I think allowing this overide is not a bad thing.

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
