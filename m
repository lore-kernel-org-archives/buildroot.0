Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02856C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 07:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33CD240286;
	Sun, 19 Mar 2023 07:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33CD240286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id em0PvKIEXQ4A; Sun, 19 Mar 2023 07:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AE8A402E0;
	Sun, 19 Mar 2023 07:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AE8A402E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A644C1BF30E
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 07:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BAE881DFA
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 07:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BAE881DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Npbj85-csjgu for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 07:43:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357E081DF7
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 357E081DF7
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 07:43:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h8so35548539ede.8
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 00:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679211798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ChAf8C6itRQRmHF5HTySHMqAsqHglL1XQ7iZEWD30vI=;
 b=Z5Po56AI7G4vRKVLs5ZgW/SUd5wKrLZuLScHGOQMtdvI1oJTERg5Xi9WosrsgUWouz
 ZiXyNLvwKjbXg19L3ymEivtxXPYTTtAlhiTp0lT/Dg/Yn6TKlC+0k4S++Ln5WWkx9Ibv
 OSdI5xWWjN/tlFy77VPHMCk/JC9oamvWGWVX5NrCGGbpUNf/3zpoNYDY4dkN5LPmmKqk
 Z2Ih4Y9+aHUdR62jGce9rUzPstsKV2kXUNtUNKYSCXg+Hcdv3W0zetj/6Jxhtp1FBVWM
 kSMF8tkwxAdH5ETPLXIrkpIpn/E4DTObSvtbQtIODiHVo5JFrVOWK8qQvWr1g2GIGDol
 G2Yg==
X-Gm-Message-State: AO0yUKUGRlPgnyeJbTTB3lqrTaz0Id3x2e2f8ruv0XechqRIf33kcRDB
 xV49kgA0P7MY/Ih1YSqu/39UjDe7y/rwPtYyle3/v+W0Ifc=
X-Google-Smtp-Source: AK7set807Hb6Z8vBR9xnOsFU0VV3U32/bICD/c+Khw1Pb6UC18DPrnGX5YHgzwPo31gchaILXB+mi/xXN6029uhMpzQ=
X-Received: by 2002:a17:906:6805:b0:8b1:28f6:8ab3 with SMTP id
 k5-20020a170906680500b008b128f68ab3mr2226814ejr.15.1679211797984; Sun, 19 Mar
 2023 00:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
 <4B628CF1-65C6-4661-BAFB-B969A770A66E@benettiengineering.com>
In-Reply-To: <4B628CF1-65C6-4661-BAFB-B969A770A66E@benettiengineering.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 19 Mar 2023 09:43:07 +0200
Message-ID: <CA+fTLhgBT=oKNk6+RPqwck9iSG9gVs5_VgeLVa3Mbe7FW_mPjw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679211798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ChAf8C6itRQRmHF5HTySHMqAsqHglL1XQ7iZEWD30vI=;
 b=ODjX0nl4liFqZoFnp7oXpG+Zq9T8dmWs8C5lq+7E5GUZlY82Ce+nlS6RzXeMEk5YrC
 Du4kqKRoQitYP4GhqwgNPjzJ9e/DsZS5GQYQGy+MGmXZk51dsM96qchk2J87LZkzIUyp
 1HqZezXFlNr+w9yRxOwiWdagyIwflkqZ+TEKUywDbGnwWg1UqlmGy/LT/TdKq0n2GLZM
 qMGf2aiDKHn8RHT7jmmlsf2VSKWLpQe7Q6NZPw1E5uful4R6sPIuZ77Fqy+8rxlXkMu5
 p6440atvmLdKuBrIawpuVelaG7c1+2UaeWwMvO4nJpotTlLxSx4PIaVP+6fUe0zpG2lJ
 wuTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ODjX0nl4
Subject: Re: [Buildroot] package/rtl8189fs: bug in conf, and a question
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7896138751006385149=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7896138751006385149==
Content-Type: multipart/alternative; boundary="000000000000b8b9cd05f73bf685"

