Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0481DC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80EAA60B88;
	Wed,  2 Nov 2022 21:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80EAA60B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEyDXEaBZsRR; Wed,  2 Nov 2022 21:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7ED160B3B;
	Wed,  2 Nov 2022 21:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7ED160B3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0750F1BF2FA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D39AE60B3B
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D39AE60B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bv_Jo9XXQCMe for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 21:19:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFEF5607B0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFEF5607B0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 21:19:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ac44:26e4:6f4e:920d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7FEDB2003C6;
 Wed,  2 Nov 2022 22:19:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Nov 2022 22:19:23 +0100
Date: Wed, 2 Nov 2022 22:19:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221102211923.GA3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
 <20221031214739.6b258cb3@windsurf> <875yfzf8gy.fsf@gmail.com>
 <20221102180608.4ac368ae@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102180608.4ac368ae@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667423966;
 bh=Q/LqNm8P71xVJYyosoLCHMRzDxAU7ZBilbR3TT4PeZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WxV3pTcFqq8nWg1/K5zCfJ8/Wnxhi2lt7fwNZE04dkce2CYZHm2jYzURuBPYijLy8
 Kt7aXSjIaoZCCc41GhuXfkfaxXCN5upU0ZXTP6lAk39kuufHhIRjbhvhC6NYba62lg
 jA5YzwJMfGggIen3MpWHjHldzKC920Ft9gtFiBvpYI+1mCWNCTKy6BDF88Z0q1CijQ
 p1tq2/v/xcj4VvAcxn8pfXC0gmDG3CdAjrW/p89a2pQJMplHoH1aVzmMYUgvlLRnwa
 CjYmZvFkFdfPhYHzjV5fKaubRChKV2ZhgtpZw7oYENayNaNWAu/OZZZEfQSqnUHz9F
 AGd1wG5a5AKQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WxV3pTcF
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
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
Cc: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-02 18:06 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Tue, 01 Nov 2022 08:18:53 +0100
> Joachim Wiberg <troglobit@gmail.com> wrote:
> > I tried to be as clear as possible about this, even when I did the
> > release upstream.  Maybe I should have been extra clear somehow?
> All we expect is a short note in the commit log, which clarifies that
> the submitter of the patch has changed the hash of the license file
> after properly checking what the changes in the license files are.
> That's really the complete extent of our expectation :-)

I think you missed the part where Joachim *does* priovide that
information  in his commit log, copied below:

    Changes:
     - New command line options to ssdp-scan
     - Update copyright years (affects LICENSE file hash)

So, our expectations were met! ;-)

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

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
