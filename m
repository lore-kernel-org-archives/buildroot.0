Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332C2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 17:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86BC415FB;
	Mon, 12 Dec 2022 17:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86BC415FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmy438o_R8pf; Mon, 12 Dec 2022 17:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF08415E6;
	Mon, 12 Dec 2022 17:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF08415E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4851BF386
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5443C817AA
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5443C817AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oqar4I72gRkw for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 17:02:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6269C8145C
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6269C8145C
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:02:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qk9so29746886ejc.3
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qfc0DahgCyHQanArwraym28A1h+wielco8n4IsQd39w=;
 b=AWWcBGhUWA3H1flafpH3FZkhDASXn8x2dC94cs3kYwPBXesPG5ppNRTBzfAE5lTQIN
 dBKPCy8vRLD7VAjdTcj9t6ogYDT2+n8JGUBVQzcgYdXDKJ+0nEei92Wofb3/AndvieZ4
 3nmir4QQe75ijpMy59XJFI+cT74L8blh0F6m4eYkpWMOGBcl2PJMR1StUtsN18Mjzmml
 SGuTlWY6mbJ62DHN45WknNHa/bVQ9RYqkakns03DiVxMKBL0qV8tuCktqSL+JtjB31oV
 jt4oCs1lm7nrFwLAAyZmnfoGpsDTc4/l976UFjGSTNvlw5/dPrTavzjJwlS+0Pl3tPyT
 nztQ==
X-Gm-Message-State: ANoB5pmiewqxJ+zUVWJr5LpUTQtu4Xu/1X8FzTJBA+mz2/bzcQFwUoIG
 KVy1Uf3nE18ECdU1pLJjBdrTpPzNTfY4CGrBuAg=
X-Google-Smtp-Source: AA0mqf7XNNfBB74trBl9xwH8n4PhfMRj6BSEB+oEdoF4sRPC1kixA56xRtn0ez1tqoInS28QwzlYy8e1SpBR2+cfI00=
X-Received: by 2002:a17:906:bce9:b0:7ad:960d:3a4d with SMTP id
 op9-20020a170906bce900b007ad960d3a4dmr61736664ejb.522.1670864577558; Mon, 12
 Dec 2022 09:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
 <CA+fTLhgdh1SXyY-sXqPZDzEmAQT9Bz+=fjgw26m6kDTZCMtsNw@mail.gmail.com>
 <CA+_SqVauB52BscFa99EELb4tA83Ujg_ZvStiQ1uZL8FcJNeWbA@mail.gmail.com>
In-Reply-To: <CA+_SqVauB52BscFa99EELb4tA83Ujg_ZvStiQ1uZL8FcJNeWbA@mail.gmail.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Mon, 12 Dec 2022 19:02:48 +0200
Message-ID: <CA+fTLhg=iVqTpRZCGN7PnNk9vWtKW4jr9ZVmR7HtR_9ZPKS4dw@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qfc0DahgCyHQanArwraym28A1h+wielco8n4IsQd39w=;
 b=biGlB4qU52R4TYu0j0pjt6CkILNLeBy6WBNU8P3eNrrVV+nV22YrCaVaFsrCg8oelP
 Q4fouGLhM/oBv6o7teIEW/IUkhWutF0MxV4oWHnhsD01GJ6YL2SaEsxGtLPqGZ03acCK
 LmMPQOJ/UXfQn+HZ2tcf1oWsldoBN0WFqpoy3DicHGQEwt+5geiE51LSaNz/Jwuoe8sM
 5Q/3MD53E/E4dy5/Vy3urrViWiQd6Y54PLU6eWlWsigEmcERwVtRPdjBTAs6QkyHPlM1
 5z7f5/Viy6f+Ju36D+TuiW15fpZOYMBFoWSGlYGOLoJ/S1lrqkFHMHckpQOFILW50PPl
 mpoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=biGlB4qU
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
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
Content-Type: multipart/mixed; boundary="===============0738377736518860787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0738377736518860787==
Content-Type: multipart/alternative; boundary="0000000000009cfdc605efa479b1"

--0000000000009cfdc605efa479b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Angelo Compagnucci (<angelo@amarulasolutions.com>) kirjutas
kuup=C3=A4eval E, 12. detsember 2022 kell 18:55:

>
>
> On Mon, Dec 12, 2022 at 5:52 PM Indrek Kruusa <indrek.kruusa@gmail.com>
> wrote:
>
>> Kontakt Frank Hunleth (<fhunleth@troodon-software.com>) kirjutas
>> kuup=C3=A4eval E, 12. detsember 2022 kell 17:32:
>>
>>> > >>>>> "Indrek" =3D=3D Indrek Kruusa indrek.kruusa@gmail.com writes:
>>> >
>>> > > BR2_TARGET_OPENSBI=3Dy
>>> >
>>> > > BR2_TARGET_OPENSBI_CUSTOM_TARBALL=3Dy
>>> >
>>> > > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
>>> github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi=
-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
>>> >
>>> > > +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
>>> github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi=
-5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"
>>> >
>>> >
>>> > Why still use this custom opensbi? There is D1 support in version 1.1
>>> as
>>> > mentioned on https://linux-sunxi.org/Allwinner_Nezha
>>> >
>>
>>
>> Ahh, I didn't catch that one. Very nice, will check!
>>
>>
>>>
>>>
>>> Just in case it helps, I've been testing both the Korsgaard and Kruusa
>>> patches on a MangoPI MQ Pro. This board is close, but not exactly like =
the
>>> Nezha, so I expect differences.
>>>
>>
>> Nice, then we can prepare support for more boards and test it properly :=
)
>> Actually I did my "it boots" testing on Lichee dock. Also known as Liche=
e
>> RV dock. The naming of this carrier board or SOM combo is a mess. The
>> official product is just Lichee dock AFAIK. But none is calling it like
>> that. Anyway, I can help to prepare support for this board also.
>>
>> @Angelo Compagnucci <angelo@amarulasolutions.com> , any chance you could
>> update your Lichee RV patches to the latest "known" goodies? :)
>>
>
> Got a bad flu, I'll try to work on them ASAP.
>

Oh, get well soon!


>
>
>>
>>
>>
>>>
>>> Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here's
>>> the error:
>>>
>>> ```
>>> Unhandled exception: Store/AMO access fault
>>> EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000
>>> EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted
>>>
>>> Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)
>>> ```
>>>
>>> If I use riscv-software-src/opensbi master, Linux boots again. From my
>>> point of view, the Linux Sunxi wiki is correct that forks don't need to=
 be
>>> used, but something appears to have been fixed after 1.1.
>>>
>>> As a second note, I added the following based on the Sunxi wiki:
>>>
>>> BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES=3D"FW_PIC=3Dy"
>>>
>>> It's not clear to me that it makes a difference.
>>>
>>> It doesn't seem right for me to add a Tested-By to the patch series
>>> since I have a different board. However, the Linux 6.1.0-rc3 update and
>>> U-Boot updates appear to be working well in my testing so far. My setup=
 is
