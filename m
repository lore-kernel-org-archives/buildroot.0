Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55515106ACF9
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B2C6066F;
	Sat, 14 Mar 2026 20:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGMYg8JIIJIB; Sat, 14 Mar 2026 20:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1226760F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773518618;
	bh=5oeu+YDlG0WqUbnTCoQ6vTdqibEbK9557BJ37cCC9t8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FtCHfqKvbKB9MYRvLHq1HlCwWC0ltru+ZUXub5OxoqqmgrK1onnH0KfL7NvZVA8dX
	 ES0Rb+oMW0Dvp6YboqxgqG/6aefvUmN47zfldUzDnzGbehnclf3iTqqik5ddAoSbW6
	 Tw/emGJ4VDll0gadhXl5+atJUJ+IdJ6hqt0bOkcUMDObTsSv96mK09fhN/KAIKVN+B
	 9VQMHhhJlgrX+0NYxjF0aPfBuYQ/2O6WtaubJOfbTn6IwlOiBZPvTfQGW3tXKDr4et
	 5zfLvknniE3JY0DZbAw4d7PGv0q7QNs4qI8fWwGfkLLfFZ5aaRZHahnfzNbJrxpL1V
	 L2UaLbePFeVyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1226760F4A;
	Sat, 14 Mar 2026 20:03:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 900941B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 814314045D
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm7tFSGOMuxw for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 20:03:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AF64403C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF64403C6
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AF64403C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:03:35 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-5ffea5acd19so2019296137.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 13:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773518614; cv=none;
 d=google.com; s=arc-20240605;
 b=FmrhYF9vxydciq1NtQn9IJCcY1T7urAQxMbJgf2YghKpTg0a1kph/o35qaqTZ6V2Gj
 XVRcfkw4+4tSx4GEohW0H5Z/N9QTbotOyurSZcnlnqswzv0r0Ckwsw78YgRlJHVPGQWB
 9KErGBRAs3mKVUXSeYNAqOaFJQ1GMw2ZvTW9z3wd4MQRF9ure07UmQWnVPBeGhOMPPRC
 aIbwo9D+xRB7GP0Y5FOE7EQWBBBhAyhqtImDkMhNVQ/N669xPAsyrdYII6rI208PQRBS
 V3oBS0OI9bPslGfWDb/5T0bu5qMqFS5rdURZS8aWpgP4m9Hhq96QHLUXEVKj7q7pGVRb
 RmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qsoz3OVqAS1vt5DvOMsRkMZ5bgFBi64TRfR3ZUqPS7I=;
 fh=v39vw1RVa+etVr36IJY6HNIwUwZAMQh/gk9zL4km/aA=;
 b=B1WXebbFytWQvHUtiENZWwvRKlsCMYZKS3ljosMcYeRtxtVJO+6dLD7nTgmDQFO5EY
 mVhRmEs2b90zs6xNBd5l5AlMhjl5mz9fV16EkfSP92eCqiA59MgQ6wlKLPbnD2WDIkDp
 qqs9TOQ6ExyCSKAEddeV7nwuxOwnHh0erCmC4CrXbQLDCWfhbrNc/ClMU3OGazDvKcsO
 boj8rr1T0yxaP+RqruECAaVtQYKtmr4IzqHnfsM3NvDkpI41ZcCXZKCuFuTWBUx4kjso
 G7RTiollbjiTapxdXG2p1qOi43FCfj6bFPUpEpxkm5DJzkkrZV5OyvclbYWVGnwPFEmV
 tQKw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773518614; x=1774123414;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsoz3OVqAS1vt5DvOMsRkMZ5bgFBi64TRfR3ZUqPS7I=;
 b=nzTi82IZooYcLsVYEVQJqhQzlmW+j30xPrRuy2EJX2+4DEPwwzvhPLJxFNMBJMddF2
 3R3+Ohd5ttQ45JYvLx1OKyrPAsV74lRTlXPWQivh4nKAemdxFDuJfAyiBuAhvjTWaSZY
 L56+mafy0oF4NlhVji2u5WGsD7FQ/Wmsu6MjQTiTjo2IMnl+gxYpQJbxWem+6sCojTku
 oUWQETRKxFapOrKKEDLvnj9zNrrFgaJYgPv4Ih/49W2ovWqEctFmWLLeHBEvnC4hSiD7
 mX1WYGEcjRyY7KaVgy/aGvWZ42xVBtP+R6JIjL+ew1x+YTt0zJGTceGeYuGkI9lIMGYn
 OSjg==
