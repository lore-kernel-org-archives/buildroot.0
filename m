Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62A7C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 11:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4827B607E0;
	Sun,  1 Jun 2025 11:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNXdZrTHt_FY; Sun,  1 Jun 2025 11:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D66860AB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D66860AB3;
	Sun,  1 Jun 2025 11:19:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC381F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 11:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A0340B4A
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 11:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNfnJ7mCtfhZ for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 11:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FB9440B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB9440B3C
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FB9440B3C
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 11:19:05 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-70e3980757bso29421447b3.1
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 04:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748776744; x=1749381544;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7PKNGwNCKLTFR5rv8zkKdC55dEv5cSex+lbPj0pQ6JM=;
 b=um27Je8pHnjR/JxhzhSV2CkNESv88rroPNYrXskjCZ0cfQ6e8ppDBGSAtjrPgpTCfv
 0ygrsC8crGAzuAxrfIzD0nir+fKnHhSiQYXHqbxa/1RnxD9Y8q8mNx0drHDChUP//Txu
 zdZh66ix9OT+3pfwBAi1KRSwoNOuw+o+H6h80vsJaEIrHGKg3L47KdCw4jb3ydiZGDW+
 E0hfArtMb2H8llJeFL2tWGMg3+0PXcL/RFLKEuGd5SIZvPc4/9Oho2i1Z9IBRDEJ19dr
 Zc+8MHoRwn46SAf31NeMMkyGAWInVE/pCwVk3Y6P486cXxWW8QC5gyjaoMqM71PlNT4X
 lXig==
X-Gm-Message-State: AOJu0Yx1e7eyzIdkk36KARG4XokywoxW3syeUyqOCR0jjtxUz/zU47bX
 GxWyLXg7KJfvwpA7ft1soVnTuh9tb5O9LRQ1zf6TjcuWDQG79Bc/iL9DsiDvo7Lz50IY92DWqU0
 4EPEnHaajYBbzItbaQI90M9cOROmpZs8=
X-Gm-Gg: ASbGncsJc0tJlWpPuXSPCCiGJhtrYLArbgXhKQV5ooIFmhurgYN0+AlNZFMmZzGwWBp
 AoIH/vB37cfKkdZxn5eVuWf0EouiRtlMl4BKToMpncPnA+x+5TymmOCYlc2Xm0QCNPSjWAfST7W
 sjz/3939ut3dxMOzkt49YvPXbTawVTC3yRHfYP8Ij7C/5CVRSR3qIuydCQI4gtdIurQQ==
X-Google-Smtp-Source: AGHT+IHZ+nEh1NonLK5T2xEZeD8urNGXjqJgPtb5kNXo++NS+w/BRrUMa3G0NumiMzL/wI3ceprlrGOVh80ZYd4tIDY=
X-Received: by 2002:a05:690c:25c3:b0:70e:25b2:8f42 with SMTP id
 00721157ae682-70f87874886mr196046447b3.18.1748776743970; Sun, 01 Jun 2025
 04:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
 <20250601101305.3198541-3-roykollensvendsen@gmail.com>
 <20250601123843.12330c4b@windsurf>
In-Reply-To: <20250601123843.12330c4b@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 1 Jun 2025 13:18:36 +0200
X-Gm-Features: AX0GCFt2pwPl4XG5PqYceFWEfB0OiXhpLxf5Q75Axa_WubocG8SsAlapJhsC-mM
Message-ID: <CA+R_dera2jsCrMjKCy3PErpb-Q22O5ZFkjgExXabcBm0Smf2XA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748776744; x=1749381544; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7PKNGwNCKLTFR5rv8zkKdC55dEv5cSex+lbPj0pQ6JM=;
 b=fmD4x/Lp9aHipbFesLnCKeO2c+CNMH8ef8IeBRRPDue+ccwGA9IwAbe32hFowZ/FrG
 TNmM/e3q6N7EmrqLbfmn1QHKSSZ6oW85IFg8TiepIZO7i4ZNg5sptOLoyO34a0OxXqf1
 G9GUgNj+/sVzug8tADH/s2B9cfNfGnKucRWPjj1/riSYVBxtNcQau0I3WhQXTIOkFs5w
 ABE5o/wE9o/jrTZXPMmuwKax4YcRJbHNv2nLSdcXIK1S+fb5q3j6nwFl4x7fdBhW3sLy
 9Wnj5SrLc8qhpfodQKukDMdvcxMciiVJ7w+xJE4OXn2jXpVn92ba5F0mXijin6pC6syR
 HdSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fmD4x/Lp
Subject: Re: [Buildroot] [PATCH v2 2/6] package/qt6/qt6tools: fix linguist
 build failure
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
Content-Type: multipart/mixed; boundary="===============9178743177618290245=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9178743177618290245==
Content-Type: multipart/alternative; boundary="0000000000009dac98063680d06f"