>>> closer to the Korsgaard patch set since I'm not using the HDMI output
>>> change. The OpenSBI issue with 1.1 is the only snag I hit.
>>>
>>> Thank you both for your Nezha updates.
>>>
>>> -Frank
>>>
>>>
>
> --
>
> Angelo Compagnucci
>
> Software Engineer
>
> angelo@amarulasolutions.com
> __________________________________
> Amarula Solutions SRL
>
> Via le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 (0)42 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
> [`as] https://www.amarulasolutions.com|
>

--0000000000009cfdc605efa479b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Angelo Compagnucci (&lt;<a href=
=3D"mailto:angelo@amarulasolutions.com">angelo@amarulasolutions.com</a>&gt;=
) kirjutas kuup=C3=A4eval E, 12. detsember 2022 kell 18:55:<br></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 5:52 PM Indrek Kr=
uusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_blank">indre=
k.kruusa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Kontakt Frank Hunleth (=
&lt;<a href=3D"mailto:fhunleth@troodon-software.com" target=3D"_blank">fhun=
leth@troodon-software.com</a>&gt;) kirjutas kuup=C3=A4eval E, 12. detsember=
 2022 kell 17:32:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">&gt; &gt;&gt;&gt;&gt;&gt; &quot;Indrek&quot; =
=3D=3D Indrek Kruusa <a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_=
blank">indrek.kruusa@gmail.com</a> writes:<br>
&gt; <br>
&gt; &gt; BR2_TARGET_OPENSBI=3Dy<br>
&gt; <br>
&gt; &gt; BR2_TARGET_OPENSBI_CUSTOM_TARBALL=3Dy<br>
&gt; <br>
&gt; &gt; -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github=
,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36=
a71537023f078034fe795c64a9992a3.tar.gz&quot;<br>
&gt; <br>
&gt; &gt; +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github=
,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-5307908fb=
651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz&quot;<br>
&gt; <br>
&gt; <br>
&gt; Why still use this custom opensbi? There is D1 support in version 1.1 =
as<br>
&gt; mentioned on <a href=3D"https://linux-sunxi.org/Allwinner_Nezha" rel=
=3D"noreferrer" target=3D"_blank">https://linux-sunxi.org/Allwinner_Nezha</=
a><br>
&gt;</blockquote><div><br></div><div>Ahh, I didn&#39;t catch that one. Very=
 nice, will check!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"> <br>
<br>
Just in case it helps, I&#39;ve been testing both the Korsgaard and Kruusa =
patches on a MangoPI MQ Pro. This board is close, but not exactly like the =
Nezha, so I expect differences.<br></blockquote><div><br></div><div>Nice, t=
hen we can prepare support for more boards and test it properly :) Actually=
 I did my &quot;it boots&quot; testing on Lichee=C2=A0dock. Also known as L=
ichee RV dock. The naming of this carrier board or SOM combo is a mess. The=
 official product is just Lichee dock AFAIK. But none is calling it like th=
at. Anyway, I can help to prepare support for this board also.</div><div><b=
r></div><div><a class=3D"gmail_plusreply" id=3D"m_-6359121872211998979m_-13=
60427197705986895plusReplyChip-1" href=3D"mailto:angelo@amarulasolutions.co=
m" target=3D"_blank">@Angelo Compagnucci</a>=C2=A0, any chance you could up=
date your Lichee RV patches to the=C2=A0latest &quot;known&quot; goodies? :=
)<br></div></div></div></blockquote><div><br></div><div>Got a bad flu, I&#3=
9;ll try to work on them ASAP.</div></div></div></blockquote><div><br></div=
><div>Oh, get well soon!=C2=A0</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><div></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here&#39;s =
the error:<br>
<br>
```<br>
Unhandled exception: Store/AMO access fault<br>
EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000<br>
EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted<br>
<br>
Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)<br>
```<br>
<br>
If I use riscv-software-src/opensbi master, Linux boots again. From my poin=
t of view, the Linux Sunxi wiki is correct that forks don&#39;t need to be =
used, but something appears to have been fixed after 1.1.<br>
<br>
As a second note, I added the following based on the Sunxi wiki:<br>
<br>
BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES=3D&quot;FW_PIC=3Dy&quot;<br>
<br>
It&#39;s not clear to me that it makes a difference.<br>
<br>
It doesn&#39;t seem right for me to add a Tested-By to the patch series sin=
ce I have a different board. However, the Linux 6.1.0-rc3 update and U-Boot=
 updates appear to be working well in my testing so far. My setup is closer=
 to the Korsgaard patch set since I&#39;m not using the HDMI output change.=
 The OpenSBI issue with 1.1 is the only snag I hit.<br>
<br>
Thank you both for your Nezha updates.<br>
<br>
-Frank<br>
<br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><=
/span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-weight:500;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr" style=3D"line-height:1.=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fami=
ly:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">Software Engineer</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mon=
ospace;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap"><a href=3D"mailto:angelo@amarulasolutions.com" targ=
et=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0<br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
241,194,50);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap">__________________________________</span><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><br>=
</span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-weight:500;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re-wrap">Amarula Solutions SRL</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-=
family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre-wrap">Via le Canevare 3=
0, 31100 Treviso, Veneto, IT</span></p><p dir=3D"ltr" style=3D"line-height:=
1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fa=
mily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap">T. +39 (0)42 243 53=
10</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,=
monospace;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-fa=
mily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:i=
nfo@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com</a></=
span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bott=
om:0pt"><a href=3D"http://www.amarulasolutions.com/" style=3D"text-decorati=
on:none" target=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;=
Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre-wrap">www.amarulasolutions.com</span=
></a></p><div>[`as] <a href=3D"https://www.amarulasolutions.com" target=3D"=
_blank">https://www.amarulasolutions.com</a>|</div></div></div></div>
</blockquote></div></div>

--0000000000009cfdc605efa479b1--

--===============0738377736518860787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0738377736518860787==--
