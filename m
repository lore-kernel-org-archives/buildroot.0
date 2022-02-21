Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DDCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 09:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 050C9404FC;
	Mon, 21 Feb 2022 09:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qfwwh6OJR_h9; Mon, 21 Feb 2022 09:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A61A40519;
	Mon, 21 Feb 2022 09:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D62C71BF2BA
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 09:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFD3980DD5
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 09:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Woj1wZU_dFSL for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 09:43:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEDF280D3D
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 09:43:51 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id M5EQnlK6tBBmwM5ERnDUbL; Mon, 21 Feb 2022 10:43:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645436629; bh=wIAb1ZhSjlkwUrRRlXaJ/pXMUhjrAV3S1EH8JNccdnc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=gWBKP/6onF+G+iQDtFr32Hysh+Sw6tUh8cjEQoRA4w3dYv37YsVnYpymvoufGxA0/
 8Cu9exJnNh9YFwh4egKD1RN+xeUV6QvxFLs6MvLDZdaysaruRhjPUV3yn2m0hdKUKH
 op38TaJ5diKbk64FLLCXoIR4razmo4rVswkVqbXCNO/3dTdKzKortOqup/WgPRkDiF
 jrjiTGjPX5AhWXGAYlzkEtJ2cbPIDgnu6O7iFMPVOtwIEItiqfJwQ3coML1R3SaKE3
 doCC51paV6HQX2Pp4aEIrKZ4ynPbwNNocf2L5nDJRpk2jpWu6mOneNhPCsPH7hLDCD
 ZtRqy0bIK0R9w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 21 Feb 2022 10:43:46 +0100
Message-Id: <843DF5BA-BFB7-4EEF-BF74-0CB8894652B7@benettiengineering.com>
References: <CAHnHX5gEBk0L3OT5J-RR-H-QCRgJQeO_Hnujz2rxObOmJHMscw@mail.gmail.com>
In-Reply-To: <CAHnHX5gEBk0L3OT5J-RR-H-QCRgJQeO_Hnujz2rxObOmJHMscw@mail.gmail.com>
To: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfAZwP8BEZshMt+W3cgkYfX/mmFp+Z9bWFI+UzMF2KkfFVHiTdowJOoD6sDR3TgdC3Sd6WZoYo4la6280kzjiFHZcDFCyYoucOHxPi8uzGe9VJxRQfqpU
 qT9szvwNmoHIzWtZprnxKDlVIdgJ6G8Hy5Mkn/a9J+Iel1ITqQfGUBAI8cRyO9RwwN4cDmAPZuLjKqBRs7mtdV9ZwwN7wnQYF5fARpJ5I1Jxc0Q7TUcNdq3/
 gJuZ1VxMS0RLX5k54XL9t44mU9oJgo/NMxgcz5xZLMk=
Subject: Re: [Buildroot] Issue with login
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5122924350736727621=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5122924350736727621==
Content-Type: multipart/alternative; boundary=Apple-Mail-D99A9B97-D73A-488A-88E8-D01530D4176D
Content-Transfer-Encoding: 7bit


--Apple-Mail-D99A9B97-D73A-488A-88E8-D01530D4176D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Il giorno 21 feb 2022, alle ore 10:33, Mohd Faiz Rohani <mohd.faiz.rohani@=
gmail.com> ha scritto:
>=20
> =EF=BB=BF
> Btw, is the mailing list correct platform for Buildroot Q&A? Do you have a=
ny related forum for the purpose? Thanks

It=E2=80=99s one of its purpose, but I suggest you to also join IRC #buildro=
ot channel.

Best regards
Giulio

>=20
>> On Mon, Feb 21, 2022, 4:44 PM Giulio Benetti <giulio.benetti@benettiengin=
eering.com> wrote:
>> Hi Mohd,
>>=20
>> On 21/02/22 06:16, Mohd Faiz Rohani wrote:
>> > Hi guys,
>> >=20
>> > Thank you for your help.I have overlooked the required setting as=20
>> > normally I will leave the setting to the default, as I assume Buildroot=
=20
>> > has selected the required settings. Anyway I have managed to login=20
>> > successfully now.
>> >=20
>> > I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and=20
>> > BR2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.
>>=20
>> Perfect, team working with Edgar worked :-)
>>=20
>> > Fyi, I have tried the newer versions of Linux Kernel (5.15) and Uboot=20=

>> > (v2022.01) with the Linaro 7.5 toolchain, but got an error during the=20=

>> > booting process where the RFS cannot be mounted. It may be my fault=20
>> > through the settings though, that is why I am trying the old version an=
d=20
>> > it worked.
>>=20
>> I would avoid using gcc 7.5 on such new kernel/uboot. Maybe if you try=20=

>> to rebuild using an external prebuilt toolchain like the Bootlin one, or=20=

>> you build a Buildroot toolchain with latest versions, like gcc 10.x you=20=

>> could obtain different results.
>>=20
>> > I am planning to use Buildroot for my future development and keen to=20=

