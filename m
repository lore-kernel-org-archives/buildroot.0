Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE736C0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 17:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393924091D;
	Wed, 26 Jul 2023 17:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393924091D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxDC19ZKlayZ; Wed, 26 Jul 2023 17:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 073E140929;
	Wed, 26 Jul 2023 17:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 073E140929
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86CDD1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 17:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E55840929
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 17:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E55840929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iMtfVosF1SD for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 17:04:19 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D8054091D
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 17:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D8054091D
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b933bbd3eeso104840921fa.1
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 10:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690391056; x=1690995856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ymM86pFIuve6zWayvBNAqPMN+mqZwlx0HgDWlCfxbq4=;
 b=I4bA0pcYvdIePFF7B4FVz3BlyjUSrm8pcZWhg/xCiKgXTcCfsN7iNjX9XOCt2/5Ivf
 AxQTDbvtnijjaXJwhLAYnKuKz1vrtmfz8PQTCvALYsLlaLyko8ySGhdyUIJKtOHNUkOo
 P0LdW19PXTUdpMPfij4xnt+uv/ieNB+Z4rUIX7fvnbsx5bHeTU1EZVK/RFXE3ByRPy20
 4aR+TAEIQ60p6p9rmk4YUbfloN2422/is9MhG2wev19CCv4+0NFgmoYUeepO+U6/4o1T
 aKQySgHNkt4D9eatfDVLfwFy/GbGCDpmklDLcetS4HNAfjN7zxwZGNfckn/CgVySRm5S
 FVmQ==
X-Gm-Message-State: ABy/qLYftlHeOgH8Pi5G2Cr/qCmPF6yhuVF3cV4zEUUwuFgfRXP8seWc
 lXUL5/zsxP1jQt9icazGqLeKkiwgse2y62en7Mb0Wx/F
X-Google-Smtp-Source: APBJJlHrEWMrZ8wjcKl52J4ll9atEeFUcdyX5vtprVI6b+IuACvgPrjsFwwzrva1129kDwfDnZmmRL7dRskI4v6yE34=
X-Received: by 2002:a2e:9d8d:0:b0:2b9:af2b:bf18 with SMTP id
 c13-20020a2e9d8d000000b002b9af2bbf18mr1935802ljj.35.1690391055799; Wed, 26
 Jul 2023 10:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <CABRndgydwGOk5W1QFQQ3CeM3724aU5-AKeh0yRBw9dJD0yr7Lw@mail.gmail.com>
 <E2EF003D-F740-4237-8C76-F249176F0B6B@benettiengineering.com>
In-Reply-To: <E2EF003D-F740-4237-8C76-F249176F0B6B@benettiengineering.com>
From: Zvi Vered <veredz72@gmail.com>
Date: Wed, 26 Jul 2023 20:04:04 +0300
Message-ID: <CABRndgxy9N+ndHtMQNo3qytZ5jbmRKk0yddYT6J-Y+E64BHPGw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690391056; x=1690995856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ymM86pFIuve6zWayvBNAqPMN+mqZwlx0HgDWlCfxbq4=;
 b=GzsxE3nh6ShUZ5EP0Axaem8cOIoOSe6qBfjryXluJjwj06E7c6w4J2fEUiJpGY6Ig9
 Vc/kse7RvN7z5zo5DbKvbTq/LEZ6z6rbPtbHzSSl+D9ncRy0KtOPk2eZ743TeQCcw08r
 HviD/aLG8JnQb2MNTZ7no1LHbf4NgHjMlSZ+d0D5rDvtANt8Wl3PFNtbAQ2OnHUBPBOY
 zdoivW5/XmPRbDpqBwMaRWXunFM8HmvFFSswX2zTg2Ok+S04S2upU5zdOIJ+Epo7AbTn
 1f+Uzk7rC9r5fqvDQSOyT4RqcIGt+fTdFIO4gIkhxH9oScjVk0CztmIXp5i1Uyhnh9+0
 xW+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GzsxE3nh
Subject: Re: [Buildroot] buildroot 2023.02.3 : containers
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
Content-Type: multipart/mixed; boundary="===============8441229158570063972=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8441229158570063972==
Content-Type: multipart/related; boundary="00000000000069c85e060166d6ff"

--00000000000069c85e060166d6ff
Content-Type: multipart/alternative; boundary="00000000000069c85d060166d6fe"

--00000000000069c85d060166d6fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giulio,

Thank you very much for your reply.
I need dockers is my target where the rootfs created by buildroot is
located.
Now I see that buildroot has docker components.

Best regards,
Zvika

