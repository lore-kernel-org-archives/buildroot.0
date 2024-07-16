Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61587C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 17:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1EE81438;
	Tue, 16 Jul 2024 17:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4WAeDITeEUQ; Tue, 16 Jul 2024 17:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD32181426
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD32181426;
	Tue, 16 Jul 2024 17:32:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D33A1BF307
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5956260A55
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZFT2ZyLAFFq for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 17:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DB4F60A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB4F60A3B
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DB4F60A3B
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 17:32:17 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-dfdb6122992so4859606276.3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721151137; x=1721755937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//kIUg/RunjnK8wuBICr+5kD89GWVWhSTLKAkE0LXX4=;
 b=NUcgxsT0T6sn62xCcPGUu1HcS4Gq3kZuhczi03z8YPlmTa9bv2MgPc8RV/jL7amYAQ
 Zfj+ANObH7FDDUX2ZBds4kkRKZWMd1FUXQRqXWWU/2EAY/QfVwO/XXOfwnYMGT11zrxj
 vcxoHtRUorzfrpx7wQQSZmwnsmleIN8ePfAq+8nnm4Iovb4RUjQNHVRTwgyP07KV42T5
 n0xHAhmblocxw4A3JAeWK13jrT+i7OmVmuS9M3K5gQ4ojuCDy1AKS9n6jRxam9lr20kw
 lHVo9UFq1tQ4EN78BpzFXwAfjMbiXGq5jNQFrqtWTd31s1Ll5LUg/sEKTPnSFuZH/LOL
 IRAg==
X-Gm-Message-State: AOJu0YyZ83bkPug/fEPpK0BO21N0FunKWxht3JFQVWZZ15b9AO6Gpcz0
 5FCX19vWqHiYTZA62o0EKRr1QP65xH9ixp9q3E/aBhYBwcUarQ5xO5Oktmmgu/QtQOYkqr4cDZH
 7F7E0pWe9Hs+0bbypCOUahjvtbReh2SsR
X-Google-Smtp-Source: AGHT+IG5UuYDRhTjdpHiN0JL55brQP5waKk2Ue564r6DPmpjAl60NSoicmZfdzPBTbpmysEtQKBPvcGI6uXs30CgGCY=
X-Received: by 2002:a05:6902:c05:b0:e03:22e5:cd49 with SMTP id
 3f1490d57ef6-e05d5eb7b1emr4079207276.39.1721151136725; Tue, 16 Jul 2024
 10:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
 <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
 <20240716162323.48fb829b@windsurf>
In-Reply-To: <20240716162323.48fb829b@windsurf>
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Tue, 16 Jul 2024 19:32:05 +0200
Message-ID: <CAGkXw1WpytUyJK+bjDp77LA6-i93=anNqth57SYV5YNbj0hmxw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721151137; x=1721755937; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=//kIUg/RunjnK8wuBICr+5kD89GWVWhSTLKAkE0LXX4=;
 b=EDGtSjEfGt6wpBbk8UNAoyjbw+dg6AbSHMd/3sjG7g+Ask5UDVfk4Y6GDqfNk/8fx0
 ulRBCZPDQ/pitpFMmNLu1G7ySEfbPQ30BMuJF8gs6LDqZ3El9dKSffoWEH+wnXZqriP8
 WsQMm9qrOKYWeRl9qPyJ2aiFrMIW5BLrV52X39YSpkWsYZfoGgE0/8zsszhi7bxfsP4h
 7CWCaMIWnef+vh2ZslMCG34wx4STk9gefSClZ7iW/g4oN0Ie9iQH+YfkT3biGpyVBTmL
 uSc9R+UmpebNyaOLd66thmx9nPWLjveLEBkylIXJJVDzajXuQV2nmkvsaxk+cbpxrKRl
 yVpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EDGtSjEf
Subject: Re: [Buildroot] [PATCH v3] package/busybox: fix build with glibc
 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0693806687058391938=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0693806687058391938==
Content-Type: multipart/alternative; boundary="0000000000001c08a0061d60ba34"

--0000000000001c08a0061d60ba34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Here is a revised version:

Hi Thomas

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97
it removed the deprecated libcrypt support.

Busybox has internal crypt functions that are enabled by default. However,
a user
can choose to use the system's crypt function instead by disabling
CONFIG_USE_BB_CRYPT.
In such situations, glibc's libcrypt was providing busybox's libcrypt
dependency
and so busybox builds are broken when using glibc version 2.39 with
CONFIG_USE_BB_CRYPT
disabled.

To fix this, add the libxcrypt dependency to busybox when
BR2_PACKAGE_LIBXCRYPT is
selected. The user still has to select the libxcrypt package for this patch
to work
properly.


