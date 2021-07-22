Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3028C63797
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 17:36:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C04361249
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 17:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C04361249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085A2405AD;
	Thu, 22 Jul 2021 17:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xF4qulCEHWqw; Thu, 22 Jul 2021 17:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9952405B2;
	Thu, 22 Jul 2021 17:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C72C1BF31E
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 17:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ACC183478
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 17:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nklabs-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXehxFzDXVqz for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 17:36:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C948183459
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 17:36:24 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id l5so7270208iok.7
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LaPRnVefPfMm4GtyE3fBov4vW1/klf0RwZr/duxmXmU=;
 b=T7eWqGlMNn1MqIxT7b5VQjA1vGSvzfJQ3af2HQrTsUhJJZnqlKNSLUOL4INXRZ2ygy
 wxGOwHxEk9lEg9ivZGBP//kOv2jUozHo0SjEa1S2tqxLXwbAaqeBuaemOJnhh0o77n3n
 ZYRKO3+r4phEzL6iof6CrbcNiYfhEnOt1Hz5N25B57QrjlcBepfX1edKOZN3GeeeMN0o
 l2me3/RwapqttEhddgtrSmuMkMyR2wcQa0T8uzQmzjxEIudnYHkYAtU11smq4nMJc1Oi
 qHJcGrNzKAB+BXduD7csj8nBnn2XhHON7zdoTBsI7T0LF0ZcRuut0M+IDa21fOxuxcqG
 E+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LaPRnVefPfMm4GtyE3fBov4vW1/klf0RwZr/duxmXmU=;
 b=exzOmSxngB5shHC7Vw6xTjIG7qwPAMxtyh1vMiOhFnTmZpoEkmkrW0ebSzKf7avmwb
 cJMUflQeO0xr5CsqTdppF2khWzP/qeVH4m1PNyngzl4ceKfqNnnxXhZ/bPjTiOU6hJYQ
 2lBEjzxmVjj5ErSXRCUgyItjjDs+CGZvVy9SDVsgAAPXfBnvvsjUUh2eZMpmrCSEzuZ8
 iK9k71M2foLxGBocASUNugTORhTUGdE+RBpNWNbPdTFGF5LJl2Pxecrw2XCKc7m0vQsO
 fYO7NMmtA2wREvx3BKRmhMBD4QP/Sw/5CpU/HUuQowC4P9fvoowd+CBG6x+mThCohLSL
 KvDw==
X-Gm-Message-State: AOAM533R6VQgiNuaB7Z0WiIs+lPFjnOTI62mElgn2CzKOfFTpY0CTrbe
 8g71FcxX4tcRrGk5DRaBp2jFuojFQajiw1biOE7gPnA6YirUtw==
X-Google-Smtp-Source: ABdhPJxCyFdo373OcQBbiwDsvWGD2l7WRVHGnoCI08sNuh52O3L/yLExxQK7nIzmatOX9Gr0UwnWVUmPvr2WnIk5ltI=
X-Received: by 2002:a02:85a5:: with SMTP id d34mr573297jai.132.1626975382510; 
 Thu, 22 Jul 2021 10:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
In-Reply-To: <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Thu, 22 Jul 2021 13:36:11 -0400
Message-ID: <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] Question about pkg-config pc files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============7430968960114231614=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7430968960114231614==
Content-Type: multipart/alternative; boundary="000000000000bbb7a205c7b9b98a"

--000000000000bbb7a205c7b9b98a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

The saga continues.  I found that multimedia is not added
because BR2_PACKAGE_QT5_GL_AVAILABLE is not set.  In order to configure QT
OpenGL, I enabled ti-gfx since our board is a beaglebone-x15.  Now I can't
get past building ti-gfx.  I have a local source directory for the kernel,
since we had to add our own drivers for some proprietary devices on the
design based on beaglebone X15.  I also use the local source directory to
generate linux-headers.  We based the kernel from TI's SDK.  I checked the
kernel config, fbdev omap is selected.  But I get the following error:

 CC [M]
 /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/=
output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/common/pvrsrv.o
  CC [M]
 /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/=
output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/common/handle.o
/home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/o=
utput/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_li=
nux/omaplfb_linux.c:133:10:
fatal error: omapfb/omapfb.h: No such file or directory
  133 | #include <omapfb/omapfb.h>
      |          ^~~~~~~~~~~~~~~~~


The file "omapfb.h" is in drivers/video/fbdev/omap2/omapfb, but for some
reason the ti-gfx package does not find it.  We are using
buildroot-2020-20.02.12.

I did not see this error in the buildroot issues, I am wondering why it is
causing problems.  My only guess is that it may have something to do with
the fact that I have a local kernel source directory.

Thanks for any help!


Sent from my iPhone

On Jul 21, 2021, at 3:07 PM, Patricia Holden <pholden@nklabs.com> wrote:

=EF=BB=BF
I looked into QQmlApplication examples, they all use pc files.

