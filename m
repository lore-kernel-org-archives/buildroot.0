Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F82C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3E960890;
	Tue, 11 Aug 2026 19:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aq3yau4LBlvG; Tue, 11 Aug 2026 19:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7410060882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475591;
	bh=W5r30vfjU/aTqBLH48T0osoQfwkl6RGWgFov4Yrw50E=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDMX5nwvqD5womi/+GSh98nqkJQdGFrP2NKzJBkudcRiqpq2/iGxq22D5AcyNC98F
	 cx1nnPvHjJxAD81mV3facfk14yeodwSQwY8dtzAnAN2hLuTbRnVvS8ZdCjMaa+fGIl
	 G5QqyO8ZAGA6w5gGihqYsHe1GYVYrrM4+/b0ji0H6qErfW7RnnNBW16PUnKFw6U0jW
	 xKVbSo28o1FFrghRSs4FoSXSyLqSmzRLtndyGdu+JomzLJ+tSsfyPXH8308Et+Ne7f
	 e4zTzG+v/+mIW6mDhKe8mceYMuGaqibTAixATOIxyYgkooAigQaROFjbkw2R7qCQYH
	 JL+Vnd/4o3nCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7410060882;
	Tue, 11 Aug 2026 19:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2DF42E0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A90414035E
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rxuzI2fWnKw for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:13:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A39594033D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A39594033D
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A39594033D
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:13:08 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-448b89f700fso117137fac.2
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 12:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786475587; cv=none;
 d=google.com; s=arc-20260327;
 b=Y75Bxu7FDfhXnHqD9zSEaJiaIVuU4X9RnEFGmVd1GPseHTVLEv0a7bMZSm4aWXuOIc
 DV+wAXsiPLL1BG97Wh3kmBQAtk0E3F7+X90Rla8TMMk65/5jlubJPNyB1pymm4pYpwwE
 lM2j5xnQHoe38GhG523w3QXzTgaDgaJQsK0xbMRjOW9EUybfzfGHPxysUXbmkrBSPnCG
 3/FbK+ZMIbVzahPMxr5jisZ+KY98kyaVo+KRMRbCs9XaPaUffOkM3o2Al8Y44QFkPTl4
 R5A2VbQqebgYoty5/grFB1K75cUd8Qbu/neGpD3/LM0PezyMpNzn56XpVaChuIujwGyk
 +rAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6eITcyYakLPWxc/g0m4T41wEod5JGcBGAZVC4Y4v+zA=;
 fh=Ux5H+2a0wiCBdSVNnz3G211mhfCcgysoHrlO8q7Qk5Q=;
 b=G9uagQjlCODLBKtWN5QbB/JofqhXXUqCz75mMsbNS92wc3H5jyr6uKKZXJHDaavEBF
 aPgPUIzf9Z4ikz//YdqiqjeB/ULzhwJF61zcUQiasKL/2V8D63DSfQpPyVhA+ZSolVta
 WVDSe64+Ilzji8emqnWLYLduVjcWQTPLy3q15o5O8XC96PmTdlyhn1FfpIOow4UGkap7
 Vf/oPH0sPJIXz2vuV3r/alPhXCYVWjmxXrwWEyzEKdzFze+zdCTfpouRkkkCrbY47mHF
 rKXL7ezwLmaqHD9pPDXLDXo7ICcwZzrRiE5p9OEw12dVqphYMsK6znYJn0/SofPMgql7
 BVvg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786475587; x=1787080387;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6eITcyYakLPWxc/g0m4T41wEod5JGcBGAZVC4Y4v+zA=;
 b=ozwBjuS88RSeHOGRdsMurSudfZOAQuGf1ASmKqetOipULpn4dZBSeLl0cw+ZkKkH1r
 Tnqtc1vXbTTgMQaTbLH8Z4SSCyi2D5J/pFJw6wNNvQlX6mrFtQElzw9N4R1fJexc8nqb
 XIQBKrXzhdwZlwMvBgQlcFRI3ZwaxgyDqpfyYLEz8Uj12r4e+wLfIlAIKYtnCHR8/hh9
 fWYFCNZSQP4hVaUMDP5J2JyBLbd2sz/6fm9FW/K/LUMB2pVZq3J/CG9CL9BC4jzOEy/d
 ebR+A96dxs7hMuSfEjauQsHdkLmeUZ/fzWmH7qIURU7191sriUFCT7EpzgINclwAwtuw
 xR1w==
X-Gm-Message-State: AOJu0Yzge2Auc4caTfkT3AummN2XgvkjKglWZLRdfXaiwGOGnK+DkoK+
 7C9gKcJMfqN0oMARI4I/oJKVvkzByvgGptx7G3sfaSMTgZPfHOJmZ2g5scFVJMCvLbAMQia4oMO
 DtEc9ZNo2RZhnlml3ap3o4vegLGsNxAM=
