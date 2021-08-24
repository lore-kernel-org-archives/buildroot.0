Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E32C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:26:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5784260F5C
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5784260F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296BA60723;
	Tue, 24 Aug 2021 07:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smkjTfITJBgA; Tue, 24 Aug 2021 07:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77BCF607EC;
	Tue, 24 Aug 2021 07:26:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFCF11BF31B
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCCE380C50
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItTFQnaDcmGI for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 07:26:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 737DD80D87
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 07:26:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id x11so42418096ejv.0
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t2sjg9cDFHZwcvqrAh2l+qlcePeNBFVGfhTE7efMMqo=;
 b=T8+Qp9Gw00PeDtf02ycMeACOlpb3meZL6LiR7P9bWJ7xrmt7vHSr2+lfe880sLkmEr
 I3UEI2TRiTXSchlcNPVNKZZpe65aaSfLW7dRL5SfuiP5i/IjtGBoY5i8YI/n10vDvs5Q
 oFeNf1UQ0Z13Z8/7M47jvAlkRddIlpj8v+1In2+fXAPyNwjInzJ8T1mJmP466f6ZoYOr
 75b7w9MufQWP1QXyqSkPZe8j8JOfqTMEHJLmiAy1eyOgyr0D2y1MtuGFglG/EMu7EE3J
 ntuTUR7HKd9s+Cyj34O8B/X7/oBRCCe0y6/W0007SVQO42STuHwwJZl/X0MQfJ2d1mc6
 C8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t2sjg9cDFHZwcvqrAh2l+qlcePeNBFVGfhTE7efMMqo=;
 b=BZTxb7HRSm2v06HUtjj2raKgBHPKngqwKUxGax3Qi1wj5m9G7/OKFuzumIWE6RGtAl
 wNRHf0Miy9PRoDEWMw+t/VIFUhsYMfoUtsc3O9ueilXHGfg9Vu2MYYmwxwnWC8tLVdTw
 LqhQQQB46WOnUApu/QN3NZ/IsiUJZKk7UOqhwmY79eTDTqdCDlOEkT8QcunrposLrwCO
 hx/hbJBC5HY1jXl4cNB5i1g2m60iit52watJFlldWaDR1Bw6pH+uiEONIpMmwvq3BVBZ
 IEKOb1QHXRoj2S1qX0EfcEAXnEUqsL//Lh2gnA/ecAJ1tEuIH3ggEIBv8QITSTphWgSt
 ENow==
X-Gm-Message-State: AOAM5302bToh6tMrsvcFxi/Dpk8fVlNAe3CTGdzDKIMsUJxvIpy27OO1
 SzUKIoiVG3KjGU0Q7ngFGqZzeWVyHOeFaM+dpQkvqc9mjFyzJOV7
X-Google-Smtp-Source: ABdhPJxM7Td2tnDaitxLrHdlpRAgBlOaM1qKf2A6kJ/zb9AEsNaIoL7fcKywFu1eCpXEKYNfGB6qhN2mceFDkvwHQwc=
X-Received: by 2002:a17:906:c05a:: with SMTP id
 bm26mr3100947ejb.498.1629789966630; 
 Tue, 24 Aug 2021 00:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210820112322.5762-1-jose.pekkarinen@unikie.com>
 <20210820233611.1d6d1c71@windsurf>
 <CAJPV9MqEN+zLtFw_70cK1CURFp87Nynt_bOhfxBfgVNnCdN+Qg@mail.gmail.com>
 <DM2P110MB0105E1F3F6C2D8D1E03AFFD1F2C49@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <DM2P110MB0105E1F3F6C2D8D1E03AFFD1F2C49@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 24 Aug 2021 10:25:55 +0300
Message-ID: <CAJPV9MoiqyrFQj9v_uGtK7EwdLb0VyhaKO6drKiuv_BBBcrxuQ@mail.gmail.com>
To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Subject: Re: [Buildroot] [External] Re: [PATCH v2] package/restorecond: Add
 new init script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1835970350257469502=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1835970350257469502==
Content-Type: multipart/alternative; boundary="00000000000005195105ca490c43"

--00000000000005195105ca490c43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 6:10 PM Weber, Matthew L Collins <
Matthew.Weber@collins.com> wrote:

> Yann / Jose,
>
> > From: buildroot <buildroot-bounces@busybox.net> on behalf of Jos=C3=A9
> Pekkarinen <jose.pekkarinen@unikie.com>
> > Sent: Monday, August 23, 2021 12:45 AM
> > To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: buildroot@buildroot.org <buildroot@buildroot.org>
> > Subject: [External] Re: [Buildroot] [PATCH v2] package/restorecond: Add
> new init script
> >
> > On Sat, Aug 21, 2021 at 12:36 AM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
> > Hello Jos=C3=A9,
> >
> > On Fri, 20 Aug 2021 14:23:22 +0300
> > Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
> >
> > > The current restorecond upstream init script is no
> > > good fit for the user space generated by buildroot,
> > > this script is an extension of the original, that
> > > brings some changes from the debian init script to
> > > use start-stop-daemon instead of daemon, while
> > > removing dependencies on /etc/rc.d/init.d/functions
> > > and /lib/lsb/init-functions.
>
> Oops, I was reviewing patches this morning and missed this one when I
> responded to the "autorelabel" email thread.
>
> I think the example script I referenced in that email is still the most
> basic way to do the boot fixup, however, it would be worth going through
> the upstream scripts/daemons to see if they are viable and fit the genera=
l
> criteria Buildroot projects might desire.  Some things that come to mind
> the upstream scripts would need to consider.
> - .autorelabel is different from handling all our memory-based filesystem=
s
> on each boot.  Does "fixfiles" cover this without requiring a .autorelabe=
l
> set?
> - No impact to boot time or requirement to run on first boot
> - read-only filesystem support (may need to tweak the scripts)
> - Additional Buildroot package dependencies to support "fixfiles" as is.
> Can we make the selection of this conditional on using ".autorelabel"?
>

Hi,

To ease the reading/tracking of the script

Matthew was refering to, here is the link.

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/1458128701-14841-1-git=
-send-email-niranjan.reddy@rockwellcollins.com/

Thanks!


Jos=C3=A9.

--00000000000005195105ca490c43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 23, 2021 at 6:10 PM Weber=
, Matthew L                            Collins &lt;<a href=3D"mailto:Matthe=
w.Weber@collins.com">Matthew.Weber@collins.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Yann / Jose,<br>
<br>
&gt; From: buildroot &lt;<a href=3D"mailto:buildroot-bounces@busybox.net" t=
arget=3D"_blank">buildroot-bounces@busybox.net</a>&gt; on behalf of Jos=C3=
=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" target=3D"=
_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; Sent: Monday, August 23, 2021 12:45 AM<br>
&gt; To: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.co=
m" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a> &lt;<a href=3D"mailto:buildroot@buildroot.org" targe=
t=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
&gt; Subject: [External] Re: [Buildroot] [PATCH v2] package/restorecond: Ad=
d new init script<br>
&gt;<br>
&gt; On Sat, Aug 21, 2021 at 12:36 AM Thomas Petazzoni &lt;<a href=3D"mailt=
o:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.=
com</a>&gt; wrote:<br>
&gt; Hello Jos=C3=A9,<br>
&gt;<br>
&gt; On Fri, 20 Aug 2021 14:23:22 +0300<br>
&gt; Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com"=
 target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; The current restorecond upstream init script is no<br>
&gt; &gt; good fit for the user space generated by buildroot,<br>
&gt; &gt; this script is an extension of the original, that<br>
&gt; &gt; brings some changes from the debian init script to<br>
&gt; &gt; use start-stop-daemon instead of daemon, while<br>
&gt; &gt; removing dependencies on /etc/rc.d/init.d/functions<br>
&gt; &gt; and /lib/lsb/init-functions.<br>
<br>
Oops, I was reviewing patches this morning and missed this one when I respo=
nded to the &quot;autorelabel&quot; email thread.<br>
<br>
I think the example script I referenced in that email is still the most bas=
ic way to do the boot fixup, however, it would be worth going through the u=
pstream scripts/daemons to see if they are viable and fit the general crite=
ria Buildroot projects might desire.=C2=A0 Some things that come to mind th=
e upstream scripts would need to consider.<br>
- .autorelabel is different from handling all our memory-based filesystems =
on each boot.=C2=A0 Does &quot;fixfiles&quot; cover this without requiring =
a .autorelabel set?<br>
- No impact to boot time or requirement to run on first boot<br>
- read-only filesystem support (may need to tweak the scripts)<br>
- Additional Buildroot package dependencies to support &quot;fixfiles&quot;=
 as is.=C2=A0 Can we make the selection of this conditional on using &quot;=
.autorelabel&quot;?<br></blockquote><div><br></div></div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Hi,</div><div><br></div></div></blockquote><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>To ease=
 the reading/tracking of the script</div></div></blockquote>Matthew was ref=
ering to, here is the link.<div><br></div><div>[1]=C2=A0<a href=3D"https://=
patchwork.ozlabs.org/project/buildroot/patch/1458128701-14841-1-git-send-em=
ail-niranjan.reddy@rockwellcollins.com/" rel=3D"noreferrer" target=3D"_blan=
k">https://patchwork.ozlabs.org/project/buildroot/patch/1458128701-14841-1-=
git-send-email-niranjan.reddy@rockwellcollins.com/</a></div><div><br></div>=
<div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>T=
hanks!</div></blockquote><div><br></div><div dir=3D"ltr" class=3D"gmail_sig=
nature"><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;borde=
r:none;padding:0px">Jos=C3=A9.</blockquote></div></div></div></div>

--00000000000005195105ca490c43--

--===============1835970350257469502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1835970350257469502==--
