Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46818C4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0575080EC9;
	Tue, 21 Jul 2026 20:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYd2O0r_56aX; Tue, 21 Jul 2026 20:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4939180ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784666862;
	bh=3x2PO5gg47Snp84IBzpqz8u219eS08Pu3fHE0Iy/kp8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CTE4qQ3i6Q2jTPTLx+lmxkbQJ4JMMP4J2Nj3BUZISpop304q73/MkHd634171W5qF
	 95ATj2QoNN68rMltU2k3s0oStahwKRK3oFjHW61+k5iSAf+EXDdRyckUPIc7qsCH1c
	 Ww2bwmJrvXiOfX0jD4RH2BpspzjvqsEJyrlVC/3u4Dzeixg3onbr3xesxeUIuNPtO9
	 hMlL/i8i/zZ+qe/DBWBSxFNNrUKnErm4u3ULVsmzYHNiCnQ3SPJiACtohBSR+mITmn
	 ZjZILIhf7I/U8hWIDHD/ux4gqB6o0SKA8ZoNxN+rAvmezp8jxKQFUuVQ2drkgPgQ7A
	 fBQK8xZiktp7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4939180ECB;
	Tue, 21 Jul 2026 20:47:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9AAC9E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F4156089D
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 672sigQXtMse for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3EEE6089B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EEE6089B
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3EEE6089B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:47:38 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-5c2c0df0b45so242014e0c.1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 13:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784666857; cv=none;
 d=google.com; s=arc-20260327;
 b=U/gLum0fON2iZZALBGPAplD+rB/F8i9FHrzrBvYcWUXcoT60fLPrnbVtrJbNnj5+5B
 Cz6UyPMCsI2xzcuEsQUTE95rle8YGhea3NQAh9bQCiU+sa15JjVtSizZLDCbSXTfeLLu
 +i6bLXUwG7aV2dmC+eGibRqRToC2BRVrpVOMAk0osnx4ecm0ivqdVHUtMIRi+cpwtqah
 +aQFwRhPae0fkNc/FPl0C4gYEuHpk+4miXW8ibl37uwdnNg6JoF7nkMKbBc5kW0WWiqR
 EGrx3bQ1j6A9DdCq33hhDUa5GBlzn3jv+cw1bWjf/t8nPat9aS979LDmiNBRqHjZh5qZ
 Vpzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VAvHSjXC/PX6YUFW5EBEStTiGpyhMd3e+C0uRt3GuS0=;
 fh=siEEGlK4OxgQsxxDJxK74FwhxxtTUd9xjx4ss01wdDI=;
 b=KqIupjsdNec8qvjHImDIgQtAouPB2LxaxVPFpU8QKFqImXUgEtHP/9bGTgmCAuXO2R
 LD1qjqT2fu0LRRWqm2FS+QcW+n3mD4xP4/x/4/RRKelOPt7YWpT6qb9xw/Sg2xZ7WWqH
 0+/w9rPX30VUMQJZvxHxZnmRwAHqQiGo+IPz12FdvKhfzDkDaLb8mYT+pSWjRQe9WkEQ
 IQaCcmjyG+DREhdMtHWeJD0yjVfMNQ3tJ8HObvFsFIIZwTWShmgj6czD+Qz9xk9NuXFC
 CkzE9AIZc/YRsdGXgpEfYbz0hvGrFJVr+BVvlXjcXWYXu7qJkYV+4MAwY8PGo5jsKC8z
 a5aw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784666857; x=1785271657;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VAvHSjXC/PX6YUFW5EBEStTiGpyhMd3e+C0uRt3GuS0=;
 b=DGAElqnHrEAV3fB7amIDhiHnA6bIMP6sRJhkVhtA8E1oNNQYPPE2EJMpL5j2Ens9Dh
 2Y27ckkl6kmJnyZ5Z1jAjaELUA+RvUZV8/gg5StGadXZKr0m7O8o3OGdR+gGis6VifwM
 HFhpdLVnSzbG0lUqwKNCuwK/gHPsJSWmYWhGmuxRZtatQyMCbTj25iUkcaMM5n8RKbte
 /xINXMK46JvLVb+u4dMr2upAUfhplNIG4KgKDb4A16VWMEZcAXc0qNAza8Qa4mCT5YRM
 fMwmD7qjFcTaU4rMdU8i9WmjzPIdzr45KalEQdaAiqVjabE61f7VFbiatqbaZf2Frouo
 JODg==
