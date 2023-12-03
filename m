Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5353C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 494F540447;
	Sun,  3 Dec 2023 16:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 494F540447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ft40H4nU43x2; Sun,  3 Dec 2023 16:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C7240470;
	Sun,  3 Dec 2023 16:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C7240470
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4891A1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 212BB817A3
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 212BB817A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbcI2uMKwGFu for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:19:49 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D673581771
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D673581771
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-28659b38bc7so2302493a91.0
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 08:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701620389; x=1702225189;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a+qpaPelHAIGSK9cDld90yzmVNk5otQ0Vt4WSD0o4nk=;
 b=M7mmLpcO4z8eJ9L+ZEp3x0vVlQ2L4i+dICtKbaduAUVqlZaOfpwSeaXBNIMkh1/lk5
 iBOr0flJ/BJuINDoviIsIdoZyKJBpjRzACEHrgzsMahSazQj6sGXNWbO93JexzDZ9I+Z
 f4FbnGCYPS6EiDpvkSAZuz4m1t+/NL40F1lVWqDna/zfpBMTZIWkoiNOgxofJBgTEd0G
 dkpdePPz44FuY9XrZkHO8M+JYrH6PqRPkzW/h8ky5LIjzP6Ot7Ge0A+bgs+MfMEWhRfd
 0MtGFroTLyz86ACU15Ljr/aeOVigS+xxdDdZJVyEUJJ5tk00vfkQfmLAH5gvcjU/H/XH
 xVZw==
X-Gm-Message-State: AOJu0Ywd8OIxt4PbZe7sZC7jVTAMyXN3Dxb4V1OgUYM2Rhddws6iDPGw
 spp7CvPEykiDrdcwvCIGvqdoqnPKkxuoaUrstj4oUg==
X-Google-Smtp-Source: AGHT+IFSrhP0Hw824BIESvEbYaETO5er3bCpZAVzXIwe1Xo8iiheFbFZgNS1BBoORyib9tdBYXqq/Iicm7u5TEEzy7k=
X-Received: by 2002:a17:90a:6b46:b0:286:6cc0:cae7 with SMTP id
 x6-20020a17090a6b4600b002866cc0cae7mr1930373pjl.94.1701620388276; Sun, 03 Dec
 2023 08:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 3 Dec 2023 17:19:35 +0100
Message-ID: <CAAE6iEVHsRZjeH8XeukovfafAq+HsCH+pC26kWOWWnBNVxgzjA@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1701620389; x=1702225189; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a+qpaPelHAIGSK9cDld90yzmVNk5otQ0Vt4WSD0o4nk=;
 b=Ul08kSyNgZUSwHQpJBRwfH0NXp4SlBJ/1CBylStrAOFF1LNqAlLm7r6Rr5ydBAgWkm
 y268nzqMH9rZqDz/AP15y60fGuIEDVDFfv79/qrrLZUIM9HNJvbIJrsm++afrcJcXnG2
 bdRrhcSxAJjFTZ2FTwab/3JELafR9XJbLsfPDhAz/tMoOIz9b1dj+Yl5PBAbRjUWF2LS
 GO0U6VGlGeC+SmvLqxUon1RGEmk+hCthzBHIRlnH1P7WimSPt1PZ7y2LPCOuhYyDgaFO
 I6qQXb1paqXQmvBXByGj3NDgkGzhpWDfhNqh7yxLYvdZYUvZf2zGh4vnhyB4QbKBU2vN
 89zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Ul08kSyN
Subject: Re: [Buildroot] [PATCH 00/11] Add support for AM62x-SK HS-FS devices
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============2798707953840577437=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2798707953840577437==
Content-Type: multipart/alternative; boundary="000000000000ca22a2060b9d5e70"

--000000000000ca22a2060b9d5e70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 29 nov. 2023 =C3=A0 18:26, Dario Binacchi <
dario.binacchi@amarulasolutions.com> a =C3=A9crit :

> The SK-AM62B-P1 is the newest version of SK-AM62which includes
> high-security field-securable (HS-FS) silicon to optionally customize key=
s
> and encryption for security applications.
> This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS optio=
n,
> which, however, was buggy. This series fixes the errors and bumps the Lin=
ux
> kernel and U-Boot required for such a new device.
>
> Dario Binacchi (11):
>   boot/ti-k3-core-secdev: new package
>   boot/ti-k3-image-gen: manage HS hardware
>

