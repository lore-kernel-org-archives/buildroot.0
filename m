Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E208EC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F5E81A6A;
	Sun, 19 Mar 2023 16:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77F5E81A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eTm0Bwrk0A8G; Sun, 19 Mar 2023 16:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC71581A65;
	Sun, 19 Mar 2023 16:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC71581A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61DD21BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4759F40988
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4759F40988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFEx_FFYPrwe for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC29140985
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC29140985
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:22:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id er8so26398749edb.0
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 09:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679242946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F6j7tPUgRH6ZyEq5E0PRbM13D8CREsL7FiQHt/lHYWY=;
 b=aMAFZUWrK35iaMpsjmLa+UMAE3m2S3YrKUfGvEDOlvZb+5U4e2TrLuA00nGDXfy2Qh
 qJGGZrjmJNB81kVacubg6i211K9cltTNeqzZGD/FjLeLxWdXruqdMHWCMRhCYNaTIEbg
 t0pSJwBCM7S9lRfaKunjNBiC54BsnDOV7BSbrpR30xSYz9JhYUN3nQCorYyfAYjLhXm1
 xQVaVEI78+RbT8nRrragxolRwW/VAbzBkNUvE65WX74Zu705ba9HecDoR5h9HJht8wr6
 FPp0Z/0G0oDT6hLqwYaSMZzB0H/Id6I35+0bGqlB+5XXYux9eEZrPnp2tlryRn3f5BEa
 AExA==
X-Gm-Message-State: AO0yUKUfeGUu5mi3hKuA2YqyhEE6OcWe7UQYegG6s37BxvczNYQI4nx0
 ieYZg5lZj78GzYvL/xh/2G9PWoHJDgEAkeRzHrGySJaQCUqGSQ==
X-Google-Smtp-Source: AK7set/qohvI4D67xrAz3W7F7mv1rVua2xz1tFeMm7p64Z0ZqoZCqh3RQppxboC7HItfwtPCodxc9jlu0YnVZIA70Nc=
X-Received: by 2002:a17:906:9615:b0:931:2bcd:ee00 with SMTP id
 s21-20020a170906961500b009312bcdee00mr2714979ejx.15.1679242945733; Sun, 19
 Mar 2023 09:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230319121659.88039-1-giulio.benetti@benettiengineering.com>
 <20230319121659.88039-2-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230319121659.88039-2-giulio.benetti@benettiengineering.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 19 Mar 2023 18:22:15 +0200
Message-ID: <CA+fTLhh2KuYTZP0_CizcA4OBDgCuKsDnqn6SdBBksNyur9h3Rg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679242946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F6j7tPUgRH6ZyEq5E0PRbM13D8CREsL7FiQHt/lHYWY=;
 b=jrfMaXyiJ4pXYJDVhS2mDqVaAe1j1+qj0joiFaY5Bmv+znIRA4Zj/VfLaPdTx0d6ol
 uiiDu6FO6nYDoBJuGZwldSszxDfLBDvpk49dNTjZlLIfNE7cq+WMXbsrQVrU6UdpGpyI
 GwvlHHjRKc05w3lQ/YXwyGF8CnJgz/UKMIwaH4Moki3+tvi5yrq0e5Io8ukBFCxsC7ov
 h5fmvKuN+01t36J39i3ldDID7gagDHKAyz74t48zhrW2MNezHWTTxxsJNaFfE+iFYSJb
 jWRi/f0gZ1XfeBaQRGLA0gkgPqtz8ixBnaNShK5gKctgKlxi1a+oEAPY2xGvV7cYiCAm
 NuTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jrfMaXyi
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: bump to version
 2023-03-13 on branch rtl8189fs
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3051585414238412701=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3051585414238412701==
Content-Type: multipart/alternative; boundary="00000000000045a7fd05f7433739"

--00000000000045a7fd05f7433739
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Giulio Benetti (<giulio.benetti@benettiengineering.com>) kirjutas
kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 14:17:

> rtl8189fs branch is specific for rtl8189fs controller and diverged from
> master so let's switch branch from master to rtl8189s to fix runtime
> failure.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>