X-Gm-Message-State: AOJu0YysO8c1f1Q5NdTc6y8k8gMCeumQWUcD1r72Yo38xd8nxUIFkKiE
 eBijM9cjAtjExLQQURZuMu5I76RdCwO8T+Yvz0sip3NCBR2EeQtk0Nl4+hzdsaVPI2QB78iYJzH
 SiKbg6VWAxfQnhb1rTAdq/0UHHzV06fb79ZXGHwBvbw==
X-Gm-Gg: AR+sD13XTYIInTUblJnyH/JM4rmug5grrQNtwOcnf6jgerhpZVEXc2sn6wjKZaaBrgg
 F645PjEVujCua9yZtjR3gK8gT54BjxkH4et4z+1py+hTBpI2irr0rdtErPugAhOyOTFGiprBpr6
 jaOoo5gggtLqPDprYphkvO8ELb34Pm6yXDihMa/KEvVNlnbseBe4JvqSPGB90F3K2cqwOJXfOTC
 CrRBsBKwM9Dnn27CiXOdtMlzIZKL1tWAic6Jw9i5xJAFGzPc9rKGg7BBoYboC4n9kqSKawEPI7c
 k5LGH91jNqlY3/7gxWA8YsHAAW0sNe8LkFxszd3d0BnMjbxJnIAKIhP9/pQH6tdx70jeua82ihM
 4dw==
X-Received: by 2002:a05:6102:1490:b0:738:5853:fe7b with SMTP id
 ada2fe7eead31-74753797b02mr6303041137.28.1784666857204; Tue, 21 Jul 2026
 13:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260720122202.3073325-1-andrea.ricchi@amarulasolutions.com>
 <677b873ff2144474ec7024f39b6496ff@free.fr>
 <CABNF3=Z2VPCDu6Od07=qNV7V=_xFSp-Jc1m294MP+AnKsNZpwg@mail.gmail.com>
 <ddab76e125902757f19b380a6cf1b3ac@free.fr>
In-Reply-To: <ddab76e125902757f19b380a6cf1b3ac@free.fr>
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Tue, 21 Jul 2026 22:47:58 +0200
X-Gm-Features: AUfX_myt1nAEbtYAPbS0TbdIUgV-E_pfW6bcdXwb2r6UfKfQijF5iUvowpfP1Do
Message-ID: <CABNF3=a7EFZxbFtCXcnE3tZP9wOOacZAj9jc1v977-eqwEkAbw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784666857; x=1785271657;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VAvHSjXC/PX6YUFW5EBEStTiGpyhMd3e+C0uRt3GuS0=;
 b=czcBXXfCDg6vWrakb7zoeH+T5y1CJ/MZRWk7i2PrUEAvW5rLF9V1ztti3DcyUv7MaT
 qglmw7v9DinoTKzDtYnurRDYOM6cJW3fG7urRAFBkuGf841FTwX+wRYhgk1aM8f8+yIt
 8gOsOkfyxdYYV4VCWptn5wP4ZdZjcr/U0qULo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=czcBXXfC
Subject: Re: [Buildroot] [PATCH v3] package/libcppconnman: add new package
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
Content-Type: multipart/mixed; boundary="===============3925231983039627365=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3925231983039627365==
Content-Type: multipart/alternative; boundary="00000000000010fff70657252295"

--00000000000010fff70657252295
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks again for the help. I have submitted the v4 of the patch, which I
verified using the command you provided.

I hope everything is correct now.

Thanks,

Andrea Ricchi
Embedded Software Engineer
M. +39 333 775 4973
andrea.ricchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com



On Tue, Jul 21, 2026 at 9:59=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrote=
:

