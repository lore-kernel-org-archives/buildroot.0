Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9466C3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 11:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F5A60743;
	Sat, 31 Dec 2022 11:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F5A60743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-DUTFHZ7-Ja; Sat, 31 Dec 2022 11:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FED360746;
	Sat, 31 Dec 2022 11:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FED360746
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3DA1BF280
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 11:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26A8E81465
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 11:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A8E81465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqXai3gTbQ-G for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 11:05:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0487A8140D
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0487A8140D
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 11:04:59 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id p30so17892326vsr.1
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 03:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vuX+CI1Y2z/RVB/AlQJOrH6dIUYuFVmLziRncJHvlH8=;
 b=eInXFNQXb8XHXj/BR6jH+pNsWj6sjhLQAtekLqwAQH7+Bclu209PahB0oZp9AQXGE0
 8rXofYAllFHEkD4twhEUSOTkbjpttYpP0/uGn6jR2+82GWpzCXk8o73orzDwJ/KjVCVR
 2YPmwhO9gRK40Bv1ZDd2vbJU5vJLR4NaiAIFL/e/570UAjiOGlY33ko1eVGXE9BqJu2J
 P3/MCLaz6lv/xSmGc0GB4Lv/GXdZS934jg/bolm5OXBlh4/pkXlngDBKlgRXgXL77C0i
 OTSJZ1dHHveIVssC7PWyQPbL9iV2mwh3yjZsFCmR4KVq5rF6ALCVfTt9+5sc7ntKHPOU
 96Tw==
X-Gm-Message-State: AFqh2krrLO6Bbu2cw1tf3IRDeRwlCgdkL3Kv4zn5HFhhzIYlSD+0EtVu
 dOEYDchLR0gC/GSReZngdMX0OoXUPGG2VlwsK611PA==
X-Google-Smtp-Source: AMrXdXt3jED8aNYPSbRUZlQjtyCDaVmOrHeAqQ4N++L/uhUqPj+oGAYk/dZLd4BPR8CTGG2tUUSrTDDAFQ8mt4Be3mw=
X-Received: by 2002:a05:6102:c12:b0:3be:c2b1:29ef with SMTP id
 x18-20020a0561020c1200b003bec2b129efmr5046737vss.15.1672484698463; Sat, 31
 Dec 2022 03:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20221229194729.8085-1-ju.o@free.fr>
 <20221230095728.5941-1-ju.o@free.fr>
 <20221230095728.5941-6-ju.o@free.fr>
In-Reply-To: <20221230095728.5941-6-ju.o@free.fr>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 31 Dec 2022 12:04:43 +0100
Message-ID: <CAB0FRssrZm_=0YRzZ_rziC+L-gfdMQK32XG9vZSRcGTyXLu2kw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 27/27] configs/ls1028ardb: update codeaurora
 URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: multipart/mixed; boundary="===============3777972265076927399=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3777972265076927399==
Content-Type: multipart/alternative; boundary="000000000000583c4705f11db0df"

--000000000000583c4705f11db0df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 30 d=C3=A9c. 2022 =C3=A0 10:59, Julien Olivain <ju.o@free.fr> a =C3=
=A9crit :

> NXP moved all its open source code repositories from Code Aurora Forum
> to github. See for example:
>
> https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed0=
83b9c53097
>
> Software packages are now grouped in several NXP github
> projects/organizations (nxp-imx, nxp-qoriq, ...). See:
> https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITH=
UB
>
> The NXP code published on Code Aurora is still present (at the time of
> this commit) but is no longer receiving updates. It is also expected
> to be shut down on 2023-03-31. The Code Aurora website
> https://source.codeaurora.org/ currently show the following message:
> """
> Note: Qualcomm Innovation Center Inc. maintained repositories have
> migrated to git.codelinaro.org. QUIC repositories on this site will
> not receive any updates after March 31, 2022, and will be deleted on
> March 31, 2023. If your project depends on these repositories, please
> adjust your tooling configuration to use the new, up-to-date project
> location.
> """
>
> For this reason, the NXP recipes using codeaurora.org urls need to be
> updated to the correct github.com replacement.
>
> Note: this commit does not change the component version. Only the
> download URL is updated. The archive content is expected to be the
> same.
>
> Note 2: this commit updates the Kernel, U-Boot and ATF download urls.
> The method is also changed from _CUSTOM_GIT to _CUSTOM_TARBALL.
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
>

