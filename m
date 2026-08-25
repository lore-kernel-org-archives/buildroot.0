Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DA1C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3470380D85;
	Tue, 25 Aug 2026 20:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ENvBQeoZkzQ; Tue, 25 Aug 2026 20:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787688423;
	bh=ux895zcg/GhJALXMkJsEcrMo4jpTuOltXuXCsb4i2yY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SH84EvesoytbVoaEo7iPeAWBTxpFcFCe9UxrntG/ziTK7AJsahJJ+tN8VZcPNkNGB
	 V1xLTFJFx1rXkBNmvk5W+5VzVvrigTk3aaTh6OgkxugV0PjcvV3mic/tUieqNqBfbW
	 wJqGtCdsqxZB0M0gghkBWq6p3qRs71WMXKGQDNm2dha2eVNZ8U1m6JxVRuvmUkk1sF
	 EZ+A+a7Mo+Q5ASylMHd/EdMdnD7gvJqdBY5/pD1JYsIyqN3s6KLT+3Y9IzzD6YEZrm
	 qxhjmAOt7sjqM1Dl9K2NjkAAQUmd1VfI+zQJCZ9nk16ecP7xv6vM8yeVS8EdnxVNkq
	 Xr2WZ9cDUhMKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81ABE80C25;
	Tue, 25 Aug 2026 20:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8DF7334
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B0F56073C
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTxUUhPhwfOT for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.219.52;
 helo=mail-qv1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09E386072B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:06:58 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-90a6b298889so2118406d6.3
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 13:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787688417; x=1788293217;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CknqNgL9ms2Lc8cGXs4F88Bg85lPwokAPJk73oTerXg=;
 b=Jti6fhtC94qN67YhsO1lFrLn2zMKBWRdxZkN4i31rOdZlZ6JKkQgSgHfh43x2pHDyR
 +WvgDo+eG87YCbUZZihz0SVsUiIVrJGh6GtKaF6wiKjENy/Dk7yVlwFGren3alwkcJdi
 0vgGS2hxkzffMEb6SYMF1/w2vzorWKsz+xj5uFVTefttgE+hKpSKIXMAbS0aqs3h66l6
 TEqe+hAd8w9qqKYP7Oee3KRZbvq8nI0PtISTh0hT9zTcg52VoUN3c3X2JEGha+vL5yY5
 kju3hPU7p67AfgePlqcKGGCj0rvrci059MC1OwnpqOan0DpgzLUCw5/xld9BMtzYUUub
 YJxA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJuXwAQkURQfuGtxahIKIAOaPAEcEssUMZ4oNuBMfpxojcFLMvfTSiWXRy3vO56lizFfP1A6qUOQI=@buildroot.org
X-Gm-Message-State: AFuF++lLt6AVOTT26m4UXIrFNbvWBGjll6MRTI/h0gYPdBALMEeG2gzy
 fjab7gvsU/QE8Ij/dmwOfLgvOGKmHKC9MnHYJPIDrtaLIJ75ZeeW0pN304D2lXpf
X-Gm-Gg: AR+sD10j1jhoQy+9MOncodcog1hnoPwtrfiyZ+OTEx8ibxjJfv17WEPCjnew+JY4Vv0
 ti+yBfezfmr/Dp22v/jcip2d+NVW30TOFO/wI1jfrbSEoD7+PYGmhYbXSoe/9F6wMsP30gQdaUG
 0TgzZFHkvA9M88tUIg9Qgo332bpYuGfXPXXUnadlfxw8pR8UvHeRzamf0bqmaL1NCZ+y1AngHbT
 nsoweZ1NfzJaIfMtnr4jiq+nFQXW3lffaxigEPgMmUQ01yCZ7kaO9wYxXqWFLy5CF37Px+CzjCt
 sPMdYMLg3HIqejvdXFAs/XLZV6gPJ0Qcd8RHHYokXuDAowUcY5w6GtWDKQIQ7bx4J0LYKUM4uG2
 OV9C/d3dZ8jKS5JXGugITnKyURFOLTCP4TlMZSSVkfazwiWVjs9CrX8+MMobMmptgLzh5jZFoK+
 YrG9Llhgtlvie/k+7VaXHdcgCkY/XSCNQZpKF8hG/5SLjAfSzzZNyqy4U83AIL/2YjdIgLYdp/s
 CdPvCttg7hJbPIp10aUhidqTvKuB1PD4jixuqbQYSeNYJk7a4WE745lUyl++5IJMh/Wvqo/HDqV
 6ZNWqk/xv3T6okHT/sIZL9t4fFEhVIKIuMBjI2HxNQ==