> Hi Andrea,
>
> On 21/07/2026 09:06, Andrea Ricchi wrote:
> > Hi Julien,
> >
> > Thanks again for the review, and sorry about the pipeline issue.
> >
> > I tried running ./utils/test-pkg -a -p libcppconnman locally and got
> > bootlin-sparc-uclibc [24/32]: OK. In my .config, I have the following
> > set:
> >
> > BR2_PACKAGE_LIBCPPCONNMAN=3Dy
> > BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy
> >
> > Do you have any idea why it works on my machine but fails in the
> > GitLab pipeline? Could it be due to some specific build environment
> > configuration?
>
> The host environment should not have any impact for this kind of issue.
>
> Are you using the correct command and are you looking at
> the right config file?
>
> For enabling examples in a test-pkg run, you should use
> commands like:
>
> cat >my.config <<EOF
> BR2_PACKAGE_LIBCPPCONNMAN=3Dy
> BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy
> EOF
> utils/test-pkg -a -p libcppconnman -c my.config
>
> The generated config of a failing builds should be in:
> "~/br-test-pkg/bootlin-microblazeel-uclibc/.config"
> rather than in "./.config".
>
> > Thanks!
> >
> > Andrea Ricchi
> > Embedded Software Engineer
> > M. +39 333 775 4973
> > andrea.ricchi@amarulasolutions.com
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
> > Amarula Solutions SRL
> >  Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
> > info@amarulasolutions.com
> > www.amarulasolutions.com [2]
> >
> > On Mon, Jul 20, 2026 at 9:22=E2=80=AFPM Julien Olivain <ju.o@free.fr> w=
rote:
> >
> >> Hi Andrea,
> >>
> >> Thanks for the updated patch!
> >>
> >> On 20/07/2026 14:22, Andrea Ricchi wrote:
> >>> libcppconnman is a C++ library that provides an easy-to-use API
> >>> to communicate with ConnMan over D-Bus using GDBus.
> >>>
> >>> https://github.com/amarula/libcppconnman
> >>>
> >>> Also add myself to DEVELOPERS for this package.
> >>>
> >>> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> >>> ---
> >>> Changes v2 -> v3:
> >>> - Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_10 dependency (C++20
> >> /
> >>> <ranges>),
> >>> fixing build failures on GCC < 10 toolchains reported by the
> >>> autobuilders
> >>> - Config.in, libcppconnman.mk [1]: select and depend on readline
> >> for the
> >>> example,
> >>> fixing the missing readline library configure error when
> >> examples
> >>> are enabled
> >>>
> >>> Changes v1 -> v2:
> >>> - add missing libcppconnman entry in package/Config.in
> >>> - merge the DEVELOPERS addition into this patch
> >>>
> >>> DEVELOPERS                               |  1 +
> >>> package/Config.in                        |  1 +
> >>> package/libcppconnman/Config.in          | 28
> >> ++++++++++++++++++++++++
> >>> package/libcppconnman/libcppconnman.hash |  3 +++
> >>> package/libcppconnman/libcppconnman.mk [1]   | 25
> >> +++++++++++++++++++++
> >>> 5 files changed, 58 insertions(+)
> >>> create mode 100644 package/libcppconnman/Config.in
> >>> create mode 100644 package/libcppconnman/libcppconnman.hash
> >>> create mode 100644 package/libcppconnman/libcppconnman.mk [1]
> >>>
> >> [...]
> >>> diff --git a/package/libcppconnman/Config.in
> >>> b/package/libcppconnman/Config.in
> >>> new file mode 100644
> >>> index 0000000000..d99d711e25
> >>> --- /dev/null
> >>> +++ b/package/libcppconnman/Config.in
> >>> @@ -0,0 +1,28 @@
> >>> +config BR2_PACKAGE_LIBCPPCONNMAN
> >>> +     bool "libcppconnman"
> >>> +     depends on BR2_INSTALL_LIBSTDCPP
> >>> +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
> >>> +     depends on BR2_USE_WCHAR # libglib2
> >>> +     depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> >>> +     depends on BR2_USE_MMU # libglib2
> >>> +     select BR2_PACKAGE_LIBGLIB2
> >>> +     help
> >>> +       libcppconnman provide easy to use C++ API to communicate
> >>> +       with ConnMan via the DBus using GDBus.
> >>> +
> >>> +       https://amarula.github.io/libcppconnman/
> >>> +
> >>> +comment "libcppconnman needs a toolchain w/ C++20, wchar,
> >> threads"
> >>> +     depends on BR2_USE_MMU
> >>> +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> >>> +             !BR2_TOOLCHAIN_HAS_THREADS ||
> >> !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> >>> +
> >>> +if BR2_PACKAGE_LIBCPPCONNMAN
> >>> +
> >>> +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
> >>> +     bool "libcppconnman example"
> >>
> >> It seems there is still 2 build failures with the examples. See:
> >> https://gitlab.com/jolivain/buildroot/-/pipelines/2691451879
> >>
> >> It is likely due to a missing dependency on
> >> BR2_TOOLCHAIN_HAS_SYNC_1.
> >>
> >> Could you have a look please?
> >>
> >>> +     select BR2_PACKAGE_READLINE
> >>> +     help
> >>> +       Compile CLI example.
> >>> +
> >>> +endif
> >>
> >> Best regards,
> >>
> >> Julien.
> >
> >
> > Links:
> > ------
> > [1] http://libcppconnman.mk
> > [2] http://www.amarulasolutions.com/
>
> Best regards,
>
> Julien.
>

