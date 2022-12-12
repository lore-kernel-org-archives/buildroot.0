Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 16:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C6E402BA;
	Mon, 12 Dec 2022 16:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C6E402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LtnPBN8Cr97N; Mon, 12 Dec 2022 16:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB0F415F1;
	Mon, 12 Dec 2022 16:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB0F415F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 034B71BF386
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEF4460E3B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEF4460E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-89-lXTyvEg for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 16:52:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD7160758
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DD7160758
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 16:52:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id n20so29687931ejh.0
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 08:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h4WaA6trl1CNopZqnyScERIzoygnzY/mKqYA62Xrzm8=;
 b=PvUiJN2s8eGKjW0p29lwxid7dzTku/6Sp9l2Z6fMBeOZqmmP8GHQcNnjb8bxrLHrDr
 I7H6l/708kKvNOGAtWhGq6KR1/PUwgQ4kcYVZiTaJyrSlXyBJZCMaDse6HIC3B6DPCuY
 PRkM8JevsDWOT96offuB/RW20V4jCEK7uQGS7tcsESg5hCo5thVZ1Ni+5z+LTCAt5xC9
 0XJZtU5czzAPBxhTc1ZUXc5lCcHiGlopW409dCIrhNarbCMLNiE+a4bgU5U1TrOjjeQv
 OvRQc91/S6COB5HN2Z04XSKvsfIgSFVLrCoEoyPzrJVnw30GFbULTmpKk5PVrLpIsK6b
 rr5Q==
X-Gm-Message-State: ANoB5pnWux+edhwQwC9l2L4Lpn7NOkW72d/St7osSE5p0pPKtweggu6d
 /ouTSJDJuq9i4ycA+7VInngmDQEStkPEOERhdm4=
X-Google-Smtp-Source: AA0mqf7Xf0ZvpHZGJvBRmgIbeYwJnpHG4TTRL5RbMw3GYoCZtbiy0ZYkUe2n211IVmWwU96Pz735eVax0+pJJGFT3ZQ=
X-Received: by 2002:a17:906:c24e:b0:778:d81d:b1f0 with SMTP id
 bl14-20020a170906c24e00b00778d81db1f0mr6637121ejb.731.1670863932579; Mon, 12
 Dec 2022 08:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
In-Reply-To: <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Mon, 12 Dec 2022 18:52:03 +0200
Message-ID: <CA+fTLhgdh1SXyY-sXqPZDzEmAQT9Bz+=fjgw26m6kDTZCMtsNw@mail.gmail.com>
To: Frank Hunleth <fhunleth@troodon-software.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h4WaA6trl1CNopZqnyScERIzoygnzY/mKqYA62Xrzm8=;
 b=cIjNTPw1/neNlrnCsB/YrVAr36z2lWd4IusdW5Qw4elIMOFz4F2qgTHDihS6Rs+lZ6
 +tx9jOYEKvoQ5CGbbdK3KquTKyLMRJ4Zfi+JrY+Ki7YV+euZB5N1I05XW6aPRXUjvCfL
 NJ+hDmSjyOhgmGmHu1g9X4fCNPa/31vUU2SPH7R+rH7sevOgjSip+r8b7EGjkHMqYie+
 1pgg636m3NbvVDjXjx3P4uQDVcWGXBqBrLctQufsSo8PdpAM4QGz1j58lsgFAxq1u5rC
 +xxlmhE9u5zJOgv0y87HijXVSsDb8/inHaKPybpWAMKwVI/5cBsRwX3xGsJif7uidGJf
 nAgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cIjNTPw1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0528115436597793421=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0528115436597793421==
Content-Type: multipart/alternative; boundary="0000000000002b62f305efa453c0"

--0000000000002b62f305efa453c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Frank Hunleth (<fhunleth@troodon-software.com>) kirjutas kuup=C3=A4=
eval
E, 12. detsember 2022 kell 17:32:

> > >>>>> "Indrek" =3D=3D Indrek Kruusa indrek.kruusa@gmail.com writes:
> >
> > > BR2_TARGET_OPENSBI=3Dy
> >
> > > BR2_TARGET_OPENSBI_CUSTOM_TARBALL=3Dy
> >
> > > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e=
6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
> >
> > > +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-5=
307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"
> >
> >
> > Why still use this custom opensbi? There is D1 support in version 1.1 a=
s
> > mentioned on https://linux-sunxi.org/Allwinner_Nezha
> >


Ahh, I didn't catch that one. Very nice, will check!


>
>
> Just in case it helps, I've been testing both the Korsgaard and Kruusa
> patches on a MangoPI MQ Pro. This board is close, but not exactly like th=
e
> Nezha, so I expect differences.
>

Nice, then we can prepare support for more boards and test it properly :)
Actually I did my "it boots" testing on Lichee dock. Also known as Lichee
RV dock. The naming of this carrier board or SOM combo is a mess. The
official product is just Lichee dock AFAIK. But none is calling it like
that. Anyway, I can help to prepare support for this board also.

@Angelo Compagnucci <angelo@amarulasolutions.com> , any chance you could
update your Lichee RV patches to the latest "known" goodies? :)



>
> Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here's th=
e
> error:
>
> ```
> Unhandled exception: Store/AMO access fault
> EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000
> EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted
>
> Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)
> ```
>
> If I use riscv-software-src/opensbi master, Linux boots again. From my
> point of view, the Linux Sunxi wiki is correct that forks don't need to b=
e
> used, but something appears to have been fixed after 1.1.
>
> As a second note, I added the following based on the Sunxi wiki:
>
> BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES=3D"FW_PIC=3Dy"
>
> It's not clear to me that it makes a difference.
>
> It doesn't seem right for me to add a Tested-By to the patch series since
> I have a different board. However, the Linux 6.1.0-rc3 update and U-Boot
> updates appear to be working well in my testing so far. My setup is close=
r
> to the Korsgaard patch set since I'm not using the HDMI output change. Th=
e
> OpenSBI issue with 1.1 is the only snag I hit.
>
> Thank you both for your Nezha updates.
>
> -Frank
>
>

--0000000000002b62f305efa453c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Frank Hunleth (&lt;<a href=3D"mai=
lto:fhunleth@troodon-software.com">fhunleth@troodon-software.com</a>&gt;) k=
irjutas kuup=C3=A4eval E, 12. detsember 2022 kell 17:32:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; &g=
t;&gt;&gt;&gt;&gt; &quot;Indrek&quot; =3D=3D Indrek Kruusa <a href=3D"mailt=
o:indrek.kruusa@gmail.com" target=3D"_blank">indrek.kruusa@gmail.com</a> wr=
ites:<br>
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
r></div><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-1" href=3D"ma=
ilto:angelo@amarulasolutions.com" tabindex=3D"-1">@Angelo Compagnucci</a>=
=C2=A0, any chance you could update your Lichee RV patches to the=C2=A0late=
st &quot;known&quot; goodies? :)<br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
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

--0000000000002b62f305efa453c0--

--===============0528115436597793421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0528115436597793421==--
