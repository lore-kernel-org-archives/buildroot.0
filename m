Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8A9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5CD8453E;
	Wed, 30 Mar 2022 07:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7f4txDqs5cA; Wed, 30 Mar 2022 07:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9DA38453A;
	Wed, 30 Mar 2022 07:19:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C40201BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF52F41BA6
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0jUrEZfbcbJ for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1A1F41B99
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:19:18 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id v35so35474398ybi.10
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pY8mFq3R7VVEWDPZX48f70SOIXckqlfbvGfpYAzJyLk=;
 b=ib+9wYYrxcmYj4hxZTYjA4N57YVLFqZ1c64T4sDxQ5A16m+Un3dBNNPh1N6y/lmj0F
 wOcyIL5G3OOQqJDq9Wi8K7bVWR/4v6GR5AJrVWflQFydx812gc5TeCzHHNxcuOs0sQ5d
 Kk+qy7hMrqfMJ28m0HUFT74Dp+qTDMunl7aTZESfcnbOqyVQlcVq0eohWyfpv3S/KbGN
 8uzZGCUJblnPp7Hfh+06geC0rD+tbh3gC/Xv2lWD80Tv9hlX4sqR9QORRt2SAYxFbQC9
 avnr30z7elxZwgEQQNESSLOAZR3/PmKaBv7NjX/u/XCN9Oit9ArpYGGHCbQpUusm5Itw
 CwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pY8mFq3R7VVEWDPZX48f70SOIXckqlfbvGfpYAzJyLk=;
 b=mOHrwk9BUwMDsZsaz4Kz5DzfdtG+efFX+PNWmpYhNt4qJWnoNYCi13qJ+R6YKpRxN8
 qaaEK9AtW8pNPkwT35TgG0useZxgyI4dRedi4cbpQWx0E6e775nEnNKJpVmbKY8Ez3u3
 wNxrUvM8Ram86FLzcUzW5t18WRLrXcc0kLxHKrQH5s1QGst3Tu07LY7yJMZQT4nTZ7mN
 WR88Ci/nDZx8ge6GInZYeqvd9QcramUBtm38KINr4mL58RYfi92RoUGROwbjlpUe3eF7
 En24GKDsEPorNYbFSXarZ3KQr80snbs6mTJh2bb93N8yNy8Iks2TPysS6Xk3dts1opyF
 9xNQ==
X-Gm-Message-State: AOAM532EdgmBOetrPbrEjIYqkm5uktEh5I3edke46C1m7y+7+EsDcotM
 QstwVA7wPAHn4S0RPHGXAXSo18J3X3FMdlPlh51wEfh47FE=
X-Google-Smtp-Source: ABdhPJz++b9dltku1ZmSczbO2sLrwUZFjyS4HvVgf1O1GZSC2OIKDXY2Dw6JKcRtFrRo6ZIzWH3wlf8GyIY9nTOkb50=
X-Received: by 2002:a25:51c8:0:b0:633:91ae:c476 with SMTP id
 f191-20020a2551c8000000b0063391aec476mr29985761ybb.337.1648624757658; Wed, 30
 Mar 2022 00:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
In-Reply-To: <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 30 Mar 2022 04:19:06 -0300
Message-ID: <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517
 purelib deployment path
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4265922242062040336=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4265922242062040336==
Content-Type: multipart/alternative; boundary="0000000000000c57bc05db6a5d38"

--0000000000000c57bc05db6a5d38
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 4:07 AM James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Tue, Mar 29, 2022 at 10:06 PM Emile Cormier
> <emile.cormier.jr@gmail.com> wrote:
> >
> > - --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> \
> > +
> --purelib=$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> >   --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> >   --scripts=$(HOST_DIR)/usr/bin \
> >   --data=$(HOST_DIR)/usr
>
> For the host I think all these paths should not be under /usr.
>

For me output/host/usr is a simlink to output/host:
ls -l output/host
total 48
drwxr-xr-x  3 emile emile  4096 Mar 30 01:27 arm-buildroot-linux-gnueabihf
drwxr-xr-x  2 emile emile 12288 Mar 30 01:40 bin
drwxr-xr-x  3 emile emile  4096 Mar 30 01:38 doc
drwxr-xr-x  5 emile emile  4096 Mar 30 01:40 etc
drwxr-xr-x 19 emile emile  4096 Mar 30 01:39 include
drwxr-xr-x  7 emile emile  4096 Mar 30 01:39 lib
lrwxrwxrwx  1 emile emile     3 Mar 30 01:27 lib64 -> lib
drwxr-xr-x  2 emile emile  4096 Mar 30 01:32 libexec
drwxr-xr-x  3 emile emile  4096 Mar 30 01:28 opt
drwxr-xr-x  2 emile emile  4096 Mar 30 01:29 sbin
drwxr-xr-x 22 emile emile  4096 Mar 30 01:38 share
lrwxrwxrwx  1 emile emile     1 Mar 30 01:27 usr -> .

--0000000000000c57bc05db6a5d38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:07 AM James=
 Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, Mar 29, 2022 at 10:06 PM Emile Cormier<br>
&lt;<a href=3D"mailto:emile.cormier.jr@gmail.com" target=3D"_blank">emile.c=
ormier.jr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; - --purelib=3D$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-pack=
ages \<br>
&gt; + --purelib=3D$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-=
packages \<br>
&gt;=C2=A0 =C2=A0--headers=3D$(HOST_DIR)/usr/include/python$(PYTHON3_VERSIO=
N_MAJOR)=C2=A0 \<br>
&gt;=C2=A0 =C2=A0--scripts=3D$(HOST_DIR)/usr/bin \<br>
&gt;=C2=A0 =C2=A0--data=3D$(HOST_DIR)/usr<br>
<br>
For the host I think all these paths should not be under /usr.<br>
</blockquote><div><br></div><div>For me output/host/usr is a simlink to out=
put/host:</div><div>ls -l output/host<br>total 48<br>drwxr-xr-x =C2=A03 emi=
le emile =C2=A04096 Mar 30 01:27 arm-buildroot-linux-gnueabihf<br>drwxr-xr-=
x =C2=A02 emile emile 12288 Mar 30 01:40 bin<br>drwxr-xr-x =C2=A03 emile em=
ile =C2=A04096 Mar 30 01:38 doc<br>drwxr-xr-x =C2=A05 emile emile =C2=A0409=
6 Mar 30 01:40 etc<br>drwxr-xr-x 19 emile emile =C2=A04096 Mar 30 01:39 inc=
lude<br>drwxr-xr-x =C2=A07 emile emile =C2=A04096 Mar 30 01:39 lib<br>lrwxr=
wxrwx =C2=A01 emile emile =C2=A0 =C2=A0 3 Mar 30 01:27 lib64 -&gt; lib<br>d=
rwxr-xr-x =C2=A02 emile emile =C2=A04096 Mar 30 01:32 libexec<br>drwxr-xr-x=
 =C2=A03 emile emile =C2=A04096 Mar 30 01:28 opt<br>drwxr-xr-x =C2=A02 emil=
e emile =C2=A04096 Mar 30 01:29 sbin<br>drwxr-xr-x 22 emile emile =C2=A0409=
6 Mar 30 01:38 share<br>lrwxrwxrwx =C2=A01 emile emile =C2=A0 =C2=A0 1 Mar =
30 01:27 usr -&gt; .<br></div></div></div>

--0000000000000c57bc05db6a5d38--

--===============4265922242062040336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4265922242062040336==--
