Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53056C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 18:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9386740103;
	Sat,  2 Dec 2023 18:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9386740103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbssVqXTD8Ns; Sat,  2 Dec 2023 18:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4581B404F6;
	Sat,  2 Dec 2023 18:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4581B404F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF9D1BF3D6
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 18:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C8B4404F6
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 18:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8B4404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCm84PDwdpcy for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 18:41:52 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BB5440103
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 18:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB5440103
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3b8b5f54ba1so127528b6e.0
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 10:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701542511; x=1702147311;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oqIYtSoNrp6yt1VjciQtEwvho0DREOXBSKcEhbQOSpk=;
 b=WlGkyxxwraLAdIv2moAdUJMzZGNZ6+7O9DjJMITc+MlUT8d+5hKX4LnWyFFNfLPwEU
 l3l6bHErIcCtheFEmDFdBKNLyadhPzshdKRItR7k2JlIzLgsRKFxvQ7bhUg+Ctg9gR7U
 ZDB9JGdUbqtAgo4CEfzZfT1czivGgezhxutNCA4U3nxi6YHc5+9yQAzITK+R1Dg6cu7a
 7DEkvbpTxWB4nUKQxfIrOGAft96674UiIWDYtELWyM4yH8H364HahkJq/S4NZ0JAMlrc
 hTJmhLIIUQjj9rDeXQbiPhyHQLk8mx/0HxcPMtG+PpddNyMhEMz+bu1W5T3HwoyKDpkt
 /6JA==
X-Gm-Message-State: AOJu0YxJUQczvQ5BH0DjpSH8ruls3bcC3jVkqXW6pOjXtidBskxwJNij
 ic4jlymKNG4uQ6/4SC/A1cSWqFWeOsiHn3Ipibt4GmjYSoE=
X-Google-Smtp-Source: AGHT+IFCLx3r1B704JP+CrmHK00zgSes/VrRLwAEGnoREXrZyqGulvfMGc7eUnuhnkjgAQY5IfakVFk/LYiMUWh2jU8=
X-Received: by 2002:a05:6808:1881:b0:3a7:330d:93da with SMTP id
 bi1-20020a056808188100b003a7330d93damr2406568oib.19.1701542510796; Sat, 02
 Dec 2023 10:41:50 -0800 (PST)
MIME-Version: 1.0
From: John Langholz <jlangholzj@gmail.com>
Date: Sat, 2 Dec 2023 13:41:40 -0500
Message-ID: <CAPL9kM2QC4aXUyMe2HX5MQNR0U=8jDK_=0Eopjq_nGUL3ScVGw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701542511; x=1702147311; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oqIYtSoNrp6yt1VjciQtEwvho0DREOXBSKcEhbQOSpk=;
 b=YoVuxaV5Y2bUhfgr35kVChrIOZIpvPiWOkOccK3cef+yMBzH7K40OKCrL50Pa3vSX0
 10/DmWXS24wpF5W+me1HgZi9nArVVCniFvmUtYCouuk7IuLK4VgkrrLxtmycdrPe5Mdg
 wLHTu3GPpS2xsOQ8f0efi5NTjgvPLytbOolPTHkk/IU3XHfAEYCP3wJmdrLtJyKNJDMz
 Ui68XTnd9JiY7ebezmDjdxsuY5aNfEIB6yzxw6TnGfigg5lruKY5Z2PbqVAHVNw2DiGK
 67uOIBP/O4apR6k7lsK8g1S4iLjrj+ILkiXWMf12lpjzOi8I8PgQGWriBnPj2stHp1F5
 M6/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YoVuxaV5
Subject: [Buildroot] python and tkinter
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
Content-Type: multipart/mixed; boundary="===============6507543397141044164=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6507543397141044164==
Content-Type: multipart/alternative; boundary="000000000000ed25a4060b8b3cbc"

--000000000000ed25a4060b8b3cbc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 I've been working on making an image for a raspberry pi (specifically, a
CM4) and have hit a bit of a roadblock with python and tkinter. I've been
able to include some additional external modules and verified they work in
a python shell but I've been having issues getting tkinter to work
appropriately. When I'm in a python shell and try "import tkinter" it
throws a traceback error:

Traceback (most recent call last):
File =E2=80=9C<stdin>=E2=80=9D, line 1, in <module>
File =E2=80=9C/usr/lib/python311/tkinter/__init__.py=E2=80=9D, line 38 in <=
module>
ModuleNotFoundError: No module named =E2=80=98_tkinter=E2=80=99


I understand what the error itself means (that it can't find the tkinter
module) but I'd like to figure out why this isn't getting included in the
build. From my understanding, by default the option for tkinter was
disabled in the /packages/python3/python.mk file. I changed all the --disab=
le
tk statements to --enable tk. I additionally ensured the tcl and tk target
packages (under "Language interpreter" and "graphical interface",
respectively) were included.

I verified in the flashed image that under /usr/..../python3.11/ there is a
tkinter folder that has an __init__.py script as expected (which based on
the callback error it's finding). The existence of the
/usr/..../python3.11/tkinter folder leads me to believe that tkinter is
being added/built with python but there's something else with the
configuration that's not correct.

Searching the archives and around the internet, I found a few other
mentions of a similar issue that were resolved with various patches. I
created a global patch folder one level up (outside) of my buildroot dir
and configured the global patch directory in the makemenu. I tried
including the patches in a "/python3/" directory within the global patch
dir but I've not had positive results with those either.

This is all a long way of saying that I feel I'm missing something *simple*
here but for the life of me I can't figure out what. Any suggestions?
--=20
Thanks,
-jungle_jim

--000000000000ed25a4060b8b3cbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
I&#39;ve been working on making an image for a raspberry=20
pi (specifically, a CM4) and have hit a bit of a roadblock with python=20
and tkinter. I&#39;ve been able to include some additional external modules=
 and verified they work in a python shell but I&#39;ve been having issues g=
etting tkinter to=20
work appropriately. When I&#39;m in a python shell and try &quot;import tki=
nter&quot;=20
it throws a traceback error:
<div class=3D"gmail-votecell gmail-post-layout--left"><div class=3D"gmail-s=
-prose gmail-js-post-body"><pre><code>Traceback (most recent call last):
File =E2=80=9C&lt;stdin&gt;=E2=80=9D, line 1, in &lt;module&gt;
File =E2=80=9C/usr/lib/python311/tkinter/__init__.py=E2=80=9D, line 38 in &=
lt;module&gt;
ModuleNotFoundError: No module named =E2=80=98_tkinter=E2=80=99

</code></pre></div></div>


I understand what the error itself means (that it can&#39;t find the tkinte=
r module) but I&#39;d like to figure out why this isn&#39;t getting include=
d in the build. From my understanding, by default the option for tkinter wa=
s disabled in the <code>/packages/python3/<a href=3D"http://python.mk">pyth=
on.mk</a></code> file. I changed all the <code>--disable tk</code> statemen=
ts to <code>--enable tk</code>.=20
I additionally ensured the tcl and tk target packages (under &quot;Language=
 interpreter&quot; and &quot;graphical interface&quot;, respectively) were =
included.

<div><br></div><div>
I verified in the flashed image that under <code>/usr/..../python3.11/</cod=
e> there is a tkinter folder that has an <code>__init__.py</code> script as=
 expected (which based on the callback error it&#39;s finding). The existen=
ce of the <code>/usr/..../python3.11/tkinter</code> folder=20
leads me to believe that tkinter is being added/built with python but=20
there&#39;s something else with the configuration that&#39;s not correct.</=
div><div><br></div><div>Searching the archives and around the internet, I f=
ound a few other mentions of a similar issue that were resolved with variou=
s patches.
I created a global patch folder one level up (outside) of my buildroot dir =
and configured the global patch=20
directory in the makemenu. I tried including the patches in a &quot;/python=
3/&quot; directory within the
 global patch dir but I&#39;ve not had positive results with those either.

=20

</div><div><br></div><div>This is all a long way of saying that I feel I&#3=
9;m missing something *simple* here but for the life of me I can&#39;t figu=
re out what. Any suggestions?<br></div><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Thanks,</div><div>-jungle_jim<br></di=
v></div></div>

--000000000000ed25a4060b8b3cbc--

--===============6507543397141044164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6507543397141044164==--
