Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3036C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 04:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B5580D7E;
	Tue,  9 Aug 2022 04:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B5580D7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipbSwtCfYcXB; Tue,  9 Aug 2022 04:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 487D48188A;
	Tue,  9 Aug 2022 04:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 487D48188A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B66A01BF2C4
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 04:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5E940136
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 04:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F5E940136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lmt14qUN-ZqQ for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 04:50:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20AC6400E7
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20AC6400E7
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 04:50:00 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id z20so11876075ljq.3
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 21:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aR52r/F2QkzRjuG8JlIxmcxKq4NiReC+HcjHkPWvZXM=;
 b=myEfHMOSAzoEe/zxA/JfgadNLmfYiWlRPmI99md+SuX0XPDOWI4x/G9Sn4K6Yf9zMU
 oBHXVovpG8DX9CPPMPJxdcqh5qh3jQDBtKxllHR1VB/umVURfYoC9+G8tMZ+rswVg5B4
 K8e4kY87BNWzBh+G427OAW5xn75Ctzs9Pzlm7mzDOcdXugUcme8Ykyue3jZfN3TUnmrt
 J6n9V7/b6y37R3Cnq/Sn3fDHHm38M3GF6DIyZBsbB2CWfAJav7o+TQyeXYAgR0rhcaFe
 gL+CGLrCGzV0CGNaaSWtLCeJTxxiZxopIXjSo3Txl0ieWJffy0bmRy+PzgzLWTNr3Jlw
 UmGA==
X-Gm-Message-State: ACgBeo0suywlVrBxnpSPTS5QiKF7/MsfXMDFOl0Ulos6swTDLBJ37FNV
 lzOj67zbYlll3qjbQhLJm2UEQhyDTE0y+6HPBo4=
X-Google-Smtp-Source: AA6agR5mY6vGhRU2YuCWCcmeJj4GdOvopZTWqx4Gu6B3L0DtKob1wgRv5usEWTKhMvVGMRwxJAdqsAWAIwREBp0Zb4g=
X-Received: by 2002:a05:651c:4d4:b0:25e:c766:202e with SMTP id
 e20-20020a05651c04d400b0025ec766202emr3935191lji.423.1660020597776; Mon, 08
 Aug 2022 21:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <20220808122020.0c1ec66a@windsurf>
 <CAM6O0ZjLizEsUWZr106T6+WowWdkqE7k_a1bCaPeAVbPScZ6Ag@mail.gmail.com>
 <ea0d3b02-e5e1-9f4d-0d3a-a498f5d184f0@mind.be>
In-Reply-To: <ea0d3b02-e5e1-9f4d-0d3a-a498f5d184f0@mind.be>
From: Federico Pellegrin <fede@evolware.org>
Date: Tue, 9 Aug 2022 06:49:46 +0200
Message-ID: <CAM6O0ZicaNFBn--yCoWOUkZZ3wBLKY24SDjTjsGz2y0Mbjy_1w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4296123319689172726=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4296123319689172726==
Content-Type: multipart/alternative; boundary="0000000000000ce5ac05e5c7aa2e"

--0000000000000ce5ac05e5c7aa2e
Content-Type: text/plain; charset="UTF-8"

Hi Arnout, all!

Il giorno lun 8 ago 2022 alle ore 22:48 Arnout Vandecappelle <arnout@mind.be>
ha scritto:

>
> > Indeed according to:
> >
> https://docs.python.org/3/install/#alternate-installation-unix-the-prefix-scheme
> > <
> https://docs.python.org/3/install/#alternate-installation-unix-the-prefix-scheme>
>
> > my understanding would be that they should indeed go to |/prefix//bin
> and not
> > with the modules.|
> > |This link
> >
> https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument
> > <
> https://python-packaging.readthedocs.io/en/latest/command-line-scripts.html#the-scripts-keyword-argument>
>
> > also somehow confirms it I believe as also setuptools assume the
> possibility to
> > deliver them.
>
>   I believe the proper way to install is to have a small script in
> /usr/bin/
> that simply imports the full script (relying on PYTHONPATH) and calls its
> main
> function.
>

