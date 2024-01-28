Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC1C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 20:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F684154A;
	Sun, 28 Jan 2024 20:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F684154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAckB0ov9anm; Sun, 28 Jan 2024 20:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9AF44154E;
	Sun, 28 Jan 2024 20:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9AF44154E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D06F41BF321
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B48CA4016D
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 20:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B48CA4016D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbQY-fbeBfiI for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 20:56:57 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D5D040391
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 20:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D5D040391
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cf59559b2fso7529141fa.2
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 12:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706475415; x=1707080215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x/Bb7PE4UzYttZ4gMMiPP7fHIMwC5YibNCsYydgj3zc=;
 b=WcQfkijZ/T4NgLALlaUzangnb1rHhgb9MDb6zpH4rM7YGzx6PyJmU+Nqa9UJWFiScQ
 pSkPbSKbXUGr7bo1CGZKDbYgxMa9v3+CBigiKy3+ZtxvWNhFEku+3J1IvMGrSz3RbkYA
 L13fDK2RaIxWYhocjDGnDeehVOQt5VkEtFlyF6X9w6zmSJsNYaQxGXRzGe+bnf3WmKWq
 4EFW+Amz2ST2Ou723LkyS4AM1Iou7H4BvNu1k1mQQOUGkdbaKeI2dbE6IQWe2in74QPr
 sLKV028fO4oSR6R16n+HXNn4sK7zRJFi2KjHQjrLXCoIXeh4nIeyVugMGvAnNEhsV1Ke
 4pmA==
X-Gm-Message-State: AOJu0Yy6+H1+mmmrsqusmjeOgRLTslS6DaKsU5o/Pe9+h+jBM1fcZHJl
 1cy0cVECcS/I4lx1b8ivcQzvH3zp7BJDzPQAWSgpUQ0Wr8PVyEj95Kx3Hrlw6YsbcqodZBi5/DW
 Y5Bl+76UZCYOhh5P1OXmXcA9hAw8=
X-Google-Smtp-Source: AGHT+IH8+4TeBwJzslIXw/3yCpC32VfTCPlS8rVMQFdp0yFLt8JdojEv2TkyAsZqTVvI5+w1kr+4QyeiMVoqPndo6+w=
X-Received: by 2002:a05:651c:32a:b0:2cc:2025:5bd5 with SMTP id
 b10-20020a05651c032a00b002cc20255bd5mr2776446ljp.51.1706475414404; Sun, 28
 Jan 2024 12:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20240128183755.3322967-1-abiliojr@gmail.com>
 <CAFOYHZAFjAyu38jik9KSX8CfVdjRHJE4yPdgSC6tNY=C3UAnqA@mail.gmail.com>
 <Zba0dJ_wMNPDP5X6@landeda>
In-Reply-To: <Zba0dJ_wMNPDP5X6@landeda>
From: Abilio Marques <abiliojr@gmail.com>
Date: Sun, 28 Jan 2024 12:56:41 -0800
Message-ID: <CAEWqYrU=QSp8ypULFUAsQxPe85mHs+RniAMrv2=M0b93HTuQAw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706475415; x=1707080215; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x/Bb7PE4UzYttZ4gMMiPP7fHIMwC5YibNCsYydgj3zc=;
 b=iuQOBVsOPwufrl6pN2MwAJBreEOPmAJ6VTCryyMdDRCWeCV5VkSgtrM8Ic8Iu1z1Tw
 YjjwDHv2k+wxnvxl6bi+C3NTNkmVSOV5o+z17l2nCoflXBUjTzKPuX2vxXW22bkJIRJk
 iX5N7aSleVyNAeaw8gPee+CH06UkeKZ1oUr/sDpwgzKCC8zPuwj8hOe+e0WotHpHWRmq
 qllwGj8o+eNC7Iay6jq3E7c2l1gm83jGvI3T6NTFTWiOQ4iMVqT3Maqw8xQBiogrOTbK
 ZuNKfJol0u09/+R3RJSGj0C6nzwvkleDUgJ3k7gogduGZeABb7XNth1xu6CiSizhosHV
 y1EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iuQOBVsO
