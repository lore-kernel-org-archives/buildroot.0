Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9234C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 14:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368F841C5A;
	Sat, 24 Sep 2022 14:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368F841C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2qlPjPpdZAd; Sat, 24 Sep 2022 14:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C43C4419D9;
	Sat, 24 Sep 2022 14:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C43C4419D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D39CB1BF325
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC08840B24
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC08840B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_nZuiYJGgYM for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 14:54:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D79824012E
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D79824012E
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 14:54:01 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id o123so2649126vsc.3
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 07:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=EO2e+20GCFIsgTuIOYYgawnOwWU0KrmUcgGHsB/2rwc=;
 b=a0KA2x1LHmr0DkV0aC+z8HzzJtvYcdcyMoBaSx3EjE8SLhBLXH89xky+A7ynBiVVN8
 yYvg0rCa2at6bCTh7OWhuRvOVKnjXFWX8GSYedASjxjVGAjM0WpDSseAOymJ4aCiblRd
 ge5R+tzXB33OOSEqmsX4G0ayhyjU3rJgbQp+5MTZm2TwOY05jlpFI3CETSooIBKJcQvB
 Kmh52dSS+04JfST8A30hyl7MuMfcdHAcTxMbDERgWKKni/Tn/gLxRAGlo/idS24EPeYV
 70yUb3VP8+0tzJhR+dviOmDodsacEPMAzjCvjwoCwoKmmID9FQFO+kmGOWoqRkWQXIph
 H1Hw==
X-Gm-Message-State: ACrzQf2FBdSeaAF+RhF3M3vYz0wewdeYXq0iN7gGi7beQaMygLbqk7ZS
 izvBQV/N5uCQ/XqcaNeWomKnuIEmJ1aCH8c4u/E=
X-Google-Smtp-Source: AMsMyM7rqnkuH7rII2D0xeFXKwlVBpHK3W0wAcQGSD9j1MTy3eepEkEHZD+UMt/23L+XQR2rHKdLltxq07P8QmOXgKI=
X-Received: by 2002:a67:fa90:0:b0:38c:5568:a659 with SMTP id
 f16-20020a67fa90000000b0038c5568a659mr4776763vsq.63.1664031240582; Sat, 24
 Sep 2022 07:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <CABRndgxwuvAGu0ydgfuShTvQjjppoUNiBSnP6xgqSKsHjifXTw@mail.gmail.com>
 <87v8pebk2s.fsf@dell.be.48ers.dk>
 <CABRndgxFQLVvusnFHXyMuByfXhg+rR0Q2-X+osOz+V+MJaqXtQ@mail.gmail.com>
 <87r101as98.fsf@dell.be.48ers.dk>
In-Reply-To: <87r101as98.fsf@dell.be.48ers.dk>
From: Zvi Vered <veredz72@gmail.com>
Date: Sat, 24 Sep 2022 17:53:51 +0300
Message-ID: <CABRndgw8bBeQBkyhUJonHkr-QFkENmRU7BS2jQxRg+v_Nqaeyg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=EO2e+20GCFIsgTuIOYYgawnOwWU0KrmUcgGHsB/2rwc=;
 b=UHAMu0A1ITNDHc9EMilm/NxuphH5ksL8y1uWFMzgw+PsQx4QZuhkl9rgJapUpRrPKi
 WOleNBdqmenATCbHL53oCfxaIXbzzfZl+ZcDwVRfBDYkgrD/5KZTBE+w57N+Rwtk4Hj5
 pGK4PSIwz7Z3PYFpD92MfroI9bpCHC6VAGqA9l+V649QT4P9Gzomep8SIuI1cJIiK6Ue
 XFj+LMmTnb0ij/rV7CMHFWyGAeEn78iHkxpZYXdxzmluzW9SnDpcpVvaikkZkBlberF3
 BAlCcYpxpR7aymHPzdtZJ/wAj4hhTUlZLVRiPIHYq9IKNLO7ZIao1gHj59XrKTDnndCw
 9Xdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UHAMu0A1
Subject: Re: [Buildroot] buildroot 2022.02.1: apache (httpd) - libgcc_s.so.1
 must be installed for pthread_cancel to work
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
Content-Type: multipart/mixed; boundary="===============1497719088049502797=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1497719088049502797==
Content-Type: multipart/alternative; boundary="000000000000fd7c3305e96d760f"

--000000000000fd7c3305e96d760f
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

There is no real technical reason.
I thought it would be right to use gcc I got from the vendor (Xilinx)
Also, buildroot supports using external toolchain.
All gcc libs are copied (by buildroot) to /lib64.
Should I try using gcc built by buildroot ?

 Thank you,
