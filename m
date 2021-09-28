Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D8DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:22:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF91E60F4A
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF91E60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92FCD80EAF;
	Tue, 28 Sep 2021 05:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGaNkTF3hWld; Tue, 28 Sep 2021 05:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0793180EC1;
	Tue, 28 Sep 2021 05:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A545D1BF847
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E9F780EC1
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g6MZdN63j9fS for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 05:22:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F75280EAF
 for <buildroot@busybox.net>; Tue, 28 Sep 2021 05:22:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9ded:7cc8:164a:d8a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 61340780333;
 Tue, 28 Sep 2021 07:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632806531;
 bh=GPaY+/Zjk2frHgjrXJXQKWmLaGuDsS+zuhhWX4HG5C0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zwa81bkWdcdxaEjjAsIhyhbXP6B18pGpwfmR8CVW7WDJIuEkb0UoNoAWFoc7MYTv6
 L3lh8hl1xWCe3NrHI88FW4ytyfy7i1/YzfkSbeRG8lliXrhDjUr2uyDWRtuEYbU93x
 klFyraFX5ky3WEX3SC8UlzAzH0Zl45BRQrJEjie1j+lzp3Zzg/Lu9lPIYWluJVktTT
 Lt6HvUVXFZ036oNAfeFavf2WBncbVleEEl8w+U6MdBPjwGMSl4P301gBseDaGTDzas
 PlmfT2okFRcZtmiZ2jKQhGRwfoaQC+OP2CSxqkwyppkFBce2hi72iWyXrvSzJ0PJlj
 6b3lRC+sYBEUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Sep 2021 07:21:56 +0200
Date: Tue, 28 Sep 2021 07:21:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <20210928052156.GG1504958@scaer>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
 <CACPK8XeWmhxOoXT0XUHkjgygnvvA0Rr0bMRCR-2UVPDz3gEKcg@mail.gmail.com>
 <71621598266144b34d011dd8e24605ced76b9afb.camel@ozlabs.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71621598266144b34d011dd8e24605ced76b9afb.camel@ozlabs.org>
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

On 2021-09-28 10:34 +0800, Jeremy Kerr spake thusly:
> > It looks like the list-id changed again over the weekend.
> OK, thanks for the ping!
> > It is now:
> >  buildroot.buildroot.org
> Buildroot folks: is this an intentional & permanent change? Do you want
> patchwork updated for this new ID?

Yes, we had an explicit change in the mailman configuration (actually,
a fix), but the unfortunate side effect of that fix was to change the
List-ID. We believe this is the last change, and we are not planning
anymore in the ofreseable future.

So, yes, could you update Patchwork, please?

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
