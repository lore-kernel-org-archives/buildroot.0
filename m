Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3759C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 19:52:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7077F60EB2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 19:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7077F60EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD23608BB;
	Thu, 22 Jul 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWeuoKdT-oBZ; Thu, 22 Jul 2021 19:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DD9C608AF;
	Thu, 22 Jul 2021 19:52:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96A011BF324
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 19:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93EFA81CAF
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 19:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nklabs-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWDTGtnBDMxR for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 19:52:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AE678104D
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 19:52:27 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id v26so7728376iom.11
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lXUC38nulyhPL75Hr8dIaT5mq21UJfSnQTbvIff4N00=;
 b=Dgps5cMRqgZGB2XJ4jhf9gv0p0f4/QTanppXRhxgfE4yQy0tyE1zvMT5qJaag+Z8ku
 a5LDwIIx3yzrxhqnrs2KMlttWZIqmkt2rKPCCklnYn3e2TZANhcZ4DU2Sr/W1XCdSK1y
 7zQGMu/raR8obhdDl4x22SmMvq+gSQKCVKzwF3M0GGN7IVakPyJlIlZMO0TTfUreOkld
 XD7L3LXGSxjFJzm/CKiCETx7d2scgaJWM9qQv/645sdzHsfeC9gOfWgZvyGn0YzYuaXe
 mbvvhtLxlQuzXNCAq7hBjXb6ImMW4pZcmdKs7To/yh7s9xhupjR7/n/6MCBEz6MrcQNg
 xcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXUC38nulyhPL75Hr8dIaT5mq21UJfSnQTbvIff4N00=;
 b=q49qyKZ6dUQNvGIHXY/zxIS4FJ6RU7XkHdjn0k50E55oo/ba8xhAzSNDsaidSi6q/+
 aEPdqp/iGemO240pTz99rGTGwhfaeHPwTJsUbMAkDtLs9pxXi/P46cvr8dcZVh3RvMSo
 y5JBa0BhI/Hu97dAi7FiRENtJmSYtdVjxXJ3HQ9O4S+A5Up935BVna5XjkkDWjsmFMXK
 +1ERh+v/ad+Kd0f0ebWNZjvXzCn/jTzCw2FgVjqt4gSLGfKPmHs5Uf+eJIiol/XE5Dp3
 m+J/uUCH5RYoiBZrISIzDG0oUA/gnA+8V20fDbO9eJuP78NJaeDjgiAHFwEI1uL7vCtX
 X+zA==
X-Gm-Message-State: AOAM533UHQwlpZD5QkWwop3XYkOZRQo2zi0/jCSJD7C55Rkntco6+k+V
 LfLdQ3oyjRjLzncIuxgkepJAe6XlTPPS599o/Vj2gQ==
X-Google-Smtp-Source: ABdhPJzEGlcn6xuYmhDBbuNtg3kbMMQW7mdcTfhuPYdGOXRy4k06UThG/rsv/bWSv4FmdjjBRTOnUAHsfsyet1j4ZEo=
X-Received: by 2002:a05:6638:3887:: with SMTP id
 b7mr1108259jav.42.1626983546449; 
 Thu, 22 Jul 2021 12:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
 <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
 <01c34092-b6d9-86ad-6cee-c78090e75b3f@mind.be>
In-Reply-To: <01c34092-b6d9-86ad-6cee-c78090e75b3f@mind.be>
From: Patricia Holden <pholden@nklabs.com>
Date: Thu, 22 Jul 2021 15:52:15 -0400
Message-ID: <CAJ6EmCeHd-7Xv0WSt+gLn31viKP2giaXzHKOt0=Z+7zWN8eGpA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============3879889786562193774=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3879889786562193774==
Content-Type: multipart/alternative; boundary="000000000000578b3405c7bba034"

--000000000000578b3405c7bba034
Content-Type: text/plain; charset="UTF-8"

Thanks, I will try that!

