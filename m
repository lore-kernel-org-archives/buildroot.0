Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5959DC83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 21:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF4B6006A;
	Sun, 27 Aug 2023 21:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF4B6006A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vs0rSv2aaa9g; Sun, 27 Aug 2023 21:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D1460AC9;
	Sun, 27 Aug 2023 21:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D1460AC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5A351BF4D7
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 21:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BED9A60AC9
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 21:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BED9A60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-K_sCIGvv7S for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 21:28:17 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 443D760AC0
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 21:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 443D760AC0
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50079d148aeso3910090e87.3
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 14:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693171695; x=1693776495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p7epHiQBhgzyA77OLx/hwI/a74VxZaERDDI5wUnHz2Y=;
 b=NbXv7CxgnaNcGtK2pdGuaCz+anob6KUzPs64kqN3HlHdpOic72MjrPhcWcfGje1xa7
 weMVpGDmC5KOiqTegR3w32qh5gXwZI/xxaq/9Lc0oBKmbZySbSN4C7sEBKneqIKOZVpd
 uHSDKTN3oAgtqxDTJgQ0b7xt88vxyJO5eVAqhHeTsLH+yH3oX1VE7xxOQi/mkTDdRP6S
 Nhii2O8UEId+NNoV9e7hAg6uATvrC9ENHzRRIH+A6vHj9rOZx5kpp6f5e9OiRoQRYjb8
 9tKG6pgLYYECX5lS0fZtLn4FTMcV8B7w2VONEtUa9p+l00fUTPiL0VgdC6eCMRHj/Zr3
 KY9g==
X-Gm-Message-State: AOJu0Yy+5x67uypsJ7r8wLcy7yMuTNdvbw0k4bvMwAd/fBTAk5oW3A9Z
 waW3Zfo9FQHfMDPpOMb0An6yhCEmyP9rEqmw54M=
X-Google-Smtp-Source: AGHT+IGQ2WrZiLfDX8FxTZkaIcjsVyv8MWmz/qpv3/aUWdX4bmCuAoIyyXYQbb03ptOrRdlDFrEMMH+j71DQmBZ98js=
X-Received: by 2002:ac2:41c4:0:b0:500:b553:c09e with SMTP id
 d4-20020ac241c4000000b00500b553c09emr1624421lfi.32.1693171694794; Sun, 27 Aug
 2023 14:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHfxMJ6M-R8oHY-8ChxdhanpcL2_04mYARHSxW=YS_gw7Npctg@mail.gmail.com>
 <20230826233915.2e1a535a@windsurf>
In-Reply-To: <20230826233915.2e1a535a@windsurf>
From: erichiggins@gmail.com
Date: Sun, 27 Aug 2023 14:28:03 -0700
Message-ID: <CAHfxMJ4XUwGLDSJVCHe0o-9Nqo3x4C1TKiz04bOAxAfR2vFwdg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693171695; x=1693776495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p7epHiQBhgzyA77OLx/hwI/a74VxZaERDDI5wUnHz2Y=;
 b=rKzb8zNbeRR9tVTteY48T+21GzD5qTKCmWoQP65e+PJ3sy2X3chVIWw0h9DC7DPz3e
 n7qKXujcHusLHC8kFwREI0gzvtjn8GJCE0qmrIIMtCIAJhNrgRQeJDQEu4bwX83axzxB
 yJVvh6wzb3kYteYuvC0P/lXZNR7kNJhpRMMbKzy8DB08bXXhM6ZMlevLjB3WLXrshzxV
 7GOKucYHDWIaB9b4Qo3jDiO3r9MwsE/pYFlP29xQ6PhCVK19dF3M3sIUQ1jO7IC+qkwC
 lNDITAtEZth+36wfM/eWbIkfFT4b81ou+GpT2d0oYbCv8SOPyW9arlaOstQ/tIKNsdd5
 7S0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rKzb8zNb
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4213725451849892647=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4213725451849892647==
Content-Type: multipart/alternative; boundary="000000000000697b4e0603ee4120"

--000000000000697b4e0603ee4120
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Responses inline below.



