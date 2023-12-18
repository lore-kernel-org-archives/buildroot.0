Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF53C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 17:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D90819B4;
	Mon, 18 Dec 2023 17:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D90819B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BY_l2CRoF01k; Mon, 18 Dec 2023 17:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3770819BC;
	Mon, 18 Dec 2023 17:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3770819BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39BED1BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12EE1819BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EE1819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inIbTZhd-kjL for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 17:28:16 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A651D819B4
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 17:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A651D819B4
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1ca24776c3so871167966b.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 09:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702920494; x=1703525294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sVNw1BL+rZEyz+1G90nO9JsY2gd6BZEUL8m26a5Jltk=;
 b=V6zidQReevgum+IFXvgUMSZ1ndbvfys2bb8IDvZ6bbmnE/7mRRXDUN8MQDeK9aB81Z
 Kq9pr2CxjV9sli7z/3ApmqpE01iR7LFUYBTJ9kSu/i5wYp2D6Deu35+F5V+YlWXhYuKX
 hroUOPm2BR6NJdCTROeYy360zCbJKcLWt14p6uEN9eFc5rUuq88jtuW4/eZacHg+GPpX
 l/9q840pbnTt7vCOj5Wv6Yy3dN7Dj7D16cB88mByq6KtZ/RJmK1+1+Jm/Clj+4NXpOMs
 btyX5cbRmSVReCbSfyYSxqKT63WUeFXRImdgm1RrX3IoiUyUxGrCh7hAYi7hg74HeySD
 YItQ==
X-Gm-Message-State: AOJu0YwKxWBZaXhRHnFPb35hegIiPL0dC+D0uVBnXQrlSdj1GIpiA9S2
 lO84eJUK2B51aCVZ+iuhV+QpzJa5g0VkcGFq7BhaLpGRsObJXd4b
X-Google-Smtp-Source: AGHT+IEmWIlXRAgpKGC2bcEjRsVBmtk7CA76A2hUWz6dpnv24K+vFGnQdrkRK2+4GKBopTQqrZuDwuu7v47yGaNOo70=
X-Received: by 2002:a17:906:20c3:b0:a1c:91eb:63cf with SMTP id
 c3-20020a17090620c300b00a1c91eb63cfmr18895026ejc.14.1702920493637; Mon, 18
 Dec 2023 09:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
 <ZYB_06OI-Kw5cC0Z@landeda>
In-Reply-To: <ZYB_06OI-Kw5cC0Z@landeda>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 18 Dec 2023 10:28:02 -0700
Message-ID: <CAHDQB6Oa1NHV0fO+kPBixsR-4zcCCH1f-fE-C+75Cb9pDJRcbg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702920494; x=1703525294;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sVNw1BL+rZEyz+1G90nO9JsY2gd6BZEUL8m26a5Jltk=;
 b=e3DgUtOmffTC9eUw3gbUcUVpfvhJgKkFV8B02jTczmI6pzHxebOKP3/e32AHWPfUsk
 mZKWuWZzIlui6nBIk9iehbMkqfxZb9UwzR4h2GT1KgKb/m4VmH/w9gfBI5eOboD2GLI+
 nUNRJEbiEicocNRE26AEaHHzxEnaZSHc5Lnr0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=e3DgUtOm
Subject: Re: [Buildroot] [PATCH v2 1/2]
 package/postgresql/postgresql.service: set locale for initdb to C
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3913157967682821502=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3913157967682821502==
Content-Type: multipart/alternative; boundary="0000000000001abdf6060ccc1325"

--0000000000001abdf6060ccc1325
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann;

I didn't add Peter as the patch is completely different than what he sent
along with a more
comprehensive explanation as to what is happening. If you want to add Peter
as a
co-author that is more than fine by me.

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Mon, Dec 18, 2023 at 10:22=E2=80=AFAM Yann E. MORIN <yann.morin.1998@fre=
e.fr>
wrote:

