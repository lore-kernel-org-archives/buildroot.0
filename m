Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F8CCA473
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 428328401D;
	Tue, 21 Jun 2022 20:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428328401D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKe1jVBtzPh9; Tue, 21 Jun 2022 20:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3984A8401A;
	Tue, 21 Jun 2022 20:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3984A8401A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 355FF1BF4E4
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 20:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F2DF41A1B
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 20:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F2DF41A1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glG2Cmw-F7pD for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 20:20:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752B7419BA
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 752B7419BA
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 20:20:08 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id r5so15454005iod.5
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 13:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9WzzNw/mKqioUVcxC9KX+Vidr7DBl2frOGey0TNfI4=;
 b=HkNDPmlflqtfFakgVPRCu3ml/EIgJXvrEY5djzlTTao6AnhY92ew3PcTlEQXlcl64V
 LpdShinSFVIdMI+REP1N0G9LYb82FGGT3WNclVEN/tjnMfUvcl+v1f/1+slLF+8LMeQs
 JKWl/qktXSqiAi4s4VTMR1jSSvciaLVaBaDWoj5qrHfjV74NreuI+HaumV5bXWq/sPAq
 VkeflDWlfWyW5QWxBvwhe33uxlMRjUNiDz66EPPti3m0La1Tiy1XDOOaJNd+xGTIO1yJ
 34WCLC3AD2MzP9kifUW09auEJGrony2gw3vRawFWrv2mC5JyxeME9KoEvxkRrKmKVtj7
 Z2dA==
X-Gm-Message-State: AJIora/2AgavMd5frbn2HkOPtafiSGJujIcZGJ/cUdCHtd6c6Q5pVLtM
 E3Ja+IGb+I22C6pkn/khF5t9zQk+gfO7QUFJtU/yjavO6obYbCTX
X-Google-Smtp-Source: AGRyM1uzL+qG6w+tKTzN6qea7j3/twPSHa/suIwIdZF3QQ0aGpNU/ti8kvM0sghQLjaMn5i3AXDc3+rqrERnZXoO98g=
X-Received: by 2002:a05:6602:1541:b0:669:d432:6813 with SMTP id
 h1-20020a056602154100b00669d4326813mr15621228iow.15.1655842807450; Tue, 21
 Jun 2022 13:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220531125152.135227-1-vsvoboda@forkoder.eu>
 <156e8291-d30a-86cb-0063-0fbf05369cd5@mind.be>
 <b3eda097-672f-da25-3b5a-e50b8a0a8077@mind.be>
In-Reply-To: <b3eda097-672f-da25-3b5a-e50b8a0a8077@mind.be>
From: Vladimir Svoboda <vsvoboda@forkoder.eu>
Date: Tue, 21 Jun 2022 22:19:54 +0200
Message-ID: <CAPWJetsSdGGYerj2ai=f-_v=XfOK4x4t5jVG8GkyScVwQWG=Vg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forkoder-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z9WzzNw/mKqioUVcxC9KX+Vidr7DBl2frOGey0TNfI4=;
 b=Wa//OYFWiAxYCRnPldTGYucueLkSEcNGu4JpvN89BJ8kOx9kFaU3+ImfegJG+5mvn7
 as6u8h9U1XWs/eAml3+bZKHjyyp0+pp+0hUfzt7xOjWZRur1y7BVGbxoEH2xHgCmhdfH
 h/dEGIcQexwEZdEQcEUHm4uHFxMQpQcQ7UVgElYQ/lpZSiocF7OZH0esfiOlMqdUAlva
 g7vpl4hiQF11QojPa2Gu639AewNMmwC2tvTw61u4O4sfjbOZA75KXTf0111x/hg9W9Kx
 2Ex9eIQhBvk7fta6RlleTAP8nmEVPn4zX1tuiZc2XECGsHyuGX/iexqQnSsCQObe9/BS
 65/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=forkoder-eu.20210112.gappssmtp.com
 header.i=@forkoder-eu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Wa//OYFW
Subject: Re: [Buildroot] [PATCH 1/2] fs/ext2: add option for zstd compression
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
Content-Type: multipart/mixed; boundary="===============8989957539978321842=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8989957539978321842==
Content-Type: multipart/alternative; boundary="00000000000057a3c105e1faf21d"

--00000000000057a3c105e1faf21d
Content-Type: text/plain; charset="UTF-8"

Just replying with the signed-off then :-)

Signed-off-by: Vladimir Svoboda <vsvoboda@forkoder.eu>