X-Gm-Gg: AR+sD10aQjWynyqjQLPPM+UTxa0Gu5ePM7Ud2k0xEZeqmaSUxIhVMPyEwlTQjglxik4
 5zH4sj41r5YuJ5Eq1iWvVvma8Ql2kZLKQHTREwCPUZ6U2VQOwKzVaTNIGzmm0AgK03SbCQCHAct
 skrMb4ImmUgHl2YBL6ZI6p8zmEl9TF/Wo9W/iIsVrF8xlJzGts+G9hr/CgHtaukkPGCe1c8f47i
 6cTM+BeVqqQVwmaJTj6kJE07w3Vr5Y2s1BsJ6fRBSJ4nYaSbI6xwtr99/IpI7Up6GFJrlUDifuO
 6Eo55MS7h4XHbwaZIK5doJhprv34bSoIgexwoZJZeUmO
X-Received: by 2002:a05:6870:c22d:b0:448:888d:225e with SMTP id
 586e51a60fabf-45e215943cfmr4048738fac.9.1786475582746; Tue, 11 Aug 2026
 12:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260803140815.617446-1-aford173@gmail.com>
 <CAAHg4ZjzukzO4RMSkgjkzORsV5zS05mjq-En03ny8mpxUbsgeQ@mail.gmail.com>
In-Reply-To: <CAAHg4ZjzukzO4RMSkgjkzORsV5zS05mjq-En03ny8mpxUbsgeQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 11 Aug 2026 14:12:51 -0500
X-Gm-Features: AUfX_mzPbG7o51XTSESNVBwuMCmI2qvJI6ApWHYuH2fRN5WqHEyAjMrIhGYpd0k
Message-ID: <CAHCN7xJjR7tsaFBNGkxkk2orOC5srBuXW0S5mL4rdVSY+BY-HQ@mail.gmail.com>
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786475587; x=1787080387; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6eITcyYakLPWxc/g0m4T41wEod5JGcBGAZVC4Y4v+zA=;
 b=QU4rr+cntvddipJrtepv8P5HmtLeCWAr6b5gHGtPR2RvIOJWIL+pfdYU5djUqnk0Wo
 0ANfNM6u5KWp/mF7rsLUj4CMtP0SM9pFJe2ApBXMaTOmW/jY6mUMSlojmaMLWGi+yJit
 SWYdik6OQf4FHRXEYy0DBk8mWSFhJ+P0qKSMBjTyQABAdB/DYgU226M+uSbZ+qj7mI9j
 dOJ3c3g9kj+bjVWQS1QkuDWMDcDhDz69R3FxzKuhdHIfKrZJvGxWpgC2d5+rwZ014sGV
 jnxRnQGtCPpqZT3hSKGbXGBjzLaxfK6itvbYjpNeJn0w6uVci2Y6DzrXagupps/JyHzU
 B1BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QU4rr+cn
Subject: Re: [Buildroot] [PATCH V2] package/x11r7/xwayland: fix glamor DRI
 ordering dependency on mesa3d
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
Content-Type: multipart/mixed; boundary="===============0547226488647796310=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0547226488647796310==
Content-Type: multipart/alternative; boundary="00000000000082755f0658ca426d"

--00000000000082755f0658ca426d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 12:44=E2=80=AFPM John Ernberg <j@j-ernberg.se> wrote=
:

> Hi Adam,
>
> Apologies for the delay.
>
> On Mon, Aug 3, 2026 at 4:08=E2=80=AFPM Adam Ford <aford173@gmail.com> wro=
te:
> >
> > Xwayland's glamor support enables a DRI configure check that looks for
> > Mesa's dri.pc in staging. Without an explicit ordering dependency, a
> > highly parallel build can run Xwayland's configure before mesa3d is
> > installed, failing with:
> >
> >     ERROR: Dependency "dri" not found
> >
> > Since mesa3d is what provides the DRI/EGL/GBM bits glamor relies on, fo=
ld
> > it into the glamor condition: only enable -Dglamor=3Dtrue and add it to=
 the
> > dependencies alongside libepoxy.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/package/x11r7/xwayland/xwayland.mk
> b/package/x11r7/xwayland/xwayland.mk
> > index 02a21b96c1..3bd87a4552 100644
> > --- a/package/x11r7/xwayland/xwayland.mk
> > +++ b/package/x11r7/xwayland/xwayland.mk
> > @@ -32,7 +32,7 @@ XWAYLAND_CONF_OPTS =3D \
> >
> >  ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
> >  XWAYLAND_CONF_OPTS +=3D -Dglamor=3Dtrue
> > -XWAYLAND_DEPENDENCIES +=3D libepoxy
> > +XWAYLAND_DEPENDENCIES +=3D libepoxy mesa3d
> >  else
> >  XWAYLAND_CONF_OPTS +=3D -Dglamor=3Dfalse
> >  endif
> > --
> > 2.53.0
> >
>
> dri is needed by glx, not glamor, when checking the code. Did you test
> build this?
>
> (it's easier to reproduce with a per-package build where this becomes
> a persistent failure rather than random)
>