X-Gm-Message-State: AOJu0YxWLa5kK8y1AGtAzW1O6P4TSUF6egggk+1/Ynv3Mv8TzwQdNrb1
 c4A6HDI/t0Eo36z/4amKqJpvUVAOvwCn5w+h0L5zulw9jHis1TYevjYF+fVcQkrGw0mUw6PGKt0
 sS6OK4wreg/8YVoO4dKjEgqXgSAa4oy4MfldhcEWR2Q==
X-Gm-Gg: ATEYQzxVxheDhC1g/nj5b/31KL4zOGNY1bOVsA0/ircuYOFgzqs7i4Kkevf7hvDXn0P
 kVw3N09h2JUbnFeP1nwV4LViKIxYkns+NKwQ/0GBqXFx8n2qE4GovynnMRgSejDIBIzsQ5DmAQe
 CL4NjjZMr3rUYDi7lsN16ACsDaZLD6cW7qh2Wk0A7ZwdatyIbcKCVyPEXoAOGQFKOyzfQ4g0HU0
 wehssEW/NOFYDPDc4md9Nc8EZBwGlMLv7e2b+vPh/I1VCd8tGMUa09TswyKS5f4ALBTzDm8rZPC
 4x6nIsn9/NIrSpH0Oj5GklxdYjJUC366jhHE+dgGLJ9ecdS7rtXLntwFEB6lJ07C/uMz
X-Received: by 2002:a05:6102:26c6:b0:5f9:39e8:5346 with SMTP id
 ada2fe7eead31-6020e24cb3dmr3475546137.9.1773518613894; Sat, 14 Mar 2026
 13:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260314181611.3076096-1-bernd@kuhls.net>
In-Reply-To: <20260314181611.3076096-1-bernd@kuhls.net>
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Sat, 14 Mar 2026 21:03:23 +0100
X-Gm-Features: AaiRm53zD3f0rRHPs1-XSrFKOxTGZyqautU6lQtBiE19KDSDLOgQljqKeqQaKmU
Message-ID: <CABNF3=bsqMzEjO_iBuoRiT4bLmod4wZyj9pF_WmZWHtYxn=Jog@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1773518614; x=1774123414;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qsoz3OVqAS1vt5DvOMsRkMZ5bgFBi64TRfR3ZUqPS7I=;
 b=pspN1sP7zJdq78Kv/n9cKsv7oHn/o6jUwp8TukCersTLsQujiiKeyldMbRqfmIogh9
 ATgpSMxdUyIiJxFxJsV2c0oWegTfCAAbLemEunmMS4EGwfE0ovNtc6rHOO+tswxVUzx+
 1aYkx/EU28VwLtQygx0UGWZA6/d/aQ04Hrlvw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pspN1sP7
Subject: Re: [Buildroot] [PATCH 1/1] package/cutekeyboard: bump version to
 1.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0438163255117924796=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0438163255117924796==
Content-Type: multipart/alternative; boundary="000000000000fbe7d0064d017a73"

--000000000000fbe7d0064d017a73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bernd,

Thanks for the patch. Just a heads-up that I submitted the same version
bump two weeks ago, which is currently awaiting maintainer review:
https://patchwork.ozlabs.org/project/buildroot/patch/20260227104419.42377-1=
-andrea.ricchi@amarulasolutions.com/

If you have already tested this on your end, please feel free to add a
Reviewed-by or Tested-by tag to my version. That would help speed up the
merging process.

Thanks,

Andrea Ricchi
Embedded Software Engineer
M. +39 333 775 4973
andrea.ricchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com



On Sat, Mar 14, 2026 at 7:16=E2=80=AFPM Bernd Kuhls <bernd@kuhls.net> wrote=
:

> https://github.com/amarula/cutekeyboard/releases/tag/v1.6.0
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cutekeyboard/cutekeyboard.hash | 2 +-
>  package/cutekeyboard/cutekeyboard.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/cutekeyboard/cutekeyboard.hash
> b/package/cutekeyboard/cutekeyboard.hash
> index 5800865230..acd2017056 100644
> --- a/package/cutekeyboard/cutekeyboard.hash
> +++ b/package/cutekeyboard/cutekeyboard.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0845
> cutekeyboard-1.5.0.tar.gz
> +sha256  5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7300
> cutekeyboard-1.6.0.tar.gz
>  sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d
> LICENSE
> diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/
> cutekeyboard.mk
> index 9a29f5df02..12a6573d52 100644
> --- a/package/cutekeyboard/cutekeyboard.mk
> +++ b/package/cutekeyboard/cutekeyboard.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -CUTEKEYBOARD_VERSION =3D 1.5.0
> +CUTEKEYBOARD_VERSION =3D 1.6.0
>  CUTEKEYBOARD_SITE =3D $(call
> github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
>  CUTEKEYBOARD_DEPENDENCIES =3D qt5declarative qt5quickcontrols2
>  CUTEKEYBOARD_INSTALL_STAGING =3D YES
> --
> 2.47.3
>
>

--000000000000fbe7d0064d017a73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bernd,</div><div><br></div><div>Thanks for the pat=
ch. Just a heads-up that I submitted the same version bump two weeks ago, w=
hich is currently awaiting maintainer review: <a href=3D"https://patchwork.=
ozlabs.org/project/buildroot/patch/20260227104419.42377-1-andrea.ricchi@ama=
rulasolutions.com/">https://patchwork.ozlabs.org/project/buildroot/patch/20=
260227104419.42377-1-andrea.ricchi@amarulasolutions.com/</a></div><div><br>=
</div><div>If you have already tested this on your end, please feel free to=
 add a Reviewed-by or Tested-by tag to my version. That would help speed up=
 the merging process.</div><div><br></div><div>Thanks,</div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&=
quot;;font-size:medium;margin-bottom:10px!important"><span style=3D"font-we=
ight:700"><span style=3D"font-size:14px">Andrea Ricchi</span></span><br><sp=
an style=3D"font-size:12px">Embedded Software Engineer<br>M. +39 333 775 49=
73<br><a href=3D"mailto:andrea.ricchi@amarulasolutions.com" target=3D"_blan=
k">andrea.ricchi@amarulasolutions.com</a></span><br><span style=3D"font-siz=
e:12px;color:rgb(241,194,50)">=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95</span><br><span style=3D"font-size:12px"><span style=3D"fon=
t-weight:700">Amarula Solutions SRL</span><br>=C2=A0Via Felice Cavallotti 2=
5D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info@amarulasolutions.com" tar=
get=3D"_blank">info@amarulasolutions.com</a><br><a href=3D"http://www.amaru=
lasolutions.com/" target=3D"_blank">www.amarulasolutions.com</a></span><br>=
</p><p></p></div></div></div><br></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 14, 2026=
 at 7:16=E2=80=AFPM Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net">bern=
d@kuhls.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><a href=3D"https://github.com/amarula/cutekeyboard/releases/tag/=
v1.6.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/amarula/cut=
ekeyboard/releases/tag/v1.6.0</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank">bernd@kuhls.net</a>&gt;<br>
---<br>
=C2=A0package/cutekeyboard/cutekeyboard.hash | 2 +-<br>
=C2=A0package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/=
cutekeyboard.hash<br>
index 5800865230..acd2017056 100644<br>
--- a/package/cutekeyboard/cutekeyboard.hash<br>
+++ b/package/cutekeyboard/cutekeyboard.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally computed<br>
-sha256=C2=A0 5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0=
845=C2=A0 cutekeyboard-1.5.0.tar.gz<br>
+sha256=C2=A0 5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7=
300=C2=A0 cutekeyboard-1.6.0.tar.gz<br>
=C2=A0sha256=C2=A0 bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60=
dd65964d=C2=A0 LICENSE<br>
diff --git a/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D=
"noreferrer" target=3D"_blank">cutekeyboard.mk</a> b/package/cutekeyboard/<=
a href=3D"http://cutekeyboard.mk" rel=3D"noreferrer" target=3D"_blank">cute=
keyboard.mk</a><br>
index 9a29f5df02..12a6573d52 100644<br>
--- a/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a><br>
+++ b/package/cutekeyboard/<a href=3D"http://cutekeyboard.mk" rel=3D"norefe=
rrer" target=3D"_blank">cutekeyboard.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-CUTEKEYBOARD_VERSION =3D 1.5.0<br>
+CUTEKEYBOARD_VERSION =3D 1.6.0<br>
=C2=A0CUTEKEYBOARD_SITE =3D $(call github,amarula,cutekeyboard,v$(CUTEKEYBO=
ARD_VERSION))<br>
=C2=A0CUTEKEYBOARD_DEPENDENCIES =3D qt5declarative qt5quickcontrols2<br>
=C2=A0CUTEKEYBOARD_INSTALL_STAGING =3D YES<br>
-- <br>
2.47.3<br>
<br>
</blockquote></div>

--000000000000fbe7d0064d017a73--

--===============0438163255117924796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0438163255117924796==--
