Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF88ACA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 12:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BC540ABE;
	Tue, 19 Aug 2025 12:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZOvpDqASs76; Tue, 19 Aug 2025 12:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 918B840ABF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918B840ABF;
	Tue, 19 Aug 2025 12:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA4BE0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95B2340ABE
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SY2cusdRaKl1 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 12:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDE3440ABD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE3440ABD
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDE3440ABD
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:00:52 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b47174beb13so3726976a12.2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 05:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755604852; x=1756209652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vsJfK1nxjlZ3BwZqzErT++1JTPs+lbDijraj1Kp0I9o=;
 b=qOa6vjJOfEKTP0h4Zp8QxWy2a7tvqeSZo53Ndw1ftHOiDvkn/5QOcIA3j5ry2XboIe
 0L/urzPuyejkeLY/L4KEwPkTGaVBoVq/cqNpdX3FR3xcm6NKtUV3/x73fat6XCkvHQM8
 K2zzZk/dCpy6IXbwDhkti0qsVdZlCJy4vEGtmNuR1nNLMip/HtFwyMQgQqEQ5QFrd0Kv
 ToQOVbDoS/LqDDOwzXS5R7zWmZMO/mVsjPoV7RpBoWyTADe+4rxsVU7jIVreUNW08fL2
 Soa4FsRgMb1vNVD71EU+AMh+BTROyvNr4BElPkOmzwCTJ1T6lgwOVLT2mDP6sd60EzxM
 jChA==
X-Gm-Message-State: AOJu0YwAe8H2AKmS0gC8/Wl6G4U7+XGGTz1YWa4sMdW8mXHvC7QmK4MK
 NRJ5M9v1y+z1kuR55mU3gZODc8vI/3bexA0jMwvF94bRj5x2+32vEduXcq6HZ/5sfZPbnqQMWm1
 lHfk57HMTLmwEDclTSMzsYFGzBOCoa/RMCQFIvI9vzw==
X-Gm-Gg: ASbGnct2YWkb9OqzDiDqaw+WCkjtfZmXfZUNhvyK7oRqDSAkza/Q5Bty1fW9rLywCIg
 GozWSW7Wybc8oOUj9VUusg+RwJgFqdC7L0EOQAvpKPmJrxORI2PdJzoEchcHVYLINAeEQnaymLH
 miUPc8ExM/PL5v/GprpOp8bgWzXsryuaA1aDu8MYfsgGiqwFwSGDfjCS7b3z/3T+5EWYTbDl66b
 et3mEWlor69hnn0MvpM23842eYWDyodUWqBqrSK
X-Google-Smtp-Source: AGHT+IHYPJ5PK+GG5+FZ28RI9cwBKBNlYFeEtJ+9pD1kYcdKRQ4hOKkVFP4Mh9q+3en7Y2QV9k4GTBLnOyA3iThIeOI=
X-Received: by 2002:a17:902:fc4c:b0:23f:df33:21cb with SMTP id
 d9443c01a7336-245e056db02mr26332285ad.44.1755604851213; Tue, 19 Aug 2025
 05:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250818213241.3270409-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20250818213241.3270409-1-thomas.petazzoni@bootlin.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 14:00:38 +0200
X-Gm-Features: Ac12FXyXy_9blbe4RWyuX8XjZM6HQVZaaqCOZgloHkLygxf5VelRtB5rkpWlmC0
Message-ID: <CAOf5uwm3V8hsY5YofupxYJufNqSMmAferLhtUrrMC6NtO6RF7w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Meena Murthy <meena.murthy@amarulasolutions.com>, 
 Suniel Mahesh <sunil@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755604852; x=1756209652;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vsJfK1nxjlZ3BwZqzErT++1JTPs+lbDijraj1Kp0I9o=;
 b=UI91ON6THm5q2rHec33246K6BTe2DHswjvhhzWwG6Sk90JLrYA7zaRc8t2nTB8LJ8/
 EM56MxtD6PhSqyYSUM+oROTLAuwI5XpZQUI8xmRemKk9mAdvEBopkBbek3HNHyIvxZzR
 U8Kyh+VFy1jKipm8g6iFNvQSjDCapvMl13rP4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UI91ON6T
Subject: Re: [Buildroot] [PATCH] configs/engicam_imx6*: remove defconfigs,
 broken
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
Content-Type: multipart/mixed; boundary="===============7734109697119386699=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7734109697119386699==
Content-Type: multipart/alternative; boundary="00000000000085dd0a063cb69be2"

--00000000000085dd0a063cb69be2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas

On Mon, Aug 18, 2025 at 11:32=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Remove numerous Engicam i.MX6 defconfigs as they don't build:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273148
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273147
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273145
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273144
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273136
>
> All of them are using outdated Linux kernel versions, not even LTS,
> which fail to build with modern toolchains.
>
>
We would like to fix them. We need a bit of time up to the end of September=
.

Can you please wait?

Michael