--0000000000009dac98063680d06f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right. There is probably little use for some of the qt6tools stuff
on both target and host.

That was the reason i rebooted the qt6tools in the original version of the
patchset.

At a point I decided to fix the existing problems, rather than removing
unneeded functionality.

But now that I'ts clear what the problems were, I agree that we can
unconditionally disable some of these options.

I'll do that now.


s=C3=B8n. 1. juni 2025 kl. 12:38 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Sun,  1 Jun 2025 12:12:56 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > Fixes:
> > -- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
> > CMake Error at
> <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
> >   Failed to find the host tool "Qt6::lconvert".  It is part of the
> >   Qt6LinguistTools package, but the package could not be found.  Make
> sure
> >   you have built and installed the host Linguist module, which will
> ensure
> >   the creation of the Qt6LinguistTools package.
> > Call Stack (most recent call first):
> >   <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83
> (qt_internal_find_tool)
> >   src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)
> >
> > The above error can be triggered by the following defconfig:
> > BR2_arm=3Dy
> > BR2_cortex_a9=3Dy
> > BR2_ARM_ENABLE_VFP=3Dy
> > BR2_TOOLCHAIN_EXTERNAL=3Dy
> > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy
> > BR2_PACKAGE_QT6=3Dy
> > BR2_PACKAGE_QT6BASE_GUI=3Dy
> > BR2_PACKAGE_QT6BASE_PNG=3Dy
> > BR2_PACKAGE_QT6BASE_WIDGETS=3Dy
> > BR2_PACKAGE_QT6TOOLS=3Dy
> >
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> Thanks for the new iteration. However is Qt Linguist really a tool that
> would be useful on the target? Isn't this a GUI tool used during
> development, so something totally useless on the target, and that we
> could disable unconditionally?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000009dac98063680d06f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You are right. There is probably little use for some =
of the qt6tools stuff on both target and host.</div><div><br></div><div>Tha=
t was the reason i rebooted the qt6tools in the original version of the pat=
chset.</div><div><br></div><div>At a point I decided to fix the existing pr=
oblems, rather than removing unneeded functionality.</div><div><br></div><d=
iv>But now that I&#39;ts clear what the problems were, I agree that we can =
unconditionally disable some of these options.</div><div><br></div><div><di=
v>I&#39;ll do that now.</div><br></div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">s=C3=B8n. 1. j=
uni 2025 kl. 12:38 skrev Thomas Petazzoni &lt;<a href=3D"mailto:thomas.peta=
zzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hello Roy,<br>
<br>
On Sun,=C2=A0 1 Jun 2025 12:12:56 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fixes:<br>
&gt; -- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)<br>
&gt; CMake Error at &lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtToolHelp=
ers.cmake:768 (message):<br>
&gt;=C2=A0 =C2=A0Failed to find the host tool &quot;Qt6::lconvert&quot;.=C2=
=A0 It is part of the<br>
&gt;=C2=A0 =C2=A0Qt6LinguistTools package, but the package could not be fou=
nd.=C2=A0 Make sure<br>
&gt;=C2=A0 =C2=A0you have built and installed the host Linguist module, whi=
ch will ensure<br>
&gt;=C2=A0 =C2=A0the creation of the Qt6LinguistTools package.<br>
&gt; Call Stack (most recent call first):<br>
&gt;=C2=A0 =C2=A0&lt;...&gt;/output/build/qt6base-6.8.1/cmake/QtToolHelpers=
.cmake:83 (qt_internal_find_tool)<br>
&gt;=C2=A0 =C2=A0src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_to=
ol)<br>
&gt; <br>
&gt; The above error can be triggered by the following defconfig:<br>
&gt; BR2_arm=3Dy<br>
&gt; BR2_cortex_a9=3Dy<br>
&gt; BR2_ARM_ENABLE_VFP=3Dy<br>
&gt; BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
&gt; BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
&gt; BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=3Dy<br>
&gt; BR2_PACKAGE_QT6=3Dy<br>
&gt; BR2_PACKAGE_QT6BASE_GUI=3Dy<br>
&gt; BR2_PACKAGE_QT6BASE_PNG=3Dy<br>
&gt; BR2_PACKAGE_QT6BASE_WIDGETS=3Dy<br>
&gt; BR2_PACKAGE_QT6TOOLS=3Dy<br>
&gt; <br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensven=
dsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
<br>
Thanks for the new iteration. However is Qt Linguist really a tool that<br>
would be useful on the target? Isn&#39;t this a GUI tool used during<br>
development, so something totally useless on the target, and that we<br>
could disable unconditionally?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000009dac98063680d06f--

--===============9178743177618290245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9178743177618290245==--