On Thu, Jul 22, 2021 at 3:40 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 22/07/2021 19:36, Patricia Holden wrote:
> > Hi Thomas,
> >
> > The saga continues.  I found that multimedia is not added
> > because BR2_PACKAGE_QT5_GL_AVAILABLE is not set.  In order to configure
> QT
> > OpenGL, I enabled ti-gfx since our board is a beaglebone-x15.
>
>  Not that I've ever used this board, but AFAIK for AM57xx you should use
> ti-sgx,
> not ti-gfx.
>
>  Regards,
>  Arnout
>
>
> >  Now I can't get
> > past building ti-gfx.  I have a local source directory for the kernel,
> since we
> > had to add our own drivers for some proprietary devices on the design
> based on
> > beaglebone X15.  I also use the local source directory to generate
> > linux-headers.  We based the kernel from TI's SDK.  I checked the kernel
> config,
> > fbdev omap is selected.  But I get the following error:
> >
> >  CC [M]
> >
>  /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/common/pvrsrv.o
> >   CC [M]
> >
>  /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/common/handle.o
> >
> /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:133:10:
> > fatal error: omapfb/omapfb.h: No such file or directory
> >   133 | #include <omapfb/omapfb.h>
> >       |          ^~~~~~~~~~~~~~~~~
> >
> >
> > The file "omapfb.h" is in drivers/video/fbdev/omap2/omapfb, but for some
> reason
> > the ti-gfx package does not find it.  We are using
> buildroot-2020-20.02.12.
> >
> > I did not see this error in the buildroot issues, I am wondering why it
> is
> > causing problems.  My only guess is that it may have something to do
> with the
> > fact that I have a local kernel source directory.
>
> [snip]
>


-- 
Patricia A. Holden

--000000000000578b3405c7bba034
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I will try that!</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 3:40 PM Ar=
nout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 22/07/2021 19:36, Patricia Holden wrote:<br>
&gt; Hi Thomas,<br>
&gt; <br>
&gt; The saga continues.=C2=A0 I found that multimedia is not added<br>
&gt; because=C2=A0BR2_PACKAGE_QT5_GL_AVAILABLE is not set.=C2=A0 In order t=
o configure QT<br>
&gt; OpenGL, I enabled ti-gfx since our board is a beaglebone-x15.<br>
<br>
=C2=A0Not that I&#39;ve ever used this board, but AFAIK for AM57xx you shou=
ld use ti-sgx,<br>
not ti-gfx.<br>
<br>
=C2=A0Regards,<br>
=C2=A0Arnout<br>
<br>
<br>
&gt;=C2=A0 Now I can&#39;t get<br>
&gt; past building ti-gfx.=C2=A0 I have a local source directory for the ke=
rnel, since we<br>
&gt; had to add our own drivers for some proprietary devices on the design =
based on<br>
&gt; beaglebone X15.=C2=A0 I also use the local source directory to generat=
e<br>
&gt; linux-headers.=C2=A0 We based the kernel from TI&#39;s SDK.=C2=A0 I ch=
ecked the kernel config,<br>
&gt; fbdev omap is selected.=C2=A0 But I get the following error:<br>
&gt; <br>
&gt; =C2=A0CC [M]<br>
&gt; =C2=A0/home/patricaholden/williamson/build07062021/Pro3-Linux/buildroo=
t-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/commo=
n/pvrsrv.o<br>
&gt; =C2=A0 CC [M]<br>
&gt; =C2=A0/home/patricaholden/williamson/build07062021/Pro3-Linux/buildroo=
t-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/commo=
n/handle.o<br>
&gt; /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020=
.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/3rdparty/dc_omapf=
b3_linux/omaplfb_linux.c:133:10:<br>
&gt; fatal error: omapfb/omapfb.h: No such file or directory<br>
&gt; =C2=A0 133 | #include &lt;omapfb/omapfb.h&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~=
~~~~<br>
&gt; <br>
&gt; <br>
&gt; The file &quot;omapfb.h&quot; is in=C2=A0drivers/video/fbdev/omap2/oma=
pfb, but for some reason<br>
&gt; the ti-gfx package does not find it.=C2=A0 We are using buildroot-2020=
-20.02.12.<br>
&gt; <br>
&gt; I did not see this error in the buildroot issues, I am wondering why i=
t is<br>
&gt; causing problems.=C2=A0 My only guess is that it may have something to=
 do with the<br>
&gt; fact that I have a local kernel source directory.<br>
<br>
[snip]<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Patricia A. Holden</div></div>

--000000000000578b3405c7bba034--

--===============3879889786562193774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3879889786562193774==--
