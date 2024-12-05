Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD033E77170
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 19:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5C0846FE;
	Thu,  5 Dec 2024 19:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-9oTaxDL8Lt; Thu,  5 Dec 2024 19:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F82584719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F82584719;
	Thu,  5 Dec 2024 19:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 629CD1DD9
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DC54846FE
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymB1NlDms2MC for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 19:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F113846EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F113846EB
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F113846EB
 for <buildroot@busybox.net>; Thu,  5 Dec 2024 19:04:27 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2ef10b314e4so1121874a91.0
 for <buildroot@busybox.net>; Thu, 05 Dec 2024 11:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733425467; x=1734030267;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tbuG/5tQuIQUbcYlQvvHGLfVkUe+UaI9qjPoo2Y+Lm0=;
 b=xTBZ796vqPYrpwMtHBo++5MPR/O547dOUPeAEsg7XAxjmHJdtxy8FcnGUN+92KkTE0
 SuWgdJY+YgeqSh9iXEPS+LD0AFDfRsgESjXfW389JbDFdNcomTMOSziuqqiYSSKwSGjw
 yysCDb5P/nD429x6nyRisDTknhfZ5sDmORdfWcEXTI1qAQig7uqAaVSc5aCY1JAT/qsE
 ro2ckqkt5FmuepygFNI6iIOdZfoKqzmL9Bm9ucmlHzDP+pX8CYSRlvDnLXf8dPNlzADX
 07xM9yp0ZawgI6e2XG5FU29bvPnrBqgBeDM7Nwgy+Dg1NgccjDuP2ifIDAV61IIHivM7
 hhqQ==
X-Gm-Message-State: AOJu0YxRPkm/TrUt+f95zYtRlFxbk2hYiKajJTtJCROR7GPg3YrCHbW0
 YS+mKzjKpN6iX14TkzP0W1Qr9r412JTmZl3ugjlra8Kcg3yjNQsyy3lnHPwRe5lXVI0mUDxL4ar
 uvOO7dYo+C8vdsdPNB56ANGqNWj8lf3V0DMt3TzA5Bx46KpfID9MF
X-Gm-Gg: ASbGncu4Sb3DpqQxkuP1p4UyobALOc8m/EO8QYVqA+8gMEfYjoGMxG5cIjYlt19EmUj
 6uu4GQs0YFjQUO4C+lcDwvlm6riobDKxlJk7VXhIsjsASSRYDRHxkxLs/2Phgoesy
X-Google-Smtp-Source: AGHT+IHwBCGKfYK+QQBonNjWHtsWkom33+PibJol2uvgWCxzHpHfYLOQiD1it0KZi78Ato9oLhzQLtLDI/IGOzQn3DM=
X-Received: by 2002:a17:90b:5205:b0:2ee:d7d3:3019 with SMTP id
 98e67ed59e1d1-2ef69fffa68mr475738a91.12.1733425467125; Thu, 05 Dec 2024
 11:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20241116182335.121470-1-francois.perrad@gadz.org>
 <ee4f72e9-b001-4b12-96f2-4133a52a8efc@mind.be>
In-Reply-To: <ee4f72e9-b001-4b12-96f2-4133a52a8efc@mind.be>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 5 Dec 2024 20:04:16 +0100
Message-ID: <CAAE6iEUK5G1jidSoLBo3JnPFgZTzo5LWBJ6Wsn7mKRB3TU_F+A@mail.gmail.com>
To: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1733425467; x=1734030267; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tbuG/5tQuIQUbcYlQvvHGLfVkUe+UaI9qjPoo2Y+Lm0=;
 b=g4wfNfwy99FQ2SMAsnEU/ZETDJL/VQKH9ebnIa9C0qBkR08BXyBD7NGLzACtdlAg9g
 lH0raR8i815YJKs5cfMjBzoISoSeu5PohcLxzHU7wpYd2V45MBozdw+Ci7cSa7ZrDu+O
 J2bpWpcGhjQRQX/em7MhkIwb71tkpvLQn8WZWgbhOuyHanbroTLEkn0LdM4PpAAsC4LZ
 DlW8LfzYcsvRoCOZQePOajZliMoeVkWo0cp6LYD5nlEcevSqPh5Gojn8aAknKFnf1RGv
 q/29O2bUodP0hIW3TtpoDAuKV6Uv5vKmMk/38itrpdZ9geZf5Q4Ab+eDBWRRuubdZmpn
 V1VQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=g4wfNfwy
Subject: Re: [Buildroot] [PATCH] package/perl: fix static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4438848132130758507=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4438848132130758507==
Content-Type: multipart/alternative; boundary="00000000000037070006288a9140"

