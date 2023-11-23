Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C34C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72FF8201E;
	Thu, 23 Nov 2023 17:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72FF8201E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id av1D_R_PgXC9; Thu, 23 Nov 2023 17:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F5B81FE4;
	Thu, 23 Nov 2023 17:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F5B81FE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D98CD1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2C2981312
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C2981312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fOx_j9ztRNH for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 17:55:45 +0000 (UTC)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D432481321
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 17:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D432481321
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so1091554276.1
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 09:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700762144; x=1701366944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rlcEbhxpvsKYwHVYaW+3HDxHew7q/QJ+co11lFA0s7U=;
 b=MfP6VXi6Jcc4JeX0JpmGU4FEDY7OAFFcVI78NAJds2rwRoUyxXKy9YhaQl4QHWtPWG
 UjQZPyeRRX2IosUBpdf6anyrNdjlmnZXb+uUQDgAPQpGVTOIboEQtHeR3msXn+ouOTuR
 K3piNhV2bFjMsZ22vzKf4Qo3Sy9CzAthIRafjdf7uaeR5fu9lOoADX/9HPlZtJKJP2H/
 Z0mvNOcU0sdpHmptL71WZ8CYADd0AAGQJYOmEZZJha9hgpCQhX5NNmWGRGA54U8sOhVu
 XZvjYz8DTBZAXBGnmPLj0cZ93ibLDuk0+Vsl4IUIhsS+PJ6kiCgQSRkvxmM//eTbrvr9
 BnRg==
X-Gm-Message-State: AOJu0YzYlhEEZSoFRwWGZ03nv/FT6KXkHrm+4halieB1Osc/Mxhyv83a
 KQPBM8L+hJaaVhjM9sNn7BrLGIh0FHOkmu9GdSZeXBzGdg4=
X-Google-Smtp-Source: AGHT+IEUCe6DqePKL+avLnwDj3cn1yGTmf0W1riQKqPLHRM+/w3P2rugf6luyK0Nb4QEfFPauLWdkkaz+vWB3QjOZMg=
X-Received: by 2002:a25:190b:0:b0:db3:628d:c7af with SMTP id
 11-20020a25190b000000b00db3628dc7afmr6033ybz.47.1700762143625; Thu, 23 Nov
 2023 09:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20231121174722.4164-1-trippgallagher98@gmail.com>
 <20231123111528.3f88828e@windsurf>
In-Reply-To: <20231123111528.3f88828e@windsurf>
From: Byron Gallagher <trippgallagher98@gmail.com>
Date: Thu, 23 Nov 2023 12:55:33 -0500
Message-ID: <CAAmzYqn7P5mqWuorwSy2McooKGSfn_VWoOx+dXXv1fpF1J=y0g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700762144; x=1701366944; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rlcEbhxpvsKYwHVYaW+3HDxHew7q/QJ+co11lFA0s7U=;
 b=YwbN+rYiQAOCdmeMgIUyc+VNrt1bAlypD1lWh+KzGIMlg8NdfEHUF03BFLD+yqJHTR
 gWItooM9ZVmrVJSI7vNh0743rhTGtx5tyeu2DTKOH0Hqv6HjR5E2rzyGA3HRqPhT05Xh
 eX9vBQnMeV2ugLHwRAwBw29Ddf/DrhtP41bpP+pBHH0SJPojYjk8ca0hPUTL0Vonwbip
 lxvAQKuspqwW6CoGrOJW5ZGiRF8BQQzwxjhSk0CeiBUNqOhTCMsQxjfaO4L564pDgXzr
 9p30jZDQ9LDf6kv5AOsjUcxcNlHzwKVjHQ4bMCTTru8xgBEWRA2xytHRRYlypGImZWX+
 YPCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YwbN+rYi
Subject: Re: [Buildroot] [PATCH] package/socat: fix static openssl
 compatibility
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
Content-Type: multipart/mixed; boundary="===============8110065285982222857=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8110065285982222857==
Content-Type: multipart/alternative; boundary="0000000000006b1535060ad58b0f"

--0000000000006b1535060ad58b0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

That makes sense. In this case would it be sufficient to add another layer
of AC_TRY_LINK to check the static case? i.e. we try with -lssl -lcrypto
first and if fail, try again with -lssl -lcrypto -lz?

Best Regards,
Byron

On Thu, Nov 23, 2023 at 5:15=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Byron,
>
> On Tue, 21 Nov 2023 12:47:22 -0500
> Byron Gallagher <trippgallagher98@gmail.com> wrote:
>
> > +diff --git a/configure.ac b/configure.ac
> > +index 9d60473..ae0e6bd 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -580,12 +580,12 @@ if test -n "$WITH_OPENSSL" -a
> "$sc_cv_have_openssl_ssl_h" =3D 'yes'; then
> > +       if test -n "$OPENSSL_BASE"; then
> > +     L=3D"$OPENSSL_BASE/lib"; LIBS=3D"$LIBS -L$L -lssl -lcrypto"
> > +       else
> > +-    LIBS=3D"$LIBS -lssl -lcrypto"
> > ++    LIBS=3D"$LIBS -lssl -lcrypto -lz"
>
> The downside of this is that socat is then directly linked to libz even
> when it's not needed (dynamic linking situation).
>
> The correct/ideal way of handling this is to use pkg-config, as it
> properly says whether we need -lssl -lcrypto (dynamic linking case) or
> -lssl -lcrypto -lz (static linking case), without hardcoding this in
> socat itself.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000006b1535060ad58b0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>=
That makes sense. In this case would it be sufficient to add another layer =
of AC_TRY_LINK to check the static case? i.e. we try with -lssl -lcrypto fi=
rst and if fail, try again with -lssl -lcrypto -lz?</div><div><br></div><di=
v>Best Regards,</div><div>Byron</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 23, 2023 at 5:15=E2=80=AFA=
M Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thom=
as.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hello Byron,<br>
<br>
On Tue, 21 Nov 2023 12:47:22 -0500<br>
Byron Gallagher &lt;<a href=3D"mailto:trippgallagher98@gmail.com" target=3D=
"_blank">trippgallagher98@gmail.com</a>&gt; wrote:<br>
<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 9d60473..ae0e6bd 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -580,12 +580,12 @@ if test -n &quot;$WITH_OPENSSL&quot; -a &quot;$=
sc_cv_have_openssl_ssl_h&quot; =3D &#39;yes&#39;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n &quot;$OPENSSL_BASE&quot;; then=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0L=3D&quot;$OPENSSL_BASE/lib&quot;; LIBS=3D&quot;$=
LIBS -L$L -lssl -lcrypto&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +-=C2=A0 =C2=A0 LIBS=3D&quot;$LIBS -lssl -lcrypto&quot;<br>
&gt; ++=C2=A0 =C2=A0 LIBS=3D&quot;$LIBS -lssl -lcrypto -lz&quot;<br>
<br>
The downside of this is that socat is then directly linked to libz even<br>
when it&#39;s not needed (dynamic linking situation).<br>
<br>
The correct/ideal way of handling this is to use pkg-config, as it<br>
properly says whether we need -lssl -lcrypto (dynamic linking case) or<br>
-lssl -lcrypto -lz (static linking case), without hardcoding this in<br>
socat itself.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000006b1535060ad58b0f--

--===============8110065285982222857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8110065285982222857==--
