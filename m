Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6178C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:29:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7735560FE6
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7735560FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D33160034;
	Wed, 18 Aug 2021 13:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgbtFoGGS96T; Wed, 18 Aug 2021 13:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF4A606F2;
	Wed, 18 Aug 2021 13:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C92C1BF287
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88F6780DB8
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8D8HGPPQ2lvm for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 13:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAE7680D96
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 13:28:57 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id z20so5047521ejf.5
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3uptr+QU/V1xgY8HOvzmtJLAiStxpxP35f8iRX6EjkI=;
 b=Onf1SCQkCCDG/8Sco8TXXp8e5eZRwhcZ/Chjyvz1JLZqWJdteeIg/HbHXIcKW+erR6
 Fs4tefZt3XsRO/QkjfKYSlRvwADqlRcDF7zJWAZM61aCXr2vmhGCCICVGJYo/vtDMoBO
 H47Sv4Rg8JFKRJPHLvA2+cgSjC5GpS98OEkt0wuxvRyJlqtvx8BXnIwZnHWXcls1hgnm
 baJ/GCdJBA3p2dK3VuFaXssZbA8Z+ArTIZTfD0hBIJMxCmYa7fUlBj00rrCX0/OhoYPz
 oSU/n/Kg7otB5qJ4lp5UgqNPNNJNyliHKzSM+ryqCuuhCiQ1lq8g8dQ9J/kg23qmtld+
 U+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3uptr+QU/V1xgY8HOvzmtJLAiStxpxP35f8iRX6EjkI=;
 b=h6aan9z4aOBH2Ja0zsTtLbQTFJau5ezj5LPN+C/45QeOUkPUWI7SF7W85PrenD7YsM
 cOnPLoyLUZ3QTmdqH65TxFqgCn3a6ueQX8t0jL09798EjeStz36JeiaLZ09IFgg0GQJK
 1dYGO4k+d/eoPO/rO0gxmoYrN+22HsO7E+lplVc5rJRnkD6AfEAGRHBovBmMCl2LXvy7
 TnDcLLrctuv+nwsxRA3IkmcwOApw5rcancqObD0V7V9q3Wg6jInB73OFvK+mTi2Es3cC
 7FZmxl6fgAxeuNU77gXKiHrHk5Tv8sqkiTepOWWq9PRLWPxLE5Om/bRuulGQEbNWl8Qt
 eJ2A==
X-Gm-Message-State: AOAM533r4cpdi1+KSVdm1k5U1vD9KqDp1H36YXjD+TakN36p1tf/s7xe
 2ZF4HLwHLx/BCIeqaPIcsbbeR6kPECiSsx+I59o=
X-Google-Smtp-Source: ABdhPJwu1dDRV/eeOP/4dHeALq6wVNHnLy0ztYNEh0wJ48bEPzW2WZAFSGb6RA1dbDb1No/AGciI89FMi2P0Malw89o=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr9922724ejf.85.1629293335979; 
 Wed, 18 Aug 2021 06:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAMF_Hqkdoregortj-vDGDUoDThEQemdUcXn36x9z1oweUvbyUA@mail.gmail.com>
 <09721949-64a8-969d-db9b-c9b66e991dd0@heine.tech>
In-Reply-To: <09721949-64a8-969d-db9b-c9b66e991dd0@heine.tech>
From: =?UTF-8?Q?Honor=C3=A9_Julien_Abijuru?= <abijul001@gmail.com>
Date: Wed, 18 Aug 2021 15:28:44 +0200
Message-ID: <CAMF_Hq=XpMOuK61NLCkNdC8vzaTURwR0rujFtgeXwU0cbJANAQ@mail.gmail.com>
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@busybox.net
Subject: Re: [Buildroot] [Bluez] Bluez5 utils/tools not found
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
Content-Type: multipart/mixed; boundary="===============3877924887166062750=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3877924887166062750==
Content-Type: multipart/alternative; boundary="00000000000086a98805c9d56ab6"

--00000000000086a98805c9d56ab6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Micheal,

Thanks for the reply. I already enabled the CLI client but I still can't
find bluetoothctl.

When I type in my target command line :
#bluetooth
I get : -/bin/sh: bluetoothctl: not found

In fact, I don't have any bluez tool, util or client in my target.

Regards,

Le mer. 18 ao=C3=BBt 2021 =C3=A0 15:13, Michael Nosthoff <buildroot@heine.t=
ech> a
=C3=A9crit :

> Hi,
>
> On 18.08.21 15:05, Honor=C3=A9 Julien Abijuru wrote:
> >
> > Hello,
> >
> > I'm using buildroot to develop an embedded system that uses bluetooth
> > and for that I enabled bluez5-tools and bluez5-utils. I got the images
> > for my target but when I test them I have any blueZ util/tool.
> > Especially I want the bluetoothctl command line tool.
> >
> the option BR2_PACKAGE_BLUEZ5_UTILS_TOOLS installs
> bluemoon, btattach, hex2hcd, l2test, l2ping, mpris-proxy, rctest
>
>
> If you need bluetoothctl you have to select
> BR2_PACKAGE_BLUEZ5_UTILS_CLIENT ("build CLI client").
>
>
> Regards,
>
> Michael
>
>

--00000000000086a98805c9d56ab6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Micheal,<div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks for the reply. I already enabled the CLI client but I still can&#=
39;t find bluetoothctl.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
When I type in my target command line :</div><div dir=3D"auto">#bluetooth</=
div><div dir=3D"auto">I get : -/bin/sh: bluetoothctl: not found</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">In fact, I don&#39;t have any bluez=
 tool, util or client in my target.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Le mer. 18 ao=C3=BBt 2021 =C3=A0 15:13, Michael N=
osthoff &lt;buildroot@heine.tech&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi,<br>
<br>
On 18.08.21 15:05, Honor=C3=A9 Julien Abijuru wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m using buildroot to develop an embedded system that uses blueto=
oth <br>
&gt; and for that I enabled bluez5-tools and bluez5-utils. I got the images=
 <br>
&gt; for my target but when I test them I have any blueZ util/tool. <br>
&gt; Especially I want the bluetoothctl command line tool.<br>
&gt;<br>
the option BR2_PACKAGE_BLUEZ5_UTILS_TOOLS installs<br>
bluemoon, btattach, hex2hcd, l2test, l2ping, mpris-proxy, rctest<br>
<br>
<br>
If you need bluetoothctl you have to select <br>
BR2_PACKAGE_BLUEZ5_UTILS_CLIENT (&quot;build CLI client&quot;).<br>
<br>
<br>
Regards,<br>
<br>
Michael<br>
<br>
</blockquote></div>

--00000000000086a98805c9d56ab6--

--===============3877924887166062750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3877924887166062750==--