On Wed, Jul 26, 2023 at 10:12=E2=80=AFAM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Zvika,
>
> Il giorno 26 lug 2023, alle ore 04:43, Zvi Vered <veredz72@gmail.com> ha
> scritto:
>
> =EF=BB=BFHello,
>
> I built root file system with buildroot 2023.02.3
> The kernel is vanilla 5.4.249
> Architecture: x86_64. It works.
>
> Can you please tell if I can use containers in this setup ? How ?
>
>
> You can use official buildroot docker by issuing:
> $ utils/docker-run
> inside buildroot folder.
> You can check out buildroot manual:
> The Buildroot user manual
> <https://buildroot.org/downloads/manual/manual.html#submitting-patches>
> buildroot.org
> <https://buildroot.org/downloads/manual/manual.html#submitting-patches>
> [image: favicon.ico]
> <https://buildroot.org/downloads/manual/manual.html#submitting-patches>
> <https://buildroot.org/downloads/manual/manual.html#submitting-patches>
>
> In general patches are checked using docker-run script.
>
> Best regards
> Giulio
>
>
> Thank you,
> Zvika
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--00000000000069c85d060166d6fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Giulio,<div><br></div><div>Thank you very much for=
 your reply.</div><div>I need dockers is my target where the rootfs created=
 by buildroot is located.</div><div>Now I see that buildroot has docker com=
ponents.=C2=A0</div><div><br></div><div>Best=C2=A0regards,</div><div>Zvika=
=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Jul 26, 2023 at 10:12=E2=80=AFAM Giulio Benetti &lt;<a =
href=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benett=
iengineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"auto">Hi Zvika,<div><div dir=3D"ltr"><br><block=
quote type=3D"cite">Il giorno 26 lug 2023, alle ore 04:43, Zvi Vered &lt;<a=
 href=3D"mailto:veredz72@gmail.com" target=3D"_blank">veredz72@gmail.com</a=
>&gt; ha scritto:<br><br></blockquote></div><blockquote type=3D"cite"><div =
dir=3D"ltr">=EF=BB=BF<span>Hello,</span><br><span></span><br><span>I built =
root file system with buildroot 2023.02.3</span><br><span>The kernel is van=
illa 5.4.249</span><br><span>Architecture: x86_64. It works.</span><br><spa=
n></span><br><span>Can you please tell if I can use containers in this setu=
p ? How ?</span><br></div></blockquote><div><br></div><div>You can use offi=
cial buildroot docker by issuing:</div><div>$ utils/docker-run</div><div>in=
side buildroot folder.</div><div>You can check out buildroot manual:</div><=
div><div style=3D"display:block"><div style=3D"display:inline-block" role=
=3D"link"><a style=3D"border-radius:10px;font-family:-apple-system,Helvetic=
a,Arial,sans-serif;display:block;width:300px;overflow:hidden;text-decoratio=
n:none" rel=3D"nofollow" href=3D"https://buildroot.org/downloads/manual/man=
ual.html#submitting-patches" dir=3D"ltr" role=3D"button" width=3D"300" targ=
et=3D"_blank"><table style=3D"table-layout:fixed;border-collapse:collapse;w=
idth:300px;background-color:rgb(233,233,235);font-family:-apple-system,Helv=
etica,Arial,sans-serif" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" wi=
dth=3D"300"><tbody><tr><td><table bgcolor=3D"#E9E9EB" cellpadding=3D"0" cel=
lspacing=3D"0" width=3D"300" style=3D"font-family:-apple-system,Helvetica,A=
rial,sans-serif;table-layout:fixed;background-color:rgb(233,233,235)"><tbod=
y><tr><td style=3D"padding:8px 0px"><div style=3D"max-width:100%;margin:0px=
 16px;overflow:hidden"><div style=3D"font-weight:500;font-size:12px;overflo=
w:hidden;text-overflow:ellipsis;text-align:left"><a rel=3D"nofollow" href=
=3D"https://buildroot.org/downloads/manual/manual.html#submitting-patches" =
style=3D"text-decoration:none" target=3D"_blank"><font color=3D"#000000" st=
yle=3D"color:rgb(0,0,0)">The Buildroot user manual</font></a></div><div sty=
le=3D"font-weight:400;font-size:11px;overflow:hidden;text-overflow:ellipsis=
;text-align:left"><a rel=3D"nofollow" href=3D"https://buildroot.org/downloa=
ds/manual/manual.html#submitting-patches" style=3D"text-decoration:none" ta=
rget=3D"_blank"><font color=3D"#A2A2A9" style=3D"color:rgba(60,60,67,0.6)">=
buildroot.org</font></a></div></div></td><td style=3D"padding:6px 12px 6px =
0px" width=3D"36"><a rel=3D"nofollow" href=3D"https://buildroot.org/downloa=
ds/manual/manual.html#submitting-patches" target=3D"_blank"><img style=3D"d=
isplay: inline-block; width: 36px; height: 36px; border-radius: 3px;" width=
=3D"36" height=3D"36" alt=3D"favicon.ico" src=3D"cid:1899326b65be7117bb1"><=
/a></td></tr></tbody></table></td></tr></tbody></table></a></div></div><br>=
</div><div>In general patches are checked using docker-run script.</div><di=
v><br></div><div>Best regards</div><div>Giulio</div><br><blockquote type=3D=
"cite"><div dir=3D"ltr"><span></span><br><span>Thank you,</span><br><span>Z=
vika</span><br><span>_______________________________________________</span>=
<br><span>buildroot mailing list</span><br><span><a href=3D"mailto:buildroo=
t@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a></span><br><s=
pan><a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" targ=
et=3D"_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a></s=
pan><br></div></blockquote></div></div></blockquote></div>