These two first patches are similar to this one: [v9,07/11]
package/ti-core-secdev-k3: new package
see
https://patchwork.ozlabs.org/project/buildroot/patch/20230622160212.2063472=
-8-dannenberg@ti.com/

Fran=C3=A7ois


>   package/python-jsonschema: add host variant
>   package/python-attrs: add host variant
>   package/python-referencing: add host variant
>   package/python-rpds-py: add host variant
>   package/python-jsonschema-specifications: add host variant
>   boot/ti-k3-r5-loader: set binman environment variable
>   boot/uboot: set BINMAN_INDIRS for TI K3 DM
>   configs/ti_am62x_sk_defconfig: bump U-Boot version to 2023.10
>   configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.1
>
>  DEVELOPERS                                    |  1 +
>  board/ti/am62x-sk/genimage.cfg                |  7 ++-
>  board/ti/am62x-sk/post-build.sh               | 49 +++++++++++++++++++
>  board/ti/am62x-sk/post-image.sh               |  5 ++
>  boot/Config.in                                |  1 +
>  boot/ti-k3-core-secdev/Config.in              |  9 ++++
>  boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 ++
>  boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 19 +++++++
>  boot/ti-k3-image-gen/Config.in                |  1 +
>  boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 16 +++++-
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       |  1 +
>  boot/uboot/uboot.mk                           |  3 +-
>  configs/ti_am62x_sk_defconfig                 | 20 ++++++--
>  package/Config.in.host                        |  5 ++
>  package/python-attrs/Config.in.host           |  8 +++
>  package/python-attrs/python-attrs.mk          |  6 +++
>  .../Config.in.host                            |  7 +++
>  .../python-jsonschema-specifications.mk       |  5 ++
>  package/python-jsonschema/Config.in.host      |  6 +++
>  .../python-jsonschema/python-jsonschema.mk    |  6 +++
>  package/python-referencing/Config.in.host     |  6 +++
>  .../python-referencing/python-referencing.mk  |  7 +++
>  package/python-rpds-py/Config.in.host         |  8 +++
>  package/python-rpds-py/python-rpds-py.mk      |  1 +
>  24 files changed, 192 insertions(+), 8 deletions(-)
>  create mode 100755 board/ti/am62x-sk/post-build.sh
>  create mode 100755 board/ti/am62x-sk/post-image.sh
>  create mode 100644 boot/ti-k3-core-secdev/Config.in
>  create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
>  create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
>  create mode 100644 package/python-attrs/Config.in.host
>  create mode 100644 package/python-jsonschema-specifications/Config.in.ho=
st
>  create mode 100644 package/python-jsonschema/Config.in.host
>  create mode 100644 package/python-referencing/Config.in.host
>  create mode 100644 package/python-rpds-py/Config.in.host
>
> --
> 2.43.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000ca22a2060b9d5e70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 29 nov. 2023 =C3=A0=C2=
=A018:26, Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasoluti=
ons.com">dario.binacchi@amarulasolutions.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">The SK-AM62B-P1 is=
 the newest version of SK-AM62which includes<br>
