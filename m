Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E2FC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 15:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84A1040133;
	Sun,  4 Dec 2022 15:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A1040133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RqBo0id1OBRq; Sun,  4 Dec 2022 15:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BFEC404BF;
	Sun,  4 Dec 2022 15:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BFEC404BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38B0F1BF420
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 15:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14140606C6
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 15:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14140606C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQpo4uqWXUjq for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 15:05:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2860605DB
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2860605DB
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 15:05:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r26so12545110edc.10
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 07:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBsMZj83ic97ePanGvTd7ieUfFppJIdrKKVOVY+t3x4=;
 b=pNkcD6S0wB8YkgFNZxclvbQhzOk/M1JCWrJISelJw2FRCNYUdSi8r5Dg/wJfllmQau
 XBHQ1Qk6Mc/AltsK/UoBRgWYXT5/79Xu51QrNPElpFnqdAbwMUhoVFeRAV8YIdIumQ7O
 lT7wurANUpCD8/lwfQU3LR0xqsvoMTmwZzLmnlQZLK5LDIz9odQiVd8YLhwzRT0AykdY
 2O8j7ZODh6ANHCKJk/7JYiKLXzXCpvWb5wmFrGrRb5ipLLkYfjYzMGdYA1ejAcKj1sjs
 T1Hs36BIk7951FfzpfgdqGTvoHjTa75679zAKYgXJaDJW2GYzYa2AE3uA7UF9sUgSyhe
 p40A==
X-Gm-Message-State: ANoB5pl3fTEBqF6TjWDIr4kcvOQOAigrPkJgheMYs9oQ2J7UbyKN5cCO
 MeN5s7YyvdRsf/u64tuWdyfAGoocgkrY3gThiQikXlgkHWQ=
X-Google-Smtp-Source: AA0mqf72p+rdKSGvIyQZfOTRp4kFEQg3vEWHuTkVGtvFtPUlf36/tZrqiCaTq0I0zcM6Jybk1019sLVjpj4dzoJub6M=
X-Received: by 2002:aa7:cc04:0:b0:463:1a0c:4dd1 with SMTP id
 q4-20020aa7cc04000000b004631a0c4dd1mr63037470edt.137.1670166329740; Sun, 04
 Dec 2022 07:05:29 -0800 (PST)
MIME-Version: 1.0
References: <CA+fTLhj4PubMRELghtEYVCW3Q3FvEjK=mL=fOxdGNE_Jia6aOw@mail.gmail.com>
 <CADvTj4obUchFLqXjWxQydTHc1FJLNA3y90RZ=FOQsceFOSuhdw@mail.gmail.com>
In-Reply-To: <CADvTj4obUchFLqXjWxQydTHc1FJLNA3y90RZ=FOQsceFOSuhdw@mail.gmail.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 4 Dec 2022 17:05:19 +0200
Message-ID: <CA+fTLhgzznFVkSGXGhR5S_ik2K0RA_wRve1PF0FaogexfmH3tg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>, 
 Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBsMZj83ic97ePanGvTd7ieUfFppJIdrKKVOVY+t3x4=;
 b=pj00jHbyn6yUtzspOA7Ej8d2U1wllLEJV4vZ9SylbjdPbt18CNCJ0f2FSOwpOdcRUy
 Kwfgjpxlj6p6MU8lAMqj00Ird4MP9Odv3aJGVq+86lcCf/9rfTyqGMsL3C7LQLY/nczz
 4rHJpPHoT5yVpoTZ3UOFXUPCAa7ASh1jCzMAoPTzdn1BFpwmZ+qPNloj/MSUFlmhLGGS
 SFb6aZ6GW/jQoYmrU01PJNz99r+JRY2lCxOTRcf5bKgfefTyrBSATIIla1HfNjK/7e2/
 ujCVtidY2HF1aex94rU9pFjLUoJx8hV0dxa+fBPESxFWrh5oo152Q7V2BVkuh8nkSSUU
 Wocg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pj00jHby
Subject: Re: [Buildroot] python 3.10.8 pip module seems to be broken in rc3
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
Content-Type: multipart/mixed; boundary="===============1584749763669755772=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1584749763669755772==
Content-Type: multipart/alternative; boundary="000000000000ccd14405ef01e641"

--000000000000ccd14405ef01e641
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt James Hilliard (<james.hilliard1@gmail.com>) kirjutas kuup=C3=A4eva=
l P,
4. detsember 2022 kell 16:23:

