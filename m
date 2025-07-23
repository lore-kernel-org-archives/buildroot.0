Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44164C83F1A
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 21:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE4DA61299;
	Wed, 23 Jul 2025 21:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXqYunKAZ30R; Wed, 23 Jul 2025 21:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED7661295
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED7661295;
	Wed, 23 Jul 2025 21:09:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6DDBD3
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D64961292
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8D5CEZ383PoJ for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 21:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A8E86111D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A8E86111D
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A8E86111D
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:09:09 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7183d264e55so3650637b3.2
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 14:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753304948; x=1753909748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gHAEHR1YNSkVDtKrBWC/LeWi0PNuL9inIQF7f+ldD3g=;
 b=Tf1TdguJj6MQwlvygKTjUdRtDazh/m0F83KIE+TpHsiRNdtdNcY2KxZ13bbwmVfw9P
 MvOTwHhFvwWXHrXljeysiZ+4EcfflkJ1d1kPUVPnisEWeetqF4Gs8jlAGz1h4eXNtT9T
 J+DEyU0He6xRoOYu5wz3qCqD7HIZfLP13V+9cy4aT2jqzY1XVSw45myKPd0EQklVELQB
 1x//xeJoouFX+QxU3NlJz4rNk618V59DJwP0X2wkCVRXst88edYYDnsMaAJzd1rZVJrh
 oiw0bRY9abKQ8/DHfxQBZwjm2mUTv2vndJPvKUvfEJzQWChK4YekpOxmjw9R4j+7yjCm
 qarA==
X-Gm-Message-State: AOJu0YzYjm2tG4U+z0FOla+XOh/SeYMN/GeyeLW3BKevAMkcjmMwZ0yg
 0gZSW3P5ls2AtMjWvpXaNiHqW3AyOAXfb/TrcGtrsqwFnFwC0GP8egC+a0uS1/jww3QOS/dzhNI
 uJDsGKZu9DiwyVSJNx3L2fctAp+EOZbQ=
X-Gm-Gg: ASbGncum7OvUyAAAK2tiA1GI2ZsNyVn7PLTrrSVP3LZpmYDA+9K/oiSLuxW8BVOqgzB
 /s584Idd5gkZSB/7x3XvIyLTsH4FHc0uwOSW3nPW/waSB+ES1Np73dI/4u3KNOEfqrkmkAk8XsA
 xfQSYoHZb0Lb3KQwUmeCHvlXugEn98Mg05IyA2HPoW31TI2QwQ2s1mCsxtOuByXFG4Igo29k12t
 WqjM/7/njTAu86XVDNUP0jn+JZ7UnVCrTXtSLn/
X-Google-Smtp-Source: AGHT+IHcdsrA6D5CKaU5zmZfqh/FqLODMUmwxWad1cTVAe0DwsXFSz1GujnN4vFKtCSiVdivy0k9uiy/y8lXbFJOVH4=
X-Received: by 2002:a05:690c:4d82:b0:718:38be:b3e1 with SMTP id
 00721157ae682-719b42635f0mr62965527b3.41.1753304947998; Wed, 23 Jul 2025
 14:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250719143417.144660-1-Stefan.Nickl@gmail.com>
 <CA+R_derRM8KYwv1bvaj7ZayMM=wF6AeSfAvoiidag=Luxhjdiw@mail.gmail.com>
 <59619ea5bc67adf918a35f865cb1567998641e62.camel@gmail.com>
In-Reply-To: <59619ea5bc67adf918a35f865cb1567998641e62.camel@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 23 Jul 2025 23:08:56 +0200
X-Gm-Features: Ac12FXzSUIzqRTJIFBDKSJgXnUUuSjbGJNbmWwP7RoOxFlAZQjWIhXQhh7oEC04
Message-ID: <CA+R_deofJALuQTwbUc8tkMddQ5vog82aYSa2EVJS_+0AkuL9Vg@mail.gmail.com>
To: stefan.nickl@gmail.com
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753304948; x=1753909748; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gHAEHR1YNSkVDtKrBWC/LeWi0PNuL9inIQF7f+ldD3g=;
 b=WcRb7cRk+ihgu4slubzBZ9jf1ICjBj98Go7BRfHh0APnleTAQyqGrMGHsduA+Zw3x2
 RQVaSbqigp64C6Ua6X9lVb4esUaiwyEXyGDsCVgt1KV06Rgm4+VHwYyoSicaLOUWX6Nf
 RVkpblv8aNDFOe1y30glwN3Ri5pJ44w7HPvPHnyn+tdE3s/1uR0pi+F/PqjywYlDZXnK
 uHyJRDHTdHt/YU4oB68iUJzCS8fc7gKiZSVXTH53oWY2U+sEGVE2FgXkVrwPvmuTlDw2
 +vTBWqKcSOU5QhdjAaaqPZaOdECaIbAvPxSiYjtthUxViXC2NEswP3+RDRyLinrRjxX2
 SHkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WcRb7cRk
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6positioning: New package
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
Content-Type: multipart/mixed; boundary="===============2897021511455754018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2897021511455754018==
Content-Type: multipart/alternative; boundary="0000000000009bc40b063a9f1ed7"

