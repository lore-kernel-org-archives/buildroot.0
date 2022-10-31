Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98175FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 18:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A4BA40868;
	Mon, 31 Oct 2022 18:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A4BA40868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnDyKCHG2yHK; Mon, 31 Oct 2022 18:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C897C405A6;
	Mon, 31 Oct 2022 18:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C897C405A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA7C1BF865
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6934A405A6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6934A405A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLXoC104_T6r for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 18:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E39A404E7
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E39A404E7
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 18:55:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so31679143ejb.13
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 11:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f7J3YPqajtKtTXHhFX1Lmg0V79mivJKltJ+jTBxJPxo=;
 b=pr1nFTENFuv6X6JLeijv0bK0FIYgd/sSLfzZ2sUFuW5nWf2H9df79hK0gHDFi43vNt
 u7HFaGCozZ6gJMeNfmhj47pUhLt1Wo5W30Sf2Bph6bs3ik2kGFz3McqxbbSQtZStQSVH
 erghP0/SCq4dkCAKHUIX2uLef4HbBRh/91dAVHUjwy1SdeqqzGALoPyH0+AjDXONzgwo
 /zIEXGEmcghYjLSKRBF8K+Vh8ICKNfB9nNL7AA+K3lzOgvTNJ3SHcNcQbBmzFxfonSOp
 CPKMd6tc7nKyfgiD4D+r49tmEukXufL7Vr03kp17ozj/HmOfkc0Pvf86W90F+JZ31nBu
 1EkA==
X-Gm-Message-State: ACrzQf1/BX9xR8cRcUWq63vADkExptzdWa4+jaFZChrjxCqGyFIx9emM
 xTxKc+JulGnqEgh+XAUh8b3bdp5LG99zSw==
X-Google-Smtp-Source: AMsMyM5gWoarGzT9HkFmrAzplHIAy277K2g8vSRCPa4e2X4LklbLNH6c8H2H/j4gWmfBsmaT2oYmxQ==
X-Received: by 2002:a17:906:ccd1:b0:7ad:e22f:3ffc with SMTP id
 ot17-20020a170906ccd100b007ade22f3ffcmr3019180ejb.85.1667242525046; 
 Mon, 31 Oct 2022 11:55:25 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 ux8-20020a170907cf8800b0078194737761sm3268656ejc.124.2022.10.31.11.55.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 11:55:24 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id a13so18841233edj.0
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 11:55:24 -0700 (PDT)
X-Received: by 2002:a05:6402:5:b0:463:39ab:c1da with SMTP id
 d5-20020a056402000500b0046339abc1damr9211652edu.166.1667242524142; Mon, 31
 Oct 2022 11:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220821053547.667311-1-christian@paral.in>
 <20221031114444.283e4776@windsurf>
In-Reply-To: <20221031114444.283e4776@windsurf>
Date: Mon, 31 Oct 2022 11:55:14 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r6AgJinTjeEG3dwLnSS-EfAg7ELYxs5Dqq6efastinRQ@mail.gmail.com>
Message-ID: <CA+h8R2r6AgJinTjeEG3dwLnSS-EfAg7ELYxs5Dqq6efastinRQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f7J3YPqajtKtTXHhFX1Lmg0V79mivJKltJ+jTBxJPxo=;
 b=dO/HGOFKO9V8KgFM/GwPy6L4t0xFGlCXdLfnA8bTjbey0/ciZd+HstDRXnqa9qUTtJ
 DeCR6XdJpKKeFeFR3DfqtSEYIQUy2ix2KroaMChXXvVeHzqz7Wn2Z0o1ZeLmps7mrhE2
 7Dc/v2WGZbARwFqVJS9g578LSIwg8W0W02YT7gryoRCvtYVz0kqCcokTCr6OAbhQmYju
 Rv5dTYbIQ0m7v4OjL+qVqF7Sy+uSIz9hj40CqrJo/dUptZSP3Xi3a7bkF369kV3FvSHF
 p/nAjcDUXQ+51K1WhmCIAv+9/3f5Ccgp7GNBt8TEmak5Wpqne/D2tVd2ZKSCUOuBYJ2J
 CVQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=dO/HGOFK
Subject: Re: [Buildroot] [PATCH v1 1/1] package/cni-plugins: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1835406364430265105=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1835406364430265105==
Content-Type: multipart/alternative; boundary="00000000000067f3e805ec592694"

--00000000000067f3e805ec592694
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, Oct 31, 2022, 3:44 AM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> > +define CNI_PLUGINS_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/cni/bin
> > +     $(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\
> > +             $(INSTALL) -D -m 0755 $(@D)/bin/$$(basename $(d)) \
> > +                     $(TARGET_DIR)/opt/cni/bin
>
> I kept it like this, but it's fairly unusual to install stuff in /opt.
> Is this the normal location for these plugins? Shouldn't they go in
> /usr/libexec/cni/, or something like that?
>

https://github.com/containerd/containerd/blob/main/script/setup/install-cni#L25

Every doc and script I've seen installs to /opt - which is why I followed
that pattern.

Best,
Christian Stewart

--00000000000067f3e805ec592694
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi=C2=A0Thomas,<br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 31, 2022, 3:44 AM Thomas Pe=
tazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzon=
i@bootlin.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +define CNI_PLUGINS_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/cni/bin<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755=
 $(@D)/bin/$$(basename $(d)) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(TARGET_DIR)/opt/cni/bin<br>
<br>
I kept it like this, but it&#39;s fairly unusual to install stuff in /opt.<=
br>
Is this the normal location for these plugins? Shouldn&#39;t they go in<br>
/usr/libexec/cni/, or something like that?<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://github.com/con=
tainerd/containerd/blob/main/script/setup/install-cni#L25">https://github.c=
om/containerd/containerd/blob/main/script/setup/install-cni#L25</a></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Every doc and script I&#39;ve s=
een installs to /opt - which is why I followed that pattern.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto">Christia=
n Stewart=C2=A0</div></div>

--00000000000067f3e805ec592694--

--===============1835406364430265105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1835406364430265105==--
