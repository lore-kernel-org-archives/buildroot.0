Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55022C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:12:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CF8E60551
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CF8E60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD323404E3;
	Wed,  3 Nov 2021 20:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7tDc63Rxvx1; Wed,  3 Nov 2021 20:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BE5404E4;
	Wed,  3 Nov 2021 20:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6D291BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C31D28100B
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9M3dzVpvpibT for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:12:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6125C80FBC
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635970323;
 bh=dK7WZ4CpW+cHzR9y/Mb51KqP7xkdj2G3AXewQaq+740=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=fCMkiSsqniSZdoSnKu0eh7KFSDcWWLSW13TLyXDUUe6bCcBuLB6hNvtlPuoabMyAa
 wxS4SEXtlG5EerCmjyiCDM/stgC6j7mle+g/oKUlVw0UkTzOVy0WmES85nAfLE3Vip
 xld2WcL5JtMEV3brzXWEzRy8YUq8UQnHrY9jp1ns=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1mgTrJ2Iz0-0182mc; Wed, 03
 Nov 2021 21:12:03 +0100
Date: Wed, 3 Nov 2021 21:12:02 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211103211202.539dba74@gmx.net>
In-Reply-To: <CADvTj4rCzGkrFuPj67Xu9s7A3FNeyBpBEBQKiULQaLF4GYnEKg@mail.gmail.com>
References: <20211029065957.3084528-1-james.hilliard1@gmail.com>
 <20211103204805.1facb4a9@gmx.net>
 <CADvTj4rCzGkrFuPj67Xu9s7A3FNeyBpBEBQKiULQaLF4GYnEKg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Vq/fWwk2o2HITF64G/lNfYcXeXPuEWPHG/nzLCvpTyu+bwEVGwH
 aBqp+GAb8TMlNjD5iCLrQKKOglTMd/kSYJuiI/T6Od1Cf6Q9Gdn/sgL2ME2os3ngLrRmwcT
 nC+fV6lD0PT1q0KLmNTCfcYcoRrQ67e73V40jGWFGASgLMdvucSXkyOQAds02nMoyBQjjTa
 2EUuqxyryUUIKi2nJOn9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PFcPxJNZ954=:pQBqgXAG/w2NDWkvzxtCVV
 vI2mwl9m+Tui5FH9rtiZUPkrNasZxCHxy9W3HgrltKhjMRaBId9o1WSpfLDno+AYme6N0FA74
 /+xDIEmu3rfAudrUDdvO+Vn/rdkDutBCNX0OUYaIVRF0RJ0Gd4bpJY+mSzH4go0kL56jCr2Ii
 SPlW+s+pVq8TDjJ0TprG/C+WfNoVlSUdzJI2vwiSsfnWdNo2Qsgqu+YWl3xgOv5EDhEygetGW
 dW/v90+S0n5jVEr+Re8TuSpvqZZ8ewhLxoBVhQCXL5+ljXTHyTlRj8QuWCcqGwX2zMdI0+dyi
 L3pjVLftOrkMo+bvsQrIRySo/MU0yKmbtj5ToGJ4wjAG06LGhk63UoTN8LZvmmsgn+VG+rcar
 IyCH3/UJMnr6rwhArK55Xuy7EoXtcfCvpt5O6+2uGWfFtqYSS+Zfgg66kogXZEyxxhjQxMccR
 hTv1l6J6ZYbTBSZRdiqxvLWDLnXBN4l/qXBUVQOYVkeuDm21q0SElM+LHJ+b4Gi5UGbkS+ZsU
 1mCU6xUIx7ezlbvQFX9XqFhZbmGzE94+rQ42ZT1nWQj0jDatVpYBgntfXz7NILbnbZPzrM2CN
 nP7sErO1/3+ynWIGDxX6XfL3MZXjzLA2b1en1RDpr1rNPb98/pYwzexDLG24ipqrBfEiAwEDn
 GOsN6LlbL3TV+CNmOLXCVMzXebDSCyqZpp/wMn5phBaeBuuv3+aPAZoq6EL1UatkMlEeOSXrp
 5mW0SN/24BYxFFASWPFbgt8o7ITN2r61Z00xRpnEwkUPpawsNQ2CwE7RJEwoxYOzrqhTP5KMf
 Slv+BGGIi/0f0CnrPpLX6Gd5CoFTvDIHEOCjek/1TPlqdekD8sICgrHfzxT6OlkHdW/QOE4Q8
 VjnF1PuxwQntKnhZyxltvZPrOEtOn4NnbIqJqTvaUFPXg7jvrLC9h/PuH8cQXz/VCJr35mTxZ
 b9YssKO+PAb6/YaLo+yeIIHuR12ADlpFabZT2P9B5oqmB9bbyAWEo9Es0Mzk7a2r5Lsd/Mk3Z
 Kxg/MEG4TVGBDgC1LUi2BOocH1zcQl12yBS4pkCQotJxueKcBG9vNiUWgEZyLwQvwQoA/0OaH
 HD6Tjl1HWVAMrU=
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 host-python3-six host dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed, 3 Nov 2021 13:51:09 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> On Wed, Nov 3, 2021 at 1:48 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello James, Fabrice, *
> >
> > On Fri, 29 Oct 2021 00:59:57 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > This dependency wasn't added during the removal of
> > > python3-cryptography.
> >
> > The conversion/dropping of python3-cryptography was done with commits [1] and [2],
> > and the commit log of [1] states the dropping of the host-python3-six dependency
> > was intentionally:
> >
> >         [...]
> >         While at it, drop host-python3-pip and host-python3-six as these
> >         dependencies are not needed. Indeed, pip was never a dependency of
> >         cryptography and six is not a dependency with python3 and will be
> >         dropped in version 3.4 and
> >         https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9
> >         [...]
> >
> > But the package python-cryptography is still at version 3.3.2 (and clearly depends on six)
> >
> > @Fabrice: version bump pending?
>
> I actually have a patch from a while back bumping the version...but it
> also requires rust
> support and that would probably cause a bit of breakage:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210318044253.3202355-2-james.hilliard1@gmail.com/
>
> So it's probably going to be a while before we can update cryptography
> if I had to guess.

Clear vote for keeping the old version and re-adding the host-python3-six
dependency ;-)

Mind to re-spin your patch with some explanation?

Regards,
Peter

>
> >
> > @James: with a bit of explanation added to the commit log you can add my
> >
> > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> >
> > But although fine with an version bump of the package ;-)
> >
> > Regards,
> > Peter
> >
> > [1] https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
> > [2] https://git.buildroot.net/buildroot/commit/?id=43147827a7b759248288fad1d97130c027c23e9a
> >
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/python-cryptography/python-cryptography.mk | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> > > index e21b9db042..081dfc06a0 100644
> > > --- a/package/python-cryptography/python-cryptography.mk
> > > +++ b/package/python-cryptography/python-cryptography.mk
> > > @@ -14,7 +14,10 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
> > >  PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
> > >  PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
> > >  HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> > > -HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
> > > +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
> > > +     host-python3-cffi \
> > > +     host-python3-six \
> > > +     host-openssl
> > >
> > >  $(eval $(python-package))
> > >  $(eval $(host-python-package))
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
