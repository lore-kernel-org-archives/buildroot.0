Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C072C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24AAA41498;
	Sun, 24 Jul 2022 23:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24AAA41498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CU-c_zFnqdC0; Sun, 24 Jul 2022 23:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B4C740E46;
	Sun, 24 Jul 2022 23:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B4C740E46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB3A1BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4143F83E58
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4143F83E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ypX7_OFO24V for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:13:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29E083E48
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D29E083E48
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:13:15 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 75so17206494ybf.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VoF8rS9wmeHIkFKnT0+yfp+gvIXdsQGQYDPKmFtDQHA=;
 b=z8JD6r4JYa6fIC+jHhFJ5nyir9XoO89Wry0CUFXOCpHPPKzDoAe8FaIQrhjUlGOHzS
 Zb5/F/Tb85uK99B3OSDpvHEnE/AHPFYvKTsnFgcyKxSGug9OLTQp3Q7Nn3H9EIATr+oE
 MJjmDW61YggmNerKc6iKhIPoLL6cioC3YmT3w5c8OmYIZyWcD8+agA6xb9aT86sCwC2u
 RG/8cLeHWgp7MtbFiQCo6dmkzClK64rFuDYtCPC2hA2G36ioe4Sy2Us6JY5t925IVahS
 4X6njuhQH5zJxBO3Qcq4G+gqIKO01PfhKo1UWi9xe491WB1JamMs9wfSCjyXrIE3Op8T
 k2mA==
X-Gm-Message-State: AJIora/gNqxAu7dXJu+y/7Gip/I2ysqIbYdC5keZiZkyeHS04O1rzy7u
 FoDQsnTs+jW5dAnvvj62Akzv1S8dmJbS3dm3z439lg==
X-Google-Smtp-Source: AGRyM1smcogDnWjNmMnkaKRtX0mHWNIrymwphjRVBFrKSJJ6xK71yLvgAv+ZJa6hwRjlMENO4DPQdPYl+35VnR6oum4=
X-Received: by 2002:a25:cac7:0:b0:670:8d4d:7839 with SMTP id
 a190-20020a25cac7000000b006708d4d7839mr7514611ybg.169.1658704394729; Sun, 24
 Jul 2022 16:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220723215448.2532160-1-abel@x-silicon.com>
 <20220723215448.2532160-2-abel@x-silicon.com>
 <815628b4-9584-cc91-1b5a-edc1e2a01c57@smile.fr>
 <02068fad-6ee9-0809-a570-be3efa8f4aea@mind.be>
 <fa1b6f86-9fd4-75d8-bbad-52854a68f9a4@smile.fr>
In-Reply-To: <fa1b6f86-9fd4-75d8-bbad-52854a68f9a4@smile.fr>
From: Abel Bernabeu <abel@x-silicon.com>
Date: Mon, 25 Jul 2022 01:13:03 +0200
Message-ID: <CAF2ART9b3Auz47arMfdcUN13XqCiPL9ffb=pPs66VETz+of4Cg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VoF8rS9wmeHIkFKnT0+yfp+gvIXdsQGQYDPKmFtDQHA=;
 b=nEdB199F7zEa4+GZr3GZfap8JAktl+LMFz4eFRw5SGup+w3AGJaZyx+RTA5JW7fjEk
 nxuzwFnqw90BXs5b074nm2cKf31u6juavBvKwE0ljOKg7FRfzcRX/2CSti8tGZ9jZEuu
 R7RisptNPmcXqcvAlk4Ms9Qp8z6nFPzuIX6Qo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=x-silicon.com header.i=@x-silicon.com
 header.a=rsa-sha256 header.s=google header.b=nEdB199F
Subject: Re: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V
 vector extension on the architecture menu.
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: multipart/mixed; boundary="===============1320080879062367071=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1320080879062367071==
Content-Type: multipart/alternative; boundary="0000000000003c510e05e495360d"

--0000000000003c510e05e495360d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, will do as suggested (forcing GCC 12 or newer when using the
option).

On Sun, Jul 24, 2022, 11:52 AM Romain Naour <romain.naour@smile.fr> wrote:

> Le 24/07/2022 =C3=A0 11:25, Arnout Vandecappelle a =C3=A9crit :
> >
> >
> > On 24/07/2022 10:08, Romain Naour wrote:
> >> Hello Abel,
> >>
> >> Le 23/07/2022 =C3=A0 23:54, Abel Bernabeu a =C3=A9crit :
> >>> This new setting will allow to test new toolchains already available
> >>> that support the vector extension (more patches coming soon).
> >>
> >> It seems that is the same series as v1:
> >>
> >>
> http://patchwork.ozlabs.org/project/buildroot/list/?series=3D307848&state=
=3D*
> >>
> >> See 22.5.5. "Patch revision changelog" section for help.
> >>
> >> https://nightly.buildroot.org/manual.html#submitting-patches
> >>
> >>>
> >>> Signed-off-by: Abel Bernabeu <abel@x-silicon.com>
> >>> ---
> >>>   arch/Config.in.riscv | 7 +++++++
> >>>   arch/arch.mk.riscv   | 4 ++++
> >>>   2 files changed, 11 insertions(+)
> >>>
> >>> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
> >>> index 288ed833eb..e4dc936cf8 100644
> >>> --- a/arch/Config.in.riscv
> >>> +++ b/arch/Config.in.riscv
> >>> @@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD
> >>>   config BR2_RISCV_ISA_RVC
> >>>       bool
> >>>   +config BR2_RISCV_ISA_RVV
> >>> +    bool
> >>> +
> >>>   choice
> >>>       prompt "Target Architecture Variant"
> >>>       default BR2_riscv_g
> >>> @@ -63,6 +66,10 @@ config BR2_RISCV_ISA_CUSTOM_RVD
> >>>   config BR2_RISCV_ISA_CUSTOM_RVC
> >>>       bool "Compressed Instructions (C)"
> >>>       select BR2_RISCV_ISA_RVC
> >>> +
> >>> +config BR2_RISCV_ISA_CUSTOM_RVV
> >>
> >> This option must depends on gcc-12.
> >
> >  No, it's the other way round: it should force GCC 12, by selecting
> > BR2_ARCH_NEEDS_GCC_AT_LEAST_12.
>
> Indeed, Thomas commented on this yesterday [1]
>
> [1] http://lists.busybox.net/pipermail/buildroot/2022-July/646698.html
>
> Best regards,
> Romain
>
>
> >
> >  Regards,
> >  Arnout
> >
> >>
> >> Best regards,
> >> Romain
> >>
> >>> +    bool "Vector Instructions (V)"
> >>> +    select BR2_RISCV_ISA_RVV
> >>>   endif
> >>>     choice
> >>> diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
> >>> index f3bf2b3467..07a94aa6a4 100644
> >>> --- a/arch/arch.mk.riscv
> >>> +++ b/arch/arch.mk.riscv
> >>> @@ -26,5 +26,9 @@ endif
> >>>   ifeq ($(BR2_RISCV_ISA_RVC),y)
> >>>   GCC_TARGET_ARCH :=3D $(GCC_TARGET_ARCH)c
> >>>   endif
> >>> +ifeq ($(BR2_RISCV_ISA_RVV),y)
> >>> +GCC_TARGET_ARCH :=3D $(GCC_TARGET_ARCH)v
> >>> +endif
> >>> +
> >>>     endif
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--0000000000003c510e05e495360d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, will do as suggested (forcing GCC 12 or newer whe=
n using the option).</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sun, Jul 24, 2022, 11:52 AM Romain Naour &lt;<a href=
=3D"mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Le 24/07/2022 =C3=A0 11:25, Arnout Vand=
ecappelle a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On 24/07/2022 10:08, Romain Naour wrote:<br>
&gt;&gt; Hello Abel,<br>
&gt;&gt;<br>
&gt;&gt; Le 23/07/2022 =C3=A0 23:54, Abel Bernabeu a =C3=A9crit=C2=A0:<br>
&gt;&gt;&gt; This new setting will allow to test new toolchains already ava=
ilable<br>
&gt;&gt;&gt; that support the vector extension (more patches coming soon).<=
br>
&gt;&gt;<br>
&gt;&gt; It seems that is the same series as v1:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://patchwork.ozlabs.org/project/buildroot/list/?ser=
ies=3D307848&amp;state=3D*" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>http://patchwork.ozlabs.org/project/buildroot/list/?series=3D307848&amp;st=
ate=3D*</a><br>
&gt;&gt;<br>
&gt;&gt; See 22.5.5. &quot;Patch revision changelog&quot; section for help.=
<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://nightly.buildroot.org/manual.html#submitting-pa=
tches" rel=3D"noreferrer noreferrer" target=3D"_blank">https://nightly.buil=
droot.org/manual.html#submitting-patches</a><br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Abel Bernabeu &lt;<a href=3D"mailto:abel@x-sili=
con.com" target=3D"_blank" rel=3D"noreferrer">abel@x-silicon.com</a>&gt;<br=
>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =C2=A0 arch/Config.in.riscv | 7 +++++++<br>
&gt;&gt;&gt; =C2=A0 arch/arch.mk.riscv=C2=A0=C2=A0 | 4 ++++<br>
&gt;&gt;&gt; =C2=A0 2 files changed, 11 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv<br>
&gt;&gt;&gt; index 288ed833eb..e4dc936cf8 100644<br>
&gt;&gt;&gt; --- a/arch/Config.in.riscv<br>
&gt;&gt;&gt; +++ b/arch/Config.in.riscv<br>
&gt;&gt;&gt; @@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD<br>
&gt;&gt;&gt; =C2=A0 config BR2_RISCV_ISA_RVC<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool<br>
&gt;&gt;&gt; =C2=A0 +config BR2_RISCV_ISA_RVV<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; =C2=A0 choice<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prompt &quot;Target Architectur=
e Variant&quot;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default BR2_riscv_g<br>
&gt;&gt;&gt; @@ -63,6 +66,10 @@ config BR2_RISCV_ISA_CUSTOM_RVD<br>
&gt;&gt;&gt; =C2=A0 config BR2_RISCV_ISA_CUSTOM_RVC<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool &quot;Compressed Instructi=
ons (C)&quot;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select BR2_RISCV_ISA_RVC<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +config BR2_RISCV_ISA_CUSTOM_RVV<br>
&gt;&gt;<br>
&gt;&gt; This option must depends on gcc-12.<br>
&gt; <br>
&gt; =C2=A0No, it&#39;s the other way round: it should force GCC 12, by sel=
ecting<br>
&gt; BR2_ARCH_NEEDS_GCC_AT_LEAST_12.<br>
<br>
Indeed, Thomas commented on this yesterday [1]<br>
<br>
[1] <a href=3D"http://lists.busybox.net/pipermail/buildroot/2022-July/64669=
8.html" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.busybo=
x.net/pipermail/buildroot/2022-July/646698.html</a><br>
<br>
Best regards,<br>
Romain<br>
<br>
<br>
&gt; <br>
&gt; =C2=A0Regards,<br>
&gt; =C2=A0Arnout<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Romain<br>
&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool &quot;Vector Instructions (V)&quot;<b=
r>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 select BR2_RISCV_ISA_RVV<br>
&gt;&gt;&gt; =C2=A0 endif<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 choice<br>
&gt;&gt;&gt; diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv<br>
&gt;&gt;&gt; index f3bf2b3467..07a94aa6a4 100644<br>
&gt;&gt;&gt; --- a/arch/arch.mk.riscv<br>
&gt;&gt;&gt; +++ b/arch/arch.mk.riscv<br>
&gt;&gt;&gt; @@ -26,5 +26,9 @@ endif<br>
&gt;&gt;&gt; =C2=A0 ifeq ($(BR2_RISCV_ISA_RVC),y)<br>
&gt;&gt;&gt; =C2=A0 GCC_TARGET_ARCH :=3D $(GCC_TARGET_ARCH)c<br>
&gt;&gt;&gt; =C2=A0 endif<br>
&gt;&gt;&gt; +ifeq ($(BR2_RISCV_ISA_RVV),y)<br>
&gt;&gt;&gt; +GCC_TARGET_ARCH :=3D $(GCC_TARGET_ARCH)v<br>
&gt;&gt;&gt; +endif<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 endif<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=
=3D"noreferrer">buildroot@buildroot.org</a><br>
&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.or=
g/mailman/listinfo/buildroot</a><br>
<br>
</blockquote></div>

--0000000000003c510e05e495360d--

--===============1320080879062367071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1320080879062367071==--
