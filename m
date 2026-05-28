Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1511BCD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 05:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC9BA84950;
	Thu, 28 May 2026 05:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TL0pV_GCEuk9; Thu, 28 May 2026 05:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A538784AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779947098;
	bh=ldAaSoNiv3uL4UKP4/F38GzxqSBsSIMGJAMMSCJZbSs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPGOXP/Eg1ExZ37a7Qi1guDmAGFTg2jTSK+CMlboGCrPyDheyajlEGMM8DWEGdiUO
	 la1gKo0qofmhJMfqAzaDPcUCK+d6cONL/8a9DTgk0ihMOvdYB00ryhpTUYdwD/Sy/L
	 yFiDQXasWqdEnA/3vFff0Ptgqf4k7KCNEPaljA35faeU2VH3Zb6wCKRHCm15oXKxo2
	 3KgXeZitur+IgvmYiwnHe5dHpDZNmavdIzbnLZR4Y916Vccz7/1SWuA/HkSAE3Gl1C
	 PFyFj7SCnl31ekqmlAVcc4WTZeY915AUqcXz2cXqOVWVr/C85Nd0nITLlVMJ6YM8nL
	 Q6WfK6BKqCG2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A538784AEA;
	Thu, 28 May 2026 05:44:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A23AA21
 for <buildroot@buildroot.org>; Thu, 28 May 2026 05:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0AF42985
 for <buildroot@buildroot.org>; Thu, 28 May 2026 05:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrSxS7dkGqAD for <buildroot@buildroot.org>;
 Thu, 28 May 2026 05:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F49942984
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F49942984
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F49942984
 for <buildroot@buildroot.org>; Thu, 28 May 2026 05:44:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-67c4aaf76ecso19449443a12.3
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779947093; cv=none;
 d=google.com; s=arc-20240605;
 b=jkk0lCPIMylX5/Bc9Toc3uPi8wE2mKIprGSpDbfOB1DDbH5dtnJBBVIPHBMGWbRiKo
 pi7Kv/0dmK6C/y+ykx0LGkmJybn+m0Sih77Ty/yHMYEXy57+x6c7av5lS7UxZL4n6yge
 c+dPaENSPGy5JJE2HMmXpGSJn+WAVG4aBOE5TyqCg1/6Lgvbc9EYlqmqfmMOlqCuOBJq
 mQxmcP9l6IrzZ0a5QiZ6DD8gJsTRxLQy/b/j0ywJlFZKoodOuodPT+rWPC6kRZ+cVdBS
 3l5gYHU9L5BkWF+qC+HnOXHAW86swHqXLf6imAX7FOXsLECZSUBFwB1hSbCDdYpJk9pG
 9s7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JJddrI0KC8V+wG2ACT0sgPEm44qLdpE/vRbNwK7jaUY=;
 fh=VEn4RhD3RIZMAZOKEZ6JykfW+kCk+ve2fQsjMwYj1VQ=;
 b=RQbCjGciXoqzY0WACpih8IjXIACApKEfskHNKzADN8vVVwYOJSQIXMBhE/yVBYRTBP
 81g6H8oKjQsIy3BX01Lx001gYwRsJcm11QOl+v2mEfVu6gy0C7NgSryv0PUwF6OTtmxC
 Pk3p3ldeoSoKNMIAnCbEPtva8gQ6y/qxPNr8zsH24vHp7OI8ZjvwrgaoA5635/4Ri9ve
 nosNFDhg/UXubQ4iCUYAXta8mn+k31xN+P1YTL51Yq0axtgkGQGIm3moXaOplPhK7+9v
 mbZnjCYVEkkTQVWDbBCOfwnN8civ1XjJGEeELrG4fUhtksSGYnJDh9RFg99GFpmA9dn4
 /5Qg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779947093; x=1780551893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJddrI0KC8V+wG2ACT0sgPEm44qLdpE/vRbNwK7jaUY=;
 b=g30S6ZM3V6Y8FZJ6epXuyxWLPPobd9Cwm6FMzWBK71Ke+xVuZP8SqoR94eIlhUxeWg
 hJ4NDA675ZS+D3GICIhJtOgaA39dumAq3ass6T9sWE73j5fiKH2X6Q/Qd8vSrRzMx3xX
 Tk4NQsTdOglHgvD19Y1eem5jb0v4OY5JXZ6UEUbYIKxhvPsp4cxJmASx5jwpaTqs5caq
 wqWh/1x3hEWA8tntoWmsc4DlmLFaUHqmMU/0HKTTQsGDpUknnbdsmJN2Nl1rkX78yeNZ
 pMTBEjGSAqLe21IGcQNEVbJcvdYYIQgEuP0UnS7jmk7IjUpo8DjDAlDx7BNI99iVocsL
 Lu4g==