Reviewed-by: Francois Perrad <francois.perrad@gadz.org>



> ---
>  configs/ls1028ardb_defconfig | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
> index 1bc84f7b80..a46b94511a 100644
> --- a/configs/ls1028ardb_defconfig
> +++ b/configs/ls1028ardb_defconfig
> @@ -17,9 +17,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c
> board/freescale/ls1028ardb/genimage.cfg"
>
>  # Kernel
>  BR2_LINUX_KERNEL=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_GIT=3Dy
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL=3D"
> https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=3D"LSDK-21.08"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,nxp-qoriq,linux,LSDK-21.08)/linux-LSDK-21.08.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG=3D"imx_v8"
>
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"$(LINUX_DIR)/arch/arm64/config=
s/lsdk.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> @@ -37,9 +36,8 @@ BR2_TARGET_ROOTFS_EXT2_SIZE=3D"120M"
>
>  # Bootloaders
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=3Dy
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=3D"
> https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION=3D"LSDK-21.08"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,nxp-qoriq,atf,LSDK-21.08)/atf-LSDK-21.08.tar.gz"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"ls1028ardb"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=3Dy
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=3Dy
> @@ -48,9 +46,8 @@
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"BOOT_MODE=3Dsd"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=3D"fip.bin bl2_sd.pbl"
>  BR2_TARGET_UBOOT=3Dy
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_GIT=3Dy
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL=3D"
> https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=3D"LSDK-21.08"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,nxp-qoriq,u-boot,LSDK-21.08)/u-boot-LSDK-21.08.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"ls1028ardb_tfa"
>  BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
>
> --
> 2.39.0
>
>

--000000000000583c4705f11db0df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 30 d=C3=A9c. 2022 =C3=A0=
=C2=A010:59, Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.f=
r</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">NXP moved all its open source code repositories from Code Aur=
ora Forum<br>
to github. See for example:<br>
<a href=3D"https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660=
519cf4ed083b9c53097" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097</a><br>
<br>
Software packages are now grouped in several NXP github<br>
projects/organizations (nxp-imx, nxp-qoriq, ...). See:<br>
<a href=3D"https://www.nxp.com/design/software/embedded-software/nxp-github=
:NXP-GITHUB" rel=3D"noreferrer" target=3D"_blank">https://www.nxp.com/desig=
n/software/embedded-software/nxp-github:NXP-GITHUB</a><br>
<br>
The NXP code published on Code Aurora is still present (at the time of<br>
this commit) but is no longer receiving updates. It is also expected<br>
to be shut down on 2023-03-31. The Code Aurora website<br>
<a href=3D"https://source.codeaurora.org/" rel=3D"noreferrer" target=3D"_bl=
ank">https://source.codeaurora.org/</a> currently show the following messag=
e:<br>
&quot;&quot;&quot;<br>
Note: Qualcomm Innovation Center Inc. maintained repositories have<br>
migrated to <a href=3D"http://git.codelinaro.org" rel=3D"noreferrer" target=
=3D"_blank">git.codelinaro.org</a>. QUIC repositories on this site will<br>
not receive any updates after March 31, 2022, and will be deleted on<br>
March 31, 2023. If your project depends on these repositories, please<br>
adjust your tooling configuration to use the new, up-to-date project<br>
location.<br>
&quot;&quot;&quot;<br>
<br>
For this reason, the NXP recipes using <a href=3D"http://codeaurora.org" re=
l=3D"noreferrer" target=3D"_blank">codeaurora.org</a> urls need to be<br>
updated to the correct <a href=3D"http://github.com" rel=3D"noreferrer" tar=
get=3D"_blank">github.com</a> replacement.<br>
<br>
Note: this commit does not change the component version. Only the<br>
download URL is updated. The archive content is expected to be the<br>
same.<br>
<br>
Note 2: this commit updates the Kernel, U-Boot and ATF download urls.<br>
The method is also changed from _CUSTOM_GIT to _CUSTOM_TARBALL.<br>
<br>
Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" target=3D=
"_blank">ju.o@free.fr</a>&gt;<br></blockquote><div><br></div><div><pre clas=
s=3D"gmail-content"><span class=3D"gmail-reviewed-by">Reviewed-by: Francois=
 Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org">francois.perrad@gad=
