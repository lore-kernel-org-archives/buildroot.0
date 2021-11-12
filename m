Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A40C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 20:57:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C42260231
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 20:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C42260231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02AD64024E;
	Fri, 12 Nov 2021 20:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0rhsLVYfQuA; Fri, 12 Nov 2021 20:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A77040196;
	Fri, 12 Nov 2021 20:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA75D1BF3AE
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 20:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C932C40196
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 20:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7w2EuJF7Y53y for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 20:57:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52A2B40183
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 20:57:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 70BF419F595;
 Fri, 12 Nov 2021 21:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636750649;
 bh=IEpjXn1r3sczESyiY3r8HTYekXJ0sa8h4uS2JceVM2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bD8V0wMw8vCOwH7D9Gn3Rmu4xItVXQnEF+mU+CKAevvxRFU/fs2SHH9h/X8HCosP3
 VUPv79E3/U4fCZeR3DaW1aPjs7vLsDRqFB+wJB9kN8aTnL1FxBo8jnhw0gY0jJx0Kc
 kPAHAVvf9Ue9CPtbPcfFa01z9pS7AvLad1taQoxRm7br1skiyQv+QPewGNuQFRNi4z
 n2KqtEkhoh1CR5lyljqcF6G6hggaaX/6VR1a5/z34hrAMA4IcopS4OpKqrlkE31o2y
 wiruqmKjh2Y26+4ju04exNGrAkHCFDaaEQxtCREBkTRQVfTbWNZcCNmwLst5RpFJHt
 TITsJUTBJ7GRA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 21:57:25 +0100
Date: Fri, 12 Nov 2021 21:57:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Carlos Santos <unixmania@gmail.com>
Message-ID: <20211112205725.GC247986@scaer>
References: <20211112185909.1324077-1-unixmania@gmail.com>
 <20211112193354.GB247986@scaer>
 <CAJ4jsad6Mk8NA=ZBE4-MxH3w57oWWg-bqt3VGk-mRcLRwzVPsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ4jsad6Mk8NA=ZBE4-MxH3w57oWWg-bqt3VGk-mRcLRwzVPsg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mksh: fix project URL in Config.in
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Carlos, All,

On 2021-11-12 17:47 -0300, Carlos Santos spake thusly:
> COn Fri, Nov 12, 2021 at 4:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2021-11-12 15:59 -0300, unixmania@gmail.com spake thusly:
> > > From: Carlos Santos <unixmania@gmail.com>
> > > It's https://www.mirbsd.org/mksh.htm
> > ... which does not support TLS 1.2, and so recent browsers whine about
> > an insecure connection, like Firefox:
[--SNIP--]
> I already reported the problem to the project owner. Waiting for a response.

Ok, cool. Thanks!

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