X-Gm-Message-State: AOJu0YyUuUujXchL5vLdV1uvtURYUtl0aJfKibKrP58UEOcScIstyE6l
 +nWQjPKmsL49UUWIpD49TPdJWPjd4sSivJ8dIo0aqksM9iFI0o4iKtpjeY813thVe8/PXSu2QaU
 eVtYwWLIqAuOxJAvm/56fB8c2yhAEMqUVdX+P
X-Gm-Gg: Acq92OGfegg9a0QRakvrQOb53DEHYYq8/gDNqJzooWUXfA9+fUW/djTvZqF6ijvuhFD
 8dTkh/8qCbAT+BQv16qK/6rTXqTzzw2MtlrC79CJjJ+F6DGFSkYwOtip/DLOTjn9sZc7doQxIYt
 fY86+kxon7mMOzHf8/bVzA//c7VMk4iEwQR6+5xUC9gXjRLzlXx7Pxnw6P4xs733upG6U3/OW2T
 f1G7J1MY7IulxY4JX4P2DCTSEuRRSsW4o21GhGdnBT6yr+kWUDy0YjyuLX1dq3Gqr2HXPOGJMFq
 FiBjOg7HvG9aMYqCFg==
X-Received: by 2002:a05:6402:4348:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-6889c406b3cmr13128026a12.3.1779947092906; Wed, 27 May 2026
 22:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260527070041.1554793-1-chakrabortyshubham66@gmail.com>
 <87fr3dl3il.fsf@tarshish>
In-Reply-To: <87fr3dl3il.fsf@tarshish>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 28 May 2026 11:14:38 +0530
X-Gm-Features: AVHnY4KoQM3tph2TTpI9V3C_xIlJ7mdoSqrc_W5Vh3H9WyyIndxVsncULPlSins
Message-ID: <CABvxkswOV74uws-A9-yE4tStQ-GTz8=uN=U=dfL9dMzN0a--9Q@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Buildroot List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779947093; x=1780551893; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JJddrI0KC8V+wG2ACT0sgPEm44qLdpE/vRbNwK7jaUY=;
 b=JYGbzCo9ypAqDpWBsP6wp+0fDWxbUc5fXyl78lWltZCAdv7psF/UgUi8xrP+FcxKMd
 aOKqAAVDcEfiuXJG94zi6TFucbqJcUkKztMmHix68tDY822GXzI1NNRgabggghsV/vgc
 yd3HckcBbAKT9XnN0NPyBP+vRlUF0Z0CO7HtIM0mgsOwyfZ5idNq34Hyx93fyysPD1JP
 DFlWC3Pgl8yUPokt60NWQ/PK/4jgYZNVCBzV42bpCNN11nu0xsCK4S+q0WF62thGu7C9
 CPsHLkU6v21P3trLMEzlUupgkFV94c6aLOpEVN2LMKIdThuyIK1FiKttTd3C5kYVe3RQ
 b7LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JYGbzCo9
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 11.0.0
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
Content-Type: multipart/mixed; boundary="===============1323492821838415520=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1323492821838415520==
Content-Type: multipart/alternative; boundary="0000000000003117480652da3aaf"

--0000000000003117480652da3aaf
Content-Type: text/plain; charset="UTF-8"

Hi Baruch,

Thanks for pointing this out. I wasn't aware that Joseph was already
working on a similar patch for QEMU 11.0.0. I will take a look at his
version in patchwork.

Best regards,

Shubham Chakraborty


On Wed, 27 May 2026, 12:53 pm Baruch Siach, <baruch@tkos.co.il> wrote:

> Hi Shubham
>
> On Wed, May 27 2026, Shubham Chakraborty wrote:
> > Changes include:
> > - Refined architecture support conditions for better target/host
> compatibility
> > - Removed support for 32-bit ARM, i386, MIPS targets (now 64-bit only
> where applicable)
> > - Added host architecture dependencies for QEMU tools
> > - New build dependencies: host-python-setuptools and host-python-wheel
> without these
> >   the build of host fails.
> > - Added --disable-download flag to prevent runtime downloads
> > - Fixed typo: BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT to
> BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> >
> > For upstream release notes, see:
> > - https://wiki.qemu.org/ChangeLog/11.0
> >
> > Tested using:
> > - ./utils/test-pkg -p qemu -a
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
>
> Joseph has been working on a similar patch:
>
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20260513-qemu-v11-0-0-v2-1-de2e8e3c5869@anodize.com/
>
> baruch
>
> >  package/qemu/Config.in      | 6 +-----
> >  package/qemu/Config.in.host | 8 +++++++-
> >  package/qemu/qemu.hash      | 2 +-
> >  package/qemu/qemu.mk        | 7 ++++++-
> >  4 files changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> > index 0b16c8c284..4469ba6340 100644
> > --- a/package/qemu/Config.in
> > +++ b/package/qemu/Config.in
> > @@ -2,13 +2,9 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
> >       bool
> >       # Only tested on these architectures
> >       default y if BR2_aarch64
> > -     default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> > -     default y if BR2_i386
> > -     default y if BR2_mips
> > -     default y if BR2_mipsel
> >       default y if BR2_powerpc64
> >       default y if BR2_powerpc64le
> > -     default y if BR2_riscv
> > +     default y if BR2_riscv && BR2_ARCH_IS_64
> >       default y if BR2_s390x
> >       default y if BR2_x86_64
> >
> > diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> > index c7dd5876e5..c72f418668 100644
> > --- a/package/qemu/Config.in.host
> > +++ b/package/qemu/Config.in.host
> > @@ -24,12 +24,18 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> >       default y if BR2_x86_64
> >       depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
> >       depends on !BR2_powerpc_620 && !BR2_powerpc_630
> > +     depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64" || \
> > +             BR2_HOSTARCH = "powerpc64le" || BR2_HOSTARCH = "s390x" || \
> > +             BR2_HOSTARCH = "loongarch64" || BR2_HOSTARCH = "riscv64"
> >
> >  config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
> >       bool
> >       default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> >       default y if BR2_mips64
> >       default y if BR2_mips64el
> > +     depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64" || \
> > +             BR2_HOSTARCH = "powerpc64le" || BR2_HOSTARCH = "s390x" || \
> > +             BR2_HOSTARCH = "loongarch64" || BR2_HOSTARCH = "riscv64"
> >
> >  config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> >       bool
> > @@ -37,7 +43,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> >
> >  comment "host-qemu needs a host gcc >= 8"
> >       depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
> > -             BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
> > +             BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> >       depends on !BR2_HOST_GCC_AT_LEAST_8
> >
> >  config BR2_PACKAGE_HOST_QEMU
> > diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> > index f8e750225f..7c7325a6ce 100644
> > --- a/package/qemu/qemu.hash
> > +++ b/package/qemu/qemu.hash
> > @@ -1,4 +1,4 @@
> >  # Locally computed, tarball verified with GPG signature
> > -sha256
> 9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a
> qemu-10.2.0.tar.xz
> > +sha256
> c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6
> qemu-11.0.0.tar.xz
> >  sha256
> dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
> >  sha256
> 31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa
> COPYING.LIB
> > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> > index b7007e3b98..8999e33f87 100644
> > --- a/package/qemu/qemu.mk
> > +++ b/package/qemu/qemu.mk
> > @@ -6,7 +6,7 @@
> >
> >  # When updating the version, check whether the list of supported targets
> >  # needs to be updated.
> > -QEMU_VERSION = 10.2.0
> > +QEMU_VERSION = 11.0.0
> >  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
> >  QEMU_SITE = https://download.qemu.org
> >  QEMU_SELINUX_MODULES = qemu virt
> > @@ -28,6 +28,8 @@ QEMU_DEPENDENCIES = \
> >       host-pkgconf \
> >       host-python3 \
> >       host-python-distlib \
> > +     host-python-setuptools \
> > +     host-python-wheel \
> >       libglib2 \
> >       zlib
> >
> > @@ -372,6 +374,8 @@ HOST_QEMU_DEPENDENCIES = \
> >       host-pkgconf \
> >       host-python3 \
> >       host-python-distlib \
> > +     host-python-setuptools \
> > +     host-python-wheel \
> >       host-slirp \
> >       host-zlib
> >
> > @@ -528,6 +532,7 @@ define HOST_QEMU_CONFIGURE_CMDS
> >               --enable-slirp \
> >               --enable-tools \
> >               --disable-guest-agent \
> > +             --disable-download \
> >               $(HOST_QEMU_OPTS)
> >  endef
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--0000000000003117480652da3aaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Baruch,<br><br>Thanks for pointing this out. I wasn&#3=
9;t aware that Joseph was already working on a similar patch for QEMU 11.0.=
0. I will take a look at his version in patchwork.<br><br>Best regards,<br>=
<br>Shubham Chakraborty<div><br></div></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 27 May =
2026, 12:53 pm Baruch Siach, &lt;<a href=3D"mailto:baruch@tkos.co.il">baruc=
h@tkos.co.il</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Shub=
ham<br>
<br>
On Wed, May 27 2026, Shubham Chakraborty wrote:<br>
&gt; Changes include:<br>
&gt; - Refined architecture support conditions for better target/host compa=
tibility<br>
&gt; - Removed support for 32-bit ARM, i386, MIPS targets (now 64-bit only =
where applicable)<br>
&gt; - Added host architecture dependencies for QEMU tools<br>
&gt; - New build dependencies: host-python-setuptools and host-python-wheel=
 without these<br>