Yes in principle that is something that you often see around, although I
guess is mostly pointed at uses when you would like to both reuse some code
as module and script. For Python scripts that don't have any potentially
shareable code it may be an overhead and indeed you can find many around
(will later try to catch some other in Buildroot besides rt-tests so we can
have some more use-cases which maybe show us some other details).


>
> > So after all if rt-tests (or similar) would follow that, Buildroot
> py->pyc
> > should be safe, assuming that those script will not be converted.
>
>   Given that rt-tests is not alone, I think it would be good if we could
> fix the
> issue on Buildroot side.
>
>   I think the problem can be diagnosed when we encounter a .py file that
> is
> executable - normally they shouldn't be. We could simply leave those alone
> instead of removing them. Alternatively, perhaps it's possible to replace
> them
> with a symlink to the pyc file - although that may break things in
> horrible ways
> as well.
>

The first solution to not delete those py files (or not even generate pyc)
sounds good to me in principle!
The second one to put a symlink to the pyc file will not work, as in that
case you just get an error from the shell since the interpreter is not
known if you try to execute it directly.


As for implementing the first solution I gave a fast look:

-) Not to remove the executable .py should be very easy, we should just add
a check to the find that removes them in PYTHON3_REMOVE_PY_FILES, something
along the lines of:

diff -ruN a/python3.mk b/python3.mk
--- a/python3.mk        2022-08-02 03:59:45.897891945 +0200
+++ b/python3.mk        2022-08-09 04:36:40.798305233 +0200
@@ -264,7 +264,7 @@

 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 define PYTHON3_REMOVE_PY_FILES
-       find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name
'*.py' \
+       find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name
'*.py' \! -executable \
                $(if $(strip $(KEEP_PYTHON_PY_FILES)),-not \( $(call
finddirclauses,$(TARGET_DIR),$(KEEP_PYTHON_PY_FILES)) \) ) \
                -print0 | \
                xargs -0 --no-run-if-empty rm -f

I did a small test with the above change and that would solve rt-tests
case. On the other side I see that from a basic Python config I did this
means also including/keeping a bunch of other files, which I'm not sure if
they are executable by purpose or by chance/negligence, for example:

./config-3.10-x86_64-linux-gnu/python-config.py
./profile.py
./tarfile.py
./quopri.py
./cgi.py
./socket.py
./uu.py
./timeit.py
./tabnanny.py
./turtledemo/paint.py
./turtledemo/penrose.py
./turtledemo/minimal_hanoi.py
./turtledemo/forest.py
./turtledemo/lindenmayer.py
./turtledemo/fractalcurves.py
./turtledemo/yinyang.py
./turtledemo/peace.py
./turtledemo/planet_and_moon.py
./turtledemo/tree.py
./turtledemo/__main__.py
./turtledemo/sorting_animate.py
./turtledemo/clock.py
./turtledemo/bytedesign.py
./webbrowser.py
./smtplib.py
./encodings/rot_13.py
./cProfile.py
./smtpd.py
./trace.py
./pydoc.py
./base64.py
./site-packages/hwlatdetect.py
./site-packages/get_cyclictest_snapshot.py
./platform.py
./pdb.py

Just a fast look and some (ie. pdb.py) could be interesting to have as .py
indeed, as this way you can easily invoke the Python debugger (otherwise
with just the pyc you need to manually import and call main as the pyc will
not execute directly). Same ie. for smtpd or base64 or webbrowser as you
can then use them immediately (and with an additional command line parsing
part). So after all maybe we were losing with the deletion of the py files
also some other possibly useful delivered features.

-) If we would like not to create the pyc at all as well it may be a little
more work in recent versions. Indeed recently (end of July, so in master)
Buildroot went from using the custom internal script
"support/scripts/pycompile.py" to the Python shipped "compileall.py".
For the old internal pycompile.py it would be very easy to just add a check
on the executable-ness and skip the path (as we have a bunch of other
checks, ie. is a link). But for the compileall.py as far as I can see there
is no option to skip them and therefore patching this may be a bit more
complex.


But maybe for the scripts, which I guess should be a relatively small
number of cases (in the above example out of 550 pyc files 35 would have
the py left in place due to execution bit), just not removing the .py so
they can still work correctly could be good enough after all ? (so, for
executable Python files, one ends up with both .py and .pyc)