--00000000000069c85d060166d6fe--

--00000000000069c85e060166d6ff
Content-Type: application/octet-stream; name="favicon.ico"
Content-Disposition: inline; filename="favicon.ico"
Content-Transfer-Encoding: base64
Content-ID: <1899326b65be7117bb1>
X-Attachment-Id: 1899326b65be7117bb1

AAABAAEAICAAAAEACACoCAAAFgAAACgAAAAgAAAAQAAAAAEACAAAAAAAAAQAABILAAASCwAAAAEA
AAABAAADTW4ATVNTAD5ZZwAPYX8ABV6OAABenAAcZIIAD2l9ADhofQAecHEAbmtnABZ0ewA3dHgA
AG6pAFl4ewAUeZAAC3SkACB9gwAXfY4AV3uAAAd9nAAkfJkADoOJAHp9ewCIfnQANH6ZAByEjQA/
hIsACoaaAAZ9uwADgrEAN4mNAByNlAArhLUAXIuPAC6LpQAwkZgAP5GUAACJygAEkLQATJOUAA2V
rwAilbAAAJDNAE+VpABZmZkAeJeWAFqVpwAAlscAl5iVAEKesQAPn8cANaKxAACgygCVnp8AMJ/A
ACOhxwAgpbsAeKOmAI6hpwBeorQAYaC8ADKntwBXpLwASamwAGmlswB0p6wAhqimAKOmpAAAqt0A
raqkAACr5gAprs4AIq7WADyt0QAAq+8ACbHaAKGwqwBQssUAK7TLAKa2sgAAtPIAsbW0ACa63QCg
ur0AwLqzAAC5+AAAu/MAdL/QAB7C6wC+wsAAmcbJAADH/gDJx8IAQMrnAF3L3QCZx9gAxcjGANbM
wgAr0+gADtL9AADU/gAj1PsAr9HWAMXR0wDP0tAAANv+ADjX/ABJ1/cA29bSAADg/QBo3PcAWuDw
ACTj/gBA4v0AAOr+AFHl/gDe4d8A5eLdAOzj2gBL6v4A3ObmADzx+gDk6OUA7OnkAGD4/QBu9/8A
fPv8AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/
//8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP//
/wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////
AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/
//8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP//
/wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////
AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/
//8AdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV7e3t7e3V1
dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dVUxRlppdXt7dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXxS
GRUIAgEKGEZde3t1dXV1dXV1dXV1dXV1dXV1dXV7VThcZWVrbEojCAEYWnV1dXV1dXV1dXV1dXV7
dXV1e2I/XFxcZGxrZmplVxQBRnt1dXV7dXt7e3t7dWF1e3tiPFxlZWRmZmVqZWVlbkc7fHt7e2lp
YURSUlpSMXVVRi4qTz40QE5OcT5IT0g+MmhhRERhREREMQppRBdSbTYOLBssLCJCE1hvX2M+GzIi
fFJEMVoXRDFhUmlaYV07IzcZBiE3Iyo4KlFJU1NTXlJ7UlpSYWh1bXZ7bV13aBAEHR0rR0srJktR
UVZHXEU8dnZVbXt8d0MaEU1CEQxDGhEHDRwRHhELJ0cnRTAURTNiP0dBd0EwQiQoKCgfJVAfEQQE
ERQUGhopUUU1RTUnMD84OEliSUpBQk0fKDooaC8HBRASJhQnJylXNTUwRTw8SThQWVBIW0IkHyIt
OihoQgcFEBIrFCkpKVdFVidFQUEzOFBZUkhbOiAaQyhCKGgoBwUQEisnGho5XDUzNUU4NTw4Mzg6
RTdBOjooIi4iVAkGBR4aR0cLET5sMzlXMzA4YjwwOjxRNUIWFjp8e3V8TQANDyBHXGs0QHBHVjVM
Nnd7dm18bTNgUCIuaXV1dXxbDxAJEUdmdCQkcD45WUxSe3V1dXV1Q2h7dnx1dXV1e1ADJktWXGts
cn5/f3puSFV7dXV1dXV2dXV1dXV1dXV1diEmUVZca3J0f39/cWVOYnl1dXV1dXV1dXV1dXV1dXV3
PSZWXGVycnh/f31zZlR2dXV1dXV1dXV1dXV1dXV1dXZUK1ZcZXFyeH9/enNeXXt1dXV1dXV1dXV1
dXV1dXV1dXZKS1xlbnF9fXpzblt3dXV1dXV1dXV1dXV1dXV1dXV1dmhHXGVqanNzc3NfbXV1dXV1
dXV1dXV1dXV1dXV1dXV1d2BXZWVuc3NzY2h2dXV1dXV1dXV1dXV1dXV1dXV1dXV1d2BWXG5ubmNn
d3V1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dlhZbGRrZ3d1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1
dnZ2dXZ2dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1
dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1
dQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAA
--00000000000069c85e060166d6ff--

--===============8441229158570063972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8441229158570063972==--
