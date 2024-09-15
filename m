Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ECAC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A51CE40457;
	Sun, 15 Sep 2024 04:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDG-O6Pg7cp9; Sun, 15 Sep 2024 04:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C2F40359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C2F40359;
	Sun, 15 Sep 2024 04:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93A141BF2BB
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9043B840FE
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbVlRwLOX0qF for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:59:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70F00840EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F00840EA
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70F00840EA
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:59:11 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e1a9b40f6b3so3129730276.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726376350; x=1726981150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KWdxrLMMlBk0de6+P1hTqUOwV5skrpVRYGPfXKb2muY=;
 b=nHqj0hTeMdQAbPuzpcCsJ9581Ubmm+xAsDZ7X3FiBmK/FIO8KGuN+tDNXL1jBODZP2
 uw+LDSsCCjB/+I/J252eWY6gV6BCqlw+TUI4cvq9k1oQNQRHamyNV9+QTYilKUz3CAJe
 CYrIK1f7YrPcNlZTlCmVL/qKD63EGO1/U9tdoeS5+0C9RR6mgvV2hP78C/gNRENKgVfu
 2FtZUivTkE8Nn6X3z5hn1MoxD5+0IZnMwPKElTAPJiZ1jvef/KK442JQaFMezB+m85hc
 zccc8HP0Q/MlsITr2VGkLy8a81W8fo3l+1mtKlmzLts2vE5K6dR3fPy7J367xEilyxli
 z0Uw==
X-Gm-Message-State: AOJu0YwzZ4qgq+z6cj24hdy80A2XgGfv8mN3+qQv0S7CF+XkIVLuUNwL
 vYjw3fuc/kyu8Bb5SDG+sNSYqPfGnfA4s07ftwtpp7FSRdEmofn4fwBUb462VNsp4hDPSUEYvQc
 Gu/lT0SadPxI4ATZo8oHd7psps8U=
X-Google-Smtp-Source: AGHT+IF3KQB9m7hlB7YXH8PvIwuy6FsDxmXxqlcBV1V7VohwG0Gt1VQPTnIMQzBATfuKbF2Mtym3PuXN/yLVpIKsCUA=
X-Received: by 2002:a05:6902:1891:b0:e1d:9338:a4d7 with SMTP id
 3f1490d57ef6-e1d9dc3e048mr11382548276.44.1726376349985; Sat, 14 Sep 2024
 21:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240909121115.1165942-1-roykollensvendsen@gmail.com>
 <20240915001438.03ec32c4@windsurf>
In-Reply-To: <20240915001438.03ec32c4@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 15 Sep 2024 06:58:58 +0200
Message-ID: <CA+R_deoQYyzhs_uYbXa4uNkQdG0=oj7=M1wv5b+G__nhDg9G+A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726376350; x=1726981150; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KWdxrLMMlBk0de6+P1hTqUOwV5skrpVRYGPfXKb2muY=;
 b=Wt6m2TNjrwDUDxWjOoc+eG8Pu8Bjw30BXT1YOA+fvnQd2Dq5sylUpYfksGJ936tqyl
 R7tQbCreiKjSK5luhKRv+zsgZ8XlfcZ297qRXB7rr7Augh/TXlkp4Pw7IswBvrlL6kIF
 vY6DtcycOPVL4f3k3sP/gOcGMmx0GQx+WCVHVnavXuUs5sFPP2cgS3llSVBMfTmR0U5V
 U1y4clfpj51qQERASk5Rgd+8TpJTQSZa/hH2GJRwYvQ5g4mCdF3q/2z6fdjhgs4pwkr4
 0SeO3kYIe/PQo3C0aYyFNOvLQdT5S+7D1C2jDMXsqVm56XxycJPkv/w0mk/oXcFS8ugN
 KKSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wt6m2TNj
Subject: Re: [Buildroot] [PATCH v4 1/2] package/dlib: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2641673727474332345=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2641673727474332345==
Content-Type: multipart/alternative; boundary="00000000000016f1b90622215179"

