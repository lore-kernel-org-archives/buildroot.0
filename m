Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B2FC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 23:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA93341B6A;
	Sat,  9 Dec 2023 23:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA93341B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDe0cfBCv5W4; Sat,  9 Dec 2023 23:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5E141B6F;
	Sat,  9 Dec 2023 23:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F5E141B6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BECDF1BF855
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 23:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9665E4026E
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 23:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9665E4026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EN7LemadqO9 for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 23:55:41 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7ED440150
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 23:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7ED440150
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-286e03467a3so2692203a91.2
 for <buildroot@buildroot.org>; Sat, 09 Dec 2023 15:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702166141; x=1702770941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ftPv35SWN4wQf+UdCEL/TB7M15sTleQje/vXVoqxGo=;
 b=IY5T20g72iTd+EQnyrkVU5m17Qhz4vnHlvgVQsxmCQZGXEuH38rRgkTZwZWoPjTUNo
 ntlm1opAS4Depx0wrfeTNt4Xl1THEZdyiT6TXFbXGJtp9hw+tXs+o5DKF9Xt9NW6tz8+
 2HtMuZRiT7y2cvJm7Xf4wOD790Ot7q+h4r1OJAy+CwI2ziRMvSkxOUmzK4UumLVLIKws
 /8skJ4LRYYcNE6XbQHdo6tsGscMNRJKuQxX/lEGhmmIwa4f4vo5olGR20GYa1E/rGI/w
 3JEhwgzy3Aaap4DzKxJGyM+UVgeQZHXTLH5DrrmfMg5WX2gKbD6qvA9XE/vP8D4eKy2k
 gu1Q==
X-Gm-Message-State: AOJu0YyaDrlVWiioSoVzsezGxzuOZ1VaLbdpucmLtaYbGrVaakNngAqG
 XjzuZaoDh8ds824uqMWbyVwnfwJxZi9Ag9VLekE=
X-Google-Smtp-Source: AGHT+IGCWfQHA1SVRGF8LsiyZLmcWI1DQFJDJAFSLWXLfCcZQlq6WQzdmAjYMYrwKqw7FnomK/D2eyBey0v4bavtCLM=
X-Received: by 2002:a17:90b:2396:b0:286:d13d:b2ee with SMTP id
 mr22-20020a17090b239600b00286d13db2eemr997375pjb.13.1702166140952; Sat, 09
 Dec 2023 15:55:40 -0800 (PST)
MIME-Version: 1.0
References: <CAPL9kM2QC4aXUyMe2HX5MQNR0U=8jDK_=0Eopjq_nGUL3ScVGw@mail.gmail.com>
 <3ac4d88c-4e69-4a64-b2ca-ceff46d3c7dd@mind.be>
In-Reply-To: <3ac4d88c-4e69-4a64-b2ca-ceff46d3c7dd@mind.be>
From: John Langholz <jlangholzj@gmail.com>
Date: Sat, 9 Dec 2023 18:55:30 -0500
Message-ID: <CAPL9kM0muzNiYenVmopFcb_Cp4d84-xRWysq0_1XWPgKNELx_w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702166141; x=1702770941; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4ftPv35SWN4wQf+UdCEL/TB7M15sTleQje/vXVoqxGo=;
 b=m08px08AWYNw6/UtnR0I+dfAulBhs/IOUoCzXqkFD3Hyj0AKMkWAH2TUCHF0dIMDt7
 mh1FOP/CLxDzl69NjHBjbnfYGmFoJpyBD0pRbEgCD6nd/j2Dj2og6g0wdv/NVbkXbhdI
 ynEpsLWt4jmXnmdwyORrOxEv0RGmT+OJ51w6+MRNg58NouNF+cMellxNR7wlatuN4xrq
 ypCPuv8YS4fOY908g6Ib735xcygahCh05Eo97EJ/CSVTYZWqRPDLOoY0l02Ag9slRgIf
 Uq/L/Cgl8mPIk+5Eh3gHL3egQ4m8UoXgvJEhpeZ2M0fLiYWt7Xd5eim8DfWHp8ssW/xG
 ybDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m08px08A
