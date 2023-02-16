Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41866C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 01:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BD181F95;
	Thu, 16 Feb 2023 01:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BD181F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJCLxeWaHoda; Thu, 16 Feb 2023 01:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1BD181F87;
	Thu, 16 Feb 2023 01:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1BD181F87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE1121BF3DE
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 01:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E7081F79
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 01:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E7081F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOcMSDLXP6n2 for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 01:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E73EE81F2A
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E73EE81F2A
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 01:15:36 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-530b9a0a789so4067067b3.13
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 17:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/7Ga1SpLpxZVq/rLP7bEWpamiWpDD+BZZ+WmhsQA9Y=;
 b=ZN1HXXWw6EpzJz0jD3bGfJNQNFsICX3ddw/pOv1oXCoweXrN9kgJNp+uxJJKrJGAMw
 0k+5b9EFBN8iIKETi/VgSzaiKKhytLeFf0gBYWh0qZe/g3jXel0jlQxjxyPjc+ZOVPOY
 0nHv9ZtGJAJjBULs+KjaqpCSIIMOxeA63mLPlrAIj0WhKr/asNL7mNJB7wWWgzfVWVbd
 hO1LlDQLL2e7a3+DDbll2sj/hueqcRehlUL2RmKCSXRve+6eVi1cBkkc+CGEav9bHhDL
 51HQnytrWYKjs5zZWEJhKguHTYelbyiYDYesECR1Z19X3k49qaAsb8VV26vcMzZgFBKu
 VD9A==
X-Gm-Message-State: AO0yUKVydxnIuM7mstC5BlFUykFruRPWRe4rQJooG54Nf8KPFC9lHOyo
 P62rOb5Iy1LnSfTi16G+iXt2EnOgKDGvTKZyj/FfZ8xTAWVv7ViL
X-Google-Smtp-Source: AK7set83TNZicfYXkJuXJfcIVDXev+aabQTUUHKWXQamNE1zscvNn85WXgGkGhYuZiQaXAEZamoxiF/NXojfxib5hks=
X-Received: by 2002:a81:a212:0:b0:46a:cb68:9add with SMTP id
 w18-20020a81a212000000b0046acb689addmr565019ywg.102.1676510135781; Wed, 15
 Feb 2023 17:15:35 -0800 (PST)
MIME-Version: 1.0
References: <CACw=RXJvPxp4-z1JkH33ZBpGNEo37hQXnZTfyyeqVGiqXbYEqw@mail.gmail.com>
 <40f6ba58-7cda-d062-960f-17ada0c85b24@mind.be>
In-Reply-To: <40f6ba58-7cda-d062-960f-17ada0c85b24@mind.be>
From: Cem Sezer <cps@microplex.com>
Date: Wed, 15 Feb 2023 17:15:23 -0800
Message-ID: <CACw=RX+ZeuZcg45_BSkVdFXmDgQR5sDox=ONE=y4o2aZVy=NAQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microplex.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E/7Ga1SpLpxZVq/rLP7bEWpamiWpDD+BZZ+WmhsQA9Y=;
 b=xpeRg9f68wqd66vvLXsjsPMVkA11LxAAZoGdwz7fIL8iS6/ASEm2H5ydYAwZajHDM/
 Weo4B65KlaIa9nnb1yQGQbPKkZs2ucJ0alBBygVlQJeQ0OKmRHO8M69B7gOQ4eKVXvuw
 UBZcRJbgUf1LMB5HoItPmvJQwJd3O5ftjM9FeQEh1ZCaZl3Rkdcw8aOaw1MbeMXkCgoT
 mBckx7HFxEWoyl12bPY9FfFm7XMvt6dAkwOw4j1ZCpBNRSedj4Zn5iYGP7L1xvVTArmY
 BKc2HNsT6i2luVGnhwAsCiQRYEvDpyzlSSL5BAOaY8Timb9VbclhzfQ4HnFMwSrSkeG6
 zEDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microplex.com header.i=@microplex.com
 header.a=rsa-sha256 header.s=google header.b=xpeRg9f6
Subject: Re: [Buildroot] Having trouble getting a simple cmake based custom
 package to work
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8705283271485481795=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8705283271485481795==
Content-Type: multipart/alternative; boundary="0000000000001b204105f4c6efe6"

--0000000000001b204105f4c6efe6
Content-Type: text/plain; charset="UTF-8"

Hello Arnout,

Thank you for your reply. I realize this was a silly question and I did fix
it by adding install(TARGETS helloworld_c_cmake DESTINATION bin) to
CMakeLists.txt. I appreciate the helpfulness of this community. I have been
tinkering with a larger project and am using this one as a reference.

Kind regards,

Cem


