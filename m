Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635A8C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 11:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEDED41299;
	Wed, 15 Feb 2023 11:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEDED41299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3lFDHu6Y7wG; Wed, 15 Feb 2023 11:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997DA414DE;
	Wed, 15 Feb 2023 11:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997DA414DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D19041BF831
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 11:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABAB28140A
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 11:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABAB28140A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aVFP4b6pDzk for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 11:42:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCC87813E6
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCC87813E6
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 11:42:11 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id a9so21800511ljr.13
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 03:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E066ZeeRfQvjjwTMDBAxaMRjbJX8qRmYryWGe5VP6V0=;
 b=BMD3of1Ugh5elwN1McqIn+uJ9TYyUXx5r6WGO+dfcGS4OL2WdrhpFRe1dCfKO0U4n4
 XCr8ayShJ3W5c/nPxL9n3CqWRkXZ+172ZDGIZcfT1XtYMegPm9JJnuum/UhQR/0dp2hC
 1Rk4BqCwpka18ih2nIqUg8xk0XQlJq1mjbDn0NB9pE7yrK0jQGuzVshX4FWKbXb7c/UU
 XtMidVOf5TZr+PpZtxie7FiMPRaqk0exhiw7QvQIiV6CINZJmKLFo2143E+4kkFXzgWI
 vUC6jr5kTSqZBJCZe54OeLKvQItqsQoMyu+icsgN4vtZ4DHMTVetL/RvMAYW0IPqeT+1
 ECmA==
X-Gm-Message-State: AO0yUKUQ7aZ9DYZEsN0e1rvzZTguqWfLuDc6bWHJarG59EbrQK6RXTzi
 NX4aBcNQP7bigaoC/lY6AtqHfPPw/vrkTA==
X-Google-Smtp-Source: AK7set/9dYsw9JOaRws+wBBGpor9zqdFEhG56svoyBeKLigzwXrTuFq5Jwo5S20gsuF5sO4RqLAEaA==
X-Received: by 2002:a2e:92cb:0:b0:293:4ea5:5e81 with SMTP id
 k11-20020a2e92cb000000b002934ea55e81mr466140ljh.51.1676461329534; 
 Wed, 15 Feb 2023 03:42:09 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e7a09000000b00293277b4cc9sm2716189ljc.42.2023.02.15.03.42.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 03:42:08 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id x29so21930110ljq.0
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 03:42:08 -0800 (PST)
X-Received: by 2002:a2e:8e21:0:b0:293:5fb9:3c10 with SMTP id
 r1-20020a2e8e21000000b002935fb93c10mr452558ljk.10.1676461328682; Wed, 15 Feb
 2023 03:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20230211182546.633728-1-thomas@devoogdt.com>
 <20230211182546.633728-2-thomas@devoogdt.com>
 <87ttzn473w.fsf@dell.be.48ers.dk>
In-Reply-To: <87ttzn473w.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 15 Feb 2023 12:41:57 +0100
X-Gmail-Original-Message-ID: <CACXRmJjsrzs0zE62H9vnYjEL89y7j_SHGfRKA24yu4noY8aPxA@mail.gmail.com>
Message-ID: <CACXRmJjsrzs0zE62H9vnYjEL89y7j_SHGfRKA24yu4noY8aPxA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v2 2/3] package/fluent-bit: add support for
 non glibc toolchain
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1779310944956733362=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1779310944956733362==
Content-Type: multipart/alternative; boundary="000000000000f9d55205f4bb9106"

--000000000000f9d55205f4bb9106
Content-Type: text/plain; charset="UTF-8"

Hi, Peter

It would indeed be better to link against those,
but this is sadly the nature of how fluent-bit is made.
Next to those two libs, there are a dozen  of other libs that are also
literally copied in their code base. What you are proposing is to adapt
their cmakefile and only compile the static libs if no dynamic lib could be
found. Or even never compile it and just pass the linker flags. I'm afraid
that we could have compatibility problems by that, so I would keep it
static for now.

Kr

Thomas Devoogdt

Op wo 15 feb. 2023 10:21 schreef Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "thomas" == thomas  <thomas@devoogdt.com> writes:
>
>  > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
>  > - require threads and dynamic library support
>  > - require sync_4 support
>  > - provide fts.h trough musl-fts
>
>  > static_assert is not available if no C++ toolchain or no glibc
>  > is used, so add two patches to fix this
>
>  > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> Committed, thanks. We do have xxhash and c-ares packages in Buildroot,
> could you have a look at using those instead of these vendored
> libraries?
>
> --
> Bye, Peter Korsgaard
>
>

--000000000000f9d55205f4bb9106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi, Peter</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">It would indeed be better to link against those,</div><div dir=3D=
"auto">but this is sadly the nature of how fluent-bit is made.=C2=A0</div><=
div dir=3D"auto">Next to those two libs, there are a dozen=C2=A0 of other l=
ibs that are also literally copied in their code base. What you are proposi=
ng is to adapt their cmakefile and only compile the static libs if no dynam=
ic lib could be found. Or even never compile it and just pass the linker fl=
ags. I&#39;m afraid that we could have compatibility problems by that, so I=
 would keep it static for now.=C2=A0</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Kr=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
omas Devoogdt=C2=A0<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">Op wo 15 feb. 2023 10:21 schreef Peter Korsga=
ard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt;:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;thomas&=
quot; =3D=3D thomas=C2=A0 &lt;<a href=3D"mailto:thomas@devoogdt.com" target=
=3D"_blank" rel=3D"noreferrer">thomas@devoogdt.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barc=
o.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a>&g=
t;<br>
=C2=A0&gt; - require threads and dynamic library support<br>
=C2=A0&gt; - require sync_4 support<br>
=C2=A0&gt; - provide fts.h trough musl-fts<br>
<br>
=C2=A0&gt; static_assert is not available if no C++ toolchain or no glibc<b=
r>
=C2=A0&gt; is used, so add two patches to fix this<br>
<br>
=C2=A0&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devo=
ogdt@barco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.=
com</a>&gt;<br>
<br>
Committed, thanks. We do have xxhash and c-ares packages in Buildroot,<br>
could you have a look at using those instead of these vendored<br>
libraries?<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
<br>
</blockquote></div></div></div>

--000000000000f9d55205f4bb9106--

--===============1779310944956733362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1779310944956733362==--
