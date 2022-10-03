Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF616C433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3892260D50;
	Mon,  3 Oct 2022 15:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3892260D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhvXT4zVIz8U; Mon,  3 Oct 2022 15:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A9D660D4D;
	Mon,  3 Oct 2022 15:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A9D660D4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8981BF398
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E3E82F77
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E3E82F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dkjmQKcKrbrK for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:25:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8B8482C99
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8B8482C99
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:25:57 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 10so17128044lfy.5
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7icAkVzj6fCb1mB6uBkpV/3EEP9o4GrwHGW559qBDU0=;
 b=pw4ZqMpPvcv/NcifWZbQSWbhQgjCeybbCMdMXb6J3rzGLrXly1YKlaNVIdGljW1Lnz
 eRjhgPpEi3RoZuZBmDqovl9na9aEBbasqgZ2v31vqGc3gPB0ozQXH+YJki4yq698WzCO
 zevwCzFI48RE3ssIUQMSaZ2eJZVqdiF5GqdbZt+C/yb1iNlrSdyrDruYOsxyPX1HxUoA
 TVLq6fupgZL8Yztv4gW5vXvvtUSmoXJYxg1NXv86YUHKv6RiITK/n54/+wVdIXcFDKVE
 vla0LCjOtZRrWKwmNTEh5VWyvR340Hxo03U0YrWAz5qImahwuP1KJ3usSoUSpdSEjLlo
 BE2A==
X-Gm-Message-State: ACrzQf0Gzs8OkDEr3zAO97xkZsTAb+15GMWBKxJttUM57FSptDQ8NqZi
 UFcj1GI3vPEGKkzwIDV2YlqwlpxnZg8tq5VhVUGMoQ==
X-Google-Smtp-Source: AMsMyM5v5dFyhPt6Leh5Z1C6s3LgedOS0z66lxVWssxj95ZaI2ZlfHVgjyEmZ4DUnxTnAVfQf8e5QX9rH7IK14Bszi8=
X-Received: by 2002:a19:f701:0:b0:4a2:29fd:7a9d with SMTP id
 z1-20020a19f701000000b004a229fd7a9dmr3160813lfe.500.1664810755732; Mon, 03
 Oct 2022 08:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220925160320.80027-1-angelo@amarulasolutions.com>
 <20220925214143.05ba673a@windsurf>
In-Reply-To: <20220925214143.05ba673a@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 3 Oct 2022 17:25:18 +0200
Message-ID: <CA+_SqVbs4_tPr4y9kMCP0f9dsjxO5bX48zvz45ABynfpbVzaEA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7icAkVzj6fCb1mB6uBkpV/3EEP9o4GrwHGW559qBDU0=;
 b=qQ4Kp8LUOFn2bWxWWH9nVbIwohibxiCuPP3dekQ9Mn3gEIhh6xEPK/Hr4oIM6uVDTP
 +Atzl/bGRIbqToP5YOUm8zsqkpsEJGJISVpzywhKWAARjv/1ev5TYxH0dAnasoLdKh0y
 OLvjkmqgMMFY/x+XKaHtl1rD54JHJL7dp3eN8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qQ4Kp8LU
Subject: Re: [Buildroot] [PATCH] docs/website: fixing js for the new feed
 source
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
Content-Type: multipart/mixed; boundary="===============6722438883441947182=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6722438883441947182==
Content-Type: multipart/alternative; boundary="000000000000b6d47105ea22f528"

--000000000000b6d47105ea22f528
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 25, 2022 at 9:41 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Angelo,
>
> On Sun, 25 Sep 2022 18:03:20 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > Feed source is moved to a local atom file available on the web server to
> > remove further problems with unreliable feed sources.
> > Moving the feed required a bit of refactor of the load_activity function
> > so it won't download two times te same url.
> >
> > This change requires a cron job like this enabled on the website:
> > * * * * * wget -O new.atom https://lore.kernel.org/buildroot/new.atom
>
> Thanks a lot for working on this. Based on the cron job like that you
> propose, I can see how this can fix the list of last e-mails on the
> mailing list, but how can that fix the other box visible on the web
> site, which lists the latest commits ?
>

This feed mixes commit/non commit entries, so the choice on which box fill
up is in the js code.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


-- 

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

--000000000000b6d47105ea22f528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 9:41 PM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Angelo,<br>
<br>
On Sun, 25 Sep 2022 18:03:20 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; Feed source is moved to a local atom file available on the web server =
to<br>
&gt; remove further problems with unreliable feed sources.<br>
&gt; Moving the feed required a bit of refactor of the load_activity functi=
on<br>
&gt; so it won&#39;t download two times te same url.<br>
&gt; <br>
&gt; This change requires a cron job like this enabled on the website:<br>
&gt; * * * * * wget -O new.atom <a href=3D"https://lore.kernel.org/buildroo=
t/new.atom" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/bu=
ildroot/new.atom</a><br>
<br>
Thanks a lot for working on this. Based on the cron job like that you<br>
propose, I can see how this can fix the list of last e-mails on the<br>
mailing list, but how can that fix the other box visible on the web<br>
site, which lists the latest commits ?<br></blockquote><div><br></div><div>=
This feed mixes commit/non commit entries, so the choice on which box fill =
up is in the js code.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
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

--000000000000b6d47105ea22f528--

--===============6722438883441947182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6722438883441947182==--
