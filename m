Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD5BC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01E0F400C6;
	Mon, 22 Jul 2024 13:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvTesuf0yCK9; Mon, 22 Jul 2024 13:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322FA400D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 322FA400D2;
	Mon, 22 Jul 2024 13:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B16C81BF2AF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F05D810DB
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COvmntYzoL01 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:01:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B69380C85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B69380C85
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B69380C85
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:01:57 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e05ef3aefcfso3989383276.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 06:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721653317; x=1722258117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t6m+42lDeB4VnGGjqFlDttpkLmpPad9FuonzuMH11/g=;
 b=bY5ul5j7cMFeFUAW6S6zQnuRBXpvn/NzpVv7PWrCVjeqylPfQDub+hckrSAiyUNZNb
 KiYtMghoNvxATU4oZIYKl9piw4tt4iuu6Ds5+OylYcFD4aIkdxOaZpHtpDUd+SGpMRli
 yAQ3FIyhUuGJZE6etWhZhwzr6Z3XgenAJ+Sj5S3jkeQQR2gIr4C8oY2P6H5YzwnH0B0L
 7sNo8mikiIUhS0LnSlwbApa10ztDemELKVzpZe9SkhEzJfR4dweHeOgLXqFTIePhxXQF
 flCl9m3rqRxatPMWrJQYMZgFtAdjtQ7TO9Pc5ZnhdLLW1Ty6LhNqeUPhPlNRwkHckt2v
 8+lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXm7XIgElj/cE/9gebrsoGWa7wRdig4bBvIBpjX/cA2t65SptgLoM14FA4Z7WLOa8dLB+Hx3uRbHczPwWZ4ue6O3w60hBT9g==
X-Gm-Message-State: AOJu0YyhWEy5v4i34bcSlhWD4sU6zX6FO7Jzy74zKkvJd0c4vqMrBSIt
 fBJ5GNi7UBuDPRM8YL+NH4VBs6fiZiIqMqGEL5dC59dOvEC6rR/EOReYTpjjU1cK75bRHB96uvO
 1b6Tz4g8i49B0C6IWhEaClIJ/80HK2bUL
X-Google-Smtp-Source: AGHT+IG1bnlfho5egK+8DKxNm2mcxewG3HnyP58v8ifOUP8Kmm1NTwZXMB7W/yFoYB4GUL73UN6RNQI/efxC/iANr2k=
X-Received: by 2002:a05:6902:158a:b0:e08:70e7:91d3 with SMTP id
 3f1490d57ef6-e087b95f414mr6349655276.56.1721653316390; Mon, 22 Jul 2024
 06:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240524181856.2712581-1-alexander.i.mukhin@gmail.com>
 <20240722144716.092e357b@windsurf>
In-Reply-To: <20240722144716.092e357b@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Mon, 22 Jul 2024 15:01:45 +0200
Message-ID: <CAH+XeQZrmvt7Ui7D6M2515=+W_3wTsPGVVWLcRALx+4X93Chzg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721653317; x=1722258117; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t6m+42lDeB4VnGGjqFlDttpkLmpPad9FuonzuMH11/g=;
 b=EQse5kqCqty2xKzy018GK+0hFNcXZmj/e4yVaXUSecRnD7kpoxYA29+hs5tDb+bFlY
 CsFQgjwvwJfiEclzPHzZGn9zq3aM2CLRUK/yG4kxvH1kUYVGJLR1EPrlvsC0L6ESk2oy
 e/vKNyFWe0IvTf2WPfDgDeexlLz8XKkS9FrQq2gOMornCY0HedJHy58cawbHaJTe0v0G
 FYwRC2zho1QG7qrJ9k0d3Yz53+oer79vjC3SL2lFwP2QqPuDxQC7fQyc8A7E/eMwbORl
 I3zq7dV9T5o9ydUf+XoLT13SYu4F5WG0Frq3OXDL0YTCsPW55ADPmIpUdIsEA9SapXuh
 Ft+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EQse5kqC
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.4
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2353936296634856009=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2353936296634856009==
Content-Type: multipart/alternative; boundary="000000000000599cb5061dd5a6a2"

--000000000000599cb5061dd5a6a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas, Alexander, and everyone,

Yes, indeed, the problem is due to a backported patch included in ZFS
2.2.4. That is why I haven't sent the upgrade to Buildroot yet. Instead, I
am currently working with upstream to include a fix (
https://github.com/openzfs/zfs/pull/16169). However, upstream has many
different opinions on how to resolve the issue, and they tend to change as
soon as I submit a patch (which is common in the OSS space). Once upstream
approves the patch, I will send it to Buildroot.

In the meantime, I recommend the following options:

A) Revert to the previous version (OpenZFS v2.2.3). This is not ideal for
people who have already upgraded.

B) Include a work-in-progress (it works for buildroot, I tested it) patch:
https://github.com/openzfs/zfs/pull/16169.patch.

C) Disable the test for uClibc and disable ZFS when uClibc is selected as
the toolkit.

Thoughts?

El lun, 22 jul 2024 a las 14:47, Thomas Petazzoni (<
thomas.petazzoni@bootlin.com>) escribi=C3=B3:

> Hello Alexander,
>
> I'm not sure if it's related to this version bump, or to something
> else, but the ZFS runtime test is failing:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793226
>
> Could you perhaps have a look at what's going on?
>
> Thanks a lot,
>
> Thomas
>
> On Fri, 24 May 2024 21:18:56 +0300
> Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:
>
> > Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> > ---
> >  package/zfs/zfs.hash | 4 ++--
> >  package/zfs/zfs.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
> > index 01c86f2b..9c8d4cec 100644
> > --- a/package/zfs/zfs.hash
> > +++ b/package/zfs/zfs.hash
> > @@ -1,5 +1,5 @@
> > -# From
> https://github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.sha2=
56.asc
> > -sha256
> 76bc0547d9ba31d4b0142e417aaaf9f969072c3cb3c1a5b10c8738f39ed12fc9
> zfs-2.2.2.tar.gz
> > +# From
> https://github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.sha2=
56.asc
> > +sha256
> 9790905f7683d41759418e1ef3432828c31116654ff040e91356ff1c21c31ec0
> zfs-2.2.4.tar.gz
> >
> >  # Hash for license files:
> >  sha256
> 1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
> > diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> > index 59cdd319..fa6d282f 100644
> > --- a/package/zfs/zfs.mk
> > +++ b/package/zfs/zfs.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -ZFS_VERSION =3D 2.2.2
> > +ZFS_VERSION =3D 2.2.4
> >  ZFS_SITE =3D
> https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
> >  ZFS_SELINUX_MODULES =3D zfs
> >  ZFS_LICENSE =3D CDDL
>
>
>
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000599cb5061dd5a6a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p>Hello Thomas, Alexander, and everyone,=
</p><p>Yes, indeed, the problem is due to a backported patch included in ZF=
S 2.2.4. That is why I haven&#39;t sent the upgrade to Buildroot yet. Inste=
ad, I am currently working with upstream to include a fix (<a href=3D"https=
://github.com/openzfs/zfs/pull/16169">https://github.com/openzfs/zfs/pull/1=
6169</a>). However, upstream has many different opinions on how to resolve =
the issue, and they tend to change as soon as I submit a patch (which is co=
mmon in the OSS space). Once upstream approves the patch, I will send it to=
 Buildroot.</p><p>In the meantime, I recommend the following options:</p><p=
>A) Revert to the previous version (OpenZFS v2.2.3). This is not ideal for =
people who have already upgraded.</p><p>B) Include a work-in-progress (it w=
orks for buildroot, I tested it) patch: <a rel=3D"noreferrer" href=3D"https=
://github.com/openzfs/zfs/pull/16169.patch">https://github.com/openzfs/zfs/=
pull/16169.patch</a>.</p><p>C) Disable the test for uClibc and disable ZFS =
when uClibc is selected as the toolkit.</p><p>Thoughts?</p></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El lun, 22 jul 2=
024 a las 14:47, Thomas Petazzoni (&lt;<a href=3D"mailto:thomas.petazzoni@b=
ootlin.com">thomas.petazzoni@bootlin.com</a>&gt;) escribi=C3=B3:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hello Alexander,<br>
<br>
I&#39;m not sure if it&#39;s related to this version bump, or to something<=
br>
else, but the ZFS runtime test is failing:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793=
226" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/=
buildroot/-/jobs/7391793226</a><br>
<br>
Could you perhaps have a look at what&#39;s going on?<br>
<br>
Thanks a lot,<br>
<br>
Thomas<br>
<br>
On Fri, 24 May 2024 21:18:56 +0300<br>
Alexander Mukhin &lt;<a href=3D"mailto:alexander.i.mukhin@gmail.com" target=
=3D"_blank">alexander.i.mukhin@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Alexander Mukhin &lt;<a href=3D"mailto:alexander.i.mukh=
in@gmail.com" target=3D"_blank">alexander.i.mukhin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/zfs/zfs.hash | 4 ++--<br>
&gt;=C2=A0 package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash<br>
&gt; index 01c86f2b..9c8d4cec 100644<br>
&gt; --- a/package/zfs/zfs.hash<br>
&gt; +++ b/package/zfs/zfs.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; -# From <a href=3D"https://github.com/openzfs/zfs/releases/download/zf=
s-2.2.2/zfs-2.2.2.sha256.asc" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.sha256.asc</a>=
<br>
&gt; -sha256=C2=A0 76bc0547d9ba31d4b0142e417aaaf9f969072c3cb3c1a5b10c8738f3=
9ed12fc9=C2=A0 zfs-2.2.2.tar.gz<br>
&gt; +# From <a href=3D"https://github.com/openzfs/zfs/releases/download/zf=
s-2.2.4/zfs-2.2.4.sha256.asc" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.sha256.asc</a>=
<br>
&gt; +sha256=C2=A0 9790905f7683d41759418e1ef3432828c31116654ff040e91356ff1c=
21c31ec0=C2=A0 zfs-2.2.4.tar.gz<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Hash for license files:<br>
&gt;=C2=A0 sha256=C2=A0 1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc11=
5f700427d9520=C2=A0 LICENSE<br>
&gt; diff --git a/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" =
target=3D"_blank">zfs.mk</a> b/package/zfs/<a href=3D"http://zfs.mk" rel=3D=
"noreferrer" target=3D"_blank">zfs.mk</a><br>
&gt; index 59cdd319..fa6d282f 100644<br>
&gt; --- a/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a><br>
&gt; +++ b/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -ZFS_VERSION =3D 2.2.2<br>
&gt; +ZFS_VERSION =3D 2.2.4<br>
&gt;=C2=A0 ZFS_SITE =3D <a href=3D"https://github.com/openzfs/zfs/releases/=
download/zfs-$(ZFS_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)</a><br>
&gt;=C2=A0 ZFS_SELINUX_MODULES =3D zfs<br>
&gt;=C2=A0 ZFS_LICENSE =3D CDDL<br>
<br>
<br>
<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000599cb5061dd5a6a2--

--===============2353936296634856009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2353936296634856009==--
