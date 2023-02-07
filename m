Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E95C64EC4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDF2881E80;
	Tue,  7 Feb 2023 20:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF2881E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imwyfMRtXu6G; Tue,  7 Feb 2023 20:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054FE81E50;
	Tue,  7 Feb 2023 20:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 054FE81E50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5C651BF470
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 20:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C4E961050
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 20:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C4E961050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VGAXb9Cpri5 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 20:51:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8924C6104F
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8924C6104F
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 20:51:19 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso4617726oti.10
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 12:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QzjGoTPSnwf7P3wdRhw2G8mPoAE3KZkEk7wtuLDLJdo=;
 b=2FefOr1cgZtymhqQNVrkxAHYd2qjhjw5Xt0KWGK/XJhYYBk/Se3MDQ38g2SiYFfqqI
 ddB4XNyeC4ygcQ7sZwXA2nODeAB+TV/ZMUMURGra9/bSKFDC/6uVCjuTggk2JF/QeIhL
 qgR8Qor0+0PABzhYFECIXnwQZZbWt/9yYvf0V1ozXdjKVA9BrKKz5txpGLWTznWSfIgP
 QQCQNJBhowAUnL8C+0mVrc9JWKqf5idKSfeKgpnRaC0FSZ6J4GtnWEfAzRIvbudQUbmK
 aMxzZwkxCCwfAY6uAqL0NOE8zsOfs1eAZKlrqllw7/dj9WWORJEoGtcOs7weYcyqgXre
 aDTw==
X-Gm-Message-State: AO0yUKXYMTtV0SPVVyDQr1WeaWsVtKP6UKBD05+Aongn6J23UvL4w+m4
 DddGQWPir8YQ+GVEWSNX8Z/KoFgLhhKllvFkmCnSNSypeSnG1QhiAn+vAw==
X-Google-Smtp-Source: AK7set/JGUkCyonY8Z58TuqqpdR/lwHQwzzXzyHo06vIOTUabj08zsEGr9dw01xfLcJZdWFpdmaK9YwgqafqyFOuWmM=
X-Received: by 2002:a05:6830:26f4:b0:68d:3e14:7516 with SMTP id
 m52-20020a05683026f400b0068d3e147516mr444670otu.72.1675803078395; Tue, 07 Feb
 2023 12:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20230207175116.3043006-1-angelo@amarulasolutions.com>
 <51fbd11a-26ef-78fa-3ced-61648adc5a9f@smile.fr>
 <46eeb5ff-ea1e-acdd-3ab8-3dc945c9fa40@flatmax.com>
In-Reply-To: <46eeb5ff-ea1e-acdd-3ab8-3dc945c9fa40@flatmax.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 7 Feb 2023 21:50:41 +0100
Message-ID: <CA+_SqVb0wRKk9zFsy0-z8TzooKG4dPzOLPt1AJ7KPoWHkeQyQg@mail.gmail.com>
To: Matt Flax <flatmax@flatmax.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QzjGoTPSnwf7P3wdRhw2G8mPoAE3KZkEk7wtuLDLJdo=;
 b=VqPKfkprvlpM6G2S8UNrI0SQssCcMSxpE8rl5RFg5NFMljpvutG628G/t6QZwWqY0q
 eheA//aCjuHoyDp6TmE9tF1R00+m5sd9OfAXwSA3F2CN8oEA9OF6/I0SoiLdZ7bUWKFz
 w5gKPADb20u+IID0VhsUvymwbpb1lAvwTgZp0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VqPKfkpr
Subject: Re: [Buildroot] [PATCH v4] package/gtkiostream: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2607952523725492394=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2607952523725492394==
Content-Type: multipart/alternative; boundary="000000000000339f6b05f4224f44"

--000000000000339f6b05f4224f44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2023 at 9:47 PM Matt Flax <flatmax@flatmax.com> wrote:

>
> On 8/2/23 05:04, Romain Naour wrote:
> > Hello Angelo,
> >
> > Le 07/02/2023 =C3=A0 18:51, Angelo Compagnucci a =C3=A9crit :
> > It always useful to use distribution packaging to find any missing
> dependencies
> > (mentatory or optional) like gtk2 (hence the package name :) )
> >
> > https://github.com/flatmax/gtkiostream/blob/master/debian/control#L14
> >
> > Can you double check ?
>
>
> Hey all, great to see my original patch revitalised after many many
> months - I am keen for gtkiostream to be absorbed into buildroot.
>
> gtk2 and gtk3 are optional with this library - despite its name - it is
> really now focused on signal processing, ALSA C++, neural networks,
> software engineering, etc.. The gtk side of things works nicely with
> gtk2 but requires attention for gtk3 - I originally opted to leave
> gtk2/3 out entirely in buildroot - I think it is the best solution for no=
w.
>

Thanks Matt for the very clear explanation, I was about to reply gtk is
optional.

Even more because it requires the addition of libgtkdatabox which is
actually not present in buildroot.

Looking at the code, It's not clear if opencv or sox are really that
necessary without a gui, but I think we could leave them out.


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

--000000000000339f6b05f4224f44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 7, 2023 at 9:47 PM Matt F=
lax &lt;<a href=3D"mailto:flatmax@flatmax.com">flatmax@flatmax.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 8/2/23 05:04, Romain Naour wrote:<br>
&gt; Hello Angelo,<br>
&gt;<br>
&gt; Le 07/02/2023 =C3=A0 18:51, Angelo Compagnucci a =C3=A9crit=C2=A0:<br>
&gt; It always useful to use distribution packaging to find any missing dep=
endencies<br>
&gt; (mentatory or optional) like gtk2 (hence the package name :) )<br>
&gt;<br>
&gt; <a href=3D"https://github.com/flatmax/gtkiostream/blob/master/debian/c=
ontrol#L14" rel=3D"noreferrer" target=3D"_blank">https://github.com/flatmax=
/gtkiostream/blob/master/debian/control#L14</a><br>
&gt;<br>
&gt; Can you double check ?<br>
<br>
<br>
Hey all, great to see my original patch revitalised after many many <br>
months - I am keen for gtkiostream to be absorbed into buildroot.<br>
<br>
gtk2 and gtk3 are optional with this library - despite its name - it is <br=
>
really now focused on signal processing, ALSA C++, neural networks, <br>
software engineering, etc.. The gtk side of things works nicely with <br>
gtk2 but requires attention for gtk3 - I originally opted to leave <br>
gtk2/3 out entirely in buildroot - I think it is the best solution for now.=
<br></blockquote><div><br></div><div>Thanks Matt for the very clear explana=
tion, I was about to reply gtk is optional.</div><div><br></div><div>Even m=
ore because it requires the addition of libgtkdatabox which is actually not=
 present in buildroot.</div><div><br></div><div>Looking at the code, It&#39=
;s not clear if opencv or sox are really that necessary without a gui, but =
I think we could leave them out.<br></div></div><br clear=3D"all"><br>-- <b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap"></span><span style=3D=
"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-c=
olor:transparent;font-weight:500;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre-wrap">Angelo Compa=
gnucci</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono=
&quot;,monospace;color:rgb(0,0,0);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">Software Engineer</span></p><p dir=3D"ltr=
" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0=
,0);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wr=
ap"><a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo=
@amarulasolutions.com</a>=C2=A0<br></span><span style=3D"font-size:10pt;fon=
t-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(241,194,50);background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre-wrap">__________=
________________________</span><span style=3D"font-size:10pt;font-family:&q=
uot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"=
font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-weight:500;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre-wrap">Amarula Solut=
ions SRL</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mo=
no&quot;,monospace;color:rgb(0,0,0);background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre-wrap">Via le Canevare 30, 31100 Treviso, Vene=
to, IT</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono=
&quot;,monospace;color:rgb(0,0,0);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">T. +39 (0)42 243 5310</span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mo=
no&quot;,monospace;color:rgb(0,0,0);background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions=
.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"l=
tr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a href=3D"h=
ttp://www.amarulasolutions.com/" style=3D"text-decoration:none" target=3D"_=
blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mo=
nospace;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre-wrap">www.amarulasolutions.com</span></a></p><div>[`as] =
<a href=3D"https://www.amarulasolutions.com" target=3D"_blank">https://www.=
amarulasolutions.com</a>|</div></div></div></div>

--000000000000339f6b05f4224f44--

--===============2607952523725492394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2607952523725492394==--