X-Received: by 2002:a05:6214:c43:b0:90c:bdf0:5549 with SMTP id
 6a1803df08f44-90cc79cd4acmr11722916d6.15.1787688417112; 
 Tue, 25 Aug 2026 13:06:57 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc6507e17sm6742196d6.25.2026.08.25.13.06.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 13:06:56 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-90cabe38a61so2926336d6.1
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 13:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RoeZcMxxHEgzz9EYn9g2xT/+BPMq+QFWccgKHmD9sfumhc6DmUiwkXdHIN2ni3pnDrvM1OlU8qbp+4=@buildroot.org
X-Received: by 2002:a0c:f202:0:b0:908:93ff:daa8 with SMTP id
 6a1803df08f44-90cc7930849mr13115456d6.3.1787688416196; Tue, 25 Aug 2026
 13:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260820115408.3943622-1-thomas.devoogdt@barco.com>
 <87cxvchjti.fsf@dell.be.48ers.dk>
In-Reply-To: <87cxvchjti.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 25 Aug 2026 22:06:43 +0200
X-Gmail-Original-Message-ID: <CACXRmJhGzumqavT5aYkaJAYdSzHC17bvy9W8AUG5UzKwUa3WgQ@mail.gmail.com>
X-Gm-Features: AcwNN1XEhPL0q8KHEQpFc0m6IdPjHcic2Vz9Zm_wyxnC62W8RFykL0LeUqF4nqI
Message-ID: <CACXRmJhGzumqavT5aYkaJAYdSzHC17bvy9W8AUG5UzKwUa3WgQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Subject: Re: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix
 automake-1.18 command not found
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
Content-Type: multipart/mixed; boundary="===============6870594155861426871=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6870594155861426871==
Content-Type: multipart/alternative; boundary="0000000000000442730659e4a556"

--0000000000000442730659e4a556
Content-Type: text/plain; charset="UTF-8"

Hi Peter,


You are right, I had a local patch that touched Makefile.am, but
not Makefile.in. I've changed it, and know this whole reconfigure step is
not necessary anymore. So this patch can be dropped. Thx.


Kr,

Thomas

