Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EECFCD0CC
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 07:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB99A41033;
	Wed, 18 Mar 2026 07:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIBQVRLM2zaq; Wed, 18 Mar 2026 07:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D26F940FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773820768;
	bh=S5XGwabmh7B76suubTvnGijKp6ySd8GrWhSdTaTMZYQ=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BUKCYk7AF84nyanHEZ03cVUYeso34FOeHMT755gteGit5Sst3nBKLVKRF2gCVnPyO
	 tDzf7CzDcl0gw+ELBcecqQIZKWY5WPSGSSiI+xZjltt3k2wfZRWqQWAGY8Ry3odd9b
	 DJdgqD60Rf8BAghrPeYY8i6iRRP3KmD6ZZI16rdFWMInN23R9h8avZ5ye38KpbQqe0
	 zxGFIMdkjI62Kvf/BVcka8JoB3xrlksYq0L5ZcmF6J4y3plit3/WJNzZ71o1iH6SXJ
	 5Y93XqI3OdLVBD/ECcVFkZvyY1ALniVDPXSoA1yatDj95wVLu9n2nntS+Gb/cGNYfP
	 wrN/ySPC6j6Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26F940FDB;
	Wed, 18 Mar 2026 07:59:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0249BD3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E844E819ED
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59m55V9TNVVV for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 07:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9900081975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9900081975
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9900081975
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:59:25 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5a27c329e98so69979e87.3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 00:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773820763; cv=none;
 d=google.com; s=arc-20240605;
 b=IZXEBMSL688TZAsIPcmt1DU6p03S718CV4IKehlWgTaR8yWHhZ7Stp19YZvrOd7t+O
 7wJFruoLSPXnJ6T4CNW8mta/sdRAUQMp+FPuq0ai2YUnALrQ+BEjBkEvx65WLXLz1k1A
 /zzBcS0jkI5IaXBMOsd/F44/CfWmx7o3GXE2Qy0O2adLpTtAbzsdZq247Sd8Zkffw7aK
 Ty4b8ZwY9aoVngXwNOt3v05L+bwboBh//gqh0yBT9YChxIljHAA54LpSAIxGj+CczzQd
 rcEWILwMzHf4r8XeVxlTEKg9WXCrdpejUAIG+T8bceg2/jPqa9dzORSquPg5u1iqH07P
 anlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TA4l5b3IQNeCOkYwn/Mpdk/T8+3BhUOSmQrIpYnwbtY=;
 fh=K/ZOaBImRNCltostvg/psi+VG4gm3hYz0ZqqpS4tHQQ=;
 b=Z1H0IdQwZarO2htq9YrLSsz+RMLB8ZFb69x3mQSnayr6bAvMVDlDLuBzgyW2Aj1GwG
 chAHRwCh75VTR4Z/q7pZ2qxap7uYniyeG0Fw45u7KlBUiK+KMv/c3X9JdaDFP/w3au4j
 ypj7q5nm9xeVJLexCoQbv9zU60UyD+VD8t146tE8v5oq+u0kwRvthmroh7IfDwcFGkV/
 Zk8MS8MojRh+j+A3JFO7G6Rh0lSaVewbXzRmqhsS00KScXjTx3b6n5jSySrFKvSAC6wk
 xsmg9yPA7yEL4TjmxWjAjMDSuu1dgoFe/ilXJP/RMVoNlCqw++m3Wukgr9rSTuuGTzF1
 omag==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773820763; x=1774425563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TA4l5b3IQNeCOkYwn/Mpdk/T8+3BhUOSmQrIpYnwbtY=;
 b=gr+QnONpvAsdluO3R/n60ul6OaeUit3WAgT7Th/8+TIdKkRSoqsHR3uAAsAvShueLt
 vyg61JLGZHMdco0ZPogvYXAcVmdLMQnz+lOAaimeZMI5wQZz9l3EbIjPeaf4F4e2VTdk
 6l6VErj/yMSo0w9+1rtkVuBJf4SH64QwJ937U8kGhKvTDoLzSfSKKM8h7XCV1ENur57q
 y6J5HMZEcwowslXUFWGGS9DdqXx/BeQ5ZiZs5KKGQnFhKczWLOF2MKosl21B0RSu+Rhb
 4cWp84ZIcnMoj4P5918lJ+8Xd5+0lxzh2aOG91zKZrq3puDdE2WfVJTxSgHkacZXhP2Q
 K13g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrXZDyfCXFwpd2w5HJ/Dbo3GyVgK/yn6oLshq/DPl4LhxklcfV29MdcFEtbYXR7er0GII3iiXmyh0=@buildroot.org
X-Gm-Message-State: AOJu0YwbxMb3Ts+nZKLHOrRBbqPnDmBwATMDIh83dnpHicHbFc/yMbIy
 saaeHwHDBgbV8U4C1NCLyTmtzff12hFqcwinD+m9fzhhRZxpJit8rgEtVWHTZaIQnhY9kLgAKdw
 MNYOqE4HEGAYu0klHdZru9X6tXEfZ5+16qnq7S3QXzw==
X-Gm-Gg: ATEYQzxGKKFyTS1SsFXX7wB5G1iRtbZ0mFs/GpbXSSfloqNa/MS0BE0xwKSi33YAGY5
 q16nGZTvLfBcPMMqiXjAT3Qs0ews8yIC/hK1XRnfufPZ8U2i+FlYeR1LUGd/NeARikO9onvzsYB
 ZDdj+ZWHc2AECv/SOD6uxlaM9zjMwt3yFWpumWpg9soP4BzwvvRNLgCTVpPlATMyNk0ePCADSMf
 UIZa6DqPeI5NuckVB6ykknQDEwypmF71n44ammT12tVnRv0WbqTYX/vFBGSOkFWWMe9IREHoG4O
 31i1fCdaTSc/HGvpg4VLOSxj8LtJtstrcAiSFxI=