Regards,
Fred

On Tue, Jul 16, 2024 at 4:23=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Fred,
>
> On Tue, 16 Jul 2024 09:59:34 +0200
> Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:
>
> > When glibc was bumped to version 2.39 in commit
> > b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> > libcrypt support.
> >
> > As glibc's libcrypt was providing busybox's libcrypt dependency this
> > broke any busybox build using glibc version 2.39.
>
> Thanks for the new patch, but this still is wrong or too vague.
>
> When you say "this broke any busybox build", it means that Busybox
> build is completely broken. However, I don't see any Busybox build
> failures in our autobuilders. So quite certainly, it's not all Busybox
> builds that are broken.
>
> So your commit should much better document which Busybox configurations
> are broken. What is the build failure you encounter? After enabling
> which option?
>
> From a quick look, <crypt.h> is included by libbb/pw_encrypt.c, which
> does:
>
> #if !ENABLE_USE_BB_CRYPT
> # if !defined(__FreeBSD__)
> #  include <crypt.h>
> # endif
> #endif
>
> So it's only if you *disable* USE_BB_CRYPT that you will have an issue
> I believe? And USE_BB_CRYPT is enabled in our default configuration.
>
> Could you please be a lot more specific/precise in your commit log? I
> think your change is correct, but your commit log doesn't provide a
> good justification for it.
>
> On my side, I confirm that I can reproduce the build issue if I disable
> USE_BB_CRYPT in my Busybox configuration. Is this the issue you're
> seeing?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000001c08a0061d60ba34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Thomas,<br><br></div>Here is a revised v=
ersion:<br><br>
<div>Hi Thomas<br></div><br>When glibc was bumped to version 2.39 in commit=
 b5680f53d60acf8ff6010082f873438a39bd5d97 <br>it removed the deprecated lib=
crypt support.<br><br>Busybox has internal crypt functions that are enabled=
 by default. However, a user <br>can choose to use the system&#39;s crypt f=
unction instead by disabling CONFIG_USE_BB_CRYPT. <br>In such situations, g=
libc&#39;s libcrypt was providing busybox&#39;s libcrypt dependency <br>and=
 so busybox builds are broken when using glibc version 2.39 with CONFIG_USE=
_BB_CRYPT <br>disabled.<br><br>To fix this, add the libxcrypt dependency to=
 busybox when BR2_PACKAGE_LIBXCRYPT is <br>selected. The user still has to =
select the libxcrypt package for this patch to work <br>properly.

<br><br><br></div>Regards,<br></div>Fred<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 16, 2024 at 4:23=E2=
=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.co=
m">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Fred,<br>
<br>
On Tue, 16 Jul 2024 09:59:34 +0200<br>
Fred Lefranc &lt;<a href=3D"mailto:fred.lefranc.evs@gmail.com" target=3D"_b=
lank">fred.lefranc.evs@gmail.com</a>&gt; wrote:<br>
<br>
&gt; When glibc was bumped to version 2.39 in commit<br>
&gt; b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated<br>
&gt; libcrypt support.<br>
&gt; <br>
&gt; As glibc&#39;s libcrypt was providing busybox&#39;s libcrypt dependenc=
y this<br>
&gt; broke any busybox build using glibc version 2.39.<br>
<br>
Thanks for the new patch, but this still is wrong or too vague.<br>
<br>
When you say &quot;this broke any busybox build&quot;, it means that Busybo=
x<br>
build is completely broken. However, I don&#39;t see any Busybox build<br>
failures in our autobuilders. So quite certainly, it&#39;s not all Busybox<=
br>
builds that are broken.<br>
<br>
So your commit should much better document which Busybox configurations<br>
are broken. What is the build failure you encounter? After enabling<br>
which option?<br>
<br>
From a quick look, &lt;crypt.h&gt; is included by libbb/pw_encrypt.c, which=
<br>
does:<br>
<br>
#if !ENABLE_USE_BB_CRYPT<br>
# if !defined(__FreeBSD__)<br>
#=C2=A0 include &lt;crypt.h&gt;<br>
# endif<br>
#endif<br>
<br>
So it&#39;s only if you *disable* USE_BB_CRYPT that you will have an issue<=
br>
I believe? And USE_BB_CRYPT is enabled in our default configuration.<br>
<br>
Could you please be a lot more specific/precise in your commit log? I<br>
think your change is correct, but your commit log doesn&#39;t provide a<br>
good justification for it.<br>
<br>
On my side, I confirm that I can reproduce the build issue if I disable<br>
USE_BB_CRYPT in my Busybox configuration. Is this the issue you&#39;re<br>
seeing?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000001c08a0061d60ba34--

--===============0693806687058391938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0693806687058391938==--
