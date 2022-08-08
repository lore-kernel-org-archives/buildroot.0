Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64944C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 13:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F074960E5E;
	Mon,  8 Aug 2022 13:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F074960E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48xyIeEFiOF1; Mon,  8 Aug 2022 13:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE10760E4A;
	Mon,  8 Aug 2022 13:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE10760E4A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F40361BF356
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 13:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C38DE417CB
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 13:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38DE417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwuKV7DxQflO for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 13:19:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE3D741725
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE3D741725
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 13:19:42 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z6so5176453lfu.9
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 06:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=D2LoPt/nVh5qiqfUe7aVgGsYejpNNPluOHnHWVMa/pc=;
 b=PX6NYyM4oO0a4Y5QlM9Rs7XHn39+B6Hk7BLJm33baqi3UaJTABiOTegZFHaubpahiQ
 z76cA+/YUgWkoxiGN1CGNqdwF0Zf+N+fkAcNv6dPoSW1NV/pZvKHP49OuZBSxAW+qolc
 Kz6gU3PmBuyQZiBqxZc4d9XPVhWKsLTz66Wws/a+OhS2Ds2Vb0SLIG/FM8/nk0GeaXWs
 IRtFoIRB+6ujB4GIx4SOuPtoMLeu2DdxzueoDbp3beqfEyVb+UaO+BAuwrZgQZNgsJl1
 BtcWocDEpoWSPtxroYwTxKFguGEpbdQZ3e05wNm9Hd2QRmiwHDXeGi2LKvYXe3VVaAsD
 5+1A==
X-Gm-Message-State: ACgBeo26qUPfB5C3pI1WoKIGaozsObbEca5NzziEglPDF6XQs1fw2gQx
 k3kRxm6wotBLdj+8DhVDVFqxfq5rBIjbCaXojCbMxXmVWB8yCw==
X-Google-Smtp-Source: AA6agR6N2UT5kQx/lNMM4oB377cJysdm43No17YLdhTbQnxHaCCOCX32wmVmlJS0iL3BB7mcp/z3p/mizvX8ox61Ylo=
X-Received: by 2002:a05:6512:1587:b0:481:1946:8e1c with SMTP id
 bp7-20020a056512158700b0048119468e1cmr6972340lfb.163.1659964780594; Mon, 08
 Aug 2022 06:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <20220808122020.0c1ec66a@windsurf>
In-Reply-To: <20220808122020.0c1ec66a@windsurf>
From: Federico Pellegrin <fede@evolware.org>
Date: Mon, 8 Aug 2022 15:19:29 +0200
Message-ID: <CAM6O0ZjLizEsUWZr106T6+WowWdkqE7k_a1bCaPeAVbPScZ6Ag@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1656757128421616370=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1656757128421616370==
Content-Type: multipart/alternative; boundary="000000000000164a1f05e5baabfe"

--000000000000164a1f05e5baabfe
Content-Type: text/plain; charset="UTF-8"

Hi Thomas, Marcus,
Many thanks for your feedback and ideas!

I've looked a bit more now after your feedback online and indeed found that
likely it's mostly rt-tests (or other packages with a similar behaviour, as
mentioned by Marcus) that may be wrong-doing.

Indeed according to:
https://docs.python.org/3/install/#alternate-installation-unix-the-prefix-scheme
my understanding would be that they should indeed go to  *prefix*/bin and
not with the modules.
This link
https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument
also somehow confirms it I believe as also setuptools assume the
possibility to deliver them.
So after all if rt-tests (or similar) would follow that, Buildroot py->pyc
should be safe, assuming that those script will not be converted.

I'll try to contact the rt-tests team and see what they think of this and
come back with a patch for Buildroot!

Cheers,
Federico


Il giorno lun 8 ago 2022 alle ore 12:20 Thomas Petazzoni <
thomas.petazzoni@bootlin.com> ha scritto:

> Hello Federico,
>
> On Mon, 8 Aug 2022 09:40:02 +0200
> Federico Pellegrin <fede@evolware.org> wrote:
>
> > I've found a minor problem related to the rt-tests package, but that
> maybe
> > is slightly more generic and wanted to report and in case understand
> which
> > approach would be best to fix it (and contribute a patch then if
> possible).
> >
> > The specific problem: rt-tests, besides a few compiled executables,
> > installs also two tools which are written in Python, namely hwlatdetect
> and
> > get_cyclictest_snapshot. These are Python scripts which get installed in
> > the PYLIB and then a symbolic link is done from /usr/bin to them, so ie
> we
> > have: /usr/bin/hwlatdetect ->
> > /usr/lib/python3.10/site-packages//hwlatdetect.py
> >
> > Needless to say that once the pycompile.py script is run and original .py
> > files are removed, of course in the "PYC only" setup (which is the
> > default), then the link is broken and it will not work.
> > Additionally that pyc files will not work for scripts like that, so just
> > somehow fixing the link mentioned above would anyhow not work, as you
> need
> > to execute them eventually by explicitly naming the interpreter.
> >
> > I could imagine that we could have some similar other cases when we are
> > installing Python scripts directly executed in PYLIB and not modules. But
> > I'm not sure that installing the scripts there is a good idea as well,
> > comparing with other distros that doesn't seem to be the case.
> > So maybe the problem is really in rt-tests after all and the location
> those
> > scripts get installed and I may just fix it that way (and contact
> upstream)?
> > Otherwise should it be more generic maybe could make sense to have a
> > facility to list some files that should not be converted to PYC?
>
> Thanks for your bug report.
>
> My initial gut feeling would indeed be that it is strange to install
> scripts in /usr/lib/python, and they should be installed in /usr/bin
> instead, so that /usr/lib/python is only for Python modules that can be
> byte-compiled. However, I am not an expert at all in terms of Python
> best practices and latest standards.
>
> But from a Buildroot perspective, it really makes a lot of sense to be
> able to do the byte-compilation at build-time (to save on startup time)
> and drop the .py files (to save on filesystem footprint).
>
> For the rt-tests case, I would therefore suggest to move those scripts
> to /usr/bin.
>
> Of course, if that problem shows up in more packages, then yes we could
> think of a mechanism for packages to declare a number of py files that
> should not be byte-compiled, and that should be preserved on the target.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000164a1f05e5baabfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi Thomas, Marcus,</div><div>Many than=
ks for your feedback and ideas!</div><div><br></div><div>I&#39;ve looked a =
bit more now after your feedback online and indeed found that likely it&#39=
;s mostly rt-tests (or other packages with a similar behaviour, as mentione=
d by Marcus) that may be wrong-doing.</div><div><br></div><div>Indeed accor=
ding to: <a href=3D"https://docs.python.org/3/install/#alternate-installati=
on-unix-the-prefix-scheme">https://docs.python.org/3/install/#alternate-ins=
tallation-unix-the-prefix-scheme</a> my understanding would be that they sh=
ould indeed go to=C2=A0 <code class=3D"gmail-file gmail-docutils gmail-lite=
ral gmail-notranslate"><em><span class=3D"gmail-pre">prefix</span></em><spa=
n class=3D"gmail-pre">/bin <font face=3D"arial,sans-serif">and not with the=
 modules.</font></span></code></div><div><code class=3D"gmail-file gmail-do=
cutils gmail-literal gmail-notranslate"><span class=3D"gmail-pre"><font fac=
e=3D"arial,sans-serif">This link <a href=3D"https://python-packaging.readth=
edocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument">=
https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html=
#the-scripts-keyword-argument</a>=C2=A0 also somehow confirms it I believe =
as also setuptools assume the possibility to deliver them.</font></span></c=
ode></div><div><code class=3D"gmail-file gmail-docutils gmail-literal gmail=
-notranslate"><span class=3D"gmail-pre"><font face=3D"arial,sans-serif">So =
after all if rt-tests (or similar) would follow that, Buildroot py-&gt;pyc =
should be safe, assuming that those script will not be converted.<br></font=
></span></code></div><div><code class=3D"gmail-file gmail-docutils gmail-li=
teral gmail-notranslate"><span class=3D"gmail-pre"><font face=3D"arial,sans=
-serif"><br></font></span></code></div><div><code class=3D"gmail-file gmail=
-docutils gmail-literal gmail-notranslate"><span class=3D"gmail-pre"><font =
face=3D"arial,sans-serif">I&#39;ll try to contact the rt-tests team and see=
 what they think of this and come back with a patch for Buildroot!<br></fon=
