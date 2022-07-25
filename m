Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C821C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 09:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04904611EA;
	Mon, 25 Jul 2022 09:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04904611EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYtkXJPEPdd5; Mon, 25 Jul 2022 09:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D3861171;
	Mon, 25 Jul 2022 09:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D3861171
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5771B1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31D7B846A4
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D7B846A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3DYLKpLW1VZ for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 09:25:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 847FA83EB0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 847FA83EB0
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:25:59 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ss3so19356283ejc.11
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 02:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1YXG/haMODqx7nNE4RFz6kchToSNMRqjqAT8sbmbbA=;
 b=MKk1nyTesVrduZltaqrLI+hxemLxyIlSpPsaY0itSPLhKtC3ehHpamqvhfe0EFkvO4
 AZiDU9iZBLeJTA+upAU0fRt8Ws2ht5dYgDX9nWRvkCi3g7b0wTW0R3Mo6n1OgY/3/tJS
 wCL0aN1SBVZqwBvvW3zLXfRqMLjIlpcXCWbpm7CQLjiZfIbk13MZsSWoTnZd0BIDgqNl
 ixnZOw4s/wYFquXFLi71qRAsehUwjiWWCkbOPMGn15nY0IfTlVx0YtErLDQuOKMmTOwE
 Rs/H89qTpy2Vx/64nirKRvmHZ89trNemlX+mc+ME7bM+QFILPk5I2pDI8HFvC2l38nq1
 m2ZA==
X-Gm-Message-State: AJIora+c7FN859NUI4ZMYMsYcW1noRfytiyo8mBQOzZin1x2mKNazEca
 AO8juqoHhNxtO6Dw5JhPayQQflRxFYWbzTW9wfN2Uw==
X-Google-Smtp-Source: AGRyM1soq9URWz+gJ4j97q8iZYAQSyOSSlFrP4srLJrWt4ByBWyrvw/5xfdSBufwBsvugdW3oqAlTjc4TVijdiA3mRY=
X-Received: by 2002:a17:906:4785:b0:72e:dd6c:1ba1 with SMTP id
 cw5-20020a170906478500b0072edd6c1ba1mr9425203ejc.712.1658741157681; Mon, 25
 Jul 2022 02:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220519082800.926607-1-nicolas.tran@smile.fr>
 <20220725083638.6f14624a@windsurf>
In-Reply-To: <20220725083638.6f14624a@windsurf>
From: Nicolas TRAN <nicolas.tran@smile.fr>
Date: Mon, 25 Jul 2022 11:25:41 +0200
Message-ID: <CAJdGGv40d08cNqXkLMPKZGaLf=q43OFGCdQtEBfAiy3RhUrOeQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=i1YXG/haMODqx7nNE4RFz6kchToSNMRqjqAT8sbmbbA=;
 b=SSO6vSw/uoZJo7q4BLyJQAqoIKvXVwFAiA8PfBOEGqKUqvxjX2d6+BdblZhFrg11K3
 NWtzpHEuy0z8XCcZ7yVMyRjkt9z6Li+kVgfipRmjFa0ek0nFWAZQb7QdguYD9SNgJyXI
 Cgg2XMdDUNX04jyu8qa580PbVronD/5HGftI6wh7UOWxywfAPnsvn9KoPqHSZG0T3pV8
 C9nQM0BHThoR6diCj4xEx4B8SGGGlVVnawfphm3DRi/G8BMKsoS7YYYuEC+6ut4mYONK
 zz5yv73uLahbv+uER7K+dg6J3B/CIWY7VxgQxLdGmr7IZghJD8ApFtJXr5/oWmPtcPo8
 f9Uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=SSO6vSw/
Subject: Re: [Buildroot] [PATCH 1/1] package/hyperfine: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9062625475677958263=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9062625475677958263==
Content-Type: multipart/alternative; boundary="0000000000007a78e105e49dc57c"

--0000000000007a78e105e49dc57c
Content-Type: text/plain; charset="UTF-8"

Hello Thomas!
It's my mistake. I changed the alignment of the 'help' section one last
time before submitting the patch and forgot to re-run the check. Sorry
about that, and thank you very much!

Cordially yours,
Nicolas Tran

