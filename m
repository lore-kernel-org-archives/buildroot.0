Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC52C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:21:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FCD160EB2
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FCD160EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1973E83AB1;
	Fri, 23 Jul 2021 22:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6H9G_euHh2b; Fri, 23 Jul 2021 22:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D0A83AA7;
	Fri, 23 Jul 2021 22:21:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC41A1BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2CC083AA7
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZIBeFB6ojox for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:21:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA8CB83AA6
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 22:21:25 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id u15so4214806iol.13
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 15:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2ld0S2Awas1ZHWiop85WZgRhdlP7S79r6epJlnKJ5Q=;
 b=rLT+dI8dCEFMHiS5U6Nx9uLNa3KBf+rkgh6DMiZA2K5HelFcljdFTojmy1geySSOG4
 +VeeyUnbYtHJVKJrUUNUSPZ2YeNO15Hh/33uXQVwtjpcShweVbauLpJTYmmrgBPy7oWZ
 fo/pxHT/DSY9Ua1rLlFMyvzfpDUgW5F9wAJBTUI1eNswcwtGOmrrsg3tHNvFBXD06zv3
 qqcjQgzB0AFIemzgt+Lq9q4yixARly84CYAcP6U/ItOCXkl36PX4FopIBkI8yvb+VnDD
 wEQL+fxj3KKy/AW1CwV0pM0zlkxw3cN0kYbcLdTwxWgLqoR0JGWUGBZVGHo5nbqiE3/A
 xbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2ld0S2Awas1ZHWiop85WZgRhdlP7S79r6epJlnKJ5Q=;
 b=nLP9DhK2S8DyuNitbAs0CZ7+4rEnMJ4QLSZXUkcYtxJVA5RfswFE/zIru+YAn94plV
 RqhNrhvN9gcvY1LSEINMkZCEL5LnF7aiVm+8+L2KUl6aghVCpAcZOkl07IqYKleN7prz
 V9a1KRy9Ij5LVI3ZlTJTJsT4FD2Ic1BhNd57089XipNTcdyo38l5vSfMLUtrYUAJ9JqF
 Ikcsy1P4svcMjBdvT+banOhcmP/A0GGnThX54L+8/le09QrkRF7hjWcJwUc/XnCZ3irc
 ZBWukb8kP37YKYN+ozsayE7hURK7M0azjxr0d9vqYKfc1UgqoXBcnKBdsiMP+n3KmhK7
 DfEQ==
X-Gm-Message-State: AOAM530YdpbGxd51Mz7F4/jUeKGwOuQKMCKj789VOFxPlOj5nwY9YhSY
 qCkS0cXEr4XaNXoCGToMe2gXC6U9z+cAoHuPTr9aXt528x8mfw==
X-Google-Smtp-Source: ABdhPJwlLH7Lc5jrCZHDwLoTbo76OOmUSUkNRP4y6H3gBX3EwlCBfbCC5Rkah6DdReyJWb5jYj5aJJLGvtfq8BWMQtY=
X-Received: by 2002:a5d:8602:: with SMTP id f2mr5517424iol.61.1627078884622;
 Fri, 23 Jul 2021 15:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
 <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
 <01c34092-b6d9-86ad-6cee-c78090e75b3f@mind.be>
 <CAJ6EmCeHd-7Xv0WSt+gLn31viKP2giaXzHKOt0=Z+7zWN8eGpA@mail.gmail.com>
 <CAJ6EmCfnhev8MLO7JNx3d8trX7uEn+DgkdWZHKguyW8kG92ZhQ@mail.gmail.com>
 <87a6mdzok1.fsf@tarshish>
 <CAJ6EmCf_yXKmbTu9UtbmzcUb6ihG3aAaoWn-asU8pgyAhMgzWg@mail.gmail.com>
 <be19857f-11b3-0d21-1f2f-bf5393ea25df@mind.be>
In-Reply-To: <be19857f-11b3-0d21-1f2f-bf5393ea25df@mind.be>
From: Patricia Holden <pholden@nklabs.com>
Date: Fri, 23 Jul 2021 18:21:13 -0400
Message-ID: <CAJ6EmCfrHoPKf7adqh0w4RdA308O0y+UZYo1TLNWN-GaqmMDTg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8023338933165693667=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8023338933165693667==
Content-Type: multipart/alternative; boundary="000000000000f0972905c7d1d23c"