&gt;=C2=A0 =C2=A0the build of host fails.<br>
&gt; - Added --disable-download flag to prevent runtime downloads<br>
&gt; - Fixed typo: BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT to BR2_PACKAGE_H=
OST_QEMU_USER_ARCH_SUPPORTS<br>
&gt;<br>
&gt; For upstream release notes, see:<br>
&gt; - <a href=3D"https://wiki.qemu.org/ChangeLog/11.0" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/11.0</a><br>
&gt;<br>
&gt; Tested using:<br>
&gt; - ./utils/test-pkg -p qemu -a<br>
&gt;<br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham6=
6@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Joseph has been working on a similar patch:<br>
<br>
=C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2026=
0513-qemu-v11-0-0-v2-1-de2e8e3c5869@anodize.com/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch=
/20260513-qemu-v11-0-0-v2-1-de2e8e3c5869@anodize.com/</a><br>
<br>
baruch<br>
<br>
&gt;=C2=A0 package/qemu/Config.in=C2=A0 =C2=A0 =C2=A0 | 6 +-----<br>
&gt;=C2=A0 package/qemu/Config.in.host | 8 +++++++-<br>
&gt;=C2=A0 package/qemu/qemu.hash=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">qemu.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 ++++++-<=
br>
&gt;=C2=A0 4 files changed, 15 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/package/qemu/Config.in b/package/qemu/Config.in<br>
&gt; index 0b16c8c284..4469ba6340 100644<br>
&gt; --- a/package/qemu/Config.in<br>
&gt; +++ b/package/qemu/Config.in<br>
&gt; @@ -2,13 +2,9 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Only tested on these architectures<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_aarch64<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default y if BR2_arm &amp;&amp; !BR2_ARM_CPU_ARMV=
4 &amp;&amp; !BR2_ARM_CPU_ARMV5<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default y if BR2_i386<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default y if BR2_mips<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default y if BR2_mipsel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_powerpc64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_powerpc64le<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default y if BR2_riscv<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y if BR2_riscv &amp;&amp; BR2_ARCH_IS_64<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_s390x<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_x86_64<br>
&gt;=C2=A0 <br>
&gt; diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host=
<br>
&gt; index c7dd5876e5..c72f418668 100644<br>
&gt; --- a/package/qemu/Config.in.host<br>
&gt; +++ b/package/qemu/Config.in.host<br>
&gt; @@ -24,12 +24,18 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_x86_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_x86_steamroller &amp;&amp; !=
BR2_x86_core_avx2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_powerpc_620 &amp;&amp; !BR2_=
powerpc_630<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_HOSTARCH =3D &quot;x86_64&quot; ||=
 BR2_HOSTARCH =3D &quot;aarch64&quot; || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_HOSTARCH =3D &quo=