Subject: Re: [Buildroot] [PATCH] package/micropython: make use of recent
 micropython-lib
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
Cc: Chris Packham <judge.packham@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1675528778451255924=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1675528778451255924==
Content-Type: multipart/alternative; boundary="000000000000e4c1f8061007c4d5"

--000000000000e4c1f8061007c4d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann, Chris,

The micropython project does not attempt to perform any kind of
bootstrapping during its build process. It relies on cpython for building,
testing, and also for host tools (mostly used with microcontrollers). So
for building host-micropython, we would still need cpython. For example,
the tools used for processing manifest files (tools/makemanifest.py,
tools/manifestfile.py) are definitely not micropython compatible, at least
not without the libraries I'm actually trying to collect ;). Another hint,
the scripts are crowned with a python3 shebang.

If we want to do this using micropython code, it also requires
re-implementing a lot of the functionality I'm currently borrowing from
manifestfile.py . In my mind, that also means a lot more chances of
requiring maintenance it in case the upstream changes the way they do
things.

As far as I know, to generate the mpy files, only 'mpy-cross' is needed.
During the target build process, this is built first (but runs on host). It
will be used to freeze modules within the micropython binary (currently
asyncio is one example). Internally, it makes use of the same
"manifestfile.py" I'm borrowing from. Creating a manifest is the route I
plan to use to add support for freezing packages within the binary. The
problem is, you still need to collect the list of all the packages
available in the micropython-lib repo.

To avoid the import trick, I could also:
- Add the path to micropython/tools into the PYTHONPATH at the time of
calling the script.
- Copy my script into the tools directory and run it from there during
build.

Base on all of the above, I fail to see positive benefits of writing this
script so it runs in micropython. Could you please indicate what advantages
do you see?

Thanks for all your comments, they make for great improvements, so I will
update the patch. This is my first time using git send-mail, and I wouldn't
know how to make the updated version part of this chain. Do you have any
suggestions?

Kind regards,
Abilio Marques


On Sun, Jan 28, 2024 at 12:09=E2=80=AFPM Yann E. MORIN <yann.morin.1998@fre=
e.fr>
wrote:

> Chris, All,
>
> On 2024-01-29 07:58 +1300, Chris Packham spake thusly:
> > On Mon, 29 Jan 2024, 7:30 am Abilio Marques, <[1]abiliojr@gmail.com>
> wrote:
> [--SNIP--]
> >     This commit also ensures that the libraries in micropython-lib will
> >     be updated together with newer versions of micropython.
> [--SNIP--]
> > One thought I had was to build micropython as a host package and use
> that to
> > install the libs into the target rootfs.
>
> Yes, this is also my opinion: use host-micropython, if possible.
>
> I see that micropython already depends on host-python3, though. Would
> host-micropython be sufficient in lieu of host-python3, to build target
> micropython?
>
> And would host-python3 be needed to build host-micropython? Or can we
> get along with just the system python3? If we can use the system pytho,
> then we can make the dependency on BR2_PYTHON3_HOST_DEPENDENCY rather
> than hard-code host-python3.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--000000000000e4c1f8061007c4d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:trebuchet ms,sans-serif" class=
=3D"gmail_default"></div><div dir=3D"ltr"><div class=3D"gmail_default" styl=
e=3D"font-family:trebuchet ms,sans-serif">Hi Yann, Chris,<br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif"><br></di=
v><div class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif=
">The micropython project does not attempt to perform any kind of bootstrap=
ping during its build process. It relies on cpython for building, testing, =
and also for host tools (mostly used with microcontrollers). So for buildin=
g host-micropython, we would still need cpython. For example, the tools use=
d for processing manifest files (tools/makemanifest.py, tools/manifestfile.=
py) are definitely not micropython compatible, at least not without the lib=
raries I&#39;m actually trying to collect ;). Another hint, the scripts  ar=
e crowned with a python3 shebang.</div><div class=3D"gmail_default" style=
=3D"font-family:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:trebuchet ms,sans-serif">If we want to do this us=
ing micropython code, it also requires re-implementing a lot of the functio=
nality I&#39;m currently borrowing from manifestfile.py . In my mind, that =
also means a lot more chances of requiring maintenance it in case the upstr=
eam changes the way they do things.</div><div class=3D"gmail_default" style=
=3D"font-family:trebuchet ms,sans-serif"><br></div><div style=3D"font-famil=
y:trebuchet ms,sans-serif" class=3D"gmail_default">As far as I know, to gen=
erate the mpy files, only &#39;mpy-cross&#39; is needed. During the target =
build process, this is built first (but runs on host). It will be used to f=
reeze modules within the micropython binary (currently asyncio is one examp=
le). Internally, it makes use of the same &quot;manifestfile.py&quot; I&#39=
;m borrowing from. Creating a manifest is the route I plan to use to add su=
pport for freezing packages within the binary. The problem is, you still ne=
ed to collect the list of all the packages available in the micropython-lib=
 repo.</div><div style=3D"font-family:trebuchet ms,sans-serif" class=3D"gma=
