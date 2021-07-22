Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489F0C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CA360EB2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4CA360EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C2228398E;
	Thu, 22 Jul 2021 23:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMPgJRunoDSb; Thu, 22 Jul 2021 23:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB9BF838F0;
	Thu, 22 Jul 2021 23:38:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 266F91BF3A3
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23176838F0
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oa9X_ehqHcD3 for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 23:38:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7A1A838C0
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 23:38:17 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id y6so6927365ilj.13
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BXp+3atBeHV8d0AKu+fmZjfmiVN8tbH+jU297j0U+/4=;
 b=DzUp3qlNDEUcYwpkWjdJNjRa6Kle2EP5GRybcmfWjtANBZrZ3oZq0jEPWuTyr2VzVE
 QOPTeOK9aFeQEAQG50iBcombGGHOU5t93DceUuZ9zTV2FsN0PDKmuilNC1FbJzgOWRit
 7AkjArPcLHqhDZZM57deYSmpHd2vGpqUJ4XLFyCPpQfH0Av3gKdKfDCxZMHrjKI8U2Kj
 BjqyYoyIZHbGtfZE5azvxyrcALgh3PFuF9qT0utsMNB5iKPrpTNZk+vujOpJ24mHEDH0
 y2D6OpKydN3t5bmVABth1pmdXbXpQ+aFmQQrc2Z6ETrog6tLVZu7t2Xs9QGKXgpmc0Nh
 L1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BXp+3atBeHV8d0AKu+fmZjfmiVN8tbH+jU297j0U+/4=;
 b=rtV9YA+d5JWHWclKfDDKWKSMt6eV8mMlRlujH4vN7mfPKg9+bOxgqTFQpxMKAHVwYQ
 fSaEJxUYuK5ncoIcFgGg3+0UD/2bkvb4SdXOC00ysR5E4yGPxngnSEwDgvYHQdtjxPcR
 ZO1WlMeJXtHhnmRhuYcriJMn/zi+OtZKMNWAAVIRZydbCmIS3J352LS6NSZGvXU3ee2u
 Ht2Zncg6z83x7VNhc54IIATneAFYnlWUlOVW/b0jmaw4SArOEPW7lwh8qmG5e4IktlCv
 rUQlmWeVQ9cItw6tQDOzHyJ70Gasr7oMg3miL3PiicK5HXnwI/AyDSz5vnTHz9C9h90t
 r5gw==
X-Gm-Message-State: AOAM532iqWI6BSjc+8k1LoQIS9ixk6EF1M13RMiEzlIkHwE2qpLqV/cY
 9AoXJWUgM+Q0s4mudl6Vl8CpoDVaHI3SzvSaWyJFIqIOlHH2qw==
X-Google-Smtp-Source: ABdhPJyMv6I6heHrGrkrbf0YgfLU68Un1RsCxV9gzS5VecWEGABDged3e3yFyH5m/d5Wl9StEpEyPNNL8GIFhjJMTks=
X-Received: by 2002:a92:d58f:: with SMTP id a15mr1600101iln.18.1626997096854; 
 Thu, 22 Jul 2021 16:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
 <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
 <01c34092-b6d9-86ad-6cee-c78090e75b3f@mind.be>
 <CAJ6EmCeHd-7Xv0WSt+gLn31viKP2giaXzHKOt0=Z+7zWN8eGpA@mail.gmail.com>
In-Reply-To: <CAJ6EmCeHd-7Xv0WSt+gLn31viKP2giaXzHKOt0=Z+7zWN8eGpA@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Thu, 22 Jul 2021 19:38:06 -0400
Message-ID: <CAJ6EmCfnhev8MLO7JNx3d8trX7uEn+DgkdWZHKguyW8kG92ZhQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1894612745656056746=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1894612745656056746==
Content-Type: multipart/alternative; boundary="00000000000002519905c7bec803"

--00000000000002519905c7bec803
Content-Type: text/plain; charset="UTF-8"

I switched from ti-gfx to ti-sgx, now I get another error:

/home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:69:10:
fatal error: linux/dma-direct.h: No such file or directory
   69 | #include <linux/dma-direct.h>
      |          ^~~~~~~~~~~~~~~~~~~~


I checked linux-headers and only see "include/linux/dma-direction.h", no
"include/linux/dma-direct.h".

Not sure if this is the same file this package is looking for, but just
renamed.  Looking through config for the kernel to see if I missed
something.



On Thu, Jul 22, 2021 at 3:52 PM Patricia Holden <pholden@nklabs.com> wrote:

> Thanks, I will try that!
>
> On Thu, Jul 22, 2021 at 3:40 PM Arnout Vandecappelle <arnout@mind.be>
> wrote:
>
>>
>>
>> On 22/07/2021 19:36, Patricia Holden wrote:
>> > Hi Thomas,
>> >
>> > The saga continues.  I found that multimedia is not added
>> > because BR2_PACKAGE_QT5_GL_AVAILABLE is not set.  In order to configure
>> QT
>> > OpenGL, I enabled ti-gfx since our board is a beaglebone-x15.
>>
>>  Not that I've ever used this board, but AFAIK for AM57xx you should use
>> ti-sgx,
>> not ti-gfx.
>>
>>  Regards,
>>  Arnout
>>
>>
>> >  Now I can't get
>> > past building ti-gfx.  I have a local source directory for the kernel,
>> since we
>> > had to add our own drivers for some proprietary devices on the design
>> based on
>> > beaglebone X15.  I also use the local source directory to generate
>> > linux-headers.  We based the kernel from TI's SDK.  I checked the
>> kernel config,
>> > fbdev omap is selected.  But I get the following error:
>> >
>> >  CC [M]
>> >
>>  /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/common/pvrsrv.o
>> >   CC [M]
>> >
>>  /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/common/handle.o
>> >
>> /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:133:10:
>> > fatal error: omapfb/omapfb.h: No such file or directory
>> >   133 | #include <omapfb/omapfb.h>
>> >       |          ^~~~~~~~~~~~~~~~~
>> >
>> >
>> > The file "omapfb.h" is in drivers/video/fbdev/omap2/omapfb, but for
>> some reason
>> > the ti-gfx package does not find it.  We are using
>> buildroot-2020-20.02.12.
>> >
>> > I did not see this error in the buildroot issues, I am wondering why it
>> is
>> > causing problems.  My only guess is that it may have something to do
>> with the
>> > fact that I have a local kernel source directory.
>>
>> [snip]
>>
>
>
> --
> Patricia A. Holden
>


-- 
Patricia A. Holden

--00000000000002519905c7bec803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I switched from ti-gfx to ti-sgx, now I get another error:=
<div><br></div><div>/home/patricaholden/williamson/build07062021/Pro3-Linux=
/buildroot-2020.02/output/build/ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a=
7f20d8d/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_armhf/k=
build/services4/srvkm/env/linux/mm.c:69:10: fatal error: linux/dma-direct.h=
: No such file or directory<br>=C2=A0 =C2=A069 | #include &lt;linux/dma-dir=
ect.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~=
~~~~~~~~~~~~~~~<br><br></div><div><br></div><div>I checked linux-headers an=
d only see &quot;include/linux/dma-direction.h&quot;, no &quot;include/linu=
x/dma-direct.h&quot;.</div><div><br></div><div>Not sure if this is the same=
 file this package is looking for, but just renamed.=C2=A0 Looking through =
config for the kernel to see if I missed something.</div><div><br></div><di=
v><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Jul 22, 2021 at 3:52 PM Patricia Holden &lt;<a href=3D"=
mailto:pholden@nklabs.com">pholden@nklabs.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Thanks, I wil=
l try that!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jul 22, 2021 at 3:40 PM Arnout Vandecappelle &lt;<a href=
=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
><div dir=3D"ltr">Patricia A. Holden</div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Patricia A. Holden</div></div>

--00000000000002519905c7bec803--

--===============1894612745656056746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1894612745656056746==--
