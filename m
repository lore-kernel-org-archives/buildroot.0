Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D6C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 08:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A6841774;
	Tue, 18 Oct 2022 08:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A6841774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JnKb73OWiZs7; Tue, 18 Oct 2022 08:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 672CF41882;
	Tue, 18 Oct 2022 08:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 672CF41882
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBBBD1BF354
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5F1440A99
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 08:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5F1440A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VtLqi6mHyvu for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 08:03:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 367A040A98
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 367A040A98
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 08:03:42 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-35711e5a5ceso129525247b3.13
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 01:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D7O6n4ADTtBWsbgyWRjHi0fyReKPALISwLzYRdAYYiM=;
 b=AIlYJPSD9VOoYUALif4+Er2/kNewrpUb5uzqntb1AwbDarKRIEiD/uEdJ+2cnfiXWB
 lybo7l65t23ov1oRw0PFaRtdC42MWqQfQSS6oeuXUh8a4/EVzUwAz/woqlEwEVWg5wVS
 P52kl7nCQMmjeUhDnoTQh77TZbTwVz6D1RclA9HQNSZ0+7dyXtPALYo/6yxEybvw+MEC
 O8rU42LYrmf9sW4skBMoc99wOpeQIAs2t5GaTrG5TRrH+/4g+ySCS9FF7bZI5ZN0n0wB
 19DWtBdzNKt3+mMKVpEshX3pM8ak6QWvkDThm+BQ7wEI1qMFTcKHJzt6hXTQ6rHtYvym
 4t/w==
X-Gm-Message-State: ACrzQf2fBDqcsIXY8aPRB0yUvUlUNWoJ9aRUXdtnDfG5B9+vIykygxWn
 XKdP1M21N0LDzeq7jlaIhYceiP79e3w85cVxp5lF5g==
X-Google-Smtp-Source: AMsMyM7XEozivEH3uDvhsHidxR2gVv1FObE6Uvz35JvIIlhD7eYpUNfd7Jrg8s53zhBHKpqIKedSNPt4dhWvTK9BWag=
X-Received: by 2002:a81:63c4:0:b0:349:543f:99f3 with SMTP id
 x187-20020a8163c4000000b00349543f99f3mr1417116ywb.392.1666080221957; Tue, 18
 Oct 2022 01:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
 <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
 <20221017175500.GB3666@scaer>
 <CA+h8R2poqGOachEBUhQjiVmXwqMJJXxD3RrzeDKVAe_7PSSZJA@mail.gmail.com>
 <20221017184442.GD3666@scaer>
 <CA+h8R2rvN_5TbQondFaBJQVsoEXR2V8r_JB2NiwCpkb33XB3KA@mail.gmail.com>
In-Reply-To: <CA+h8R2rvN_5TbQondFaBJQVsoEXR2V8r_JB2NiwCpkb33XB3KA@mail.gmail.com>
Date: Tue, 18 Oct 2022 10:03:30 +0200
Message-ID: <CADVy0FeuYOV-A7meXecLkMkQpM7mBpaF9tBeMnUFH4dukR5ypg@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D7O6n4ADTtBWsbgyWRjHi0fyReKPALISwLzYRdAYYiM=;
 b=g1jJ0m7knn2aOjlEjbJo5KGUa3At3jvKbUWwT+0NBwWXT5vI3Ick5+rJmZ758bgcIU
 4GhcS8Cli/XirRah/zFRE+o6U8idxAsiXpcZST+SAR99RqncGMjQPiIPagaBf7tNgSuG
 aj6FbYNrFrE74suwkbQhxjMW2ysUtvDkhCpOWDgkKdCg4de3K2YyA/cDR4h6FuP8WcOa
 mALoW6zxxYrDoiTUa/9+64Njwp7ksgxBDHZmqc6yDr2rbqMvibeGs7G5MTO7eZ7Ji+yq
 /U/l3pF2h+QnC/6ts/KzHm3ahPLUKskYIroUJhSgQcEatoErKYrI2STZzJuH04i5mnbu
 qjZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=g1jJ0m7k
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============7349846025538188656=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7349846025538188656==
Content-Type: multipart/alternative; boundary="000000000000cc25d005eb4a8720"

--000000000000cc25d005eb4a8720
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christian, Thomas,