Op do 20 aug 2026 om 17:51 schreef Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > The tarball published on
>  > https://xorg.freedesktop.org/archive/individual/xserver/ ships a
>  > pre-generated build system produced with automake 1.18. Buildroot only
>  > provides automake 1.16, so the shipped Makefile.in files are unusable
> and
>  > the build fails when they are regenerated:
>
>  > ```
>  >  cd ../../../.. && /bin/bash
> /home/thomas/buildroot/output/build/xserver_xorg-server-21.1.23/missing
> automake-1.18 --foreign hw/xfree86/drivers/modesetting/Makefile
>  >
> /home/thomas/buildroot/output/build/xserver_xorg-server-21.1.23/missing:
> line 85: automake-1.18: command not found
>  > WARNING: 'automake-1.18' is missing on your system.
>
> Given the version number I take it this is 2025.02.15 or 2025.02.16?
>
> I cannot reproduce it here. Such automake invocations normally happen if
> the Makefile.am is newer than Makefile.in, which is not the case for
> 21.1.23:
>
> stat xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Makefil*
>   File:
> xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Makefile.am
>   Size: 2349            Blocks: 8          IO Block: 4096   regular file
> Device: 253,1   Inode: 9050823     Links: 1
> Access: (0644/-rw-r--r--)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
> Access: 2026-08-20 17:32:36.099831959 +0200
> Modify: 2026-06-02 02:10:30.000000000 +0200
> Change: 2026-08-20 17:32:26.035472398 +0200
>  Birth: 2026-08-20 17:32:25.903467683 +0200
>   File:
> xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Makefile.in
>   Size: 36861           Blocks: 72         IO Block: 4096   regular file
> Device: 253,1   Inode: 9050824     Links: 1
> Access: (0644/-rw-r--r--)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
> Access: 2026-08-20 17:32:36.099831959 +0200
> Modify: 2026-06-02 02:10:40.000000000 +0200
> Change: 2026-08-20 17:32:26.035472398 +0200
>  Birth: 2026-08-20 17:32:25.903467683 +0200
>
> Do you have any local patches modifying
> hw/xfree86/drivers/modesetting/Makefile.am without also patching the
> Makefile.in?
>
> --
> Bye, Peter Korsgaard
>
>

--0000000000000442730659e4a556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div><br></div><div>You are right,=
 I had a local patch that touched=C2=A0Makefile.am, but not=C2=A0Makefile.i=
n. I&#39;ve changed it, and know this whole reconfigure step is not necessa=
ry anymore. So this patch can be dropped. Thx.</div><div><br></div><div><br=
></div><div>Kr,</div><div><br></div><div>Thomas</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">Op do 20 aug 2026 om 17:51 schreef Peter Korsgaard &lt;<a href=3D"mailto:=
peter@korsgaard.com">peter@korsgaard.com</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Thomas&quot; =
=3D=3D Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" target=3D=
"_blank">thomas@devoogdt.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; The tarball published on<br>
=C2=A0&gt; <a href=3D"https://xorg.freedesktop.org/archive/individual/xserv=
er/" rel=3D"noreferrer" target=3D"_blank">https://xorg.freedesktop.org/arch=
ive/individual/xserver/</a> ships a<br>
=C2=A0&gt; pre-generated build system produced with automake 1.18. Buildroo=
t only<br>
=C2=A0&gt; provides automake 1.16, so the shipped Makefile.in files are unu=
sable and<br>
=C2=A0&gt; the build fails when they are regenerated:<br>
<br>
=C2=A0&gt; ```<br>
=C2=A0&gt;=C2=A0 cd ../../../.. &amp;&amp; /bin/bash /home/thomas/buildroot=
/output/build/xserver_xorg-server-21.1.23/missing automake-1.18 --foreign h=
w/xfree86/drivers/modesetting/Makefile<br>
=C2=A0&gt; /home/thomas/buildroot/output/build/xserver_xorg-server-21.1.23/=
missing: line 85: automake-1.18: command not found<br>
=C2=A0&gt; WARNING: &#39;automake-1.18&#39; is missing on your system.<br>
<br>
Given the version number I take it this is 2025.02.15 or 2025.02.16?<br>
<br>
I cannot reproduce it here. Such automake invocations normally happen if<br=
>
the Makefile.am is newer than Makefile.in, which is not the case for<br>
21.1.23:<br>
<br>
stat xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Makefil*<br=
>
=C2=A0 File: xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Mak=
efile.am<br>
=C2=A0 Size: 2349=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Blocks: 8=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IO Block: 4096=C2=A0 =C2=A0regular file<br>
Device: 253,1=C2=A0 =C2=A0Inode: 9050823=C2=A0 =C2=A0 =C2=A0Links: 1<br>
Access: (0644/-rw-r--r--)=C2=A0 Uid: ( 1000/=C2=A0 =C2=A0 peko)=C2=A0 =C2=
=A0Gid: ( 1000/=C2=A0 =C2=A0 peko)<br>
Access: 2026-08-20 17:32:36.099831959 +0200<br>
Modify: 2026-06-02 02:10:30.000000000 +0200<br>
Change: 2026-08-20 17:32:26.035472398 +0200<br>
=C2=A0Birth: 2026-08-20 17:32:25.903467683 +0200<br>
=C2=A0 File: xserver_xorg-server-21.1.23/hw/xfree86/drivers/modesetting/Mak=
efile.in<br>
=C2=A0 Size: 36861=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Blocks: 72=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0IO Block: 4096=C2=A0 =C2=A0regular file<br>
Device: 253,1=C2=A0 =C2=A0Inode: 9050824=C2=A0 =C2=A0 =C2=A0Links: 1<br>
Access: (0644/-rw-r--r--)=C2=A0 Uid: ( 1000/=C2=A0 =C2=A0 peko)=C2=A0 =C2=
=A0Gid: ( 1000/=C2=A0 =C2=A0 peko)<br>
Access: 2026-08-20 17:32:36.099831959 +0200<br>
Modify: 2026-06-02 02:10:40.000000000 +0200<br>
Change: 2026-08-20 17:32:26.035472398 +0200<br>
=C2=A0Birth: 2026-08-20 17:32:25.903467683 +0200<br>
<br>
Do you have any local patches modifying<br>
hw/xfree86/drivers/modesetting/Makefile.am without also patching the<br>
Makefile.in?<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
<br>
</blockquote></div>

--0000000000000442730659e4a556--

--===============6870594155861426871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6870594155861426871==--
