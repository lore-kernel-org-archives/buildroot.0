Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C81C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 20:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C37A883DE3;
	Tue, 30 Jan 2024 20:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C37A883DE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iA1oWYr5SWX; Tue, 30 Jan 2024 20:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E611483E01;
	Tue, 30 Jan 2024 20:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E611483E01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADB161BF340
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8621A83E01
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8621A83E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXFSXe7P2OCt for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 20:12:17 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DEAA83DE8
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 20:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DEAA83DE8
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33af4b34e2cso80737f8f.1
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 12:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706645535; x=1707250335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=08i07JW9BLCmhhLmMjxPDDJ2JMA5WulC15Q2qe8FZe4=;
 b=Vg2O8WH/iyvxjo4UOFfdFFjJ7G3do+aHNytAbmLMFSpkWeyog6D68GTIpje1tnWaaM
 YXHoFrUmAZNoFwZ4PF/LXhtJ11PV/UAqUq1ENDmPOBriUQdCQ1vCDvQePKRvS/+dNA2N
 eTbW8ZUu8jYCtx/Qt4LmDVbiMdkD6M+XBLWhzM9GXKhH2y+codTFSiVvsk68zsikiWnW
 JdArx4JIEej1huWHB7UBR/Vs2XnkiGZWc+K0vR0PvrLxy+PiD5AgkwrqU1MyjCJP4f4G
 t5tgIwa53ZQRvFTKfJEndKnHnKMqwboJCTs7chJsVpHia9LhyLKkWYHwO3Nh8+rJdTwJ
 wt/g==
X-Gm-Message-State: AOJu0YyCRdSMBEynGW2iX0UhryWX5SwX0OIMipj4yqWKClAaknvx4jlP
 0T9Sjf3KxOPXdowDRpQAnzzCnLeksY5dU2XIe8Tnpm18Xl1UwqAjtxtT9QSGH/jlvXvXBJmM0O5
 07csY1kZDUNS1QDdjA7NUYV+kCuaGfErRXYA=
X-Google-Smtp-Source: AGHT+IHk5NYBN8y7pc+28dcFPYx8pqQfeG3ZNSoQWydAZ+WIAR5XF7fDJZUvy0/Em3FHq+PY6MdzBx7SDv2fjdBQfOs=
X-Received: by 2002:a5d:47ca:0:b0:33a:fe3b:a048 with SMTP id
 o10-20020a5d47ca000000b0033afe3ba048mr1772643wrc.34.1706645534850; Tue, 30
 Jan 2024 12:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20240124-kernel_dir-v1-1-4125408cf65d@microchip.com>
 <f5a4aa23-fdb0-4c06-9f18-8ea0e69cbd7d@mind.be>
In-Reply-To: <f5a4aa23-fdb0-4c06-9f18-8ea0e69cbd7d@mind.be>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 30 Jan 2024 21:12:02 +0100
Message-ID: <CA+TH9VnQSgdqVs6_SQn4012LHH8jyV562e-1e+AkYa2gttF-4w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706645535; x=1707250335; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=08i07JW9BLCmhhLmMjxPDDJ2JMA5WulC15Q2qe8FZe4=;
 b=VjspiyhOSlzppaK+fMQm78HlXgfk4lNUFI3hE6MDjW3hKbGJLykYBx2+MF9nEt1W3s
 9yWF0CGqQGKpfxVqVMlWgksQCj0J1UwUhqfIwk7e75VIsrhSSw5fti5TFMsdVDVTak5R
 wstoLVqOuFbv7+fnNsjyEU40EoznexQfg5PFC9oJHPTsut3t8+BY6pRHdx7A/GbbH/Je
 qpEBAFE+RW0HGd9WHfGT6zjIsd7uqQydOTLdgO336+XrMXhveiHIQVmLqzrpnSL/fAVJ
 U+aPsAnVjyCj/KQDneiANh5R/GZJJEhWqu2gswqvQxCdA5OZ50X4GQ32wy7V1tFZ4eVA
 aU3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VjspiyhO
