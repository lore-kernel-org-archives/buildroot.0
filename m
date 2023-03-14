Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA3AC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF758140B;
	Tue, 14 Mar 2023 07:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF758140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11ULyU4y8ikj; Tue, 14 Mar 2023 07:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B45AB81429;
	Tue, 14 Mar 2023 07:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B45AB81429
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7C0E1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FF8460BD0
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF8460BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LopwtUM6VxmL for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:25:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99DB060ACE
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99DB060ACE
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:25:39 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id c10so9075896pfv.13
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 00:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678778739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eaaLWopQpHkDp0exR8oea/lGrgnCUFgQpNrkB/VooX4=;
 b=dgiI4meJCxSqp3tsmAz8nkfkAuDStgnjRyNkRSLtMJEWNYRsk34AJjgxKi1KaDkq7g
 wmquNdZcDNujKua61dR/YWmiMpzMhe7cMxhkxXkj27cQVDWVnWS9XmqK6tpBpVsSvP/H
 i5ZdCkKpxsxQ3WEKAntTfkgQBKFXfI+3wD7Fjz5D+OcxseSRzuqN4lWXySuIducSGk/b
 mXAo/meF0swgzv2e1sxceuVKPZOqhvmREPbU5nn3UMiMzM0aenK2MwI3bejNfnMx3qq/
 BzuJE1gd2ggGZvm8DV3FvEhSffF/QgJsYcUqU5rz1SC+Rk8Jy5dipBAh3zx1/MWoclbk
 sJJQ==
X-Gm-Message-State: AO0yUKV9F4t05zDIXaH/rcCrFIlhBE+bc+TYDmjnhoNr/DFit8Ib/IUd
 YXDx85c55EdI5idQU80yQVjTMDpOjjSZDR+uOJShWadrvs6ANsjD
X-Google-Smtp-Source: AK7set/GtY0QIlfF0f1+cOrXRdG2ExY73WhVWux/Qg2lGrFCGyiGyDXTuRusQ4u/EEdFNyQl9hcsBbYIYs5YPAK0c4g=
X-Received: by 2002:a63:2950:0:b0:4fd:5105:eb93 with SMTP id
 bu16-20020a632950000000b004fd5105eb93mr12247710pgb.3.1678778738626; Tue, 14
 Mar 2023 00:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230313183235.2665-1-roman.passler@gmail.com>
 <20230313225431.45802c0f@windsurf>
In-Reply-To: <20230313225431.45802c0f@windsurf>
From: roman <roman.passler@gmail.com>
Date: Tue, 14 Mar 2023 08:25:27 +0100
Message-ID: <CAJYrM9Kk8tG2x4Zpv_OPH0kQCvrv6ddgBbe7SX1S1xnKdFCH+w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678778739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eaaLWopQpHkDp0exR8oea/lGrgnCUFgQpNrkB/VooX4=;
 b=avjX5TGs8O7mt0qBIglTGF9GDJDnxO6L3vuas82Ib7WkcDjsVTueP0t2W9TBd/AShL
 SyCsCe5odTnqHZRcB3S5A1uogjI/VP0aqaQWRwXKqYifWBYK2YHprVVbDNCunoGxVwFS
 OrGOqrLV/D60FrSTTEGHMVz76laVxDxFUaU5sapOWPJjqI5sOO9+VEatsuTK0Y/X0rBE
 NlCqUM1Rk3JF0icdWMNUU1V+/aow2s6eVJGbgOJNF5lprbjAdQrBg29ZW2QKmUVCuLqL
 KXzCwJuT9uGEztBIve/LZwvoBcz5eb31nUZlc8SvTeros/W/kn/KIO66e5jkqW9sUraJ
 mnyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=avjX5TGs
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: bump to 0.12.0
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
Content-Type: multipart/mixed; boundary="===============8761242915938383203=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8761242915938383203==
Content-Type: multipart/alternative; boundary="0000000000005f567205f6d722d4"

--0000000000005f567205f6d722d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Thank you for your fast respond.