--00000000000010fff70657252295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<br><br>Thanks again for the help. I have submit=
ted the v4 of the patch, which I verified using the command you provided.<b=
r><br>I hope everything is correct now.<br><br>Thanks,<br><br><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&=
quot;;font-size:medium;margin-bottom:10px!important"><span style=3D"font-we=
ight:700"><span style=3D"font-size:14px">Andrea Ricchi</span></span><br><sp=
an style=3D"font-size:12px">Embedded Software Engineer<br>M. +39 333 775 49=
73<br><a href=3D"mailto:andrea.ricchi@amarulasolutions.com" target=3D"_blan=
k">andrea.ricchi@amarulasolutions.com</a></span><br><span style=3D"font-siz=
e:12px;color:rgb(241,194,50)">=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95</span><br><span style=3D"font-size:12px"><span style=3D"fon=
t-weight:700">Amarula Solutions SRL</span><br>=C2=A0Via Felice Cavallotti 2=
5D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info@amarulasolutions.com" tar=
get=3D"_blank">info@amarulasolutions.com</a><br><a href=3D"http://www.amaru=
lasolutions.com/" target=3D"_blank">www.amarulasolutions.com</a></span><br>=
</p><p></p></div></div></div><br></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21, 2026=
 at 9:59=E2=80=AFPM Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o=
