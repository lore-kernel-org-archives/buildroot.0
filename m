Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83A3C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D7360F6C;
	Thu, 11 Aug 2022 20:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56D7360F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVTZJVZwkrNR; Thu, 11 Aug 2022 20:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6717D60E40;
	Thu, 11 Aug 2022 20:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6717D60E40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 629E11BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A96F60E40
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A96F60E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8QvIaES9L3l for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:44:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3986260A8D
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3986260A8D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:44:22 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-10ea30a098bso22849711fac.8
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 13:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Rmb7otKJPkmQNCqtw41p88dyh0lzv2+id/FgNHZuozM=;
 b=bcjQ5BApIl4dsMTQesfCgA4t5CPwyEQp88wJs8cys1FBYzACteAHN2bFgGyVwxXkeT
 D9ceEBCUWHV6X3O51Ttzc8Plg7SH3O1hbWjpaOUp7O3XgYSrA9ItmCjQJzvf3RZNYxKo
 vJYZJReNd1JZ7Nn2P0Oojyc2iza4mW+6x79DXtwzwd4CSwbYWZP7AzytGBK/tWETIvUB
 veg0P2sJ0XI2MYlzOcFSxABV+jbYUZooJuISJ3QLntqZglFMjJiiAxF+UdsiOaTJr2bm
 TeDSd/FdnzxCaoNBLXl0dh/tyxbC5UqJFDf9QJjEaXbuH3UaG+MAw5VTxG420wHaSrfP
 q8XQ==
X-Gm-Message-State: ACgBeo1+ILMN3pU2mtEdi9bvKpDwPkUeG1rtacyBfFK6jPF/v9UARp9p
 77O3dcsDyHpqOcFbMHy1GBS+oVDxvBAgeo8CD2w=
X-Google-Smtp-Source: AA6agR4qQ38LrXwtKtut1TlSXOD4bZYxbVV7+OvB1sHZIOrU20uiNr/wS/PhSrtMct4uL9b3LzEjCPl6XEeG+1IcggM=
X-Received: by 2002:a05:6870:f20c:b0:10e:e5e3:dac2 with SMTP id
 t12-20020a056870f20c00b0010ee5e3dac2mr311419oao.228.1660250661243; Thu, 11
 Aug 2022 13:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf> <20220811223756.59668ba8@windsurf>
In-Reply-To: <20220811223756.59668ba8@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Aug 2022 22:44:10 +0200
Message-ID: <CAPi7W826Gh_tXxxF_KS1EHyZ1JDQ7RGr8GbD4Ygo-YFquriQgw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Rmb7otKJPkmQNCqtw41p88dyh0lzv2+id/FgNHZuozM=;
 b=DGfv2rWztVkf9Ra1zFK/s5LP3NRtW6MOmhWGFtljnJ9BpXJOzn6uFTyQie5J2qtzwx
 8mxcDBpSSHAtOH0o0IKwTN5/RrLEnUM2lkiEb4r+TsjoDA4uw9mbXPyCcP36DSvF7YKa
 fmu2Jhn72QVKqdsEkUD9t7EQR3A0drCjrRNHFG87dTdziK9MI4VEyWUbV7ABG2ri8Tpi
 NfWABumiIBDCSN7VCkCY6sYl/vbnjTWxgjD4VVYzS6U8yRMW62fE/f+PLExkkM7YImXA
 meBwi8xTNnsNbPl3Ka/mzrm5DNSpRYhIGXXp7INUUTZu4HG8Axwre0QIB/A8c0Q3iEcU
 qA9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DGfv2rWz
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: nolange79@gmail.com,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1266123330632096641=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1266123330632096641==
Content-Type: multipart/alternative; boundary="000000000000e6d7bf05e5fd3a69"

--000000000000e6d7bf05e5fd3a69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le jeu. 11 ao=C3=BBt 2022 =C3=A0 22:37, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> Hello,
>
> On Mon, 1 Aug 2022 18:54:44 +0200
> Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
>
> > I am afraid this is causing some other problems:
> >
> >
> http://autobuild.buildroot.net/results/c6f/c6fa72802a3d74fe95720eeff83651=
4a5863b3f2/build-end.log
> >
> > configure: warning: runstatedir=3D/run: invalid host type
> > loading site script /dev/null
> > creating cache ./config.cache
> > configure: error: can only configure for one host and one target at a
> time
> >
> > So I believe we will have to revert this patch, and pass --runstatedir
> > individually to those packages that understand this option.
>
> Another package exhibiting the same issue:
>
>
> http://autobuild.buildroot.net/results/391/391871b766ba0c1aeef8ff2d4daad8=
f4204f86ad/build-end.log
>

Indeed, I tried to run autoreconf on thttpd but it raises another build
failure.


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000e6d7bf05e5fd3a69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 11 ao=C3=BBt 2022 =
=C3=A0=C2=A022:37, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Mon, 1 Aug 2022 18:54:44 +0200<br>
Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.or=
g" target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; I am afraid this is causing some other problems:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/results/c6f/c6fa=
72802a3d74fe95720eeff836514a5863b3f2/build-end.log" rel=3D"noreferrer" targ=
et=3D"_blank">http://autobuild.buildroot.net/results/c6f/c6fa72802a3d74fe95=
720eeff836514a5863b3f2/build-end.log</a><br>
&gt; <br>
&gt; configure: warning: runstatedir=3D/run: invalid host type<br>
&gt; loading site script /dev/null<br>
&gt; creating cache ./config.cache<br>
&gt; configure: error: can only configure for one host and one target at a =
time<br>
&gt; <br>
&gt; So I believe we will have to revert this patch, and pass --runstatedir=
<br>
&gt; individually to those packages that understand this option.<br>
<br>
Another package exhibiting the same issue:<br>
<br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/results/391/391871b766ba0c=
1aeef8ff2d4daad8f4204f86ad/build-end.log" rel=3D"noreferrer" target=3D"_bla=
nk">http://autobuild.buildroot.net/results/391/391871b766ba0c1aeef8ff2d4daa=
d8f4204f86ad/build-end.log</a><br></blockquote><div><br></div><div>Indeed, =
I tried to run autoreconf on thttpd but it raises another build failure.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice<br></div></div></div>

--000000000000e6d7bf05e5fd3a69--

--===============1266123330632096641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1266123330632096641==--
