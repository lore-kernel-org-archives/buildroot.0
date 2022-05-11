Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0653C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 15:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63311415BD;
	Wed, 11 May 2022 15:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCYmrJqhBsg0; Wed, 11 May 2022 15:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA4140868;
	Wed, 11 May 2022 15:03:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5A31BF3C1
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A8C7610F1
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kcdJzrcs2VD for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 15:03:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B8D6610EA
 for <buildroot@buildroot.org>; Wed, 11 May 2022 15:03:26 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so5183048pjv.4
 for <buildroot@buildroot.org>; Wed, 11 May 2022 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HY/tIsaGlw95FrrwtzB4N1Q3Tvvrcb0HcN3Yl4NRXU0=;
 b=LTJCh6RkJZjj9jrsN3ZI7eqMiW3YUsMufqYGzM2KpKuqF4ceghuXoPaj/eIWcGXcXP
 jK204E+odmcS7kSUzM+GwGX0SSBgaMQBTjpfsNjyUT89RY8CDwKjIg8dvad5HjFiAgst
 nFS6wa5MSRfu53sQQEWDAp08zUGUBn4i4I/2ClL/YkiNR/ZdLat/jO5+St4kWSu24riG
 05XCP/01wgv6R/Hq6nc/K1mFOjnXXq3XA/yzUzmHdsB7Y4U3cE2T+A51PtUMr3FgYZli
 /i+rtMDeTnqSZJ2RKGMwhFPuQRR+HSXYWLthjMrCSo6ZNuDJ5nzzJeEnbBvlC8TXQHn4
 sekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HY/tIsaGlw95FrrwtzB4N1Q3Tvvrcb0HcN3Yl4NRXU0=;
 b=7/gxandcucx5qnBStI97tUtVofO9dstfVZSxkx+fcb+P2FjFwx9lXioYpHxFQmSDbH
 wcpFBvlXDArr2i/7XTzkSxyNZ8Qt9ZZ7/5QsKau6NEUNAFNL/Nyy5LFDjeDiTzxynXZa
 GsKAI6RFcrTD/NRyYHruAZuxzJl1iU1PxNaTpg1sOmKQoyvRGgcxZtiUCQX6L4ZS4z+s
 5kTU9TSpKveYrnNQrLUIggH2km4VjQYcIwRpEuxh5a408lrV5zXm6zo2/TQzQouZQf4q
 x+nZdBcVR1y+gZx2EpKYCc5Ef0EJwSl/q03v4MQwBshUS6CEYOOS3tCPNBehUTA7yQHi
 z/nA==
X-Gm-Message-State: AOAM53163mtyCr/o9OR7luqH41PYvAHzjwn3OfSYGwmRsFD5vWDte0H6
 lhVyB3uBM+ICu6IQPiepJq59PSFMm64uEmXGuE5SaV52
X-Google-Smtp-Source: ABdhPJzaFz/Lldy7Mp24N98YgcRi7kFrKbdGlJLIFBuz4XqT3OL7I1cI5PITZnrnGr4sXCEVrW5wlou0qJZ+PxMWlC8=
X-Received: by 2002:a17:90b:30c3:b0:1dc:b6d7:58d3 with SMTP id
 hi3-20020a17090b30c300b001dcb6d758d3mr5791544pjb.172.1652281405389; Wed, 11
 May 2022 08:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220509171602.18228-1-discher.kyle@gmail.com>
In-Reply-To: <20220509171602.18228-1-discher.kyle@gmail.com>
From: Kyle Discher <discher.kyle@gmail.com>
Date: Wed, 11 May 2022 08:03:13 -0700
Message-ID: <CAPa6QFar5zopEzDpJvz_aO9Q-yK20EZrT=aA+gb=bMrxcELNYg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to 16.15.0
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
Content-Type: multipart/mixed; boundary="===============0090721197466138824=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0090721197466138824==
Content-Type: multipart/alternative; boundary="0000000000003cbed405debdbe75"

