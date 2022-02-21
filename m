Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8F8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 09:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97CD403EC;
	Mon, 21 Feb 2022 09:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIcrrevPoDlo; Mon, 21 Feb 2022 09:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C68403B4;
	Mon, 21 Feb 2022 09:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA1671BF2BA
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 09:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B566E60BB1
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 09:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzLavtlyQ1lf for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 09:46:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8000360B2A
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 09:46:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id o34so9163389wms.1
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 01:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mslXfEhjTMHIKD8YCIxNvegSI4+ZSXzMIj4HLa3iCzA=;
 b=TO2X9Qs22Uf/sfrAkJK0hqmIM13AXqpOkYJWsQkvYmQ6vKi56+zpWnSZonSRFfuoZK
 n1540zMY5ia03j2RjlTNrBzq9YjS6W77fUBU0HqVd3loA7Bc2sB1KrywDQVU8E7wLtad
 eiRUh9K6Iy56PaTzsn9xz0qT1S7uNXm3xtgRVSN8OCCccwnO2iLy3jW0+7kDW8HE0zp3
 Bjvy3sxC+iXcWNMFUSBrcxF2ZaycJdQGYbCp3p7HoP23642PK5fi4En4EGT7Wvf6494x
 O4koKw8abXDXQDUFK41dETF/MzoTFtu9MJgzv0ceRcydQB28Dm6O5xBolxF+8gzrGBCK
 tfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mslXfEhjTMHIKD8YCIxNvegSI4+ZSXzMIj4HLa3iCzA=;
 b=1EwtyZ8u/oKxiL4rLE/nRDVRKPcIZMZ0v/ljyvM7F4HbRrfUu9HokdH5MZGkAJaDhy
 LtfucaaDpS8K3Utk+9Kw8KBItb1mPQM1CkeTWHqJ73xuiuoV/2e7/EUmeSY87ZwmplHr
 DFC8QjfwyutpkJgph2o5KHAtUww8PETbfIDu9YBmCXxUhtI4oZ4G04TTM79r8uvqevMH
 HD/U/RapCYBFt1Ht71llAVFjL+9myJWAiXYwvk/eu3BYSvxg2IhrsgiF6e4kmNXkVPvB
 F87g34NlUq4Saq3lp7GKMl+nfUfsxQpCXDc2Oa9ggLxvDCtOBdo0hwfz8EaQtNzsodiZ
 kcMQ==
X-Gm-Message-State: AOAM533XOPenUQrPq/ryfzKB+CVKfHJYy8mNyM+x25cm/XlO4vFbNRYG
 E+F/5tOQL6Yx9NZ2EP/JBz/Ta8Pf5srBJEcWwK8=
X-Google-Smtp-Source: ABdhPJxp45wIENYgasQjgngu08/PtUSOS4/f3GZ6CTgL3U7PqbXDJ16Ys9srcXp7+3m9Abbo9zcNdHOHNYFBJI7Zrkk=
X-Received: by 2002:a7b:cb44:0:b0:37b:c569:5924 with SMTP id
 v4-20020a7bcb44000000b0037bc5695924mr20309204wmj.83.1645436812494; Mon, 21
 Feb 2022 01:46:52 -0800 (PST)
MIME-Version: 1.0
References: <CAHnHX5gEBk0L3OT5J-RR-H-QCRgJQeO_Hnujz2rxObOmJHMscw@mail.gmail.com>
 <843DF5BA-BFB7-4EEF-BF74-0CB8894652B7@benettiengineering.com>
In-Reply-To: <843DF5BA-BFB7-4EEF-BF74-0CB8894652B7@benettiengineering.com>
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Mon, 21 Feb 2022 17:46:40 +0800
Message-ID: <CAHnHX5hBrap7CYKud0nQQzdaTs6gX0mW56DQcCuTj0CzDWiO5w@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
Content-Type: multipart/mixed; boundary="===============3637543743581407675=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3637543743581407675==
Content-Type: multipart/alternative; boundary="000000000000b58a0d05d8841cf3"