X-Received: by 2002:a2e:ab83:0:b0:38a:a2b:5ef7 with SMTP id
 38308e7fff4ca-38bd57d7b1emr10806641fa.15.1773820762706; Wed, 18 Mar 2026
 00:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260314230517.4160-1-christian@aperture.us>
 <CA+h8R2pwVXFuwypxSipO0MVQK0Bpoo_PunWUu49kZSqZGfh-Lw@mail.gmail.com>
 <87eclhh9b1.fsf@dell.be.48ers.dk>
In-Reply-To: <87eclhh9b1.fsf@dell.be.48ers.dk>
Date: Wed, 18 Mar 2026 08:59:12 +0100
X-Gm-Features: AaiRm51OATIrQ0E1rvKYBR15USdO2nVl_7ux1OoIb1RCMii-CFYm1NbxTVezyAM
Message-ID: <CAKWtHtyudcRA9F6gioM4rzoYT2SzKb_kEEtkoteQvEpRcOZHtQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org, 
 Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773820763; x=1774425563; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TA4l5b3IQNeCOkYwn/Mpdk/T8+3BhUOSmQrIpYnwbtY=;
 b=KH8NBp3h/fu8z+L/kgpP5DwcgM8uG174v8FryG1hw3c4iO9Jt+GVWkVr1JU+Q5YI40
 i8IHEn6/YS248Wxzo9wLXAdxOtmsdZUHUyMceI8/aAekZWk74fpakRy3RwLzeh8gVusP
 7HOrEdRJaUw59eXn4FhtOqvg9K2/pdYx7Sf8c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KH8NBp3h
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: fix
 build with Linux 6.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Content-Type: multipart/mixed; boundary="===============6118459391249473979=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6118459391249473979==
Content-Type: multipart/alternative; boundary="00000000000074e775064d47d499"

--00000000000074e775064d47d499
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 mars 2026 =C3=A0 08:43, Peter Korsgaard <peter@korsgaard.com> a
=C3=A9crit :

> >>>>> "Christian" =3D=3D Christian Stewart <christian@aperture.us> writes=
:
>
>  > Hi all,
>  > There's now a deprecation message in the aircrack-ng repo:
>
>  >
> https://github.com/aircrack-ng/rtl8812au?tab=3Dreadme-ov-file#these-drive=
rs-is-deprecated
>
>  > Maybe we should drop the package and instead support this one?
>
>  > https://github.com/lwfinger/rtw88
>
> lwfinger, that must be Larry Finger who passed away in 2024:
>
>
> https://lore.kernel.org/linux-wireless/ds6wc3svkyre4p2rwg4f76o67xndazaeoy=
jwblhuzichscyxoz@5ttdvbymxr55/T/#mfd2f4928e0e013c10375ca766035c1385e18f8e0
>
> Given that it is a backport from the Linux kernel tree, do we really
> need it? The rtl8812au support seems to have been added by commit
> 4f8ec8927bc292b2a (v6.13-rc1).
>
> Hi all,

I have created for a client the recipe for the rtw88 driver with firmwares
installation.

I can send patch if you want to support Realtek cards with kernel older
than v6.13

Fabien


> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000074e775064d47d499
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 18=
 mars 2026 =C3=A0=C2=A008:43, Peter Korsgaard &lt;<a href=3D"mailto:peter@k=
orsgaard.com">peter@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Ch=
ristian&quot; =3D=3D Christian Stewart &lt;<a href=3D"mailto:christian@aper=
ture.us" target=3D"_blank">christian@aperture.us</a>&gt; writes:<br>
<br>
=C2=A0&gt; Hi all,<br>
=C2=A0&gt; There&#39;s now a deprecation message in the aircrack-ng repo:<b=
r>
<br>
=C2=A0&gt; <a href=3D"https://github.com/aircrack-ng/rtl8812au?tab=3Dreadme=
-ov-file#these-drivers-is-deprecated" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/aircrack-ng/rtl8812au?tab=3Dreadme-ov-file#these-drivers=
-is-deprecated</a><br>
<br>
=C2=A0&gt; Maybe we should drop the package and instead support this one?<b=
r>
<br>
=C2=A0&gt; <a href=3D"https://github.com/lwfinger/rtw88" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/lwfinger/rtw88</a><br>
<br>
lwfinger, that must be Larry Finger who passed away in 2024:<br>
<br>
<a href=3D"https://lore.kernel.org/linux-wireless/ds6wc3svkyre4p2rwg4f76o67=
xndazaeoyjwblhuzichscyxoz@5ttdvbymxr55/T/#mfd2f4928e0e013c10375ca766035c138=
5e18f8e0" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linu=
x-wireless/ds6wc3svkyre4p2rwg4f76o67xndazaeoyjwblhuzichscyxoz@5ttdvbymxr55/=
T/#mfd2f4928e0e013c10375ca766035c1385e18f8e0</a><br>
<br>
Given that it is a backport from the Linux kernel tree, do we really<br>
need it? The rtl8812au support seems to have been added by commit<br>
4f8ec8927bc292b2a (v6.13-rc1).<br>
<br></blockquote><div>Hi all,=C2=A0</div><div><br></div><div>I have created=
 for a client the recipe for the rtw88 driver with firmwares installation.=
=C2=A0</div><div><br></div><div>I can send patch if you want to support Rea=
ltek cards with kernel older than v6.13</div><div><br></div><div>Fabien</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Bye, Peter Korsgaard<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--00000000000074e775064d47d499--

--===============6118459391249473979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6118459391249473979==--