I'm attaching the files that are doing the import of pkg-config pc files.
This is the customer's implementation.

The attached URL provides examples that use the same implementation.  Note
all their examples use the "import" statement at top, this is what is
looking for pc files:

https://doc.qt.io/qt-5/qtmultimedia-multimedia-video-qmlvideo-example.html

On Wed, Jul 21, 2021 at 3:41 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Wed, 21 Jul 2021 02:23:55 -0400
> Patricia Holden <pholden@nklabs.com> wrote:
>
> > Yes, QQmlApplucation I am porting for a client it is using pc at
> > runtime.  Would it help to see what they are doing?
>
> Ah, it is your customer-specific application that is using the .pc
> files, not QT itself ?
>
> If it's your customer-specific application, then it would be useful to
> check why they are doing this, as it feels odd.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Patricia A. Holden
<main.cpp>
<main.qml>

--000000000000bbb7a205c7b9b98a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi Thomas,<div><br></div><div>The saga c=
ontinues.=C2=A0 I found that multimedia is not added because=C2=A0BR2_PACKA=
GE_QT5_GL_AVAILABLE is not set.=C2=A0 In order to configure QT OpenGL, I en=
abled ti-gfx since our board is a beaglebone-x15.=C2=A0 Now I can&#39;t get=
 past building ti-gfx.=C2=A0 I have a local source directory for the kernel=
, since we had to add our own drivers for some proprietary devices on the d=
esign based on beaglebone X15.=C2=A0 I also use the local source directory =
to generate linux-headers.=C2=A0 We based the kernel from TI&#39;s SDK.=C2=
=A0 I checked the kernel config, fbdev omap is selected.=C2=A0 But I get th=
e following error:</div><div><br></div><div>=C2=A0CC [M] =C2=A0/home/patric=
aholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/=
ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/common/pvrsrv.o<br>=C2=A0 CC=
 [M] =C2=A0/home/patricaholden/williamson/build07062021/Pro3-Linux/buildroo=
t-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/commo=
n/handle.o<br>/home/patricaholden/williamson/build07062021/Pro3-Linux/build=
root-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/3rdparty=
/dc_omapfb3_linux/omaplfb_linux.c:133:10: fatal error: omapfb/omapfb.h: No =
such file or directory<br>=C2=A0 133 | #include &lt;omapfb/omapfb.h&gt;<br>=
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~<=
br><br><br>The file &quot;omapfb.h&quot; is in=C2=A0drivers/video/fbdev/oma=
p2/omapfb, but for some reason the ti-gfx package does not find it.=C2=A0 W=
e are using buildroot-2020-20.02.12.</div><div><br></div><div>I did not see=
 this error in the buildroot issues, I am wondering why it is causing probl=
ems.=C2=A0 My only guess is that it may have something to do with the fact =
that I have a local kernel source directory.</div><div><br></div><div>Thank=
s for any help!</div><div><br></div><div><br><div id=3D"m_-7184434239112904=
620AppleMailSignature" dir=3D"ltr">Sent from my iPhone</div><div dir=3D"ltr=
"><br><blockquote type=3D"cite">On Jul 21, 2021, at 3:07 PM, Patricia Holde=
n &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank">pholden@nklab=
s.com</a>&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><d=
iv dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">I looked into QQmlApplication=C2=
=A0examples, they all use pc files.<div><br></div><div>I&#39;m attaching th=
e files that are doing the import of pkg-config pc files.=C2=A0 This is the=
 customer&#39;s implementation.</div><div><br></div><div>The attached URL p=
rovides examples that use the same implementation.=C2=A0 Note all their exa=
mples use the &quot;import&quot; statement at top, this is what is looking =
for pc files:</div><div><br></div><div><a href=3D"https://doc.qt.io/qt-5/qt=
multimedia-multimedia-video-qmlvideo-example.html" target=3D"_blank">https:=
//doc.qt.io/qt-5/qtmultimedia-multimedia-video-qmlvideo-example.html</a><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jul 21, 2021 at 3:41 AM Thomas Petazzoni &lt;<a href=3D"mail=
to:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hello,<br>
<br>
On Wed, 21 Jul 2021 02:23:55 -0400<br>
Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank"=
>pholden@nklabs.com</a>&gt; wrote:<br>
<br>
&gt; Yes, QQmlApplucation I am porting for a client it is using pc at<br>
&gt; runtime.=C2=A0 Would it help to see what they are doing?<br>
<br>
Ah, it is your customer-specific application that is using the .pc<br>
files, not QT itself ?<br>
<br>
If it&#39;s your customer-specific application, then it would be useful to<=
br>
check why they are doing this, as it feels odd.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Patricia A. Holden</div></div>
<div>&lt;main.cpp&gt;</div><div>&lt;main.qml&gt;</div></div></blockquote></=
div></div></div>

--000000000000bbb7a205c7b9b98a--

--===============7430968960114231614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7430968960114231614==--