On Mon, Jul 25, 2022 at 8:36 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Thu, 19 May 2022 10:28:00 +0200
> Nicolas Tran <nicolas.tran@smile.fr> wrote:
>
> > hyperfine is a benchmark tool written in Rust. It evaluates
> > execution time of a command passed in arguments and make
> > a relative comparison if multiple arguments are used at the
> > same time.
> > It can be convinient for purposes of Rust-written systems as
> > it runs in a stable version of Rust.
> >
> > The package has been checked with correct formatting and
> > without typos:
> > ./utils/check-package package/hyperfine/*
> >
> > A CI test was run on gitlab.com to verify toolchain compatibilities.
> >
> > Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
> > ---
> > test-pkg config:
> > BR2_PACKAGE_HYPERFINE=y
> > ---
> >  package/Config.in                |  1 +
> >  package/hyperfine/Config.in      | 11 +++++++++++
> >  package/hyperfine/hyperfine.hash |  4 ++++
> >  package/hyperfine/hyperfine.mk   | 12 ++++++++++++
> >  4 files changed, 28 insertions(+)
> >  create mode 100644 package/hyperfine/Config.in
> >  create mode 100644 package/hyperfine/hyperfine.hash
> >  create mode 100644 package/hyperfine/hyperfine.mk
>
> Thanks a lot, I've applied your patch, after fixing two minor issues:
>
>  - An entry in the DEVELOPERS file was missing, so I've added it
>
>  - There were some trailing white space in Config.in, which were
>    reported by check-package, so I was surprised to read in your commit
>    log that you had no check-package warning. Anyway, I fixed this up
>    as well.
>
> Thanks for your contribution!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000007a78e105e49dc57c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas!</div><div>It&#39;s my mistake. I change=
d the alignment of the &#39;help&#39; section one last time before submitti=
ng the patch and forgot to re-run the check. Sorry about that, and thank yo=
u very much!</div><div><br></div><div>Cordially yours,</div><div>Nicolas Tr=
an<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Jul 25, 2022 at 8:36 AM Thomas Petazzoni &lt;<a href=3D=
"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br=
>
<br>
On Thu, 19 May 2022 10:28:00 +0200<br>
Nicolas Tran &lt;<a href=3D"mailto:nicolas.tran@smile.fr" target=3D"_blank"=
>nicolas.tran@smile.fr</a>&gt; wrote:<br>
<br>
&gt; hyperfine is a benchmark tool written in Rust. It evaluates<br>
&gt; execution time of a command passed in arguments and make<br>
&gt; a relative comparison if multiple arguments are used at the<br>
&gt; same time.<br>
&gt; It can be convinient for purposes of Rust-written systems as<br>
&gt; it runs in a stable version of Rust.<br>
&gt; <br>
&gt; The package has been checked with correct formatting and<br>
&gt; without typos:<br>
&gt; ./utils/check-package package/hyperfine/*<br>
&gt; <br>
&gt; A CI test was run on <a href=3D"http://gitlab.com" rel=3D"noreferrer" =
target=3D"_blank">gitlab.com</a> to verify toolchain compatibilities.<br>
&gt; <br>
&gt; Signed-off-by: Nicolas Tran &lt;<a href=3D"mailto:nicolas.tran@smile.f=
r" target=3D"_blank">nicolas.tran@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; test-pkg config:<br>
&gt; BR2_PACKAGE_HYPERFINE=3Dy<br>
&gt; ---<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/hyperfine/Config.in=C2=A0 =C2=A0 =C2=A0 | 11 +++++++++++=
<br>
&gt;=C2=A0 package/hyperfine/hyperfine.hash |=C2=A0 4 ++++<br>
&gt;=C2=A0 package/hyperfine/<a href=3D"http://hyperfine.mk" rel=3D"norefer=
rer" target=3D"_blank">hyperfine.mk</a>=C2=A0 =C2=A0| 12 ++++++++++++<br>
&gt;=C2=A0 4 files changed, 28 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/hyperfine/Config.in<br>
&gt;=C2=A0 create mode 100644 package/hyperfine/hyperfine.hash<br>
&gt;=C2=A0 create mode 100644 package/hyperfine/<a href=3D"http://hyperfine=
.mk" rel=3D"noreferrer" target=3D"_blank">hyperfine.mk</a><br>
<br>
Thanks a lot, I&#39;ve applied your patch, after fixing two minor issues:<b=
r>
<br>
=C2=A0- An entry in the DEVELOPERS file was missing, so I&#39;ve added it<b=
r>
<br>
=C2=A0- There were some trailing white space in Config.in, which were<br>
=C2=A0 =C2=A0reported by check-package, so I was surprised to read in your =
commit<br>
=C2=A0 =C2=A0log that you had no check-package warning. Anyway, I fixed thi=
s up<br>
=C2=A0 =C2=A0as well.<br>
<br>
Thanks for your contribution!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000007a78e105e49dc57c--

--===============9062625475677958263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9062625475677958263==--