On Mon, Jun 20, 2022 at 9:42 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
> On 20/06/2022 21:41, Arnout Vandecappelle wrote:
> >  Hi Vladimir
> >
> > On 31/05/2022 14:51, vsvoboda@forkoder.eu wrote:
> >> From: Vladimir Svoboda <vsvoboda@forkoder.eu>
> >
> > Add a Signed-off-by line for yourself.  This is a short way for you to
> > assert that you are entitled to contribute the patch under buildroot's
> > GPL license.  See [1] for more details. Without this, we can't apply the
> > patch.
>
>   Forgot to mention: it's sufficient to reply to this mail with the
> Signed-off-by - patchwork will pick it up and add it to the patch.
>
>
>   Regards,
>   Arnout
>
>
> >
> >  Regards,
> >  Arnout
> >
> > [1] http://elinux.org/Developer_Certificate_Of_Origin
> >
> >>
> >> ---
> >>   fs/ext2/Config.in | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> >> index 333ead95fe..705446df57 100644
> >> --- a/fs/ext2/Config.in
> >> +++ b/fs/ext2/Config.in
> >> @@ -131,6 +131,11 @@ config BR2_TARGET_ROOTFS_EXT2_XZ
> >>       help
> >>         Do compress the ext2 filesystem with xz.
> >>   +config BR2_TARGET_ROOTFS_EXT2_ZSTD
> >> +    bool "zstd"
> >> +    help
> >> +      Do compress the ext2 filesystem with zstd.
> >> +
> >>   endchoice
> >>     endif # BR2_TARGET_ROOTFS_EXT2
>

--00000000000057a3c105e1faf21d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just replying with the signed-off then :-)</div><div>=
<br></div><div>
<p dir=3D"auto">Signed-off-by: Vladimir Svoboda &lt;<a href=3D"mailto:vsvob=
oda@forkoder.eu">vsvoboda@forkoder.eu</a>&gt;<br></p>

</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Jun 20, 2022 at 9:42 PM Arnout Vandecappelle &lt;<a href=3D"m=
ailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
On 20/06/2022 21:41, Arnout Vandecappelle wrote:<br>
&gt; =C2=A0Hi Vladimir<br>
&gt;<br>
&gt; On 31/05/2022 14:51, <a href=3D"mailto:vsvoboda@forkoder.eu" target=3D=
"_blank">vsvoboda@forkoder.eu</a> wrote:<br>
&gt;&gt; From: Vladimir Svoboda &lt;<a href=3D"mailto:vsvoboda@forkoder.eu"=
 target=3D"_blank">vsvoboda@forkoder.eu</a>&gt;<br>
&gt;<br>
&gt; Add a Signed-off-by line for yourself.=C2=A0 This is a short way for y=
ou to<br>
&gt; assert that you are entitled to contribute the patch under buildroot&#=
39;s<br>
&gt; GPL license.=C2=A0 See [1] for more details. Without this, we can&#39;=
t apply the<br>
&gt; patch.<br>
<br>
=C2=A0=C2=A0Forgot to mention: it&#39;s sufficient to reply to this mail wi=
th the <br>
Signed-off-by - patchwork will pick it up and add it to the patch.<br>
<br>
<br>
=C2=A0=C2=A0Regards,<br>
=C2=A0=C2=A0Arnout<br>
<br>
<br>
&gt;<br>
&gt; =C2=A0Regards,<br>
&gt; =C2=A0Arnout<br>
&gt;<br>
&gt; [1] <a href=3D"http://elinux.org/Developer_Certificate_Of_Origin" rel=
=3D"noreferrer" target=3D"_blank">http://elinux.org/Developer_Certificate_O=
f_Origin</a><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 fs/ext2/Config.in | 5 +++++<br>
&gt;&gt; =C2=A0 1 file changed, 5 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in<br>
&gt;&gt; index 333ead95fe..705446df57 100644<br>
&gt;&gt; --- a/fs/ext2/Config.in<br>
&gt;&gt; +++ b/fs/ext2/Config.in<br>
&gt;&gt; @@ -131,6 +131,11 @@ config BR2_TARGET_ROOTFS_EXT2_XZ<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Do compress the ext2 fi=
lesystem with xz.<br>
&gt;&gt; =C2=A0 +config BR2_TARGET_ROOTFS_EXT2_ZSTD<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool &quot;zstd&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 help<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Do compress the ext2 filesystem wi=
th zstd.<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 endchoice<br>
&gt;&gt; =C2=A0 =C2=A0 endif # BR2_TARGET_ROOTFS_EXT2<br>
</blockquote></div>

--00000000000057a3c105e1faf21d--

--===============8989957539978321842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8989957539978321842==--