>> > contribute wherever I can. Still lots to learn though.
>>=20
>> Well!
>>=20
>> > Thank you again guys.
>>=20
>> You're welcome
>>=20
>> Best regards
>> --=20
>> Giulio Benetti
>> Benetti Engineering sas
>>=20
>> > Regards.
>> > Faiz
>> >=20
>> >=20
>> >=20
>> >=20
>> > On Mon, Feb 21, 2022 at 2:33 AM Mohd Faiz Rohani=20
>> > <mohd.faiz.rohani@gmail.com <mailto:mohd.faiz.rohani@gmail.com>> wrote:=

>> >=20
>> >     Thanks, I'll check them out. Will update the outcome once the
>> >     installation is done.
>> >=20
>> >     Thank you.
>> >=20
>> >     On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti
>> >     <giulio.benetti@benettiengineering.com
>> >     <mailto:giulio.benetti@benettiengineering.com>> wrote:
>> >=20
>> >         Hi Edgar,
>> >=20
>> >         please reply to all in Mailing List, I add Mohd in Cc,
>> >=20
>> >         On 20/02/22 17:18, Edgar Bonet wrote:
>> >          > Hi!
>> >          >
>> >          > In his config file, Mohd wrote:
>> >          >> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=3Dy
>> >          >> BR2_LINUX_KERNEL_VERSION=3D"4.4.155"
>> >          >
>> >          > This may cause problems. C.f. docs/manual/configure.txt:
>> >          >
>> >          >      If you use kernel headers that are more recent than the=

>> >         Linux
>> >          >      kernel you run on your embedded system, then the C
>> >         library might
>> >          >      be using interfaces that are not provided by your Linux=

>> >         kernel.
>> >=20
>> >         Good catch Edgar!
>> >         So Mohd, what you need here is a toolchain with older libc.
>> >         https://buildroot.org/downloads/manual/manual.html#_cross_compi=
lation_toolchain
>> >         <https://buildroot.org/downloads/manual/manual.html#_cross_comp=
ilation_toolchain>
>> >=20
>> >         But again, do you really need to use so such old versions
>> >         instead of try
>> >         to use buildroot's beaglebone_defconfig?
>> >=20
>> >          > In the same config file, there is:
>> >          >> # BR2_PACKAGE_BUSYBOX is not set
>> >          >
>> >          > When disabling busybox, you should have seen the message:
>> >          >
>> >          >      You may need to enable other packages to get a working
>> >         system
>> >          >      You better know what you're doing!
>> >=20
>> >         Despite of what I've written on my previous e-mail(my test was
>> >         wrong),
>> >         he has BR2_INIT_SYSTEMD=3Dy that works as Init System, so that'=
s ok.
>> >=20
>> >          > And then:
>> >          >> # BR2_PACKAGE_SYSTEMD_LOGIND is not set
>> >=20
>> >         Good catch again Edgar! This ^^^ should be the point. Because i=
t's
>> >         exactly the systemd login dameon.
>> >=20
>> >          >> # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set
>> >=20
>> >         This ^^^ is not selected by systemd, so I expect
>> >         BR2_PACKAGE_SYSTEMD_LOGIND to do the job(even if I'm not a syst=
emd
>> >         expoert at all).
>> >=20
>> >         But as Edgar pointed linux headers don't match so you have 3
>> >         choices:
>> >         1) find a toolchain with linux-headers <=3D 4.4.*
>> >         2) update linux version
>> >         3) start from scratch using buildroot beaglebone_defconfig
>> >=20
>> >         Best regards
>> >         --=20
>> >         Giulio Benetti
>> >         Benetti Engineering sas
>> >=20
>>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-D99A9B97-D73A-488A-88E8-D01530D4176D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"ci=
te">Il giorno 21 feb 2022, alle ore 10:33, Mohd Faiz Rohani &lt;mohd.faiz.ro=
hani@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockquote type=3D=
"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"auto">Btw, is the mailing list c=
orrect platform for Buildroot Q&amp;A? Do you have any related forum for the=
 purpose? Thanks</div></div></blockquote><div><br></div><div>It=E2=80=99s on=
e of its purpose, but I suggest you to also join IRC #buildroot channel.</di=
v><div><br></div><div>Best regards</div><div>Giulio</div><br><blockquote typ=
e=3D"cite"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Feb 21, 2022, 4:44 PM Giulio Benetti &lt;<a href=
=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benettiengi=
neering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Mohd,<br>=

<br>
On 21/02/22 06:16, Mohd Faiz Rohani wrote:<br>
&gt; Hi guys,<br>
&gt; <br>
&gt; Thank you for your&nbsp;help.I have overlooked the required setting as <=
br>
&gt; normally I will leave the setting&nbsp;to the default, as I assume Buil=
droot <br>
&gt; has selected&nbsp;the required settings. Anyway I have managed to login=
 <br>
