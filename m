Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2091DC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 09:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA88A4038A;
	Sun, 25 Feb 2024 09:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yztVpBxAWIk; Sun, 25 Feb 2024 09:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBC5240471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC5240471;
	Sun, 25 Feb 2024 09:05:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F78E1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29D964038A
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEJLdZgDvyg4 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 09:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04DC440186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04DC440186
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04DC440186
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 09:05:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BE96F13F8B5;
 Sun, 25 Feb 2024 10:04:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Feb 2024 10:04:59 +0100
Date: Sun, 25 Feb 2024 10:04:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZdsCu9DG-2o0aaiN@landeda>
References: <20240224213008.670294-1-fontaine.fabrice@gmail.com>
 <87o7c5rmyn.fsf@48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7c5rmyn.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708851904;
 bh=RSPEnm4NHmMuP+BozGZXMW40Knil+61eDBa8dwe963I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDC5/PeVRGTpejfPF4s/SdEHmiqehtR/B4NJtALP2Tjv68FRYRY6IBGMNHysr5osf
 JngwvUKAmsR2tD3yzvhrfZRdWt2pBANBl8Sp/wvyVrtprbQm4q/XymACFTDX9iCCzw
 oCIa2rYkEqULZ6Yr5OEVDQ+Cyu9KTl5v3O9/mWS/Xn9BxYtq2eghEX0Rt6WCr2tZzE
 sevErbd7tLJOgQ68czZXWiPPpZFUWGeov81v7u29/Yb0Tl2akE9NYpAXYBlsGIwBBQ
 8hUjwnhVz5S8qCV9PALSORzA6s9v+KHFWoty+Kl5OS/vc/MoEXKgk0ErC6TtRPZcQT
 wgaUqFmRloheQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eDC5/PeV
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix linux-pam select
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, Fabrice, All,

On 2024-02-25 09:02 +0100, Peter Korsgaard spake thusly:
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>  > Commit 2c5a82a29ceb382d53ccb08ffd34a92c142cadbb forgot to handle
>  > linux-pam dependencies resulting in the following build failure:
[--SNIP--]
> This stops kconfig from complaining, but does a openssh + refpolicy build
> without (E.G. ) locale support then actually work? Judging from:
> commit 2c5a82a29ceb382d53ccb08ffd34a92c142cadbb
[--SNIP--]
> I am not sure what the proper solution is for situations where pam is
> not available? Adam?

I already sent a fix for this a while back, and we discussed it with
Thomas back at the last dev-days, summarised there:

    https://lore.kernel.org/buildroot/20240207122726.2aa4be3c@windsurf/

I'll need to send that new iteration soon...

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