Zvika


On Sat, Sep 24, 2022 at 3:09 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:
>
>  > Hi Peter,
>  > Thank you for your reply.
>
>  > In the following, I used buildroot-2020.02.9
>  > The contents of defconfig is:
>  >
> -------------------------------------------------------------------------------------------
>  > BR2_aarch64=y
>  > BR2_TOOLCHAIN_EXTERNAL=y
>  > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  >
> BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/xilinx/petalinux/2018.3/tools/linux-i386/aarch64-linux-gnu"
>  > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
>  > BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
>  > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
>  > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>  > BR2_TOOLCHAIN_EXTERNAL_CXX=y
>  > BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
>  > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>  > BR2_TARGET_GENERIC_ROOT_PASSWD="123456"
>  > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>  > BR2_PACKAGE_VALGRIND=y
>  > BR2_PACKAGE_TREE=y
>  > BR2_PACKAGE_MTD=y
>  > BR2_PACKAGE_APACHE=y
>  > BR2_PACKAGE_DROPBEAR=y
>  > BR2_PACKAGE_ETHTOOL=y
>  > BR2_PACKAGE_GESFTPSERVER=y
>  > BR2_PACKAGE_RPM=y
>  > BR2_PACKAGE_KMOD=y
>  > BR2_PACKAGE_UTIL_LINUX=y
>  > BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
>  >
> -----------------------------------------------------------------------------------------------------------------------------------
>
>  > If required, I can do it for any other version of buildroot.
>  > I'm using an external gcc provided by Xilinx.
>
> Ok, any specific reason for doing that? Do you see the same issue with a
> more "normal" toolchain, E.G. one built by Buildroot or the
> ARM/Bootlin/Linaro preconfigured external toolchains?
>
> --
> Bye, Peter Korsgaard
>

--000000000000fd7c3305e96d760f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div>There is no real technical=C2=
=A0reason.</div><div>I thought it would be right to use gcc I got from the =
vendor (Xilinx)=C2=A0</div><div>Also, buildroot supports using external too=
lchain.=C2=A0</div><div>All gcc libs are copied (by buildroot) to /lib64.=
=C2=A0</div><div>Should I try using gcc built by buildroot ?</div><div><br>=
</div><div>=C2=A0Thank you,</div><div>Zvika=C2=A0</div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sa=
t, Sep 24, 2022 at 3:09 PM Peter Korsgaard &lt;<a href=3D"mailto:peter@kors=
gaard.com">peter@korsgaard.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Zvi&quot; =3D=3D Z=
vi Vered &lt;<a href=3D"mailto:veredz72@gmail.com" target=3D"_blank">veredz=
72@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Hi Peter,<br>
=C2=A0&gt; Thank you for your reply.<br>
<br>
=C2=A0&gt; In the following, I used buildroot-2020.02.9<br>
=C2=A0&gt; The contents of defconfig is:<br>
=C2=A0&gt; ----------------------------------------------------------------=
---------------------------<br>
=C2=A0&gt; BR2_aarch64=3Dy<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_CUSTOM=3Dy<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_PATH=3D&quot;/opt/xilinx/petalinux/2018.3=
/tools/linux-i386/aarch64-linux-gnu&quot;<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX=3D&quot;$(ARCH)-linux-gnu&q=
uot;<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_GCC_7=3Dy<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=3Dy<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=3Dy<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_CXX=3Dy<br>
=C2=A0&gt; BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=3Dy<br>
=C2=A0&gt; BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=3Dy<br>
=C2=A0&gt; BR2_TARGET_GENERIC_ROOT_PASSWD=3D&quot;123456&quot;<br>
=C2=A0&gt; BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_VALGRIND=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_TREE=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_MTD=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_APACHE=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_DROPBEAR=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_ETHTOOL=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_GESFTPSERVER=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_RPM=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_KMOD=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_UTIL_LINUX=3Dy<br>
=C2=A0&gt; BR2_PACKAGE_UTIL_LINUX_LIBBLKID=3Dy<br>
=C2=A0&gt; ----------------------------------------------------------------=
-------------------------------------------------------------------<br>
<br>
=C2=A0&gt; If required, I can do it for any other version of buildroot.<br>
=C2=A0&gt; I&#39;m using an external gcc provided by Xilinx.<br>
<br>
Ok, any specific reason for doing that? Do you see the same issue with a<br=
>
more &quot;normal&quot; toolchain, E.G. one built by Buildroot or the<br>
ARM/Bootlin/Linaro preconfigured external toolchains?<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div>

--000000000000fd7c3305e96d760f--

--===============1497719088049502797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1497719088049502797==--
