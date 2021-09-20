Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF61C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 13:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEDBD60F23
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 13:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEDBD60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3ED4015F;
	Mon, 20 Sep 2021 13:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KncS72ik4ibW; Mon, 20 Sep 2021 13:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8846240203;
	Mon, 20 Sep 2021 13:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEC4C1BF297
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 13:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AADE2402AF
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 13:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bo2rWxfAr1KD for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 13:39:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56C604015F
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 13:39:36 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id dj4so5553963edb.5
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJCBaOMrX+CMbn9sFUitDirw/YNR4qviK56c13jcbv4=;
 b=UrFvv0YKPGyyZv+H4LMTq1BtKOSLB+wo2e6gmcwsaUTYRGHdnjg4H5E0uRxp1zv06F
 v3oNCJsnzipzKAvTioweLUzmuLRX/9RU81EvVQb0GcGF1lCDb1Tds/YqbPApE5D0vv6M
 Kii1yKFJ1L5sl4KPELJIGnD4Sf5aazsf4ZPu45DHQwSU8ZSqq87Vusi+iV1XqZoWfizj
 VDLM2Gio4YH4oPfDehF19cGwGGYHsnIyJ6GTXTOPaYWB955U9UzdS4DNXa/AnuFkhdmG
 nu78rkpJOKIMPi2dHHO43/KUudqa8bzRvPAJVLP1M2bOgTPkxhDGrKr2+zCq9oxH3TvE
 YnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJCBaOMrX+CMbn9sFUitDirw/YNR4qviK56c13jcbv4=;
 b=gdsT/s73jwOZVvnEbV+Q80AY0Qu70IpucEVzp2iEnzV2tih/v1T0pGBR2eW1RVPLkf
 M9uIaIGU+a6s04cOOuaL495LENtH9YgVkvR/UxVqtpaiZBva5mnw9BrSpZSRbfKW5GA9
 NEyygXRkNcP5b1G4CeCdYn+m4uZKbUHIY9ZNm5WRgb2FyklDXVVE6SFrX3pmCdU8wMqG
 rRmBQT7oNzr4Rr4/OJpWkE/01T/0Mp63khW3xpheXauU3r1mI7tdf2F02YDvQkDuDIOA
 hWdeUwmVG5Y1+KQAoR5v8cY9PcSPQRWAkKnh+97stA4s1pQnMw3Mxwto55WdFXqOd7L3
 941A==
X-Gm-Message-State: AOAM530ShU3kD2xE5jar9EUl+zOkwYT0kuyq7leEnFMG6jm+za153Yq6
 hOvbiLkhFgKWmS01QjQ5mLgeUwHCOkn7KRRhFW6jUQ==
X-Google-Smtp-Source: ABdhPJxjVy46wQ/mJtdwT9UqMjyfPQy29iP+rsUYxLaL66m51LlApB9xd+GxOOkDOOl6qgI3G21Z54ySRAv/JSS4y1Q=
X-Received: by 2002:a05:6402:1a53:: with SMTP id
 bf19mr29313366edb.235.1632145164293; 
 Mon, 20 Sep 2021 06:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
In-Reply-To: <163214406368.4283.14394760824414034461@kwain>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 20 Sep 2021 16:39:13 +0300
Message-ID: <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6442705437086955673=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============6442705437086955673==
Content-Type: multipart/alternative; boundary="000000000000bd73ab05cc6d68b5"

--000000000000bd73ab05cc6d68b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 4:21 PM Antoine Tenart <atenart@kernel.org> wrote:

> Quoting Jos=C3=A9 Pekkarinen (2021-09-20 11:44:42)
> >    On Mon, Sep 20, 2021 at 12:30 PM Antoine Tenart <[1]
> atenart@kernel.org>
> >    wrote:
> >
> >      Quoting Jos=C3=A9 Pekkarinen (2021-09-20 08:01:27)
> >      >
> >      >    Absolutely, in the security section of my .config we can read
> the
> >      >    following:
> >      >    BR2_PACKAGE_POLICYCOREUTILS=3Dy
> >      >    BR2_PACKAGE_REFPOLICY=3Dy
> >      >    BR2_REFPOLICY_EXTRA_MODULES_DIRS=3D"$OUTPUT_DIR/selinux"
> >      >    BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING=3Dy
> >
> >      This should work. Did you check the content of your module show up
> after
> >      applying this patch?
> >
> >    Yes, after the patch I can see the module copied in the folder:
> >    build/refpolicy-2.20200818$ ls policy/modules/buildroot/
> >    base.fc  base.if  base.te  metadata.xml  secure.fc  secure.if
>  secure.te
> >
> >      And:
> >
> >    /build/refpolicy-2.20200818$ grep secure policy/modules.conf
> >    # Module: secure
> >    secure =3D base
> >    # Small and secure DNS daemon.
>
> I'm missing something here. I did the test and using the module and
> configuration snippets you provided (replacing $OUTPUT_DIR/selinux with
> something else; and adding a <summary> to secure.if[1]). It worked. The
> 'secure' module was found and enabled.
>
> The logic is the following in Buildroot for extra modules:
>
> 1. The modules are rsynced in policy/modules/buildrood/.
> 2. If not already there, a metadata.xml file is added.
> 3. The refpolicy build system is used[2] to generate modules.conf using
>    all modules matching 'policy/modules/*/*.te'.
> 4. All modules in modules.conf are disabled and then only the ones in
>    REFPOLICY_MODULES are enabled.
>
> It looks like more of a refpolicy/module issue than a Buildroot one:
> steps 1 and 2 seem to work, but not step 3. If you retrieve the
> refpolicy project outside of Builroot and mimic the above steps, are
> your modules listed in modules.conf? If not that might be a good
> starting point. I don't have a better idea for now...
>

Hi,

I did, and this is how modules.conf looks like when

it comes to the section of my module:

[...]
# Module: xscreensaver
#
# Modular screen saver and locker for X11.
#
xscreensaver =3D module

# Layer: buildroot
# Module: secure
#
# Layer: kernel
# Module: storage
[...]

Now, reading the INSTALL file, it says the following:

If you do not have a modules.conf, one can be generated:

   make conf

This will create a *default modules.conf*.

This default makes me think it implies you'd need to

activate your own modules if they are there, and why I believe
buildroot would require that extra logic. refpolicy project may
stand for letting users add their own, but not taking part on
it theirselves.

Best regards.

Jos=C3=A9.



>
> Antoine
>
> [1] Which I guess is not your issue as otherwise the configuration step
>     fails and the build stops.
> [2] `make -j1 bare conf`
>


--=20

Jos=C3=A9.

--000000000000bd73ab05cc6d68b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 20, 2021 at 4:21 PM Antoi=
ne Tenart &lt;<a href=3D"mailto:atenart@kernel.org">atenart@kernel.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Quoti=
ng Jos=C3=A9 Pekkarinen (2021-09-20 11:44:42)<br>
&gt;=C2=A0 =C2=A0 On Mon, Sep 20, 2021 at 12:30 PM Antoine Tenart &lt;[1]<a=
 href=3D"mailto:atenart@kernel.org" target=3D"_blank">atenart@kernel.org</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Quoting Jos=C3=A9 Pekkarinen (2021-09-20 08:01:27)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Absolutely, in the security sect=
