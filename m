Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED611C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:39:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC37610A5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AC37610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2906F80F29;
	Tue, 28 Sep 2021 05:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4U3lWGOZj5LW; Tue, 28 Sep 2021 05:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 728AC80D1B;
	Tue, 28 Sep 2021 05:39:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7051BF847
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49FEB80D1B
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaE-qMNu6TTr for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 05:39:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79BD880D18
 for <buildroot@busybox.net>; Tue, 28 Sep 2021 05:39:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9ded:7cc8:164a:d8a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4135C78035D;
 Tue, 28 Sep 2021 07:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632807577;
 bh=4FEcR+70NNZ0k2StDImzDoZ7VKgpYZ8vIGWdva1pvYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMXjkAesM2nDZYfVidvBbqIkOp8VsCJYzWfEWmbb+B795qyQ3j+ENJ5oRVSxZqJL+
 8Is3hljKozlmmR5psAHuCzBZDAJxJI64VGvNR97MUnxxVoycGmlklwTEv+ZkqWaEcn
 I5GnV5mty5XzIPGDnAa/H1vtZ+eXyUP3/t3eGrTfKl4ALIWC36iwGlXYC2h4ZYUtAH
 Gniv0UI3dYUxkPe754fC667SUflhucfnQ8lFtkcD6gk1dnlIaPLWoKI7R9GjLLbr9e
 1ADpfIctWDQy1AiKtAcrkyNbMRIhVQYnXVRJ+ioS5Ldw2qOl/KdGcNSOKSZXhQJrp+
 gAHU3FH+s3hiQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Sep 2021 07:39:25 +0200
Date: Tue, 28 Sep 2021 07:39:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <20210928053925.GI1504958@scaer>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
 <CACPK8XeWmhxOoXT0XUHkjgygnvvA0Rr0bMRCR-2UVPDz3gEKcg@mail.gmail.com>
 <71621598266144b34d011dd8e24605ced76b9afb.camel@ozlabs.org>
 <20210928052156.GG1504958@scaer>
 <2578458edf86683a89289ed29641ee48299fa399.camel@ozlabs.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2578458edf86683a89289ed29641ee48299fa399.camel@ozlabs.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] What's wrong with patchwork
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
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jeremy, All,

On 2021-09-28 13:30 +0800, Jeremy Kerr spake thusly:
> > So, yes, could you update Patchwork, please?
> Sure thing, done!

Let the flow of incoming patches soar, now! :-]
/me ducks for cover...

Thanks! :-)

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
