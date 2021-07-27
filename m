Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90970C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:43:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487DB60F9D
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 487DB60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 086FD40146;
	Tue, 27 Jul 2021 20:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68GrYGE2Siw4; Tue, 27 Jul 2021 20:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51B734013A;
	Tue, 27 Jul 2021 20:43:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAB561BF860
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6A3D6069E
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbKkTXz6Byws for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 20:43:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0E196065C
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 20:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627418621;
 bh=TfmznLr33OjKXALR9O77fLvZBuoJALpivyzoHr4KtIw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hNuMdHyAUm09xjqcpnL/i1NiRnNYwQmw57z1T8nA52Pbkz+OzL+IgN1b/IT23NLSZ
 kIMg5wSsYyRjs/pUhJ/AwU4hMtpgtsex8t7gHbddEW6VpNParPD6hIrkiPyucsmz6O
 wIN4VqJHAwEWYTLsdvLwDSAFPl7fkgrby/6Bubbc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.64]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1mo9Oc1Nwt-00fidn; Tue, 27
 Jul 2021 22:43:41 +0200
Date: Tue, 27 Jul 2021 22:43:40 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210727224340.0dbaffd6@gmx.net>
In-Reply-To: <20210724094931.3e30dfeb@windsurf>
References: <20210608194926.14477-1-ps.report@gmx.net>
 <20210608194926.14477-2-ps.report@gmx.net>
 <6e5aae0a-b4a0-edba-f817-ca6eabb05b64@mind.be>
 <20210724094931.3e30dfeb@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:/sp3qWxxN/oF1rzwX/CK9lJl5dfstQisnnCSh/92AG2wqJXW4Xj
 Rnz+8X2b1lfjIsrIfYp6q3vW3zTg7xn9IFR3f42uOn/dKOC8AcBUOqp2kN7GKQ6yn5V3crP
 DybQOL0zC1DkorVGMa/37O9ICuFCP8A0iG6R4feeFEpq6EWwEfcRKzF+0ewWMefum8c5eJ9
 qtpDjYItLA+zSfRY0kfEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nwCVMgEv7s8=:zbaVVIB2DOtlrHZcWkNary
 Cvig7yCZmAzJxVXhenEDuWGgRmlxa1P8WUtoxmdLLr5Ha7xlZpHOflIrvphiwt30qPtt1fktA
 ju3inRA9WUf6JSbsjMnxDYBZk2lY0LHQtsQt7Y5p/qVsJJxdkX9r6fBQMutHVJbuZYOzvoBlG
 ETW+JZMyUNHdVgjA3m+Ji8Z8OvNRgRipB9bDrV1gzKem6mlG6gXTbYO/OK7EWrkI/FYNvu75S
 rMC03LwjmF9VjOQy6/GoUgLf9hGnkwH4SSWraAjP4n4LS5y6XnAzA/5JV64NZmaZdWGSyX+9F
 IQjnIj2Cr00oW5G5NTbU8xG88R48B+rFLs95P2xr89qqegWXh0v7XfmA1TFDUHB8SXXStvc+Z
 DQb/hDULU/Gb2EGTHFJLKQkH/M7XRnZAwM6lEtCN1pd0XI87Vp/wn99DJTOJIdRdg0crlMCp5
 0iNjwbNIfubs6HexnzPgBRuH8kqfLndGQU1xpz2iu3v2fBekDqQNKst3SEWXp8KqvLwO6HeO0
 JKIU7tPGMdvB/U476kit87onx2r7cIoZTMRUCNPRwNgqs9vmuftKvf/rwQg0J1Ybf8QV+xS80
 jfKwyyMHtymOw/Jv7zyqwSCrfDpQAhJuU0EouQvgT5gPThGtNqJH6KuJf8cZbSANd0UBAMOQE
 N416suphnDKdUHMrxFT1L/3JpMGHuIGZosNFgnh8PsLfZ10OiuiWb7bz2FGkXC2sbezVFn0aN
 4INHXT/3tnVbfAj3ap/iFXWkTJyE2yZYqVDLgV1GUbuQbrYj8b5dEWS+Lq0OTdHwaT2rRonQv
 MaIu6HH3SCU2WD/SBJ4+e8FM0yEeNh0B4lY4zO5LYMHy4Iu0viouwSRroHDfTclCnb37H73b7
 u2bIjv/uIIlB9VYqtU22ntBn1mG+qRK5jw4LXYdpig7yytA3Zu+yKTtxk66440X7i4d5isGzE
 UTeA/CSBop5dSj2+oG8BRnQv4GO0MuN8Pt8mVryRdRnuqzKzofrZV72MfQmbP6nRqyvxV172a
 pHhTi0PvsoW8oLyAg5VQwB4IjEGMAKAuUpfsHYp6Azzh7PL4Hbd74dN+qfqo+ty1BB7OEqq1U
 mXgkIkDRCelwMFEsPG17somOu+vQulirJAd
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libinput: bump version to
 1.18.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Arnout, Thomas,

On Sat, 24 Jul 2021 09:49:31 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu, 22 Jul 2021 23:18:56 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> > On 08/06/2021 21:49, Peter Seiderer wrote:
> > > For details see [1].
> > >
> > > [1] https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html
> > >
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >
> >  Why is this bump in two separate patches? If it's because 1.17.3 should be
> > applied to the 2021.05 branch, then it's better to make two distinct patches,
> > one for master that bumps directly to 1.18.0, and another for stable that is
> > marked explicitly as such with --subject-prefix.

Yes, this was the intention of the split..., will mark it more explicitly next
time...

>
> Gah sorry, I'm only seeing this now after having applied the patches.
> Peter also did the same (bump in several steps) libxmlrpc, so I was not
> too concerned about this. Though I agree that your question makes sense.

For libxmlrpc the same applies for the first patch..., the other two where
split because they where tagged with code/stable and code/advanced, was not
sure about the whole/complete bump but did  not find a downside for the
code/advanced one...

Regards,
Peter

>
> Best regards,
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