Subject: Re: [Buildroot] python and tkinter
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
Cc: John Langholz <jlangholzj@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5100793519784675292=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5100793519784675292==
Content-Type: multipart/alternative; boundary="0000000000002e26b2060c1c704e"

--0000000000002e26b2060c1c704e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arnout, I appreciate the insights.

I'll admit that I didn't fully understand the various idiosyncrasies with
the "disable/enable-tk" options in the python.mk file. Looking through the
file I did notice that the other python packages configurable in the make
menu (like SQLite, SSL, etc.) had the ifeq statements to add them as a
dependency. I understood that tkinter was installed with python but I was
curious why there wasn't a similar option for tk. Seeing all of this now, I
understand changing the options to "enable-tk" was really only half of the
equation.

I've been continuing to look around in my free time to try and (really)
understand how buildroot is working. I actually just got to reading about
how the various dependencies are built, so your reply is serendipitous. I
think the "simple" miss I had suspected is the missing dependency. If I
understand your response correctly, tk is still being installed and built
but without the dependency 1) the shared object isn't created and 2) python
also really doesn't know what to do with it anyway since it's (tk) not
being built first. That would explain everything I'm seeing on my end.

I'll add a line in the python.mk file for "PYTHON_DEPENDENCIES +=3D tk" and
try a build and see what happens and report back.
--=20
Thanks,

-Jungle_Jim

On Sat, Dec 9, 2023 at 5:58=E2=80=AFPM Arnout Vandecappelle <arnout@mind.be=
> wrote:

>
>
> On 02/12/2023 19:41, John Langholz wrote:
> > I've been working on making an image for a raspberry pi (specifically, =
a
> CM4)
> > and have hit a bit of a roadblock with python and tkinter. I've been
> able to
> > include some additional external modules and verified they work in a
> python
> > shell but I've been having issues getting tkinter to work appropriately=
.
> When
> > I'm in a python shell and try "import tkinter" it throws a traceback
> error:
> >
> > |Traceback (most recent call last): File =E2=80=9C<stdin>=E2=80=9D, lin=
e 1, in <module>
> File
> > =E2=80=9C/usr/lib/python311/tkinter/__init__.py=E2=80=9D, line 38 in <m=
odule>
> > ModuleNotFoundError: No module named =E2=80=98_tkinter=E2=80=99 |
>
>   tkinter.py is always installed, but it simply tries to import the
> _tkinter.so
> shared object file. Since we pass --disable-tk in the configuration of
> python3,
> this shared object file doesn't exist.
>
> >
> > I understand what the error itself means (that it can't find the tkinte=
r
> module)
> > but I'd like to figure out why this isn't getting included in the build=
.
> From my
> > understanding, by default the option for tkinter was disabled in the
> > |/packages/python3/python.mk <http://python.mk>| file. I changed all
> the
> > |--disable tk| statements to |--enable tk|. I additionally ensured the
> tcl and
> > tk target packages (under "Language interpreter" and "graphical
> interface",
> > respectively) were included.
>
>   You'll also need to add a dependency to python.mk, to make sure tk is
> built
> before python.
>
>   However, if no option was added to enable tkinter, then perhaps that's
> because
> nobody has gotten it to work up till now...
>
> >
> > I verified in the flashed image that under |/usr/..../python3.11/| ther=
e
> is a
> > tkinter folder that has an |__init__.py| script as expected (which base=
d
> on the
> > callback error it's finding). The existence of the
> > |/usr/..../python3.11/tkinter| folder leads me to believe that tkinter
> is being
> > added/built with python but there's something else with the
> configuration that's
> > not correct.
>
>   Well, the current --disable-tk option is a bit of a hack: it still
> installs
> the tkinter folder but the shared object file is missing.
>
>   I think this will be "solved" when we go to python 3.12, in that there
> will
> not be a tkinter folder at all. But that doesn't help you of course :-)
>
>
> > Searching the archives and around the internet, I found a few other
> mentions of
> > a similar issue that were resolved with various patches. I created a
> global
> > patch folder one level up (outside) of my buildroot dir and configured
> the
> > global patch directory in the makemenu. I tried including the patches i=
n
> a
> > "/python3/" directory within the global patch dir but I've not had
> positive
> > results with those either.
> >
> > This is all a long way of saying that I feel I'm missing something
> *simple* here
> > but for the life of me I can't figure out what. Any suggestions?
>
>   It is probably not simple to build tkinter... Although... I just tried =
a
> build
> with --enable-tk and with tk added to PYTHON3_DEPENDENCIES, and I do get =
a
> /usr/lib/python3.11/lib-dynload/_tkinter.cpython-311-x86_64-linux-gnu.so
> - I
> have not tried importing it, but I don't see why it shouldn't work...
>
>   Regards,
>   Arnout
>
>

--0000000000002e26b2060c1c704e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Arnout, I appreciate the insights. <br></div><div><br=
></div><div>I&#39;ll admit that I didn&#39;t fully understand the various i=
diosyncrasies with the &quot;disable/enable-tk&quot; options in the <a href=
=3D"http://python.mk">python.mk</a> file. Looking through the file I did no=
tice that the other python packages configurable in the make menu (like SQL=
ite, SSL, etc.) had the ifeq statements to add them as a dependency. I unde=
rstood that tkinter was installed with python but I was curious why there w=
asn&#39;t a similar option for tk. Seeing all of this now, I understand cha=
nging the options to &quot;enable-tk&quot; was really only half of the equa=
tion.<br></div><div><br></div><div>I&#39;ve been continuing to look around =
in my free time to try and (really) understand how buildroot is working. I =
actually just got to reading about how the various dependencies are built, =
so your reply is serendipitous. I think the &quot;simple&quot; miss I had s=
uspected is the missing dependency. If I understand your response correctly=
, tk is still being installed and built but without the dependency 1) the s=
hared object isn&#39;t created and 2) python also really doesn&#39;t know w=
hat to do with it anyway since it&#39;s (tk) not being built first. That wo=
uld explain everything I&#39;m seeing on my end.<br></div><div><br></div><d=
iv>I&#39;ll add a line in the <a href=3D"http://python.mk">python.mk</a> fi=
le for &quot;PYTHON_DEPENDENCIES +=3D tk&quot; and try a build and see what=
 happens and report back.<br></div><div></div><div>
<span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr">Thanks,<div><br></div><div>-Jungle_Ji=
m</div></div></div>

</div><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sat, Dec 9, 2023 at 5:58=E2=80=AFPM Arnout Vandecappelle &lt;=
<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 02/12/2023 19:41, John Langholz wrote:<br>
&gt; I&#39;ve been working on making an image for a raspberry pi (specifica=
lly, a CM4) <br>
&gt; and have hit a bit of a roadblock with python and tkinter. I&#39;ve be=
en able to <br>
&gt; include some additional external modules and verified they work in a p=
ython <br>
&gt; shell but I&#39;ve been having issues getting tkinter to work appropri=
ately. When <br>
&gt; I&#39;m in a python shell and try &quot;import tkinter&quot; it throws=
 a traceback error:<br>