> Adam, Peter, All,
>
> On 2023-11-02 12:41 -0600, Adam Duskett spake thusly:
> > From: Peter Seiderer <ps.report@gmx.net>
>
> So, this patch is "From Peter", but...
>
> > Systemd creates a /etc/locale.conf file with LANG=3D"C.UTF-8". On boot,
> systemd
> > reads /etc/locale.conf and sets the LANG environment variable,
> > (see the locale_context_load_conf method in local-setup.c.)
> >
> > When initdb.c is called, a check for the LANG environment variable is
> called,
> > and if it is set to something other than "C" initdb attempts to load th=
e
> > corresponding LC_CTYPE file in /usr/lib/locale/. IE: If LANG is set to
> C.UTF-8,
> > then initdb.c attempts to load /usr/lib/locale/C.UTF-8/LC_CTYPE.
> However, these
> > files do not exist on a Buildroot system, and as such, initdb throws th=
e
> > following error on startup:
> >
> > ```
> > initdb: error: invalid locale settings; check LANG and LC_* environment
> variables
> > pg_ctl: database system initialization failed
> > ```
> >
> > To fix this issue, add "Environment=3DLANG=3DC" to the package provided
> > postgresql.service file to force Postgresql to use the C locale.
> >
> > Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>
> ... the first SoB is by Adam, and there is no SoB be Peter.
>
> In this case, I think I understand that Adam took Peter's patch, and
> totally rewrote it with an alternate solution. In such a case, the
> customs is to change the authorship to the new author, and keep a
> Co-developed-by tag to keep credits to the first author.
>
> So, if you can just reply to this mail stating I got things right, I can
> fix authorship and tags when applying. If I got things wrong, then
> please resubmit with proper tags and/or authorship.
>
> Also, it does not make much sense that the submitter of a patch adds
> their own Tested-By tag, as it is actually expected that the submitter
> did test what they sent...
>
> Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
> > ---
> > v1 -> v2:
> >   - Get to the root cause of the problem and provide a better
> explination of
> >     what is happening.
> >
> >   - Use Environment=3DLANG=3DC isntead of -o --locale=3DC
> >
> >  package/postgresql/postgresql.service | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/postgresql/postgresql.service
> b/package/postgresql/postgresql.service
> > index 539eea8964..c470c7181e 100644
> > --- a/package/postgresql/postgresql.service
> > +++ b/package/postgresql/postgresql.service
> > @@ -16,6 +16,10 @@ StandardOutput=3Dsyslog
> >  StandardError=3Dsyslog
> >  SyslogIdentifier=3Dpostgres
> >
> > +# Overwrite the LANG variable to prevent systemd from passing the LANG
> > +# environment variable set in /etc/locale.conf.
> > +Environment=3DLANG=3DC
> > +
> >  ExecStartPre=3D/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then
> /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
> >  ExecStart=3D/usr/bin/postgres -D /var/lib/pgsql
> >  ExecReload=3D/usr/bin/kill -HUP $MAINPID
> > --
> > 2.41.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--0000000000001abdf6060ccc1325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yann;<div><br></div><div>I didn&#39;t add Peter as the pat=
ch is completely different than what he sent along with a more</div><div>co=
mprehensive explanation=C2=A0as to what is happening. If you want to add Pe=
ter as a</div><div>co-author that is more than fine by me.</div><div><br cl=
ear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-he=
ight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;vertical-align:baseline;white-space:pre-wrap">Adam Duskett</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubunt=
u Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertic=
al-align:baseline;white-space:pre-wrap">Senior Embedded Systems Developer</=
span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;verti=
cal-align:baseline;white-space:pre-wrap">M. +1208-515-8102</span></p><p dir=
=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,m=
onospace;color:rgb(0,0,0);background-color:transparent;vertical-align:basel=
ine;white-space:pre-wrap"><a href=3D"mailto:adam.duskett@amarulasolutions.c=
om" target=3D"_blank">adam.duskett@amarulasolutions.com</a></span></p><p di=
r=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,=
monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:base=
line;white-space:pre-wrap">__________________________________</span></p><p =
dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:ba=
seline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-=
family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;vert=
ical-align:baseline;white-space:pre-wrap">Amarula Solutions BV</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:b=
aseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</=
span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;verti=
cal-align:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span =
style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color=
:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-spac=
e:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;verti=
cal-align:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolu=
tions.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=
=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bott=
om:0pt"><a href=3D"http://www.amarulasolutions.com/" target=3D"_blank"><spa=
n style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;col=
or:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-sp=
ace:pre-wrap">www.amarulasolutions.com</span></a></p><div><br></div></span>=
</div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 18, 2023 at 10:22=E2=80=AFAM Yann=
 E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@fr=