--0000000000003cbed405debdbe75
Content-Type: text/plain; charset="UTF-8"

Oops, I forgot:
Signed-off-by: Kyle Discher <discher.kyle@gmail.com>

On Mon, May 9, 2022, 10:16 AM Kyle Discher <discher.kyle@gmail.com> wrote:

> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 6365ef852b..998229341e 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v14.18.3/SHASUMS256.txt
> -sha256  783ac443cd343dd6c68d2abcf7e59e7b978a6a428f6a6025f9b84918b769d608
> node-v14.18.3.tar.xz
> +# From https://nodejs.org/dist/v16.15.0/SHASUMS256.txt
> +sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7
> node-v16.15.0.tar.xz
>
>  # Hash for license file
>  sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5
> LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 4fe34e0aad..6dcaf34aa4 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -NODEJS_VERSION = 14.18.3
> +NODEJS_VERSION = 16.15.0
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs
> c-ares \
> --
> 2.36.1
>
>

--0000000000003cbed405debdbe75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-size:12.8px">Oops, I forgot:</span><b=
r style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">Signed-off-by=
: Kyle Discher &lt;<a href=3D"mailto:discher.kyle@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">discher.kyle@gmail.com</a>&gt;</span><br style=3D"fo=
nt-size:12.8px"></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 9, 2022, 10:16 AM Kyle Discher &lt;<a href=3D"m=
ailto:discher.kyle@gmail.com" target=3D"_blank" rel=3D"noreferrer">discher.=
kyle@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">---<b=
r>
=C2=A0package/nodejs/nodejs.hash | 4 ++--<br>
=C2=A0package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer norefer=
rer noreferrer" target=3D"_blank">nodejs.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash<br>
index 6365ef852b..998229341e 100644<br>
--- a/package/nodejs/nodejs.hash<br>
+++ b/package/nodejs/nodejs.hash<br>
@@ -1,5 +1,5 @@<br>
-# From <a href=3D"https://nodejs.org/dist/v14.18.3/SHASUMS256.txt" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://nodejs.org/dist=
/v14.18.3/SHASUMS256.txt</a><br>
-sha256=C2=A0 783ac443cd343dd6c68d2abcf7e59e7b978a6a428f6a6025f9b84918b769d=
608=C2=A0 node-v14.18.3.tar.xz<br>
+# From <a href=3D"https://nodejs.org/dist/v16.15.0/SHASUMS256.txt" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://nodejs.org/dist=
/v16.15.0/SHASUMS256.txt</a><br>
+sha256=C2=A0 a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea=
4f7=C2=A0 node-v16.15.0.tar.xz<br>
<br>
=C2=A0# Hash for license file<br>
=C2=A0sha256=C2=A0 b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac47=
27f63be5=C2=A0 LICENSE<br>
diff --git a/package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer =
noreferrer noreferrer" target=3D"_blank">nodejs.mk</a> b/package/nodejs/<a =
href=3D"http://nodejs.mk" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">nodejs.mk</a><br>
index 4fe34e0aad..6dcaf34aa4 100644<br>
--- a/package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer norefer=
rer noreferrer" target=3D"_blank">nodejs.mk</a><br>
+++ b/package/nodejs/<a href=3D"http://nodejs.mk" rel=3D"noreferrer norefer=
rer noreferrer" target=3D"_blank">nodejs.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-NODEJS_VERSION =3D 14.18.3<br>
+NODEJS_VERSION =3D 16.15.0<br>
=C2=A0NODEJS_SOURCE =3D node-v$(NODEJS_VERSION).tar.xz<br>
=C2=A0NODEJS_SITE =3D <a href=3D"http://nodejs.org/dist/v$(NODEJS_VERSION)"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://nodejs.o=
rg/dist/v$(NODEJS_VERSION)</a><br>
=C2=A0NODEJS_DEPENDENCIES =3D host-qemu host-pkgconf host-python3 host-node=
js c-ares \<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div>

--0000000000003cbed405debdbe75--

--===============0090721197466138824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0090721197466138824==--