> > Issue description:
> > The `utils/scanpypi` script makes an erroneous assumption that Python
> > packages will call `setup()` with the `name` argument. It's not
> > required and not often used. This causes the script to fail to load
> > many packages from Pypi.
> >  For example,  `./utils/scanpypi wheel` returns the following error:
> > > `Error: Could not install package wheel: 'name'`
>
> Do you have a current example that fails due to this? The wheel package
> does pass a name= attribute to its setup() function, and it has been
> doing this for many years. Looking at the initial commit of
> https://github.com/pypa/wheel:
>
> diff --git a/setup.py b/setup.py
> new file mode 100644
> index 0000000..09a138e
> --- /dev/null
> +++ b/setup.py
> @@ -0,0 +1,33 @@
> +import os
> +
> +from setuptools import setup
> +
> +here = os.path.abspath(os.path.dirname(__file__))
> +README = open(os.path.join(here, 'README.txt')).read()
> +CHANGES = open(os.path.join(here, 'CHANGES.txt')).read()
> +
> +setup(name='wheel',
> +      version='0.1',
> +      description='A built-package installer for Python.',
> +      long_description=README + '\n\n' +  CHANGES,
> +      classifiers=[
> +        "Development Status :: 1 - ",
> +        "Intended Audience :: Developers",
>
> So I'm a bit puzzled at how you found a wheel package that doesn't pass
> "name" in its setup() arguments.
>


Perhaps now it does, but as of version 0.38.4 (released Nov 2022) it did
not.
https://github.com/pypa/wheel/blob/0.38.4/setup.py
The wheel package appears to have switched to use project.toml instead of
setup.py as of version 0.40.0

Regardless, the larger point remains. The `name` attribute is not required
and therefore should not be expected/enforced by buildroot's utilities.



> > diff --git a/utils/scanpypi b/utils/scanpypi
> > index 452b4a3fc3..a5522a879e 100755
> > --- a/utils/scanpypi
> > +++ b/utils/scanpypi
> > @@ -58,8 +58,9 @@ def setup_decorator(func, method):
> >      def closure(*args, **kwargs):
> >          # Any python packages calls its setup function to be installed.
> >          # Argument 'name' of this setup function is the package's name
> > -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
> > -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
> > +        name = kwargs.get('name', BuildrootPackage.setup_args['name'])
> > +        BuildrootPackage.setup_args[name] = kwargs
> > +        BuildrootPackage.setup_args[name]['method'] = method
> >      return closure
> >
> >  # monkey patch
> > @@ -147,6 +148,7 @@ class BuildrootPackage():
> >          self.url = None
> >          self.version = None
> >          self.license_files = []
> > +        self.setup_args['name'] = self.real_name
>
> I'm not a big fan of shoehorning 'name' in setup_args, which as I
> understand it is a dict that should contain a single key named after
> the package. Perhaps it would be better to make "self.real_name" a
> class variable rather than an instance variable, just like setup_args
> is already, so that setup_decorator can access it. If I understand the
> current implementation correctly, it anyway expects the
> BuildrootPackage() class to have only one instance.
>
> What do you think?
>

I'm agnostic about the implementation. I took the approach of making the
minimal viable change that resolved the issue given the existing framework
without introducing additional complexity. It sounds like James is planning
a refactor -- perhaps my patch will suffice to resolve the issue until that
happens?


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000697b4e0603ee4120
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,<div><br></div><div>Responses i=
nline below.</div></div><div class=3D"gmail_quote"><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Issue description:<br>
&gt; The `utils/scanpypi` script makes an erroneous assumption that Python<=
br>
&gt; packages will call `setup()` with the `name` argument. It&#39;s not<br=
>
&gt; required and not often used. This causes the script to fail to load<br=
>
&gt; many packages from Pypi.<br>
&gt;=C2=A0 For example,=C2=A0 `./utils/scanpypi wheel` returns the followin=
g error:<br>
&gt; &gt; `Error: Could not install package wheel: &#39;name&#39;`=C2=A0 <b=
r>
<br>
Do you have a current example that fails due to this? The wheel package<br>
does pass a name=3D attribute to its setup() function, and it has been<br>
doing this for many years. Looking at the initial commit of<br>
<a href=3D"https://github.com/pypa/wheel" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/pypa/wheel</a>:<br>
<br>
diff --git a/setup.py b/setup.py<br>
new file mode 100644<br>
index 0000000..09a138e<br>
--- /dev/null<br>
+++ b/setup.py<br>
@@ -0,0 +1,33 @@<br>
+import os<br>
+<br>
+from setuptools import setup<br>
+<br>
+here =3D os.path.abspath(os.path.dirname(__file__))<br>
+README =3D open(os.path.join(here, &#39;README.txt&#39;)).read()<br>
+CHANGES =3D open(os.path.join(here, &#39;CHANGES.txt&#39;)).read()<br>
+<br>
+setup(name=3D&#39;wheel&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 version=3D&#39;0.1&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 description=3D&#39;A built-package installer for Pyth=
on.&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 long_description=3DREADME + &#39;\n\n&#39; +=C2=A0 CH=
ANGES,<br>
+=C2=A0 =C2=A0 =C2=A0 classifiers=3D[<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Development Status :: 1 - &quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Intended Audience :: Developers&quot;,<b=
r>
<br>
So I&#39;m a bit puzzled at how you found a wheel package that doesn&#39;t =
pass<br>
&quot;name&quot; in its setup() arguments.<br></blockquote><div><br></div><=
div><div><br class=3D"gmail-Apple-interchange-newline">Perhaps now it does,=
 but as of version 0.38.4 (released Nov 2022) it did not.<br></div><div><a =
href=3D"https://github.com/pypa/wheel/blob/0.38.4/setup.py">https://github.=
com/pypa/wheel/blob/0.38.4/setup.py</a><br></div><div>The wheel package app=
ears to have switched to use project.toml instead of setup.py as of version=
 0.40.0</div><div><br></div><div>Regardless, the larger point remains. The =
`name` attribute is not required and therefore should not be expected/enfor=
ced by buildroot&#39;s utilities.</div><div><br></div></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/utils/scanpypi b/utils/scanpypi<br>
&gt; index 452b4a3fc3..a5522a879e 100755<br>
&gt; --- a/utils/scanpypi<br>
&gt; +++ b/utils/scanpypi<br>
&gt; @@ -58,8 +58,9 @@ def setup_decorator(func, method):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def closure(*args, **kwargs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Any python packages calls its setu=
p function to be installed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Argument &#39;name&#39; of this se=
tup function is the package&#39;s name<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[kwargs[&#39;n=
ame&#39;]] =3D kwargs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[kwargs[&#39;n=
ame&#39;]][&#39;method&#39;] =3D method<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D kwargs.get(&#39;name&#39;, Build=
rootPackage.setup_args[&#39;name&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[name] =3D kwa=
rgs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BuildrootPackage.setup_args[name][&#39;me=
thod&#39;] =3D method<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return closure<br>
&gt; <br>
&gt;=C2=A0 # monkey patch<br>
&gt; @@ -147,6 +148,7 @@ class BuildrootPackage():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.url =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.version =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.license_files =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.setup_args[&#39;name&#39;] =3D self.=
real_name<br>
<br>
I&#39;m not a big fan of shoehorning &#39;name&#39; in setup_args, which as=
 I<br>
understand it is a dict that should contain a single key named after<br>
the package. Perhaps it would be better to make &quot;self.real_name&quot; =
a<br>
class variable rather than an instance variable, just like setup_args<br>
is already, so that setup_decorator can access it. If I understand the<br>
current implementation correctly, it anyway expects the<br>
BuildrootPackage() class to have only one instance.<br>
<br>
What do you think?<br></blockquote><div><br></div><div>I&#39;m agnostic abo=
ut the implementation. I took the approach of making the minimal viable cha=
nge that resolved the issue given the existing framework without introducin=
g additional complexity. It sounds like James is planning a refactor -- per=
haps my patch will suffice to resolve the issue until that happens?</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>
</div>

--000000000000697b4e0603ee4120--

--===============4213725451849892647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4213725451849892647==--
