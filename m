Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A33CAC5B9
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 06:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEEDD84F61;
	Sat, 27 Sep 2025 06:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhC390KAB7R3; Sat, 27 Sep 2025 06:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4B8684F5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B8684F5E;
	Sat, 27 Sep 2025 06:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7993B177
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 06:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B59D41366
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 06:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dT_tkuM7zrua for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 06:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46C1940511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C1940511
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46C1940511
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 06:48:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-57a604fecb4so3567871e87.1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 23:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758955716; x=1759560516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vtTRsIf0Hvt65hw1oVPbLAlDdhJqZ3r0ydDmgCz8gRI=;
 b=gP4H/Lnb4m3LyxD8yJ1qEcx0rEh7zv6I9w7WcQDkfXI7AVEgLtRO8bq3oo4DqBrcHx
 2dihqbe3yVWQBYpo/8BqxxrkfST6kvxWYCeH2I8wBJdNdUAhfJ+yBCWng1mofEW1NpnB
 PtnujVQPJ7twMTKN9aOXF7LjcFfC7GOo5y3mKvtiRaoCG16hotNbcj24J58arhwTXDBn
 0zdq4lpOTJ/9KRwbwpKLomCpJ4X/T3GHK/n7GOr0If0x+jE0KnJRquOEUIbaxJlwfbLF
 tddt37H5bWiLmdyqIIE3YLkEzao0AJYq0TcQYvRIcazGMBXYtI5MTWc3hLU8iqKH2Tw5
 ijCw==
X-Gm-Message-State: AOJu0Yzn7YmKpFIrclZcaYH/0F33ST+ymIGCNSASyYgGI7peQwOPa/cR
 pxgW7k6T+zEVB4tZv4V5Tw0T6xwZf4p8nRrvbfbEH2BI3I4bFBTYRVV0bsNUR0nAcWHDXM9NHdO
 w7EtP3zmiDg==
X-Gm-Gg: ASbGncvXuw6QB393BJNH/6zK5UYCCN/9/h7Z2DlhjzphDPOmVZyrmZ4ndu/Qr+oRbh9
 AQGh7P4M/EQbV3KDKalo/qNIA5XYkH3zhjCkfo3PZ02aLeMmcPbB778IrNch7oUYPUEOH6nTCO2
 EWeR6wwOoQwIek0nvbyJSEpi5MC+AaZ2EmodCbDxVFF9jpEatcPZo8fThwm4LQy3QQ9bzMTmTUG
 3b8XxxBcYu0xTp03v8Cm9wEilglBt6E6+rqJrBFshhMLap34hvzowLmAOY5Rp8FIqHBl/GXo3uW
 TdvIGOIuYWiaZA0f5YkLmmu4POpyR5+a7CIdBwll5TyqIIG3uNXJf71+uC38bG4G9jZFFNv14lT
 LUUFemw1H8IqrTvEgj81SaAlM1rfbk/E/WPeEZNwIMIvGBCx2J6VawayQZ+MHWrtAbw==
X-Google-Smtp-Source: AGHT+IHGVaRhL64c3znk4fYDBcirLq/IA0Cc9pZAYmZagasaiWdEDiwZVCjnv8y7KUN6nH/EsQ7+JQ==
X-Received: by 2002:a05:6512:1189:b0:55f:6b4d:85d8 with SMTP id
 2adb3069b0e04-582d2b4cbfdmr2898991e87.28.1758955715608; 
 Fri, 26 Sep 2025 23:48:35 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313905330sm2362609e87.33.2025.09.26.23.48.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 23:48:34 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-36527ac0750so26489091fa.3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 23:48:33 -0700 (PDT)
X-Received: by 2002:a05:651c:25ce:10b0:36c:5046:79b3 with SMTP id
 38308e7fff4ca-36f8020c9f2mr21644731fa.41.1758955713071; Fri, 26 Sep 2025
 23:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Sep 2025 23:48:21 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rBmFLKtnO+W2pk7-KHoH7Xg27uCs3Mteu6ju89JZYBJw@mail.gmail.com>
X-Gm-Features: AS18NWCstJsExAAffDo6icN1iOOKi3nGYdRSMWP_4A7ADaL3W4z3tTBqtKrpL6c
Message-ID: <CA+h8R2rBmFLKtnO+W2pk7-KHoH7Xg27uCs3Mteu6ju89JZYBJw@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1758955716; x=1759560516; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vtTRsIf0Hvt65hw1oVPbLAlDdhJqZ3r0ydDmgCz8gRI=;
 b=Hp95rjZA8h5ivw4IT1D7L1ruZyw5xeA608yKL5FR6RMTAvEnGaSIVswUhvWeMqvvYQ
 boaANp215TRMrjXV8oZ++bbNTf9PA0cE+qTIatXNsOCzyxgUa1bGXyzW+cU0XzrzEBEN
 93qfyYid+eGjmqbbckpGHOXysluxwKYouwh0NIlkfnEQ6BGGh1z6lgdnNsHm1qvj4dJo
 b6wvNfLWjRNe303R9DUk5QCsUnsaOg0C1avXwCDjJ4vHXtqY7yR3gjDZ+xKlIJydcRii
 lKpN25tjpifu8+k1rpFFBY2mKJ+PmaajQ29YkV5CBXVQJuDSDrBopQXyYrRR4An84A9r
 B2Ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Hp95rjZA
Subject: Re: [Buildroot] [PATCH 1/6] package/embiggen-disk: fix
 EMBIGGEN_DISK_VERSION
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============5036124982527555615=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5036124982527555615==
Content-Type: multipart/alternative; boundary="000000000000740e4a063fc2cad7"