--00000000000037070006288a9140
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 d=C3=A9c. 2024 =C3=A0 22:28, Arnout Vandecappelle <arnout@mind.be=
> a =C3=A9crit :

>
>
> On 16/11/2024 19:23, Francois Perrad wrote:
> > see https://autobuild.buildroot.org/?reason=3Dperl-5.40.0
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >   package/perl/0001-fix-static-build.patch | 52 +++++++++++++++++++++++=
+
> >   1 file changed, 52 insertions(+)
> >   create mode 100644 package/perl/0001-fix-static-build.patch
> >
> > diff --git a/package/perl/0001-fix-static-build.patch
> b/package/perl/0001-fix-static-build.patch
> > new file mode 100644
> > index 000000000..9db50da80
> > --- /dev/null
> > +++ b/package/perl/0001-fix-static-build.patch
> > @@ -0,0 +1,52 @@
> > +From f05bcc4a518a1798be692e76277b96c078383f4c Mon Sep 17 00:00:00 2001
> > +From: Francois Perrad <francois.perrad@gadz.org>
> > +Date: Wed, 13 Nov 2024 12:09:50 +0100
> > +Subject: [PATCH] fix static build
> > +
> > +Upstream: revert of
> https://github.com/Perl/perl5/commit/3b03ffb49b24a05e8de3844ea7e754df141b=
39cf
>
>   Since that commit fixes another build failure, simply reverting it is
> not OK.
> Can you find an actual solution? Perhaps open a new bug upstream?
>
>
I've already created this issue on perl-cross project :
https://github.com/arsv/perl-cross/issues/149

Obviously, my revert can not be upstreamed on the perl project.

But this revert breaks nothing on Buildroot, because we use perl-cross as
configure/build system instead of the perl one which is not cross-compiling
capable.

Regards,

Fran=C3=A7ois

  Regards,
>   Arnout
>
> > +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > +---
> > + ext/re/Makefile.PL | 7 -------
> > + regcomp.h          | 4 ++--
> > + 2 files changed, 2 insertions(+), 9 deletions(-)
> > +
> > +diff --git a/ext/re/Makefile.PL b/ext/re/Makefile.PL
> > +index 01786e1ec2..8d4a576e4c 100644
> > +--- a/ext/re/Makefile.PL
> > ++++ b/ext/re/Makefile.PL
> > +@@ -28,13 +28,6 @@ foreach my $tuple (@files) {
> > + }
> > +
> > + my $defines =3D '-DPERL_EXT_RE_BUILD -DPERL_EXT_RE_DEBUG -DPERL_EXT';
> > +-my %args;
> > +-for my $arg (@ARGV) {
> > +-    $args{$1} =3D $2 if $arg =3D~ /^(\w+)=3D(.*)$/;
> > +-}
> > +-if ($args{LINKTYPE} eq "static") {
> > +-    $defines .=3D ' -DPERL_EXT_RE_STATIC';
> > +-}
> > +
> > + my @libs;
> > + if ($^O eq 'cygwin' && $Config{usequadmath}) {
> > +diff --git a/regcomp.h b/regcomp.h
> > +index 7a20b54fdf..017a9f8435 100644
> > +--- a/regcomp.h
> > ++++ b/regcomp.h
> > +@@ -1559,12 +1559,12 @@ typedef enum {
> > +  * and this is not a DEBUGGING enabled build (identified by
> > +  * DEBUGGING_RE_ONLY being defined)
> > +  */
> > +-#if ( !defined(PERL_EXT_RE_STATIC) && defined(DEBUGGING)) ||       \
> > ++#if ( defined(USE_DYNAMIC_LOADING) && defined(DEBUGGING)) || \
> > +     ( defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING_RE_ONLY)) || \
> > +     (!defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING))
> > + #define PERL_RE_BUILD_DEBUG
> > + #endif
> > +-#if !defined(PERL_EXT_RE_STATIC)
> > ++#if ( defined(USE_DYNAMIC_LOADING) || !defined(PERL_EXT_RE_BUILD) )
> > + #define PERL_RE_BUILD_AUX
> > + #endif
> > +
> > +--
> > +2.43.0
> > +
>
>

--00000000000037070006288a9140
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 4 d=C3=A9c. 2024 =C3=A0=
=C2=A022:28, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arn=
out@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
<br>
On 16/11/2024 19:23, Francois Perrad wrote:<br>
&gt; see <a href=3D"https://autobuild.buildroot.org/?reason=3Dperl-5.40.0" =
rel=3D"noreferrer" target=3D"_blank">https://autobuild.buildroot.org/?reaso=
n=3Dperl-5.40.0</a><br>
&gt; <br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/perl/0001-fix-static-build.patch | 52 ++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 52 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/perl/0001-fix-static-build.patc=
h<br>
&gt; <br>
&gt; diff --git a/package/perl/0001-fix-static-build.patch b/package/perl/0=
001-fix-static-build.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..9db50da80<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/perl/0001-fix-static-build.patch<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +From f05bcc4a518a1798be692e76277b96c078383f4c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org"=
 target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; +Date: Wed, 13 Nov 2024 12:09:50 +0100<br>