--000000000000b58a0d05d8841cf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes I will, even though I'm not in IRC for quite some time now. :). Thanks
a lot Giulio!

On Mon, Feb 21, 2022 at 5:43 PM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

>
> Il giorno 21 feb 2022, alle ore 10:33, Mohd Faiz Rohani <
> mohd.faiz.rohani@gmail.com> ha scritto:
>
> =EF=BB=BF
> Btw, is the mailing list correct platform for Buildroot Q&A? Do you have
> any related forum for the purpose? Thanks
>
>
> It=E2=80=99s one of its purpose, but I suggest you to also join IRC #buil=
droot
> channel.
>
> Best regards
> Giulio
>
>
> On Mon, Feb 21, 2022, 4:44 PM Giulio Benetti <
> giulio.benetti@benettiengineering.com> wrote:
>
>> Hi Mohd,
>>
>> On 21/02/22 06:16, Mohd Faiz Rohani wrote:
>> > Hi guys,
>> >
>> > Thank you for your help.I have overlooked the required setting as
>> > normally I will leave the setting to the default, as I assume Buildroo=
t
>> > has selected the required settings. Anyway I have managed to login
>> > successfully now.
>> >
>> > I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and
>> > BR2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.
>>
>> Perfect, team working with Edgar worked :-)
>>
>> > Fyi, I have tried the newer versions of Linux Kernel (5.15) and Uboot
>> > (v2022.01) with the Linaro 7.5 toolchain, but got an error during the
>> > booting process where the RFS cannot be mounted. It may be my fault
>> > through the settings though, that is why I am trying the old version
>> and
>> > it worked.
>>
>> I would avoid using gcc 7.5 on such new kernel/uboot. Maybe if you try
>> to rebuild using an external prebuilt toolchain like the Bootlin one, or
>> you build a Buildroot toolchain with latest versions, like gcc 10.x you
>> could obtain different results.
>>
>> > I am planning to use Buildroot for my future development and keen to
>> > contribute wherever I can. Still lots to learn though.
>>
>> Well!
>>
>> > Thank you again guys.
>>
>> You're welcome
>>
>> Best regards
>> --
>> Giulio Benetti
>> Benetti Engineering sas
>>
>> > Regards.
>> > Faiz
>> >
>> >
>> >
>> >
>> > On Mon, Feb 21, 2022 at 2:33 AM Mohd Faiz Rohani
>> > <mohd.faiz.rohani@gmail.com <mailto:mohd.faiz.rohani@gmail.com>> wrote=
:
>> >
>> >     Thanks, I'll check them out. Will update the outcome once the
>> >     installation is done.
>> >
>> >     Thank you.
>> >
>> >     On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti
>> >     <giulio.benetti@benettiengineering.com
>> >     <mailto:giulio.benetti@benettiengineering.com>> wrote:
>> >
>> >         Hi Edgar,
>> >
>> >         please reply to all in Mailing List, I add Mohd in Cc,
>> >
>> >         On 20/02/22 17:18, Edgar Bonet wrote:
>> >          > Hi!
>> >          >
>> >          > In his config file, Mohd wrote:
>> >          >> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=3Dy
>> >          >> BR2_LINUX_KERNEL_VERSION=3D"4.4.155"
>> >          >
>> >          > This may cause problems. C.f. docs/manual/configure.txt:
>> >          >
>> >          >      If you use kernel headers that are more recent than th=
e
>> >         Linux
>> >          >      kernel you run on your embedded system, then the C
>> >         library might
>> >          >      be using interfaces that are not provided by your Linu=
x
>> >         kernel.
>> >
>> >         Good catch Edgar!
>> >         So Mohd, what you need here is a toolchain with older libc.
>> >
>> https://buildroot.org/downloads/manual/manual.html#_cross_compilation_to=
olchain
>> >         <
>> https://buildroot.org/downloads/manual/manual.html#_cross_compilation_to=
olchain
>> >
>> >
>> >         But again, do you really need to use so such old versions
>> >         instead of try
>> >         to use buildroot's beaglebone_defconfig?
>> >
>> >          > In the same config file, there is:
>> >          >> # BR2_PACKAGE_BUSYBOX is not set
>> >          >
>> >          > When disabling busybox, you should have seen the message:
>> >          >
>> >          >      You may need to enable other packages to get a working
>> >         system
>> >          >      You better know what you're doing!
>> >
>> >         Despite of what I've written on my previous e-mail(my test was
>> >         wrong),
>> >         he has BR2_INIT_SYSTEMD=3Dy that works as Init System, so that=
's
>> ok.
>> >
>> >          > And then:
>> >          >> # BR2_PACKAGE_SYSTEMD_LOGIND is not set
>> >
>> >         Good catch again Edgar! This ^^^ should be the point. Because
>> it's
>> >         exactly the systemd login dameon.
>> >
>> >          >> # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set
>> >
>> >         This ^^^ is not selected by systemd, so I expect
>> >         BR2_PACKAGE_SYSTEMD_LOGIND to do the job(even if I'm not a
>> systemd
>> >         expoert at all).
>> >
>> >         But as Edgar pointed linux headers don't match so you have 3
>> >         choices:
>> >         1) find a toolchain with linux-headers <=3D 4.4.*
>> >         2) update linux version
>> >         3) start from scratch using buildroot beaglebone_defconfig
>> >
>> >         Best regards
>> >         --
>> >         Giulio Benetti
>> >         Benetti Engineering sas
>> >
>>
>> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000b58a0d05d8841cf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes I will, even though I&#39;m not in IRC for quite=C2=A0=
some time=C2=A0now. :). Thanks a lot Giulio!</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 21, 2022 at 5:43 PM=
 Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com=