I test-built this with per-package enabled, and it worked, but I only have
Mesa providing libgl as in my build scenario, I am using either Intel or
AMDGPU.


>
> It should go to the LIBGL check rather than the LIB*E*GL check. But as
> I mentioned on v1, you probably need to check how this works when
> nvidia-driver is the LIBGL provider.


I'll dig a bit further into this.

adam

>
> Best regards // John Ernberg
>

--00000000000082755f0658ca426d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 9, =
2026 at 12:44=E2=80=AFPM John Ernberg &lt;<a href=3D"mailto:j@j-ernberg.se"=
>j@j-ernberg.se</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Adam,<br>
<br>
Apologies for the delay.<br>
<br>
On Mon, Aug 3, 2026 at 4:08=E2=80=AFPM Adam Ford &lt;<a href=3D"mailto:afor=
d173@gmail.com" target=3D"_blank">aford173@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Xwayland&#39;s glamor support enables a DRI configure check that looks=
 for<br>
&gt; Mesa&#39;s dri.pc in staging. Without an explicit ordering dependency,=
 a<br>
&gt; highly parallel build can run Xwayland&#39;s configure before mesa3d i=
s<br>
&gt; installed, failing with:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Dependency &quot;dri&quot; not found<br>
&gt;<br>
&gt; Since mesa3d is what provides the DRI/EGL/GBM bits glamor relies on, f=
old<br>
&gt; it into the glamor condition: only enable -Dglamor=3Dtrue and add it t=
o the<br>
&gt; dependencies alongside libepoxy.<br>
&gt;<br>
&gt; Signed-off-by: Adam Ford &lt;<a href=3D"mailto:aford173@gmail.com" tar=
get=3D"_blank">aford173@gmail.com</a>&gt;<br>
&gt;<br>
&gt; diff --git a/package/x11r7/xwayland/<a href=3D"http://xwayland.mk" rel=
=3D"noreferrer" target=3D"_blank">xwayland.mk</a> b/package/x11r7/xwayland/=
<a href=3D"http://xwayland.mk" rel=3D"noreferrer" target=3D"_blank">xwaylan=
d.mk</a><br>
&gt; index 02a21b96c1..3bd87a4552 100644<br>
&gt; --- a/package/x11r7/xwayland/<a href=3D"http://xwayland.mk" rel=3D"nor=
eferrer" target=3D"_blank">xwayland.mk</a><br>
&gt; +++ b/package/x11r7/xwayland/<a href=3D"http://xwayland.mk" rel=3D"nor=
eferrer" target=3D"_blank">xwayland.mk</a><br>
&gt; @@ -32,7 +32,7 @@ XWAYLAND_CONF_OPTS =3D \<br>
&gt;<br>
&gt;=C2=A0 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)<br>
&gt;=C2=A0 XWAYLAND_CONF_OPTS +=3D -Dglamor=3Dtrue<br>
&gt; -XWAYLAND_DEPENDENCIES +=3D libepoxy<br>
&gt; +XWAYLAND_DEPENDENCIES +=3D libepoxy mesa3d<br>
&gt;=C2=A0 else<br>
&gt;=C2=A0 XWAYLAND_CONF_OPTS +=3D -Dglamor=3Dfalse<br>
&gt;=C2=A0 endif<br>
&gt; --<br>
&gt; 2.53.0<br>
&gt;<br>
<br>
dri is needed by glx, not glamor, when checking the code. Did you test<br>
build this?<br>
<br>
(it&#39;s easier to reproduce with a per-package build where this becomes<b=
r>
a persistent failure rather than random)<br></blockquote><div><br></div><di=
v>I test-built this with per-package enabled, and it worked, but I only hav=
e Mesa providing libgl as in my build scenario, I am using either Intel or =
AMDGPU.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
It should go to the LIBGL check rather than the LIB*E*GL check. But as<br>
I mentioned on v1, you probably need to check how this works when<br>
nvidia-driver is the LIBGL provider.<span style=3D"background-color:transpa=
rent">=C2=A0</span></blockquote><div><br></div><div>I&#39;ll dig a bit furt=
her into this.</div><div><br></div><div>adam=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Best regards // John Ernberg<br>
</blockquote></div></div>

--00000000000082755f0658ca426d--

--===============0547226488647796310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0547226488647796310==--