&gt; <br>
&gt; |Traceback (most recent call last): File =E2=80=9C&lt;stdin&gt;=E2=80=
=9D, line 1, in &lt;module&gt; File <br>
&gt; =E2=80=9C/usr/lib/python311/tkinter/__init__.py=E2=80=9D, line 38 in &=
lt;module&gt; <br>
&gt; ModuleNotFoundError: No module named =E2=80=98_tkinter=E2=80=99 |<br>
<br>
=C2=A0 tkinter.py is always installed, but it simply tries to import the _t=
kinter.so <br>
shared object file. Since we pass --disable-tk in the configuration of pyth=
on3, <br>
this shared object file doesn&#39;t exist.<br>
<br>
&gt; <br>
&gt; I understand what the error itself means (that it can&#39;t find the t=
kinter module) <br>
&gt; but I&#39;d like to figure out why this isn&#39;t getting included in =
the build. From my <br>
&gt; understanding, by default the option for tkinter was disabled in the <=
br>
&gt; |/packages/python3/<a href=3D"http://python.mk" rel=3D"noreferrer" tar=
get=3D"_blank">python.mk</a> &lt;<a href=3D"http://python.mk" rel=3D"norefe=
rrer" target=3D"_blank">http://python.mk</a>&gt;| file. I changed all the <=
br>
&gt; |--disable tk| statements to |--enable tk|. I additionally ensured the=
 tcl and <br>
&gt; tk target packages (under &quot;Language interpreter&quot; and &quot;g=
raphical interface&quot;, <br>
&gt; respectively) were included.<br>
<br>
=C2=A0 You&#39;ll also need to add a dependency to <a href=3D"http://python=
.mk" rel=3D"noreferrer" target=3D"_blank">python.mk</a>, to make sure tk is=
 built <br>
before python.<br>
<br>
=C2=A0 However, if no option was added to enable tkinter, then perhaps that=
&#39;s because <br>
nobody has gotten it to work up till now...<br>
<br>
&gt; <br>
&gt; I verified in the flashed image that under |/usr/..../python3.11/| the=
re is a <br>
&gt; tkinter folder that has an |__init__.py| script as expected (which bas=
ed on the <br>
&gt; callback error it&#39;s finding). The existence of the <br>
&gt; |/usr/..../python3.11/tkinter| folder leads me to believe that tkinter=
 is being <br>
&gt; added/built with python but there&#39;s something else with the config=
uration that&#39;s <br>
&gt; not correct.<br>
<br>
=C2=A0 Well, the current --disable-tk option is a bit of a hack: it still i=
nstalls <br>
the tkinter folder but the shared object file is missing.<br>
<br>
=C2=A0 I think this will be &quot;solved&quot; when we go to python 3.12, i=
n that there will <br>
not be a tkinter folder at all. But that doesn&#39;t help you of course :-)=
<br>
<br>
<br>
&gt; Searching the archives and around the internet, I found a few other me=
ntions of <br>
&gt; a similar issue that were resolved with various patches. I created a g=
lobal <br>
&gt; patch folder one level up (outside) of my buildroot dir and configured=
 the <br>
&gt; global patch directory in the makemenu. I tried including the patches =
in a <br>
&gt; &quot;/python3/&quot; directory within the global patch dir but I&#39;=
ve not had positive <br>
&gt; results with those either.<br>
&gt; <br>
&gt; This is all a long way of saying that I feel I&#39;m missing something=
 *simple* here <br>
&gt; but for the life of me I can&#39;t figure out what. Any suggestions?<b=
r>
<br>
=C2=A0 It is probably not simple to build tkinter... Although... I just tri=
ed a build <br>
with --enable-tk and with tk added to PYTHON3_DEPENDENCIES, and I do get a =
<br>
/usr/lib/python3.11/lib-dynload/_<a href=3D"http://tkinter.cpython-311-x86_=
64-linux-gnu.so" rel=3D"noreferrer" target=3D"_blank">tkinter.cpython-311-x=
86_64-linux-gnu.so</a> - I <br>
have not tried importing it, but I don&#39;t see why it shouldn&#39;t work.=
..<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
</blockquote></div></div>

--0000000000002e26b2060c1c704e--

--===============5100793519784675292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5100793519784675292==--