If you think the first point proposed makes sense, I can send an official
patch.

Cheers,
Federico




>   In either case, it's nice we have this rt-tests failure, because it
> means we
> can have a runtime test for it!
>
>   Regards,
>   Arnout
>
>
> > |
> > |
> > |
> > |I'll try to contact the rt-tests team and see what they think of this
> and come
> > back with a patch for Buildroot!
> > |
> > |
> > |
> > |Cheers,|
> > |Federico
> > |
> > |
> > |
> >
> > Il giorno lun 8 ago 2022 alle ore 12:20 Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com <mailto:thomas.petazzoni@bootlin.com>> ha
> scritto:
> >
> >     Hello Federico,
> >
> >     On Mon, 8 Aug 2022 09:40:02 +0200
> >     Federico Pellegrin <fede@evolware.org <mailto:fede@evolware.org>>
> wrote:
> >
> >      > I've found a minor problem related to the rt-tests package, but
> that maybe
> >      > is slightly more generic and wanted to report and in case
> understand which
> >      > approach would be best to fix it (and contribute a patch then if
> possible).
> >      >
> >      > The specific problem: rt-tests, besides a few compiled
> executables,
> >      > installs also two tools which are written in Python, namely
> hwlatdetect and
> >      > get_cyclictest_snapshot. These are Python scripts which get
> installed in
> >      > the PYLIB and then a symbolic link is done from /usr/bin to them,
> so ie we
> >      > have: /usr/bin/hwlatdetect ->
> >      > /usr/lib/python3.10/site-packages//hwlatdetect.py
> >      >
> >      > Needless to say that once the pycompile.py script is run and
> original .py
> >      > files are removed, of course in the "PYC only" setup (which is the
> >      > default), then the link is broken and it will not work.
> >      > Additionally that pyc files will not work for scripts like that,
> so just
> >      > somehow fixing the link mentioned above would anyhow not work, as
> you need
> >      > to execute them eventually by explicitly naming the interpreter.
> >      >
> >      > I could imagine that we could have some similar other cases when
> we are
> >      > installing Python scripts directly executed in PYLIB and not
> modules. But
> >      > I'm not sure that installing the scripts there is a good idea as
> well,
> >      > comparing with other distros that doesn't seem to be the case.
> >      > So maybe the problem is really in rt-tests after all and the
> location those
> >      > scripts get installed and I may just fix it that way (and contact
> upstream)?
> >      > Otherwise should it be more generic maybe could make sense to
> have a
> >      > facility to list some files that should not be converted to PYC?
> >
> >     Thanks for your bug report.
> >
> >     My initial gut feeling would indeed be that it is strange to install
> >     scripts in /usr/lib/python, and they should be installed in /usr/bin
> >     instead, so that /usr/lib/python is only for Python modules that can
> be
> >     byte-compiled. However, I am not an expert at all in terms of Python
> >     best practices and latest standards.
> >
> >     But from a Buildroot perspective, it really makes a lot of sense to
> be
> >     able to do the byte-compilation at build-time (to save on startup
> time)
> >     and drop the .py files (to save on filesystem footprint).
> >
> >     For the rt-tests case, I would therefore suggest to move those
> scripts
> >     to /usr/bin.
> >
> >     Of course, if that problem shows up in more packages, then yes we
> could
> >     think of a mechanism for packages to declare a number of py files
> that
> >     should not be byte-compiled, and that should be preserved on the
> target.
> >
> >     Best regards,
> >
> >     Thomas
> >     --
> >     Thomas Petazzoni, co-owner and CEO, Bootlin
> >     Embedded Linux and Kernel engineering and training
> >     https://bootlin.com <https://bootlin.com>
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000000ce5ac05e5c7aa2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hi Arnout, all!<br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il gior=
no lun 8 ago 2022 alle ore 22:48 Arnout Vandecappelle &lt;<a href=3D"mailto=
:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; Indeed according to: <br>
&gt; <a href=3D"https://docs.python.org/3/install/#alternate-installation-u=
nix-the-prefix-scheme" rel=3D"noreferrer" target=3D"_blank">https://docs.py=
thon.org/3/install/#alternate-installation-unix-the-prefix-scheme</a> <br>
&gt; &lt;<a href=3D"https://docs.python.org/3/install/#alternate-installati=
on-unix-the-prefix-scheme" rel=3D"noreferrer" target=3D"_blank">https://doc=
s.python.org/3/install/#alternate-installation-unix-the-prefix-scheme</a>&g=
t; <br>
&gt; my understanding would be that they should indeed go to |/prefix//bin =
and not <br>
&gt; with the modules.|<br>
&gt; |This link <br>
&gt; <a href=3D"https://python-packaging.readthedocs.io/en/latest/command-l=
ine-scripts.html#the-scripts-keyword-argument" rel=3D"noreferrer" target=3D=
"_blank">https://python-packaging.readthedocs.io/en/latest/command-line-scr=
ipts.html#the-scripts-keyword-argument</a> <br>
&gt; &lt;<a href=3D"https://python-packaging.readthedocs.io/en/latest/comma=
nd-line-scripts.html#the-scripts-keyword-argument" rel=3D"noreferrer" targe=
t=3D"_blank">https://python-packaging.readthedocs.io/en/latest/command-line=
-scripts.html#the-scripts-keyword-argument</a>&gt;=C2=A0 <br>
&gt; also somehow confirms it I believe as also setuptools assume the possi=
bility to <br>
&gt; deliver them.<br>
<br>
=C2=A0 I believe the proper way to install is to have a small script in /us=
r/bin/ <br>
that simply imports the full script (relying on PYTHONPATH) and calls its m=
ain <br>
function.<br></blockquote><div><br></div><div>Yes in principle that is some=
thing that you often see around, although I guess is mostly pointed at uses=
 when you would like to both reuse some code as module and script. For Pyth=