il_default"><br></div><div style=3D"font-family:trebuchet ms,sans-serif" cl=
ass=3D"gmail_default">To avoid the import trick, I could also:</div><div st=
yle=3D"font-family:trebuchet ms,sans-serif" class=3D"gmail_default">- Add t=
he path to micropython/tools into the PYTHONPATH at the time of calling the=
 script.<br></div><div style=3D"font-family:trebuchet ms,sans-serif" class=
=3D"gmail_default">- Copy my script into the tools directory and run it fro=
m there during build.<br></div><br><div class=3D"gmail_default" style=3D"fo=
nt-family:trebuchet ms,sans-serif">Base on all of the above, I fail to see =
positive benefits of writing this script so it runs in micropython. Could y=
ou please indicate what advantages do you see?<br></div><div class=3D"gmail=
_default" style=3D"font-family:trebuchet ms,sans-serif"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif">Thanks fo=
r all your comments, they make for great improvements, so I will update the=
 patch. This is my first time using git send-mail, and I wouldn&#39;t know =
how to make the updated version part of this chain. Do you have any suggest=
ions?<br></div></div><div><br></div><div><div style=3D"font-family:trebuche=
t ms,sans-serif" class=3D"gmail_default">Kind regards,</div><div style=3D"f=
ont-family:trebuchet ms,sans-serif" class=3D"gmail_default">Abilio Marques<=
br></div><br></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Jan 28, 2024 at 12:09=E2=80=AFPM Yann E. MO=
RIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">C=
hris, All,<br>
<br>
On 2024-01-29 07:58 +1300, Chris Packham spake thusly:<br>
&gt; On Mon, 29 Jan 2024, 7:30 am Abilio Marques, &lt;[1]<a href=3D"mailto:=
abiliojr@gmail.com" target=3D"_blank">abiliojr@gmail.com</a>&gt; wrote:<br>
[--SNIP--]<br>
&gt;=C2=A0 =C2=A0 =C2=A0This commit also ensures that the libraries in micr=
opython-lib will<br>
&gt;=C2=A0 =C2=A0 =C2=A0be updated together with newer versions of micropyt=
hon.<br>
[--SNIP--]<br>
&gt; One thought I had was to build micropython as a host package and use t=
hat to<br>
&gt; install the libs into the target rootfs.<br>
<br>
Yes, this is also my opinion: use host-micropython, if possible.<br>
<br>
I see that micropython already depends on host-python3, though. Would<br>
host-micropython be sufficient in lieu of host-python3, to build target<br>
micropython?<br>
<br>
And would host-python3 be needed to build host-micropython? Or can we<br>
get along with just the system python3? If we can use the system pytho,<br>
then we can make the dependency on BR2_PYTHON3_HOST_DEPENDENCY rather<br>
than hard-code host-python3.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div>

--000000000000e4c1f8061007c4d5--

--===============1675528778451255924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1675528778451255924==--
