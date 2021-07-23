Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8A8C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 18:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D19560F22
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 18:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D19560F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E395783AE0;
	Fri, 23 Jul 2021 18:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PuPj0VimDxMu; Fri, 23 Jul 2021 18:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E8E83B56;
	Fri, 23 Jul 2021 18:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6660D1BF5B3
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 18:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62F3383B60
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 18:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzmcAm_6pwqA for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 18:53:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29E2283AE1
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 18:53:05 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id a14so2484503ila.1
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 11:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGjkS8BJaAdw6SHwoA0NtnMBH0bgu1FPjMh4eWJqJW8=;
 b=AV7CG6Ml1+DwhZTtMOvjwxdoEL8wEByqfVUIqNIsxGiQIz7MA6X5FrLjHCf0q6YESU
 OdJ9mOw1gHN4jXCOBwmv+k+P2jDJMAne5VyARtMmapOTIJRGKvcM9we9OIp5YdEIXZ/4
 /DHzzmbbXIsaNhLo+6Cc2MM8O9l5624ggVB8d+HzDfJs06twE3jru1ds82tep2BIWKP0
 81936lb3OoQnfWNUXesE1qBsd8SoxmI7uZHgES+amf6Rp0ihzmz0uFuVrYm1E+hnNKd+
 kyKgbqcMeEfX+v50bEC8MvX1h8HyCQ6ldO4aYNFxnxzEX6RWNB78FNWdqjaLDXq9lXDk
 hFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGjkS8BJaAdw6SHwoA0NtnMBH0bgu1FPjMh4eWJqJW8=;
 b=YaJ++JIcgacvhgN6YH85LLMvGAOIsqjcIDY4ymUzvLTU62wHn2idLcD1dF3oEohQIP
 BlllZ96icnl3C8MvDuEV1k0AGGeaQ9KJFJQQ8sKMM8iXGdYaysFCLoXSMmltq9iCVF7W
 7jmYHInscTAr5pCuoMM2aU1tpuGKs24nxpnQXM3VWJZol0yPdiAqhwiDF38KS9uc2j1B
 KJBkbAXOqLrH7yVdxwErlOSTdrm4PdUMA/FB7vdSLoDkv6gZFxej+pEwG/qiaFq9eSh1
 MYSGYCagsoMr9KxlaWFIkBelbLG0VcWHUZnZYXawOLxfZ7PcIN97xlvsN1APbh+KnHw7
 FSoQ==
X-Gm-Message-State: AOAM533slYRhGt7BFLXE/RZ6uBZ/pSrms6rY0rviCfQDsaRUXQxRqZLx
 3hijv6pnTn2ZgLk9MUWLOqeYe1Q9GbK+fFa8yBYLMQ==
X-Google-Smtp-Source: ABdhPJwq1lzvp9AoG2hIPazLrse9TdpeTYSHNADgjtVP2200unhar5DFTPj+1U7hd83tBYI23/M/t1KLdlna4iUoeg4=
X-Received: by 2002:a05:6e02:1208:: with SMTP id
 a8mr4397616ilq.257.1627066384155; 
 Fri, 23 Jul 2021 11:53:04 -0700 (PDT)
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
In-Reply-To: <87a6mdzok1.fsf@tarshish>
From: Patricia Holden <pholden@nklabs.com>
Date: Fri, 23 Jul 2021 14:52:52 -0400
Message-ID: <CAJ6EmCf_yXKmbTu9UtbmzcUb6ihG3aAaoWn-asU8pgyAhMgzWg@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
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
Content-Type: multipart/mixed; boundary="===============7621722136722145746=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7621722136722145746==
Content-Type: multipart/alternative; boundary="000000000000da9ea405c7cee972"

--000000000000da9ea405c7cee972
Content-Type: text/plain; charset="UTF-8"

I have a TI specific kernel, I got it directly from a TI SDK.   The
comments in ti-sgx-km Config.in says to use ti-sgx, however, there is no
choice in packages for ti-sgx.  I can only choose "ti-sgx-km" or "ti-gfx".
I guess I can pull ti-sgx & create package for it.  Unless someone else has
a better suggestion.

