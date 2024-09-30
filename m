Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6EDCE8359
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 15:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C96606D9;
	Mon, 30 Sep 2024 15:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vAJwh4NRXQm; Mon, 30 Sep 2024 15:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0FA5606CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0FA5606CC;
	Mon, 30 Sep 2024 15:26:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1E761BF331
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 15:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1A7580AF0
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 15:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEO_HipWLDHl for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 15:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCFEF80ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFEF80ABC
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCFEF80ABC
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 15:26:35 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-84e873a454fso1242100241.0
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 08:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727709994; x=1728314794;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+LF7J73zYOMW+iAhwePYvwGGpO/kJEu12/tWUezSw+g=;
 b=nr45C8Nt0Lnt8dRUjrEXVumh0Uxqf6S627FLNPJxgHb+ZtKj8cYVGQnAbe7UTg1GCC
 57WFaKzy0OZeYM+7xfv/ijZZfa+iLqGCInUU2b61HS5uUtNVV6TdsKgoFh3xNHIbbTMa
 GuU1j0Jk391l5nnYtRwtAhMHRrB7pkJjqo9TuE+TKa9UHM88FVb/MWP9iGNEEic4QP9U
 XBb3PwoCLaz6LDcbdcVb/TU7pOJMwOI/uxfzBAAaIeJUXoOE+g8NKTyZwp0m6CaSoRkN
 HyreQvqlQuf7E9TNnbzZ83ruc84Qm3BmnUq44o+NIF9TJBxtbKfJf6PY4OUxi04knki7
 ilsw==
X-Gm-Message-State: AOJu0YwcsMjLN4cTqZ56Vcvo119C+ofFYY8BHsY7U3rs5MkxWjggz3FC
 h3b0QJSLSniF7MZB4k0iZ5cNYgj0Q6Iqy36xzvnEtKLKfSAVHJiqxYZDKYc/GpCaKVlBpGlFeUO
 bpFQ6Xtg7w/MDa8JuAv03uc3f/gs=
X-Google-Smtp-Source: AGHT+IE+100iX1/28D/iNAs09GfAiapQw+NngslIXH6reNKGmPZB0IodO2P6rRIIGY8HqpfwJVas2IzuiZQvrxLhnow=
X-Received: by 2002:a05:6122:2511:b0:4f2:ea44:fd2b with SMTP id
 71dfb90a1353d-50781515f11mr6961250e0c.0.1727709994226; Mon, 30 Sep 2024
 08:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240820002836.2563288-1-james.hilliard1@gmail.com>
 <CA+h8R2ogf67rUHNWnLu8KFMJTdBMpAYBGb2GYhP1pJYL8D0_4g@mail.gmail.com>
In-Reply-To: <CA+h8R2ogf67rUHNWnLu8KFMJTdBMpAYBGb2GYhP1pJYL8D0_4g@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 30 Sep 2024 09:26:23 -0600
Message-ID: <CADvTj4rYxTLA4PteYPx7m_6POjYb1B0QUFNa2sgKSJS9GrCSUg@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727709994; x=1728314794; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+LF7J73zYOMW+iAhwePYvwGGpO/kJEu12/tWUezSw+g=;
 b=GeAUUVcNbL3SxqZMRZR38iX7DLzEDyL6TZtd36i0jFFGZ/aN0UPKuYQuOx5x6EANS5
 RMYIfSmPF33CenOR2x3xqf2k0QoDWwTrIHIvRIgkh4if2xG+z8GaWz0gfE8ozN0Jl8MF
 mnm+7htem1xiRYf6JfclekH2x7co5atcql01TY0etSgl8NBdy47MiWedZWH219AvG3Mu
 YGLNYnBjtE7HJnT5jEvzCRkgbhv5CqePqmDGKOlI/MW/+g6SsDk2PLNGVB1TQtFa9xv5
 A/KfPDysE73oaIMhB22Y5cJDNV+vJ8L039DdDyeqxd2awVZSi45HN3cXjxyDc4NJgHW+
 Or1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GeAUUVcN
Subject: Re: [Buildroot] [PATCH v5 1/1] package/tailscale: new package
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2735415922992672665=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2735415922992672665==
Content-Type: multipart/alternative; boundary="0000000000007b1c03062357d4dd"

--0000000000007b1c03062357d4dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 2:40=E2=80=AFAM Christian Stewart <christian@apertu=
re.us>
wrote:

> James,
>
> On Mon, Aug 19, 2024 at 5:28=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> > ---
> >  DEVELOPERS                       |  1 +
> >  package/Config.in                |  1 +
> >  package/tailscale/Config.in      |  8 ++++++++
> >  package/tailscale/tailscale.hash |  3 +++
> >  package/tailscale/tailscale.mk   | 22 ++++++++++++++++++++++
> >  5 files changed, 35 insertions(+)
> >  create mode 100644 package/tailscale/Config.in
> >  create mode 100644 package/tailscale/tailscale.hash
> >  create mode 100644 package/tailscale/tailscale.mk
>
> LGTM.
>
> Reviewed-by: Christian Stewart <christian@aperture.us>
>
> That said, the latest version is now v1.74.1
>

I don't think we have a golang that's new enough for that version yet:
https://github.com/tailscale/tailscale/blob/v1.74.1/go.mod#L3


>
> > +TAILSCALE_VERSION =3D 1.72.0
>
> Best regards,
> Christian Stewart
>

--0000000000007b1c03062357d4dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 30, 2024 at 2:40=E2=80=AFAM C=
hristian Stewart &lt;<a href=3D"mailto:christian@aperture.us">christian@ape=
rture.us</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">James,<br>
<br>
On Mon, Aug 19, 2024 at 5:28=E2=80=AFPM James Hilliard<br>
&lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank">james.hi=
lliard1@gmail.com</a>&gt; wrote:<br>
&gt; ---<br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/tailscale/Config.in=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++++=
++<br>
&gt;=C2=A0 package/tailscale/tailscale.hash |=C2=A0 3 +++<br>
&gt;=C2=A0 package/tailscale/<a href=3D"http://tailscale.mk" rel=3D"norefer=
rer" target=3D"_blank">tailscale.mk</a>=C2=A0 =C2=A0| 22 ++++++++++++++++++=
++++<br>
&gt;=C2=A0 5 files changed, 35 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/tailscale/Config.in<br>
&gt;=C2=A0 create mode 100644 package/tailscale/tailscale.hash<br>
&gt;=C2=A0 create mode 100644 package/tailscale/<a href=3D"http://tailscale=
.mk" rel=3D"noreferrer" target=3D"_blank">tailscale.mk</a><br>
<br>
LGTM.<br>
<br>
Reviewed-by: Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us"=
 target=3D"_blank">christian@aperture.us</a>&gt;<br>
<br>
That said, the latest version is now v1.74.1<br></blockquote><div><br></div=
><div>I don&#39;t think we have a golang that&#39;s new enough for that ver=
sion yet:</div><div><a href=3D"https://github.com/tailscale/tailscale/blob/=
v1.74.1/go.mod#L3">https://github.com/tailscale/tailscale/blob/v1.74.1/go.m=
od#L3</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +TAILSCALE_VERSION =3D 1.72.0<br>
<br>
Best regards,<br>
Christian Stewart<br>
</blockquote></div></div>

--0000000000007b1c03062357d4dd--

--===============2735415922992672665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2735415922992672665==--
