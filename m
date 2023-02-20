Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA98BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75266701D2;
	Tue, 21 Feb 2023 02:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75266701D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-83XfB-RW5a; Tue, 21 Feb 2023 02:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6954B702EA;
	Tue, 21 Feb 2023 02:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6954B702EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6FF51BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DA6360B0E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA6360B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVtRWWzmzYbO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:24:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C055D60F31
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C055D60F31
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:24:07 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id q11so3320228plx.5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G02WDayHIFfs0x7slgsbSdczWN/Rn8GNJu1U7twfh1c=;
 b=Z1T/B9F0hvEAvQ76Ov5bzGhbc02+dAdHiEV9yb8NsigCN6sXtFHEeDD1CLSy1AfPaB
 BWFHq73Ttb/nTDjlTr1RozISUj+g6S8pZIK2oEzFOXEIFepHhzi0/4zei8B66NnYvkde
 UtQbB9bnyvG9pFxmlu63FkjQ/gFH9kGSxQ87gqHDVLp72Z+A/MxxPdlyozVg2ijgtLvp
 ASRi8OQE1C17vt2GTTXOiGhYzt2P2p5qBl9ZIHJItMLZ0pe2kw+jNd36q5OZJkXef1KD
 xQyOHlQNyq5iHlzOhN1zwqQWEHnO7XMAMcDLBFsv22vDBhY9yayHL9yRjp57mmEjCIBQ
 qu7Q==
X-Gm-Message-State: AO0yUKUBoweRn8RHfeLIgtxgJ7eX9QxAIFl7ZKBkR2kF+YNCdlczVOrU
 Auy7ReqvXAzpbvKhlVWPR9UT71UTPU8ILBjBa7n8tcCdzZ4=
X-Google-Smtp-Source: AK7set8+9kAHX7H1swQh7RJFEZkfFMTMg4m6ptUdGbDKhUKmeMa09Q73pgYWhdHgxzQS1Ijmrc372oT6Vqj5194RTAQ=
X-Received: by 2002:a17:903:25d2:b0:19b:42d:79f8 with SMTP id
 jc18-20020a17090325d200b0019b042d79f8mr346971plb.5.1676931847028; Mon, 20 Feb
 2023 14:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20230219232301.1795196-1-fontaine.fabrice@gmail.com>
 <20230220220741.1f38012c@windsurf>
In-Reply-To: <20230220220741.1f38012c@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Feb 2023 23:23:55 +0100
Message-ID: <CAPi7W824Q9jqJAkb3Na+P-d-jYX29=Kw3rU1CRC7sFKUBvVd6Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G02WDayHIFfs0x7slgsbSdczWN/Rn8GNJu1U7twfh1c=;
 b=FrTDdPZPwL+a20RH1RZnPuO5lch+uWq3nUp1HSbGj7QyxFnP5khub9YbcL/77NWxQw
 yqREwHqNEU3h7eCExlNcU+NjOcTLTcA3c+N7783/RvHLvJoDUoLLU1k8c6id61iZMhAq
 I66DXdsxqNwZ7KkXUgKBOZGwn/0OxsCu+0Y8hGUdsiXk1jXnVnHn8ugsVg5EouN73RnC
 nlrM/2U32J0rLtrM9sO7+wJz3JebfbNHUKh4JZvika8UnsBGBB7B0hRMGOAkAI7pYAPk
 rsV5Xn6iMwO9BTC6GEewrxqjMxr3DXiL9NKS7SNZhpZoYLe9QAlzWIM+9xdaQu8hdh2E
 z59A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FrTDdPZP
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: fix BR2_SHARED_STATIC_LIBS
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7189125898602859996=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7189125898602859996==
Content-Type: multipart/alternative; boundary="0000000000000e03b005f5291f89"

