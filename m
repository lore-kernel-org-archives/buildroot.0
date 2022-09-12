Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C450C6FA83
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 21:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9635D60D79;
	Mon, 12 Sep 2022 21:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9635D60D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1rX2wABihgE; Mon, 12 Sep 2022 21:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B044760D6D;
	Mon, 12 Sep 2022 21:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B044760D6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09F1F1BF333
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 21:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8FA1817E4
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 21:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8FA1817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5B9EEXGcShM for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 21:34:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58CAD817D3
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58CAD817D3
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 21:34:20 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i26so16971401lfp.11
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 14:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=E1jgTypvc+IF/k9IiTXl4JABsNsanpxvmQ2Y1q8v+AM=;
 b=WoLju3u3P0c414iiA5YkxX85rGjHkXhRUmdFjBs74Xava6MDkk1ThzCUIRZB5iTSod
 iuGrwur35t0WXGEfmsQvOhZah/d0EifW1o7UZay+oj+9TSrCAGqjUnGfQRVhMFMq1aok
 LRFgaprAnUazVt2oZLSDoN227h6YEJX8px0YrvZQfQFFLQ4E8A5W4Uud4C54pYnOoEqw
 v2jKixe+UbwkEYgIoWw1+7q19vuEU2hQMMerucH3vyjdi9dr98biorcz2F3UWblriAjN
 jMbuLRudHP5Kxc4kJWMZ5D8ymhMn4R0jjKWca8DRSNMxzlfEG3o0Ezl1SSThVyvHP41J
 j7GQ==
X-Gm-Message-State: ACgBeo0ntL87w2xKk1KgqjVwBWFfxWTcCrP7bpsOFPaq8ooUcqemNluT
 wUYQQiuQv3/BibWvC7SwjG0XqYwUmAikqK0CtRI=
X-Google-Smtp-Source: AA6agR5XEptGi4vXUg32YIC8RHATEDrcgYCVTTInmHtHS7IR649WNR/SqZ3PLxwZsTKn7iXNM3WBhYo2GMqfLZyA3mA=
X-Received: by 2002:a05:6512:1516:b0:49a:fe4f:216f with SMTP id
 bq22-20020a056512151600b0049afe4f216fmr1429728lfb.131.1663018457815; Mon, 12
 Sep 2022 14:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHfxMJ4cFRmUBteM-tM_gM=5fbdupjJRaahnbc34wifYgSn=gg@mail.gmail.com>
 <20220912203446.GB1082494@scaer>
 <75996cb7-84f0-00ea-b83a-cbc589499922@othermo.de>
In-Reply-To: <75996cb7-84f0-00ea-b83a-cbc589499922@othermo.de>
From: erichiggins@gmail.com
Date: Mon, 12 Sep 2022 14:34:06 -0700
Message-ID: <CAHfxMJ6GD6EaJYHw_QzbiRKAoFBwV+_9Aym4sGBgSqmd5906JQ@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=E1jgTypvc+IF/k9IiTXl4JABsNsanpxvmQ2Y1q8v+AM=;
 b=ZextuCHgN6KdsncNXe/KDOkox6deIFfhvNtYE11o0FpqCOW6uvBQmlXNFCDWDjuJOR
 91yeiVKvbF5zZ0uPfuURLlQvkZ0YYWuBtBhGisZfliD99EQd1v1M05n+lnB4sl52sgu0
 yhc6es/a/qaLUPdxDZrLeYClwJRdr0WgrziHF7loM6dgd6ZMrXthKdqo6y/YsKtQ+Exh
 0F1Yla1ouCgx9aAAgbeRn/6lZsjeJrWzc5SzMWQSK2YUXWQyxblMKBKAc/YLF+1pCoSb
 GI0Yj81g43FIOnA2Iuq1Wi+v/J2beNSXBKcvYvGUvzywQkd361/hvptEdQaIKLhTh9iH
 fBlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZextuCHg
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: supply package name to
 setup() when not provided
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8738869076301995206=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8738869076301995206==
Content-Type: multipart/alternative; boundary="0000000000006ee19005e881a841"

--0000000000006ee19005e881a841
Content-Type: text/plain; charset="UTF-8"

Yann,

I did a write up w/ the justification for this change in this Github gist
https://gist.github.com/erichiggins/223b2495ada64001c44deedd3a3df6ed

