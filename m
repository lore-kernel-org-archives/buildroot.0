Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB17C4167B
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 07:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A04360EA7;
	Fri,  2 Dec 2022 07:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A04360EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h__hvq8vuEw2; Fri,  2 Dec 2022 07:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 966C160EA0;
	Fri,  2 Dec 2022 07:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 966C160EA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 654961BF836
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 07:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB4F419B1
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 07:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB4F419B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJ_nekzbl2Lh for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 07:55:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31328419B0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31328419B0
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 07:55:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so7585417pjh.2
 for <buildroot@buildroot.org>; Thu, 01 Dec 2022 23:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qGm76b/3bkEEUrr/QekomDjLtJLPj83MJGGYRp2dX8U=;
 b=aUvT5b2XIcs0fWjCLSVz8xigXjS8bH9oC4YC2JueNbJkNLTlHF/4f7GD+imMakT40S
 SsKUwF13KzECZDeeS+vU4T7isvyE07IWDG6gl6i3mImVqxwezrcMFvVwxDI5M9OS6Ge/
 qN/cTCOoghyM1A+KcLQmaGeHEp0XQ1mBKRQxfhHTrZ+ZoGqwIycqqlKxL+OQnNMFQCQS
 UFIp/X8JhAWjUH1luT/SaoIkEa6fvY4ogR4CZwcX6YgZKc2jk0zS7TIRFMWOKFEEPcTT
 4VFnqEl4+oKr72BVADhP3VwOv/9EzLQcMgw871ZW7TKCnLJwanQmjb0EcQ2lHg8u+pML
 lh1Q==
X-Gm-Message-State: ANoB5pl4AGeeUOoCvq1aacxU7xk+5gOlvI54w0/jArdcXmFNZ0c5183x
 raaCsuMJ7UArUp0GjfSpSMw/Z6OZsnRbLe5RE05PwfpFviFrkQ==
X-Google-Smtp-Source: AA0mqf7aWyXD4IXO6kPatsrgxG5FNZBh1qt+x9i31yFolo/5aN98dTcBMeBK8NfHTeHtBPu5bpyB+cYwuyCDAiE7NOE=
X-Received: by 2002:a17:903:11c9:b0:189:a3b9:d9b with SMTP id
 q9-20020a17090311c900b00189a3b90d9bmr14648235plh.159.1669967706516; Thu, 01
 Dec 2022 23:55:06 -0800 (PST)
MIME-Version: 1.0
References: <6381c264.df0a0220.f5907.df2dSMTPIN_ADDED_MISSING@mx.google.com>
 <CAEyMn7bgj1VgmCNyn89AnepPPvSfOChpA6NQbz8Rw14HAeZVxg@mail.gmail.com>
In-Reply-To: <CAEyMn7bgj1VgmCNyn89AnepPPvSfOChpA6NQbz8Rw14HAeZVxg@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 2 Dec 2022 08:54:49 +0100
Message-ID: <CAEyMn7afOkcPGNp6CYrxXUinWPrAyzbMr0cnCQQ9QGujdh96HQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qGm76b/3bkEEUrr/QekomDjLtJLPj83MJGGYRp2dX8U=;
 b=nlwLRSe2n35wBzTAVB11/eiuxOLfmkCUwRVskedVSRQcUdcXtYXuQi6UC84HpDJY0U
 7NBZ/YJ5UvaKNMrTcAs7448eW0E+k10DByO1zcubpD9r2SouiUq5lq7nsZSZnOMZ3yiU
 IEWrFuJM/sp4RlhT8QaqA2I3rPFw3PAEUy+3dU4PrWX2+jvzbQ/TGUMfggIOzXJ3+QYO
 2uEhlRtySqRiVqhtaskUt+am2TjOAtBWXefVoA7q9p9lmgsbRu2kmDSltvNwhgEMLT+H
 KTimFuO6C89V5YdhYHaDt4AERPVmm6Fuf/ylCMGfBMI/UKLbX8wJ1Utu0+pcQvQ4heNF
 Xznw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nlwLRSe2
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-25
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

Am Sa., 26. Nov. 2022 um 10:14 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> Hi James,
>
>
>
> Am Sa., 26. Nov. 2022 um 08:38 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> >
> > Hello,
> >
> > Autobuilder failures
> > ====================
> >
> > Below is a list of build failures reported by the Buildroot autobuilders
> > in relation to packages or CPU architectures you are in charge of.
> > Please help us improving the quality of Buildroot by investigating those
> > build failures and sending patches to fix them.
> >
> > Results for the 'master' branch
> > -------------------------------
> >
> > Build failures related to your packages:
> >
> >     arch     |             reason             |                                       url
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >    mips64    |       libnetconf2-2.1.11       | http://autobuild.buildroot.net/results/1fcfb9929b07a6b89d85dbfa4c7f2cfeb4b3ae1b
> > powerpc64le  |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/8dff570499024da0f9d0c922619c8f07462633ec
> >    mipsel    |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/31214bf6399e7f1bbafc96fd7055ca4629c4021f
> >    s390x     |         linuxptp-3.1.1         | http://autobuild.buildroot.net/results/30e18e048fe426ec6a1522875cf37fb224b56bbf
> >
>
> The autobuild failures appear since some time. I now tried to
> reproduce it on my machine but I'm not able to do so. I see that it
> probably only happens on the autobuild machines of yours.
>
> What I know so far is that there is a script [1] that looks for the
> supported timestamp for PTP in the kernel sources. With that a define
> is set -DHAVE_ONESTEP_P2P. But then when compiling the sources the
> definition is not found.
>
> [1] https://github.com/richardcochran/linuxptp/blob/master/incdefs.sh


I just checked again the output of a autobuild failure and see that
the include path -I is not set on the builds that are running on your
machines. I do not know why this is the case. Are you willing to do
some tests to figure out what is going on?

[1] https://github.com/richardcochran/linuxptp/blob/master/incdefs.sh#L79

-- 
Heiko

> --
> Heiko
>
> > Thanks for your contribution to Buildroot!
> >
> > --
> > http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
