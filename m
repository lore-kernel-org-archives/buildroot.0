Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DF3C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 20:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E274182D;
	Thu, 16 Feb 2023 20:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E274182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLF06pospH6r; Thu, 16 Feb 2023 20:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D29D418F9;
	Thu, 16 Feb 2023 20:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D29D418F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E1D81BF37C
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 20:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52EFA4011F
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 20:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52EFA4011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozK4jYh8MV-G for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 20:32:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BEC8403E2
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BEC8403E2
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 20:32:29 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id e17so3322631plg.12
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 12:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HDa412pGt2L9jS5BBbByqvYbVPW9nSnGv/RtQ7vH8SE=;
 b=i0gYIST31ys+Rn2fpRdDlkEWS+6bQ3FOLV2oo++Qq5BrZrlSzMBSJ/DlKw6+HDe32O
 8RR3Zy+w4fLy6Vq5SoIkfJc0QzQ5Ws/2rNL5DzjbCj+mt+CoOpvqyPLXoPsDpHVRpr5p
 YVYUACuGHMKZTxsuZudiwMgVVVIYDFNeeRzSP2xcKZzmJ5rfJ6jKMhP1btut9xlnxeFl
 zJ3Cp63PSsC1XSe2WvD57UFTv5EuF5Yhub0jacqo9rgRISQ1rJuQntNDB2i3rq0otXXc
 kifbTmuu1SszaFYvrUvZKJ48lLXi+F64DGsqzCX/+XrR4otU+S9XqFGG5SyyL3TSAiZm
 47lA==
X-Gm-Message-State: AO0yUKUXcxdlhTzAPZyj3HlO9Cw2np94wGcgeek/dASnXDC5d5c0Yuiq
 9QsaX83PhCGRNUesZ4jd/Hpdr3PqbbgWWL2f+5774sqF
X-Google-Smtp-Source: AK7set/2IsPy+HY3FrRAoiltXgOvB60MD2yTgE5YB88len+0/XVoh1oq9Qsj8AKtX7htjq/933IcuAkKqMPjipBYtf8=
X-Received: by 2002:a17:90b:388e:b0:234:f45:c117 with SMTP id
 mu14-20020a17090b388e00b002340f45c117mr1039199pjb.76.1676579548437; Thu, 16
 Feb 2023 12:32:28 -0800 (PST)
MIME-Version: 1.0
References: <20230216174134.34179-1-fontaine.fabrice@gmail.com>
 <CACXRmJiqrD+svtBb91oXJiLrZr8_433u_nSuP9nATPpN5tjpqw@mail.gmail.com>
In-Reply-To: <CACXRmJiqrD+svtBb91oXJiLrZr8_433u_nSuP9nATPpN5tjpqw@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Feb 2023 21:32:17 +0100
Message-ID: <CAPi7W835VLfqbTrYroUmfbAVkgRVG0872VrDzzZ+Yx03ctodzw@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HDa412pGt2L9jS5BBbByqvYbVPW9nSnGv/RtQ7vH8SE=;
 b=cd06Bf0miuo81Nh3xfv90CXKaEYS5wW/0u/Lo4ntlHI+D5uyXv39Sqcbu5gu/gZnbX
 Uq1YiuQldvUheXwc1xrhMDC7Vymnc2WjjCjUiOrwHj+9HtzHkVj75b4kmr4Y0MvjXqZJ
 UgwkdaV+PFr5xTA13exAg81fBHkesrq4IF+Ait07ujMh8etHZu2cFjI/aU5MuPuBumGz
 yzLwIRMfbemTISYsramGOPyqt1KyxrWVZ76c/1+hCfnK6W1L+Z/XY7y4LECJNCni/M4h
 +weC+98mkKIISLHKqUiDapXOs0jvyUrDWI8aZ0vT5gg+S3iwLOgOhw2TWDF1mzvjA889
 kW0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cd06Bf0m
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 libexecinfo
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
Content-Type: multipart/mixed; boundary="===============7914601686524804408=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7914601686524804408==
Content-Type: multipart/alternative; boundary="0000000000006c225505f4d718dc"

--0000000000006c225505f4d718dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Le jeu. 16 f=C3=A9vr. 2023 =C3=A0 20:34, Thomas Devoogdt <thomas@devoogdt.c=
om> a
=C3=A9crit :

> Hi,
>
> Perhaps I'm missing something, but why is it not needed to select
> `BR2_PACKAGE_LIBEXECINFO` in the Config.in file?
> (Similar to `select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC`)
>

libexecinfo is not a mandatory dependency, fluent-bit builds perfectly fine
without it, that's why a select is not needed.


