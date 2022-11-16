Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8813C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 07:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 154F460F1C;
	Wed, 16 Nov 2022 07:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 154F460F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8XQRQ716CVm; Wed, 16 Nov 2022 07:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6D660E9D;
	Wed, 16 Nov 2022 07:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6D660E9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11BCC1BF873
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 07:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E11ED81E90
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 07:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E11ED81E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFT1PaGXNhbu for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 07:26:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC0A481E89
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC0A481E89
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 07:26:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso1445245pjg.5
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 23:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dSm/KYGoSbTeVVlF1l1Qdu98/UUNkq8zzIlA6qgPmrc=;
 b=743CZsy5Aqu4nikr06y+IsVODmrL3GUj4gM6I0B+KLItp5D/tIU0NXVTPifXfqxN0j
 mwgfvS6za7Kfk4B87x1dP3aBDz2thB63MbJvTVlwVTafMaPKYwUFcIxM3YNqtLCsEX1G
 BPgHV72/ObiVqrk3qK62khc722M+rmDtNS8cXpY8/Uy5SymznWSYGNDjuAt6w22LRf4i
 sJJXiItmkomLTDgT5L6L20zquYM+uVy2dnDvtv8Kt2FLUJoA8m7idPZXu2yjlAT6gysZ
 dKBqneBhe+Wo7UJRnFV+DVwKc4VqfQJErIq5ketYmD1OkEbpiMuSf5pIsi8hZCif9DO9
 pnsw==
X-Gm-Message-State: ANoB5pnB3HyC9SxVPXT8cm04nLmuLIpaW0xamXdR52nTeDlBp7QZHBld
 rBrQxvmZ+BBa4miGsLD8E3C5C9tZwMBWGkqbrzI=
X-Google-Smtp-Source: AA0mqf654vyIMRX1Uei3r52qB8oqCsCcDUYE5+FXmRIgHvOk0B8ixm0S7LgG33B7kbVxWAtx05jDO3NGOXBq7cOLgmo=
X-Received: by 2002:a17:90a:bf13:b0:209:8dc1:fdbd with SMTP id
 c19-20020a17090abf1300b002098dc1fdbdmr2446731pjs.46.1668583567968; Tue, 15
 Nov 2022 23:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20220917211719.251791-1-fontaine.fabrice@gmail.com>
 <76b0ac3b-7bd4-f9f5-8191-7c39380dda64@gmail.com>
In-Reply-To: <76b0ac3b-7bd4-f9f5-8191-7c39380dda64@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Nov 2022 08:25:56 +0100
Message-ID: <CAPi7W80x3ntmmr6xcKasos45siu5WpQzR9oiQB1VKsAf86OweA@mail.gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dSm/KYGoSbTeVVlF1l1Qdu98/UUNkq8zzIlA6qgPmrc=;
 b=Ehz3G/AYuG5hhYuMz5Ao7bXQglNDR8BGMZiwsW68CXj6TNh8SoAbDmqUemfTuxtZDG
 l3wO3zHL7886eDjcK4IHdgTpvV3x2OuwLDS4h4NqFvIpRH2M5ktAvXGMhcozxQ35Ih2b
 77jCD7GmwlryBzeeJtuVHfzIunsne4xDfqUf7bY6iQdRUNwtL2syzeHi/VdzF86bVZAD
 q2q/6OExfWGAlUBuMr6udBqw8Wm3slAMWqiMx82U2OraqWQ0bjicYxigPbPkdKhQLddI
 5u135Y4gw+Xrv2mOijWaD0IJ/xvUjJwroDCEFF7CX/Y2MKIlJzU0n5ey+26uAybP+YLW
 RJjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ehz3G/AY
Subject: Re: [Buildroot] [PATCH 1/1] package/popt: bump to version 1.19
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Markus Mayer <markus.mayer@broadcom.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7293250054241918905=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7293250054241918905==
Content-Type: multipart/alternative; boundary="000000000000d8cf2905ed9162a0"

--000000000000d8cf2905ed9162a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mer. 16 nov. 2022 =C3=A0 00:48, Florian Fainelli <f.fainelli@gmail.com> =
a
=C3=A9crit :

