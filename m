Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C7BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC77610A4
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FC77610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 524BA82591;
	Fri, 22 Oct 2021 19:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T78hDs1O7KoD; Fri, 22 Oct 2021 19:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A14608257D;
	Fri, 22 Oct 2021 19:29:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3E51BF40D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C58C4085D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCC3vL95DCiO for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 19:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED56F40835
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634930977;
 bh=XB/UeroPjH9ktGYLSvPct9plSm7nmzJlPMnKhjgmjrE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UvYuLxdTDqtYPI3eDikJLqCGrmHaTnFBVIG9Q4t1DrBMY/E5ylOc0CAEimPcgLCH9
 2Tt/jsuCfng6c5PXlCzHZ/KuKsLuWPtPb4V92k+Kg9lOWBx6QB6/NLxzRpd4KczaAX
 +fKmFaea8neOs70d4ErPaD95vx4P4mBDTXHJRZqE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1mHESQ1g2t-00Mv3X; Fri, 22
 Oct 2021 21:29:37 +0200
Date: Fri, 22 Oct 2021 21:29:36 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211022212936.2e73a96a@gmx.net>
In-Reply-To: <20211022212542.157f12ce@gmx.net>
References: <20211014220011.17230-1-ps.report@gmx.net>
 <20211014220011.17230-3-ps.report@gmx.net>
 <87a6j06h4e.fsf@dell.be.48ers.dk> <20211022212542.157f12ce@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:cKzLkKxjSqfaSBMgkC+b7TpS+2tAQOFRshS2ya6UXRWzdd5SGLx
 J4GY5xXpX3s7Ke2BB3y57zqy5La2jTi9D49PEs+8Sp1+Mk9kdod4ZlBjuKrw2Lx0e9tzI/V
 Jsdyy/YbEIduHrM0IkdmuDNdJyMtkO2Lc/zNXnRYJ0eM6+K8jVdCC4BVmOEHIUuvB+KgJcc
 SW+7ZDpHiUGqxvIpxymHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aJ1tLKOOGDA=:Kk3+l6WYweoiCTzGlcto+l
 okqAVcvxDiNVga+IXfsf9ZSFtJbasC+BnoPVigBQIvZdV4GBhYukr+hMp7eMfIcP6nBdNLQAz
 upFTCl1IR9dDahEu37bFx9g7nHPo1+3lVJbPSXORe1YGV/r+TWhiwd3AbIyvxCm1iGIywbFFE
 XY1lG2iTxHcUfL/FGe0lNV7v049X1gFK6kyhbzbY7Cc319AJgYqwM1DfNtr92rrPDUuXbxwM5
 IRnblfEiQofS+P51UogBvM7y8RyN+9w6H6ciC6TDwG5fHXQUZ7pxhnTzU6Ea1eJK/wNlVTsr5
 iR2sN+10ohD3lGBhe/5UTSIhT++AnDn5KwH4LW3V93K3P4ChBcXBpdSNkfbdYZ3YiRx5DDLUe
 b8LX7zuMjkqGZ0N4blsQqhNxQjwm1as9ED3XHjpwC5DEZEj/dJUocMk0kgJZOglg6VA3lzJa7
 9CshKm5c2O8nBDEUrL34EZOjGX0mkOXJZBVL2rqMSzK1ECLCreOZ3JrGVlWXqtMUQ+bUVsddv
 k1hCOvS7ZtxGB0IFIGV0amqmJ4A9Z5wCBQchSjvvnQ6CwvLcP6BmOc3WmNiYZbDi6FwjbUo0Y
 Dr8Yf+tM2lKji+BCLAMfcfjze2IJw1850y9Z7ilNAII7dOAwi+mON/cTwOn4fF/VuVf9O067/
 9neX3mgZheDyAUV1O5sz7a+0KX8Asem5rwyyGvyxBre83lOLGD06XpSdyZgvp3wVFsQq79FfS
 zdmybR9UjLfpFGv+VDS1TcUGz4T8p9XFEtz+0ZfI5F+hNeLAEUH2f90hF5nA9LAULo2tYz7fi
 7KwgFdYIEmelvrAvW2JloI0RFALIPiFlcXWLVhbhkNi1OIBKZZQYbE2cm4S6FEJdBP9IbBajf
 EnLkikmwIxdCMPDDeU7He985LcMuIgmKeSwgxcRuTcOEx0U7pcGzvMBH94UcJV4XMNmhgdMgt
 uXz3UwwtnxOPQiKDJpL/yn8ZwuZfuucmYNscvFA1lc5sIqpSU9piRmhy98wP2aLuMpjN6mu53
 yS/O+yPWL3KCpHEapQgijtycHnoXdroV5bdOUtXeoyo8vsjwvXx3/ujQEg8zbz5x5zAMeJ9qf
 z3j1Z23oUhTtnE=
Subject: Re: [Buildroot] [PATCH v1 3/3] package/nftables: disable debug build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Fri, 22 Oct 2021 21:25:42 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Peter,
>
> On Fri, 22 Oct 2021 20:37:05 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> > >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> >
> >  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >  > ---
> >  >  package/nftables/nftables.mk | 2 +-
> >  >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  > diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> >  > index 6a27975a53..2409eb0571 100644
> >  > --- a/package/nftables/nftables.mk
> >  > +++ b/package/nftables/nftables.mk
> >  > @@ -10,7 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
> >  >  NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> >  >  NFTABLES_LICENSE = GPL-2.0
> >  >  NFTABLES_LICENSE_FILES = COPYING
> >  > -NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
> >  > +NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc
> >
> > Is this only for v1.0.0 or something that should be backported to the
> > stable branches? You have put this after the bump of nftables in
> > the series, but have not explicitly stated anything about it.
> >
>
> Sorry for being short in the commit log..., the '-disable-debug' option
> just disables the compiler debug option ('-g -DDEBUG') and exits already
> in version nftables-0.9.3 (the earliest one in my download directory)...
>

And take a look at the improved commit log (by Yann) [1] for details...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=5dfe70377006b5b1031879ce69644c767049bd31

> No urgent need for backport ;-)
>
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