on scripts that don&#39;t have any potentially shareable code it may be an =
overhead and indeed you can find many around (will later try to catch some =
other in Buildroot besides rt-tests so we can have some more use-cases whic=
h maybe show us some other details).<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; So after all if rt-tests (or similar) would follow that, Buildroot py-=
&gt;pyc <br>
&gt; should be safe, assuming that those script will not be converted.<br>
<br>
=C2=A0 Given that rt-tests is not alone, I think it would be good if we cou=
ld fix the <br>
issue on Buildroot side.<br>
<br>
=C2=A0 I think the problem can be diagnosed when we encounter a .py file th=
at is <br>
executable - normally they shouldn&#39;t be. We could simply leave those al=
one <br>
instead of removing them. Alternatively, perhaps it&#39;s possible to repla=
ce them <br>
with a symlink to the pyc file - although that may break things in horrible=
 ways <br>
as well.<br></blockquote><div><br></div><div>The first solution to not dele=
te those py files (or not even generate pyc) sounds good to me in principle=
! <br></div><div>The second one to put a symlink to the pyc file will not w=
ork, as in that case you just get an error from the shell since the interpr=
eter is not known if you try to execute it directly.<br></div><div><br></di=
v><div><br></div><div>As for implementing the first solution I gave a fast =
look:</div><div><br></div><div>-) Not to remove the executable .py should b=
e very easy, we should just add a check to the find that removes them in PY=
THON3_REMOVE_PY_FILES, something along the lines of:</div><div><br></div><d=
iv>diff -ruN a/<a href=3D"http://python3.mk" target=3D"_blank">python3.mk</=
a> b/<a href=3D"http://python3.mk" target=3D"_blank">python3.mk</a><br>--- =
a/<a href=3D"http://python3.mk" target=3D"_blank">python3.mk</a> =C2=A0 =C2=
=A0 =C2=A0 =C2=A02022-08-02 03:59:45.897891945 +0200<br>+++ b/<a href=3D"ht=
tp://python3.mk" target=3D"_blank">python3.mk</a> =C2=A0 =C2=A0 =C2=A0 =C2=
=A02022-08-09 04:36:40.798305233 +0200<br>@@ -264,7 +264,7 @@<br>=C2=A0<br>=
=C2=A0ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)<br>=C2=A0define PYTHON3_REMO=
VE_PY_FILES<br>- =C2=A0 =C2=A0 =C2=A0 find $(TARGET_DIR)/usr/lib/python$(PY=
THON3_VERSION_MAJOR) -name &#39;*.py&#39; \<br>+ =C2=A0 =C2=A0 =C2=A0 find =
$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name &#39;*.py&#39; \=
! -executable \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
$(if $(strip $(KEEP_PYTHON_PY_FILES)),-not \( $(call finddirclauses,$(TARGE=
T_DIR),$(KEEP_PYTHON_PY_FILES)) \) ) \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -print0 | \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 xargs -0 --no-run-if-empty rm -f</div><div><br></div><=
div>I did a small test with the above change and that would solve rt-tests =
case. On the other side I see that from a basic Python config I did this me=
ans also including/keeping a bunch of other files, which I&#39;m not sure i=
f they are executable by purpose or by chance/negligence, for example:</div=
><div><br></div><div>./config-3.10-x86_64-linux-gnu/python-config.py<br>./p=
rofile.py<br>./tarfile.py<br>./quopri.py<br>./cgi.py<br>./socket.py<br>./uu=
.py<br>./timeit.py<br>./tabnanny.py<br>./turtledemo/paint.py<br>./turtledem=
o/penrose.py<br>./turtledemo/minimal_hanoi.py<br>./turtledemo/forest.py<br>=
./turtledemo/lindenmayer.py<br>./turtledemo/fractalcurves.py<br>./turtledem=
o/yinyang.py<br>./turtledemo/peace.py<br>./turtledemo/planet_and_moon.py<br=
>./turtledemo/tree.py<br>./turtledemo/__main__.py<br>./turtledemo/sorting_a=
nimate.py<br>./turtledemo/clock.py<br>./turtledemo/bytedesign.py<br>./webbr=
owser.py<br>./smtplib.py<br>./encodings/rot_13.py<br>./cProfile.py<br>./smt=
pd.py<br>./trace.py<br>./pydoc.py<br>./base64.py<br>./site-packages/hwlatde=
tect.py<br>./site-packages/get_cyclictest_snapshot.py<br>./platform.py<br>.=
/pdb.py</div><div><br></div><div>Just a fast look and some (ie. pdb.py) cou=
ld be interesting to have as .py indeed, as this way you can easily invoke =
the Python debugger (otherwise with just the pyc you need to manually impor=
t and call main as the pyc will not execute directly). Same ie. for smtpd o=
r base64 or webbrowser as you can then use them immediately (and with an ad=
ditional command line parsing part). So after all maybe we were losing with=
 the deletion of the py files also some other possibly useful delivered fea=
