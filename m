Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D7FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C2A8604D2
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C2A8604D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B654160634;
	Wed,  3 Nov 2021 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_N083aopbs6; Wed,  3 Nov 2021 19:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7AEE6063D;
	Wed,  3 Nov 2021 19:37:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2F3B1BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA0C2401C0
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQJ9bJSW5CrW for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:37:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 122A140146
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635968217;
 bh=uNeiDWzlHxeRzQ/ErHVOYlto4oYrS+9MAzbOsa2l6fA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dW0lbwFXDluzbbD/h1XAtEPSEL4DteYHHhuNezCAIA6i1PRUJ6whw7kiVNQcPL5Zg
 a4JPLcasMxo7jcC8qSJBg/RnG/TdsR35Ilee9zEw2X0BZi9soicgiyUnj3Q5q6ma2k
 ovrIoxO9Lhvono2FS16MrGmAKcUhkfohWmxlNl7c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1mz7Jt2dB7-00GrlA; Wed, 03
 Nov 2021 20:36:56 +0100
Date: Wed, 3 Nov 2021 20:36:55 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211103203655.098da13a@gmx.net>
In-Reply-To: <CADvTj4oZ4LFS7Z-teBPr99gBGnQ5nn0H==YpXpgvsxx8OS1YVg@mail.gmail.com>
References: <20211101133359.2228115-1-romain.naour@gmail.com>
 <CADvTj4oZ4LFS7Z-teBPr99gBGnQ5nn0H==YpXpgvsxx8OS1YVg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:MfomQVO7v53YYiL9RbvylscqtxjagEFc4clOD9DjTOONBqtXrQt
 s4R5sl7PWPD+c8ndMXLSoM6OctXWQn2pm8dFmxx9MvUUU0amLBC71KUiny2qoeF3ArNPtP+
 ezycLu6XluRZayjdsd6sXocVQmC6UwT3qRwqsbpTwBBBW58InwLAi5QKWQOUgfrHSVaECwr
 2QynypUaUlZeXdPLK84pQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:39voOA4aD9E=:SkVJezQ6FWRfcOPxdpiruz
 FiV+n7YieSyXAyaLRmn5nldBoPQZZ550DbCIs+pu9c2OZHiEp5JnbEwQrXYlWqDs4HjI0fO/P
 etJP3BrDy78kirBzLS40S8Cli8sAQoT+z7IgQfekL13r4sq/0sMVmtXWxdMsnhFZmqP84ki9m
 vqdydlNyxRWEpiY6KwHuwGJ8bsbyBF140VV8+7jKH8MmrtssDFbakbuw4elWRYZl8tqUDcY0h
 eRzkB+MQjn/DwCMJLxzNSzQmZxIDZIXAR7b+r8mSz9FDLOImogt5s9axT9w6N+6FsSlVAQ9HM
 rJlzig9QuMCA8OvDMJxESsg/1mXQWPqnU4EzysGi7qIUWszZlD2aIwenHjWJfUXOXVhZ7Kmlg
 oLPjl5Y9U1Eu4Bpl8U9O2k4cRF76e3SMjWomsyGjS2nFACRJnjwgZzMy96rFRRJ0n8rlH4HvF
 BICFKzqH9gDgQrkQSN1MMRj+a0IanwM9K/UxUuiFmqN3JgqRsWeYTUIks3ixbP7UgLd4GHSao
 yv/OO4UtpjZNVRgKahdCmjB0u2q8EbvYGvBMyo05LgvgVyLMBqtD6VNjmd9aWDWJ3VkkCpSTJ
 2RKaSlLCSjbfnZ0YzCTc+yHL0SaLI08ILsbEM44TzYS3/t52/CW2BNj5VY9eU/W6nwvn/rR4E
 dEfxXyTK0A5SlHIL4bh47+4m+HB85C4tSu21GfIXZowC3vxYjXRK9uxv3sTQKIi5DBb0TXhtq
 fSac+wgmVxrQuLkIcqQtDrg2IrkjCfocyrz/ddseNDMGaIWCCwNEKEZGC9DR3dRFh2f+Co3ex
 +rNBzlg7VNVsfUoFI0iI2fmC43Ohg+x3lQA9bPqbrjvcyQWyT2twHayhrv0M5HKh0cPoAWR98
 /BngHFUppanjG1sVem/40UptpyMXaKP+4TgxiCMQBtFa/AsA8GahqJyl60sGbOueugT7QpFsF
 c11h0BKpMtPVP0G9FPXYJwQK3qlX+vCrA9Ls0CwP5uaP2T7Y04J1nI1cPU5tZep2Cxz14o+zx
 BnE57rxSaeiqYdAUkagFVjLcXm11h2Ew+w/CXknUcVGrjwRzM1JzvrgVco3OKmpPDnOtSIJ2j
 tCYJAx3P0Dmyx8=
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: add missing
 host-python3-six dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James, Hilliard,

On Mon, 1 Nov 2021 21:20:10 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> On Mon, Nov 1, 2021 at 7:34 AM Romain Naour <romain.naour@gmail.com> wrote:
> >
> > ca-certificates use some python scripts during the build step that
> > requires python-six for host-python3.
> >
> > python3 certdata2pem.py
> > Traceback (most recent call last):
> >   File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
> >     from cryptography import x509
> >   File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
> >     from cryptography.x509 import certificate_transparency
> >   File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
> >     import six
> > ModuleNotFoundError: No module named 'six'
>
> The failure appears to come from a missing cryptography dependency
> so I think my fix in python-cryptography may be better:
> https://patchwork.ozlabs.org/project/buildroot/patch/20211029065957.3084528-1-james.hilliard1@gmail.com/

Accord with James as the backtrace shows the 'import six' from the cryptography
package...

Regards,
Peter

>
> >
> > Fixes:
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417711
> > http://autobuild.buildroot.net/results/d14/d145f997cc6db17a8eab14d9ced8fa35332c4969/build-end.log
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > Cc: Martin Bark <martin@barkynet.com>
> > ---
> >  package/ca-certificates/ca-certificates.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> > index eb75d23f44..e21ac5d907 100644
> > --- a/package/ca-certificates/ca-certificates.mk
> > +++ b/package/ca-certificates/ca-certificates.mk
> > @@ -7,7 +7,7 @@
> >  CA_CERTIFICATES_VERSION = 20211016
> >  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
> >  CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
> > -CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python-cryptography
> > +CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python3-six host-python-cryptography
> >  CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
> >  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
> >
> > --
> > 2.31.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