">giulio.benetti@benettiengineering.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><br><div dir=3D"lt=
r"><blockquote type=3D"cite">Il giorno 21 feb 2022, alle ore 10:33, Mohd Fa=
iz Rohani &lt;<a href=3D"mailto:mohd.faiz.rohani@gmail.com" target=3D"_blan=
k">mohd.faiz.rohani@gmail.com</a>&gt; ha scritto:<br><br></blockquote></div=
><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"auto">Btw,=
 is the mailing list correct platform for Buildroot Q&amp;A? Do you have an=
y related forum for the purpose? Thanks</div></div></blockquote><div><br></=
div><div>It=E2=80=99s one of its purpose, but I suggest you to also join IR=
C #buildroot channel.</div><div><br></div><div>Best regards</div><div>Giuli=
o</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 21, 2022, 4:44 =
PM Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.c=
om" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Mohd,<br>
<br>
On 21/02/22 06:16, Mohd Faiz Rohani wrote:<br>
&gt; Hi guys,<br>
&gt; <br>
&gt; Thank you for your=C2=A0help.I have overlooked the required setting as=
 <br>
&gt; normally I will leave the setting=C2=A0to the default, as I assume Bui=
ldroot <br>
&gt; has selected=C2=A0the required settings. Anyway I have managed to logi=
n <br>
&gt; successfully=C2=A0now.<br>
&gt; <br>
&gt; I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and <br>
&gt; BR2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.=
<br>
<br>
Perfect, team working with Edgar worked :-)<br>
<br>
&gt; Fyi, I have tried the newer versions of Linux Kernel (5.15) and Uboot =
<br>
&gt; (v2022.01) with the Linaro 7.5 toolchain, but got an error during the =
<br>
&gt; booting process where the RFS cannot be mounted. It may be my fault <b=
r>
&gt; through the settings though, that is why I am trying the old version a=
nd <br>
&gt; it worked.<br>
<br>
I would avoid using gcc 7.5 on such new kernel/uboot. Maybe if you try <br>
to rebuild using an external prebuilt toolchain like the Bootlin one, or <b=
r>
you build a Buildroot toolchain with latest versions, like gcc 10.x you <br=
>
could obtain different results.<br>
<br>
&gt; I am planning to use Buildroot for my future development and keen to <=
br>
&gt; contribute wherever=C2=A0I can. Still lots to learn though.<br>
<br>
Well!<br>
<br>
&gt; Thank you again guys.<br>
<br>
You&#39;re welcome<br>
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
&gt; &lt;<a href=3D"mailto:mohd.faiz.rohani@gmail.com" rel=3D"noreferrer" t=
arget=3D"_blank">mohd.faiz.rohani@gmail.com</a> &lt;mailto:<a href=3D"mailt=
o:mohd.faiz.rohani@gmail.com" rel=3D"noreferrer" target=3D"_blank">mohd.fai=
z.rohani@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks, I&#39;ll check them out. Will update the ou=
tcome once the<br>
&gt;=C2=A0 =C2=A0 =C2=A0installation is done.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank=C2=A0you.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:giulio.benetti@benettienginee=
ring.com" rel=3D"noreferrer" target=3D"_blank">giulio.benetti@benettiengine=
ering.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:giulio.benetti@benetti=
engineering.com" rel=3D"noreferrer" target=3D"_blank">giulio.benetti@benett=
iengineering.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Edgar,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0please reply to all in Mailing List, =
I add Mohd in Cc,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 20/02/22 17:18, Edgar Bonet wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Hi!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; In his config file, Mohd wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; BR2_TOOLCHAIN_EXTERNAL_HEAD=
ERS_4_10=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; BR2_LINUX_KERNEL_VERSION=3D=
&quot;4.4.155&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; This may cause problems. C.f. d=
ocs/manual/configure.txt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 If you use =
kernel headers that are more recent than the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 kernel you =
run on your embedded system, then the C<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library might<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 be using in=
terfaces that are not provided by your Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Good catch Edgar!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So Mohd, what you need here is a tool=
chain with older libc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://buildroot.org/down=
loads/manual/manual.html#_cross_compilation_toolchain" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://buildroot.org/downloads/manual/manual.h=
tml#_cross_compilation_toolchain</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://buildroot.org/=
downloads/manual/manual.html#_cross_compilation_toolchain" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://buildroot.org/downloads/manual/manu=
al.html#_cross_compilation_toolchain</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But again, do you really need to use =
so such old versions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instead of try<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to use buildroot&#39;s beaglebone_def=
config?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; In the same config file, there =
is:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; # BR2_PACKAGE_BUSYBOX is no=
t set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; When disabling busybox, you sho=
uld have seen the message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 You may nee=
d to enable other packages to get a working<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 You better =
know what you&#39;re doing!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Despite of what I&#39;ve written on m=
y previous e-mail(my test was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrong),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0he has BR2_INIT_SYSTEMD=3Dy that work=
s as Init System, so that&#39;s ok.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; And then:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; # BR2_PACKAGE_SYSTEMD_LOGIN=
D is not set<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Good catch again Edgar! This ^^^ shou=
ld be the point. Because it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exactly the systemd login dameon.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; # BR2_PACKAGE_UTIL_LINUX_LO=
GIN is not set<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This ^^^ is not selected by systemd, =
so I expect<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_SYSTEMD_LOGIND to do the =
job(even if I&#39;m not a systemd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expoert at all).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But as Edgar pointed linux headers do=
n&#39;t match so you have 3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0choices:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01) find a toolchain with linux-header=
s &lt;=3D 4.4.*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02) update linux version<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03) start from scratch using buildroot=
 beaglebone_defconfig<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Best regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Giulio Benetti<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Benetti Engineering sas<br>
&gt; <br>
<br>
</blockquote></div>
<span>_______________________________________________</span><br><span>build=
root mailing list</span><br><span><a href=3D"mailto:buildroot@buildroot.org=
" target=3D"_blank">buildroot@buildroot.org</a></span><br><span><a href=3D"=
https://lists.buildroot.org/mailman/listinfo/buildroot" target=3D"_blank">h=
ttps://lists.buildroot.org/mailman/listinfo/buildroot</a></span><br></div><=
/blockquote></div></blockquote></div>

--000000000000b58a0d05d8841cf3--

--===============3637543743581407675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3637543743581407675==--
