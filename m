Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E53C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 16:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E9E81391;
	Mon, 12 Dec 2022 16:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4E9E81391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmZ12qO9JBs2; Mon, 12 Dec 2022 16:55:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD3E81393;
	Mon, 12 Dec 2022 16:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBD3E81393
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A09A01BF386
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 872204031E
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 872204031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dkphIQVe1ob for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 16:55:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66C3140209
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66C3140209
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 16:55:32 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id l127so11773392oia.8
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 08:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnn4sAWmjxFM06vTSUf4kcYL5UgDZI4pX1Qdm3v2tdI=;
 b=265hgtTghu/NZP8DGT4KJ+RszY8iSoRoh8RSq2L7jz4uGJdNiw5JQztKC0PxURd7G2
 XuxfpInVNaTFDpZ7IaZW0RRuhZNsHOd+cEed6lefM9nXxb7FShdEQ5TyFfHUAyfUUUJH
 LU6D+zFMEAZx+0TNq2OO9xMiOFZU8FxEsGBswHKa1D1bW1w/xxJZxJWaAnnVcpOr0Gui
 GboCsm81l31wvK5K1U5RlU15/XfxnJ1IbpQbswVbFInmM/fc9HDFeLUF2oWmgyRmIQ1z
 /bY9wEXE1bn/IJG9lvNMmq/W6NpSsBZXxIoznmeMks1aynCHn1GOfVEUCP8GwAyRf37r
 xJ/A==
X-Gm-Message-State: ANoB5pmu4Xx9tBJrMCx1GtMscyvqtrufiOQFgfDbNphH536rTywaXByP
 LscUwAX0CWFS9BvGEkZftONVbirMhyH4BsMvkycdNg==
X-Google-Smtp-Source: AA0mqf7UlasKEeZP8g1BRDJlmtoDUkrJmlOVZoJv32+D9VRMr22z+545rCrNNC1DuRWDOIMmp4US+VxnUWMuxsvg58I=
X-Received: by 2002:aca:c108:0:b0:354:946b:f72f with SMTP id
 r8-20020acac108000000b00354946bf72fmr40416741oif.48.1670864131289; Mon, 12
 Dec 2022 08:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
 <CA+fTLhgdh1SXyY-sXqPZDzEmAQT9Bz+=fjgw26m6kDTZCMtsNw@mail.gmail.com>
In-Reply-To: <CA+fTLhgdh1SXyY-sXqPZDzEmAQT9Bz+=fjgw26m6kDTZCMtsNw@mail.gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 12 Dec 2022 17:54:55 +0100
Message-ID: <CA+_SqVauB52BscFa99EELb4tA83Ujg_ZvStiQ1uZL8FcJNeWbA@mail.gmail.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wnn4sAWmjxFM06vTSUf4kcYL5UgDZI4pX1Qdm3v2tdI=;
 b=OXq+w/CkOWR1NgAGr+ueZ7d3nfbo05GYGkROMc2rqNfDsvQTVKrzLFQPRHrmg9V1e5
 UMHs35fSDAJT7Ec2iuZUo2MEfcjgYT4uywHcbrm4QOS7KsQlO7/6wArGqmDpNOXgt9Se
 /KbGoLDZ79N7BLD42XNA303JkAGuKi7aY1zCQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OXq+w/Ck
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
Content-Type: multipart/mixed; boundary="===============2496349017341688500=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2496349017341688500==
Content-Type: multipart/alternative; boundary="000000000000038e9d05efa45fd8"

--000000000000038e9d05efa45fd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2022 at 5:52 PM Indrek Kruusa <indrek.kruusa@gmail.com>
wrote:

> Kontakt Frank Hunleth (<fhunleth@troodon-software.com>) kirjutas
> kuup=C3=A4eval E, 12. detsember 2022 kell 17:32:
>
>> > >>>>> "Indrek" =3D=3D Indrek Kruusa indrek.kruusa@gmail.com writes:
>> >
>> > > BR2_TARGET_OPENSBI=3Dy
>> >
>> > > BR2_TARGET_OPENSBI_CUSTOM_TARBALL=3Dy
>> >
>> > > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
>> github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-=
e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
>> >
>> > > +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
>> github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-=
5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"
>> >
>> >
>> > Why still use this custom opensbi? There is D1 support in version 1.1 =
as
>> > mentioned on https://linux-sunxi.org/Allwinner_Nezha
>> >
>
>
> Ahh, I didn't catch that one. Very nice, will check!
>
>
>>
>>
>> Just in case it helps, I've been testing both the Korsgaard and Kruusa
>> patches on a MangoPI MQ Pro. This board is close, but not exactly like t=
he
>> Nezha, so I expect differences.
>>
>
> Nice, then we can prepare support for more boards and test it properly :)
> Actually I did my "it boots" testing on Lichee dock. Also known as Lichee
> RV dock. The naming of this carrier board or SOM combo is a mess. The
> official product is just Lichee dock AFAIK. But none is calling it like
> that. Anyway, I can help to prepare support for this board also.
>
> @Angelo Compagnucci <angelo@amarulasolutions.com> , any chance you could
> update your Lichee RV patches to the latest "known" goodies? :)
>

Got a bad flu, I'll try to work on them ASAP.


>
>
>
>>
>> Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here's
>> the error:
>>
>> ```
>> Unhandled exception: Store/AMO access fault
>> EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000
>> EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted
>>
>> Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)
>> ```
>>
>> If I use riscv-software-src/opensbi master, Linux boots again. From my
>> point of view, the Linux Sunxi wiki is correct that forks don't need to =
be
>> used, but something appears to have been fixed after 1.1.
>>
>> As a second note, I added the following based on the Sunxi wiki:
>>
>> BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES=3D"FW_PIC=3Dy"
>>
>> It's not clear to me that it makes a difference.
>>
>> It doesn't seem right for me to add a Tested-By to the patch series sinc=
e
>> I have a different board. However, the Linux 6.1.0-rc3 update and U-Boot
>> updates appear to be working well in my testing so far. My setup is clos=
er
>> to the Korsgaard patch set since I'm not using the HDMI output change. T=
he
>> OpenSBI issue with 1.1 is the only snag I hit.
>>
>> Thank you both for your Nezha updates.
>>
>> -Frank
>>
>>

--=20

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--000000000000038e9d05efa45fd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 5:52 PM Indre=
k Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com">indrek.kruusa@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr">Kontakt Frank Hunleth (&lt;<a href=3D=
"mailto:fhunleth@troodon-software.com" target=3D"_blank">fhunleth@troodon-s=
oftware.com</a>&gt;) kirjutas kuup=C3=A4eval E, 12. detsember 2022 kell 17:=
32:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">&gt; &gt;&gt;&gt;&gt;&gt; &quot;Indrek&quot; =3D=3D Indrek K=
ruusa <a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_blank">indrek.k=
ruusa@gmail.com</a> writes:<br>
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
r></div><div><a class=3D"gmail_plusreply" id=3D"m_-1360427197705986895plusR=
eplyChip-1" href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">@=
Angelo Compagnucci</a>=C2=A0, any chance you could update your Lichee RV pa=
tches to the=C2=A0latest &quot;known&quot; goodies? :)<br></div></div></div=
></blockquote><div><br></div><div>Got a bad flu, I&#39;ll try to work on th=
em ASAP.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--000000000000038e9d05efa45fd8--

--===============2496349017341688500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2496349017341688500==--