> Unless fixes are provided, these defconfigs will be dropped.
>
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Cc: Suniel Mahesh <sunil@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .checkpackageignore                           |  5 -
>  DEVELOPERS                                    |  5 -
>  board/engicam/geam6ul/genimage.cfg            | 39 --------
>  board/engicam/geam6ul/readme.txt              | 66 -------------
>  board/engicam/icorem6/genimage.cfg            | 42 ---------
>  board/engicam/icorem6/linux_qt5.fragment      |  4 -
>  board/engicam/icorem6/readme.txt              | 93 -------------------
>  .../root/imx6qdl-icore-ofcap10.json           | 11 ---
>  .../root/imx6qdl-icore-ofcap12.json           | 11 ---
>  .../rootfs_overlay/root/imx6qdl-icore.json    | 11 ---
>  board/engicam/icorem6_rqs/genimage.cfg        | 40 --------
>  board/engicam/icorem6_rqs/readme.txt          | 69 --------------
>  board/engicam/isiot/genimage.cfg              | 39 --------
>  board/engicam/isiot/readme.txt                | 66 -------------
>  configs/engicam_imx6qdl_icore_defconfig       | 33 -------
>  configs/engicam_imx6qdl_icore_qt5_defconfig   | 60 ------------
>  configs/engicam_imx6qdl_icore_rqs_defconfig   | 33 -------
>  configs/engicam_imx6ul_geam_defconfig         | 33 -------
>  configs/engicam_imx6ul_isiot_defconfig        | 33 -------
>  19 files changed, 693 deletions(-)
>  delete mode 100644 board/engicam/geam6ul/genimage.cfg
>  delete mode 100644 board/engicam/geam6ul/readme.txt
>  delete mode 100644 board/engicam/icorem6/genimage.cfg
>  delete mode 100644 board/engicam/icorem6/linux_qt5.fragment
>  delete mode 100644 board/engicam/icorem6/readme.txt
>  delete mode 100644
> board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
>  delete mode 100644
> board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
>  delete mode 100644
> board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
>  delete mode 100644 board/engicam/icorem6_rqs/genimage.cfg
>  delete mode 100644 board/engicam/icorem6_rqs/readme.txt
>  delete mode 100644 board/engicam/isiot/genimage.cfg
>  delete mode 100644 board/engicam/isiot/readme.txt
>  delete mode 100644 configs/engicam_imx6qdl_icore_defconfig
>  delete mode 100644 configs/engicam_imx6qdl_icore_qt5_defconfig
>  delete mode 100644 configs/engicam_imx6qdl_icore_rqs_defconfig
>  delete mode 100644 configs/engicam_imx6ul_geam_defconfig
>  delete mode 100644 configs/engicam_imx6ul_isiot_defconfig
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index a3642ca61f..5328f4f307 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -119,11 +119,6 @@ configs/bananapi_m2_zero_defconfig
> lib_defconfig.ForceCheckHash
>  configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
>  configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
>  configs/ci20_defconfig lib_defconfig.ForceCheckHash
> -configs/engicam_imx6qdl_icore_defconfig lib_defconfig.ForceCheckHash
> -configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
> -configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
> -configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
> -configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
>  configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
>  configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
>  configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cffb7f51e2..1888175d3b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1498,11 +1498,6 @@ F:       board/orangepi/orangepi-zero-plus2/
>  F:     board/pine64/
>  F:     configs/amarula_vyasa_rk3288_defconfig
>  F:     configs/asus_tinker_rk3288_defconfig
> -F:     configs/engicam_imx6qdl_icore_defconfig
> -F:     configs/engicam_imx6qdl_icore_qt5_defconfig
> -F:     configs/engicam_imx6qdl_icore_rqs_defconfig
> -F:     configs/engicam_imx6ul_geam_defconfig
> -F:     configs/engicam_imx6ul_isiot_defconfig
>  F:     configs/olimex_a33_olinuxino_defconfig
>  F:     configs/olimex_a64_olinuxino_defconfig
>  F:     configs/orangepi_lite2_defconfig
> diff --git a/board/engicam/geam6ul/genimage.cfg
> b/board/engicam/geam6ul/genimage.cfg
> deleted file mode 100644
> index 3d290b2ea6..0000000000
> --- a/board/engicam/geam6ul/genimage.cfg
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -image boot.vfat {
> -       vfat {
> -               files =3D {
> -                       "uImage",
> -                       "imx6ul-geam-kit.dtb"
> -               }
> -       }
> -
> -       size =3D 64M
> -}
> -
> -image sdcard.img {
> -       hdimage {
> -       }
> -
> -       partition SPL {
> -               in-partition-table =3D "no"
> -               image =3D "SPL"
> -               offset =3D 1K
> -       }
> -
> -       partition u-boot-dtb {
> -               in-partition-table =3D "no"
> -               image =3D "u-boot-dtb.img"
> -               offset =3D 69K
> -       }
> -
> -       partition boot {
> -               partition-type =3D 0xC
> -               bootable =3D "true"
> -               image =3D "boot.vfat"
> -               offset =3D 8M
> -       }
> -
> -       partition rootfs {
> -               partition-type =3D 0x83
> -               image =3D "rootfs.ext2"
> -       }
> -}
> diff --git a/board/engicam/geam6ul/readme.txt
> b/board/engicam/geam6ul/readme.txt
> deleted file mode 100644
> index ace993a661..0000000000
> --- a/board/engicam/geam6ul/readme.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -********************************************
> -Buildroot for Engicam GEAM6UL SOM platforms:
> -********************************************
> -
> -This file documents the Buildroot support for all Engicam GEAM6UL
> -SOM platform boards.
> -
> -GEAM6UL SOM Starter kits:
> -https://www.engicam.com/vis-prod/101115
> -
> -This configuration uses U-Boot mainline and kernel mainline.
> -
> -Build
> -=3D=3D=3D=3D=3D
> -
> -First, configure Buildroot for the Engicam GEAM6UL SOM:
> -
> -- for GEAM6UL SOM:
> -
> -  make engicam_imx6ul_geam_defconfig
> -
> -Build all components:
> -
> -  make
> -
> -You will find the following files in output/images/:
> -  - imx6ul-geam-kit.dtb
> -  - rootfs.ext4
> -  - rootfs.tar
> -  - sdcard.img
> -  - SPL
> -  - u-boot-dtb.img
> -  - uImage
> -
> -Create a bootable SD card
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -To determine the device associated to the SD card have a look in the
> -/proc/partitions file:
> -
> -  cat /proc/partitions
> -
> -Buildroot prepares a bootable "sdcard.img" image in the output/images/
> -directory, ready to be dumped on a SD card. Launch the following
> -command as root:
> -
> -  dd if=3Doutput/images/sdcard.img of=3D/dev/<your-sd-device>
> -  sync
> -
> -*** WARNING! This will destroy all the card content. Use with care! ***
> -
> -For details about the medium image layout, see the definition in
> -board/engicam/geam6ul/genimage.cfg
> -
> -Boot the GEAM6UL boards with SD boot:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -To boot your newly created system:
> -- insert the SD card in the SD slot of the board;
> -- connect 3-wire RS232 serial port J28 on board, and connect with other
> -  serial end or USB cable(if serial-to-usb converter used) using
> -  a terminal emulator at 115200 bps, 8n1;
> -- close JM3 for sd boot.
> -- power on the board.
> -
> -Enjoy!
> diff --git a/board/engicam/icorem6/genimage.cfg
> b/board/engicam/icorem6/genimage.cfg
> deleted file mode 100644
> index 985d9e5de1..0000000000
> --- a/board/engicam/icorem6/genimage.cfg
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -image boot.vfat {
> -       vfat {
> -               files =3D {
> -                       "uImage",
> -                       "imx6dl-icore.dtb",
> -                       "imx6q-icore.dtb",
> -                       "imx6q-icore-ofcap10.dtb",
> -                       "imx6q-icore-ofcap12.dtb"
> -               }
> -       }
> -
> -       size =3D 64M
> -}
> -
> -image sdcard.img {
> -       hdimage {
> -       }
> -
> -       partition SPL {
> -               in-partition-table =3D "no"
> -               image =3D "SPL"
> -               offset =3D 1K
> -       }
> -
> -       partition u-boot-dtb {
> -               in-partition-table =3D "no"
> -               image =3D "u-boot-dtb.img"
> -               offset =3D 69K
> -       }
> -
> -       partition boot {
> -               partition-type =3D 0xC
> -               bootable =3D "true"
> -               image =3D "boot.vfat"
> -               offset =3D 8M
> -       }
> -
> -       partition rootfs {
> -               partition-type =3D 0x83
> -               image =3D "rootfs.ext2"
> -       }
> -}
> diff --git a/board/engicam/icorem6/linux_qt5.fragment
> b/board/engicam/icorem6/linux_qt5.fragment
> deleted file mode 100644
> index 5c0505e510..0000000000
> --- a/board/engicam/icorem6/linux_qt5.fragment
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Currently kernel mainline exhibits issues when running cpufreq as
> ondemand
> -# governor on mx6.
> -# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> -CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> diff --git a/board/engicam/icorem6/readme.txt
> b/board/engicam/icorem6/readme.txt
> deleted file mode 100644
> index bd78c5a556..0000000000
> --- a/board/engicam/icorem6/readme.txt
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -*********************************************
> -Buildroot for Engicam i.CoreM6 SOM platforms:
> -*********************************************
> -
> -This file documents the Buildroot support for Engicam i.CoreM6
> -platform boards.
> -
> -i.CoreM6 Quad/Dual/DualLite/Solo SOM Starter kits:
> -https://www.engicam.com/vis-prod/101120
> -i.CoreM6 Quad/Dual/DualLite/Solo Open Frame 10.1 C.TOUCH kits:
> -https://www.engicam.com/vis-prod/101133
> -
> -This configuration uses U-Boot mainline and kernel mainline.
> -
> -Build
> -=3D=3D=3D=3D=3D
> -
> -First, configure Buildroot for the Engicam i.CoreM6:
> -
> -  make engicam_imx6qdl_icore_defconfig
> -
> -Build all components:
> -
> -  make
> -
> -You will find the following files in output/images/:
> -  - imx6q-icore.dtb (for i.CoreM6 Quad/Dual)
> -  - imx6dl-icore.dtb (for i.CoreM6 DualLite/Solo)
> -  - imx6q-icore-ofcap10.dtb (for i.CoreM6 Quad/Dual ofcap 10)
> -  - imx6q-icore-ofcap12.dtb (for i.CoreM6 Quad/Dual ofcap 12)
> -  - rootfs.ext4
> -  - rootfs.tar
> -  - sdcard.img
> -  - SPL
> -  - u-boot-dtb.img
> -  - uImage
> -
> -Create a bootable SD card
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -To determine the device associated to the SD card have a look in the
> -/proc/partitions file:
> -
> -  cat /proc/partitions
> -
> -Buildroot prepares a bootable "sdcard.img" image in the output/images/
> -directory, ready to be dumped on a SD card. Launch the following
> -command as root:
> -
> -  dd if=3Doutput/images/sdcard.img of=3D/dev/<your-sd-device>
> -  sync
> -
> -*** WARNING! This will destroy all the card content. Use with care! ***
> -
> -For details about the medium image layout, see the definition in
> -board/engicam/icorem6/genimage.cfg
> -
> -Boot the i.CoreM6 boards with SD boot:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -To boot your newly created system:
> -- insert the SD card in the SD slot of the board;
> -- connect 3-wire RS232 serial port J28 on board, and connect with other
> -  serial end or USB cable(if serial-to-usb converter used) using
> -  a terminal emulator at 115200 bps, 8n1;
> -- close JM3 for sd boot.
> -- power on the board.
> -
> -Testing graphics on i.CoreM6:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> -
> -Build with support for Etnaviv, Qt5 and demo applications:
> -
> -  make engicam_imx6qdl_icore_qt5_defconfig
> -  make
> -
> -Running kmscube
> -# kmscube -D /dev/dri/card1
> -
> -Running glmark2-es2-drm
> -# glmark2-es2-drm
> -
> -Running Qt5 Cinematic Demo:
> -- for i.CoreM6 Starter Kit
> -# export QT_QPA_EGLFS_KMS_CONFIG=3D/root/imx6qdl-icore.json
> -- for i.CoreM6 ofcap10
> -# export QT_QPA_EGLFS_KMS_CONFIG=3D/root/imx6qdl-icore-ofcap10.json
> -- for i.CoreM6 ofcap12
> -# export QT_QPA_EGLFS_KMS_CONFIG=3D/root/imx6qdl-icore-ofcap12.json
> -
> -# CinematicExperience-demo
> -
> -Enjoy!
> diff --git
> a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
> b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
> deleted file mode 100644
> index 3bfe4a2362..0000000000
> --- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.jso=
n
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -{
> -  "device": "/dev/dri/card1",
> -  "hwcursor": false,
> -  "pbuffers": true,
> -  "outputs": [
> -    {
> -      "name": "LVDS1",
> -      "mode": "1280x800"
> -    }
> -  ]
> -}
> diff --git
> a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
> b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
> deleted file mode 100644
> index ea5ce6f97a..0000000000
> --- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.jso=
n
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -{
> -  "device": "/dev/dri/card1",
> -  "hwcursor": false,
> -  "pbuffers": true,
> -  "outputs": [
> -    {
> -      "name": "LVDS1",
> -      "mode": "1280x480"
> -    }
> -  ]
> -}
> diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> deleted file mode 100644
> index b4fa359b64..0000000000
> --- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -{
> -  "device": "/dev/dri/card1",
> -  "hwcursor": false,
> -  "pbuffers": true,
> -  "outputs": [
> -    {
> -      "name": "LVDS1",
> -      "mode": "800x480"
> -    }
> -  ]
> -}
> diff --git a/board/engicam/icorem6_rqs/genimage.cfg
> b/board/engicam/icorem6_rqs/genimage.cfg
> deleted file mode 100644
> index d6936f8109..0000000000
> --- a/board/engicam/icorem6_rqs/genimage.cfg
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -image boot.vfat {
> -       vfat {
> -               files =3D {
> -                       "uImage",
> -                       "imx6dl-icore-rqs.dtb",
> -                       "imx6q-icore-rqs.dtb"
> -               }
> -       }
> -
> -       size =3D 64M
> -}
> -
> -image sdcard.img {
> -       hdimage {
> -       }
> -
> -       partition SPL {
> -               in-partition-table =3D "no"
> -               image =3D "SPL"
> -               offset =3D 1K
> -       }
> -
> -       partition u-boot-dtb {
> -               in-partition-table =3D "no"
> -               image =3D "u-boot-dtb.img"
> -               offset =3D 69K
> -       }
> -
> -       partition boot {
> -               partition-type =3D 0xC
> -               bootable =3D "true"
> -               image =3D "boot.vfat"
> -               offset =3D 8M
> -       }
> -
> -       partition rootfs {
> -               partition-type =3D 0x83
> -               image =3D "rootfs.ext2"
> -       }
> -}
> diff --git a/board/engicam/icorem6_rqs/readme.txt
> b/board/engicam/icorem6_rqs/readme.txt
> deleted file mode 100644
> index a0bf6f508f..0000000000
> --- a/board/engicam/icorem6_rqs/readme.txt
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -*************************************************
> -Buildroot for Engicam i.CoreM6 RQS SOM platforms:
> -*************************************************
> -
> -This file documents the Buildroot support for Engicam i.CoreM6 RQS
> -SOM platform boards.
> -
> -i.CoreM6 Quad/Dual/DualLite/Solo RQS SOM Starter kits:
> -https://www.engicam.com/vis-prod/101124
> -
> -This configuration uses U-Boot mainline and kernel mainline.
> -
> -Build
> -=3D=3D=3D=3D=3D
> -
> -First, configure Buildroot for the Engicam i.CoreM6 RQS:
> -
> -- for i.CoreM6 RQS Quad/Dual/DualLite/Solo:
> -
> -  make engicam_imx6qdl_icore_rqs_defconfig
> -
> -Build all components:
> -
> -  make
> -
> -You will find the following files in output/images/:
> -- for i.CoreM6 Quad/Dual RQS:
> -  - imx6q-icore-rqs.dtb
> -- for i.CoreM6 DualLite/Solo RQS:
> -  - imx6dl-icore-rqs.dtb
> -  - rootfs.ext4
> -  - rootfs.tar
> -  - sdcard.img
> -  - SPL
> -  - u-boot-dtb.img
> -  - uImage
> -
> -Create a bootable SD card
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -To determine the device associated to the SD card have a look in the
> -/proc/partitions file:
> -
> -  cat /proc/partitions
> -
> -Buildroot prepares a bootable "sdcard.img" image in the output/images/
> -directory, ready to be dumped on a SD card. Launch the following
> -command as root:
> -
> -  dd if=3Doutput/images/sdcard.img of=3D/dev/<your-sd-device>
> -  sync
> -
> -*** WARNING! This will destroy all the card content. Use with care! ***
> -
> -For details about the medium image layout, see the definition in
> -board/engicam/icorem6_rqs/genimage.cfg
> -
> -Boot the i.CoreM6 RQS boards with SD boot:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -To boot your newly created system:
> -- insert the SD card in the SD slot of the board;
> -- connect 3-wire RS232 serial port J7 on board, and connect with other
> -  serial end or USB cable(if serial-to-usb converter used) using
> -  a terminal emulator at 115200 bps, 8n1;
> -- close JM2 for sd boot.
> -- power on the board.
> -
> -Enjoy!
> diff --git a/board/engicam/isiot/genimage.cfg
> b/board/engicam/isiot/genimage.cfg
> deleted file mode 100644
> index 4e65a70110..0000000000
> --- a/board/engicam/isiot/genimage.cfg
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -image boot.vfat {
> -       vfat {
> -               files =3D {
> -                       "uImage",
> -                       "imx6ul-isiot-emmc.dtb"
> -               }
> -       }
> -
> -       size =3D 64M
> -}
> -
> -image sdcard.img {
> -       hdimage {
> -       }
> -
> -       partition SPL {
> -               in-partition-table =3D "no"
> -               image =3D "SPL"
> -               offset =3D 1K
> -       }
> -
> -       partition u-boot-dtb {
> -               in-partition-table =3D "no"
> -               image =3D "u-boot-dtb.img"
> -               offset =3D 69K
> -       }
> -
> -       partition boot {
> -               partition-type =3D 0xC
> -               bootable =3D "true"
> -               image =3D "boot.vfat"
> -               offset =3D 8M
> -       }
> -
> -       partition rootfs {
> -               partition-type =3D 0x83
> -               image =3D "rootfs.ext2"
> -       }
> -}
> diff --git a/board/engicam/isiot/readme.txt
> b/board/engicam/isiot/readme.txt
> deleted file mode 100644
> index 5394007ca5..0000000000
> --- a/board/engicam/isiot/readme.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -********************************************
> -Buildroot for Engicam Is.IoT SOM platforms:
> -********************************************
> -
> -This file documents the Buildroot support for all Engicam Is.IoT MX6UL
> -SOM platform boards.
> -
> -Is.IoT MX6UL SOM Starter kits:
> -https://www.engicam.com/vis-prod/101122
> -
> -This configuration uses U-Boot mainline and kernel mainline.
> -
> -Build
> -=3D=3D=3D=3D=3D
> -
> -First, configure Buildroot for the Engicam Is.IoT MX6UL SOM:
> -
> -- for Is.IoT MX6UL SOM:
> -
> -  make engicam_imx6ul_isiot_defconfig
> -
> -Build all components:
> -
> -  make
> -
> -You will find the following files in output/images/:
> -  - imx6ul-isiot-emmc.dtb
> -  - rootfs.ext4
> -  - rootfs.tar
> -  - sdcard.img
> -  - SPL
> -  - u-boot-dtb.img
> -  - uImage
> -
> -Create a bootable SD card
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -To determine the device associated to the SD card have a look in the
> -/proc/partitions file:
> -
> -  cat /proc/partitions
> -
> -Buildroot prepares a bootable "sdcard.img" image in the output/images/
> -directory, ready to be dumped on a SD card. Launch the following
> -command as root:
> -
> -  dd if=3Doutput/images/sdcard.img of=3D/dev/<your-sd-device>
> -  sync
> -
> -*** WARNING! This will destroy all the card content. Use with care! ***
> -
> -For details about the medium image layout, see the definition in
> -board/engicam/isiot/genimage.cfg
> -
> -Boot the Is.IoT MX6UL boards with SD boot:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -To boot your newly created system:
> -- insert the SD card in the SD slot of the board;
> -- connect 3-wire RS232 serial port J28 on board, and connect with other
> -  serial end or USB cable(if serial-to-usb converter used) using
> -  a terminal emulator at 115200 bps, 8n1;
> -- close JM3 for sd boot.
> -- power on the board.
> -
> -Enjoy!
> diff --git a/configs/engicam_imx6qdl_icore_defconfig
> b/configs/engicam_imx6qdl_icore_defconfig
> deleted file mode 100644
> index 2ac415e335..0000000000
> --- a/configs/engicam_imx6qdl_icore_defconfig
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -BR2_arm=3Dy
> -BR2_cortex_a9=3Dy
> -BR2_ARM_ENABLE_NEON=3Dy
> -BR2_ARM_ENABLE_VFP=3Dy
> -BR2_ARM_FPU_VFPV3=3Dy
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=3Dy
> -BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Engicam i.CoreM6
> Quad/Dual/DualLite/Solo"
> -BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc3"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/engicam/icorem6/genimage.cfg"
> -BR2_LINUX_KERNEL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.0"
> -BR2_LINUX_KERNEL_DEFCONFIG=3D"imx_v6_v7"
> -BR2_LINUX_KERNEL_UIMAGE=3Dy
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D"0x10008000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"imx6dl-icore imx6q-icore
> imx6q-icore-ofcap10 imx6q-icore-ofcap12"
> -BR2_TARGET_ROOTFS_EXT2=3Dy
> -BR2_TARGET_ROOTFS_EXT2_4=3Dy
> -BR2_TARGET_UBOOT=3Dy
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2019.01"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx6qdl_icore_mmc"
> -BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> -BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy
> -BR2_TARGET_UBOOT_SPL=3Dy
> -BR2_TARGET_UBOOT_SPL_NAME=3D"SPL"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> -BR2_PACKAGE_HOST_GENIMAGE=3Dy
> -BR2_PACKAGE_HOST_MTOOLS=3Dy
> diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig
> b/configs/engicam_imx6qdl_icore_qt5_defconfig
> deleted file mode 100644
> index 8b0c8bbe28..0000000000
> --- a/configs/engicam_imx6qdl_icore_qt5_defconfig
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -BR2_arm=3Dy
> -BR2_cortex_a9=3Dy
> -BR2_ARM_ENABLE_NEON=3Dy
> -BR2_ARM_ENABLE_VFP=3Dy
> -BR2_ARM_FPU_VFPV3=3Dy
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=3Dy
> -BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
> -BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Engicam i.CoreM6
> Quad/Dual/DualLite/Solo"
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=3Dy
> -BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc3"
> -BR2_ROOTFS_OVERLAY=3D"board/engicam/icorem6/rootfs_overlay"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/engicam/icorem6/genimage.cfg"
> -BR2_LINUX_KERNEL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"4.13"
> -BR2_LINUX_KERNEL_DEFCONFIG=3D"imx_v6_v7"
>
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/engicam/icorem6/linux_qt=
5.fragment"
> -BR2_LINUX_KERNEL_UIMAGE=3Dy
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D"0x10008000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"imx6dl-icore imx6q-icore
> imx6q-icore-ofcap10 imx6q-icore-ofcap12"
> -BR2_PACKAGE_BITSTREAM_VERA=3Dy
> -BR2_PACKAGE_CANTARELL=3Dy
> -BR2_PACKAGE_DEJAVU=3Dy
> -BR2_PACKAGE_FONT_AWESOME=3Dy
> -BR2_PACKAGE_GHOSTSCRIPT_FONTS=3Dy
> -BR2_PACKAGE_INCONSOLATA=3Dy
> -BR2_PACKAGE_LIBERATION=3Dy
> -BR2_PACKAGE_GLMARK2=3Dy
> -BR2_PACKAGE_KMSCUBE=3Dy
> -BR2_PACKAGE_MESA3D_DEMOS=3Dy
> -BR2_PACKAGE_QT5CINEX=3Dy
> -BR2_PACKAGE_QT5CINEX_HD=3Dy
> -BR2_PACKAGE_MESA3D=3Dy
> -BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=3Dy
> -BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy
> -BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy
> -BR2_PACKAGE_QT5=3Dy
> -BR2_PACKAGE_QT5BASE_OPENGL_LIB=3Dy
> -BR2_PACKAGE_QT5BASE_LINUXFB=3Dy
> -BR2_PACKAGE_QT5BASE_FONTCONFIG=3Dy
> -BR2_PACKAGE_QT5BASE_GIF=3Dy
> -BR2_PACKAGE_QT5BASE_JPEG=3Dy
> -BR2_TARGET_ROOTFS_EXT2=3Dy
> -BR2_TARGET_ROOTFS_EXT2_4=3Dy
> -BR2_TARGET_ROOTFS_EXT2_SIZE=3D"120M"
> -BR2_TARGET_UBOOT=3Dy
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2017.07"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx6qdl_icore_mmc"
> -BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> -BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy
> -BR2_TARGET_UBOOT_SPL=3Dy
> -BR2_TARGET_UBOOT_SPL_NAME=3D"SPL"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> -BR2_PACKAGE_HOST_GENIMAGE=3Dy
> -BR2_PACKAGE_HOST_MTOOLS=3Dy
> diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig
> b/configs/engicam_imx6qdl_icore_rqs_defconfig
> deleted file mode 100644
> index 7d4d4e3df4..0000000000
> --- a/configs/engicam_imx6qdl_icore_rqs_defconfig
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -BR2_arm=3Dy
> -BR2_cortex_a9=3Dy
> -BR2_ARM_ENABLE_NEON=3Dy
> -BR2_ARM_ENABLE_VFP=3Dy
> -BR2_ARM_FPU_VFPV3=3Dy
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=3Dy
> -BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Engicam i.CoreM6
> Quad/Dual/DualLite/Solo RQS Starter Kit"
> -BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc3"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/engicam/icorem6_rqs/genimage.cfg=
"
> -BR2_LINUX_KERNEL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.0"
> -BR2_LINUX_KERNEL_DEFCONFIG=3D"imx_v6_v7"
> -BR2_LINUX_KERNEL_UIMAGE=3Dy
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D"0x10008000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"imx6dl-icore-rqs imx6q-icore-rqs"
> -BR2_TARGET_ROOTFS_EXT2=3Dy
> -BR2_TARGET_ROOTFS_EXT2_4=3Dy
> -BR2_TARGET_UBOOT=3Dy
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2019.01"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx6qdl_icore_rqs"
> -BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> -BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy
> -BR2_TARGET_UBOOT_SPL=3Dy
> -BR2_TARGET_UBOOT_SPL_NAME=3D"SPL"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> -BR2_PACKAGE_HOST_GENIMAGE=3Dy
> -BR2_PACKAGE_HOST_MTOOLS=3Dy
> diff --git a/configs/engicam_imx6ul_geam_defconfig
> b/configs/engicam_imx6ul_geam_defconfig
> deleted file mode 100644
> index ed4b491ebe..0000000000
> --- a/configs/engicam_imx6ul_geam_defconfig
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -BR2_arm=3Dy
> -BR2_cortex_a9=3Dy
> -BR2_ARM_ENABLE_NEON=3Dy
> -BR2_ARM_ENABLE_VFP=3Dy
> -BR2_ARM_FPU_VFPV3=3Dy
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=3Dy
> -BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Engicam GEAM6UL Starter Kit"
> -BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/engicam/geam6ul/genimage.cfg"
> -BR2_LINUX_KERNEL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"4.11.5"
> -BR2_LINUX_KERNEL_DEFCONFIG=3D"imx_v6_v7"
> -BR2_LINUX_KERNEL_UIMAGE=3Dy
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D"0x80008000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"imx6ul-geam-kit"
> -BR2_TARGET_ROOTFS_EXT2=3Dy
> -BR2_TARGET_ROOTFS_EXT2_4=3Dy
> -BR2_TARGET_UBOOT=3Dy
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2017.07-rc1"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx6ul_geam_mmc"
> -BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> -BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy
> -BR2_TARGET_UBOOT_SPL=3Dy
> -BR2_TARGET_UBOOT_SPL_NAME=3D"SPL"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> -BR2_PACKAGE_HOST_GENIMAGE=3Dy
> -BR2_PACKAGE_HOST_MTOOLS=3Dy
> diff --git a/configs/engicam_imx6ul_isiot_defconfig
> b/configs/engicam_imx6ul_isiot_defconfig
> deleted file mode 100644
> index 1377022c30..0000000000
> --- a/configs/engicam_imx6ul_isiot_defconfig
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -BR2_arm=3Dy
> -BR2_cortex_a9=3Dy
> -BR2_ARM_ENABLE_NEON=3Dy
> -BR2_ARM_ENABLE_VFP=3Dy
> -BR2_ARM_FPU_VFPV3=3Dy
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=3Dy
> -BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Engicam Is.IoT eMMC Starter Kit"
> -BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc0"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/engicam/isiot/genimage.cfg"
> -BR2_LINUX_KERNEL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.0"
> -BR2_LINUX_KERNEL_DEFCONFIG=3D"imx_v6_v7"
> -BR2_LINUX_KERNEL_UIMAGE=3Dy
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D"0x80008000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"imx6ul-isiot-emmc"
> -BR2_TARGET_ROOTFS_EXT2=3Dy
> -BR2_TARGET_ROOTFS_EXT2_4=3Dy
> -BR2_TARGET_UBOOT=3Dy
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2019.01"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx6ul_isiot_emmc"
> -BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> -BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> -BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy
> -BR2_TARGET_UBOOT_SPL=3Dy
> -BR2_TARGET_UBOOT_SPL_NAME=3D"SPL"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> -BR2_PACKAGE_HOST_GENIMAGE=3Dy
> -BR2_PACKAGE_HOST_MTOOLS=3Dy
> --
> 2.50.1
>
>