ion of my .config we can read the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 following:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 BR2_PACKAGE_POLICYCOREUTILS=3Dy<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 BR2_PACKAGE_REFPOLICY=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 BR2_REFPOLICY_EXTRA_MODULES_DIRS=
=3D&quot;$OUTPUT_DIR/selinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 BR2_PACKAGE_REFPOLICY_POLICY_STA=
TE_ENFORCING=3Dy<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 This should work. Did you check the content of you=
r module show up after<br>
&gt;=C2=A0 =C2=A0 =C2=A0 applying this patch?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Yes, after the patch I can see the module copied in the f=
older:<br>
&gt;=C2=A0 =C2=A0 build/refpolicy-2.20200818$ ls policy/modules/buildroot/<=
br>
&gt;=C2=A0 =C2=A0 base.fc =C2=A0base.if =C2=A0base.te =C2=A0metadata.xml =
=C2=A0secure.fc =C2=A0secure.if =C2=A0secure.te<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 And:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 /build/refpolicy-2.20200818$ grep secure policy/modules.c=
onf<br>
&gt;=C2=A0 =C2=A0 # Module: secure<br>
&gt;=C2=A0 =C2=A0 secure =3D base<br>
&gt;=C2=A0 =C2=A0 # Small and secure DNS daemon.<br>
<br>
I&#39;m missing something here. I did the test and using the module and<br>
configuration snippets you provided (replacing $OUTPUT_DIR/selinux with<br>
something else; and adding a &lt;summary&gt; to secure.if[1]). It worked. T=
he<br>
&#39;secure&#39; module was found and enabled.<br>
<br>
The logic is the following in Buildroot for extra modules:<br>
<br>
1. The modules are rsynced in policy/modules/buildrood/.<br>
2. If not already there, a metadata.xml file is added.<br>
3. The refpolicy build system is used[2] to generate modules.conf using<br>
=C2=A0 =C2=A0all modules matching &#39;policy/modules/*/*.te&#39;.<br>
4. All modules in modules.conf are disabled and then only the ones in<br>
=C2=A0 =C2=A0REFPOLICY_MODULES are enabled.<br>
<br>
It looks like more of a refpolicy/module issue than a Buildroot one:<br>
steps 1 and 2 seem to work, but not step 3. If you retrieve the<br>
refpolicy project outside of Builroot and mimic the above steps, are<br>
your modules listed in modules.conf? If not that might be a good<br>
starting point. I don&#39;t have a better idea for now...<br></blockquote><=
div><br></div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padd=
ing:0px"><div class=3D"gmail_quote"><div>Hi,</div><div><br></div></div></bl=
ockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><d=
iv class=3D"gmail_quote"><div>I did, and this is how modules.conf looks lik=
e when</div></div></blockquote>it comes to the section of my module:<br><di=
v><br>[...]<br># Module: xscreensaver<br>#<br># Modular screen saver and lo=
cker for X11.<br># =C2=A0<br>xscreensaver =3D module<br><br># Layer: buildr=
oot<br># Module: secure<br>#<br># Layer: kernel<br># Module: storage<br>[..=
.]=C2=A0<br></div><div><br></div><div><blockquote style=3D"margin:0 0 0 40p=
x;border:none;padding:0px"><div>Now, reading the INSTALL file, it says the =
following:</div><div><br></div></blockquote>If you do not have a modules.co=
nf, one can be generated:<br><br>=C2=A0 =C2=A0make conf<br><br>This will cr=
eate a <b>default modules.conf</b>.</div><div><br></div><div><blockquote st=
yle=3D"margin:0 0 0 40px;border:none;padding:0px"><div>This default makes m=
e think it implies you&#39;d need to</div></blockquote>activate your own mo=
dules if they are there, and why I believe</div><div>buildroot would requir=
e that extra logic. refpolicy project may</div><div>stand for letting users=
 add their own, but not taking part on</div><div>it theirselves.</div><div>=
<br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0=
px"><div>Best regards.</div><div><br></div></blockquote><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Jos=C3=A9.</div></block=
quote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>=
<br></div></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r></blockquote></div><div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Antoine<br>
<br>
[1] Which I guess is not your issue as otherwise the configuration step<br>
=C2=A0 =C2=A0 fails and the build stops.<br>
[2] `make -j1 bare conf`<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div><=
/div></div>

--000000000000bd73ab05cc6d68b5--

--===============6442705437086955673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6442705437086955673==--