Subject: Re: [Buildroot] [PATCH] package/environment-setup: replace variable
 KERNELDIR with KERNEL_DIR
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3734964762999676537=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3734964762999676537==
Content-Type: multipart/alternative; boundary="000000000000dcc4eb06102f6017"

--000000000000dcc4eb06102f6017
Content-Type: text/plain; charset="UTF-8"

Il mar 30 gen 2024, 21:03 Arnout Vandecappelle via buildroot <
buildroot@buildroot.org> ha scritto:

>
>
> On 24/01/2024 06:32, Nayab Sayed via buildroot wrote:
> > This commit updates the host environment setup helper script to use the
> more
> > conventional variable name KERNEL_DIR instead of KERNELDIR.  The change
> is made
> > for consistency and to align with established conventions in the project
> (like
> > KERNEL_HOST, HOST_DIR etc.). No functional changes are introduced by this
> > commit.
>
>   Do you have some evidence of this established convention?
>
>   We currently have three external module packages that use KERNELDIR
> (falcosecurity-libs, ti-gfx and ti-sgx-km) and two that use KERNEL_DIR
> (kernel-module-imx-gpu-viv and gcnano-binaries).
>
>
>   It has been KERNELDIR in Buildroot for more than 3 years now. If we
> change it
> now, in all likelihood we will break a number of scripts that rely on that
> environment variable. So I think we need quite overwhelming evidence that
> KERNEL_DIR is better before we introduce such breakage.
>
>   Angelo, you originally introduced KERNELDIR, anything to add to this
> discussion?
>

I took it straight from the LDD3 kernel module makefile example.

Googling around, I cannot see a definitive answer, probably exporting both
could be a nice idea.


>   Regards,
>   Arnout
>
> >
> > Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> > ---
> >   package/environment-setup/environment-setup    | 2 +-
> >   package/environment-setup/environment-setup.mk | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/environment-setup/environment-setup
> b/package/environment-setup/environment-setup
> > index 84a9843c24..8504a89743 100644
> > --- a/package/environment-setup/environment-setup
> > +++ b/package/environment-setup/environment-setup
> > @@ -10,7 +10,7 @@ cat <<'EOF'
> >   Some tips:
> >   * PATH now contains the SDK utilities
> >   * Standard autotools variables (CC, LD, CFLAGS) are exported
> > -* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are
> exported
> > +* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNEL_DIR) are
> exported
> >   * To configure do "./configure $CONFIGURE_FLAGS" or use
> >     the "configure" alias
> >   * To build CMake-based projects, use the "cmake" alias
> > diff --git a/package/environment-setup/environment-setup.mk
> b/package/environment-setup/environment-setup.mk
> > index 29ec5a9a95..cc058a5799 100644
> > --- a/package/environment-setup/environment-setup.mk
> > +++ b/package/environment-setup/environment-setup.mk
> > @@ -34,7 +34,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
> >               >> $(ENVIRONMENT_SETUP_FILE)
> >
> >       $(if $(BR2_LINUX_KERNEL),\
> > -             printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
> > +             printf "export \"KERNEL_DIR=$(LINUX_BUILDDIR)\"\n" \
> >                       >> $(ENVIRONMENT_SETUP_FILE),)
> >   endef
> >
> >
> > ---
> > base-commit: 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2
> > change-id: 20240124-kernel_dir-41a48fd97b75
> >
> > Best regards,
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000dcc4eb06102f6017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 30 gen 2024, 21:03 Arnout Vandecappelle via bui=
ldroot &lt;<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.o=
rg</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 24/01/2024 06:32, Nayab Sayed via buildroot wrote:<br>
&gt; This commit updates the host environment setup helper script to use th=
e more<br>
&gt; conventional variable name KERNEL_DIR instead of KERNELDIR.=C2=A0 The =
change is made<br>
&gt; for consistency and to align with established conventions in the proje=
ct (like<br>
&gt; KERNEL_HOST, HOST_DIR etc.). No functional changes are introduced by t=
his<br>
&gt; commit.<br>
<br>
=C2=A0 Do you have some evidence of this established convention?<br>
<br>
=C2=A0 We currently have three external module packages that use KERNELDIR =
<br>
(falcosecurity-libs, ti-gfx and ti-sgx-km) and two that use KERNEL_DIR <br>
(kernel-module-imx-gpu-viv and gcnano-binaries).<br>
<br>
<br>
=C2=A0 It has been KERNELDIR in Buildroot for more than 3 years now. If we =
change it <br>
now, in all likelihood we will break a number of scripts that rely on that =
<br>
environment variable. So I think we need quite overwhelming evidence that <=
br>
KERNEL_DIR is better before we introduce such breakage.<br>
<br>
=C2=A0 Angelo, you originally introduced KERNELDIR, anything to add to this=
 discussion?<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I took it straight from the LDD3 kernel module makefile example=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Googling around, I can=
