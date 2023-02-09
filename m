Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9194C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 08:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55CDE60AC6;
	Thu,  9 Feb 2023 08:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CDE60AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRu1t1LHmQZV; Thu,  9 Feb 2023 08:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E539A60C06;
	Thu,  9 Feb 2023 08:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E539A60C06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67D201BF361
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 08:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E508817A4
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 08:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E508817A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7j8OscV0GQ9n for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 08:14:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A228176B
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66A228176B
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 08:14:19 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id t5so1047249oiw.1
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 00:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MAEGDq9atKnsjqsjik/oZvGwdv8c8dSvVnFyc4dTA10=;
 b=44I4O3cGcgtH7W2aZfUlQ0VdXCiAf3cn4vT7XrZK2N9HFe6ThGiyCK0q1gb+azdQ04
 yIqhkhwfIhA/rKftrq5/yodR9G6EPCKPvY9E7Rme+TEH6GEXJo246Lt0kxBLUWIT1uhQ
 oB6F+uvVGSsPJE8UyLYfFbANsekWeuYrgDKfNp7ptxqa1DCgZsdrDugu0zcPwgKI4E6J
 F/98ukQ8RSpvO/Yt1Rr5OT1Y8s200UULtrZDXnHrnR2AvCgnBBUknolcNrzfNvdSDHwL
 nGQKYzO0FPi9vkfOLnrh8iknhUVbbsxpMW+wQLpsJmFsAFrPTvuCOy91vD4oY++/ss/N
 fuhQ==
X-Gm-Message-State: AO0yUKXSTlwNJ0KzssQkGp9G1qrKVRXyLvfXTvm0MsiycFtrFqRaoSjU
 sFrDls4/CbSJGgak5Q5xjC1XegiVsniqC4GV9Nc=
X-Google-Smtp-Source: AK7set+J17quR8xX7yIHybzIwXMYYTQJ12+dFH09EIXEGR8wfjnrLpi02wdytf4BqvSai/s2i1qG/XeGrkkh+KgrbRs=
X-Received: by 2002:aca:da42:0:b0:367:18a6:eb14 with SMTP id
 r63-20020acada42000000b0036718a6eb14mr582078oig.208.1675930458292; Thu, 09
 Feb 2023 00:14:18 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
 <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
 <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
In-Reply-To: <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 9 Feb 2023 09:14:09 +0100
Message-ID: <CADYjeSuBvHsij7YTnyq5tW9jEv1JtV3u1WyYkX2cbffgkQ6_Kw@mail.gmail.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MAEGDq9atKnsjqsjik/oZvGwdv8c8dSvVnFyc4dTA10=;
 b=Zktl3rDk9/EugPbhXz7QeDi48SgwedRu/R+4xhsZfyVXUrpfQjl25Yrks+fjdYmv3b
 BCV4M3DMGpbeZxwPmnzuYdNUwaqZM+1l64UnRuoZTosIhrJNKaujkd6HEV9DG+DZCHEk
 zvB/UljMeobyLyJRKD83QO3pz3zRyxe9xQOAYWwHa/GgmbguGClVX5Lavmyh9GgoogZH
 aRuRsPn7ryb7M19jgzbuvFL9nFODPxrU9zzwKJlzgWZgJwQ4qQs1I/t3Jc6EPrxeuOPR
 AwB3h+EWkx4TQv1ZlUBt1y6sgRudgC6pJi4+KwS1BSOwfMGNHq6+IOvysUQVe2IX5o7l
 0hzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zktl3rDk
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8625157663788398307=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8625157663788398307==
Content-Type: multipart/alternative; boundary="000000000000a2882505f43ff7aa"

--000000000000a2882505f43ff7aa
Content-Type: text/plain; charset="UTF-8"

Hello Maxim,

Thanks for the explanation.

When I tried this : utils/scanpypi awscrt awsiotsdk -o package ,  I am
getting below error:

utils/scanpypi:21: DeprecationWarning: the imp module is deprecated in
favour of importlib; see the module's documentation for alternative uses
  import imp
Traceback (most recent call last):
  File "utils/scanpypi", line 23, in <module>
    import six.moves.urllib.request
ModuleNotFoundError: No module named 'six'

Any idea what this is about?

On Thu, 9 Feb 2023 at 06:35, Maxim Kochetkov <fido_max@inbox.ru> wrote:

>
>
> On 09.02.2023 00:28, Sourabh Hegde wrote:
> > Hello Maxim,
> >
> > Thanks for the update.
> >
> > I think for me, the option "18.9.3. Generating a python-package from a
> > PyPI repository"
> >
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packages
> <
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packages> is
> suited.
> > I want to install this package https://pypi.org/project/awsiotsdk/
> > <https://pypi.org/project/awsiotsdk/>. And this package requires
> > https://pypi.org/project/awscrt/ <https://pypi.org/project/awscrt/> as
> > dependency. Should I create both Buildroot packages from python packages?
>
> Sure.
>
> > In the Buildroot manual, it's mentioned "Find the external python
> > modules menu and insert your package inside.", what should I insert
> > here? source code?
>
> The output from scanpypi util. "This will generate packages python-foo
> and python-bar in the package folder if they exist on
> https://pypi.python.org."
>
> "external python modules" is located at package/Config.in:
>
> ...
> if BR2_PACKAGE_PYTHON3
> menu "External python modules"
>         source "package/python-aenum/Config.in"
>         source "package/python-aexpect/Config.in"
> ...
>
> Try this sequence:
>
> utils/scanpypi awscrt awsiotsdk -o package
>
> then add
>         source "package/python-awscrt/Config.in"
>         source "package/python-awsiotsdk/Config.in"
> to the package/Config.in
>

--000000000000a2882505f43ff7aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Maxim,<div><br></div><div>Thanks for the explanation=
.</div><div><br></div><div>When I tried this :=C2=A0utils/scanpypi awscrt a=
wsiotsdk -o package ,=C2=A0 I am getting below error:</div><div><br></div><=
div>utils/scanpypi:21: DeprecationWarning: the imp module is deprecated in =
favour of importlib; see the module&#39;s documentation for alternative use=
s<br>=C2=A0 import imp<br>Traceback (most recent call last):<br>=C2=A0 File=
 &quot;utils/scanpypi&quot;, line 23, in &lt;module&gt;<br>=C2=A0 =C2=A0 im=
port six.moves.urllib.request<br>ModuleNotFoundError: No module named &#39;=
six&#39;<br></div><div><br></div><div>Any idea what this is about?</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, 9 Feb 2023 at 06:35, Maxim Kochetkov &lt;<a href=3D"mailto:fido_max@in=
box.ru">fido_max@inbox.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
On 09.02.2023 00:28, Sourabh Hegde wrote:<br>
&gt; Hello Maxim,<br>
&gt; <br>
&gt; Thanks for the update.<br>
&gt; <br>
&gt; I think for me, the option &quot;18.9.3. Generating a python-package f=
rom a <br>
&gt; PyPI repository&quot; <br>
&gt; <a href=3D"https://buildroot.org/downloads/manual/manual.html#_infrast=
ructure_for_python_packages" rel=3D"noreferrer" target=3D"_blank">https://b=
uildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packag=
es</a> &lt;<a href=3D"https://buildroot.org/downloads/manual/manual.html#_i=
nfrastructure_for_python_packages" rel=3D"noreferrer" target=3D"_blank">htt=
ps://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_=
packages</a>&gt;=C2=A0is suited.<br>
&gt; I want to install this package <a href=3D"https://pypi.org/project/aws=
iotsdk/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/awsi=
otsdk/</a> <br>
&gt; &lt;<a href=3D"https://pypi.org/project/awsiotsdk/" rel=3D"noreferrer"=
 target=3D"_blank">https://pypi.org/project/awsiotsdk/</a>&gt;. And this pa=
ckage requires <br>
&gt; <a href=3D"https://pypi.org/project/awscrt/" rel=3D"noreferrer" target=
=3D"_blank">https://pypi.org/project/awscrt/</a> &lt;<a href=3D"https://pyp=
i.org/project/awscrt/" rel=3D"noreferrer" target=3D"_blank">https://pypi.or=
g/project/awscrt/</a>&gt;=C2=A0as <br>
&gt; dependency. Should I create both Buildroot packages from python packag=
es?<br>
<br>
Sure.<br>
<br>
&gt; In the Buildroot manual, it&#39;s mentioned &quot;Find the external py=
thon <br>
&gt; modules menu and insert your package inside.&quot;, what should I inse=
rt <br>
&gt; here? source code?<br>
<br>
The output from scanpypi util. &quot;This will generate packages python-foo=
 <br>
and python-bar in the package folder if they exist on <br>
<a href=3D"https://pypi.python.org" rel=3D"noreferrer" target=3D"_blank">ht=
tps://pypi.python.org</a>.&quot;<br>
<br>
&quot;external python modules&quot; is located at package/Config.in:<br>
<br>
...<br>
if BR2_PACKAGE_PYTHON3<br>
menu &quot;External python modules&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-aenum/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-aexpect/Config.in&q=
uot;<br>
...<br>
<br>
Try this sequence:<br>
<br>
utils/scanpypi awscrt awsiotsdk -o package<br>
<br>
then add<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-awscrt/Config.in&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/python-awsiotsdk/Config.in=
&quot;<br>
to the package/Config.in<br>
</blockquote></div>

--000000000000a2882505f43ff7aa--

--===============8625157663788398307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8625157663788398307==--
