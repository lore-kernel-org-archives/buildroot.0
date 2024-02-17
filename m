Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBA3C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 21:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2B60407B6;
	Sat, 17 Feb 2024 21:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqCVTRIO475N; Sat, 17 Feb 2024 21:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17AF4407C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17AF4407C3;
	Sat, 17 Feb 2024 21:05:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EABE31BF2A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 21:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E568280B86
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 21:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfEN_JjLEPd0 for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 21:05:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F07F80AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F07F80AF0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F07F80AF0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 21:05:22 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6d9f94b9186so2614587b3a.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 13:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708203922; x=1708808722;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8eXBm4ULpPEhT7BXc16Itn+k6GvPLg4AzsjhMmoobU=;
 b=HqMmuYBJh5YP1Z31IP3XPPInlapTKQ9+yz/5Rqrr22rxlSli5VQ8Esxc+QAnsU03kD
 fgP/ZaIxUDgFeDUGi08Vbs3V89c92hVN0vCDcAFljO/Ned2v7gVI+NZppGHN14RuWbb4
 w/pNPhMd0peEF0X5VNJFYPcwpRriZccS7bbguGUrWZtpCybX/sAu06HLaNXNE7AQX8NZ
 DO8d7gGop1yWXIej1UM62nb6/IPO/hjjckK3pdiAOTCoV4mV+hhkcJp5T26Hy+g63/GH
 K8VCDdyJzDYlczYF3E9E02e1kSYIzZFZUgz9K+IMsSeAhrvglzva4WGwNfA7vQM9kvLV
 Rr0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVap9ThRfufLqsgbJudXqanHlnS58Snbf/qz5l9GOpZdedGEtS7q6qaHKNYyZUGzc1R4hPmC00dOmEVfyAQ06BNueIvnZ4kZA==
X-Gm-Message-State: AOJu0YwmlGIZRF+0/NdOxi5A2BIf+XG2J5pmjXrnt+ydj022HNCWBs2f
 pkMatU2Ug1j3T4Dr0CJ70NDmo877fYz3WWhL9ES4lah9ZRpJVdm6IYHOW6LbFMrJ4XXqmR73T68
 z8IAaSbMVoIoHiFjcX73iC7E+rvb0RNE+cTR8
X-Google-Smtp-Source: AGHT+IHlhChJWYqzqxlE9HG1GTKLGYSg63naPWrfK83Qk1u1itcoxvRW6XdfzvDfI0gkgTI8gVVjR+3dh4a3yEDUVzw=
X-Received: by 2002:a05:6a21:394c:b0:19e:4aa7:e6ab with SMTP id
 ac12-20020a056a21394c00b0019e4aa7e6abmr9274374pzc.47.1708203921612; Sat, 17
 Feb 2024 13:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-18-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240217160244.1320482-18-dario.binacchi@amarulasolutions.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 17 Feb 2024 22:05:10 +0100
Message-ID: <CAAE6iEW4mrOJ5aRTb3C493V5bUQvTRPWH5LkTnbD5_qtkE=aTQ@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1708203922; x=1708808722; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r8eXBm4ULpPEhT7BXc16Itn+k6GvPLg4AzsjhMmoobU=;
 b=K6t/phwhl+k3ewkxle9i+ma8mhHn5fV7ORnujpNiKQUHaqhh9+RTtr6QvKpgpacVzN
 bhehKw+U6v+YAXIZtulrUp09uqeP0vFOf6gHeGEeRmtNKg//xyibwELvdu1vWkCb1Si4
 2Z2j4TMFV/zk3AIDM8gyyxflLtycXssmyuZohV2DZPmuBz2rxBQG1YpYgVBPoAgmXgw4
 7xTil8k4E9MC9I7iFqqRz48SbNh9kNTXfcBtuO/CA575y6ITQvWkfdTjdZPYgESfq8cJ
 rrq/W0qc+EdEh2stG+kHOFbHX0i5qcgKmCLX3JZX2bIUMtS8Wh+ikT301BHJoSeFPqo8
 3Vng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=K6t/phwh
Subject: Re: [Buildroot] [PATCH v4 17/20] boot: move ti-k3-* packages to
 'ti-k3' directory
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============0623353164543187078=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0623353164543187078==
Content-Type: multipart/alternative; boundary="000000000000f421fc06119a3799"

--000000000000f421fc06119a3799
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 17 f=C3=A9vr. 2024 =C3=A0 17:03, Dario Binacchi <
dario.binacchi@amarulasolutions.com> a =C3=A9crit :

> Move all TI K3 packages to the directory ti-k3.
>