ee.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Adam, Peter, All,<br>
<br>
On 2023-11-02 12:41 -0600, Adam Duskett spake thusly:<br>
&gt; From: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net" target=
=3D"_blank">ps.report@gmx.net</a>&gt;<br>
<br>
So, this patch is &quot;From Peter&quot;, but...<br>
<br>
&gt; Systemd creates a /etc/locale.conf file with LANG=3D&quot;C.UTF-8&quot=
;. On boot, systemd<br>
&gt; reads /etc/locale.conf and sets the LANG environment variable,<br>
&gt; (see the locale_context_load_conf method in local-setup.c.)<br>
&gt; <br>
&gt; When initdb.c is called, a check for the LANG environment variable is =
called,<br>
&gt; and if it is set to something other than &quot;C&quot; initdb attempts=
 to load the<br>
&gt; corresponding LC_CTYPE file in /usr/lib/locale/. IE: If LANG is set to=
 C.UTF-8,<br>
&gt; then initdb.c attempts to load /usr/lib/locale/C.UTF-8/LC_CTYPE. Howev=
er, these<br>
&gt; files do not exist on a Buildroot system, and as such, initdb throws t=
he<br>
&gt; following error on startup:<br>
&gt; <br>
&gt; ```<br>
&gt; initdb: error: invalid locale settings; check LANG and LC_* environmen=
t variables<br>
&gt; pg_ctl: database system initialization failed<br>
&gt; ```<br>
&gt; <br>
&gt; To fix this issue, add &quot;Environment=3DLANG=3DC&quot; to the packa=
ge provided<br>
&gt; postgresql.service file to force Postgresql to use the C locale.<br>
&gt; <br>
&gt; Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolu=
tions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
<br>
... the first SoB is by Adam, and there is no SoB be Peter.<br>
<br>
In this case, I think I understand that Adam took Peter&#39;s patch, and<br=
>
totally rewrote it with an alternate solution. In such a case, the<br>
customs is to change the authorship to the new author, and keep a<br>
Co-developed-by tag to keep credits to the first author.<br>
<br>
So, if you can just reply to this mail stating I got things right, I can<br=
>
fix authorship and tags when applying. If I got things wrong, then<br>
please resubmit with proper tags and/or authorship.<br>
<br>
Also, it does not make much sense that the submitter of a patch adds<br>
their own Tested-By tag, as it is actually expected that the submitter<br>
did test what they sent...<br>
<br>
Thanks! :-)<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0- Get to the root cause of the problem and provide a bette=
r explination of<br>
&gt;=C2=A0 =C2=A0 =C2=A0what is happening.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- Use Environment=3DLANG=3DC isntead of -o --locale=3DC<br=
>
&gt; <br>
&gt;=C2=A0 package/postgresql/postgresql.service | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/postgresql/postgresql.service b/package/postgresq=
l/postgresql.service<br>
&gt; index 539eea8964..c470c7181e 100644<br>
&gt; --- a/package/postgresql/postgresql.service<br>
&gt; +++ b/package/postgresql/postgresql.service<br>
&gt; @@ -16,6 +16,10 @@ StandardOutput=3Dsyslog<br>
&gt;=C2=A0 StandardError=3Dsyslog<br>
&gt;=C2=A0 SyslogIdentifier=3Dpostgres<br>
&gt;=C2=A0 <br>
&gt; +# Overwrite the LANG variable to prevent systemd from passing the LAN=
G<br>
&gt; +# environment variable set in /etc/locale.conf.<br>
&gt; +Environment=3DLANG=3DC<br>
&gt; +<br>
&gt;=C2=A0 ExecStartPre=3D/bin/sh -c &quot;if [ ! -f /var/lib/pgsql/PG_VERS=
ION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi&quot;<br>
&gt;=C2=A0 ExecStart=3D/usr/bin/postgres -D /var/lib/pgsql<br>
&gt;=C2=A0 ExecReload=3D/usr/bin/kill -HUP $MAINPID<br>
&gt; -- <br>
&gt; 2.41.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--0000000000001abdf6060ccc1325--

--===============3913157967682821502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3913157967682821502==--
