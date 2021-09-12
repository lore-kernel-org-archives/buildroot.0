Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D747C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:26:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2D0B610CB
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2D0B610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A727825DC;
	Sun, 12 Sep 2021 15:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Gay7Jzxq0Em; Sun, 12 Sep 2021 15:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA03D825B1;
	Sun, 12 Sep 2021 15:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D77C61BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6BE3825B1
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZdDa2ziqn7S for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 15:25:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8908082560
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 15:25:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc3c:8ee4:eb9c:c13b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 178A52003D6;
 Sun, 12 Sep 2021 17:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631460353;
 bh=qSVgiiYxb+NJhxw6qPtUDTaH14NW+Zlhn2m+5vXYgsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kyItUukx+Tb6Hqa6q4Wk8uoiT1x2K/gbv2YbnGjLA2r+RDUgKjgIlr5hRhksKXHK5
 lFQL9sWLS5av2Bhe7pKMuXjziM/OT5ZCPy/6FhA40VmI83ZVB7ypCH/cHhyjDfptUW
 xhIcJbSQpbLQ3sD7sTMVel1OAHxfW2++jNc1cgf+2FygHpCRjcVfzlTXSu013KTqNk
 IgZ5DNwsvZlbBZf3SeTMZjcMNcdxVY2AVQitW6nBJrOX/tc8GdtowBs0uTuKAVkp+g
 +PKAtYIBiYxmB0huyPOQ2HuI6PdAaRIYrfU2uQBTJHzXtrH0Hs83nsgENXYFfwCdJX
 ULq1oJHej8JiQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 17:25:48 +0200
Date: Sun, 12 Sep 2021 17:25:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20210912152548.GJ1053080@scaer>
References: <20210912091221.80127-1-buildroot@heine.tech>
 <20210912094754.GE1053080@scaer> <20210912113630.GF1053080@scaer>
 <6ad2e588-2c8c-1b1e-5cc1-e61c07aa581c@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ad2e588-2c8c-1b1e-5cc1-e61c07aa581c@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/boost: fix math with no atomics
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

Michael, All,

On 2021-09-12 17:00 +0200, Michael Nosthoff via buildroot spake thusly:
> On 12.09.21 13:36, Yann E. MORIN wrote:
> >diff --git a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch b/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
> >
> >>>new file mode 100644
> >>>index 0000000000..121355d71e
> >>>--- /dev/null
> >>>+++ b/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
> >>>@@ -0,0 +1,47 @@
> >>>+From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 2001
> >>>+From: jzmaddock <john@johnmaddock.co.uk>
> >>>+Date: Wed, 1 Sep 2021 18:54:54 +0100
> >>>+Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
> >>>+ line. Allows us to test/emulate platforms with no atomic integers.
> >>>+
> >Arg, I forgot a few details about the individual patches:
> >
> >   - you should add a small comment to explain the origin of the patch
> >   - and add your own SoB line
> >
> >Usually, I do something like:
> >
> >     [your@email: backport from upstream 32bd6197353f6ea8e5bef01f09e25c944141acfc]
> >     Signed-off-by: Your NAME <your@email>
> >
> >Can you send a fixup please?
> 
> Sure! just to be sure: what do you mean by fixup? should I commit using
> --fixup and send as new patch?

I've applied already, and pushed, so please send a new patch.

Thanks!

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
