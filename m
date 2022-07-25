Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A7BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 18:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A67E160DFA;
	Mon, 25 Jul 2022 18:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A67E160DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLdvBFyfc-pv; Mon, 25 Jul 2022 18:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70C4360BA1;
	Mon, 25 Jul 2022 18:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70C4360BA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E43F81BF396
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAE2E41A41
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE2E41A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhSvzxSeostD for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 18:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B0841A23
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47B0841A23
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 18:00:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m12so18170247lfj.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 11:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jwk+UdWd5dE06g1bbX9iIXqbcDMpavOp3UOjr9gRiPk=;
 b=4pzvO4UCgby+mpr6HfFLC+EOETjJG4YI9uQjmvYxIC9wPyFgez+vdw9bDcLwLhICOQ
 Y+CiL3MpveZ46dSdu7/IZLm98Va2TUh8f3DYJh+kdIkOiBsn9iw+fM9JSo+hMj33kNWE
 NT4nOzj7MX83iwGtw8j74y5arFNBzZQZDFgBnv+QHzrWFK0lfZf/YrS07eRaRNjswxBa
 NbqurLfWeom/eXB96yVk1AYCjqWZxMY9weuHPkxQ72RScJbKdO+BRJqOD676ISzta9Ok
 qQz8ZEhpUbuhMO1gaje8uC7m0S03OZhAi6SAjmA9mbfMnvy6GygG62k1aWOwNJUsZ+YS
 Os1A==
X-Gm-Message-State: AJIora/kN3e9AbQgRhb/Is9SXnCKlnzclvS2Qu6hpI+AIIpJA4du/HZE
 sTNSzNHA5I+nO1NG/97YVjheLyQObPdsGMA0PTA=
X-Google-Smtp-Source: AGRyM1sAZy4F9gcqcNmoSm7K77L4T2Sozov6G9HJJlSuhQQ3RyZ0tJzGn64Z3/aKg7HUuIO2DdFqjx6bFRZSdLjPVKU=
X-Received: by 2002:a05:6512:3088:b0:48a:8770:f5a7 with SMTP id
 z8-20020a056512308800b0048a8770f5a7mr2765026lfd.527.1658772032752; Mon, 25
 Jul 2022 11:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210418183658.1675843-1-glex.spb@gmail.com>
 <20210418235913.142664da@gmx.net>
 <cf125f40-5b4e-6f22-876f-6f786a7ae79b@mind.be>
In-Reply-To: <cf125f40-5b4e-6f22-876f-6f786a7ae79b@mind.be>
From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Mon, 25 Jul 2022 19:00:21 +0100
Message-ID: <CADjhFRD-uf5PJW0prVmZpdAvaKFMN_RvCj2TP-Z_V1_nYzP0dQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Jwk+UdWd5dE06g1bbX9iIXqbcDMpavOp3UOjr9gRiPk=;
 b=RwSzwRX9AMIrLZAQD/6UxMOy1NAyml356cmqCoJ8jd1lEvPJnbSs0vLc9MZqnNKxM8
 lQuJfUXA+VMTiNf4KX9fn5kNWfT2Mvz9hvPMoB+qyO7VyUHDmk6n78hRlJWWDpYsPee5
 1Cf0hvErUnZ8lbJa2epvG06pUSdIHq6Rif9ZdVJ9yWbx0rLaarVZDwHMpBPnWWrsSyb6
 cjTt504A+MDr+OCRqxtpEIEMtzIj/I/XA1DtLbfMUfti6bpaGs7AzQGzzaRs3EncY4Fk
 a68qA7geacbEF5jT4TiOo4pz6iIVqF6EQWkZxp2dOw7bSWV1xXJMXKs3bCn+epg0Mi6s
 y/fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RwSzwRX9
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: Add a setting for LTO
 build
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
Content-Type: multipart/mixed; boundary="===============8817812765522769795=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8817812765522769795==
Content-Type: multipart/alternative; boundary="000000000000c6916805e4a4f507"

--000000000000c6916805e4a4f507
Content-Type: text/plain; charset="UTF-8"

We don't want to disable LTO globally only for certain packages We want LTO
generally but not for a development tool that takes over 1 hour to build
with LTO vs 1 minute without it.

Is it possible to do it on a per-package basis?

By the way, it would also be useful to control BR2_STATIC_LIBS on a
per-package basis (recent example:
https://patchwork.ozlabs.org/project/buildroot/patch/20220620115510.33792-1-paul@crapouillou.net/
)