I also do agree renaming the 'go' package to 'go-src' is clearer. But then
to not modify the content of `package/pkg-golang.mk` I will also need to
move the variable used by `package/pkg-golang.mk` aswell as `package/go-src=
/
go-src.mk` to `package/go/go.mk` (for instance `HOST_GO_COMMON_ENV`,
`HOST_GO_TARGET_ENV`, ...) or they will be renamed to `HOST_GO_SRC_*`.
Correct me if I'm wrong but there is no way to predict the order of
inclusion of '.mk' files, so `package/go-src/go-src.mk` might access to
undefined variable.

This is why I think a next patch should propose the same structure for
`nodejs`, `rust`, `go` using subdirectories:

package/
=E2=94=9C=E2=94=80 go/
=E2=94=82  =E2=94=9C=E2=94=80 go-src/
=E2=94=82  =E2=94=9C=E2=94=80 go-bin/
=E2=94=82  =E2=94=9C=E2=94=80 go-bootstrap/
=E2=94=82  =E2=94=9C=E2=94=80 go.mk (<---- Contain the 'global' variable us=
ed by
`pkg-golang.mk`, `go-src/go-src.mk`, `go-bin/go-bin.mk`)
=E2=94=82  =E2=94=9C=E2=94=80 Config.in

Where `package/go/go.mk` is a virtual package that include the go variants:

```
HOST_GO_TARGET_ENV =3D \
...

HOST_GO_HOST_ENV =3D \
...

$(eval $(host-virtual-package))

include $(sort $(wildcard package/go/*/*.mk))
```

This solution won't change `pkg-golang.mk` but since it introduce a new way
to handle package variant I prefer to keep it for a next patch.

PERALE Thomas


On Mon, Oct 17, 2022 at 8:51 PM Christian Stewart <christian@paral.in>
wrote:

> Hi Yann,
>
> Just to reply to that one question on why a host go compiler is useful-
>
> On Mon, Oct 17, 2022 at 11:45 AM Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> > >    - host go compiler (see patch linked below)
> >
> > If we have a pre-built host-go in the tree, thetre is then no reason to
> > be able to use the host system go compiler, is there?
>
> The host Go compiler may be compiled from source (i.e. Gentoo) and the
> user (me) wants to trust the gentoo binary for Go over downloading
> another precompiled bin from the internet.
>
> Thomas -
>
> On Mon, Oct 17, 2022 at 11:48 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >  - NodeJS (proposed by me)
> >    virtual package:             host-nodejs
> >    pre-compiled package:        host-nodejs-bin
> >    from source package:         host-nodejs-src
> >
> >    The odd thing here being that host-nodejs is a virtual package, but
> >    nodejs is a regular package building NodeJS from source for the
> >    target.
> >
> >  - Go (proposed by Thomas Perale)
> >    virtual package:             host-goc
> >    pre-compiled package:        host-go-bin
> >    from source package:         host-go
> >
> > So Thomas aligned on the naming used in the Rust world. I must say I do
> > have a preference for the naming I have chosen for NodeJS, which IMO is
> > clearer.
>
> I agree that the following would be preferable:
>
> virtual package:             host-go
> pre-compiled package:        host-go-bin
> from source package:         host-go-src
>
> ... although I would submit that all 3 could live in a single host-go
> package.
>
> Best,
> Christian Stewart
>