t></span></code></div><div><code class=3D"gmail-file gmail-docutils gmail-l=
iteral gmail-notranslate"><span class=3D"gmail-pre"><font face=3D"arial,san=
s-serif"><br></font></span></code></div><div><code class=3D"gmail-file gmai=
l-docutils gmail-literal gmail-notranslate"><span class=3D"gmail-pre"><font=
 face=3D"arial,sans-serif">Cheers,</font></span></code></div><div><code cla=
ss=3D"gmail-file gmail-docutils gmail-literal gmail-notranslate"><span clas=
s=3D"gmail-pre"><font face=3D"arial,sans-serif">Federico<br></font></span><=
/code></div><div><code class=3D"gmail-file gmail-docutils gmail-literal gma=
il-notranslate"><span class=3D"gmail-pre"><font face=3D"arial,sans-serif"><=
br></font></span></code></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il giorno lun 8 ago 2022 alle ore 12:20 Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello Federico,<br>
<br>
On Mon, 8 Aug 2022 09:40:02 +0200<br>
Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.org" target=3D"_blan=
k">fede@evolware.org</a>&gt; wrote:<br>
<br>
&gt; I&#39;ve found a minor problem related to the rt-tests package, but th=
at maybe<br>
&gt; is slightly more generic and wanted to report and in case understand w=
hich<br>
&gt; approach would be best to fix it (and contribute a patch then if possi=
ble).<br>
&gt; <br>
&gt; The specific problem: rt-tests, besides a few compiled executables,<br=
>
&gt; installs also two tools which are written in Python, namely hwlatdetec=
t and<br>
&gt; get_cyclictest_snapshot. These are Python scripts which get installed =
in<br>
&gt; the PYLIB and then a symbolic link is done from /usr/bin to them, so i=
e we<br>
&gt; have: /usr/bin/hwlatdetect -&gt;<br>
&gt; /usr/lib/python3.10/site-packages//hwlatdetect.py<br>
&gt; <br>
&gt; Needless to say that once the pycompile.py script is run and original =
.py<br>
&gt; files are removed, of course in the &quot;PYC only&quot; setup (which =
is the<br>
&gt; default), then the link is broken and it will not work.<br>
&gt; Additionally that pyc files will not work for scripts like that, so ju=
st<br>
&gt; somehow fixing the link mentioned above would anyhow not work, as you =
need<br>
&gt; to execute them eventually by explicitly naming the interpreter.<br>
&gt; <br>
&gt; I could imagine that we could have some similar other cases when we ar=
e<br>
&gt; installing Python scripts directly executed in PYLIB and not modules. =
But<br>
&gt; I&#39;m not sure that installing the scripts there is a good idea as w=
ell,<br>
&gt; comparing with other distros that doesn&#39;t seem to be the case.<br>
&gt; So maybe the problem is really in rt-tests after all and the location =
those<br>
&gt; scripts get installed and I may just fix it that way (and contact upst=
ream)?<br>
&gt; Otherwise should it be more generic maybe could make sense to have a<b=
r>
&gt; facility to list some files that should not be converted to PYC?<br>
<br>
Thanks for your bug report.<br>
<br>
My initial gut feeling would indeed be that it is strange to install<br>
scripts in /usr/lib/python, and they should be installed in /usr/bin<br>
instead, so that /usr/lib/python is only for Python modules that can be<br>
byte-compiled. However, I am not an expert at all in terms of Python<br>
best practices and latest standards.<br>
<br>
But from a Buildroot perspective, it really makes a lot of sense to be<br>
able to do the byte-compilation at build-time (to save on startup time)<br>
and drop the .py files (to save on filesystem footprint).<br>
<br>
For the rt-tests case, I would therefore suggest to move those scripts<br>
to /usr/bin.<br>
<br>
Of course, if that problem shows up in more packages, then yes we could<br>
think of a mechanism for packages to declare a number of py files that<br>
should not be byte-compiled, and that should be preserved on the target.<br=
>
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

--000000000000164a1f05e5baabfe--

--===============1656757128421616370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1656757128421616370==--