On Mon, Jul 25, 2022 at 4:27 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 18/04/2021 23:59, Peter Seiderer wrote:
> > Hello Gleb,
> > On Sun, 18 Apr 2021 19:36:58 +0100, Gleb Mazovetskiy <glex.spb@gmail.com>
> wrote:
> >
> >> Valgrind LTO build takes over an hour on my Ryzen 3950x.
> >>
> >
> > Can confirm a build time increase (AMD Ryzen 7 1800X):
> >
> > - without LTO:
> >
> > real  0m54,741s
> > user  3m29,941s
> > sys   0m10,949s
> >
> > - with LTO:
> >
> > real  5m48,009s
> > user  6m23,040s
> > sys   0m13,197s
> >
> >> This is not always worth it for the ~10% size reduction and a small
> >> performance improvement it offers (see
> https://www.valgrind.org/docs/manual/dist.news.html)
> >>
> >> Adds a new `BR2_VALGRIND_ENABLE_LTO` setting to control LTO enablement
> >> for Valgrind separately from the global BR2_GCC_ENABLE_LTO setting.
>
>   Adding per-package options to enable debug and optimisation features is
> really
> not the way to go.
>
>   Instead what I've done is to create a series [1] that turns the LTO
> option in
> a global option, that clearly explains in the help text that it may have a
> big
> impact on build time. I've removed the BR2_GCC_ENABLE_LTO option entirely
> because it was not actually doing what it advertises.
>
>   Let me know what you think.
>
>   I've marked this patch as Rejected.
>
>   Regards,
>   Arnout
>
> [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=311175
>
> >>
> >> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> >> ---
> >>   package/valgrind/Config.in   | 10 ++++++++++
> >>   package/valgrind/valgrind.mk |  2 +-
> >>   2 files changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
> >> index 56e4af21fa..eff54e7949 100644
> >> --- a/package/valgrind/Config.in
> >> +++ b/package/valgrind/Config.in
> >> @@ -84,4 +84,14 @@ config BR2_PACKAGE_VALGRIND_NULGRIND
> >>      help
> >>        This option allows to install the Nulgrind tool
> >>
> >> +if BR2_GCC_ENABLE_LTO
> >> +
> >> +config BR2_VALGRIND_ENABLE_LTO
> >> +    bool "Build Valgrind with link-time optimization"
> >> +    help
> >> +      This produces a faster / smaller valgrind (up to 10%) at the cost
> >> +      of massively increased build time (can be over an hour).
> >
> > Be careful with absolute times, depends strongly on the used hardware...
> > (out of interest, what is your baseline compile time?)...
> >
> > Would move this section up-to/before the tools selection section...
> >
> > Regards,
> > Peter
> >
> >> +
> >> +endif
> >> +
> >>   endif
> >> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/
> valgrind.mk
> >> index b87e1e518f..07fb1f7d42 100644
> >> --- a/package/valgrind/valgrind.mk
> >> +++ b/package/valgrind/valgrind.mk
> >> @@ -50,7 +50,7 @@ VALGRIND_CONF_OPTS += \
> >>      --host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
> >>   endif
> >>
> >> -ifeq ($(BR2_GCC_ENABLE_LTO),y)
> >> +ifeq ($(BR2_VALGRIND_ENABLE_LTO),y)
> >>   VALGRIND_CONF_OPTS += --enable-lto
> >>   else
> >>   VALGRIND_CONF_OPTS += --disable-lto
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>

--000000000000c6916805e4a4f507
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We don&#39;t want to disable LTO globally only for ce=
rtain packages We want LTO generally but not for a development tool that ta=
kes over 1 hour to build with LTO vs 1 minute without it.</div><div><br></d=
iv><div>Is it possible to do it on a per-package basis?<br></div><div><br><=
/div><div>By the way, it would also be useful to control BR2_STATIC_LIBS on=
 a per-package basis (recent example: <a href=3D"https://patchwork.ozlabs.o=
rg/project/buildroot/patch/20220620115510.33792-1-paul@crapouillou.net/">ht=
tps://patchwork.ozlabs.org/project/buildroot/patch/20220620115510.33792-1-p=
aul@crapouillou.net/</a>)</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jul 25, 2022 at 4:27 PM Arnout Vande=
cappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 18/04/2021 23:59, Peter Seiderer wrote:<br>
&gt; Hello Gleb,<br>
&gt; On Sun, 18 Apr 2021 19:36:58 +0100, Gleb Mazovetskiy &lt;<a href=3D"ma=
ilto:glex.spb@gmail.com" target=3D"_blank">glex.spb@gmail.com</a>&gt; wrote=
:<br>
&gt; <br>
&gt;&gt; Valgrind LTO build takes over an hour on my Ryzen 3950x.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Can confirm a build time increase (AMD Ryzen 7 1800X):<br>
&gt; <br>
&gt; - without LTO:<br>
&gt; <br>
&gt; real=C2=A0 0m54,741s<br>
&gt; user=C2=A0 3m29,941s<br>
&gt; sys=C2=A0 =C2=A00m10,949s<br>
&gt; <br>
&gt; - with LTO:<br>
&gt; <br>
&gt; real=C2=A0 5m48,009s<br>
&gt; user=C2=A0 6m23,040s<br>
&gt; sys=C2=A0 =C2=A00m13,197s<br>
&gt; <br>
&gt;&gt; This is not always worth it for the ~10% size reduction and a smal=
l<br>
&gt;&gt; performance improvement it offers (see <a href=3D"https://www.valg=
rind.org/docs/manual/dist.news.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.valgrind.org/docs/manual/dist.news.html</a>)<br>
&gt;&gt;<br>
&gt;&gt; Adds a new `BR2_VALGRIND_ENABLE_LTO` setting to control LTO enable=
ment<br>
&gt;&gt; for Valgrind separately from the global BR2_GCC_ENABLE_LTO setting=
.<br>
<br>
=C2=A0 Adding per-package options to enable debug and optimisation features=
 is really <br>
not the way to go.<br>
<br>
=C2=A0 Instead what I&#39;ve done is to create a series [1] that turns the =
LTO option in <br>
a global option, that clearly explains in the help text that it may have a =
big <br>
impact on build time. I&#39;ve removed the BR2_GCC_ENABLE_LTO option entire=
ly <br>
because it was not actually doing what it advertises.<br>
<br>
=C2=A0 Let me know what you think.<br>
<br>
=C2=A0 I&#39;ve marked this patch as Rejected.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D311175" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.or=
g/project/buildroot/list/?series=3D311175</a><br>
<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Gleb Mazovetskiy &lt;<a href=3D"mailto:glex.spb@gma=
il.com" target=3D"_blank">glex.spb@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0package/valgrind/Config.in=C2=A0 =C2=A0| 10 ++++++++++=
<br>
&gt;&gt;=C2=A0 =C2=A0package/valgrind/<a href=3D"http://valgrind.mk" rel=3D=
"noreferrer" target=3D"_blank">valgrind.mk</a> |=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 11 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/package/valgrind/Config.in b/package/valgrind/Config.=
in<br>
&gt;&gt; index 56e4af21fa..eff54e7949 100644<br>
&gt;&gt; --- a/package/valgrind/Config.in<br>
&gt;&gt; +++ b/package/valgrind/Config.in<br>
&gt;&gt; @@ -84,4 +84,14 @@ config BR2_PACKAGE_VALGRIND_NULGRIND<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 help<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 This option allows to install the Nulgr=
ind tool<br>
&gt;&gt;<br>
&gt;&gt; +if BR2_GCC_ENABLE_LTO<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_VALGRIND_ENABLE_LTO<br>
&gt;&gt; +=C2=A0 =C2=A0 bool &quot;Build Valgrind with link-time optimizati=
on&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 help<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 This produces a faster / smaller valgrind (u=
p to 10%) at the cost<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 of massively increased build time (can be ov=
er an hour).<br>
&gt; <br>
&gt; Be careful with absolute times, depends strongly on the used hardware.=
..<br>
&gt; (out of interest, what is your baseline compile time?)...<br>
&gt; <br>
&gt; Would move this section up-to/before the tools selection section...<br=
>
&gt; <br>
&gt; Regards,<br>
&gt; Peter<br>
&gt; <br>
&gt;&gt; +<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0endif<br>
&gt;&gt; diff --git a/package/valgrind/<a href=3D"http://valgrind.mk" rel=
=3D"noreferrer" target=3D"_blank">valgrind.mk</a> b/package/valgrind/<a hre=
f=3D"http://valgrind.mk" rel=3D"noreferrer" target=3D"_blank">valgrind.mk</=
a><br>
&gt;&gt; index b87e1e518f..07fb1f7d42 100644<br>
&gt;&gt; --- a/package/valgrind/<a href=3D"http://valgrind.mk" rel=3D"noref=
errer" target=3D"_blank">valgrind.mk</a><br>
&gt;&gt; +++ b/package/valgrind/<a href=3D"http://valgrind.mk" rel=3D"noref=
errer" target=3D"_blank">valgrind.mk</a><br>
&gt;&gt; @@ -50,7 +50,7 @@ VALGRIND_CONF_OPTS +=3D \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 --host=3D$(patsubst arm-%,armv7-%,$(GNU_TARGET=
_NAME))<br>
&gt;&gt;=C2=A0 =C2=A0endif<br>
&gt;&gt;<br>
&gt;&gt; -ifeq ($(BR2_GCC_ENABLE_LTO),y)<br>
&gt;&gt; +ifeq ($(BR2_VALGRIND_ENABLE_LTO),y)<br>
&gt;&gt;=C2=A0 =C2=A0VALGRIND_CONF_OPTS +=3D --enable-lto<br>
&gt;&gt;=C2=A0 =C2=A0else<br>
&gt;&gt;=C2=A0 =C2=A0VALGRIND_CONF_OPTS +=3D --disable-lto<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@b=
usybox.net</a><br>
&gt; <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D=
"noreferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/bu=
ildroot</a><br>
</blockquote></div>

--000000000000c6916805e4a4f507--

--===============8817812765522769795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8817812765522769795==--