--0000000000000e03b005f5291f89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 20 f=C3=A9vr. 2023 =C3=A0 22:07, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello Fabrice,
>
> On Mon, 20 Feb 2023 00:23:01 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > tmux uses custom --enable-static option, instead of standard libtool
> > directive resulting in the following build failure with systemd or
> > utf8proc raised since commits
> > 1f618aa388535181c281c85e2b5264532de4ef0f and
> > e279599d255a79c08ef20b97b96eb248689d52a9:
>
> I am rather confused by the reasoning here.
>
> > checking for utf8proc.h... yes
> > checking for library containing utf8proc_charwidth... no
> > configure: error: "utf8proc not found"
>
> So this one is:
>
>
> http://autobuild.buildroot.net/results/6e8/6e8523d8d514bf6d8fc3377d05e5ed=
be7fc2d5bb/build-end.log
>
> http://autobuild.buildroot.net/results/623/62309091c9da69eb29c3e9464aa95d=
089ce886f8/build-end.log
>
> I think here the problem is indeed that tmux interprets --enable-static
> as "please provide a statically linked binary" instead of the standard
> "please build/install static libraries".
>
> So, when it tries to detect libutf8proc, it doesn't find it:
>
> /home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/or1k-buildroo=
t-linux-musl/11.3.0/../../../../or1k-buildroot-linux-musl/bin/ld:
> cannot find -lutf8proc: No such file or directory
>
> because utf8proc is based on CMake, and CMake is not able to build both
> shared and static libraries, so in the BR2_STATIC_SHARED_LIBS=3Dy case,
> it only installs shared libraries. Because the above utf8proc library
> test is done with -static, it requires a static variant of libutf8proc,
> which isn't there.
>
> So indeed, for this case, it makes sense to not pass --enable-static to
> tmux, but it's both due to tmux having a non-standard behavior for
> --enable-static *AND* the fact that utf8proc also doesn't behave
> properly in the BR2_STATIC_SHARED_LIBS=3Dy case.
>
> > In file included from tmux.h:34,
> >                  from alerts.c:23:
> > compat.h:379:18: error: conflicting types for 'forkpty'; have 'pid_t(in=
t
> *, char *, struct termios *, struct winsize *)' {aka 'int(int *, char *,
> struct termios *, struct winsize *)'}
> >   379 | pid_t            forkpty(int *, char *, struct termios *, struc=
t
> winsize *);
> >       |                  ^~~~~~~
>
>
> However this one, I am really, really confused as to how it can be
> related to BR2_STATIC_SHARED_LIBS and --enable-static. Could you
> provide some more details on the reasoning?
>

This is the same issue, availability of forkpty in systemd is wrongly
detected because of --static.
Here is an extract of
http://autobuild.buildroot.org/results/cba/cba06f3bb6d9be25e91f56c390a70ddf=
9904832e//tmux-3.3a/config.log
:

configure:7278:
/home/autobuild/autobuild/instance-12/output-1/host/bin/powerpc64-buildroot=
-linux-gnu-gcc
-o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=3D64  -O2 -g0 -D_FORTIFY_SOURCE=3D2  -D_DEFAULT_SOURCE
-D_XOPEN_SOURCE=3D600    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=3D64 -static   conftest.c -lutil
-L/home/autobuild/autobuild/instance-12/output-1/host/bin/../powerpc64-buil=
droot-linux-gnu/sysroot/usr/lib
-lsystemd  -lncurses
-L/home/autobuild/autobuild/instance-12/output-1/host/bin/../powerpc64-buil=
droot-linux-gnu/sysroot/usr/lib
-levent_core  -lm  >&5
/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/powerpc64-build=
root-linux-gnu/11.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld:
cannot find -lsystemd



