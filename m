Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C072DC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 18:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48FDB40882;
	Sun,  4 Dec 2022 18:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FDB40882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9XfoW7QKyG9; Sun,  4 Dec 2022 18:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FB844086C;
	Sun,  4 Dec 2022 18:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB844086C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB211BF2BF
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56A4A4086C
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A4A4086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1vb_Sj469zg for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 18:28:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 451384056A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 451384056A
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 18:28:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id qk9so5200081ejc.3
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 10:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QyDvf77forEPMAofGoSLrjYSP9pxz/zB3xXotCSuBGw=;
 b=Ib+2150GeZgTSiVSb05tO1iZGpZeK1OTO4Jp6BNwUMrNz9Su1apEurDe6RxOzvtG3M
 euGM6G+h6yM3a14JVLU6Di+1WGhyOO6BOe9a8ZyApNpDsfjGPFvGnay5CmPJNQ3IJGM1
 WXlEvjGPz5VKgL/Qk1Sn91pWCER4+lEADqiYCrd3r6NiQ9XWQ1u+kag4bWcdnL0sT5kY
 RRd0luAddQr+In8uDkhYmb3UnoB9N4vnRvU4U8umGoel7p+1VY9ZBa/x1w+XM0Df09kR
 phUDngX4WEQwYAYEIfZ7Up17ckzxryxxaCS/3sbH/k5ANqUDPf262B6yH3nXoFyRyM81
 JQsQ==
X-Gm-Message-State: ANoB5pl+jn1z02ZOlSugqiaqLh17T5OavHpwDSWzI3TS6IDbYGFiOfpJ
 QV7V9Mk1V/u1Xj/y/3mvT2WLc0f68W98CqPlfks565kZQFJlow==
X-Google-Smtp-Source: AA0mqf5IFTh8Z80KIPK013J2SvnDpajQF7y/SQPsM9nsb5wotGEFTnJIsMuar6969ho+5PWO7i34G1nXBkq8kQJJA9g=
X-Received: by 2002:a17:906:a259:b0:7ad:ccae:a30d with SMTP id
 bi25-20020a170906a25900b007adccaea30dmr53687299ejb.704.1670178514210; Sun, 04
 Dec 2022 10:28:34 -0800 (PST)
MIME-Version: 1.0
References: <CA+fTLhj4PubMRELghtEYVCW3Q3FvEjK=mL=fOxdGNE_Jia6aOw@mail.gmail.com>
 <CADvTj4obUchFLqXjWxQydTHc1FJLNA3y90RZ=FOQsceFOSuhdw@mail.gmail.com>
 <CA+fTLhgzznFVkSGXGhR5S_ik2K0RA_wRve1PF0FaogexfmH3tg@mail.gmail.com>
 <874jub85sf.fsf@dell.be.48ers.dk>
In-Reply-To: <874jub85sf.fsf@dell.be.48ers.dk>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 4 Dec 2022 20:28:23 +0200
Message-ID: <CA+fTLhjEPcDr=bh3aFWBm4j4a3Th-=bLY99UYnbQVVnsRvm1uw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QyDvf77forEPMAofGoSLrjYSP9pxz/zB3xXotCSuBGw=;
 b=Y9g12xlYicSFpmgWAYRq7l7ZJxvU22WwXf7COkYkxJiQUgje7o2RHLn7r60F+yQuXw
 W5p2xZIBj7KHWO3dJshRc4t6r7/i53Lw92xwMeTyd3G/h4srHPDosvQm5fbuFpbAZSOi
 8MSnE0IK+oo8dP1KDwFEksLiGxiRWOxSqJPKMUz2F1HzqpDd85UCxASQfvdSfb4xqCOW
 TEHfk1HvUtN74dmfVU19pqPlmZy0MSBsiGjaomxpbHzbd+1X3Gj+DMyGy3qYNXs19sgd
 eHTK2TrtGMRp9u+SYVwH1N8fY4yXsO7TOiEvyoNd+sVw+56xcs0geUrPcXaq++jhq8Ur
 YXnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y9g12xlY
Subject: Re: [Buildroot] python 3.10.8 pip module seems to be broken in rc3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6454622174332407949=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6454622174332407949==
Content-Type: multipart/alternative; boundary="0000000000000d112c05ef04bd94"

--0000000000000d112c05ef04bd94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Peter Korsgaard (<peter@korsgaard.com>) kirjutas kuup=C3=A4eval P, =
4.
detsember 2022 kell 18:58:

> >>>>> "Indrek" =3D=3D Indrek Kruusa <indrek.kruusa@gmail.com> writes:
>
> Hi,
>
>  >> Maybe needs to select:
>  >> BR2_PACKAGE_PYTHON3_PYEXPAT
>  >>
>
>  > Somehow I missed that option. Yes, it fixes the problem.
>
> How did you end up with pip without python3-pyexpat?
>
> python-pip selects python3-setuptools (and ssl), and python3-setuptools
> selects pyexpat (and zlib).
>

I think I configured the build for python3, built the whole package and
later added python-pip from menuconfig. I can re-test.



>
> --
> Bye, Peter Korsgaard
>

--0000000000000d112c05ef04bd94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Kontakt Peter Korsgaard (&lt;<a href=
=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt;) kirjutas kuup=
=C3=A4eval P, 4. detsember 2022 kell 18:58:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Indrek&quot; =3D=3D =
Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_bla=
nk">indrek.kruusa@gmail.com</a>&gt; writes:<br>
<br>
Hi,<br>
<br>
=C2=A0&gt;&gt; Maybe needs to select:<br>
=C2=A0&gt;&gt; BR2_PACKAGE_PYTHON3_PYEXPAT<br>
=C2=A0&gt;&gt; <br>
<br>
=C2=A0&gt; Somehow I missed that option. Yes, it fixes the problem.<br>
<br>
How did you end up with pip without python3-pyexpat?<br>
<br>
python-pip selects python3-setuptools (and ssl), and python3-setuptools<br>
selects pyexpat (and zlib).<br></blockquote><div><br></div><div>I think I c=
onfigured the build for python3, built the whole package and later added py=
thon-pip from menuconfig. I can re-test.</div><div><br></div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--0000000000000d112c05ef04bd94--

--===============6454622174332407949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6454622174332407949==--
