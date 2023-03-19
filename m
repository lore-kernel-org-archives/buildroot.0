Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA6C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA4744092A;
	Sun, 19 Mar 2023 19:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA4744092A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzwkloAaP2Gi; Sun, 19 Mar 2023 19:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E8740980;
	Sun, 19 Mar 2023 19:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E8740980
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 437FB1BF59D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A78940385
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A78940385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4BKnEdcK_Ec for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 19:42:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E7B4013D
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8E7B4013D
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 19:42:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id eg48so39042438edb.13
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 12:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679254976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ex0dzhheaXi5goqPLDc7slB2CEQ6ntJa/JuhF/ciCg=;
 b=XW7P1y389WFk3p87C5XRO1fn1gH2K7SdfM5273nUirie34wafnk1TU4cgyzSdmgKSd
 BwR7Uzzx4OAPTY/eAjfS2YC43tVTznu3uw38MddEgheRYyU1dEk1G1bfR2M02RuGpkyn
 EoX2bgCJw46H/XfHg+y2ZxCqNRKJ2dL+QC2hMU52fzjO6DtXIVSeBIoa1jdiJBMim335
 /9JLjYxUoWyrtcsOY3mP8wx6AAWb2QB/SpnAcVtBMBM2q3uyCOj1+j2aKk6NdizUUX5F
 N+I46m7jntPGxrk7arcHEJt27YMD3fCHNyg9Hl5IAfV0u7wkyF4Z/2mUyTS3DC6DTpIm
 QNgw==
X-Gm-Message-State: AO0yUKU1Z92dORGAqGg8754Tg0T+xKzm8jXYZWTTCobeOSaI56TL2SKw
 zYAkvABIjQCO+LY4s008rbnOcdo7kKt84MO8oO56mAHi6IZgGw==
X-Google-Smtp-Source: AK7set+kAf/nSI+vlV4JaOonCz/PjjLp8CzlQS05ug/C/GUj20ZfW711vi1LX93GnWQKxMZz6Kq7JSxJlO7/TgtZMDw=
X-Received: by 2002:a50:ce54:0:b0:4fa:794a:c0cc with SMTP id
 k20-20020a50ce54000000b004fa794ac0ccmr5092044edj.2.1679254975700; Sun, 19 Mar
 2023 12:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230319192915.264584-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230319192915.264584-1-giulio.benetti@benettiengineering.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 19 Mar 2023 21:42:45 +0200
Message-ID: <CA+fTLhhVYuSq+ygavwF5wg2SonW55Mg0_ZM2CyOc=jhFUVsOzw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679254976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ex0dzhheaXi5goqPLDc7slB2CEQ6ntJa/JuhF/ciCg=;
 b=SxCz1dNA3s+zMHqla91deNae+6qe6uWGGnVa3I1Ir2S844NnKnRyZbiawXr3appc6m
 NuzDRLMnQy1LrP0OIOY7Q1sgTDHRdX0NKn+IEjdxmxkQbQRud4iZBdd74RKhC5rXmn1V
 p7RWNj7hjVpxSrUPmyouerSXNoj5WjefNHYSm6iez6lGsBapv8soL573isSuq9fTqCVs
 hgo5Ctuo3BUqER5h4Yqqjm/ma8iKLtei9Ysek+YHpbHASJ6dHlppRjjHAnZJQCsJ+uAu
 PEA04mBt9kkg4riNbjVvKxwPih3xbWxevqA8ROZULdSphsu1LKN4qrKCybqOksaA2MHP
 o6gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SxCz1dNA
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Content-Type: multipart/mixed; boundary="===============4920328733409074570=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4920328733409074570==
Content-Type: multipart/alternative; boundary="0000000000005062f205f74604f6"