--000000000000f0972905c7d1d23c
Content-Type: text/plain; charset="UTF-8"

 > More precisely, the current Buildroot master version corresponds to TI
SDK
> 06.01.00.08, so you'll probably need a kernel from the same SDK version.

 > Regards,
 > Arnout
Arnout, thanks for the help.  I am at kernel version 4.9.147-ti-rt-121,
from an older TI-SDK for the Beaglebone X15.  Multiple people have added
quite a few drivers and configs to this code, it's locally stored for
Buildroot to use.  We have already tested quite a bit of our product
with what we have.  I really can't migrate to a new kernel at this point.
This whole exercise is all to get QT5-OpenGL enabled.  Any ideas on what
else I can do?

Thanks!

On Fri, Jul 23, 2021 at 4:57 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 23/07/2021 20:52, Patricia Holden wrote:
> > I have a TI specific kernel, I got it directly from a TI SDK.   The
> comments in
> > ti-sgx-km Config.in says to use ti-sgx, however, there is no choice in
> packages
> > for ti-sgx.  I can only choose "ti-sgx-km" or "ti-gfx".  I guess I can
> pull
> > ti-sgx & create package for it.  Unless someone else has a better
> suggestion.
>
>  ti-sgx consists of two separate packages: ti-sgx-km which is the kernel
> module,
> and ti-sgx-um which is the userspace library.
>
> >
> > On Thu, Jul 22, 2021 at 11:39 PM Baruch Siach <baruch@tkos.co.il
> > <mailto:baruch@tkos.co.il>> wrote:
> >
> >     Hi Patricia,
> >
> >     On Fri, Jul 23 2021, Patricia Holden wrote:
> >     > I switched from ti-gfx to ti-sgx, now I get another error:
> >     >
> >     >
> >
>  /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:69:10:
> >     > fatal error: linux/dma-direct.h: No such file or directory
> >     >    69 | #include <linux/dma-direct.h>
> >     >       |          ^~~~~~~~~~~~~~~~~~~~
> >     >
> >     >
> >     > I checked linux-headers and only see
> "include/linux/dma-direction.h", no
> >     > "include/linux/dma-direct.h".
> >
> >     The linux-headers package is for userspace API (uapi) headers that
> are
> >     part of the toolchain. dma-direction.h is for kernel code. The
> 'kbuild'
> >     part in the path above indicates that you are building a kernel
> module.
> >
> >     linux/dma-direct.h was introduced in kernel version 4.16 (commit
> >     ea8c64ace866). But ti-sgx-km commit cf7f48cb30a predates this kernel
> by
> >     few years. So this it probably a TI kernel that carries the header.
>
>  More precisely, the current Buildroot master version corresponds to TI SDK
> 06.01.00.08, so you'll probably need a kernel from the same SDK version.
>
>  Regards,
>  Arnout
>
> >
> >     The BR2_PACKAGE_TI_SGX_KM help text says this:
> >
> >               Note: it needs a TI specific kernel to build properly.
> >
> >     baruch
> >
> >     > Not sure if this is the same file this package is looking for, but
> just
> >     > renamed.  Looking through config for the kernel to see if I missed
> >     > something.
> >
> >     --
> >                                                          ~. .~   Tk Open
> Systems
> >
>  =}------------------------------------------------ooO--U--Ooo------------{=
> >        - baruch@tkos.co.il <mailto:baruch@tkos.co.il> - tel:
> +972.52.368.4656,
> >     http://www.tkos.co.il <http://www.tkos.co.il> -
> >
> >
> >
> > --
> > Patricia A. Holden
>


-- 
Patricia A. Holden

--000000000000f0972905c7d1d23c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br>=
</span>=C2=A0&gt; More precisely, the current Buildroot master version corr=
esponds to TI SDK<br>&gt; 06.01.00.08, so you&#39;ll probably need a kernel=
 from the same SDK version.<br><br>=C2=A0&gt; Regards,<br>=C2=A0&gt; Arnout=
<span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></span>Arnout, th=
anks for the help.=C2=A0 I am at kernel version 4.9.147-ti-rt-121, from an =
older TI-SDK for the Beaglebone X15.=C2=A0 Multiple people have added quite=
 a few drivers and configs to this code, it&#39;s locally stored for Buildr=
oot to use.=C2=A0 We have already tested quite a bit of our product with=C2=
=A0what we have.=C2=A0 I really can&#39;t migrate to a new kernel at this p=
oint.<div>This whole exercise is all to get QT5-OpenGL enabled.=C2=A0 Any i=
deas on what else I can do?</div><div><br></div><div>Thanks!</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, J=
ul 23, 2021 at 4:57 PM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mi=
nd.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
On 23/07/2021 20:52, Patricia Holden wrote:<br>
&gt; I have a TI specific kernel, I got it directly from a TI SDK.=C2=A0 =
=C2=A0The comments in<br>
&gt; ti-sgx-km Config.in says to use ti-sgx, however, there is no choice in=
 packages<br>
&gt; for ti-sgx.=C2=A0 I can only choose &quot;ti-sgx-km&quot; or &quot;ti-=
gfx&quot;.=C2=A0 I guess I can pull<br>
&gt; ti-sgx &amp; create package for it.=C2=A0 Unless someone else has a be=
tter suggestion.<br>
<br>
=C2=A0ti-sgx consists of two separate packages: ti-sgx-km which is the kern=
el module,<br>
and ti-sgx-um which is the userspace library.<br>
<br>
&gt; <br>
&gt; On Thu, Jul 22, 2021 at 11:39 PM Baruch Siach &lt;<a href=3D"mailto:ba=
ruch@tkos.co.il" target=3D"_blank">baruch@tkos.co.il</a><br>
&gt; &lt;mailto:<a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baru=
ch@tkos.co.il</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Patricia,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Jul 23 2021, Patricia Holden wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I switched from ti-gfx to ti-sgx, now I get an=
other error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/patricaholden/williamson/build07062021/Pro3-L=
inux/buildroot-2020.02/output/build/ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb=
5e5a7f20d8d/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_arm=
hf/kbuild/services4/srvkm/env/linux/mm.c:69:10:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; fatal error: linux/dma-direct.h: No such file =
or directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 69 | #include &lt;linux/dma-direc=
t.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I checked linux-headers and only see &quot;inc=
lude/linux/dma-direction.h&quot;, no<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;include/linux/dma-direct.h&quot;.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The linux-headers package is for userspace API (uap=
i) headers that are<br>
&gt;=C2=A0 =C2=A0 =C2=A0part of the toolchain. dma-direction.h is for kerne=
l code. The &#39;kbuild&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0part in the path above indicates that you are build=
ing a kernel module.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0linux/dma-direct.h was introduced in kernel version=
 4.16 (commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0ea8c64ace866). But ti-sgx-km commit cf7f48cb30a pre=
dates this kernel by<br>
&gt;=C2=A0 =C2=A0 =C2=A0few years. So this it probably a TI kernel that car=
ries the header.<br>
<br>
=C2=A0More precisely, the current Buildroot master version corresponds to T=
I SDK<br>
06.01.00.08, so you&#39;ll probably need a kernel from the same SDK version=
.<br>
<br>
=C2=A0Regards,<br>
=C2=A0Arnout<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The BR2_PACKAGE_TI_SGX_KM help text says this:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: it needs a=
 TI specific kernel to build properly.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0baruch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Not sure if this is the same file this package=
 is looking for, but just<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; renamed.=C2=A0 Looking through config for the =
kernel to see if I missed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; something.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=
=A0 =C2=A0Tk Open Systems<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D}-----------------------------------------------=
-ooO--U--Ooo------------{=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il"=
 target=3D"_blank">baruch@tkos.co.il</a> &lt;mailto:<a href=3D"mailto:baruc=
h@tkos.co.il" target=3D"_blank">baruch@tkos.co.il</a>&gt; - tel: +972.52.36=
8.4656,<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.tkos.co.il" rel=3D"noreferrer=
" target=3D"_blank">http://www.tkos.co.il</a> &lt;<a href=3D"http://www.tko=
s.co.il" rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a>&gt;=
 -<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Patricia A. Holden<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Patricia A. Holden</div></div>

--000000000000f0972905c7d1d23c--

--===============8023338933165693667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8023338933165693667==--