--00000000000016f1b90622215179
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://patchwork.ozlabs.org/project/buildroot/patch/20240915045455.1567220=
-1-roykollensvendsen@gmail.com/

s=C3=B8n. 15. sep. 2024 kl. 00:14 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Mon,  9 Sep 2024 14:11:12 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> Thanks for the patch!
>
> > Should I enforce using system libraries where alternative internal
> libraries exist?
>
> Yes, we always want to use system libraries instead of bundled ones.
>
> > Do I add too much license information here? (I assume I only need
> BSL-1.0)
>
> I think the license information you provided is good as it is.
>
> > diff --git a/package/dlib/Config.in b/package/dlib/Config.in
> > new file mode 100644
> > index 0000000000..77ff5086ae
> > --- /dev/null
> > +++ b/package/dlib/Config.in
> > @@ -0,0 +1,60 @@
> > +config BR2_PACKAGE_DLIB
> > +     bool "dlib"
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     help
> > +       Dlib is a modern C++ toolkit containing machine learning
> > +       algorithms and tools for creating complex software in C++ to
> > +       solve real world problems.
> > +
> > +       http://dlib.net
> > +
> > +if BR2_PACKAGE_DLIB
> > +
> > +config BR2_PACKAGE_DLIB_GIF_SUPPORT
> > +     bool "GIF support"
> > +     select BR2_PACKAGE_GIFLIB
>
> I think you should drop all sub-options, and instead rely on automatic
> dependencies, i.e:
>
> ifeq ($(BR2_PACKAGE_GIFLIB),y)
> ... enable GIF support
> else
> ... disable GIF support
> endif
>
> and ditto for all other options.
>
> Last but not least, the addition of the entry in the DEVELOPERS file
> should be done as part of the patch adding the package.
>
> Could you adjust those small details and sent a new iteration, which I
> believe we will be able to merge?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000016f1b90622215179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://patchwork.ozlabs.org/project/buildroot/=
patch/20240915045455.1567220-1-roykollensvendsen@gmail.com/">https://patchw=
ork.ozlabs.org/project/buildroot/patch/20240915045455.1567220-1-roykollensv=
endsen@gmail.com/</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">s=C3=B8n. 15. sep. 2024 kl. 00:14 skrev Thomas Petazzo=
ni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@boo=
tlin.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello Roy,<br>
<br>
On Mon,=C2=A0 9 Sep 2024 14:11:12 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensven=
dsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
<br>
Thanks for the patch!<br>
<br>
&gt; Should I enforce using system libraries where alternative internal lib=
raries exist?<br>
<br>
Yes, we always want to use system libraries instead of bundled ones.<br>
<br>
&gt; Do I add too much license information here? (I assume I only need BSL-=
1.0)<br>
<br>
I think the license information you provided is good as it is.<br>
<br>
&gt; diff --git a/package/dlib/Config.in b/package/dlib/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..77ff5086ae<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/dlib/Config.in<br>
&gt; @@ -0,0 +1,60 @@<br>
&gt; +config BR2_PACKAGE_DLIB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;dlib&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Dlib is a modern C++ toolkit containing ma=
chine learning<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0algorithms and tools for creating complex =
software in C++ to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0solve real world problems.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://dlib.net" rel=3D"norefer=
rer" target=3D"_blank">http://dlib.net</a><br>
&gt; +<br>
&gt; +if BR2_PACKAGE_DLIB<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_DLIB_GIF_SUPPORT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;GIF support&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_GIFLIB<br>
<br>
I think you should drop all sub-options, and instead rely on automatic<br>
dependencies, i.e:<br>
<br>
ifeq ($(BR2_PACKAGE_GIFLIB),y)<br>
... enable GIF support<br>
else<br>
... disable GIF support<br>
endif<br>
<br>
and ditto for all other options.<br>
<br>
Last but not least, the addition of the entry in the DEVELOPERS file<br>
should be done as part of the patch adding the package.<br>
<br>
Could you adjust those small details and sent a new iteration, which I<br>
believe we will be able to merge?<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000016f1b90622215179--

--===============2641673727474332345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2641673727474332345==--