> Could you please add an explanation in the commit log about why the
> hash of the license file is changed?
>
> Indeed, we precisely have such hashes to detect changes in the
> licensing terms, analyze them and check how they affect the overall
> licensing of the package. So if the hash is "blindly" changed, having a
> hash doesn't make sense in the first place. Therefore, we ask to have a
> short note in the commit log that justifies the change of license file
> hash.
The license files have been relocated to the LICENSES/* directory (availabl=
e
at https://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/LICENSES/).
The license files have been moved to the LICENSES/* directory, which can be
found at https://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/LICENSES/.
Should they be added to the hash file, or is the COPYING file at
https://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/COPYING sufficient?

Thanks,
Roman

Am Mo., 13. M=C3=A4rz 2023 um 22:54 Uhr schrieb Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roman,
>
> Thanks for your contribution! Some comments below.
>
> On Mon, 13 Mar 2023 19:32:35 +0100
> Roman Passler <roman.passler@gmail.com> wrote:
>
> > Change-Id: Ie76a4f365af3f59c80241fe4935129d1098b140d
>
> Not a big deal, but we don't need/want a Change-Id in commit logs of
> Buildroot commits. If you can easily avoid adding one, it would be
> great.
>
> > Signed-off-by: Roman Passler <roman.passler@gmail.com>
> > ---
> >  package/openocd/openocd.hash | 6 +++---
> >  package/openocd/openocd.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.has=
h
> > index 91eb56d930..325f55bf04 100644
> > --- a/package/openocd/openocd.hash
> > +++ b/package/openocd/openocd.hash
> > @@ -1,3 +1,3 @@
> > -# From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
> > -sha256
> 43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d
> openocd-0.11.0.tar.bz2
> > -sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > +# From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/
> > +sha256
> af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa
> openocd-0.12.0.tar.bz2
> > +sha256
> 1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING
>
> Could you please add an explanation in the commit log about why the
> hash of the license file is changed?
>
> Indeed, we precisely have such hashes to detect changes in the
> licensing terms, analyze them and check how they affect the overall
> licensing of the package. So if the hash is "blindly" changed, having a
> hash doesn't make sense in the first place. Therefore, we ask to have a
> short note in the commit log that justifies the change of license file
> hash.
>
> Could you have a look into this, and send a 2nd version?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000005f567205f6d722d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<div><br></div><div>Thank you for your fast r=
espond.<br><br>&gt; Could you please add an explanation in the commit log a=
bout why the<br>&gt; hash of the license file is changed?<br>&gt;<br>&gt; I=
ndeed, we precisely have such hashes to detect changes in the<br>&gt; licen=
sing terms, analyze them and check how they affect the overall<br>&gt; lice=
nsing of the package. So if the hash is &quot;blindly&quot; changed, having=
 a<br>&gt; hash doesn&#39;t make sense in the first place. Therefore, we as=
k to have a<br>&gt; short note in the commit log that justifies the change =
of license file<br>&gt; hash.<br>The license files have been relocated to t=
he LICENSES/* directory (available<br>at <a href=3D"https://sourceforge.net=
/p/openocd/code/ci/v0.12.0/tree/LICENSES/">https://sourceforge.net/p/openoc=
d/code/ci/v0.12.0/tree/LICENSES/</a>).<br>The license files have been moved=
 to the LICENSES/* directory, which can be</div><div>found at <a href=3D"ht=
tps://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/LICENSES/">https://sou=
rceforge.net/p/openocd/code/ci/v0.12.0/tree/LICENSES/</a>.</div><div>Should=
 they be added to the hash file, or is the COPYING file at</div><div><a hre=
f=3D"https://sourceforge.net/p/openocd/code/ci/v0.12.0/tree/COPYING">https:=
//sourceforge.net/p/openocd/code/ci/v0.12.0/tree/COPYING</a> sufficient?<br=
><br>Thanks,<br>Roman<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Am Mo., 13. M=C3=A4rz 2023 um 22:54=C2=A0Uhr=
 schrieb Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.co=
m">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hello Roman,<br>
<br>
Thanks for your contribution! Some comments below.<br>
<br>
On Mon, 13 Mar 2023 19:32:35 +0100<br>
Roman Passler &lt;<a href=3D"mailto:roman.passler@gmail.com" target=3D"_bla=
nk">roman.passler@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Change-Id: Ie76a4f365af3f59c80241fe4935129d1098b140d<br>
<br>
Not a big deal, but we don&#39;t need/want a Change-Id in commit logs of<br=
>
Buildroot commits. If you can easily avoid adding one, it would be<br>
great.<br>
<br>
&gt; Signed-off-by: Roman Passler &lt;<a href=3D"mailto:roman.passler@gmail=
.com" target=3D"_blank">roman.passler@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/openocd/openocd.hash | 6 +++---<br>
&gt;=C2=A0 package/openocd/<a href=3D"http://openocd.mk" rel=3D"noreferrer"=
 target=3D"_blank">openocd.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.ha=
sh<br>
&gt; index 91eb56d930..325f55bf04 100644<br>
&gt; --- a/package/openocd/openocd.hash<br>
&gt; +++ b/package/openocd/openocd.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt; -# From <a href=3D"http://sourceforge.net/projects/openocd/files/openo=
cd/0.11.0/" rel=3D"noreferrer" target=3D"_blank">http://sourceforge.net/pro=
jects/openocd/files/openocd/0.11.0/</a><br>
&gt; -sha256=C2=A0 43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b0=
6b3d1e7d=C2=A0 openocd-0.11.0.tar.bz2<br>
&gt; -sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a40401052=
1b880643=C2=A0 COPYING<br>
&gt; +# From <a href=3D"http://sourceforge.net/projects/openocd/files/openo=
cd/0.12.0/" rel=3D"noreferrer" target=3D"_blank">http://sourceforge.net/pro=
jects/openocd/files/openocd/0.12.0/</a><br>
&gt; +sha256=C2=A0 af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f60=
43075afa=C2=A0 openocd-0.12.0.tar.bz2<br>
&gt; +sha256=C2=A0 1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503=
a9a88419=C2=A0 COPYING<br>
<br>
Could you please add an explanation in the commit log about why the<br>
hash of the license file is changed?<br>
<br>
Indeed, we precisely have such hashes to detect changes in the<br>
licensing terms, analyze them and check how they affect the overall<br>
licensing of the package. So if the hash is &quot;blindly&quot; changed, ha=
ving a<br>
hash doesn&#39;t make sense in the first place. Therefore, we ask to have a=
<br>
short note in the commit log that justifies the change of license file<br>
hash.<br>
<br>
Could you have a look into this, and send a 2nd version?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000005f567205f6d722d4--

--===============8761242915938383203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8761242915938383203==--