&gt; +Subject: [PATCH] fix static build<br>
&gt; +<br>
&gt; +Upstream: revert of <a href=3D"https://github.com/Perl/perl5/commit/3=
b03ffb49b24a05e8de3844ea7e754df141b39cf" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/Perl/perl5/commit/3b03ffb49b24a05e8de3844ea7e754df141=
b39cf</a><br>
<br>
=C2=A0 Since that commit fixes another build failure, simply reverting it i=
s not OK. <br>
Can you find an actual solution? Perhaps open a new bug upstream?<br>
<br></blockquote><div><br></div><div>I&#39;ve already created this issue on=
 perl-cross project : <a href=3D"https://github.com/arsv/perl-cross/issues/=
149">https://github.com/arsv/perl-cross/issues/149</a></div><div><br></div>=
<div>Obviously, my revert can not be upstreamed on the perl project.<br></d=
iv><div><br></div><div>But this revert breaks nothing on Buildroot, because=
 we use perl-cross as configure/build system instead of the perl one which =
is not cross-compiling capable.<br></div><div><br></div><div>Regards,<br></=
div><div><br></div><div>Fran=C3=A7ois<br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@=
gadz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; +---<br>
&gt; + ext/re/Makefile.PL | 7 -------<br>
&gt; + regcomp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; + 2 files changed, 2 insertions(+), 9 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/ext/re/Makefile.PL b/ext/re/Makefile.PL<br>
&gt; +index 01786e1ec2..8d4a576e4c 100644<br>
&gt; +--- a/ext/re/Makefile.PL<br>
&gt; ++++ b/ext/re/Makefile.PL<br>
&gt; +@@ -28,13 +28,6 @@ foreach my $tuple (@files) {<br>
&gt; + }<br>
&gt; +<br>
&gt; + my $defines =3D &#39;-DPERL_EXT_RE_BUILD -DPERL_EXT_RE_DEBUG -DPERL_=
EXT&#39;;<br>
&gt; +-my %args;<br>
&gt; +-for my $arg (@ARGV) {<br>
&gt; +-=C2=A0 =C2=A0 $args{$1} =3D $2 if $arg =3D~ /^(\w+)=3D(.*)$/;<br>
&gt; +-}<br>
&gt; +-if ($args{LINKTYPE} eq &quot;static&quot;) {<br>
&gt; +-=C2=A0 =C2=A0 $defines .=3D &#39; -DPERL_EXT_RE_STATIC&#39;;<br>
&gt; +-}<br>
&gt; +<br>
&gt; + my @libs;<br>
&gt; + if ($^O eq &#39;cygwin&#39; &amp;&amp; $Config{usequadmath}) {<br>
&gt; +diff --git a/regcomp.h b/regcomp.h<br>
&gt; +index 7a20b54fdf..017a9f8435 100644<br>
&gt; +--- a/regcomp.h<br>
&gt; ++++ b/regcomp.h<br>
&gt; +@@ -1559,12 +1559,12 @@ typedef enum {<br>
&gt; +=C2=A0 * and this is not a DEBUGGING enabled build (identified by<br>
&gt; +=C2=A0 * DEBUGGING_RE_ONLY being defined)<br>
&gt; +=C2=A0 */<br>
&gt; +-#if ( !defined(PERL_EXT_RE_STATIC) &amp;&amp; defined(DEBUGGING)) ||=
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; ++#if ( defined(USE_DYNAMIC_LOADING) &amp;&amp; defined(DEBUGGING)) ||=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0( defined(PERL_EXT_RE_BUILD) &amp;&amp; defined(D=
EBUGGING_RE_ONLY)) || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(!defined(PERL_EXT_RE_BUILD) &amp;&amp; defined(D=
EBUGGING))<br>
&gt; + #define PERL_RE_BUILD_DEBUG<br>
&gt; + #endif<br>
&gt; +-#if !defined(PERL_EXT_RE_STATIC)<br>
&gt; ++#if ( defined(USE_DYNAMIC_LOADING) || !defined(PERL_EXT_RE_BUILD) )<=
br>
&gt; + #define PERL_RE_BUILD_AUX<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.43.0<br>
&gt; +<br>
<br>
</blockquote></div></div>

--00000000000037070006288a9140--

--===============4438848132130758507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4438848132130758507==--