On Thu, Jul 22, 2021 at 11:39 PM Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Patricia,
>
> On Fri, Jul 23 2021, Patricia Holden wrote:
> > I switched from ti-gfx to ti-sgx, now I get another error:
> >
> >
> /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:69:10:
> > fatal error: linux/dma-direct.h: No such file or directory
> >    69 | #include <linux/dma-direct.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~
> >
> >
> > I checked linux-headers and only see "include/linux/dma-direction.h", no
> > "include/linux/dma-direct.h".
>
> The linux-headers package is for userspace API (uapi) headers that are
> part of the toolchain. dma-direction.h is for kernel code. The 'kbuild'
> part in the path above indicates that you are building a kernel module.
>
> linux/dma-direct.h was introduced in kernel version 4.16 (commit
> ea8c64ace866). But ti-sgx-km commit cf7f48cb30a predates this kernel by
> few years. So this it probably a TI kernel that carries the header.
>
> The BR2_PACKAGE_TI_SGX_KM help text says this:
>
>           Note: it needs a TI specific kernel to build properly.
>
> baruch
>
> > Not sure if this is the same file this package is looking for, but just
> > renamed.  Looking through config for the kernel to see if I missed
> > something.
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>


-- 
Patricia A. Holden

--000000000000da9ea405c7cee972
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a TI specific kernel, I got it directly from a TI S=
DK.=C2=A0 =C2=A0The comments in ti-sgx-km Config.in says to use ti-sgx, how=
ever, there is no choice in packages for ti-sgx.=C2=A0 I can only choose &q=
uot;ti-sgx-km&quot; or &quot;ti-gfx&quot;.=C2=A0 I guess I can pull ti-sgx =
&amp; create package for it.=C2=A0 Unless someone else has a better suggest=
ion.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Jul 22, 2021 at 11:39 PM Baruch Siach &lt;<a href=3D"mailto:bar=
uch@tkos.co.il">baruch@tkos.co.il</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Patricia,<br>
<br>
On Fri, Jul 23 2021, Patricia Holden wrote:<br>
&gt; I switched from ti-gfx to ti-sgx, now I get another error:<br>
&gt;<br>
&gt; /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020=
.02/output/build/ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d/eurasia=
_km/eurasiacon/binary_omap_linux_xorg_release/target_armhf/kbuild/services4=
/srvkm/env/linux/mm.c:69:10:<br>
&gt; fatal error: linux/dma-direct.h: No such file or directory<br>
&gt;=C2=A0 =C2=A0 69 | #include &lt;linux/dma-direct.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~=
~~~~~~~~~~~~<br>
&gt;<br>
&gt;<br>
&gt; I checked linux-headers and only see &quot;include/linux/dma-direction=
.h&quot;, no<br>
&gt; &quot;include/linux/dma-direct.h&quot;.<br>
<br>
The linux-headers package is for userspace API (uapi) headers that are<br>
part of the toolchain. dma-direction.h is for kernel code. The &#39;kbuild&=
#39;<br>
part in the path above indicates that you are building a kernel module.<br>
<br>
linux/dma-direct.h was introduced in kernel version 4.16 (commit<br>
ea8c64ace866). But ti-sgx-km commit cf7f48cb30a predates this kernel by<br>
few years. So this it probably a TI kernel that carries the header.<br>
<br>
The BR2_PACKAGE_TI_SGX_KM help text says this:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: it needs a TI specific kernel to b=
uild properly.<br>
<br>
baruch<br>
<br>
&gt; Not sure if this is the same file this package is looking for, but jus=
t<br>
&gt; renamed.=C2=A0 Looking through config for the kernel to see if I misse=
d<br>
&gt; something.<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Patricia A. Holden</div></div>

--000000000000da9ea405c7cee972--

--===============7621722136722145746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7621722136722145746==--