The Buildroot documentation states that "New subdirectories are
discouraged".
See https://buildroot.org/downloads/manual/manual.html#_package_directory

Fran=C3=A7ois


> This patch is preparatory for future developments.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Added in v4
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/Config.in                                      |  5 +----
>  boot/ti-k3/Config.in                                | 13 +++++++++++++
>  boot/ti-k3/common.mk                                |  1 +
>  boot/{ =3D> ti-k3}/ti-k3-boot-firmware/Config.in      |  0
>  .../ti-k3-boot-firmware/ti-k3-boot-firmware.hash    |  0
>  .../ti-k3-boot-firmware/ti-k3-boot-firmware.mk      |  0
>  boot/{ =3D> ti-k3}/ti-k3-core-secdev/Config.in        |  0
>  .../ti-k3-core-secdev/ti-k3-core-secdev.hash        |  0
>  .../ti-k3-core-secdev/ti-k3-core-secdev.mk          |  0
>  boot/{ =3D> ti-k3}/ti-k3-image-gen/Config.in          |  0
>  .../ti-k3-image-gen/ti-k3-image-gen.hash            |  0
>  boot/{ =3D> ti-k3}/ti-k3-image-gen/ti-k3-image-gen.mk |  0
>  boot/{ =3D> ti-k3}/ti-k3-r5-loader/Config.in          |  0
>  .../ti-k3-r5-loader/ti-k3-r5-loader.hash            |  0
>  boot/{ =3D> ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.mk |  0
>  configs/ti_am62x_sk_defconfig                       |  1 +
>  configs/ti_am64x_sk_defconfig                       |  1 +
>  17 files changed, 17 insertions(+), 4 deletions(-)
>  create mode 100644 boot/ti-k3/Config.in
>  create mode 100644 boot/ti-k3/common.mk
>  rename boot/{ =3D> ti-k3}/ti-k3-boot-firmware/Config.in (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-boot-firmware/ti-k3-boot-firmware.mk (10=
0%)
>  rename boot/{ =3D> ti-k3}/ti-k3-core-secdev/Config.in (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-core-secdev/ti-k3-core-secdev.hash (100%=
)
>  rename boot/{ =3D> ti-k3}/ti-k3-core-secdev/ti-k3-core-secdev.mk (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-image-gen/Config.in (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-image-gen/ti-k3-image-gen.hash (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-image-gen/ti-k3-image-gen.mk (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-r5-loader/Config.in (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.hash (100%)
>  rename boot/{ =3D> ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.mk (100%)
>
> diff --git a/boot/Config.in b/boot/Config.in
> index 18a7d268f95a..74a64a096afc 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -19,10 +19,7 @@ source "boot/opensbi/Config.in"
>  source "boot/s500-bootloader/Config.in"
>  source "boot/shim/Config.in"
>  source "boot/syslinux/Config.in"
> -source "boot/ti-k3-boot-firmware/Config.in"
> -source "boot/ti-k3-core-secdev/Config.in"
> -source "boot/ti-k3-image-gen/Config.in"
> -source "boot/ti-k3-r5-loader/Config.in"
> +source "boot/ti-k3/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
>
> diff --git a/boot/ti-k3/Config.in b/boot/ti-k3/Config.in
> new file mode 100644
> index 000000000000..06dda2f156a9
> --- /dev/null
> +++ b/boot/ti-k3/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_TARGET_TI_K3
> +       bool "TI K3"
> +       help
> +         The TI K3 bootloaders and tools.
> +
> +if BR2_TARGET_TI_K3
> +
> +source "boot/ti-k3/ti-k3-boot-firmware/Config.in"
> +source "boot/ti-k3/ti-k3-core-secdev/Config.in"
> +source "boot/ti-k3/ti-k3-image-gen/Config.in"
> +source "boot/ti-k3/ti-k3-r5-loader/Config.in"
> +
> +endif
> diff --git a/boot/ti-k3/common.mk b/boot/ti-k3/common.mk
> new file mode 100644
> index 000000000000..18a1329baa4c
> --- /dev/null
> +++ b/boot/ti-k3/common.mk
> @@ -0,0 +1 @@
> +include $(sort $(wildcard boot/ti-k3/*/*.mk))
> diff --git a/boot/ti-k3-boot-firmware/Config.in
> b/boot/ti-k3/ti-k3-boot-firmware/Config.in
> similarity index 100%
> rename from boot/ti-k3-boot-firmware/Config.in
> rename to boot/ti-k3/ti-k3-boot-firmware/Config.in
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> b/boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> similarity index 100%
> rename from boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> rename to boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> b/boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> similarity index 100%
> rename from boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> rename to boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> diff --git a/boot/ti-k3-core-secdev/Config.in
> b/boot/ti-k3/ti-k3-core-secdev/Config.in
> similarity index 100%
> rename from boot/ti-k3-core-secdev/Config.in
> rename to boot/ti-k3/ti-k3-core-secdev/Config.in
> diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
> b/boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.hash
> similarity index 100%
> rename from boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
> rename to boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.hash
> diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
> b/boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.mk
> similarity index 100%
> rename from boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
> rename to boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.mk
> diff --git a/boot/ti-k3-image-gen/Config.in
> b/boot/ti-k3/ti-k3-image-gen/Config.in
> similarity index 100%
> rename from boot/ti-k3-image-gen/Config.in
> rename to boot/ti-k3/ti-k3-image-gen/Config.in
> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> b/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.hash
> similarity index 100%
> rename from boot/ti-k3-image-gen/ti-k3-image-gen.hash
> rename to boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.hash
> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> b/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
> similarity index 100%
> rename from boot/ti-k3-image-gen/ti-k3-image-gen.mk
> rename to boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
> diff --git a/boot/ti-k3-r5-loader/Config.in
> b/boot/ti-k3/ti-k3-r5-loader/Config.in
> similarity index 100%
> rename from boot/ti-k3-r5-loader/Config.in
> rename to boot/ti-k3/ti-k3-r5-loader/Config.in
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.hash
> similarity index 100%
> rename from boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> rename to boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.hash
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
> similarity index 100%
> rename from boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> rename to boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfi=
g
> index 4de39fb897fd..cd26235342e4 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -23,6 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy
>  BR2_TARGET_OPTEE_OS=3Dy
>  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3-am62x"
>  BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=3D"am62x"
> +BR2_TARGET_TI_K3=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=3Dy
>  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfi=
g
> index 5fd9653b5b8f..1befeb4ab96c 100644
> --- a/configs/ti_am64x_sk_defconfig
> +++ b/configs/ti_am64x_sk_defconfig
> @@ -23,6 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy
>  BR2_TARGET_OPTEE_OS=3Dy
>  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3-am64x"
>  BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=3D"am64x"
> +BR2_TARGET_TI_K3=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=3Dy
>  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> --
> 2.43.0
>
>

--000000000000f421fc06119a3799
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 17 f=C3=A9vr. 2024 =C3=
=A0=C2=A017:03, Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarula=
solutions.com">dario.binacchi@amarulasolutions.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Move all TI=
 K3 packages to the directory ti-k3.<br></blockquote><div><br></div><div>Th=
e Buildroot documentation states that &quot;New subdirectories are discoura=
ged&quot;.<br></div><div>See <a href=3D"https://buildroot.org/downloads/man=
ual/manual.html#_package_directory">https://buildroot.org/downloads/manual/=
manual.html#_package_directory</a><br><br></div><div>Fran=C3=A7ois<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
This patch is preparatory for future developments.<br>
<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
<br>
---<br>
<br>
Added in v4<br>
<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
---<br>
=C2=A0boot/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 +----<br>
=C2=A0boot/ti-k3/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++=
++++++<br>
=C2=A0boot/ti-k3/<a href=3D"http://common.mk" rel=3D"noreferrer" target=3D"=
_blank">common.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0boot/{ =3D&gt; ti-k3}/ti-k3-boot-firmware/Config.in=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 0<br>
=C2=A0.../ti-k3-boot-firmware/ti-k3-boot-firmware.hash=C2=A0 =C2=A0 |=C2=A0=
 0<br>
=C2=A0.../ti-k3-boot-firmware/<a href=3D"http://ti-k3-boot-firmware.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-boot-firmware.mk</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 0<br>
=C2=A0boot/{ =3D&gt; ti-k3}/ti-k3-core-secdev/Config.in=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 0<br>
=C2=A0.../ti-k3-core-secdev/ti-k3-core-secdev.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 0<br>
=C2=A0.../ti-k3-core-secdev/<a href=3D"http://ti-k3-core-secdev.mk" rel=3D"=
noreferrer" target=3D"_blank">ti-k3-core-secdev.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0boot/{ =3D&gt; ti-k3}/ti-k3-image-gen/Config.in=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../ti-k3-image-gen/ti-k3-image-gen.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0boot/{ =3D&gt; ti-k3}/ti-k3-image-gen/<a href=3D"http://ti-k3-image-g=
en.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a> |=C2=A0 =
0<br>
=C2=A0boot/{ =3D&gt; ti-k3}/ti-k3-r5-loader/Config.in=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../ti-k3-r5-loader/ti-k3-r5-loader.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0boot/{ =3D&gt; ti-k3}/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-load=
er.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a> |=C2=A0 =
0<br>
=C2=A0configs/ti_am62x_sk_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0configs/ti_am64x_sk_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A017 files changed, 17 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 boot/ti-k3/Config.in<br>
=C2=A0create mode 100644 boot/ti-k3/<a href=3D"http://common.mk" rel=3D"nor=
eferrer" target=3D"_blank">common.mk</a><br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-boot-firmware/Config.in (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-boot-firmware/ti-k3-boot-firmware.=
hash (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-boot-firmware/<a href=3D"http://ti=
-k3-boot-firmware.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-boot-firmw=
are.mk</a> (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-core-secdev/Config.in (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-core-secdev/ti-k3-core-secdev.hash=
 (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-core-secdev/<a href=3D"http://ti-k=
3-core-secdev.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-core-secdev.mk=
</a> (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-image-gen/Config.in (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-image-gen/ti-k3-image-gen.hash (10=
0%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-image-gen/<a href=3D"http://ti-k3-=
image-gen.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a> (=
100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-r5-loader/Config.in (100%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.hash (10=
0%)<br>
=C2=A0rename boot/{ =3D&gt; ti-k3}/ti-k3-r5-loader/<a href=3D"http://ti-k3-=
r5-loader.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a> (=
100%)<br>
<br>
diff --git a/boot/Config.in b/boot/Config.in<br>
index 18a7d268f95a..74a64a096afc 100644<br>
--- a/boot/Config.in<br>
+++ b/boot/Config.in<br>
@@ -19,10 +19,7 @@ source &quot;boot/opensbi/Config.in&quot;<br>
=C2=A0source &quot;boot/s500-bootloader/Config.in&quot;<br>
=C2=A0source &quot;boot/shim/Config.in&quot;<br>
=C2=A0source &quot;boot/syslinux/Config.in&quot;<br>
-source &quot;boot/ti-k3-boot-firmware/Config.in&quot;<br>
-source &quot;boot/ti-k3-core-secdev/Config.in&quot;<br>
-source &quot;boot/ti-k3-image-gen/Config.in&quot;<br>
-source &quot;boot/ti-k3-r5-loader/Config.in&quot;<br>
+source &quot;boot/ti-k3/Config.in&quot;<br>
=C2=A0source &quot;boot/uboot/Config.in&quot;<br>
=C2=A0source &quot;boot/vexpress-firmware/Config.in&quot;<br>
<br>
diff --git a/boot/ti-k3/Config.in b/boot/ti-k3/Config.in<br>
new file mode 100644<br>
index 000000000000..06dda2f156a9<br>
--- /dev/null<br>
+++ b/boot/ti-k3/Config.in<br>
@@ -0,0 +1,13 @@<br>
+config BR2_TARGET_TI_K3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;TI K3&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The TI K3 bootloaders and tools.<br>
+<br>
+if BR2_TARGET_TI_K3<br>
+<br>
+source &quot;boot/ti-k3/ti-k3-boot-firmware/Config.in&quot;<br>
+source &quot;boot/ti-k3/ti-k3-core-secdev/Config.in&quot;<br>
+source &quot;boot/ti-k3/ti-k3-image-gen/Config.in&quot;<br>
+source &quot;boot/ti-k3/ti-k3-r5-loader/Config.in&quot;<br>
+<br>
+endif<br>
diff --git a/boot/ti-k3/<a href=3D"http://common.mk" rel=3D"noreferrer" tar=
get=3D"_blank">common.mk</a> b/boot/ti-k3/<a href=3D"http://common.mk" rel=
=3D"noreferrer" target=3D"_blank">common.mk</a><br>
new file mode 100644<br>
index 000000000000..18a1329baa4c<br>
--- /dev/null<br>
+++ b/boot/ti-k3/<a href=3D"http://common.mk" rel=3D"noreferrer" target=3D"=
_blank">common.mk</a><br>
@@ -0,0 +1 @@<br>
+include $(sort $(wildcard boot/ti-k3/*/*.mk))<br>
diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3/ti-k3-boot-fir=
mware/Config.in<br>
similarity index 100%<br>
rename from boot/ti-k3-boot-firmware/Config.in<br>
rename to boot/ti-k3/ti-k3-boot-firmware/Config.in<br>
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3=
/ti-k3-boot-firmware/ti-k3-boot-firmware.hash<br>
similarity index 100%<br>
rename from boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash<br>
rename to boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.hash<br>
diff --git a/boot/ti-k3-boot-firmware/<a href=3D"http://ti-k3-boot-firmware=
.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-boot-firmware.mk</a> b/boot=
/ti-k3/ti-k3-boot-firmware/<a href=3D"http://ti-k3-boot-firmware.mk" rel=3D=
"noreferrer" target=3D"_blank">ti-k3-boot-firmware.mk</a><br>
similarity index 100%<br>
rename from boot/ti-k3-boot-firmware/<a href=3D"http://ti-k3-boot-firmware.=
mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-boot-firmware.mk</a><br>
rename to boot/ti-k3/ti-k3-boot-firmware/<a href=3D"http://ti-k3-boot-firmw=
are.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-boot-firmware.mk</a><br>
diff --git a/boot/ti-k3-core-secdev/Config.in b/boot/ti-k3/ti-k3-core-secde=
v/Config.in<br>
similarity index 100%<br>
rename from boot/ti-k3-core-secdev/Config.in<br>
rename to boot/ti-k3/ti-k3-core-secdev/Config.in<br>
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash b/boot/ti-k3/ti-=
k3-core-secdev/ti-k3-core-secdev.hash<br>
similarity index 100%<br>
rename from boot/ti-k3-core-secdev/ti-k3-core-secdev.hash<br>
rename to boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.hash<br>
diff --git a/boot/ti-k3-core-secdev/<a href=3D"http://ti-k3-core-secdev.mk"=
 rel=3D"noreferrer" target=3D"_blank">ti-k3-core-secdev.mk</a> b/boot/ti-k3=
/ti-k3-core-secdev/<a href=3D"http://ti-k3-core-secdev.mk" rel=3D"noreferre=
r" target=3D"_blank">ti-k3-core-secdev.mk</a><br>
similarity index 100%<br>
rename from boot/ti-k3-core-secdev/<a href=3D"http://ti-k3-core-secdev.mk" =
rel=3D"noreferrer" target=3D"_blank">ti-k3-core-secdev.mk</a><br>
rename to boot/ti-k3/ti-k3-core-secdev/<a href=3D"http://ti-k3-core-secdev.=
mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-core-secdev.mk</a><br>
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3/ti-k3-image-gen/Co=
nfig.in<br>
similarity index 100%<br>
rename from boot/ti-k3-image-gen/Config.in<br>
rename to boot/ti-k3/ti-k3-image-gen/Config.in<br>
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3/ti-k3-i=
mage-gen/ti-k3-image-gen.hash<br>
similarity index 100%<br>
rename from boot/ti-k3-image-gen/ti-k3-image-gen.hash<br>
rename to boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.hash<br>
diff --git a/boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a> b/boot/ti-k3/ti-k3=
-image-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=3D"noreferrer" target=
=3D"_blank">ti-k3-image-gen.mk</a><br>
similarity index 100%<br>
rename from boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a><br>
rename to boot/ti-k3/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" =
rel=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a><br>
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3/ti-k3-r5-loader/Co=
nfig.in<br>
similarity index 100%<br>
rename from boot/ti-k3-r5-loader/Config.in<br>
rename to boot/ti-k3/ti-k3-r5-loader/Config.in<br>
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3/ti-k3-r=
5-loader/ti-k3-r5-loader.hash<br>
similarity index 100%<br>
rename from boot/ti-k3-r5-loader/ti-k3-r5-loader.hash<br>
rename to boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.hash<br>
diff --git a/boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a> b/boot/ti-k3/ti-k3=
-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"noreferrer" target=
=3D"_blank">ti-k3-r5-loader.mk</a><br>
similarity index 100%<br>
rename from boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a><br>
rename to boot/ti-k3/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" =
rel=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a><br>
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig<=
br>
index 4de39fb897fd..cd26235342e4 100644<br>
--- a/configs/ti_am62x_sk_defconfig<br>
+++ b/configs/ti_am62x_sk_defconfig<br>
@@ -23,6 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy<br>
=C2=A0BR2_TARGET_OPTEE_OS=3Dy<br>
=C2=A0BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3-am62x&quot;<br>
=C2=A0BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=3D&quot;am62x&quot;<br>
+BR2_TARGET_TI_K3=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig<=
br>
index 5fd9653b5b8f..1befeb4ab96c 100644<br>
--- a/configs/ti_am64x_sk_defconfig<br>
+++ b/configs/ti_am64x_sk_defconfig<br>
@@ -23,6 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy<br>
=C2=A0BR2_TARGET_OPTEE_OS=3Dy<br>
=C2=A0BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3-am64x&quot;<br>
=C2=A0BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=3D&quot;am64x&quot;<br>
+BR2_TARGET_TI_K3=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000f421fc06119a3799--

--===============0623353164543187078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0623353164543187078==--