On Wed, Feb 15, 2023 at 12:23 PM Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 15/02/2023 01:10, Cem Sezer wrote:
> > Hello,
> >
> > I'm looking to continue this thread as I have the exact same problem.
> >
> > http://lists.busybox.net/pipermail/buildroot/2020-August/591250.html
> > <http://lists.busybox.net/pipermail/buildroot/2020-August/591250.html>
> >
> > The latest entry in the thread is the following, discussing the error
> message
> > "/No rule to make target 'install/fast': /is where I'm stuck at the
> moment:
> >
> >>/However, when it is />/trying to install my package I have a new error.
> The system seems to be />/looking for a install/fast target, which the
> Makefil does not have. /
> > I have no idea on that problem.  Maybe read the CMake docs again?
> >
> > https://cmake.org/cmake/help/latest/command/install.html  <
> https://cmake.org/cmake/help/latest/command/install.html>
> >
> > Greets
> > Alex
> >
> > I am still new to cmake, but I've been having trouble getting a basic
> > helloworld (in C) cmake package to work. I looked at that link above for
> the
> > cmake docs, but am unfamiliar with what I need to do here. My
> CMakeLists.txt
> > right now is just the following:
> >
> > cmake_minimum_required(VERSION 3.1.0)
> >
> > project(helloworld_c_cmake LANGUAGES C)
> >
> > set(SOURCES main.c)
> >
> > add_executable(${PROJECT_NAME} ${SOURCES})
>
>   Since there is no installation rule in the CMakeLists.txt, the
> install/fast
> target is not going to be generated. The link above to the cmake
> documentation
> explains how to add an installation rule.
>
>   Regards,
>   Arnout
>
> >
> >
> > Any pointers in the right direction would be appreciated. Perhaps this
> is more
> > of a cmake question than a buildroot question, but tying the two
> together has
> > been confusing, and I'm sure it must be something simple. Thanks in
> advance,
> >
> > Cem
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000001b204105f4c6efe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Arnout,<div><br></div><div>Thank you for your reply.=
 I realize this was a silly question and I did fix it by adding install(TAR=
GETS helloworld_c_cmake DESTINATION bin) to CMakeLists.txt. I appreciate th=
e helpfulness of this community. I have been tinkering with a larger projec=
t and am using this one as a reference.</div><div><br></div><div>Kind regar=
ds,</div><div><br></div><div>Cem<br><div><br></div></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 15, 20=
23 at 12:23 PM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">a=
rnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
<br>
On 15/02/2023 01:10, Cem Sezer wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I&#39;m looking to continue this thread as I have the exact same probl=
em.<br>
&gt; <br>
&gt; <a href=3D"http://lists.busybox.net/pipermail/buildroot/2020-August/59=
1250.html" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/pi=
permail/buildroot/2020-August/591250.html</a> <br>
&gt; &lt;<a href=3D"http://lists.busybox.net/pipermail/buildroot/2020-Augus=
t/591250.html" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox.ne=
t/pipermail/buildroot/2020-August/591250.html</a>&gt;<br>
&gt; <br>
&gt; The latest entry in the thread is the following, discussing the error =
message <br>
&gt; &quot;/No rule to make target &#39;install/fast&#39;: /is where I&#39;=
m stuck at=C2=A0the moment:<br>
&gt; <br>
&gt;&gt;/However, when it is /&gt;/trying to install my package I have a ne=
w error. The system seems to be /&gt;/looking for a install/fast target, wh=
ich the Makefil does not have. /<br>
&gt; I have no idea on that problem.=C2=A0 Maybe read the CMake docs again?=
<br>
&gt; <br>
&gt; <a href=3D"https://cmake.org/cmake/help/latest/command/install.html" r=
el=3D"noreferrer" target=3D"_blank">https://cmake.org/cmake/help/latest/com=
mand/install.html</a>=C2=A0 &lt;<a href=3D"https://cmake.org/cmake/help/lat=
est/command/install.html" rel=3D"noreferrer" target=3D"_blank">https://cmak=
e.org/cmake/help/latest/command/install.html</a>&gt;<br>
&gt; <br>
&gt; Greets<br>
&gt; Alex<br>
&gt; <br>
&gt; I am still new to cmake, but I&#39;ve been having trouble getting a ba=
sic <br>
&gt; helloworld=C2=A0(in C) cmake package to work. I looked at that link ab=
ove for the <br>
&gt; cmake docs, but am unfamiliar with what I need to do here. My CMakeLis=
ts.txt <br>
&gt; right now is just the following:<br>
&gt; <br>
&gt; cmake_minimum_required(VERSION 3.1.0)<br>
&gt; <br>
&gt; project(helloworld_c_cmake LANGUAGES C)<br>
&gt; <br>
&gt; set(SOURCES main.c)<br>
&gt; <br>
&gt; add_executable(${PROJECT_NAME} ${SOURCES})<br>
<br>
=C2=A0 Since there is no installation rule in the CMakeLists.txt, the insta=
ll/fast <br>
target is not going to be generated. The link above to the cmake documentat=
ion <br>
explains how to add an installation rule.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; <br>
&gt; Any pointers in the right direction would be appreciated. Perhaps this=
 is more <br>
&gt; of a cmake question than a buildroot question, but tying the two toget=
her has <br>
&gt; been confusing, and I&#39;m sure it must be something simple.=C2=A0Tha=
nks in advance,<br>
&gt; <br>
&gt; Cem<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--0000000000001b204105f4c6efe6--

--===============8705283271485481795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8705283271485481795==--