--000000000000740e4a063fc2cad7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lgtm

On Fri, Sep 26, 2025 at 3:06=E2=80=AFAM Dario Binacchi <
dario.binacchi@amarulasolutions.com> wrote:

> Make EMBIGGEN_DISK_VERSION compliant with release-monitoring.org.
>
> Fixes: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/embiggen-disk/embiggen-disk.hash | 2 +-
>  package/embiggen-disk/embiggen-disk.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/embiggen-disk/embiggen-disk.hash
> b/package/embiggen-disk/embiggen-disk.hash
> index 02c99add6aa8..1a327dce2a2a 100644
> --- a/package/embiggen-disk/embiggen-disk.hash
> +++ b/package/embiggen-disk/embiggen-disk.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e
> embiggen-disk-v20240521-go2.tar.gz
> +sha256  67ab51d13c85c5e3f1805f1e7b1e2db92edf8472007cd859c5919692eb0c0cbc
> embiggen-disk-20240521-go2.tar.gz
>  sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95
> LICENSE
> diff --git a/package/embiggen-disk/embiggen-disk.mk
> b/package/embiggen-disk/embiggen-disk.mk
> index 47b86c072bf3..a981cdf87f63 100644
> --- a/package/embiggen-disk/embiggen-disk.mk
> +++ b/package/embiggen-disk/embiggen-disk.mk
> @@ -4,8 +4,8 @@
>  #
>
>  ########################################################################=
########
>
> -EMBIGGEN_DISK_VERSION =3D v20240521
> -EMBIGGEN_DISK_SITE =3D $(call
> github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
> +EMBIGGEN_DISK_VERSION =3D 20240521
> +EMBIGGEN_DISK_SITE =3D $(call
> github,skiffos,embiggen-disk,v$(EMBIGGEN_DISK_VERSION))
>  EMBIGGEN_DISK_LICENSE =3D Apache-2.0
>  EMBIGGEN_DISK_LICENSE_FILES =3D LICENSE
>
> --
> 2.43.0
>
>
Reviewed-by: Christian Stewart <christian@aperture.us>

--000000000000740e4a063fc2cad7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Lgtm</div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 26,=
 2025 at 3:06=E2=80=AFAM Dario Binacchi &lt;<a href=3D"mailto:dario.binacch=
i@amarulasolutions.com">dario.binacchi@amarulasolutions.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Make EMBIGGEN_DI=
SK_VERSION compliant with <a href=3D"http://release-monitoring.org" rel=3D"=
noreferrer" target=3D"_blank">release-monitoring.org</a>.<br>
<br>
Fixes: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
---<br>
=C2=A0package/embiggen-disk/embiggen-disk.hash | 2 +-<br>
=C2=A0package/embiggen-disk/<a href=3D"http://embiggen-disk.mk" rel=3D"nore=
ferrer" target=3D"_blank">embiggen-disk.mk</a>=C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-di=
sk/embiggen-disk.hash<br>
index 02c99add6aa8..1a327dce2a2a 100644<br>
--- a/package/embiggen-disk/embiggen-disk.hash<br>
+++ b/package/embiggen-disk/embiggen-disk.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally computed<br>
-sha256=C2=A0 25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3b=
a5e=C2=A0 embiggen-disk-v20240521-go2.tar.gz<br>
+sha256=C2=A0 67ab51d13c85c5e3f1805f1e7b1e2db92edf8472007cd859c5919692eb0c0=
cbc=C2=A0 embiggen-disk-20240521-go2.tar.gz<br>
=C2=A0sha256=C2=A0 063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9ac=
c127fc95=C2=A0 LICENSE<br>
diff --git a/package/embiggen-disk/<a href=3D"http://embiggen-disk.mk" rel=
=3D"noreferrer" target=3D"_blank">embiggen-disk.mk</a> b/package/embiggen-d=
isk/<a href=3D"http://embiggen-disk.mk" rel=3D"noreferrer" target=3D"_blank=
">embiggen-disk.mk</a><br>
index 47b86c072bf3..a981cdf87f63 100644<br>
--- a/package/embiggen-disk/<a href=3D"http://embiggen-disk.mk" rel=3D"nore=
ferrer" target=3D"_blank">embiggen-disk.mk</a><br>
+++ b/package/embiggen-disk/<a href=3D"http://embiggen-disk.mk" rel=3D"nore=
ferrer" target=3D"_blank">embiggen-disk.mk</a><br>
@@ -4,8 +4,8 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-EMBIGGEN_DISK_VERSION =3D v20240521<br>
-EMBIGGEN_DISK_SITE =3D $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK=
_VERSION))<br>
+EMBIGGEN_DISK_VERSION =3D 20240521<br>
+EMBIGGEN_DISK_SITE =3D $(call github,skiffos,embiggen-disk,v$(EMBIGGEN_DIS=
K_VERSION))<br>
=C2=A0EMBIGGEN_DISK_LICENSE =3D Apache-2.0<br>
=C2=A0EMBIGGEN_DISK_LICENSE_FILES =3D LICENSE<br>
<br>
-- <br>
2.43.0<br>
<br></blockquote><div><br></div><div>Reviewed-by: Christian Stewart &lt;<a =
href=3D"mailto:christian@aperture.us">christian@aperture.us</a>&gt;=C2=A0</=
div></div></div>

--000000000000740e4a063fc2cad7--

--===============5036124982527555615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5036124982527555615==--