> On Sun, Dec 4, 2022 at 10:17 AM Indrek Kruusa <indrek.kruusa@gmail.com>
> wrote:
> >
> > Hi!
> >
> > I am unable to resolve this error with pip (installed by selecting
> python-pip ):
> >
> > # pip
> > Traceback (most recent call last):
> >   File "/usr/bin/pip", line 33, in <module>
> >     sys.exit(load_entry_point('pip=3D=3D21.2.4', 'console_scripts', 'pi=
p')())
> >   File "/usr/bin/pip", line 25, in importlib_load_entry_point
> >     return next(matches).load()
> >   File "/usr/lib/python3.10/importlib/metadata/__init__.py", line 171,
> in load
> >   File "/usr/lib/python3.10/importlib/__init__.py", line 126, in
> import_module
> >   File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
> >   File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
> >   File "<frozen importlib._bootstrap>", line 1006, in
> _find_and_load_unlocked
> >   File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
> >   File "<frozen importlib._bootstrap_external>", line 883, in exec_modu=
le
> >   File "<frozen importlib._bootstrap>", line 241, in
> _call_with_frames_removed
> >   File "/usr/lib/python3.10/site-packages/pip/_internal/cli/main.py",
> line 9, in <module>
> >   File
> "/usr/lib/python3.10/site-packages/pip/_internal/cli/autocompletion.py",
> line 10, in <module>
> >   File
> "/usr/lib/python3.10/site-packages/pip/_internal/cli/main_parser.py", lin=
e
> 8, in <module>
> >   File
> "/usr/lib/python3.10/site-packages/pip/_internal/cli/cmdoptions.py", line
> 23, in <module>
> >   File "/usr/lib/python3.10/site-packages/pip/_internal/cli/parser.py",
> line 12, in <module>
> >   File
> "/usr/lib/python3.10/site-packages/pip/_internal/configuration.py", line
> 21, in <module>
> >   File "/usr/lib/python3.10/site-packages/pip/_internal/exceptions.py",
> line 7, in <module>
> >   File
> "/usr/lib/python3.10/site-packages/pip/_vendor/pkg_resources/__init__.py"=
,
> line 35, in <module>
> >   File "/usr/lib/python3.10/plistlib.py", line 61, in <module>
> > ModuleNotFoundError: No module named 'xml'
>
> Maybe needs to select:
> BR2_PACKAGE_PYTHON3_PYEXPAT
>

Somehow I missed that option. Yes, it fixes the problem.


> >
> > Is this an known issue?
>
> The python-pip package in general does not work properly on buildroot
> since buildroot doesn't provide compilers and such on the target.
>

It makes sense, indeed.

Thanks,
Indrek


>
> >
> > Best regards,
> > Indrek
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000ccd14405ef01e641
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt James Hilliard (&lt;<a href=3D"ma=
ilto:james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt;) kirjutas=
 kuup=C3=A4eval P, 4. detsember 2022 kell 16:23:<br></div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Dec 4, =
2022 at 10:17 AM Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.co=
m" target=3D"_blank">indrek.kruusa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi!<br>
&gt;<br>
&gt; I am unable to resolve this error with pip (installed by selecting pyt=
hon-pip ):<br>
&gt;<br>
&gt; # pip<br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/bin/pip&quot;, line 33, in &lt;module&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0sys.exit(load_entry_point(&#39;pip=3D=3D21.2.4&#39;=
, &#39;console_scripts&#39;, &#39;pip&#39;)())<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/bin/pip&quot;, line 25, in importlib_load_=
entry_point<br>
&gt;=C2=A0 =C2=A0 =C2=A0return next(matches).load()<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/importlib/metadata/__init__=
.py&quot;, line 171, in load<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/importlib/__init__.py&quot;=
, line 126, in import_module<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line=
 1050, in _gcd_import<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line=
 1027, in _find_and_load<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line=
 1006, in _find_and_load_unlocked<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line=
 688, in _load_unlocked<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap_external&gt;&qu=
ot;, line 883, in exec_module<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line=
 241, in _call_with_frames_removed<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_internal=
/cli/main.py&quot;, line 9, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_internal=
/cli/autocompletion.py&quot;, line 10, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_internal=
/cli/main_parser.py&quot;, line 8, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_internal=
/cli/cmdoptions.py&quot;, line 23, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_internal=
/cli/parser.py&quot;, line 12, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_internal=
/configuration.py&quot;, line 21, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_internal=
/exceptions.py&quot;, line 7, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/site-packages/pip/_vendor/p=
kg_resources/__init__.py&quot;, line 35, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3.10/plistlib.py&quot;, line 61,=
 in &lt;module&gt;<br>
&gt; ModuleNotFoundError: No module named &#39;xml&#39;<br>
<br>
Maybe needs to select:<br>
BR2_PACKAGE_PYTHON3_PYEXPAT<br></blockquote><div><br></div><div>Somehow=C2=
=A0I missed that option. Yes, it fixes the problem.=C2=A0</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Is this an known issue?<br>
<br>
The python-pip package in general does not work properly on buildroot<br>
since buildroot doesn&#39;t provide compilers and such on the target.<br></=
blockquote><div><br></div><div>It makes sense, indeed.</div><div><br></div>=
<div>Thanks,</div><div>Indrek=C2=A0</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Indrek<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div></div>

--000000000000ccd14405ef01e641--

--===============1584749763669755772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1584749763669755772==--