tures.<br></div><br><div>-) If we would like not to create the pyc at all a=
s well it may be a little more work in recent versions. Indeed recently (en=
d of July, so in master) Buildroot went from using the custom internal scri=
pt &quot;support/scripts/pycompile.py&quot; to the Python shipped &quot;com=
pileall.py&quot;.</div><div>For the old internal pycompile.py it would be v=
ery easy to just add a check on the executable-ness and skip the path (as w=
e have a bunch of other checks, ie. is a link). But for the compileall.py a=
s far as I can see there is no option to skip them and therefore patching t=
his may be a bit more complex.</div><div><br></div><div><br></div><div>But =
maybe for the scripts, which I guess should be a relatively small number of=
 cases (in the above example out of 550 pyc files 35 would have the py left=
 in place due to execution bit), just not removing the .py so they can stil=
l work correctly could be good enough after all ? (so, for executable Pytho=
n files, one ends up with both .py and .pyc)<br></div><div><br></div><div><=
br></div><div>If you think the first point proposed makes sense, I can send=
 an official patch.<br></div><div><br></div><div>Cheers,</div><div>Federico=
</div><div><br></div><div><br></div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
=C2=A0 In either case, it&#39;s nice we have this rt-tests failure, because=
 it means we <br>
can have a runtime test for it!<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; |<br>
&gt; |<br>
&gt; |<br>
&gt; |I&#39;ll try to contact the rt-tests team and see what they think of =
this and come <br>
&gt; back with a patch for Buildroot!<br>
&gt; |<br>
&gt; |<br>
&gt; |<br>
&gt; |Cheers,|<br>
&gt; |Federico<br>
&gt; |<br>
&gt; |<br>
&gt; |<br>
&gt; <br>
&gt; Il giorno lun 8 ago 2022 alle ore 12:20 Thomas Petazzoni <br>
&gt; &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">=
thomas.petazzoni@bootlin.com</a> &lt;mailto:<a href=3D"mailto:thomas.petazz=
oni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;&gt;=
 ha scritto:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello Federico,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, 8 Aug 2022 09:40:02 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0Federico Pellegrin &lt;<a href=3D"mailto:fede@evolw=