>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--0000000000000e03b005f5291f89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 f=C3=A9vr. 2023 =C3=
=A0=C2=A022:07, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fabrice,<br>
<br>
On Mon, 20 Feb 2023 00:23:01 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; tmux uses custom --enable-static option, instead of standard libtool<b=
r>
&gt; directive resulting in the following build failure with systemd or<br>
&gt; utf8proc raised since commits<br>
&gt; 1f618aa388535181c281c85e2b5264532de4ef0f and<br>
&gt; e279599d255a79c08ef20b97b96eb248689d52a9:<br>
<br>
I am rather confused by the reasoning here.<br>
<br>
&gt; checking for utf8proc.h... yes<br>
&gt; checking for library containing utf8proc_charwidth... no<br>
&gt; configure: error: &quot;utf8proc not found&quot;<br>
<br>
So this one is:<br>
<br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/results/6e8/6e8523d8d514bf=
6d8fc3377d05e5edbe7fc2d5bb/build-end.log" rel=3D"noreferrer" target=3D"_bla=
nk">http://autobuild.buildroot.net/results/6e8/6e8523d8d514bf6d8fc3377d05e5=
edbe7fc2d5bb/build-end.log</a><br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/results/623/62309091c9da69=
eb29c3e9464aa95d089ce886f8/build-end.log" rel=3D"noreferrer" target=3D"_bla=
nk">http://autobuild.buildroot.net/results/623/62309091c9da69eb29c3e9464aa9=
5d089ce886f8/build-end.log</a><br>
<br>
I think here the problem is indeed that tmux interprets --enable-static<br>
as &quot;please provide a statically linked binary&quot; instead of the sta=
ndard<br>
&quot;please build/install static libraries&quot;.<br>
<br>
So, when it tries to detect libutf8proc, it doesn&#39;t find it:<br>
<br>
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/or1k-buildroot-=
linux-musl/11.3.0/../../../../or1k-buildroot-linux-musl/bin/ld: cannot find=
 -lutf8proc: No such file or directory<br>
<br>
because utf8proc is based on CMake, and CMake is not able to build both<br>
shared and static libraries, so in the BR2_STATIC_SHARED_LIBS=3Dy case,<br>
it only installs shared libraries. Because the above utf8proc library<br>
test is done with -static, it requires a static variant of libutf8proc,<br>
which isn&#39;t there.<br>
<br>
So indeed, for this case, it makes sense to not pass --enable-static to<br>
tmux, but it&#39;s both due to tmux having a non-standard behavior for<br>
--enable-static *AND* the fact that utf8proc also doesn&#39;t behave<br>
properly in the BR2_STATIC_SHARED_LIBS=3Dy case.<br>
<br>
&gt; In file included from tmux.h:34,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ale=
rts.c:23:<br>
&gt; compat.h:379:18: error: conflicting types for &#39;forkpty&#39;; have =
&#39;pid_t(int *, char *, struct termios *, struct winsize *)&#39; {aka &#3=
9;int(int *, char *, struct termios *, struct winsize *)&#39;}<br>
&gt;=C2=A0 =C2=A0379 | pid_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 forkp=
ty(int *, char *, struct termios *, struct winsize *);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
<br>
<br>
However this one, I am really, really confused as to how it can be<br>
related to BR2_STATIC_SHARED_LIBS and --enable-static. Could you<br>
provide some more details on the reasoning?<br></blockquote><div><br></div>=
<div>This is the same issue, availability of forkpty in systemd is wrongly =
detected because of --static.</div><div>Here is an extract of</div><div><a =
href=3D"http://autobuild.buildroot.org/results/cba/cba06f3bb6d9be25e91f56c3=
90a70ddf9904832e//tmux-3.3a/config.log">http://autobuild.buildroot.org/resu=
lts/cba/cba06f3bb6d9be25e91f56c390a70ddf9904832e//tmux-3.3a/config.log</a>:=
</div><div><pre>configure:7278: /home/autobuild/autobuild/instance-12/outpu=
t-1/host/bin/powerpc64-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOU=
RCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O2 -g0 -D_FORTIFY_SOUR=
CE=3D2  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=3D600    -D_LARGEFILE_SOURCE -D_L=
ARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -static   conftest.c -lutil  -L/=
home/autobuild/autobuild/instance-12/output-1/host/bin/../powerpc64-buildro=
ot-linux-gnu/sysroot/usr/lib -lsystemd  -lncurses  -L/home/autobuild/autobu=
ild/instance-12/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/=
usr/lib -levent_core  -lm  &gt;&amp;5
/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/powerpc64-build=
root-linux-gnu/11.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: can=
not find -lsystemd<br></pre></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--0000000000000e03b005f5291f89--

--===============7189125898602859996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7189125898602859996==--