&gt; successfully&nbsp;now.<br>
&gt; <br>
&gt; I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and <br>
&gt; BR2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.<=
br>
<br>
Perfect, team working with Edgar worked :-)<br>
<br>
&gt; Fyi, I have tried the newer versions of Linux Kernel (5.15) and Uboot <=
br>
&gt; (v2022.01) with the Linaro 7.5 toolchain, but got an error during the <=
br>
&gt; booting process where the RFS cannot be mounted. It may be my fault <br=
>
&gt; through the settings though, that is why I am trying the old version an=
d <br>
&gt; it worked.<br>
<br>
I would avoid using gcc 7.5 on such new kernel/uboot. Maybe if you try <br>
to rebuild using an external prebuilt toolchain like the Bootlin one, or <br=
>
you build a Buildroot toolchain with latest versions, like gcc 10.x you <br>=

could obtain different results.<br>
<br>
&gt; I am planning to use Buildroot for my future development and keen to <b=
r>
&gt; contribute wherever&nbsp;I can. Still lots to learn though.<br>
<br>
Well!<br>
<br>
&gt; Thank you again guys.<br>
<br>
You're welcome<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
<br>
&gt; Regards.<br>
&gt; Faiz<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Feb 21, 2022 at 2:33 AM Mohd Faiz Rohani <br>
&gt; &lt;<a href=3D"mailto:mohd.faiz.rohani@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">mohd.faiz.rohani@gmail.com</a> &lt;mailto:<a href=3D"mailto:=
mohd.faiz.rohani@gmail.com" target=3D"_blank" rel=3D"noreferrer">mohd.faiz.r=
ohani@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;Thanks, I'll check them out. Will update the outcome=
 once the<br>
&gt;&nbsp; &nbsp; &nbsp;installation is done.<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;Thank&nbsp;you.<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti<br>
&gt;&nbsp; &nbsp; &nbsp;&lt;<a href=3D"mailto:giulio.benetti@benettiengineer=
ing.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettiengineer=
ing.com</a><br>
&gt;&nbsp; &nbsp; &nbsp;&lt;mailto:<a href=3D"mailto:giulio.benetti@benettie=
ngineering.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettie=
ngineering.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Hi Edgar,<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;please reply to all in Mailing List, I=
 add Mohd in Cc,<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;On 20/02/22 17:18, Edgar Bonet wrote:<=
br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt; Hi!<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt; In his config file, Mohd wrote:<=
br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&gt; BR2_TOOLCHAIN_EXTERNAL_HEADE=
RS_4_10=3Dy<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&gt; BR2_LINUX_KERNEL_VERSION=3D"=
4.4.155"<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt; This may cause problems. C.f. do=
cs/manual/configure.txt:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; If you use k=
ernel headers that are more recent than the<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Linux<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; kernel you r=
un on your embedded system, then the C<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;library might<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; be using int=
erfaces that are not provided by your Linux<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kernel.<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Good catch Edgar!<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;So Mohd, what you need here is a toolc=
hain with older libc.<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"https://buildroot.org/downl=
oads/manual/manual.html#_cross_compilation_toolchain" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://buildroot.org/downloads/manual/manual.html=
#_cross_compilation_toolchain</a><br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;<a href=3D"https://buildroot.org/d=
ownloads/manual/manual.html#_cross_compilation_toolchain" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://buildroot.org/downloads/manual/manual.h=
tml#_cross_compilation_toolchain</a>&gt;<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;But again, do you really need to use s=
o such old versions<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;instead of try<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;to use buildroot's beaglebone_defconfi=
g?<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt; In the same config file, there i=
s:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&gt; # BR2_PACKAGE_BUSYBOX is not=
 set<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt; When disabling busybox, you shou=
ld have seen the message:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; You may need=
 to enable other packages to get a working<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;system<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; You better k=
now what you're doing!<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Despite of what I've written on my pre=
vious e-mail(my test was<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;wrong),<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;he has BR2_INIT_SYSTEMD=3Dy that works=
 as Init System, so that's ok.<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt; And then:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&gt; # BR2_PACKAGE_SYSTEMD_LOGIND=
 is not set<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Good catch again Edgar! This ^^^ shoul=
d be the point. Because it's<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;exactly the systemd login dameon.<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &gt;&gt; # BR2_PACKAGE_UTIL_LINUX_LOG=
IN is not set<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;This ^^^ is not selected by systemd, s=
o I expect<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BR2_PACKAGE_SYSTEMD_LOGIND to do the j=
ob(even if I'm not a systemd<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;expoert at all).<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;But as Edgar pointed linux headers don=
't match so you have 3<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;choices:<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1) find a toolchain with linux-headers=
 &lt;=3D 4.4.*<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2) update linux version<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3) start from scratch using buildroot b=
eaglebone_defconfig<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Best regards<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-- <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Giulio Benetti<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Benetti Engineering sas<br>
&gt; <br>
<br>
</blockquote></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></body></html>=

--Apple-Mail-D99A9B97-D73A-488A-88E8-D01530D4176D--

--===============5122924350736727621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5122924350736727621==--
