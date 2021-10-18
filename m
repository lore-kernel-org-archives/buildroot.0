Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7684C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 22:23:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539D060F57
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 22:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 539D060F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D908A40492;
	Mon, 18 Oct 2021 22:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIkLP78t0lVO; Mon, 18 Oct 2021 22:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A32D4049B;
	Mon, 18 Oct 2021 22:23:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBFF31BF39C
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 22:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3E8D40155
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 22:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zX51qfd9_agV for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 22:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 157854012B
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 22:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634595776;
 bh=OftHErMyx/D/XWiw30/VLfH460zh7Zcc6qnErbpNTm4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=N2PP1YiWHf3iQA5ML8aXdDGvu+CKXrbN9TZ/xMeZQ5hsuBGlOLyactcOTa0AIPIqF
 RiLh5PcU7E+XBdbC61hW1f6PMB80RNbilqS0VoS+N52em/nILhv1BL0BPlmccEu30Z
 MiB8c+wYEirX4Jt+andozHefcnFQ75qR5MmjUugk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.59]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Ra-1mnLVA1SdU-016O6d; Tue, 19
 Oct 2021 00:22:56 +0200
Date: Tue, 19 Oct 2021 00:22:55 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
Message-ID: <20211019002255.165e5e00@gmx.net>
In-Reply-To: <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
 <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:wTp3n2YIX4vL0hVdk3s8S/3KoSfQBaLM3Qh2AK8oofpLTOZvpgs
 aFrc3A/rJHvDHpWkZzsuxQo+2NxW6DFx/zCzNBEFlofqvzssTNmpOb/jzemiXISWMOCeSm1
 EnCgDye9XtvT4euTKPwiqBqU0F/elyI4m8gTqx/vkioVUEDwEqNSIVD4u0o9mlaaQYwHOWL
 /l4fnov5owkDGwSW95P2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FFasf1x9oQ8=:Ur2equajKI3WP3zcu3foFY
 7JhTWVmehOGEgUYeE+HgZ3aILqbY4AIkpUoUUJeGak7oLw2pLQp8xBD9XjLp18sXsh4veuMWT
 tNu+U+bxwdam9Uz7y6aa2Wn6e6cxro7FdopnfqMsmoEuaG0UGekuf8kz+e0UomM9SUrgUq1Y6
 kCBon/vPh4K4NEyskHd3AWi4K38ZDK81n4Kh4ahd3tJKaZv0R9G3k+Wqo8gO3iVRmfie4gKt3
 Er9R71DfCvKnEESaONv2F7Q/rM//Tp6piynV2TszngjTvvdSgFJUdP7iolV3k120UC59VC6X0
 Z9Th/6tiDADXFYnD7YTlGunGsodW6bpXFfQiySXWfbpODjGnKbf/+/z5byPx6ZuPdVzdULJVW
 tB0g0wQrdLEY+xCqxZ+DfCJPXe7fBR5RZ+rR8WFsD1KITkwrVOcazz+42TkHTEuUsXHbYWFox
 rtGU/BDM6ta8EZW8aUkZ7W10PnLnm4hw+ldGecyyVDv3x78i5BzRNgtwl/n1JMKcOpQkTWys8
 pkrcw7UdSbXY0kUq82xeJAyajpmlrPy6aIBPHAQ8hAQXipHBmPllbQlTWdAvw3+9ksTbmkSxn
 NWHhvuuiAhy10tD2FPkkcWnEwvZj4JnErTQkp0WmpM9GnwjXOx9AD4PDLfVz0gGmMiw7C7lfr
 AeiRxu3ELDWu0Ac/ckugL+2Ab3Zu7nwMq6C5/o+25nXptJ7xRHbihKha+hAMlyrKTA4tPy+9b
 tyPz4accFdrZc+hpAP6PLzOfYYVIl3bsji3iNkUEsTzIdc3kU1WGcRQnTDKlkXvbZRRJAdwBU
 EEl2SZ3N+RhgNxFqEDhz6RUDAF0uLnrYmdDKB3uXAhD0orJx9dLncy3KjtY7E+/oLep0UxsyY
 Exk5U7skkwxlPz2tpFv6OcA1A1nA1ZzIlLYuzlud0IkebgzlgoQsSIgWMLqSsx3xJ3Tks5UOT
 rmYlVY4NusT1zz2D/olj6lG4FvZVH/PQ8xYJRmHY973W1BbTK7eFvL0Vtd794pIOMVBUDaFk7
 1NG8yqwkgSZkKbOA7d9y8hkkUyd/SMc4x/E5HKS+2/eE8RuB3MiJRr/D2NprmU+qCYXlmSd8l
 VaEkVoThypDAmk=
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Mon, 11 Oct 2021 17:29:19 +0000, "Walter, Stefan" <stefan.walter@iml.fraunhofer.de> wrote:

> Hi,
>
> > > Maybe try to 'bisect' the problem as you mentioned it worked before
> > > 2021.02.1 (did you test 2021.02.0?), not much grub related patches in
> > > between...
> >
> > Buildroot 2021.02(.0) does boot, the following releases on the 2021.02.x
> > branch don't. I just tested 2021.08 with the same configuration file, and it
> > doesn't boot, either.
> >
> > I haven't actually bisected, yet, but looking at the commit log, ...
> >
> > >   e840f2d469 boot/grub2: Backport 2021/03/02 securify fixes
> >
> > ...this looks like the most likely culprit, because it's the only commit to
> > boot/grub2 I see that makes any changes to the GRUB sources between
> > 2021.02 and 2021.02.1.
>
> I can now confirm that this is the commit that introduced the problem. What baffles me is that you say you have a working configuration using GRUB and i386. Could you send it to me or try mine for comparison?

Can you try instead of your original

/path/to/buildroot-sdk/host/bin/grub-mkimage \
	--config=grub_early.cfg \
	--directory=/path/to/buildroot-sdk/host/lib/grub/i386-pc \
	-o ./genimage_input_tmp/grub_core.img \
	--format=i386-pc \
	--prefix==/boot/grub \
	biosdisk part_msdos ext2 normal linux configfile

the following one (makes the difference here for me with the qemu test):

/path/to/buildroot-sdk/host/bin/grub-mkimage \
	--config=grub_early.cfg \
	--directory=/path/to/buildroot-sdk/build/grub2-2.04/build-i386-pc/grub-core \
	-o ./genimage_input_tmp/grub_core.img \
	--format=i386-pc \
	--prefix==/boot/grub \
	biosdisk part_msdos ext2 normal linux configfile

Note the --directory change from the '.../host/lib/grub/i386-pc' (installed) directory to
'.../build/grub2-2.04/build-i386-pc/grub-core' build directory (as the original buildroot
grub2 install step uses to create images/grub.img...

Suspect the host/lib/grub/i386-pc provided modules are from the build/host-grub2-2.04 build
(instead of the build/grub2-2.04 for the target) and therefore without the '-Os' fix
(or they are mangled during the install step)...

Regards,
Peter

>
> Best regards,
> Stefan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