z.org</a>&gt;</span></pre>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0configs/ls1028ardb_defconfig | 15 ++++++---------<br>
=C2=A01 file changed, 6 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig<br=
>
index 1bc84f7b80..a46b94511a 100644<br>
--- a/configs/ls1028ardb_defconfig<br>
+++ b/configs/ls1028ardb_defconfig<br>
@@ -17,9 +17,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/freescale/ls=
1028ardb/genimage.cfg&quot;<br>
<br>
=C2=A0# Kernel<br>
=C2=A0BR2_LINUX_KERNEL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_GIT=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://source.codeaur=
ora.org/external/qoriq/qoriq-components/linux" rel=3D"noreferrer" target=3D=
"_blank">https://source.codeaurora.org/external/qoriq/qoriq-components/linu=
x</a>&quot;<br>
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=3D&quot;LSDK-21.08&quot;<br>
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,nxp-qoriq,l=
inux,LSDK-21.08)/linux-LSDK-21.08.tar.gz&quot;<br>
=C2=A0BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;imx_v8&quot;<br>
=C2=A0BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;$(LINUX_DIR)/arch/arm6=
4/configs/lsdk.config&quot;<br>
=C2=A0BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
@@ -37,9 +36,8 @@ BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;120M&quot;<br>
<br>
=C2=A0# Bootloaders<br>
=C2=A0BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy<br>
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=3Dy<br>
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=3D&quot;<a href=3D"https:/=
/source.codeaurora.org/external/qoriq/qoriq-components/atf" rel=3D"noreferr=
er" target=3D"_blank">https://source.codeaurora.org/external/qoriq/qoriq-co=
mponents/atf</a>&quot;<br>
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION=3D&quot;LSDK-21.08&quo=
t;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=3D&quot;$(call git=
hub,nxp-qoriq,atf,LSDK-21.08)/atf-LSDK-21.08.tar.gz&quot;<br>
=C2=A0BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D&quot;ls1028ardb&quot;<br>
=C2=A0BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=3Dy<br>
=C2=A0BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=3Dy<br>
@@ -48,9 +46,8 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D&q=
uot;BOOT_MODE=3Dsd&quot;<br>
=C2=A0BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=3D&quot;fip.bin bl2_sd.pbl&quo=
t;<br>
=C2=A0BR2_TARGET_UBOOT=3Dy<br>
=C2=A0BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_GIT=3Dy<br>
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL=3D&quot;<a href=3D"https://source.codeaur=
ora.org/external/qoriq/qoriq-components/u-boot" rel=3D"noreferrer" target=
=3D"_blank">https://source.codeaurora.org/external/qoriq/qoriq-components/u=
-boot</a>&quot;<br>
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=3D&quot;LSDK-21.08&quot;<br>
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,nxp-qoriq,u=
-boot,LSDK-21.08)/u-boot-LSDK-21.08.tar.gz&quot;<br>
=C2=A0BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;ls1028ardb_tfa&quot;<br>
=C2=A0BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div></div>

--000000000000583c4705f11db0df--

--===============3777972265076927399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3777972265076927399==--