not see a definitive answer, probably exporting both could be a nice idea.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; Signed-off-by: Nayab Sayed &lt;<a href=3D"mailto:nayabbasha.sayed@micr=
ochip.com" target=3D"_blank" rel=3D"noreferrer">nayabbasha.sayed@microchip.=
com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/environment-setup/environment-setup=C2=A0 =C2=A0 |=
 2 +-<br>
&gt;=C2=A0 =C2=A0package/environment-setup/<a href=3D"http://environment-se=
tup.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">environment-setup.m=
k</a> | 2 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/environment-setup/environment-setup b/package/env=
ironment-setup/environment-setup<br>
&gt; index 84a9843c24..8504a89743 100644<br>
&gt; --- a/package/environment-setup/environment-setup<br>
&gt; +++ b/package/environment-setup/environment-setup<br>
&gt; @@ -10,7 +10,7 @@ cat &lt;&lt;&#39;EOF&#39;<br>
&gt;=C2=A0 =C2=A0Some tips:<br>
&gt;=C2=A0 =C2=A0* PATH now contains the SDK utilities<br>
&gt;=C2=A0 =C2=A0* Standard autotools variables (CC, LD, CFLAGS) are export=
ed<br>
&gt; -* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are e=
xported<br>
&gt; +* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNEL_DIR) are =
exported<br>
&gt;=C2=A0 =C2=A0* To configure do &quot;./configure $CONFIGURE_FLAGS&quot;=
 or use<br>
&gt;=C2=A0 =C2=A0 =C2=A0the &quot;configure&quot; alias<br>
&gt;=C2=A0 =C2=A0* To build CMake-based projects, use the &quot;cmake&quot;=
 alias<br>
&gt; diff --git a/package/environment-setup/<a href=3D"http://environment-s=
etup.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">environment-setup.=
mk</a> b/package/environment-setup/<a href=3D"http://environment-setup.mk" =
rel=3D"noreferrer noreferrer" target=3D"_blank">environment-setup.mk</a><br=
>
&gt; index 29ec5a9a95..cc058a5799 100644<br>
&gt; --- a/package/environment-setup/<a href=3D"http://environment-setup.mk=
" rel=3D"noreferrer noreferrer" target=3D"_blank">environment-setup.mk</a><=
br>
&gt; +++ b/package/environment-setup/<a href=3D"http://environment-setup.mk=
" rel=3D"noreferrer noreferrer" target=3D"_blank">environment-setup.mk</a><=
br>
&gt; @@ -34,7 +34,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; $(ENVIR=
ONMENT_SETUP_FILE)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_LINUX_KERNEL),\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;export \=
&quot;KERNELDIR=3D$(LINUX_BUILDDIR)\&quot;\n&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &quot;export \=
&quot;KERNEL_DIR=3D$(LINUX_BUILDDIR)\&quot;\n&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;&gt; $(ENVIRONMENT_SETUP_FILE),)<br>
&gt;=C2=A0 =C2=A0endef<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; ---<br>
&gt; base-commit: 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2<br>
&gt; change-id: 20240124-kernel_dir-41a48fd97b75<br>
&gt; <br>
&gt; Best regards,<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div></div></div>

--000000000000dcc4eb06102f6017--

--===============3734964762999676537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3734964762999676537==--
