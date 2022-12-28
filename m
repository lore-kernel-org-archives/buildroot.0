Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB20C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E48640179;
	Wed, 28 Dec 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E48640179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0c4-CTnOGTo; Wed, 28 Dec 2022 20:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54B014014E;
	Wed, 28 Dec 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B014014E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B03221BF2F2
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 985918146B
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 985918146B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pygXEu8_L_gR for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 20:55:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DA6C81259
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DA6C81259
 for <buildroot@busybox.net>; Wed, 28 Dec 2022 20:55:07 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id q3so3001320uao.2
 for <buildroot@busybox.net>; Wed, 28 Dec 2022 12:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvPK6fXy+KzncfiFtm98uQvSuRr0a5cmsVthE1c214g=;
 b=GF7Hx2f/kvKtEu1HlBQZTfk5CFGyc3TEKdPsJdCAsyXffktcUIXWcl1J7uePkO3n+x
 oYIu6MbjcsWephsPpvR9zh/exQOoLSsAUUmd68NGEZ4s3ES89SJBI9CZ5fujtfAZn3Xg
 bcYEagE64dycTuZJHEaWFEJNWuLbo4ZYoTqm6ociz9VdO7HCZE/ensIU5RH6Casjwtxm
 uzwRdQhcNdcPWGz4OQZg+C3YyrtpE0OvGN4VcC+o0LPh7Tc4rDmIRL6r9TsN7zz3T1rD
 /tr/kvWbp2Co1v9psXCOieHHuPNczV738Ta/4cRbaVXOasxaO1WdsSevEKfEMH0hZX6m
 FXCQ==
X-Gm-Message-State: AFqh2kqakKKj7tA9JcKmeuS7H5lKantdQ3RbLTcjB65+IIhebPS0Dms9
 PgCg2qPp+fVFwnLZUIxNVohjoCkB6hV3gglAHKZggQ==
X-Google-Smtp-Source: AMrXdXthEe/o5er2kPc9RHGkGWVogf9CccRWaSb48qDAvC94Wlb/PKdss6efBJQa6/f/vCuPh4+r4sodqNnoQe4qhjM=
X-Received: by 2002:a9f:3861:0:b0:419:c3a3:9d0 with SMTP id
 q30-20020a9f3861000000b00419c3a309d0mr2463066uad.98.1672260906239; Wed, 28
 Dec 2022 12:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20221228071734.737602-1-francois.perrad@gadz.org>
 <20221228205626.65dc0189@windsurf>
In-Reply-To: <20221228205626.65dc0189@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 28 Dec 2022 21:54:54 +0100
Message-ID: <CAB0FRssnVbsouUrhWSzZa2W4jGE0a2WaPzeDMdXWkJjrz9yYFg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.36
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: multipart/mixed; boundary="===============8517477963771290729=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8517477963771290729==
Content-Type: multipart/alternative; boundary="00000000000049dd1805f0e9951e"

--00000000000049dd1805f0e9951e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 28 d=C3=A9c. 2022 =C3=A0 20:56, Thomas Petazzoni via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> Hello Fran=C3=A7ois,
>
> Thanks for looking into this!
>
> On Wed, 28 Dec 2022 08:17:34 +0100
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > switch to meson infra
> > remove autotools specific patches
>
> Is the version bump related/tied to the switch to meson? If they are
> not, they should be in separate patches.
>

The release 3.24.36 is the first release to exclusively use the meson build
system (see NEWS).


> >
> > host-libgtk3 is a hack which build only gtk-update-icon-cache
>
> Yes, and?
>
>
> > -LIBGTK3_CONF_OPTS =3D \
> > -     --disable-glibtest \
> > -     --enable-explicit-deps=3Dno
> > -HOST_LIBGTK3_CONF_OPTS =3D --disable-introspection
>
> Where is introspection now being disabled for the host package?
>
> Also, there were quite a few tweaks for the host build, which you have
> removed. How does it work now? We build a full Gtk for the host? It
> doesn't need any extra dependency?
>
>
I don't change the build process of host-libgtk3.
The only change is now the explicit use of host-generic-package instead of
host-autotools-package (with all _CMDS overloaded).
So, host-libgtk3 does not build a full GTK, but only 2 tools:
gtk-update-icon-cache & gtk-encode-symbolic-svg.

HOST_LIBGTK3_CONF_OPTS was not used, see in HOST_LIBGTK3_CONFIGURE_CMDS,
there are only 3 echo.
Again, the statement host-autotools-package is very disturbing, because
none stuff from autotools is used.

Fran=C3=A7ois


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000049dd1805f0e9951e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 28 d=C3=A9c. 2022 =C3=A0=
=C2=A020:56, Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buildroot=
@buildroot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fran=C3=A7ois,<br=
>
<br>
Thanks for looking into this!<br>
<br>
On Wed, 28 Dec 2022 08:17:34 +0100<br>
Francois Perrad &lt;<a href=3D"mailto:fperrad@gmail.com" target=3D"_blank">=
fperrad@gmail.com</a>&gt; wrote:<br>
<br>
&gt; switch to meson infra<br>
&gt; remove autotools specific patches<br>
<br>
Is the version bump related/tied to the switch to meson? If they are<br>
not, they should be in separate patches.<br></blockquote><div><br></div><di=
v>The release 3.24.36 is the first release to exclusively use the meson bui=
ld system (see NEWS).</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt; <br>
&gt; host-libgtk3 is a hack which build only gtk-update-icon-cache<br>
<br>
Yes, and?<br>
<br>
<br>
&gt; -LIBGTK3_CONF_OPTS =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0--disable-glibtest \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0--enable-explicit-deps=3Dno<br>
&gt; -HOST_LIBGTK3_CONF_OPTS =3D --disable-introspection<br>
<br>
Where is introspection now being disabled for the host package?<br>
<br>
Also, there were quite a few tweaks for the host build, which you have<br>
removed. How does it work now? We build a full Gtk for the host? It<br>
doesn&#39;t need any extra dependency?<br>
<br></blockquote><div><br></div><div>I don&#39;t change the build process o=
f host-libgtk3.<br>The only change is now the explicit use of host-generic-=
package instead of host-autotools-package (with all _CMDS overloaded).<br>S=
o, host-libgtk3 does not build a full GTK, but only 2 tools: gtk-update-ico=
n-cache &amp; gtk-encode-symbolic-svg.</div><div><br></div><div>HOST_LIBGTK=
3_CONF_OPTS was not used, see in HOST_LIBGTK3_CONFIGURE_CMDS, there are onl=
y 3 echo.</div><div>Again, the statement host-autotools-package is very dis=
turbing, because none stuff from autotools is used.</div><div><br></div><di=
v>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--00000000000049dd1805f0e9951e--

--===============8517477963771290729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8517477963771290729==--