> Hi Fabrice,
>
> On 9/17/22 14:17, Fabrice Fontaine wrote:
> > - Drop patches (already in version) and so autoreconf
> > - Update hash of COPYING (license adjusted to use the original, straigh=
t
> >    MIT variant:
> >
> https://github.com/rpm-software-management/popt/commit/dcec86df3cfc96d3dd=
3a3e9f7f1086b768d2d88f
> )
> >
> >
> https://github.com/rpm-software-management/popt/compare/popt-1.18-release=
...popt-1.19-release
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> We recently upgraded from buildroot 2022.08 to 2022.11-rc1 which
> contains this change of yours and this causes gptfdisk's sgdisk to not
> be able to open the devices passed as argument, steps to reproduce would
> be as simple as:
>
> # sgdisk -p /dev/sda
> Problem opening  for reading! Error is 2.
> The specified file does not exist!
>
> Markus looked at the strace output and found the following:
>
> strace -f sgdisk -p /dev/sda
> [...]
> brk(NULL)                               =3D 0x5581f4d000
> brk(0x5581f6e000)                       =3D 0x5581f6e000
> brk(0x5581f8f000)                       =3D 0x5581f8f000
> openat(AT_FDCWD, "", O_RDONLY)          =3D -1 ENOENT (No such file or
> directory)
> write(2, "Problem opening ", 16Problem opening )        =3D 16
> write(2, " for reading! Error is ", 23 for reading! Error is ) =3D 23
> write(2, "2", 12)                        =3D 1
> write(2, ".\n", 2.
> )                      =3D 2
> write(2, "The specified file does not exis"..., 35The specified file
> does not exist!
> ) =3D 35
> exit_group(2)                           =3D ?
> +++ exited with 2 +++
>
> the openat() system call is passed an empty string which is the reason
> for sgdisk to fail opening the specified device. Reverting libpopt back
> to 1.18 but keeping everything else the same resolves the issue.
>
> Is this is a known problem? Thanks!
>

Yes, this is a known issue raised because the value returned by
poptGetArg() doesn't leak anymore:
https://github.com/rpm-software-management/popt/issues/80

I'll send a patch to apply the gptfdisk partial fix mentioned above.


> --
> Florian
>
> Best Regards,

Fabrice

--000000000000d8cf2905ed9162a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 16 nov. 2022 =C3=A0=
=C2=A000:48, Florian Fainelli &lt;<a href=3D"mailto:f.fainelli@gmail.com">f=
.fainelli@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Fabrice,<br>
<br>
On 9/17/22 14:17, Fabrice Fontaine wrote:<br>
&gt; - Drop patches (already in version) and so autoreconf<br>
&gt; - Update hash of COPYING (license adjusted to use the original, straig=
ht<br>
&gt;=C2=A0 =C2=A0 MIT variant:<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/rpm-software-management/pop=
t/commit/dcec86df3cfc96d3dd3a3e9f7f1086b768d2d88f" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/rpm-software-management/popt/commit/dcec86d=
f3cfc96d3dd3a3e9f7f1086b768d2d88f</a>)<br>
&gt; <br>
&gt; <a href=3D"https://github.com/rpm-software-management/popt/compare/pop=
t-1.18-release...popt-1.19-release" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/rpm-software-management/popt/compare/popt-1.18-release...p=
opt-1.19-release</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
We recently upgraded from buildroot 2022.08 to 2022.11-rc1 which <br>
contains this change of yours and this causes gptfdisk&#39;s sgdisk to not =
<br>
be able to open the devices passed as argument, steps to reproduce would <b=
r>
be as simple as:<br>
<br>
# sgdisk -p /dev/sda<br>
Problem opening=C2=A0 for reading! Error is 2.<br>
The specified file does not exist!<br>
<br>
Markus looked at the strace output and found the following:<br>
<br>
strace -f sgdisk -p /dev/sda<br>
[...]<br>
brk(NULL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x5581f4d000<br>
brk(0x5581f6e000)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x5581f6e000<br>
brk(0x5581f8f000)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x5581f8f000<br>
openat(AT_FDCWD, &quot;&quot;, O_RDONLY)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D -1 ENOENT (No such file or <br>
directory)<br>
write(2, &quot;Problem opening &quot;, 16Problem opening )=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D 16<br>
write(2, &quot; for reading! Error is &quot;, 23 for reading! Error is ) =
=3D 23<br>
write(2, &quot;2&quot;, 12)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 1<br>
write(2, &quot;.\n&quot;, 2.<br>
)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 2<br>
write(2, &quot;The specified file does not exis&quot;..., 35The specified f=
ile <br>
does not exist!<br>
) =3D 35<br>
exit_group(2)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ?<br>
+++ exited with 2 +++<br>
<br>
the openat() system call is passed an empty string which is the reason <br>
for sgdisk to fail opening the specified device. Reverting libpopt back <br=
>
to 1.18 but keeping everything else the same resolves the issue.<br>
<br>
Is this is a known problem? Thanks!<br></blockquote><div><br></div><div>Yes=
, this is a known issue raised because the value returned by
poptGetArg()
doesn&#39;t leak
anymore:</div><div><a href=3D"https://github.com/rpm-software-management/po=
pt/issues/80">https://github.com/rpm-software-management/popt/issues/80</a>=
</div><div><br></div><div>I&#39;ll send a patch to apply the gptfdisk parti=
al fix mentioned above.<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
-- <br>
Florian<br>
<br></blockquote><div>Best Regards,</div><div><br></div><div>Fabrice <br></=
div></div></div>

--000000000000d8cf2905ed9162a0--

--===============7293250054241918905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7293250054241918905==--