> ---
>  package/rtl8189fs/rtl8189fs.hash | 2 +-
>  package/rtl8189fs/rtl8189fs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rtl8189fs/rtl8189fs.hash
> b/package/rtl8189fs/rtl8189fs.hash
> index 4f117cfd14..018e5b8a77 100644
> --- a/package/rtl8189fs/rtl8189fs.hash
> +++ b/package/rtl8189fs/rtl8189fs.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  96347dbfedd95a217fb89b7b295fe417b711dbad3db896ef0c2fa733c6d150fd
> rtl8189fs-e58bd86c9d9408c648b1246a0dd76b16856ec172.tar.gz
> +sha256  20382dbb1ac33425e6b3198cc9be269b79cd1423ea656e0ccd16dedafa3e2a2a
> rtl8189fs-ed6741b52bc998875298117b55d18b0d557c37a6.tar.gz
> diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/
> rtl8189fs.mk
> index 15a5329a45..2dd9e6097c 100644
> --- a/package/rtl8189fs/rtl8189fs.mk
> +++ b/package/rtl8189fs/rtl8189fs.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -RTL8189FS_VERSION =3D e58bd86c9d9408c648b1246a0dd76b16856ec172
> +RTL8189FS_VERSION =3D ed6741b52bc998875298117b55d18b0d557c37a6
>  RTL8189FS_SITE =3D $(call
> github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
>  RTL8189FS_LICENSE =3D GPL-2.0
>
> --
> 2.34.1
>
>

--00000000000045a7fd05f7433739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Giulio Benetti (&lt;<a href=3D"ma=
ilto:giulio.benetti@benettiengineering.com">giulio.benetti@benettiengineeri=
ng.com</a>&gt;) kirjutas kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 14:17:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">rtl8189fs branch is specific for rtl8189fs controller and diverg=
ed from<br>
master so let&#39;s switch branch from master to rtl8189s to fix runtime<br=
>
failure.<br>
<br>
Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettie=
ngineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>=
&gt;<br></blockquote><div><br></div><div><span class=3D"gmail-il">Tested</s=
pan>-by: Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com" targe=
t=3D"_blank">indrek.kruusa@gmail.com</a>&gt;<br></div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0package/rtl8189fs/rtl8189fs.hash | 2 +-<br>
=C2=A0package/rtl8189fs/<a href=3D"http://rtl8189fs.mk" rel=3D"noreferrer" =
target=3D"_blank">rtl8189fs.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs=
.hash<br>
index 4f117cfd14..018e5b8a77 100644<br>
--- a/package/rtl8189fs/rtl8189fs.hash<br>
+++ b/package/rtl8189fs/rtl8189fs.hash<br>
@@ -1,2 +1,2 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 96347dbfedd95a217fb89b7b295fe417b711dbad3db896ef0c2fa733c6d15=
0fd=C2=A0 rtl8189fs-e58bd86c9d9408c648b1246a0dd76b16856ec172.tar.gz<br>
+sha256=C2=A0 20382dbb1ac33425e6b3198cc9be269b79cd1423ea656e0ccd16dedafa3e2=
a2a=C2=A0 rtl8189fs-ed6741b52bc998875298117b55d18b0d557c37a6.tar.gz<br>
diff --git a/package/rtl8189fs/<a href=3D"http://rtl8189fs.mk" rel=3D"noref=
errer" target=3D"_blank">rtl8189fs.mk</a> b/package/rtl8189fs/<a href=3D"ht=
tp://rtl8189fs.mk" rel=3D"noreferrer" target=3D"_blank">rtl8189fs.mk</a><br=
>
index 15a5329a45..2dd9e6097c 100644<br>
--- a/package/rtl8189fs/<a href=3D"http://rtl8189fs.mk" rel=3D"noreferrer" =
target=3D"_blank">rtl8189fs.mk</a><br>
+++ b/package/rtl8189fs/<a href=3D"http://rtl8189fs.mk" rel=3D"noreferrer" =
target=3D"_blank">rtl8189fs.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-RTL8189FS_VERSION =3D e58bd86c9d9408c648b1246a0dd76b16856ec172<br>
+RTL8189FS_VERSION =3D ed6741b52bc998875298117b55d18b0d557c37a6<br>
=C2=A0RTL8189FS_SITE =3D $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189=
FS_VERSION))<br>
=C2=A0RTL8189FS_LICENSE =3D GPL-2.0<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000045a7fd05f7433739--

--===============3051585414238412701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3051585414238412701==--