>
> The `ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)` can be re-used to add and
> select execinfo.
>
> Kr,
>
> Thomas Devoogdt
>
> Op do 16 feb. 2023 om 18:41 schreef Fabrice Fontaine
> <fontaine.fabrice@gmail.com>:
> >
> > Fix the following build failure with libexecinfo raised since commit
> > d649bcd3805a26cedb30120ebbdcf12f8fbf449f:
> >
> >
> /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildroot=
-linux-musl/10.4.0/../../../../mips-buildroot-linux-musl/bin/ld:
> ../lib/monkey/library/libmonkey.a(mk_utils.c.o): in function
> `mk_utils_stacktrace':
> > mk_utils.c:(.text+0x1578): undefined reference to `backtrace'
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/63a6ba9104dfddbd7f6a7debadc0c6ef6e=
3a21f5
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/fluent-bit/fluent-bit.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/
> fluent-bit.mk
> > index d618fdf1e2..8ba16399bb 100644
> > --- a/package/fluent-bit/fluent-bit.mk
> > +++ b/package/fluent-bit/fluent-bit.mk
> > @@ -56,6 +56,11 @@ FLUENT_BIT_CXXFLAGS +=3D -fcommon
> >  FLUENT_BIT_CFLAGS +=3D -U_FILE_OFFSET_BITS
> >  FLUENT_BIT_CXXFLAGS +=3D -U_FILE_OFFSET_BITS
> >
> > +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> > +FLUENT_BIT_DEPENDENCIES +=3D libexecinfo
> > +FLUENT_BIT_LDFLAGS +=3D -lexecinfo
> > +endif
> > +
> >  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> >  FLUENT_BIT_DEPENDENCIES +=3D musl-fts
> >  FLUENT_BIT_LDFLAGS +=3D -lfts
> > --
> > 2.39.0
> >
> >
>

Best Regards,

Fabrice

--0000000000006c225505f4d718dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 16 f=C3=A9vr. =
2023 =C3=A0=C2=A020:34, Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoog=
dt.com">thomas@devoogdt.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Perhaps I&#39;m missing something, but why is it not needed to select<br>
`BR2_PACKAGE_LIBEXECINFO` in the Config.in file?<br>
(Similar to `select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC`)<br>=
</blockquote><div><br></div><div>libexecinfo is not a mandatory dependency,=
 fluent-bit builds perfectly fine without it, that&#39;s why a select is no=
t needed.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
The `ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)` can be re-used to add and<br>
select execinfo.<br>
<br>
Kr,<br>
<br>
Thomas Devoogdt<br>
<br>
Op do 16 feb. 2023 om 18:41 schreef Fabrice Fontaine<br>
&lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=3D"_blank">fontain=
e.fabrice@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; Fix the following build failure with libexecinfo raised since commit<b=
r>
&gt; d649bcd3805a26cedb30120ebbdcf12f8fbf449f:<br>
&gt;<br>
&gt; /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildr=
oot-linux-musl/10.4.0/../../../../mips-buildroot-linux-musl/bin/ld: ../lib/=
monkey/library/libmonkey.a(mk_utils.c.o): in function `mk_utils_stacktrace&=
#39;:<br>
&gt; mk_utils.c:(.text+0x1578): undefined reference to `backtrace&#39;<br>
&gt;<br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/63a6ba9104df=
ddbd7f6a7debadc0c6ef6e3a21f5" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/63a6ba9104dfddbd7f6a7debadc0c6ef6e3a21f5</a>=
<br>
&gt;<br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=3D"noref=
errer" target=3D"_blank">fluent-bit.mk</a> | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=
=3D"noreferrer" target=3D"_blank">fluent-bit.mk</a> b/package/fluent-bit/<a=
 href=3D"http://fluent-bit.mk" rel=3D"noreferrer" target=3D"_blank">fluent-=
bit.mk</a><br>
&gt; index d618fdf1e2..8ba16399bb 100644<br>
&gt; --- a/package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=3D"noref=
errer" target=3D"_blank">fluent-bit.mk</a><br>
&gt; +++ b/package/fluent-bit/<a href=3D"http://fluent-bit.mk" rel=3D"noref=
errer" target=3D"_blank">fluent-bit.mk</a><br>
&gt; @@ -56,6 +56,11 @@ FLUENT_BIT_CXXFLAGS +=3D -fcommon<br>
&gt;=C2=A0 FLUENT_BIT_CFLAGS +=3D -U_FILE_OFFSET_BITS<br>
&gt;=C2=A0 FLUENT_BIT_CXXFLAGS +=3D -U_FILE_OFFSET_BITS<br>
&gt;<br>
&gt; +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)<br>
&gt; +FLUENT_BIT_DEPENDENCIES +=3D libexecinfo<br>
&gt; +FLUENT_BIT_LDFLAGS +=3D -lexecinfo<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)<br>
&gt;=C2=A0 FLUENT_BIT_DEPENDENCIES +=3D musl-fts<br>
&gt;=C2=A0 FLUENT_BIT_LDFLAGS +=3D -lfts<br>
&gt; --<br>
&gt; 2.39.0<br>
&gt;<br>
&gt;<br></blockquote><div><br></div><div>Best Regards,</div><div><br></div>=
<div>Fabrice <br></div></div></div>

--0000000000006c225505f4d718dc--

--===============7914601686524804408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7914601686524804408==--
