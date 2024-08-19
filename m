Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F4BC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8689C607BA;
	Mon, 19 Aug 2024 08:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xsqn6K2Wx_6L; Mon, 19 Aug 2024 08:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BCE2607DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BCE2607DE;
	Mon, 19 Aug 2024 08:46:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 918631BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FDD7404A3
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4j_ZYvIWFBX for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:46:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A3D640132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3D640132
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A3D640132
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:46:19 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4f6b7250d6dso1636292e0c.0
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 01:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724057178; x=1724661978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6pHLngEVhnXpavIgGH2Vfq8hwYWwj/WEQ+WMVKyhwmo=;
 b=v8x7+Pfolw3KYafxh4DfJp0dtl5DKt2aU/qi255Kt+e6EMx/41rahR2qykhRylnJl9
 FFlk9mv4At0zBCZCrX1oPdaqypZyBIqmZJ2hs9R9mwKX+PyyjMprYIDvi3ELMDmuZ2Tg
 +k+UgJw5k59MJCG2hl9MzTRERxNb9zci9Bj1w3elEi+bfpQGEtvG2DzP0M3twgMfUFuD
 727R+9QXbeiCNwA9DsVDG93VZlEkumctHVSHxR1O6Y+IzWMwGKpS9tC/Bb1lVfhKytUm
 ZWZ+yGYy6J+Vmtzz6i/2t2rniOsR4DF+mI6/weVMa+yiySAHlubT1WA3vNr7O4yedw3i
 l2mw==
X-Gm-Message-State: AOJu0YzdGdQo1u7L7QZxMUMyUbuLbC68bnPKEH0bHLj3D3BJNJPpfL9N
 uV1IukC9t24mNHP2VgUCrB2WmFBLIdZCe2KAen7XpGdKIVTfdYMOIebEIfJWJtYcEzVKMJAS4KL
 BnYm4eZGxcOJ/N6QzSfuS97+c/d4oMknfizM=
X-Google-Smtp-Source: AGHT+IHJq4dk0v2d1XrfLzsT8hy3BhZflKBM+8bopM6cgZUa1vXaLdYne/17aWwIhnrqzhtKnDOwln+Za5LR5orORk8=
X-Received: by 2002:a05:6122:c96:b0:4f5:1978:d226 with SMTP id
 71dfb90a1353d-4fc6c5abfe1mr10942688e0c.3.1724057177755; Mon, 19 Aug 2024
 01:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240819040213.3563422-1-james.hilliard1@gmail.com>
 <20240819102733.13fccbc0@windsurf>
 <CADvTj4pX3pQQavPnVyzR+R92DsjjJ0+SBoD8wXuhBk4drJmFrA@mail.gmail.com>
 <20240819103954.5810fdd8@windsurf>
In-Reply-To: <20240819103954.5810fdd8@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 19 Aug 2024 02:46:06 -0600
Message-ID: <CADvTj4qJJ1f6R2t7+i4krED4m461VS0zFm=pyfmzcwYWG_QZMg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724057178; x=1724661978; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6pHLngEVhnXpavIgGH2Vfq8hwYWwj/WEQ+WMVKyhwmo=;
 b=PzJgEhWO5zxBMbIWas2bw8jzuzLXhK7IIqyVVSN5Gm0HtQpZ1rDS38Px8R/u7U10Ec
 xqfBsD64wq72zwyPmYvggjB6p45jisUZtdGD7ZPOdhrFzwAeJWqjjrIKqMpaDoYaYgrN
 jPG5yFhpFnFr32kIYb6BPSmyQDZIZ+EFqhBjFFNg9BbrYsE79gVEOLigBUzBA7ZVh2Jv
 DK84zOQaLVuQp/dCZAwNgbr0fw/MlKp5tNsrX7NLid3MkyhS/9mQkB4K4pDckVIHX/Zb
 /y3gs9FFUd+jclTLvivULRtAYAUGztg3pNYxmS0zESbwKuoYh//kRGlIBgRlDEDZypph
 2A7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PzJgEhWO
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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
Content-Type: multipart/mixed; boundary="===============7518573471723772087=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7518573471723772087==
Content-Type: multipart/alternative; boundary="000000000000a71a09062005575d"

--000000000000a71a09062005575d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 2:39=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello James,
>
> On Mon, 19 Aug 2024 02:31:02 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > Is this fixing a build issue? If so, which one, which defconfig? Or
> > > perhaps an autobuilder failure reference?
> >
> > It fixes an issue where the flashlib cli was not being built at all,
> > only the library was for BR2_SHARED_LIBS systems.
>
> So there is no build issue, but parts that are expect to be built are
> not built?
>

This fixes the bug which was the reason the cli was originally disabled.


>
> > > When was this problem introduced?
> >
> > When bumping flashrom to version 1.4.0-rc2:
> >
> https://github.com/buildroot/buildroot/commit/8637884057ddc3c1aeb9f0dd285=
fc6fcf378c26b
>
> Thanks. Could you clarify both aspects in the commit log?
>

Added some more details in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20240819084352.905082-=
1-james.hilliard1@gmail.com/


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000a71a09062005575d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Aug 19, 2024 at 2:39=E2=80=AFAM T=
homas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.=
petazzoni@bootlin.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello James,<br>
<br>
On Mon, 19 Aug 2024 02:31:02 -0600<br>
James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_=
blank">james.hilliard1@gmail.com</a>&gt; wrote:<br>
<br>
&gt; &gt; Is this fixing a build issue? If so, which one, which defconfig? =
Or<br>
&gt; &gt; perhaps an autobuilder failure reference?<br>
&gt; <br>
&gt; It fixes an issue where the flashlib cli was not being built at all,<b=
r>
&gt; only the library was for BR2_SHARED_LIBS systems.<br>
<br>
So there is no build issue, but parts that are expect to be built are<br>
not built?<br></blockquote><div><br></div><div>This fixes the bug which was=
 the reason the cli was originally disabled.<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; When was this problem introduced?<br>
&gt; <br>
&gt; When bumping flashrom to version 1.4.0-rc2:<br>
&gt; <a href=3D"https://github.com/buildroot/buildroot/commit/8637884057ddc=
3c1aeb9f0dd285fc6fcf378c26b" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/buildroot/buildroot/commit/8637884057ddc3c1aeb9f0dd285fc6fcf378c2=
6b</a><br>
<br>
Thanks. Could you clarify both aspects in the commit log?<br></blockquote><=
div><br></div><div>Added some more details in v2:</div><div><a href=3D"http=
s://patchwork.ozlabs.org/project/buildroot/patch/20240819084352.905082-1-ja=
mes.hilliard1@gmail.com/">https://patchwork.ozlabs.org/project/buildroot/pa=
tch/20240819084352.905082-1-james.hilliard1@gmail.com/</a></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000a71a09062005575d--

--===============7518573471723772087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7518573471723772087==--