are.org" target=3D"_blank">fede@evolware.org</a> &lt;mailto:<a href=3D"mail=
to:fede@evolware.org" target=3D"_blank">fede@evolware.org</a>&gt;&gt; wrote=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;ve found a minor problem related to the=
 rt-tests package, but that maybe<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; is slightly more generic and wanted to report=
 and in case understand which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; approach would be best to fix it (and contrib=
ute a patch then if possible).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The specific problem: rt-tests, besides a few=
 compiled executables,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; installs also two tools which are written in =
Python, namely hwlatdetect and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; get_cyclictest_snapshot. These are Python scr=
ipts which get installed in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the PYLIB and then a symbolic link is done fr=
om /usr/bin to them, so ie we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; have: /usr/bin/hwlatdetect -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; /usr/lib/python3.10/site-packages//hwlatdetec=
t.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Needless to say that once the pycompile.py sc=
ript is run and original .py<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; files are removed, of course in the &quot;PYC=
 only&quot; setup (which is the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; default), then the link is broken and it will=
 not work.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Additionally that pyc files will not work for=
 scripts like that, so just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; somehow fixing the link mentioned above would=
 anyhow not work, as you need<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; to execute them eventually by explicitly nami=
ng the interpreter.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I could imagine that we could have some simil=
ar other cases when we are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; installing Python scripts directly executed i=
n PYLIB and not modules. But<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m not sure that installing the scripts =
there is a good idea as well,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; comparing with other distros that doesn&#39;t=
 seem to be the case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; So maybe the problem is really in rt-tests af=
ter all and the location those<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; scripts get installed and I may just fix it t=
hat way (and contact upstream)?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Otherwise should it be more generic maybe cou=
ld make sense to have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; facility to list some files that should not b=
e converted to PYC?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for your bug report.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0My initial gut feeling would indeed be that it is s=
trange to install<br>
&gt;=C2=A0 =C2=A0 =C2=A0scripts in /usr/lib/python, and they should be inst=
alled in /usr/bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0instead, so that /usr/lib/python is only for Python=
 modules that can be<br>
&gt;=C2=A0 =C2=A0 =C2=A0byte-compiled. However, I am not an expert at all i=
n terms of Python<br>
&gt;=C2=A0 =C2=A0 =C2=A0best practices and latest standards.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0But from a Buildroot perspective, it really makes a=
 lot of sense to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0able to do the byte-compilation at build-time (to s=
ave on startup time)<br>
&gt;=C2=A0 =C2=A0 =C2=A0and drop the .py files (to save on filesystem footp=
rint).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For the rt-tests case, I would therefore suggest to=
 move those scripts<br>
&gt;=C2=A0 =C2=A0 =C2=A0to /usr/bin.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Of course, if that problem shows up in more package=
s, then yes we could<br>
&gt;=C2=A0 =C2=A0 =C2=A0think of a mechanism for packages to declare a numb=
er of py files that<br>
&gt;=C2=A0 =C2=A0 =C2=A0should not be byte-compiled, and that should be pre=
served on the target.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt;=C2=A0 =C2=A0 =C2=A0Embedded Linux and Kernel engineering and training<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://bootlin.com" rel=3D"noreferrer" =
target=3D"_blank">https://bootlin.com</a> &lt;<a href=3D"https://bootlin.co=
m" rel=3D"noreferrer" target=3D"_blank">https://bootlin.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div></div>

--0000000000000ce5ac05e5c7aa2e--

--===============4296123319689172726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4296123319689172726==--