high-security field-securable (HS-FS) silicon to optionally customize keys<=
br>
and encryption for security applications.<br>
This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS option,=
<br>
which, however, was buggy. This series fixes the errors and bumps the Linux=
<br>
kernel and U-Boot required for such a new device.<br>
<br>
Dario Binacchi (11):<br>
=C2=A0 boot/ti-k3-core-secdev: new package<br>
=C2=A0 boot/ti-k3-image-gen: manage HS hardware<br></blockquote><div><br></=
div><div>These two first patches are similar to this one: <span style=3D"fo=
nt-weight:normal"><font size=3D"2">[v9,07/11] package/ti-core-secdev-k3: ne=
w package</font></span></div><div>see <a href=3D"https://patchwork.ozlabs.o=
rg/project/buildroot/patch/20230622160212.2063472-8-dannenberg@ti.com/">htt=
ps://patchwork.ozlabs.org/project/buildroot/patch/20230622160212.2063472-8-=
dannenberg@ti.com/</a><br></div><div><br></div><div>Fran=C3=A7ois<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 package/python-jsonschema: add host variant<br>
=C2=A0 package/python-attrs: add host variant<br>
=C2=A0 package/python-referencing: add host variant<br>
=C2=A0 package/python-rpds-py: add host variant<br>
=C2=A0 package/python-jsonschema-specifications: add host variant<br>
=C2=A0 boot/ti-k3-r5-loader: set binman environment variable<br>
=C2=A0 boot/uboot: set BINMAN_INDIRS for TI K3 DM<br>
=C2=A0 configs/ti_am62x_sk_defconfig: bump U-Boot version to 2023.10<br>
=C2=A0 configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.1<br>
<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0board/ti/am62x-sk/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++-<br>
=C2=A0board/ti/am62x-sk/post-build.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 49 +++++++++++++++++++<br>
=C2=A0board/ti/am62x-sk/post-image.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
=C2=A0boot/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0boot/ti-k3-core-secdev/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 9 ++++<br>
=C2=A0boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |=C2=A0 3 ++<br>
=C2=A0boot/ti-k3-core-secdev/<a href=3D"http://ti-k3-core-secdev.mk" rel=3D=
"noreferrer" target=3D"_blank">ti-k3-core-secdev.mk</a>=C2=A0 =C2=A0| 19 ++=
+++++<br>
=C2=A0boot/ti-k3-image-gen/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-image-gen.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 16 +++++-<br>
=C2=A0boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-r5-loader.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A0boot/uboot/<a href=3D"http://uboot.mk" rel=3D"noreferrer" target=3D"_=
blank">uboot.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0configs/ti_am62x_sk_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++--<br>
=C2=A0package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++<br>
=C2=A0package/python-attrs/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 8 +++<br>
=C2=A0package/python-attrs/<a href=3D"http://python-attrs.mk" rel=3D"norefe=
rrer" target=3D"_blank">python-attrs.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 6 +++<br>
=C2=A0.../Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++<br>
=C2=A0.../<a href=3D"http://python-jsonschema-specifications.mk" rel=3D"nor=
eferrer" target=3D"_blank">python-jsonschema-specifications.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
=C2=A0package/python-jsonschema/Config.in.host=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
6 +++<br>
=C2=A0.../python-jsonschema/<a href=3D"http://python-jsonschema.mk" rel=3D"=
noreferrer" target=3D"_blank">python-jsonschema.mk</a>=C2=A0 =C2=A0 |=C2=A0=
 6 +++<br>
=C2=A0package/python-referencing/Config.in.host=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
6 +++<br>
=C2=A0.../python-referencing/<a href=3D"http://python-referencing.mk" rel=
=3D"noreferrer" target=3D"_blank">python-referencing.mk</a>=C2=A0 |=C2=A0 7=
 +++<br>
=C2=A0package/python-rpds-py/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++<br>
=C2=A0package/python-rpds-py/<a href=3D"http://python-rpds-py.mk" rel=3D"no=
referrer" target=3D"_blank">python-rpds-py.mk</a>=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
=C2=A024 files changed, 192 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100755 board/ti/am62x-sk/post-build.sh<br>
=C2=A0create mode 100755 board/ti/am62x-sk/post-image.sh<br>
=C2=A0create mode 100644 boot/ti-k3-core-secdev/Config.in<br>
=C2=A0create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash<br>
=C2=A0create mode 100644 boot/ti-k3-core-secdev/<a href=3D"http://ti-k3-cor=
e-secdev.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-core-secdev.mk</a><=
br>
=C2=A0create mode 100644 package/python-attrs/Config.in.host<br>
=C2=A0create mode 100644 package/python-jsonschema-specifications/Config.in=
.host<br>
=C2=A0create mode 100644 package/python-jsonschema/Config.in.host<br>
=C2=A0create mode 100644 package/python-referencing/Config.in.host<br>
=C2=A0create mode 100644 package/python-rpds-py/Config.in.host<br>
<br>
-- <br>
2.43.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000ca22a2060b9d5e70--

--===============2798707953840577437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2798707953840577437==--