--000000000000b8b9cd05f73bf685
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Giulio Benetti (<giulio.benetti@benettiengineering.com>) kirjutas
kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 01:01:

> Hi Indkrek,
>
> Il giorno 18 mar 2023, alle ore 22:46, Indrek Kruusa <
> indrek.kruusa@gmail.com> ha scritto:
>
> =EF=BB=BF
> Hi!
> I'm trying to prepare a patch for MangoPi MQ (Allwinner D1s RISC-V). I'm
> almost there - Samuel Holland managed to mainline initial support for thi=
s
> board, so vanilla linux kernel 6.3-rc2 boots fine (with proper/modified
> u-boot version).
> The WiFi module is based on rtl8189ftv chip (SDIO connection) and its
> driver seems to be problematic.
> First, buildroot's package/rtl8189fs is currently broken; it points to th=
e
> wrong commit (seems to be copy paste error, inherited from
> package/rtl8189es). The result is unusable.
>
>
> as Thomas already pointed the commit works ok for me too.
>
> I updated it to the correct commit (on the correct branch) and the driver
> builds fine and loads fine.
>
>
> Which branch and commit have you used? Take care that the commit actually
> used has not the support for Linux 6.3 that has been added later.
>
> There are couple of issues though:
> - for some reason the debug mode in driver is set
>
> -  driver seems to constantly restart the module, and it emits endless
> debug messages
>
>
> This could be bound to the branch/commit of the driver, if it includes
> Linux 6.3 support or not.
> But it should, otherwise it should not build.
> Anyway I don=E2=80=99t know that much about other branches.
> Maybe you mean that master branch is for rtl8189es and rtl8189fs branch i=
s
> for rtl8189fs?
>
> Also, how do you determine that rtl8189ftv is compatible with rtl8189fs?
>
>
> So, is there anybody for whom the rtl8189fs linux driver works fine with
> kernel 6.3-rcX?
>
>
> PS. I can prepare a patch to fix the package/rtl8189fs but I expect Giuli=
o
> to bump the version again for both package/rtl8189es and
> package/rtl8189fs soon.
>
>
> Sure I can do that, there is already a pending patch for rtl8189es but
> it=E2=80=99s already superseded at this point.
> By Monday I=E2=80=99ll send the 2 patches or feel free to do it instead.
>
>

Hi!

Yes, for the rtl8189fs kernel module the code must be checked out from the
rtl8189fs branch. Currently the commit hash for the package/rtl8189es and
package/rtl8189fs is the same and it's from rtl8189ES_linux/master. It
builds but it produces the wrong thing in the case of the rtl8189fs. I'm
fine if it gets fixed next week ;)
About rtl8189ftv and compatibility. The difference between rtl8188ftv and
rtl8189ftv chip seems to be the connection interface type (usb and sdio
accordingly). It looks to me that the rtl8189fs driver still relies on the
8188f specific code but it adds sdio capability (roughly speaking). Also,
https://linux-sunxi.org/Wifi#RTL8189FTV says that the rtl8189fs branch is
the only working solution currently (or has been at least).
There can be several reasons why it doesn't work for me. That's why I was
asking first about the others' experience on actual hardware, maybe with
the different (mature) SOC/platform.

Thanks,
Indrek

--000000000000b8b9cd05f73bf685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Kontakt Giulio Benetti (&lt;<a href=
=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benettieng=
ineering.com</a>&gt;) kirjutas kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 0=
1:01:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"auto">Hi Indkrek,<br><div dir=3D"ltr"><b=
r><blockquote type=3D"cite">Il giorno 18 mar 2023, alle ore 22:46, Indrek K=
ruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_blank">indr=
ek.kruusa@gmail.com</a>&gt; ha scritto:<br><br></blockquote></div><blockquo=
te type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi!<div>I&#39;m=
 trying to prepare a patch for MangoPi MQ (Allwinner D1s RISC-V). I&#39;m a=
