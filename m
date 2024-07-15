Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C179C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 21:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 018FE60831;
	Mon, 15 Jul 2024 21:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVLiF1jFKGL9; Mon, 15 Jul 2024 21:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED756605E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED756605E0;
	Mon, 15 Jul 2024 21:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AED5C1BF398
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BA64401DE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 21:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPY9SDjxVn-p for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 21:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:598:128:8a00::1000:a54; helo=mxd-1-a54.seznam.cz;
 envelope-from=havran.jan@email.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A3F14019F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3F14019F
Received: from mxd-1-a54.seznam.cz (mxd-1-a54.seznam.cz
 [IPv6:2a02:598:128:8a00::1000:a54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A3F14019F
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 21:13:42 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-989f5b47-nqqg5
 (smtpc-mxd-989f5b47-nqqg5 [2a02:598:128:8a00::1000:a54])
 id 57700d17d797678a55043379; Mon, 15 Jul 2024 23:13:39 +0200 (CEST)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by smtpd-relay-74976dd645-vjcdv (szn-email-smtpd/2.0.19) with ESMTPA
 id 3f85fc2c-e949-4028-9f05-2a6aa857f3db;
 Mon, 15 Jul 2024 23:13:37 +0200
Date: Mon, 15 Jul 2024 23:13:31 +0200
From: Jan Havran <havran.jan@email.cz>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZpWQ--EXTvJfqAOv@arch-zen.localdomain>
References: <Zm70YkR_roWwY-ms@arch-zen.localdomain>
 <20240711212450.03598fa8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711212450.03598fa8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn20221014; t=1721078019;
 bh=KcJgqig/stn25StLEpJe3ZZwNeEbdEbpGxQrmHNl5wg=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To;
 b=BBpaQr0DwMVChbmVPqz+9OKDzCJbX3nvfsiZkbTNXN0qowvDKLjJiozLqSbKzu61Z
 bqFUephGDO7XOxgh2izNjI10THBBH9KjuXlQA7pEUP3XmEnOF91KiV21ilDQV6s3qt
 Dymsj9rYJ9ruhF5Rc2vJ1fXJuzQUKFxD3rRXPLGYTe+nzmJ9CeBd6aAZCF/FFQ9K1M
 wa/6ZBP+Fk9O0XpdnrTy8YBaJfGvrSN+eJ7nudjmG31+iHx0Mwe/Xy8SMr8UKFkNii
 QAeLPcoAZ67TKUBKmiU43WqRLcRiT7lI9WKWQcmF8hpi1OChwT1kqWspODQCd7sk+8
 gd0BT/kFTQgDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=email.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn20221014 header.b=BBpaQr0D
Subject: Re: [Buildroot] [PATCH 1/1] package/ubus: remove obsolete systemd
 option
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V=A0Thu, Jul 11, 2024 at 09:24:50PM +0200,=A0Thomas Petazzoni napsal(a):
> On Sun, 16 Jun 2024 16:19:14 +0200
> Jan Havran <havran.jan@email.cz> wrote:
> =

> > ENABLE_SYSTEMD option has been removed from ubus by commit:
> > 96ab0b3032f5 ubusd: remove systemd socket activation support
> > =

> > Signed-off-by: Jan Havran <havran.jan@email.cz>
> > ---
> >  package/ubus/ubus.mk | 7 -------
> >  1 file changed, 7 deletions(-)
> =

> I've done a bit more research to see from a Buildroot perspective since
> when this obsolete systemd option has been dropped, and I added the
> conclusion of this investigation in an improved commit message:
> =

>     package/ubus: remove obsolete systemd option
>     =

>     ENABLE_SYSTEMD option has been removed from ubus by upstream commit:
>     =

>       96ab0b3032f5 ubusd: remove systemd socket activation support
>     =

>     From a Buildroot perspective, this means that this systemd socket
>     activation feature no longer exists since Buildroot commit
>     130be80d34905d3e79ff6b8f8fb31b3c3765eb96 ("ubus: bump version"), as we
>     bumped ubus from 259450f414d8c9ee41896e8e6d6bc57ec00e2b63 to
>     34c6e818e431cc53478a0f7c7c1eca07d194d692 in this commit, and the
>     96ab0b3032f5 ("ubusd: remove systemd socket activation support")
>     commit is in this range. It was therefore dropped upstream in 2016,
>     and in Buildroot in 2017.
> =

> Applied with this improved commit message. Thanks!
> =

> Thomas

Oh yes, this message is much better.

Thank you, Thomas!

> -- =

> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