--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

--00000000000085dd0a063cb69be2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 18, 2025 a=
t 11:32=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Remove numerous Engicam i.MX6 defc=
onfigs as they don&#39;t build:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/1101227=
3148" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org=
/buildroot/-/jobs/11012273148</a><br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/1101227=
3147" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org=
/buildroot/-/jobs/11012273147</a><br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/1101227=
3145" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org=
/buildroot/-/jobs/11012273145</a><br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/1101227=
3144" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org=
/buildroot/-/jobs/11012273144</a><br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/1101227=
3136" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org=
/buildroot/-/jobs/11012273136</a><br>
<br>
All of them are using outdated Linux kernel versions, not even LTS,<br>
which fail to build with modern toolchains.<br>
<br></blockquote><div><br></div><div>We would like to fix them. We need a b=
it of time up to the end of September.</div><div><br></div><div>Can you ple=
ase=C2=A0wait?</div><div><br></div><div>Michael</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Unless fixes are provided, these defconfigs will be dropped.<br>
<br>
Cc: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com" t=
arget=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
Cc: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasolutions.co=
m" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;<br>
Cc: Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions.com" target=3D"=
_blank">jagan@amarulasolutions.com</a>&gt;<br>
Cc: Meena Murthy &lt;<a href=3D"mailto:meena.murthy@amarulasolutions.com" t=
arget=3D"_blank">meena.murthy@amarulasolutions.com</a>&gt;<br>
Cc: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com" t=
arget=3D"_blank">michael@amarulasolutions.com</a>&gt;<br>
Cc: Suniel Mahesh &lt;<a href=3D"mailto:sunil@amarulasolutions.com" target=
=3D"_blank">sunil@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0.checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 -<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
5 -<br>
=C2=A0board/engicam/geam6ul/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 39 --------<br>
=C2=A0board/engicam/geam6ul/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 66 -------------<br>
=C2=A0board/engicam/icorem6/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 42 ---------<br>
=C2=A0board/engicam/icorem6/linux_qt5.fragment=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 -<br>
=C2=A0board/engicam/icorem6/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 93 -------------------<br>
=C2=A0.../root/imx6qdl-icore-ofcap10.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 11 ---<br>
=C2=A0.../root/imx6qdl-icore-ofcap12.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 11 ---<br>
=C2=A0.../rootfs_overlay/root/imx6qdl-icore.json=C2=A0 =C2=A0 | 11 ---<br>
=C2=A0board/engicam/icorem6_rqs/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
0 --------<br>
=C2=A0board/engicam/icorem6_rqs/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 69 --------------<br>
=C2=A0board/engicam/isiot/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 39 --------<br>
=C2=A0board/engicam/isiot/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 66 -------------<br>
=C2=A0configs/engicam_imx6qdl_icore_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
3 -------<br>
=C2=A0configs/engicam_imx6qdl_icore_qt5_defconfig=C2=A0 =C2=A0| 60 --------=
----<br>
=C2=A0configs/engicam_imx6qdl_icore_rqs_defconfig=C2=A0 =C2=A0| 33 -------<=
br>
=C2=A0configs/engicam_imx6ul_geam_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 33 -------<br>
=C2=A0configs/engicam_imx6ul_isiot_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
3 -------<br>
=C2=A019 files changed, 693 deletions(-)<br>
=C2=A0delete mode 100644 board/engicam/geam6ul/genimage.cfg<br>
=C2=A0delete mode 100644 board/engicam/geam6ul/readme.txt<br>
=C2=A0delete mode 100644 board/engicam/icorem6/genimage.cfg<br>
=C2=A0delete mode 100644 board/engicam/icorem6/linux_qt5.fragment<br>
=C2=A0delete mode 100644 board/engicam/icorem6/readme.txt<br>
=C2=A0delete mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-=
icore-ofcap10.json<br>
=C2=A0delete mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-=
icore-ofcap12.json<br>
=C2=A0delete mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-=
icore.json<br>
=C2=A0delete mode 100644 board/engicam/icorem6_rqs/genimage.cfg<br>
=C2=A0delete mode 100644 board/engicam/icorem6_rqs/readme.txt<br>
=C2=A0delete mode 100644 board/engicam/isiot/genimage.cfg<br>
=C2=A0delete mode 100644 board/engicam/isiot/readme.txt<br>
=C2=A0delete mode 100644 configs/engicam_imx6qdl_icore_defconfig<br>
=C2=A0delete mode 100644 configs/engicam_imx6qdl_icore_qt5_defconfig<br>
=C2=A0delete mode 100644 configs/engicam_imx6qdl_icore_rqs_defconfig<br>
=C2=A0delete mode 100644 configs/engicam_imx6ul_geam_defconfig<br>
=C2=A0delete mode 100644 configs/engicam_imx6ul_isiot_defconfig<br>
<br>
diff --git a/.checkpackageignore b/.checkpackageignore<br>
index a3642ca61f..5328f4f307 100644<br>
--- a/.checkpackageignore<br>
+++ b/.checkpackageignore<br>
@@ -119,11 +119,6 @@ configs/bananapi_m2_zero_defconfig lib_defconfig.Force=
CheckHash<br>
=C2=A0configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash<br>
=C2=A0configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash<br>
=C2=A0configs/ci20_defconfig lib_defconfig.ForceCheckHash<br>
-configs/engicam_imx6qdl_icore_defconfig lib_defconfig.ForceCheckHash<br>
-configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash<b=
r>
-configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash<b=
r>
-configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash<br>
-configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash<br>
=C2=A0configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash<br>
=C2=A0configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash<b=
r>
=C2=A0configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHas=
h<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index cffb7f51e2..1888175d3b 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1498,11 +1498,6 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0board/orangepi/orangepi=
-zero-plus2/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/pine64/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/amarula_vyasa_rk3288_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/asus_tinker_rk3288_defconfig<br>
-F:=C2=A0 =C2=A0 =C2=A0configs/engicam_imx6qdl_icore_defconfig<br>
-F:=C2=A0 =C2=A0 =C2=A0configs/engicam_imx6qdl_icore_qt5_defconfig<br>
-F:=C2=A0 =C2=A0 =C2=A0configs/engicam_imx6qdl_icore_rqs_defconfig<br>
-F:=C2=A0 =C2=A0 =C2=A0configs/engicam_imx6ul_geam_defconfig<br>
-F:=C2=A0 =C2=A0 =C2=A0configs/engicam_imx6ul_isiot_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/olimex_a33_olinuxino_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/olimex_a64_olinuxino_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/orangepi_lite2_defconfig<br>
diff --git a/board/engicam/geam6ul/genimage.cfg b/board/engicam/geam6ul/gen=
image.cfg<br>
deleted file mode 100644<br>
index 3d290b2ea6..0000000000<br>
--- a/board/engicam/geam6ul/genimage.cfg<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-image boot.vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;uImage&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6ul-geam-kit.dtb&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 64M<br>
-}<br>
-<br>
-image sdcard.img {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition SPL {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;SPL=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 1K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot-dtb {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-b=
oot-dtb.img&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 69K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition boot {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0xC<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;boo=
t.vfat&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8M<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/board/engicam/geam6ul/readme.txt b/board/engicam/geam6ul/readm=
e.txt<br>
deleted file mode 100644<br>
index ace993a661..0000000000<br>
--- a/board/engicam/geam6ul/readme.txt<br>
+++ /dev/null<br>
@@ -1,66 +0,0 @@<br>
-********************************************<br>
-Buildroot for Engicam GEAM6UL SOM platforms:<br>
-********************************************<br>
-<br>
-This file documents the Buildroot support for all Engicam GEAM6UL<br>
-SOM platform boards.<br>
-<br>
-GEAM6UL SOM Starter kits:<br>
-<a href=3D"https://www.engicam.com/vis-prod/101115" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.engicam.com/vis-prod/101115</a><br>
-<br>
-This configuration uses U-Boot mainline and kernel mainline.<br>
-<br>
-Build<br>
-=3D=3D=3D=3D=3D<br>
-<br>
-First, configure Buildroot for the Engicam GEAM6UL SOM:<br>
-<br>
-- for GEAM6UL SOM:<br>
-<br>
-=C2=A0 make engicam_imx6ul_geam_defconfig<br>
-<br>
-Build all components:<br>
-<br>
-=C2=A0 make<br>
-<br>
-You will find the following files in output/images/:<br>
-=C2=A0 - imx6ul-geam-kit.dtb<br>
-=C2=A0 - rootfs.ext4<br>
-=C2=A0 - rootfs.tar<br>
-=C2=A0 - sdcard.img<br>
-=C2=A0 - SPL<br>
-=C2=A0 - u-boot-dtb.img<br>
-=C2=A0 - uImage<br>
-<br>
-Create a bootable SD card<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
-<br>
-To determine the device associated to the SD card have a look in the<br>
-/proc/partitions file:<br>
-<br>
-=C2=A0 cat /proc/partitions<br>
-<br>
-Buildroot prepares a bootable &quot;sdcard.img&quot; image in the output/i=
mages/<br>
-directory, ready to be dumped on a SD card. Launch the following<br>
-command as root:<br>
-<br>
-=C2=A0 dd if=3Doutput/images/sdcard.img of=3D/dev/&lt;your-sd-device&gt;<b=
r>
-=C2=A0 sync<br>
-<br>
-*** WARNING! This will destroy all the card content. Use with care! ***<br=
>
-<br>
-For details about the medium image layout, see the definition in<br>
-board/engicam/geam6ul/genimage.cfg<br>
-<br>
-Boot the GEAM6UL boards with SD boot:<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-To boot your newly created system:<br>
-- insert the SD card in the SD slot of the board;<br>
-- connect 3-wire RS232 serial port J28 on board, and connect with other<br=
>
-=C2=A0 serial end or USB cable(if serial-to-usb converter used) using<br>
-=C2=A0 a terminal emulator at 115200 bps, 8n1;<br>
-- close JM3 for sd boot.<br>
-- power on the board.<br>
-<br>
-Enjoy!<br>
diff --git a/board/engicam/icorem6/genimage.cfg b/board/engicam/icorem6/gen=
image.cfg<br>
deleted file mode 100644<br>
index 985d9e5de1..0000000000<br>
--- a/board/engicam/icorem6/genimage.cfg<br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-image boot.vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;uImage&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6dl-icore.dtb&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6q-icore.dtb&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6q-icore-ofcap10.dtb&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6q-icore-ofcap12.dtb&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 64M<br>
-}<br>
-<br>
-image sdcard.img {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition SPL {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;SPL=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 1K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot-dtb {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-b=
oot-dtb.img&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 69K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition boot {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0xC<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;boo=
t.vfat&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8M<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/board/engicam/icorem6/linux_qt5.fragment b/board/engicam/icore=
m6/linux_qt5.fragment<br>
deleted file mode 100644<br>
index 5c0505e510..0000000000<br>
--- a/board/engicam/icorem6/linux_qt5.fragment<br>
+++ /dev/null<br>
@@ -1,4 +0,0 @@<br>
-# Currently kernel mainline exhibits issues when running cpufreq as ondema=
nd<br>
-# governor on mx6.<br>
-# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set<br>
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy<br>
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readm=
e.txt<br>
deleted file mode 100644<br>
index bd78c5a556..0000000000<br>
--- a/board/engicam/icorem6/readme.txt<br>
+++ /dev/null<br>
@@ -1,93 +0,0 @@<br>
-*********************************************<br>
-Buildroot for Engicam i.CoreM6 SOM platforms:<br>
-*********************************************<br>
-<br>
-This file documents the Buildroot support for Engicam i.CoreM6<br>
-platform boards.<br>
-<br>
-i.CoreM6 Quad/Dual/DualLite/Solo SOM Starter kits:<br>
-<a href=3D"https://www.engicam.com/vis-prod/101120" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.engicam.com/vis-prod/101120</a><br>
-i.CoreM6 Quad/Dual/DualLite/Solo Open Frame 10.1 C.TOUCH kits:<br>
-<a href=3D"https://www.engicam.com/vis-prod/101133" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.engicam.com/vis-prod/101133</a><br>
-<br>
-This configuration uses U-Boot mainline and kernel mainline.<br>
-<br>
-Build<br>
-=3D=3D=3D=3D=3D<br>
-<br>
-First, configure Buildroot for the Engicam i.CoreM6:<br>
-<br>
-=C2=A0 make engicam_imx6qdl_icore_defconfig<br>
-<br>
-Build all components:<br>
-<br>
-=C2=A0 make<br>
-<br>
-You will find the following files in output/images/:<br>
-=C2=A0 - imx6q-icore.dtb (for i.CoreM6 Quad/Dual)<br>
-=C2=A0 - imx6dl-icore.dtb (for i.CoreM6 DualLite/Solo)<br>
-=C2=A0 - imx6q-icore-ofcap10.dtb (for i.CoreM6 Quad/Dual ofcap 10)<br>
-=C2=A0 - imx6q-icore-ofcap12.dtb (for i.CoreM6 Quad/Dual ofcap 12)<br>
-=C2=A0 - rootfs.ext4<br>
-=C2=A0 - rootfs.tar<br>
-=C2=A0 - sdcard.img<br>
-=C2=A0 - SPL<br>
-=C2=A0 - u-boot-dtb.img<br>
-=C2=A0 - uImage<br>
-<br>
-Create a bootable SD card<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
-<br>
-To determine the device associated to the SD card have a look in the<br>
-/proc/partitions file:<br>
-<br>
-=C2=A0 cat /proc/partitions<br>
-<br>
-Buildroot prepares a bootable &quot;sdcard.img&quot; image in the output/i=
mages/<br>
-directory, ready to be dumped on a SD card. Launch the following<br>
-command as root:<br>
-<br>
-=C2=A0 dd if=3Doutput/images/sdcard.img of=3D/dev/&lt;your-sd-device&gt;<b=
r>
-=C2=A0 sync<br>
-<br>
-*** WARNING! This will destroy all the card content. Use with care! ***<br=
>
-<br>
-For details about the medium image layout, see the definition in<br>
-board/engicam/icorem6/genimage.cfg<br>
-<br>
-Boot the i.CoreM6 boards with SD boot:<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-To boot your newly created system:<br>
-- insert the SD card in the SD slot of the board;<br>
-- connect 3-wire RS232 serial port J28 on board, and connect with other<br=
>
-=C2=A0 serial end or USB cable(if serial-to-usb converter used) using<br>
-=C2=A0 a terminal emulator at 115200 bps, 8n1;<br>
-- close JM3 for sd boot.<br>
-- power on the board.<br>
-<br>
-Testing graphics on i.CoreM6:<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
-<br>
-Build with support for Etnaviv, Qt5 and demo applications:<br>
-<br>
-=C2=A0 make engicam_imx6qdl_icore_qt5_defconfig<br>
-=C2=A0 make<br>
-<br>
-Running kmscube<br>
-# kmscube -D /dev/dri/card1<br>
-<br>
-Running glmark2-es2-drm<br>
-# glmark2-es2-drm<br>
-<br>
-Running Qt5 Cinematic Demo:<br>
-- for i.CoreM6 Starter Kit<br>
-# export QT_QPA_EGLFS_KMS_CONFIG=3D/root/imx6qdl-icore.json<br>
-- for i.CoreM6 ofcap10<br>
-# export QT_QPA_EGLFS_KMS_CONFIG=3D/root/imx6qdl-icore-ofcap10.json<br>
-- for i.CoreM6 ofcap12<br>
-# export QT_QPA_EGLFS_KMS_CONFIG=3D/root/imx6qdl-icore-ofcap12.json<br>
-<br>
-# CinematicExperience-demo<br>
-<br>
-Enjoy!<br>
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap1=
0.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.js=
on<br>
deleted file mode 100644<br>
index 3bfe4a2362..0000000000<br>
--- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json<=
br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-{<br>
-=C2=A0 &quot;device&quot;: &quot;/dev/dri/card1&quot;,<br>
-=C2=A0 &quot;hwcursor&quot;: false,<br>
-=C2=A0 &quot;pbuffers&quot;: true,<br>
-=C2=A0 &quot;outputs&quot;: [<br>
-=C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;LVDS1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;mode&quot;: &quot;1280x800&quot;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 ]<br>
-}<br>
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap1=
2.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.js=
on<br>
deleted file mode 100644<br>
index ea5ce6f97a..0000000000<br>
--- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json<=
br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-{<br>
-=C2=A0 &quot;device&quot;: &quot;/dev/dri/card1&quot;,<br>
-=C2=A0 &quot;hwcursor&quot;: false,<br>
-=C2=A0 &quot;pbuffers&quot;: true,<br>
-=C2=A0 &quot;outputs&quot;: [<br>
-=C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;LVDS1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;mode&quot;: &quot;1280x480&quot;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 ]<br>
-}<br>
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json b=
/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json<br>
deleted file mode 100644<br>
index b4fa359b64..0000000000<br>
--- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json<br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-{<br>
-=C2=A0 &quot;device&quot;: &quot;/dev/dri/card1&quot;,<br>
-=C2=A0 &quot;hwcursor&quot;: false,<br>
-=C2=A0 &quot;pbuffers&quot;: true,<br>
-=C2=A0 &quot;outputs&quot;: [<br>
-=C2=A0 =C2=A0 {<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;LVDS1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;mode&quot;: &quot;800x480&quot;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 ]<br>
-}<br>
diff --git a/board/engicam/icorem6_rqs/genimage.cfg b/board/engicam/icorem6=
_rqs/genimage.cfg<br>
deleted file mode 100644<br>
index d6936f8109..0000000000<br>
--- a/board/engicam/icorem6_rqs/genimage.cfg<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-image boot.vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;uImage&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6dl-icore-rqs.dtb&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6q-icore-rqs.dtb&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 64M<br>
-}<br>
-<br>
-image sdcard.img {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition SPL {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;SPL=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 1K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot-dtb {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-b=
oot-dtb.img&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 69K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition boot {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0xC<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;boo=
t.vfat&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8M<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/board/engicam/icorem6_rqs/readme.txt b/board/engicam/icorem6_r=
qs/readme.txt<br>
deleted file mode 100644<br>
index a0bf6f508f..0000000000<br>
--- a/board/engicam/icorem6_rqs/readme.txt<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-*************************************************<br>
-Buildroot for Engicam i.CoreM6 RQS SOM platforms:<br>
-*************************************************<br>
-<br>
-This file documents the Buildroot support for Engicam i.CoreM6 RQS<br>
-SOM platform boards.<br>
-<br>
-i.CoreM6 Quad/Dual/DualLite/Solo RQS SOM Starter kits:<br>
-<a href=3D"https://www.engicam.com/vis-prod/101124" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.engicam.com/vis-prod/101124</a><br>
-<br>
-This configuration uses U-Boot mainline and kernel mainline.<br>
-<br>
-Build<br>
-=3D=3D=3D=3D=3D<br>
-<br>
-First, configure Buildroot for the Engicam i.CoreM6 RQS:<br>
-<br>
-- for i.CoreM6 RQS Quad/Dual/DualLite/Solo:<br>
-<br>
-=C2=A0 make engicam_imx6qdl_icore_rqs_defconfig<br>
-<br>
-Build all components:<br>
-<br>
-=C2=A0 make<br>
-<br>
-You will find the following files in output/images/:<br>
-- for i.CoreM6 Quad/Dual RQS:<br>
-=C2=A0 - imx6q-icore-rqs.dtb<br>
-- for i.CoreM6 DualLite/Solo RQS:<br>
-=C2=A0 - imx6dl-icore-rqs.dtb<br>
-=C2=A0 - rootfs.ext4<br>
-=C2=A0 - rootfs.tar<br>
-=C2=A0 - sdcard.img<br>
-=C2=A0 - SPL<br>
-=C2=A0 - u-boot-dtb.img<br>
-=C2=A0 - uImage<br>
-<br>
-Create a bootable SD card<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
-<br>
-To determine the device associated to the SD card have a look in the<br>
-/proc/partitions file:<br>
-<br>
-=C2=A0 cat /proc/partitions<br>
-<br>
-Buildroot prepares a bootable &quot;sdcard.img&quot; image in the output/i=
mages/<br>
-directory, ready to be dumped on a SD card. Launch the following<br>
-command as root:<br>
-<br>
-=C2=A0 dd if=3Doutput/images/sdcard.img of=3D/dev/&lt;your-sd-device&gt;<b=
r>
-=C2=A0 sync<br>
-<br>
-*** WARNING! This will destroy all the card content. Use with care! ***<br=
>
-<br>
-For details about the medium image layout, see the definition in<br>
-board/engicam/icorem6_rqs/genimage.cfg<br>
-<br>
-Boot the i.CoreM6 RQS boards with SD boot:<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-To boot your newly created system:<br>
-- insert the SD card in the SD slot of the board;<br>
-- connect 3-wire RS232 serial port J7 on board, and connect with other<br>
-=C2=A0 serial end or USB cable(if serial-to-usb converter used) using<br>
-=C2=A0 a terminal emulator at 115200 bps, 8n1;<br>
-- close JM2 for sd boot.<br>
-- power on the board.<br>
-<br>
-Enjoy!<br>
diff --git a/board/engicam/isiot/genimage.cfg b/board/engicam/isiot/genimag=
e.cfg<br>
deleted file mode 100644<br>
index 4e65a70110..0000000000<br>
--- a/board/engicam/isiot/genimage.cfg<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-image boot.vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;uImage&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;imx6ul-isiot-emmc.dtb&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 64M<br>
-}<br>
-<br>
-image sdcard.img {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition SPL {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;SPL=
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 1K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot-dtb {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D &quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-b=
oot-dtb.img&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 69K<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition boot {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0xC<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;boo=
t.vfat&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8M<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-}<br>
diff --git a/board/engicam/isiot/readme.txt b/board/engicam/isiot/readme.tx=
t<br>
deleted file mode 100644<br>
index 5394007ca5..0000000000<br>
--- a/board/engicam/isiot/readme.txt<br>
+++ /dev/null<br>
@@ -1,66 +0,0 @@<br>
-********************************************<br>
-Buildroot for Engicam Is.IoT SOM platforms:<br>
-********************************************<br>
-<br>
-This file documents the Buildroot support for all Engicam Is.IoT MX6UL<br>
-SOM platform boards.<br>
-<br>
-Is.IoT MX6UL SOM Starter kits:<br>
-<a href=3D"https://www.engicam.com/vis-prod/101122" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.engicam.com/vis-prod/101122</a><br>
-<br>
-This configuration uses U-Boot mainline and kernel mainline.<br>
-<br>
-Build<br>
-=3D=3D=3D=3D=3D<br>
-<br>
-First, configure Buildroot for the Engicam Is.IoT MX6UL SOM:<br>
-<br>
-- for Is.IoT MX6UL SOM:<br>
-<br>
-=C2=A0 make engicam_imx6ul_isiot_defconfig<br>
-<br>
-Build all components:<br>
-<br>
-=C2=A0 make<br>
-<br>
-You will find the following files in output/images/:<br>
-=C2=A0 - imx6ul-isiot-emmc.dtb<br>
-=C2=A0 - rootfs.ext4<br>
-=C2=A0 - rootfs.tar<br>
-=C2=A0 - sdcard.img<br>
-=C2=A0 - SPL<br>
-=C2=A0 - u-boot-dtb.img<br>
-=C2=A0 - uImage<br>
-<br>
-Create a bootable SD card<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
-<br>
-To determine the device associated to the SD card have a look in the<br>
-/proc/partitions file:<br>
-<br>
-=C2=A0 cat /proc/partitions<br>
-<br>
-Buildroot prepares a bootable &quot;sdcard.img&quot; image in the output/i=
mages/<br>
-directory, ready to be dumped on a SD card. Launch the following<br>
-command as root:<br>
-<br>
-=C2=A0 dd if=3Doutput/images/sdcard.img of=3D/dev/&lt;your-sd-device&gt;<b=
r>
-=C2=A0 sync<br>
-<br>
-*** WARNING! This will destroy all the card content. Use with care! ***<br=
>
-<br>
-For details about the medium image layout, see the definition in<br>
-board/engicam/isiot/genimage.cfg<br>
-<br>
-Boot the Is.IoT MX6UL boards with SD boot:<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-<br>
-To boot your newly created system:<br>
-- insert the SD card in the SD slot of the board;<br>
-- connect 3-wire RS232 serial port J28 on board, and connect with other<br=
>
-=C2=A0 serial end or USB cable(if serial-to-usb converter used) using<br>
-=C2=A0 a terminal emulator at 115200 bps, 8n1;<br>
-- close JM3 for sd boot.<br>
-- power on the board.<br>
-<br>
-Enjoy!<br>
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6=
qdl_icore_defconfig<br>
deleted file mode 100644<br>
index 2ac415e335..0000000000<br>
--- a/configs/engicam_imx6qdl_icore_defconfig<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-BR2_arm=3Dy<br>
-BR2_cortex_a9=3Dy<br>
-BR2_ARM_ENABLE_NEON=3Dy<br>
-BR2_ARM_ENABLE_VFP=3Dy<br>
-BR2_ARM_FPU_VFPV3=3Dy<br>
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=3Dy<br>
-BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Engicam i.CoreM6 Quad/Dual/Dua=
lLite/Solo&quot;<br>
-BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttymxc3&quot;<br>
-BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
-BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/engicam/icorem6/genimage.cfg&=
quot;<br>
-BR2_LINUX_KERNEL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.0&quot;<br>
-BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v6_v7&quot;<br>
-BR2_LINUX_KERNEL_UIMAGE=3Dy<br>
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D&quot;0x10008000&quot;<br>
-BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
-BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;imx6dl-icore imx6q-icore imx6q-ic=
ore-ofcap10 imx6q-icore-ofcap12&quot;<br>
-BR2_TARGET_ROOTFS_EXT2=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
-BR2_TARGET_UBOOT=3Dy<br>
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2019.01&quot;<br>
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;imx6qdl_icore_mmc&quot;<br>
-BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy<br>
-BR2_TARGET_UBOOT_SPL=3Dy<br>
-BR2_TARGET_UBOOT_SPL_NAME=3D&quot;SPL&quot;<br>
-BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
-BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_=
imx6qdl_icore_qt5_defconfig<br>
deleted file mode 100644<br>
index 8b0c8bbe28..0000000000<br>
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig<br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-BR2_arm=3Dy<br>
-BR2_cortex_a9=3Dy<br>
-BR2_ARM_ENABLE_NEON=3Dy<br>
-BR2_ARM_ENABLE_VFP=3Dy<br>
-BR2_ARM_FPU_VFPV3=3Dy<br>
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=3Dy<br>
-BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy<br>
-BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Engicam i.CoreM6 Quad/Dual/Dua=
lLite/Solo&quot;<br>
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=3Dy<br>
-BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttymxc3&quot;<br>
-BR2_ROOTFS_OVERLAY=3D&quot;board/engicam/icorem6/rootfs_overlay&quot;<br>
-BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
-BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/engicam/icorem6/genimage.cfg&=
quot;<br>
-BR2_LINUX_KERNEL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;4.13&quot;<br>
-BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v6_v7&quot;<br>
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/engicam/icorem6/linux=
_qt5.fragment&quot;<br>
-BR2_LINUX_KERNEL_UIMAGE=3Dy<br>
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D&quot;0x10008000&quot;<br>
-BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
-BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;imx6dl-icore imx6q-icore imx6q-ic=
ore-ofcap10 imx6q-icore-ofcap12&quot;<br>
-BR2_PACKAGE_BITSTREAM_VERA=3Dy<br>
-BR2_PACKAGE_CANTARELL=3Dy<br>
-BR2_PACKAGE_DEJAVU=3Dy<br>
-BR2_PACKAGE_FONT_AWESOME=3Dy<br>
-BR2_PACKAGE_GHOSTSCRIPT_FONTS=3Dy<br>
-BR2_PACKAGE_INCONSOLATA=3Dy<br>
-BR2_PACKAGE_LIBERATION=3Dy<br>
-BR2_PACKAGE_GLMARK2=3Dy<br>
-BR2_PACKAGE_KMSCUBE=3Dy<br>
-BR2_PACKAGE_MESA3D_DEMOS=3Dy<br>
-BR2_PACKAGE_QT5CINEX=3Dy<br>
-BR2_PACKAGE_QT5CINEX_HD=3Dy<br>
-BR2_PACKAGE_MESA3D=3Dy<br>
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=3Dy<br>
-BR2_PACKAGE_MESA3D_OPENGL_EGL=3Dy<br>
-BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy<br>
-BR2_PACKAGE_QT5=3Dy<br>
-BR2_PACKAGE_QT5BASE_OPENGL_LIB=3Dy<br>
-BR2_PACKAGE_QT5BASE_LINUXFB=3Dy<br>
-BR2_PACKAGE_QT5BASE_FONTCONFIG=3Dy<br>
-BR2_PACKAGE_QT5BASE_GIF=3Dy<br>
-BR2_PACKAGE_QT5BASE_JPEG=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;120M&quot;<br>
-BR2_TARGET_UBOOT=3Dy<br>
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2017.07&quot;<br>
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;imx6qdl_icore_mmc&quot;<br>
-BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy<br>
-BR2_TARGET_UBOOT_SPL=3Dy<br>
-BR2_TARGET_UBOOT_SPL_NAME=3D&quot;SPL&quot;<br>
-BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
-BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig b/configs/engicam_=
imx6qdl_icore_rqs_defconfig<br>
deleted file mode 100644<br>
index 7d4d4e3df4..0000000000<br>
--- a/configs/engicam_imx6qdl_icore_rqs_defconfig<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-BR2_arm=3Dy<br>
-BR2_cortex_a9=3Dy<br>
-BR2_ARM_ENABLE_NEON=3Dy<br>
-BR2_ARM_ENABLE_VFP=3Dy<br>
-BR2_ARM_FPU_VFPV3=3Dy<br>
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=3Dy<br>
-BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Engicam i.CoreM6 Quad/Dual/Dua=
lLite/Solo RQS Starter Kit&quot;<br>
-BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttymxc3&quot;<br>
-BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
-BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/engicam/icorem6_rqs/genimage.=
cfg&quot;<br>
-BR2_LINUX_KERNEL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.0&quot;<br>
-BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v6_v7&quot;<br>
-BR2_LINUX_KERNEL_UIMAGE=3Dy<br>
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D&quot;0x10008000&quot;<br>
-BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
-BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;imx6dl-icore-rqs imx6q-icore-rqs&=
quot;<br>
-BR2_TARGET_ROOTFS_EXT2=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
-BR2_TARGET_UBOOT=3Dy<br>
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2019.01&quot;<br>
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;imx6qdl_icore_rqs&quot;<br>
-BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy<br>
-BR2_TARGET_UBOOT_SPL=3Dy<br>
-BR2_TARGET_UBOOT_SPL_NAME=3D&quot;SPL&quot;<br>
-BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
-BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
diff --git a/configs/engicam_imx6ul_geam_defconfig b/configs/engicam_imx6ul=
_geam_defconfig<br>
deleted file mode 100644<br>
index ed4b491ebe..0000000000<br>
--- a/configs/engicam_imx6ul_geam_defconfig<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-BR2_arm=3Dy<br>
-BR2_cortex_a9=3Dy<br>
-BR2_ARM_ENABLE_NEON=3Dy<br>
-BR2_ARM_ENABLE_VFP=3Dy<br>
-BR2_ARM_FPU_VFPV3=3Dy<br>
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=3Dy<br>
-BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Engicam GEAM6UL Starter Kit&qu=
ot;<br>
-BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttymxc0&quot;<br>
-BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
-BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/engicam/geam6ul/genimage.cfg&=
quot;<br>
-BR2_LINUX_KERNEL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;4.11.5&quot;<br>
-BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v6_v7&quot;<br>
-BR2_LINUX_KERNEL_UIMAGE=3Dy<br>
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D&quot;0x80008000&quot;<br>
-BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
-BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;imx6ul-geam-kit&quot;<br>
-BR2_TARGET_ROOTFS_EXT2=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
-BR2_TARGET_UBOOT=3Dy<br>
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2017.07-rc1&quot;<br>
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;imx6ul_geam_mmc&quot;<br>
-BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy<br>
-BR2_TARGET_UBOOT_SPL=3Dy<br>
-BR2_TARGET_UBOOT_SPL_NAME=3D&quot;SPL&quot;<br>
-BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
-BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
diff --git a/configs/engicam_imx6ul_isiot_defconfig b/configs/engicam_imx6u=
l_isiot_defconfig<br>
deleted file mode 100644<br>
index 1377022c30..0000000000<br>
--- a/configs/engicam_imx6ul_isiot_defconfig<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-BR2_arm=3Dy<br>
-BR2_cortex_a9=3Dy<br>
-BR2_ARM_ENABLE_NEON=3Dy<br>
-BR2_ARM_ENABLE_VFP=3Dy<br>
-BR2_ARM_FPU_VFPV3=3Dy<br>
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=3Dy<br>
-BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Engicam Is.IoT eMMC Starter Ki=
t&quot;<br>
-BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttymxc0&quot;<br>
-BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
-BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/engicam/isiot/genimage.cfg&qu=
ot;<br>
-BR2_LINUX_KERNEL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.0&quot;<br>
-BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v6_v7&quot;<br>
-BR2_LINUX_KERNEL_UIMAGE=3Dy<br>
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR=3D&quot;0x80008000&quot;<br>
-BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
-BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;imx6ul-isiot-emmc&quot;<br>
-BR2_TARGET_ROOTFS_EXT2=3Dy<br>
-BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
-BR2_TARGET_UBOOT=3Dy<br>
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2019.01&quot;<br>
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;imx6ul_isiot_emmc&quot;<br>
-BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=3Dy<br>
-BR2_TARGET_UBOOT_SPL=3Dy<br>
-BR2_TARGET_UBOOT_SPL_NAME=3D&quot;SPL&quot;<br>
-BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
-BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
-- <br>
2.50.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Nazzareno Trimarchi<br>Co-Founder &amp; =
Chief Executive Officer<br>M. +39 347 913 2170<br><a href=3D"mailto:michael=
@amarulasolutions.com" target=3D"_blank">michael@amarulasolutions.com</a><b=
r>__________________________________<br><div><br></div><div>Amarula Solutio=
ns BV</div>Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<br>T. +31 (0)85 111 =
9172<br><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info=
@amarulasolutions.com</a><br><a href=3D"http://www.amarulasolutions.com" ta=
rget=3D"_blank">www.amarulasolutions.com</a><br></div></div></div>

--00000000000085dd0a063cb69be2--

--===============7734109697119386699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7734109697119386699==--