--000000000000cc25d005eb4a8720
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Christian, Thomas,</div><div><br></div><div>I al=
so do agree renaming the &#39;go&#39; package to &#39;go-src&#39; is cleare=
r. But then to not modify the content of `package/<a href=3D"http://pkg-gol=
ang.mk">pkg-golang.mk</a>` I will also need to move the variable used by `p=
ackage/<a href=3D"http://pkg-golang.mk">pkg-golang.mk</a>` aswell as `packa=
ge/go-src/<a href=3D"http://go-src.mk">go-src.mk</a>` to `package/go/<a hre=
f=3D"http://go.mk">go.mk</a>` (for instance `HOST_GO_COMMON_ENV`, `HOST_GO_=
TARGET_ENV`, ...) or they will be renamed to `HOST_GO_SRC_*`.<br></div><div=
>Correct me if I&#39;m wrong but there is no way to predict the order of in=
clusion of &#39;.mk&#39; files, so  `package/go-src/<a href=3D"http://go-sr=
c.mk">go-src.mk</a>` might access to undefined variable.<br><br></div><div>=
This is why I think a next patch should propose the same structure for `nod=
ejs`, `rust`, `go` using subdirectories:</div><div><pre><pre>package/
=E2=94=9C=E2=94=80 go/
=E2=94=82  =E2=94=9C=E2=94=80 go-src/
=E2=94=82  =E2=94=9C=E2=94=80 go-bin/
=E2=94=82  =E2=94=9C=E2=94=80 go-bootstrap/
=E2=94=82  =E2=94=9C=E2=94=80 <a href=3D"http://go.mk" target=3D"_blank">go=
.mk</a> (&lt;---- Contain the &#39;global&#39; variable used by `<a href=3D=
"http://pkg-golang.mk">pkg-golang.mk</a>`, `go-src/<a href=3D"http://go-src=
.mk">go-src.mk</a>`, `go-bin/<a href=3D"http://go-bin.mk">go-bin.mk</a>`)
=E2=94=82  =E2=94=9C=E2=94=80 Config.in</pre></pre></div><div>Where `packag=
e/go/<a href=3D"http://go.mk">go.mk</a>` is a virtual package that include =
the go variants:</div><div><br></div><div>```<br></div><div>HOST_GO_TARGET_=
ENV =3D \<br>...<br><br>HOST_GO_HOST_ENV =3D \<br>...<br></div><div><br>$(e=
val $(host-virtual-package))<br><br>include $(sort $(wildcard package/go/*/=
*.mk))<br>```<br><br></div><div>This solution won&#39;t change `<a href=3D"=
http://pkg-golang.mk">pkg-golang.mk</a>` but since it introduce a new way t=
o handle package variant I prefer to keep it for a next patch.<br><br></div=
><div>PERALE Thomas<br></div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 8:51 PM=
 Christian Stewart &lt;<a href=3D"mailto:christian@paral.in">christian@para=
l.in</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hi Yann,<br>
<br>
Just to reply to that one question on why a host go compiler is useful-<br>
<br>
On Mon, Oct 17, 2022 at 11:45 AM Yann E. MORIN &lt;<a href=3D"mailto:yann.m=
orin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt; wrote:=
<br>
&gt; &gt;=C2=A0 =C2=A0 - host go compiler (see patch linked below)<br>
&gt;<br>
&gt; If we have a pre-built host-go in the tree, thetre is then no reason t=
o<br>
&gt; be able to use the host system go compiler, is there?<br>
<br>
The host Go compiler may be compiled from source (i.e. Gentoo) and the<br>
user (me) wants to trust the gentoo binary for Go over downloading<br>
another precompiled bin from the internet.<br>
<br>
Thomas -<br>
<br>
On Mon, Oct 17, 2022 at 11:48 AM Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thoma=
s.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt;=C2=A0 - NodeJS (proposed by me)<br>
&gt;=C2=A0 =C2=A0 virtual package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0host-nodejs<br>
&gt;=C2=A0 =C2=A0 pre-compiled package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-nod=
ejs-bin<br>
&gt;=C2=A0 =C2=A0 from source package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hos=
t-nodejs-src<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 The odd thing here being that host-nodejs is a virtual pa=
ckage, but<br>
&gt;=C2=A0 =C2=A0 nodejs is a regular package building NodeJS from source f=
or the<br>
&gt;=C2=A0 =C2=A0 target.<br>
&gt;<br>
&gt;=C2=A0 - Go (proposed by Thomas Perale)<br>
&gt;=C2=A0 =C2=A0 virtual package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0host-goc<br>
&gt;=C2=A0 =C2=A0 pre-compiled package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-go-=
bin<br>
&gt;=C2=A0 =C2=A0 from source package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hos=
t-go<br>
&gt;<br>
&gt; So Thomas aligned on the naming used in the Rust world. I must say I d=
o<br>
&gt; have a preference for the naming I have chosen for NodeJS, which IMO i=
s<br>
&gt; clearer.<br>
<br>
I agree that the following would be preferable:<br>
<br>
virtual package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-go<br>
pre-compiled package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-go-bin<br>
from source package:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-go-src<br>
<br>
... although I would submit that all 3 could live in a single host-go packa=
ge.<br>
<br>
Best,<br>
Christian Stewart<br>
</blockquote></div>

--000000000000cc25d005eb4a8720--

--===============7349846025538188656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7349846025538188656==--