--0000000000005062f205f74604f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Giulio Benetti (<giulio.benetti@benettiengineering.com>) kirjutas
kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 21:29:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/mmc-utils/mmc-utils.hash | 4 ++--
>  package/mmc-utils/mmc-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/mmc-utils/mmc-utils.hash
> b/package/mmc-utils/mmc-utils.hash
> index 1256f63487..22d34c3d40 100644
> --- a/package/mmc-utils/mmc-utils.hash
> +++ b/package/mmc-utils/mmc-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f
> mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
> -sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081
> mmc.h
> +sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106
> mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
> +sha256  f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779ca5
> mmc.h
> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/
> mmc-utils.mk
> index 435e6ae7f1..bc0fc7aaf2 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -MMC_UTILS_VERSION =3D dfc3b6ecda84d21418fb4408b39c5c71db4c6458
> +MMC_UTILS_VERSION =3D d4c2910981ff99b983734426dfa99632fb81ac6b
>  MMC_UTILS_SITE =3D
> https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git


I happened to click on that git.kernel.org
<https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git> link
and it doesn't work. But then where does this version come from?

Best regards,
Indrek


>
>  MMC_UTILS_SITE_METHOD =3D git
>  MMC_UTILS_LICENSE =3D GPL-2.0
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000005062f205f74604f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Giulio Benetti (&lt;<a href=3D"ma=
ilto:giulio.benetti@benettiengineering.com">giulio.benetti@benettiengineeri=
ng.com</a>&gt;) kirjutas kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 21:29:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benet=
ti@benettiengineering.com" target=3D"_blank">giulio.benetti@benettiengineer=
ing.com</a>&gt;<br>
---<br>
=C2=A0package/mmc-utils/mmc-utils.hash | 4 ++--<br>
=C2=A0package/mmc-utils/<a href=3D"http://mmc-utils.mk" rel=3D"noreferrer" =
target=3D"_blank">mmc-utils.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils=
.hash<br>
index 1256f63487..22d34c3d40 100644<br>
--- a/package/mmc-utils/mmc-utils.hash<br>
+++ b/package/mmc-utils/mmc-utils.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally computed<br>
-sha256=C2=A0 f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b7937527=
76f=C2=A0 mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz<br>
-sha256=C2=A0 f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768=
081=C2=A0 mmc.h<br>
+sha256=C2=A0 e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920=
106=C2=A0 mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz<br>
+sha256=C2=A0 f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779=
ca5=C2=A0 mmc.h<br>
diff --git a/package/mmc-utils/<a href=3D"http://mmc-utils.mk" rel=3D"noref=
errer" target=3D"_blank">mmc-utils.mk</a> b/package/mmc-utils/<a href=3D"ht=
tp://mmc-utils.mk" rel=3D"noreferrer" target=3D"_blank">mmc-utils.mk</a><br=
>
index 435e6ae7f1..bc0fc7aaf2 100644<br>
--- a/package/mmc-utils/<a href=3D"http://mmc-utils.mk" rel=3D"noreferrer" =
target=3D"_blank">mmc-utils.mk</a><br>
+++ b/package/mmc-utils/<a href=3D"http://mmc-utils.mk" rel=3D"noreferrer" =
target=3D"_blank">mmc-utils.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-MMC_UTILS_VERSION =3D dfc3b6ecda84d21418fb4408b39c5c71db4c6458<br>
+MMC_UTILS_VERSION =3D d4c2910981ff99b983734426dfa99632fb81ac6b<br>
=C2=A0MMC_UTILS_SITE =3D <a href=3D"https://git.kernel.org/pub/scm/linux/ke=
rnel/git/cjb/mmc-utils.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git</a></blockquote><di=
v><br></div><div>I happened to click on that=C2=A0<a href=3D"https://git.ke=
rnel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git" rel=3D"noreferrer" tar=
get=3D"_blank">git.kernel.org</a>=C2=A0link and it doesn&#39;t=C2=A0work. B=
ut then where does this version come from?</div><div><br></div><div>Best re=
gards,</div><div>Indrek</div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
=C2=A0MMC_UTILS_SITE_METHOD =3D git<br>
=C2=A0MMC_UTILS_LICENSE =3D GPL-2.0<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000005062f205f74604f6--

--===============4920328733409074570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4920328733409074570==--