lmost there - Samuel Holland=C2=A0managed to mainline initial support for t=
his board, so vanilla linux kernel=C2=A06.3-rc2 boots fine (with proper/mod=
ified u-boot version).</div><div>The WiFi module is based on rtl8189ftv chi=
p (SDIO connection) and its driver seems to be problematic.</div><div>First=
, buildroot&#39;s package/rtl8189fs is currently broken; it points to the w=
rong commit (seems to be copy paste error, inherited from package/rtl8189es=
). The result is unusable.</div></div></div></blockquote><div><br></div><di=
v><span style=3D"color:rgb(0,0,0)">as Thomas already pointed the commit wor=
ks ok for me too.</span></div><br><blockquote type=3D"cite"><div dir=3D"ltr=
"><div dir=3D"ltr"><div> I updated it to the correct commit (on the correct=
 branch) and the driver builds fine and loads fine.</div></div></div></bloc=
kquote><div><br></div>Which branch and commit have you used? Take care that=
 the commit actually used has not the support for Linux 6.3 that has been a=
dded later.<br><div><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div>There are couple of issues though:</div><div>- for some=
 reason the debug mode in driver is set</div></div></div></blockquote><bloc=
kquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div>-=C2=A0 driver =
seems to constantly=C2=A0restart the module, and it emits endless debug mes=
sages</div></div></div></blockquote><div><br></div><div>This could be bound=
 to the branch/commit of the driver, if it includes Linux 6.3 support or no=
t.</div><div>But it should, otherwise it should not build.</div><div>Anyway=
 I don=E2=80=99t know that much about other branches.</div><div>Maybe you m=
ean that master branch is for rtl8189es and rtl8189fs branch is for rtl8189=
fs?</div><div><br></div><div>Also, how do you determine that rtl8189ftv is =
compatible with rtl8189fs?</div><br><blockquote type=3D"cite"><div dir=3D"l=
tr"><div dir=3D"ltr"><div><br></div><div>So, is there anybody for whom the =
rtl8189fs linux driver works fine with kernel 6.3-rcX?</div></div></div></b=
lockquote><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div>=
<br></div><div>PS. I can=C2=A0prepare a patch=C2=A0to fix the package/rtl81=
89fs but I expect=C2=A0<span style=3D"color:rgb(51,51,51);font-family:sans-=
serif;font-size:13.3333px">Giulio to bump the version again for both=C2=A0<=
/span>package/rtl8189es and package/rtl8189fs soon.</div></div></div></bloc=
kquote><div><br></div><div>Sure I can do that, there is already a pending p=
atch for rtl8189es but it=E2=80=99s already superseded at this point.=C2=A0=
</div><div>By Monday I=E2=80=99ll send the 2 patches or feel free to do it =
instead.</div><div><br></div></div></blockquote><div><br></div><div><br></d=
iv><div>Hi!<div><br></div><div>Yes, for the rtl8189fs kernel module the cod=
e must be checked out from the rtl8189fs branch. Currently the commit hash =
for the package/rtl8189es and package/rtl8189fs is the same and it&#39;s fr=
om rtl8189ES_linux/master. It builds but it produces the wrong thing in the=
 case of the rtl8189fs. I&#39;m fine if it gets fixed next week ;)<br>About=
 rtl8189ftv and compatibility. The difference between rtl8188ftv and rtl818=
9ftv chip seems to be the connection interface type (usb and sdio according=
ly). It looks to me that the rtl8189fs driver still relies on the 8188f spe=
cific code but it adds sdio capability (roughly speaking). Also, <a href=3D=
"https://linux-sunxi.org/Wifi#RTL8189FTV">https://linux-sunxi.org/Wifi#RTL8=
189FTV</a> says that the rtl8189fs branch is the only working solution curr=
ently (or has been at least).<br>There can be several reasons why it doesn&=
#39;t work for me. That&#39;s why I was asking first about the others&#39; =
experience on actual hardware, maybe with the different (mature) SOC/platfo=
rm.<br><br>Thanks,<br>Indrek</div></div><div><br></div></div></div>

--000000000000b8b9cd05f73bf685--

--===============7896138751006385149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7896138751006385149==--