--0000000000009bc40b063a9f1ed7
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

ons. 23. jul. 2025, 17:16 skrev <stefan.nickl@gmail.com>:

> Hi Roy,
> > Good to see more people working on adding Qt 6 packages to buildroot!
> Thanks!
>
> > Bernd Kuhls added this package a while back, which I later ported to Qt
> 6.9.1 here:
> >
> https://patchwork.ozlabs.org/project/buildroot/patch/20250610122924.431830-3-roykollensvendsen@gmail.com/
> >
> > If you see any areas of improvements please feel free to build on top of
> Bernds patch.
>
> About that, my plans were actually a bit different.
>

We should try to not ignore Bernds work but build on top of it. His
original patch was made for 6.8.x by the way. You will also find some areas
of improvement by comparing your patches.

I have already prepared an update to 6.8.3 (latest LTS version) that I
> wanted to send out as soon as qtpositioning 6.8.1 was merged, plus a
> minor bugfix (qt6quick3d missing a BR2_PACKAGE_QT6BASE_CONCURRENT
> dependency).
>
> Do you think we could defer skipping to the next non-LTS for a while,
> maybe until after 2025.08 is released?
>

My goal has been to keep main up to date with the latest available Qt 6
version. The buildroot LTS releases will be maintained longer than before,
so using the Qt6 LTS releases for those could make sense. On the other
hand, aren't those for commercial users only, at some point?

We should find a solution where we can keep main up to date but still be
able support Qt6 in the LTS releases of buildroot.

There may be some guidelines for this in the manual(?)

Please post your series and the maintainers will decide on the best path
forward.


> Regards,
> Stefan
>

--0000000000009bc40b063a9f1ed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefan,<br><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">ons. 23. jul. 2025, 17=
:16 skrev  &lt;<a href=3D"mailto:stefan.nickl@gmail.com">stefan.nickl@gmail=
.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Roy,<br>
&gt; Good to see more people working on adding Qt 6 packages to buildroot!<=
br>
Thanks!<br>
<br>
&gt; Bernd Kuhls added this package a while back, which I later ported to Q=
t 6.9.1 here:<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/202506=
10122924.431830-3-roykollensvendsen@gmail.com/" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/2=
0250610122924.431830-3-roykollensvendsen@gmail.com/</a><br>
&gt; <br>
&gt; If you see any areas of improvements please feel free to build on top =
of Bernds patch.<br>
<br>
About that, my plans were actually a bit different.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">We should try to not ign=
ore Bernds work but build on top of it. His original patch was made for 6.8=
.x by the way. You will also find some areas of improvement by comparing yo=
ur patches.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I have already prepared an update to 6.8.3 (latest LTS version) that I<br>
wanted to send out as soon as qtpositioning 6.8.1 was merged, plus a<br>
minor bugfix (qt6quick3d missing a BR2_PACKAGE_QT6BASE_CONCURRENT<br>
dependency).<br>
<br>
Do you think we could defer skipping to the next non-LTS for a while,<br>
maybe until after 2025.08 is released?<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">My goal has been to keep main up to d=
ate with the latest available Qt 6 version. The buildroot LTS releases will=
 be maintained longer than before, so using the Qt6 LTS releases for those =
could make sense. On the other hand, aren&#39;t those for commercial users =
only, at some point?</div><div dir=3D"auto"><br></div><div dir=3D"auto">We =
should find a solution where we can keep main up to date but still be able =
support Qt6 in the LTS releases of buildroot.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">There may be some guidelines for this in the manual(?=
)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Please post your serie=
s and the maintainers will decide on the best path forward.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote=
_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
Regards,<br>
Stefan<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
</blockquote></div></div></div>

--0000000000009bc40b063a9f1ed7--

--===============2897021511455754018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2897021511455754018==--