@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi Andrea,<br>
<br>
On 21/07/2026 09:06, Andrea Ricchi wrote:<br>
&gt; Hi Julien,<br>
&gt; <br>
&gt; Thanks again for the review, and sorry about the pipeline issue.<br>
&gt; <br>
&gt; I tried running ./utils/test-pkg -a -p libcppconnman locally and got<b=
r>
&gt; bootlin-sparc-uclibc [24/32]: OK. In my .config, I have the following<=
br>
&gt; set:<br>
&gt; <br>
&gt; BR2_PACKAGE_LIBCPPCONNMAN=3Dy<br>
&gt; BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy<br>
&gt; <br>
&gt; Do you have any idea why it works on my machine but fails in the<br>
&gt; GitLab pipeline? Could it be due to some specific build environment<br=
>
&gt; configuration?<br>
<br>
The host environment should not have any impact for this kind of issue.<br>
<br>
Are you using the correct command and are you looking at<br>
the right config file?<br>
<br>
For enabling examples in a test-pkg run, you should use<br>
commands like:<br>
<br>
cat &gt;my.config &lt;&lt;EOF<br>
BR2_PACKAGE_LIBCPPCONNMAN=3Dy<br>
BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=3Dy<br>
EOF<br>
utils/test-pkg -a -p libcppconnman -c my.config<br>
<br>
The generated config of a failing builds should be in:<br>
&quot;~/br-test-pkg/bootlin-microblazeel-uclibc/.config&quot;<br>
rather than in &quot;./.config&quot;.<br>
<br>
&gt; Thanks!<br>
&gt; <br>
&gt; Andrea Ricchi<br>
&gt; Embedded Software Engineer<br>
&gt; M. +39 333 775 4973<br>
&gt; <a href=3D"mailto:andrea.ricchi@amarulasolutions.com" target=3D"_blank=
">andrea.ricchi@amarulasolutions.com</a><br>
&gt; =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95<br>
&gt; Amarula Solutions SRL<br>
&gt;=C2=A0 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT<br>
&gt; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@am=
arulasolutions.com</a><br>
&gt; <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" target=
=3D"_blank">www.amarulasolutions.com</a> [2]<br>
&gt; <br>
&gt; On Mon, Jul 20, 2026 at 9:22=E2=80=AFPM Julien Olivain &lt;<a href=3D"=
mailto:ju.o@free.fr" target=3D"_blank">ju.o@free.fr</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Andrea,<br>
&gt;&gt; <br>
&gt;&gt; Thanks for the updated patch!<br>
&gt;&gt; <br>
&gt;&gt; On 20/07/2026 14:22, Andrea Ricchi wrote:<br>
&gt;&gt;&gt; libcppconnman is a C++ library that provides an easy-to-use AP=
I<br>
&gt;&gt;&gt; to communicate with ConnMan over D-Bus using GDBus.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <a href=3D"https://github.com/amarula/libcppconnman" rel=3D"no=
referrer" target=3D"_blank">https://github.com/amarula/libcppconnman</a><br=
>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Also add myself to DEVELOPERS for this package.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Signed-off-by: Andrea Ricchi &lt;<a href=3D"mailto:andrea.ricc=
hi@amarulasolutions.com" target=3D"_blank">andrea.ricchi@amarulasolutions.c=
om</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; Changes v2 -&gt; v3:<br>
&gt;&gt;&gt; - Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_10 dependency (C++=
20<br>
&gt;&gt; /<br>
&gt;&gt;&gt; &lt;ranges&gt;),<br>
&gt;&gt;&gt; fixing build failures on GCC &lt; 10 toolchains reported by th=
e<br>
&gt;&gt;&gt; autobuilders<br>
&gt;&gt;&gt; - Config.in, <a href=3D"http://libcppconnman.mk" rel=3D"norefe=
rrer" target=3D"_blank">libcppconnman.mk</a> [1]: select and depend on read=
line<br>
&gt;&gt; for the<br>
&gt;&gt;&gt; example,<br>
&gt;&gt;&gt; fixing the missing readline library configure error when<br>
&gt;&gt; examples<br>
&gt;&gt;&gt; are enabled<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Changes v1 -&gt; v2:<br>
&gt;&gt;&gt; - add missing libcppconnman entry in package/Config.in<br>
&gt;&gt;&gt; - merge the DEVELOPERS addition into this patch<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt;&gt; package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;&gt; package/libcppconnman/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 28<br>
&gt;&gt; ++++++++++++++++++++++++<br>
&gt;&gt;&gt; package/libcppconnman/libcppconnman.hash |=C2=A0 3 +++<br>
&gt;&gt;&gt; package/libcppconnman/<a href=3D"http://libcppconnman.mk" rel=
=3D"noreferrer" target=3D"_blank">libcppconnman.mk</a> [1]=C2=A0 =C2=A0| 25=
<br>
&gt;&gt; +++++++++++++++++++++<br>
&gt;&gt;&gt; 5 files changed, 58 insertions(+)<br>
&gt;&gt;&gt; create mode 100644 package/libcppconnman/Config.in<br>
&gt;&gt;&gt; create mode 100644 package/libcppconnman/libcppconnman.hash<br=
>
&gt;&gt;&gt; create mode 100644 package/libcppconnman/<a href=3D"http://lib=
cppconnman.mk" rel=3D"noreferrer" target=3D"_blank">libcppconnman.mk</a> [1=
]<br>
&gt;&gt;&gt; <br>
&gt;&gt; [...]<br>
&gt;&gt;&gt; diff --git a/package/libcppconnman/Config.in<br>
&gt;&gt;&gt; b/package/libcppconnman/Config.in<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000000..d99d711e25<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/package/libcppconnman/Config.in<br>
&gt;&gt;&gt; @@ -0,0 +1,28 @@<br>
&gt;&gt;&gt; +config BR2_PACKAGE_LIBCPPCONNMAN<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;libcppconnman&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 =
# C++20<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # libglib2<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # li=
bglib2<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # libglib2<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGLIB2<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0libcppconnman provide easy to use =
C++ API to communicate<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0with ConnMan via the DBus using GD=
Bus.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://amarula.github.=
io/libcppconnman/" rel=3D"noreferrer" target=3D"_blank">https://amarula.git=
hub.io/libcppconnman/</a><br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +comment &quot;libcppconnman needs a toolchain w/ C++20, wchar=
,<br>
&gt;&gt; threads&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP || !BR2=
_USE_WCHAR || \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAI=
N_HAS_THREADS ||<br>
&gt;&gt; !BR2_TOOLCHAIN_GCC_AT_LEAST_10<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +if BR2_PACKAGE_LIBCPPCONNMAN<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;libcppconnman example&quot;<br=
>
&gt;&gt; <br>
&gt;&gt; It seems there is still 2 build failures with the examples. See:<b=
r>
&gt;&gt; <a href=3D"https://gitlab.com/jolivain/buildroot/-/pipelines/26914=
51879" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/jolivain/bui=
ldroot/-/pipelines/2691451879</a><br>
&gt;&gt; <br>
&gt;&gt; It is likely due to a missing dependency on<br>
&gt;&gt; BR2_TOOLCHAIN_HAS_SYNC_1.<br>
&gt;&gt; <br>
&gt;&gt; Could you have a look please?<br>
&gt;&gt; <br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_READLINE<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Compile CLI example.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +endif<br>
&gt;&gt; <br>
&gt;&gt; Best regards,<br>
&gt;&gt; <br>
&gt;&gt; Julien.<br>
&gt; <br>
&gt; <br>
&gt; Links:<br>
&gt; ------<br>
&gt; [1] <a href=3D"http://libcppconnman.mk" rel=3D"noreferrer" target=3D"_=
blank">http://libcppconnman.mk</a><br>
&gt; [2] <a href=3D"http://www.amarulasolutions.com/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.amarulasolutions.com/</a><br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--00000000000010fff70657252295--

--===============3925231983039627365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3925231983039627365==--