Hopefully that provides the necessary info, but I'm happy to copy/paste it
here if you need it for the mailing list record.

On Mon, Sep 12, 2022 at 2:05 PM Marcus Hoffmann <marcus.hoffmann@othermo.de>
wrote:

> Yann, Eric,
>
> On 12.09.22 22:34, Yann E. MORIN wrote:
> > Eric, All,
> >
> > +James for his expertise in that file
> >
> > On 2022-09-12 09:28 -0700, erichiggins@gmail.com spake thusly:
> >> Signed-off-by: Eric Higgins <erichiggins@gmail.com>
> >
> > Thanks for this patch.
> >
> > However, this will need a bit more explanations in the commit log. Start
> > by describing the issue, explain why that happens, and how it is fixed.
> >
> > You can get an idea of how to structure that by looking at existing
> > commit logs: git log utils/scanpypi
> >
> >> ---
> >>   utils/scanpypi | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/utils/scanpypi b/utils/scanpypi
> >> index 452b4a3fc3..a5522a879e 100755
> >> --- a/utils/scanpypi
> >> +++ b/utils/scanpypi
> >> @@ -58,8 +58,9 @@ def setup_decorator(func, method):
> >>       def closure(*args, **kwargs):
> >>           # Any python packages calls its setup function to be
> installed.
> >>           # Argument 'name' of this setup function is the package's name
> >
> > So, this comment states that setup() is called with 'name' argument, but
> > what your commit title implies is that it is not always true. So, this
> > comment is now incorrect, and must be amended apropriately.
> >
> > Could it be that sometimes, 'name' is a keyword argument, and in some
> > other case, it is just a positional argument?
>
> I can offer an example of where the existing script goes wrong:
>
>
> https://github.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b064cb1e755e83e9e/setup.py
>
> No arguments passed at all. `name` (like anything else) in this case is
> read from the accompanying setup.cfg file (in medium-modern python
> packaging world):
>
>
> https://github.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b064cb1e755e83e9e/setup.cfg#L2
>
> This is explained for example here:
> https://towardsdatascience.com/setuptools-python-571e7d5500f2
>
> In the even more modern world the same info is specified in
> pyproject.toml instead:
>
>
> https://github.com/agronholm/apscheduler/blob/49344e6954559259beb336436a45698d62eed5b4/pyproject.toml#L2-L9
>
> But I think it's easiest and correct to use the name specified on the
> cli instead for us.
>
> >
> >> -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
> >> -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
> >> +        name = kwargs.get('name', BuildrootPackage.setup_args['name'])
> >> +        BuildrootPackage.setup_args[name] = kwargs
> >> +        BuildrootPackage.setup_args[name]['method'] = method
> >>       return closure
> >>
> >>   # monkey patch
> >> @@ -147,6 +148,7 @@ class BuildrootPackage():
> >>           self.url = None
> >>           self.version = None
> >>           self.license_files = []
> >> +        self.setup_args['name'] = self.real_name
> >
> > Otherwise, I do understand what the code does, and I think this is the
> > correct solution. James, your opinion?.
> >
> > Still, what is missing is an explanation on why this change is needed. >
> > Regards,
> > Yann E. MORIN.
> >
> >>       def fetch_package_info(self):
> >>           """
> >> --
> >> 2.25.1
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
> >
>

--0000000000006ee19005e881a841
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yann,<div><br></div><div>I did a write up w/ the justifica=
tion for this change=C2=A0in this Github gist</div><div><a href=3D"https://=
gist.github.com/erichiggins/223b2495ada64001c44deedd3a3df6ed" target=3D"_bl=
ank">https://gist.github.com/erichiggins/223b2495ada64001c44deedd3a3df6ed</=
a><br></div><div><br></div><div>Hopefully that provides the necessary info,=
 but I&#39;m happy to copy/paste it here if you need it for the mailing lis=
t record.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Sep 12, 2022 at 2:05 PM Marcus Hoffmann &lt;<a href=
=3D"mailto:marcus.hoffmann@othermo.de">marcus.hoffmann@othermo.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Yann, Eric=
,<br>
<br>
On 12.09.22 22:34, Yann E. MORIN wrote:<br>
&gt; Eric, All,<br>
&gt; <br>
&gt; +James for his expertise in that file<br>
&gt; <br>
&gt; On 2022-09-12 09:28 -0700, <a href=3D"mailto:erichiggins@gmail.com" ta=
rget=3D"_blank">erichiggins@gmail.com</a> spake thusly:<br>
&gt;&gt; Signed-off-by: Eric Higgins &lt;<a href=3D"mailto:erichiggins@gmai=
l.com" target=3D"_blank">erichiggins@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Thanks for this patch.<br>
&gt; <br>
&gt; However, this will need a bit more explanations in the commit log. Sta=
rt<br>
&gt; by describing the issue, explain why that happens, and how it is fixed=
.<br>
&gt; <br>
&gt; You can get an idea of how to structure that by looking at existing<br=
>
&gt; commit logs: git log utils/scanpypi<br>
&gt; <br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0utils/scanpypi | 6 ++++--<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/utils/scanpypi b/utils/scanpypi<br>
&gt;&gt; index 452b4a3fc3..a5522a879e 100755<br>
&gt;&gt; --- a/utils/scanpypi<br>
&gt;&gt; +++ b/utils/scanpypi<br>
&gt;&gt; @@ -58,8 +58,9 @@ def setup_decorator(func, method):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def closure(*args, **kwargs):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Any python packages call=
s its setup function to be installed.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Argument &#39;name&#39; =
of this setup function is the package&#39;s name<br>
&gt; <br>
&gt; So, this comment states that setup() is called with &#39;name&#39; arg=
ument, but<br>
&gt; what your commit title implies is that it is not always true. So, this=
<br>
&gt; comment is now incorrect, and must be amended apropriately.<br>
&gt; <br>
&gt; Could it be that sometimes, &#39;name&#39; is a keyword argument, and =
in some<br>
&gt; other case, it is just a positional argument?<br>
<br>
I can offer an example of where the existing script goes wrong:<br>
<br>
<a href=3D"https://github.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b=
064cb1e755e83e9e/setup.py" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b064cb1e755e83e9e/setup=
.py</a><br>
<br>
No arguments passed at all. `name` (like anything else) in this case is <br=
>
read from the accompanying setup.cfg file (in medium-modern python <br>
packaging world):<br>
<br>
<a href=3D"https://github.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b=
064cb1e755e83e9e/setup.cfg#L2" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/Pylons/waitress/blob/73fe701cba0b37dc6099858b064cb1e755e83e9e/s=
etup.cfg#L2</a><br>
<br>
This is explained for example here: <br>
<a href=3D"https://towardsdatascience.com/setuptools-python-571e7d5500f2" r=
el=3D"noreferrer" target=3D"_blank">https://towardsdatascience.com/setuptoo=
ls-python-571e7d5500f2</a><br>
<br>
In the even more modern world the same info is specified in <br>
pyproject.toml instead:<br>
<br>
<a href=3D"https://github.com/agronholm/apscheduler/blob/49344e6954559259be=
b336436a45698d62eed5b4/pyproject.toml#L2-L9" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/agronholm/apscheduler/blob/49344e6954559259beb336=
436a45698d62eed5b4/pyproject.toml#L2-L9</a><br>
<br>
But I think it&#39;s easiest and correct to use the name specified on the <=
br>
cli instead for us.<br>
<br>
&gt; <br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[kwargs[&#=
39;name&#39;]] =3D kwargs<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[kwargs[&#=
39;name&#39;]][&#39;method&#39;] =3D method<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D kwargs.get(&#39;name&#39;, B=
uildrootPackage.setup_args[&#39;name&#39;])<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[name] =3D=
 kwargs<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[name][&#3=
9;method&#39;] =3D method<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return closure<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# monkey patch<br>
&gt;&gt; @@ -147,6 +148,7 @@ class BuildrootPackage():<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.url =3D None<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.version =3D None<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.license_files =3D []<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.setup_args[&#39;name&#39;] =3D s=
elf.real_name<br>
&gt; <br>
&gt; Otherwise, I do understand what the code does, and I think this is the=
<br>
&gt; correct solution. James, your opinion?.<br>
&gt; <br>
&gt; Still, what is missing is an explanation on why this change is needed.=
 &gt;<br>
&gt; Regards,<br>
&gt; Yann E. MORIN.<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def fetch_package_info(self):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;&gt; -- <br>
&gt;&gt; 2.25.1<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a><br>
&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/l=
istinfo/buildroot</a><br>
&gt; <br>
</blockquote></div>

--0000000000006ee19005e881a841--

--===============8738869076301995206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8738869076301995206==--
