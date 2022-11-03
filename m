Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72B8C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CF641712;
	Thu,  3 Nov 2022 00:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54CF641712
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4EJOVRaeIbN; Thu,  3 Nov 2022 00:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E669041713;
	Thu,  3 Nov 2022 00:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E669041713
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75D351BF46A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5117960E16
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5117960E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdadN-byhmTV for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:04:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 741F060B70
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 741F060B70
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:04:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f37so293768lfv.8
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oex89xa4N36rqJ29bSeei9JRtuPFkhzfnZZLUqI96jM=;
 b=WJm+qg+NnIClt05MPasYqNSsKri+d3wKSv0lAG25E5M6kQeBYqD9MIhuMUpTUUjXXw
 9S6iIqyDusNxUdQrtp8gOENLUQM7gZ4AykvOz4gcIvKn7ikwCAy9Hajd1g23SKYapf4p
 gmNmt7YIpyVLcETKdLbuZSCNk4FOytEIscewxsjUqXmJvsr8+kpJB+iAX3gN/mhY+EN6
 pok3ZvPTXP8a8Xe1iO6W4185gL2tzJ/GnduPjKMGB/2roLWUlo+MkX9cNNWXSc1CPG0r
 HL3FSKjxpVIccZsBe9h2Fp5q+LvjkFnOc+3YWKVuhA23eBLGYqRaqAwya862PvkOUjJ7
 KMpQ==
X-Gm-Message-State: ACrzQf3OJbbw+Vzt0/GHbfcWoNal50nDUxNv9h1NU9Fz9TXm5QqMmHd6
 jp5OTB/0o0bNqvdNVy4nCeyL0rDo5rLQZ71avZORFGkxcLY=
X-Google-Smtp-Source: AMsMyM4+yvAqCuZ0czRP9U+lSt7rOSrXKDZ2hskJM/jrUPMb+k5Fu1BXPjAd4sl2XPkt2ZXmHjUHtIOtBr8eVBy+Op0=
X-Received: by 2002:a05:6512:2209:b0:4a2:6b07:9a97 with SMTP id
 h9-20020a056512220900b004a26b079a97mr9916759lfu.509.1667433844150; Wed, 02
 Nov 2022 17:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221102201858.555294-1-thomas.petazzoni@bootlin.com>
 <20221102201858.555294-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20221102201858.555294-2-thomas.petazzoni@bootlin.com>
From: Da Xue <da@lessconfused.com>
Date: Wed, 2 Nov 2022 20:03:51 -0400
Message-ID: <CACdvmAh_sHZ3xwmhBa332f5Pg_9c=ZL5BxWbZO3tHn=mRDJJ7g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lessconfused.com; s=lessconfused;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oex89xa4N36rqJ29bSeei9JRtuPFkhzfnZZLUqI96jM=;
 b=I0x5lY7Mb2AH4QutP0aqSvnoTRS0g22OWiGil1RJGX+ovY/qbCajOJKqVjDh91J99a
 wMzaW4A8Ya+LabqL01zXe2rIHUw+jvCznw4wwTwNte9XiEwP7j5rnvY4KdQE6Rz9bop5
 axAyYSRJAbjpSGMxc/U9n+4a7Au/NobJB5LiM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com
 header.a=rsa-sha256 header.s=lessconfused header.b=I0x5lY7M
Subject: Re: [Buildroot] [PATCH 1/3] configs/roc_pc_rk3399: remove defconfig
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0039523395762046719=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0039523395762046719==
Content-Type: multipart/alternative; boundary="000000000000f7ad1505ec85b1dc"

--000000000000f7ad1505ec85b1dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

This is a Libre Computer only product in the future so the folder is wrong.
I will re-create in the right folder and maintain these boards in the
future.

Best,
Da


On Wed, Nov 2, 2022, 4:19 PM Thomas Petazzoni via buildroot <
buildroot@buildroot.org> wrote:

> This defconfig has been failing to build for several months, with
> nobody stepping up to fix it. It's time to drop it.
>
> See
> https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
> for a notification on August 6, 2022 about the issues with this
> defconfig.
>
> Fixes:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3259671226
>
> Cc: Suniel Mahesh <sunil@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                                |  2 --
>  board/firefly/roc-rk3399-pc/extlinux.conf |  4 ---
>  board/firefly/roc-rk3399-pc/genimage.cfg  | 22 -------------
>  board/firefly/roc-rk3399-pc/post-build.sh |  5 ---
>  board/firefly/roc-rk3399-pc/readme.txt    | 40 -----------------------
>  5 files changed, 73 deletions(-)
>  delete mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
>  delete mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
>  delete mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
>  delete mode 100644 board/firefly/roc-rk3399-pc/readme.txt
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9569ee720b..591276bec8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2729,13 +2729,11 @@ F:      package/hwloc/
>  F:     package/powertop/
>
>  N:     Suniel Mahesh <sunil@amarulasolutions.com>
> -F:     board/firefly/
>  F:     board/friendlyarm/nanopi-m4
>  F:     board/pine64/rockpro64
>  F:     board/radxa/rockpi-4
>  F:     board/radxa/rockpi-n8
>  F:     board/radxa/rockpi-n10
> -F:     configs/roc_pc_rk3399_defconfig
>  F:     configs/rock_pi_4_defconfig
>  F:     configs/rock_pi_n8_defconfig
>  F:     configs/rock_pi_n10_defconfig
> diff --git a/board/firefly/roc-rk3399-pc/extlinux.conf
> b/board/firefly/roc-rk3399-pc/extlinux.conf
> deleted file mode 100644
> index 50a358fadc..0000000000
> --- a/board/firefly/roc-rk3399-pc/extlinux.conf
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -label RK3399RocPC linux
> -  kernel /boot/Image
> -  devicetree /boot/rk3399-roc-pc.dtb
> -  append earlycon=3Duart8250,mmio32,0xff1a0000 root=3D/dev/mmcblk0p1 roo=
twait
> diff --git a/board/firefly/roc-rk3399-pc/genimage.cfg
> b/board/firefly/roc-rk3399-pc/genimage.cfg
> deleted file mode 100644
> index 966c869273..0000000000
> --- a/board/firefly/roc-rk3399-pc/genimage.cfg
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -image sdcard.img {
> -       hdimage {
> -       }
> -
> -       partition u-boot-tpl-spl-dtb {
> -               in-partition-table =3D "no"
> -               image =3D "idbloader.img"
> -               offset =3D 32K
> -       }
> -
> -       partition u-boot-dtb {
> -               in-partition-table =3D "no"
> -               image =3D "u-boot.itb"
> -               offset =3D 8M
> -               size =3D 30M
> -       }
> -
> -       partition rootfs {
> -               partition-type =3D 0x83
> -               image =3D "rootfs.ext4"
> -       }
> -}
> diff --git a/board/firefly/roc-rk3399-pc/post-build.sh
> b/board/firefly/roc-rk3399-pc/post-build.sh
> deleted file mode 100755
> index 1f5ff6a611..0000000000
> --- a/board/firefly/roc-rk3399-pc/post-build.sh
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -#!/bin/sh
> -
> -BOARD_DIR=3D"$(dirname $0)"
> -
> -install -m 0644 -D $BOARD_DIR/extlinux.conf
> $TARGET_DIR/boot/extlinux/extlinux.conf
> diff --git a/board/firefly/roc-rk3399-pc/readme.txt
> b/board/firefly/roc-rk3399-pc/readme.txt
> deleted file mode 100644
> index 8a6f1cdee6..0000000000
> --- a/board/firefly/roc-rk3399-pc/readme.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Libre Computer Board ROC-RK3399-PC
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Build:
> -
> -  $ make roc_pc_rk3399_defconfig
> -  $ make
> -
> -Files created in output directory
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -output/images
> -
> -=E2=94=9C=E2=94=80=E2=94=80 bl31.elf
> -=E2=94=9C=E2=94=80=E2=94=80 idbloader.img
> -=E2=94=9C=E2=94=80=E2=94=80 Image
> -=E2=94=9C=E2=94=80=E2=94=80 rk3399-roc-pc.dtb
> -=E2=94=9C=E2=94=80=E2=94=80 rootfs.ext2
> -=E2=94=9C=E2=94=80=E2=94=80 rootfs.ext4 -> rootfs.ext2
> -=E2=94=9C=E2=94=80=E2=94=80 rootfs.tar
> -=E2=94=9C=E2=94=80=E2=94=80 sdcard.img
> -=E2=94=9C=E2=94=80=E2=94=80 u-boot.bin
> -=E2=94=94=E2=94=80=E2=94=80 u-boot.itb
> -
> -Creating bootable SD card:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -
> -Simply invoke (as root)
> -
> -sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX && sync
> -
> -Where X is your SD card device
> -
> -Serial console
> ---------------
> -
> -Baudrate for this board is 1500000
> -
> -Wiki link:
> -https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/roc-rk3399-pc.html
> --
> 2.38.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000f7ad1505ec85b1dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,<div dir=3D"auto"><br></div><div dir=3D"au=
to">This is a Libre Computer only product in the future so the folder is wr=
ong. I will re-create in the right folder and maintain these boards in the =
future.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><div =
dir=3D"auto">Da</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Nov 2, 2022, 4:19 PM Thomas Petazzoni via buildr=
oot &lt;<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This defconfig has b=
een failing to build for several months, with<br>
nobody stepping up to fix it. It&#39;s time to drop it.<br>
<br>
See<br>
<a href=3D"https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsu=
rf/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.kernel.or=
g/buildroot/20220806224338.0159e15c@windsurf/</a><br>
for a notification on August 6, 2022 about the issues with this<br>
defconfig.<br>
<br>
Fixes:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/3259671=
226" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/bui=
ldroot.org/buildroot/-/jobs/3259671226</a><br>
<br>
Cc: Suniel Mahesh &lt;<a href=3D"mailto:sunil@amarulasolutions.com" target=
=3D"_blank" rel=3D"noreferrer">sunil@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank" rel=3D"noreferrer">thomas.petazzoni@bootlin.com<=
/a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0board/firefly/roc-rk3399-pc/extlinux.conf |=C2=A0 4 ---<br>
=C2=A0board/firefly/roc-rk3399-pc/genimage.cfg=C2=A0 | 22 -------------<br>
=C2=A0board/firefly/roc-rk3399-pc/post-build.sh |=C2=A0 5 ---<br>
=C2=A0board/firefly/roc-rk3399-pc/readme.txt=C2=A0 =C2=A0 | 40 ------------=
-----------<br>
=C2=A05 files changed, 73 deletions(-)<br>
=C2=A0delete mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf<br>
=C2=A0delete mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg<br>
=C2=A0delete mode 100755 board/firefly/roc-rk3399-pc/post-build.sh<br>
=C2=A0delete mode 100644 board/firefly/roc-rk3399-pc/readme.txt<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 9569ee720b..591276bec8 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -2729,13 +2729,11 @@ F:=C2=A0 =C2=A0 =C2=A0 package/hwloc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/powertop/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Suniel Mahesh &lt;<a href=3D"mailto:sunil@amaru=
lasolutions.com" target=3D"_blank" rel=3D"noreferrer">sunil@amarulasolution=
s.com</a>&gt;<br>
-F:=C2=A0 =C2=A0 =C2=A0board/firefly/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/friendlyarm/nanopi-m4<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/pine64/rockpro64<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/radxa/rockpi-4<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/radxa/rockpi-n8<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/radxa/rockpi-n10<br>
-F:=C2=A0 =C2=A0 =C2=A0configs/roc_pc_rk3399_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/rock_pi_4_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/rock_pi_n8_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/rock_pi_n10_defconfig<br>
diff --git a/board/firefly/roc-rk3399-pc/extlinux.conf b/board/firefly/roc-=
rk3399-pc/extlinux.conf<br>
deleted file mode 100644<br>
index 50a358fadc..0000000000<br>
--- a/board/firefly/roc-rk3399-pc/extlinux.conf<br>
+++ /dev/null<br>
@@ -1,4 +0,0 @@<br>
-label RK3399RocPC linux<br>
-=C2=A0 kernel /boot/Image<br>
-=C2=A0 devicetree /boot/rk3399-roc-pc.dtb<br>
-=C2=A0 append earlycon=3Duart8250,mmio32,0xff1a0000 root=3D/dev/mmcblk0p1 =
rootwait<br>
diff --git a/board/firefly/roc-rk3399-pc/genimage.cfg b/board/firefly/roc-r=
k3399-pc/genimage.cfg<br>
deleted file mode 100644<br>
index 966c869273..0000000000<br>
--- a/board/firefly/roc-rk3399-pc/genimage.cfg<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-image sdcard.img {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot-tpl-spl-dtb {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;idb=
loader.img&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 32K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot-dtb {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-b=
oot.itb&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8M<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 30M<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext4&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/board/firefly/roc-rk3399-pc/post-build.sh b/board/firefly/roc-=
rk3399-pc/post-build.sh<br>
deleted file mode 100755<br>
index 1f5ff6a611..0000000000<br>
--- a/board/firefly/roc-rk3399-pc/post-build.sh<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-#!/bin/sh<br>
-<br>
-BOARD_DIR=3D&quot;$(dirname $0)&quot;<br>
-<br>
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extl=
inux.conf<br>
diff --git a/board/firefly/roc-rk3399-pc/readme.txt b/board/firefly/roc-rk3=
399-pc/readme.txt<br>
deleted file mode 100644<br>
index 8a6f1cdee6..0000000000<br>
--- a/board/firefly/roc-rk3399-pc/readme.txt<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-Libre Computer Board ROC-RK3399-PC<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-Build:<br>
-<br>
-=C2=A0 $ make roc_pc_rk3399_defconfig<br>
-=C2=A0 $ make<br>
-<br>
-Files created in output directory<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-output/images<br>
-<br>
-=E2=94=9C=E2=94=80=E2=94=80 bl31.elf<br>
-=E2=94=9C=E2=94=80=E2=94=80 idbloader.img<br>
-=E2=94=9C=E2=94=80=E2=94=80 Image<br>
-=E2=94=9C=E2=94=80=E2=94=80 rk3399-roc-pc.dtb<br>
-=E2=94=9C=E2=94=80=E2=94=80 rootfs.ext2<br>
-=E2=94=9C=E2=94=80=E2=94=80 rootfs.ext4 -&gt; rootfs.ext2<br>
-=E2=94=9C=E2=94=80=E2=94=80 rootfs.tar<br>
-=E2=94=9C=E2=94=80=E2=94=80 sdcard.img<br>
-=E2=94=9C=E2=94=80=E2=94=80 u-boot.bin<br>
-=E2=94=94=E2=94=80=E2=94=80 u-boot.itb<br>
-<br>
-Creating bootable SD card:<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
-<br>
-Simply invoke (as root)<br>
-<br>
-sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX &amp;&amp; sync<br>
-<br>
-Where X is your SD card device<br>
-<br>
-Serial console<br>
---------------<br>
-<br>
-Baudrate for this board is 1500000<br>
-<br>
-Wiki link:<br>
-<a href=3D"https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/roc-rk339=
9-pc.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.ama=
rulasolutions.com/bsp/rockchip/rk3399/roc-rk3399-pc.html</a><br>
-- <br>
2.38.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div></div></div>

--000000000000f7ad1505ec85b1dc--

--===============0039523395762046719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0039523395762046719==--