t;powerpc64le&quot; || BR2_HOSTARCH =3D &quot;s390x&quot; || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_HOSTARCH =3D &quo=
t;loongarch64&quot; || BR2_HOSTARCH =3D &quot;riscv64&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPP=
ORTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_mips64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y if BR2_mips64el<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_HOSTARCH =3D &quot;x86_64&quot; ||=
 BR2_HOSTARCH =3D &quot;aarch64&quot; || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_HOSTARCH =3D &quo=
t;powerpc64le&quot; || BR2_HOSTARCH =3D &quot;s390x&quot; || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_HOSTARCH =3D &quo=
t;loongarch64&quot; || BR2_HOSTARCH =3D &quot;riscv64&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt; @@ -37,7 +43,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 comment &quot;host-qemu needs a host gcc &gt;=3D 8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH=
_SUPPORTS || \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_HOST_QEMU=
_USER_ARCH_SUPPORT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_HOST_QEMU=
_USER_ARCH_SUPPORTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_HOST_GCC_AT_LEAST_8<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config BR2_PACKAGE_HOST_QEMU<br>
&gt; diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash<br>
&gt; index f8e750225f..7c7325a6ce 100644<br>
&gt; --- a/package/qemu/qemu.hash<br>
&gt; +++ b/package/qemu/qemu.hash<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 # Locally computed, tarball verified with GPG signature<br>
&gt; -sha256=C2=A0 9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d667=
2785883a=C2=A0 qemu-10.2.0.tar.xz<br>
&gt; +sha256=C2=A0 c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e493205=
2a4854d6=C2=A0 qemu-11.0.0.tar.xz<br>
&gt;=C2=A0 sha256=C2=A0 dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90=
daafa30707c28=C2=A0 COPYING<br>
&gt;=C2=A0 sha256=C2=A0 31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383=
b98a6fe3f1faa=C2=A0 COPYING.LIB<br>
&gt; diff --git a/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">qemu.mk</a> b/package/qemu/<a href=3D"http:/=
/qemu.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">qemu.mk</a><br>
&gt; index b7007e3b98..8999e33f87 100644<br>
&gt; --- a/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">qemu.mk</a><br>
&gt; +++ b/package/qemu/<a href=3D"http://qemu.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">qemu.mk</a><br>
&gt; @@ -6,7 +6,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # When updating the version, check whether the list of supported=
 targets<br>
&gt;=C2=A0 # needs to be updated.<br>
&gt; -QEMU_VERSION =3D 10.2.0<br>
&gt; +QEMU_VERSION =3D 11.0.0<br>
&gt;=C2=A0 QEMU_SOURCE =3D qemu-$(QEMU_VERSION).tar.xz<br>
&gt;=C2=A0 QEMU_SITE =3D <a href=3D"https://download.qemu.org" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://download.qemu.org</a><br>
&gt;=C2=A0 QEMU_SELINUX_MODULES =3D qemu virt<br>
&gt; @@ -28,6 +28,8 @@ QEMU_DEPENDENCIES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-distlib \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-python-setuptools \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-python-wheel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libglib2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0zlib<br>
&gt;=C2=A0 <br>
&gt; @@ -372,6 +374,8 @@ HOST_QEMU_DEPENDENCIES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-python-distlib \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-python-setuptools \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0host-python-wheel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-slirp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-zlib<br>
&gt;=C2=A0 <br>
&gt; @@ -528,6 +532,7 @@ define HOST_QEMU_CONFIGURE_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-slirp \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-tools \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-guest-=
agent \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-download \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_QEMU_OPTS=
)<br>
&gt;=C2=A0 endef<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank" rel=
=3D"noreferrer">baruch@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"h=
ttp://www.tkos.co.il" rel=3D"noreferrer noreferrer" target=3D"_blank">http:=
//www.tkos.co.il</a> -<br>
</blockquote></div>

--0000000000003117480652da3aaf--

--===============1323492821838415520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1323492821838415520==--
