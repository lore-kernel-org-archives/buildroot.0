Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC1EC4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 10:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E7B26056C
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 10:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E7B26056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E47A883A77;
	Thu, 29 Jul 2021 10:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDZoju45Kwul; Thu, 29 Jul 2021 10:31:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 132D583AA3;
	Thu, 29 Jul 2021 10:31:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 089441BF4D7
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 10:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFE3E400D8
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 10:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGJ2fUVo_M2k for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 10:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DCB640025
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 10:31:20 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id s48so9403475ybi.7
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GidZkQ0mN7PGdquQ5DgO+xztsQPnZy3H0JAqoNill1Y=;
 b=hjWs96P9GgCxIOwWUfZgdzZ+fP0sSDjMKruLuCr2k81PHSOW1k8cH4f9HXjsClL+E/
 cuaers5WPf3T9z2+dwkTCXO48AprZdvfwjmIcokknukJFPUPmdohNurHvGEEnWxk39pP
 /jgiJriLrN4Qf8p1ER6UW9WEfy0/wIGI5a949sfHP6GDcSFGJcwt6s4XGQV+QMLx8vtY
 CjeZlOmtJmtyTvV7x+kYqjSDICCyPbE502UeJV67Wpn9g+m8jKzYsU0kmQQW7ILKbQtl
 8SWhJp0w6Pc+QRd162Y80f9ba5+4PEbvLBA8GSh+S52JotUvArjAGbe+tUE2EJn2AijJ
 anZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GidZkQ0mN7PGdquQ5DgO+xztsQPnZy3H0JAqoNill1Y=;
 b=nlzOysayatKk5L3cGSbm/Yx6qhwiFI1JKAY2vaz1EUH3hL6Dc8GSFGGSs9MT8GtUhy
 uI1M4h1006rp2GG2ovmwgeADuDNn/R5XMe925CpamD1StNwmBDa3MHVmuTDnv5pihWSs
 K0WqIAmobpllyD7Eua8yt+ufYk84mWDgPW3EjKxHZXN6SyREZASIDqoTTU8UDYdB2sWO
 EYoOjyAaKv5rhZEabh99Fg9RyQGKqSUQYJoyWD7ob0jyVILINiSzv86FVrJ9mHTqFOoK
 0gca3AjK5jc/gnp53+vhhUEbNBmYPSe8g100qTLpC9JRqRPrPLIVxMUyWGPoh/7gDidh
 yvHA==
X-Gm-Message-State: AOAM533CtSennpuavMxT/rTzdVIvncICKLOyHT8AMGZ3dHp/8zhly7L4
 P0SIQKSQzh+U9XTKFHkY4khIUieuomuPkTcnssg=
X-Google-Smtp-Source: ABdhPJwRT6zA4AOUlJOGCyXDbhL39B7BIrUwzcYqsdb6WQGGJgmQJQofcR2p8UqdaiTcHWKtY9p9Q7MtsRm5mia7a28=
X-Received: by 2002:a25:8101:: with SMTP id o1mr6064363ybk.83.1627554679077;
 Thu, 29 Jul 2021 03:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210723160422.490090-1-eugentoo@gmail.com>
 <50116d22-7c7d-81fe-4d3d-5909a3338721@mind.be>
 <CADj5-Awozh1q++XmE1n4Znr+pBNhawdM2AjjZ+1dQYcFfC4NRg@mail.gmail.com>
In-Reply-To: <CADj5-Awozh1q++XmE1n4Znr+pBNhawdM2AjjZ+1dQYcFfC4NRg@mail.gmail.com>
From: Yauheni Saldatsenka <eugentoo@gmail.com>
Date: Thu, 29 Jul 2021 13:31:07 +0300
Message-ID: <CADj5-AwHNP2BqGKbA9C4LAuj_+dKVkCus1M1n8tvQpwNJ8Psdw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] board/stm32f469-disco: update board
 configuration
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7150714906424299315=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7150714906424299315==
Content-Type: multipart/alternative; boundary="0000000000007fbd9f05c8409a73"

--0000000000007fbd9f05c8409a73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnout!
A friendly reminder

Best regards,
Yauheni Saldatsenka

=D0=BF=D0=BD, 26 =D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 19:45, Yauheni Sal=
datsenka <eugentoo@gmail.com>:

> Hi Arnout!
>
> Thanks for the review, nice to know that code quality is kept high.
>
> Some background information.
> My patch is something that I was doing in February and shelved until this
> month.
> I've sent the previous revision to Christophe and we agreed that it would
> be nice to have two system configurations: u-boot and xip.
>
> So if you would have more ideological and motivational questions please
> feel free to ask.
>
> Now to the questions.
>
> First of all, there are a few other patches posted by Dario (in Cc]
>> [1][2]. How
>> does this relate to them?
>>
>
> I only saw a previous commit of Dario with u-boot, not very aware of thes=
e
> two.
>
> confgis/stm32f469_disco_xip_defconfig: alternative defconfig for
>> stm32f469_disco
>> This change in the flash script will need a corresponding change in the
>> readme.txt.
>
>
> Agree.
>
> Also, this change seems unrelated to the rest of the patch, so it should
>> be in
>> a separate patch (with a good explanation in the commit message as to wh=
y
>> it is
>> needed).
>>
> Do you mean that the update of flash script should be a separate patch
> included in the patchset?
>
> >
>> > -if ! test -d "${OUTPUT_DIR}" ; then
>> > +if ! test -d "${OUTPUT_DIR}"
>> > +then
>>
>>  Spurious change - we normally write the if and the then on one line in
>> shell
>> scripts.
>>
> Is this buildroot bash codestyle?
>
>  We normally call the linux config "linux.config", not "linux/defconfig"
>>
>
> Okay, I see.
>
>  Please document in the commit message where you got this dts from. How
>> does it
>> differ from the in-kernel one, and why can't you just patch the in-kerne=
l
>> one?
>>
> I can use the kernel one with patch from my side.
>
> >         chosen {
>> >                 bootargs =3D "root=3D/dev/ram fbcon=3Dmap:0";
>>
>>  Not very important, but is the root=3D/dev/ram really needed? When we'r=
e
>> using
>> initramfs, the kernel never looks at the root=3D parameter so it seems
>> redundant.
>
>
> Honestly I'm not quite aware of that. If it would boot without then I'll
> remove this param.
>
> > diff --git
>> a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-ker=
nel-start-address.patch
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-ker=
nel-start-address.patch
>>
>>  Where is 0001?
>
>
> Probably dead during experiments. I'll rename this one to 0001
>
> Patches should preferably be produced by "git format-patch -N" from a git
>> clone
>> of the upstream afboot-stm32 repository. Concretely, they should have:
>>
>> - a subject line
>> - a good commit message (describing why the patch is needed, also upstre=
am
>> status if relevant)
>> - your Signed-off-by
>>
>> Basically, just like a patch submitted to buildroot.
>>
>
> The readme.txt should be updated to describe this new defconfig and the
>> differences between them, so people know which one to choose for their
>> use case.
>>
>
> Agree.
>
> Please keep the default SAME_AS_KERNEL, and instead set
>>
>> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=3Dy
>>
>>  Also, it would be nice to bump stm32f469_disco_defconfig to use the sam=
e
>> kernel
>> version.
>>
>
> Okay, not a problem.
>
> Is GCC11 really needed? We normally want to keep the default GCC version
>> in the
>> defconfigs, so they follow updates of GCC.
>>
>>  If it si really needed, please document it in the commit message.
>>
>> Nope, I've just chosen it to have latest optimization trick available.
> Can be easily changed to default one.
>
> > +BR2_GCC_ENABLE_LTO=3Dy
>>  I guess this really is needed - so please explain that in the commit
>> message.
>
> Yep, sure.
> LTO saves a bit of footprint, i can comment it out in commit message if
> needed.
>
> >
>> +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/stmicroelectronics/common/stm32f4=
xx/stm32-post-build.sh"
>> > +BR2_LINUX_KERNEL=3Dy
>>
>>  Even though 5.13 is the default now, it's not going to stay that way. S=
o
>> you
>> need to set BR2_LINUX_KERNEL_CUSTOM_VERSION instead.
>>
> What do you mean here?
>
> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>> >
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/stmicroelectronics/stm32f4=
69-disco/linux/defconfig"
>> > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy
>> > +BR2_LINUX_KERNEL_XZ=3Dy
>> > +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=3D"xipImage"
>> > +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
>> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"stm32f469-disco"
>> >
>> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/stmicroelectronics/stm32f469-=
disco/linux/stm32f469-disco.dts"
>> > +BR2_PACKAGE_BUSYBOX_CONFIG=3D"package/busybox/busybox-minimal.config"
>> > +BR2_PACKAGE_ZLIB=3Dy
>>
>>  Why is zlib needed? That seems weird...
>>
>
> > +BR2_TARGET_ROOTFS_INITRAMFS=3Dy
>> > +# BR2_TARGET_ROOTFS_TAR is not set
>> > +BR2_TARGET_AFBOOT_STM32=3Dy
>> > +BR2_PACKAGE_HOST_OPENOCD=3Dy
>> > +BR2_PACKAGE_HOST_UTIL_LINUX=3Dy
>>
>>  I also don't see where util-linux is used, but I may have missed it.
>>
>
> Yep, looks strange.
> I've intentionally disabled compression methods.
> Needs some investigation.
>
> So.
> After all discussion points would be resolved, what are the next steps?
> Should I send the patchset directly to you and Christophe via git
> send-email or there is some other workflow?
>
>
>
> Best regards,
> Yauheni Saldatsenka
>
>
>
>
>
>
>
>
>
>
>
>
> =D1=81=D0=B1, 24 =D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 00:37, Arnout Va=
ndecappelle <arnout@mind.be>:
>
>>  Hi Yauheni,
>>
>>  Thank you for this patch. I have a few comments that I unfortunately
>> can't fix
>> myself.
>>
>>  First of all, there are a few other patches posted by Dario (in Cc]
>> [1][2]. How
>> does this relate to them?
>>
>> [1]
>>
>> https://patchwork.ozlabs.org/project/buildroot/patch/20210704141106.1746=
-2-dariobin@libero.it/
>> [2] https://patchwork.ozlabs.org/project/buildroot/list/?series=3D253877
>>
>>
>>
>>  The subject line of this patch should be:
>>
>> confgis/stm32f469_disco_xip_defconfig: alternative defconfig for
>> stm32f469_disco
>>
>> On 23/07/2021 18:04, Yauheni Saldatsenka wrote:
>> > Update STM32F469-disco configuration files to operate with new kernel.
>> >
>> > Result of make tinyconfig was taken as a starting point to fit kernel
>> > into flash memory.
>> > Current setup kernel + rootfs fits in 1.6MB on-chip flash memory
>> >
>> > Fixes:
>> >     - Move kernel to new flash bank due to growth of dtb size
>> >     - Fix kernel start address in bootloader
>> >     - Remove outdated path which doesn't affect normal operation mode
>> >
>> > Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
>> > ---
>> >  .../stm32f469-disco/flash.sh                  |  47 +++-
>> >  .../stm32f469-disco/linux/defconfig           | 120 +++++++++
>> >  .../stm32f469-disco/linux/stm32f469-disco.dts | 240 +++++++++++++++++=
+
>> >  .../0002-kernel-start-address.patch           |  21 ++
>> >  .../patches/afboot-stm32/0003-no-mpu.patch    |  22 ++
>> >  configs/stm32f469_disco_xip_defconfig         |  24 ++
>> >  6 files changed, 465 insertions(+), 9 deletions(-)
>> >  create mode 100644
>> board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> >  create mode 100644
>> board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> >  create mode 100644
>> board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kerne=
l-start-address.patch
>> >  create mode 100644
>> board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mp=
u.patch
>> >  create mode 100644 configs/stm32f469_disco_xip_defconfig
>> >
>> > diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh
>> b/board/stmicroelectronics/stm32f469-disco/flash.sh
>> > index 984d2b2599..176e1c9d2c 100755
>> > --- a/board/stmicroelectronics/stm32f469-disco/flash.sh
>> > +++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
>> > @@ -1,18 +1,47 @@
>> >  #!/bin/bash
>> >
>> >  OUTPUT_DIR=3D$1
>> > +BUILD_TYPE=3D$2
>>
>>  This change in the flash script will need a corresponding change in the
>> readme.txt.
>>
>>  Also, this change seems unrelated to the rest of the patch, so it shoul=
d
>> be in
>> a separate patch (with a good explanation in the commit message as to wh=
y
>> it is
>> needed).
>>
>> >
>> > -if ! test -d "${OUTPUT_DIR}" ; then
>> > +if ! test -d "${OUTPUT_DIR}"
>> > +then
>>
>>  Spurious change - we normally write the if and the then on one line in
>> shell
>> scripts.
>>
>> >      echo "ERROR: no output directory specified."
>> >      echo "Usage: $0 OUTPUT_DIR"
>> >      exit 1
>> >  fi
>> >
>> > -${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
>> > -  -c "init" \
>> > -  -c "reset init" \
>> > -  -c "flash probe 0" \
>> > -  -c "flash info 0" \
>> > -  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin
>> 0x08000000" \
>> > -  -c "reset run" \
>> > -  -c "shutdown"
>> > +if  [[ -z "${BUILD_TYPE}" ]]
>> > +then
>> > +    echo "ERROR: no build type specified, please select 'xip' or
>> 'uboot'."
>> > +    echo "Usage: $0 OUTPUT_DIR $1 BUILD_TYPE"
>> > +    exit 1
>> > +fi
>> > +
>> > +case "${BUILD_TYPE}" in
>> > +     "xip")
>> > +             ${OUTPUT_DIR}/host/bin/openocd -f
>> board/stm32f469discovery.cfg \
>> > +                                      -c "init" \
>> > +                                      -c "reset init" \
>> > +                                      -c "flash probe 0" \
>> > +                                      -c "flash info 0" \
>> > +                                      -c "flash write_image erase
>> ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
>> > +                                      -c "flash write_image erase
>> ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
>> > +                                      -c "flash write_image erase
>> ${OUTPUT_DIR}/images/xipImage 0x08010000" \
>> > +                                      -c "reset run" \
>> > +                                      -c "shutdown"
>> > +             ;;
>> > +     "uboot")
>> > +             FLASH_COMMAND=3D
>> > +             ${OUTPUT_DIR}/host/bin/openocd -f
>> board/stm32f469discovery.cfg \
>> > +                                      -c "init" \
>> > +                                      -c "reset init" \
>> > +                                      -c "flash probe 0" \
>> > +                                      -c "flash info 0" \
>> > +                                      -c "flash write_image erase
>> ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
>> > +                                      -c "reset run" \
>> > +                                      -c "shutdown"
>> > +         ;;
>> > +     *)
>> > +             echo "Wrong build type. Please select from: xip, uboot"
>> > +             ;;
>> > +esac
>> > diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> > new file mode 100644
>> > index 0000000000..2d0ce59b31
>> > --- /dev/null
>> > +++ b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>>
>>  We normally call the linux config "linux.config", not "linux/defconfig"=
.
>>
>> > @@ -0,0 +1,120 @@
>> [snip]
>> > diff --git
>> a/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> > new file mode 100644
>> > index 0000000000..83fe71bbc6
>> > --- /dev/null
>> > +++ b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.d=
ts
>>
>>  Please document in the commit message where you got this dts from. How
>> does it
>> differ from the in-kernel one, and why can't you just patch the in-kerne=
l
>> one?
>>
>> [snip]
>> >         chosen {
>> >                 bootargs =3D "root=3D/dev/ram fbcon=3Dmap:0";
>>
>>  Not very important, but is the root=3D/dev/ram really needed? When we'r=
e
>> using
>> initramfs, the kernel never looks at the root=3D parameter so it seems
>> redundant.
>>
>> >                 stdout-path =3D "serial0:115200n8";
>> >         };[snip]
>> > diff --git
>> a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-ker=
nel-start-address.patch
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-ker=
nel-start-address.patch
>>
>>  Where is 0001?
>>
>> > new file mode 100644
>> > index 0000000000..614effa85b
>> > --- /dev/null
>> > +++
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-ker=
nel-start-address.patch
>> > @@ -0,0 +1,21 @@
>> > +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
>>
>>  Patches should preferably be produced by "git format-patch -N" from a
>> git clone
>> of the upstream afboot-stm32 repository. Concretely, they should have:
>>
>> - a subject line
>> - a good commit message (describing why the patch is needed, also upstre=
am
>> status if relevant)
>> - your Signed-off-by
>>
>> Basically, just like a patch submitted to buildroot.
>>
>> > +index 2da1f4b65f..96e4dff65e 100644
>> > +--- a/stm32f469i-disco.c
>> > ++++ b/stm32f469i-disco.c
>> > +@@ -6,6 +6,7 @@
>> > + #include "gpio.h"
>> > + #include "mpu.h"
>> > +
>> > ++#define KERNEL_ADDR     0x08010000
>> > + #define CONFIG_HSE_HZ       8000000
>> > + #define CONFIG_PLL_M        8
>> > + #define CONFIG_PLL_N        360
>> > +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
>> > +
>> > + void start_kernel(void)
>> > + {
>> > +-    void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =
=3D
>> (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
>> > ++    void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =
=3D
>> (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
>> > +
>> > +     kernel(0, ~0UL, 0x08004000);
>> > + }
>> > diff --git
>> a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-=
mpu.patch
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-=
mpu.patch
>> > new file mode 100644
>> > index 0000000000..bc66d2d0ef
>> > --- /dev/null
>> > +++
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-=
mpu.patch
>> > @@ -0,0 +1,22 @@
>> > +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
>> > +index d4d0909831..03f823f288 100644
>> > +--- a/stm32f469i-disco.c
>> > ++++ b/stm32f469i-disco.c
>> > +@@ -127,7 +127,7 @@ int main(void)
>> > +
>> > +     int i;
>> > +
>> > +-    mpu_config(0x0);
>> > ++    mpu_config(0xc0000000);
>> > +
>> > +     if (*FLASH_CR & FLASH_CR_LOCK) {
>> > +             *FLASH_KEYR =3D 0x45670123;
>> > +@@ -229,7 +229,7 @@ int main(void)
>> > +     usart_setup(usart_base, 45000000);
>> > +     usart_putch(usart_base, '.');
>> > +
>> > +-    *SYSCFG_MEMRMP =3D 0x4;
>> > ++    /* *SYSCFG_MEMRMP =3D 0x4; */
>> > +
>> > +     start_kernel();
>> > +
>> > diff --git a/configs/stm32f469_disco_xip_defconfig
>> b/configs/stm32f469_disco_xip_defconfig
>> > new file mode 100644
>> > index 0000000000..81bdb0d6d6
>> > --- /dev/null
>> > +++ b/configs/stm32f469_disco_xip_defconfig
>>  The readme.txt should be updated to describe this new defconfig and the
>> differences between them, so people know which one to choose for their
>> use case.
>>
>> > @@ -0,0 +1,24 @@
>> > +BR2_arm=3Dy
>> > +BR2_cortex_m4=3Dy
>> > +BR2_GLOBAL_PATCH_DIR=3D"board/stmicroelectronics/stm32f469-disco/patc=
hes"
>> > +BR2_KERNEL_HEADERS_5_13=3Dy
>>
>>  Please keep the default SAME_AS_KERNEL, and instead set
>>
>> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=3Dy
>>
>>  Also, it would be nice to bump stm32f469_disco_defconfig to use the sam=
e
>> kernel
>> version.
>>
>> > +# BR2_UCLIBC_INSTALL_UTILS is not set
>> > +BR2_GCC_VERSION_11_X=3Dy
>>
>>  Is GCC11 really needed? We normally want to keep the default GCC versio=
n
>> in the
>> defconfigs, so they follow updates of GCC.
>>
>>  If it si really needed, please document it in the commit message.
>>
>> > +BR2_GCC_ENABLE_LTO=3Dy
>>
>>  I guess this really is needed - so please explain that in the commit
>> message.
>>
>> >
>> +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/stmicroelectronics/common/stm32f4=
xx/stm32-post-build.sh"
>> > +BR2_LINUX_KERNEL=3Dy
>>
>>  Even though 5.13 is the default now, it's not going to stay that way. S=
o
>> you
>> need to set BR2_LINUX_KERNEL_CUSTOM_VERSION instead.
>>
>> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>> >
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/stmicroelectronics/stm32f4=
69-disco/linux/defconfig"
>> > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy
>> > +BR2_LINUX_KERNEL_XZ=3Dy
>> > +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=3D"xipImage"
>> > +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
>> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"stm32f469-disco"
>> >
>> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/stmicroelectronics/stm32f469-=
disco/linux/stm32f469-disco.dts"
>> > +BR2_PACKAGE_BUSYBOX_CONFIG=3D"package/busybox/busybox-minimal.config"
>> > +BR2_PACKAGE_ZLIB=3Dy
>>
>>  Why is zlib needed? That seems weird...
>>
>> > +BR2_TARGET_ROOTFS_INITRAMFS=3Dy
>> > +# BR2_TARGET_ROOTFS_TAR is not set
>> > +BR2_TARGET_AFBOOT_STM32=3Dy
>> > +BR2_PACKAGE_HOST_OPENOCD=3Dy
>> > +BR2_PACKAGE_HOST_UTIL_LINUX=3Dy
>>
>>  I also don't see where util-linux is used, but I may have missed it.
>>
>>
>>  I have marked the patch as Changes Requested in patchwork.
>>
>>  Regards,
>>  Arnout
>>
>

--0000000000007fbd9f05c8409a73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Arnout!<br></div>A friendly reminder<br>=
<br></div>Best regards, <br></div>Yauheni Saldatsenka<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D0=BD, 26 =
=D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 19:45, Yauheni Saldatsenka &lt;<a h=
ref=3D"mailto:eugentoo@gmail.com">eugentoo@gmail.com</a>&gt;:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><div><div><div>Hi Arnout!<br></div><br></div>Thanks for the review, ni=
ce to know that code quality is kept high. <br><br><div>Some background inf=
ormation.<br></div><div>My patch is something that I was doing in February =
and shelved until this month.<br></div>I&#39;ve sent the previous revision =
to Christophe and we agreed that it would be nice to have two system config=
urations: u-boot and xip. <br></div><div><br>So if you would have more ideo=
logical and motivational questions please feel free to ask.<br></div><div><=
br></div>Now to the questions.<br><br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">First of all, there are a few other patches posted by Dario (i=
n Cc] [1][2]. How<br>
does this relate to them?<br></blockquote><div><br></div><div>I only saw a =
previous commit of Dario with u-boot, not very aware of these two.<br><br><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">confgis/stm32f469_disco_xi=
p_defconfig: alternative defconfig for stm32f469_disco=C2=A0 <br>This chang=
e in the flash script will need a corresponding change in the readme.txt.</=
blockquote><br></div><div>Agree.<br><br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Also, this change seems unrelated to the rest of the patch, =
so it should be in<br>
a separate patch (with a good explanation in the commit message as to why i=
t is<br>
needed).<span><br></span></blockquote><div>Do you mean that the update of f=
lash script should be a separate patch included in the patchset?<br><br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><span>&gt;=C2=A0 <br>
&gt; -if ! test -d &quot;${OUTPUT_DIR}&quot; ; then<br>
&gt; +if ! test -d &quot;${OUTPUT_DIR}&quot;<br>
&gt; +then<br>
<br></span>
=C2=A0Spurious change - we normally write the if and the then on one line i=
n shell<br>
scripts.<br></blockquote><div>Is this buildroot bash codestyle?<br></div><b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0We normally call =
the linux config &quot;linux.config&quot;, not &quot;linux/defconfig&quot;<=
br></blockquote></div><br></div><div>Okay, I see.</div><div><br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">=C2=A0Please document in the commit =
message where you got this dts from. How does it<br>
differ from the in-kernel one, and why can&#39;t you just patch the in-kern=
el one?<br></blockquote><div>I can use the kernel one with patch from my si=
de.<br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0chosen {<span><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootargs =
=3D &quot;root=3D/dev/ram fbcon=3Dmap:0&quot;;<br>
<br></span>
=C2=A0Not very important, but is the root=3D/dev/ram really needed? When we=
&#39;re using<br>
initramfs, the kernel never looks at the root=3D parameter so it seems redu=
ndant.</blockquote> </div></div><div><br></div><div>Honestly I&#39;m not qu=
ite aware of that. If it would boot without then I&#39;ll remove this param=
. <br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; diff --git=
 a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kerne=
l-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/af=
boot-stm32/0002-kernel-start-address.patch<br>
<br>
=C2=A0Where is 0001?<span></span></blockquote><div><br></div><div>Probably =
dead during experiments. I&#39;ll rename this one to 0001<br><br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Patches should preferably be produc=
ed by &quot;git format-patch -N&quot; from a git clone<br>
of the upstream afboot-stm32 repository. Concretely, they should have:<br>
<br>
- a subject line<br>
- a good commit message (describing why the patch is needed, also upstream<=
br>
status if relevant)<br>
- your Signed-off-by<br>
<br>
Basically, just like a patch submitted to buildroot.<br></blockquote><div><=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">The readme.txt should =
be updated to describe this new defconfig and the<br>
differences between them, so people know which one to choose for their use =
case.<span></span><br><span></span></blockquote><span>
</span><br></div><div>Agree.<br></div><div><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Please keep the default SAME_AS_KERNEL, and instead s=
et<br>
<br>
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=3Dy<br>
<br>
=C2=A0Also, it would be nice to bump stm32f469_disco_defconfig to use the s=
ame kernel<br>
version.<span><br>
</span></blockquote><div><br></div><div>Okay, not a problem.<br><br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Is GCC11 really needed? We norma=
lly want to keep the default GCC version in the<br>
defconfigs, so they follow updates of GCC.<br>
<br>
=C2=A0If it si really needed, please document it in the commit message.<br>=
<br></blockquote><div>Nope, I&#39;ve just chosen it to have latest optimiza=
tion trick available. <br></div><div>Can be easily changed to default one. =
<br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +BR2_GCC_ENABLE_LTO=3Dy<br>=C2=A0I guess this really is needed - so pl=
ease explain that in the commit message.</blockquote>Yep, sure. <br></div><=
div>LTO saves a bit of footprint, i can comment it out in commit message if=
 needed. <br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +BR=
2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/stmicroelectronics/common/stm32f4x=
x/stm32-post-build.sh&quot;<br>
&gt; +BR2_LINUX_KERNEL=3Dy<br>
<br>
=C2=A0Even though 5.13 is the default now, it&#39;s not going to stay that =
way. So you<br>
need to set BR2_LINUX_KERNEL_CUSTOM_VERSION instead.<span><br></span></bloc=
kquote><div>What do you mean here?<br><br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span>&gt; +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/stmicroelectronics/=
stm32f469-disco/linux/defconfig&quot;<br>
&gt; +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy<br>
&gt; +BR2_LINUX_KERNEL_XZ=3Dy<br>
&gt; +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=3D&quot;xipImage&quot;<br>
&gt; +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt; +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;stm32f469-disco&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D&quot;board/stmicroelectronics/stm=
32f469-disco/linux/stm32f469-disco.dts&quot;<br>
&gt; +BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;package/busybox/busybox-minimal.co=
nfig&quot;<br>
&gt; +BR2_PACKAGE_ZLIB=3Dy<br>
<br></span>
=C2=A0Why is zlib needed? That seems weird...<br></blockquote><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div><span>&gt; +BR2_TA=
RGET_ROOTFS_INITRAMFS=3Dy<br>
&gt; +# BR2_TARGET_ROOTFS_TAR is not set<br>
&gt; +BR2_TARGET_AFBOOT_STM32=3Dy<br>
&gt; +BR2_PACKAGE_HOST_OPENOCD=3Dy<br>
&gt; +BR2_PACKAGE_HOST_UTIL_LINUX=3Dy<br>
<br></span>
=C2=A0I also don&#39;t see where util-linux is used, but I may have missed =
it.</div></blockquote><div>=C2=A0</div><div>Yep, looks strange. <br></div><=
div>I&#39;ve intentionally disabled compression methods.<br></div><div>Need=
s some investigation. <br><br></div><div>So.<br></div><div>After all discus=
sion points would be resolved, what are the next steps?<br></div><div>Shoul=
d I send the patchset directly to you and Christophe via git send-email or =
there is some other workflow? <br><br><br><br></div><div>Best regards,<br><=
/div><div>Yauheni Saldatsenka<br></div><br><br> <br></div><br><br></div><br=
> <br></div></div> <br></div></div><div><br></div><br><div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=
=D0=B1, 24 =D0=B8=D1=8E=D0=BB. 2021 =D0=B3. =D0=B2 00:37, Arnout Vandecappe=
lle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be<=
/a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0H=
i Yauheni,<br>
<br>
=C2=A0Thank you for this patch. I have a few comments that I unfortunately =
can&#39;t fix<br>
myself.<br>
<br>
=C2=A0First of all, there are a few other patches posted by Dario (in Cc] [=
1][2]. How<br>
does this relate to them?<br>
<br>
[1]<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20210704141=
106.1746-2-dariobin@libero.it/" rel=3D"noreferrer" target=3D"_blank">https:=
//patchwork.ozlabs.org/project/buildroot/patch/20210704141106.1746-2-dariob=
in@libero.it/</a><br>
[2] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D253877" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.or=
g/project/buildroot/list/?series=3D253877</a><br>
<br>
<br>
<br>
=C2=A0The subject line of this patch should be:<br>
<br>
confgis/stm32f469_disco_xip_defconfig: alternative defconfig for stm32f469_=
disco<br>
<br>
On 23/07/2021 18:04, Yauheni Saldatsenka wrote:<br>
&gt; Update STM32F469-disco configuration files to operate with new kernel.=
<br>
&gt; <br>
&gt; Result of make tinyconfig was taken as a starting point to fit kernel<=
br>
&gt; into flash memory.<br>
&gt; Current setup kernel + rootfs fits in 1.6MB on-chip flash memory<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Move kernel to new flash bank due to growth of dt=
b size<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Fix kernel start address in bootloader<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Remove outdated path which doesn&#39;t affect nor=
mal operation mode<br>
&gt; <br>
&gt; Signed-off-by: Yauheni Saldatsenka &lt;<a href=3D"mailto:eugentoo@gmai=
l.com" target=3D"_blank">eugentoo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../stm32f469-disco/flash.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 47 +++-<br>
&gt;=C2=A0 .../stm32f469-disco/linux/defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 120 +++++++++<br>
&gt;=C2=A0 .../stm32f469-disco/linux/stm32f469-disco.dts | 240 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../0002-kernel-start-address.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 21 ++<br>
&gt;=C2=A0 .../patches/afboot-stm32/0003-no-mpu.patch=C2=A0 =C2=A0 |=C2=A0 =
22 ++<br>
&gt;=C2=A0 configs/stm32f469_disco_xip_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 24 ++<br>
&gt;=C2=A0 6 files changed, 465 insertions(+), 9 deletions(-)<br>
&gt;=C2=A0 create mode 100644 board/stmicroelectronics/stm32f469-disco/linu=
x/defconfig<br>
&gt;=C2=A0 create mode 100644 board/stmicroelectronics/stm32f469-disco/linu=
x/stm32f469-disco.dts<br>
&gt;=C2=A0 create mode 100644 board/stmicroelectronics/stm32f469-disco/patc=
hes/afboot-stm32/0002-kernel-start-address.patch<br>
&gt;=C2=A0 create mode 100644 board/stmicroelectronics/stm32f469-disco/patc=
hes/afboot-stm32/0003-no-mpu.patch<br>
&gt;=C2=A0 create mode 100644 configs/stm32f469_disco_xip_defconfig<br>
&gt; <br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board=
/stmicroelectronics/stm32f469-disco/flash.sh<br>
&gt; index 984d2b2599..176e1c9d2c 100755<br>
&gt; --- a/board/stmicroelectronics/stm32f469-disco/flash.sh<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/flash.sh<br>
&gt; @@ -1,18 +1,47 @@<br>
&gt;=C2=A0 #!/bin/bash<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 OUTPUT_DIR=3D$1<br>
&gt; +BUILD_TYPE=3D$2<br>
<br>
=C2=A0This change in the flash script will need a corresponding change in t=
he readme.txt.<br>
<br>
=C2=A0Also, this change seems unrelated to the rest of the patch, so it sho=
uld be in<br>
a separate patch (with a good explanation in the commit message as to why i=
t is<br>
needed).<br>
<br>
&gt;=C2=A0 <br>
&gt; -if ! test -d &quot;${OUTPUT_DIR}&quot; ; then<br>
&gt; +if ! test -d &quot;${OUTPUT_DIR}&quot;<br>
&gt; +then<br>
<br>
=C2=A0Spurious change - we normally write the if and the then on one line i=
n shell<br>
scripts.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: no output directory specified.&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 echo &quot;Usage: $0 OUTPUT_DIR&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt;=C2=A0 fi<br>
&gt;=C2=A0 <br>
&gt; -${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \<br>
&gt; -=C2=A0 -c &quot;init&quot; \<br>
&gt; -=C2=A0 -c &quot;reset init&quot; \<br>
&gt; -=C2=A0 -c &quot;flash probe 0&quot; \<br>
&gt; -=C2=A0 -c &quot;flash info 0&quot; \<br>
&gt; -=C2=A0 -c &quot;flash write_image erase ${OUTPUT_DIR}/images/u-boot.b=
in 0x08000000&quot; \<br>
&gt; -=C2=A0 -c &quot;reset run&quot; \<br>
&gt; -=C2=A0 -c &quot;shutdown&quot;<br>
&gt; +if=C2=A0 [[ -z &quot;${BUILD_TYPE}&quot; ]]<br>
&gt; +then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;ERROR: no build type specified, please selec=
t &#39;xip&#39; or &#39;uboot&#39;.&quot;<br>
&gt; +=C2=A0 =C2=A0 echo &quot;Usage: $0 OUTPUT_DIR $1 BUILD_TYPE&quot;<br>
&gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; +fi<br>
&gt; +<br>
&gt; +case &quot;${BUILD_TYPE}&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;xip&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${OUTPUT_DIR}/host/bi=
n/openocd -f board/stm32f469discovery.cfg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;in=
it&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;re=
set init&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash probe 0&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash info 0&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000&=
quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000&q=
uot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;re=
set run&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;sh=
utdown&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;uboot&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLASH_COMMAND=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${OUTPUT_DIR}/host/bi=
n/openocd -f board/stm32f469discovery.cfg \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;in=
it&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;re=
set init&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash probe 0&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash info 0&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;fl=
ash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000&quot; \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;re=
set run&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -c &quot;sh=
utdown&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Wrong buil=
d type. Please select from: xip, uboot&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +esac<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig =
b/board/stmicroelectronics/stm32f469-disco/linux/defconfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2d0ce59b31<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/linux/defconfig<br>
<br>
=C2=A0We normally call the linux config &quot;linux.config&quot;, not &quot=
;linux/defconfig&quot;.<br>
<br>
&gt; @@ -0,0 +1,120 @@<br>
[snip]<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-=
disco.dts b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.=
dts<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..83fe71bbc6<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.d=
ts<br>
<br>
=C2=A0Please document in the commit message where you got this dts from. Ho=
w does it<br>
differ from the in-kernel one, and why can&#39;t you just patch the in-kern=
el one?<br>
<br>
[snip]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootargs =
=3D &quot;root=3D/dev/ram fbcon=3Dmap:0&quot;;<br>
<br>
=C2=A0Not very important, but is the root=3D/dev/ram really needed? When we=
&#39;re using<br>
initramfs, the kernel never looks at the root=3D parameter so it seems redu=
ndant.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-pa=
th =3D &quot;serial0:115200n8&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};[snip]<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-s=
tm32/0002-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-d=
isco/patches/afboot-stm32/0002-kernel-start-address.patch<br>
<br>
=C2=A0Where is 0001?<br>
<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..614effa85b<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/00=
02-kernel-start-address.patch<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c<br>
<br>
=C2=A0Patches should preferably be produced by &quot;git format-patch -N&qu=
ot; from a git clone<br>
of the upstream afboot-stm32 repository. Concretely, they should have:<br>
<br>
- a subject line<br>
- a good commit message (describing why the patch is needed, also upstream<=
br>
status if relevant)<br>
- your Signed-off-by<br>
<br>
Basically, just like a patch submitted to buildroot.<br>
<br>
&gt; +index 2da1f4b65f..96e4dff65e 100644<br>
&gt; +--- a/stm32f469i-disco.c<br>
&gt; ++++ b/stm32f469i-disco.c<br>
&gt; +@@ -6,6 +6,7 @@<br>
&gt; + #include &quot;gpio.h&quot;<br>
&gt; + #include &quot;mpu.h&quot;<br>
&gt; + <br>
&gt; ++#define KERNEL_ADDR=C2=A0 =C2=A0 =C2=A00x08010000<br>
&gt; + #define CONFIG_HSE_HZ=C2=A0 =C2=A0 =C2=A0 =C2=A08000000<br>
&gt; + #define CONFIG_PLL_M=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
&gt; + #define CONFIG_PLL_N=C2=A0 =C2=A0 =C2=A0 =C2=A0 360<br>
&gt; +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)<br>
&gt; + <br>
&gt; + void start_kernel(void)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 void (*kernel)(uint32_t reserved, uint32_t mach, uint3=
2_t dt) =3D (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);<br>
&gt; ++=C2=A0 =C2=A0 void (*kernel)(uint32_t reserved, uint32_t mach, uint3=
2_t dt) =3D (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0kernel(0, ~0UL, 0x08004000);<br>
&gt; + }<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-s=
tm32/0003-no-mpu.patch b/board/stmicroelectronics/stm32f469-disco/patches/a=
fboot-stm32/0003-no-mpu.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bc66d2d0ef<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/00=
03-no-mpu.patch<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c<br>
&gt; +index d4d0909831..03f823f288 100644<br>
&gt; +--- a/stm32f469i-disco.c<br>
&gt; ++++ b/stm32f469i-disco.c<br>
&gt; +@@ -127,7 +127,7 @@ int main(void)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 mpu_config(0x0);<br>
&gt; ++=C2=A0 =C2=A0 mpu_config(0xc0000000); <br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (*FLASH_CR &amp; FLASH_CR_LOCK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*FLASH_KEYR =3D 0x456=
70123;<br>
&gt; +@@ -229,7 +229,7 @@ int main(void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usart_setup(usart_base, 45000000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usart_putch(usart_base, &#39;.&#39;);<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 *SYSCFG_MEMRMP =3D 0x4;<br>
&gt; ++=C2=A0 =C2=A0 /* *SYSCFG_MEMRMP =3D 0x4; */<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0start_kernel();<br>
&gt; + <br>
&gt; diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469=
_disco_xip_defconfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..81bdb0d6d6<br>
&gt; --- /dev/null<br>
&gt; +++ b/configs/stm32f469_disco_xip_defconfig<br>
=C2=A0The readme.txt should be updated to describe this new defconfig and t=
he<br>
differences between them, so people know which one to choose for their use =
case.<br>
<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +BR2_arm=3Dy<br>
&gt; +BR2_cortex_m4=3Dy<br>
&gt; +BR2_GLOBAL_PATCH_DIR=3D&quot;board/stmicroelectronics/stm32f469-disco=
/patches&quot;<br>
&gt; +BR2_KERNEL_HEADERS_5_13=3Dy<br>
<br>
=C2=A0Please keep the default SAME_AS_KERNEL, and instead set<br>
<br>
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=3Dy<br>
<br>
=C2=A0Also, it would be nice to bump stm32f469_disco_defconfig to use the s=
ame kernel<br>
version.<br>
<br>
&gt; +# BR2_UCLIBC_INSTALL_UTILS is not set<br>
&gt; +BR2_GCC_VERSION_11_X=3Dy<br>
<br>
=C2=A0Is GCC11 really needed? We normally want to keep the default GCC vers=
ion in the<br>
defconfigs, so they follow updates of GCC.<br>
<br>
=C2=A0If it si really needed, please document it in the commit message.<br>
<br>
&gt; +BR2_GCC_ENABLE_LTO=3Dy<br>
<br>
=C2=A0I guess this really is needed - so please explain that in the commit =
message.<br>
<br>
&gt; +BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/stmicroelectronics/common/=
stm32f4xx/stm32-post-build.sh&quot;<br>
&gt; +BR2_LINUX_KERNEL=3Dy<br>
<br>
=C2=A0Even though 5.13 is the default now, it&#39;s not going to stay that =
way. So you<br>
need to set BR2_LINUX_KERNEL_CUSTOM_VERSION instead.<br>
<br>
&gt; +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/stmicroelectronics/=
stm32f469-disco/linux/defconfig&quot;<br>
&gt; +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy<br>
&gt; +BR2_LINUX_KERNEL_XZ=3Dy<br>
&gt; +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=3D&quot;xipImage&quot;<br>
&gt; +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt; +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;stm32f469-disco&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D&quot;board/stmicroelectronics/stm=
32f469-disco/linux/stm32f469-disco.dts&quot;<br>
&gt; +BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;package/busybox/busybox-minimal.co=
nfig&quot;<br>
&gt; +BR2_PACKAGE_ZLIB=3Dy<br>
<br>
=C2=A0Why is zlib needed? That seems weird...<br>
<br>
&gt; +BR2_TARGET_ROOTFS_INITRAMFS=3Dy<br>
&gt; +# BR2_TARGET_ROOTFS_TAR is not set<br>
&gt; +BR2_TARGET_AFBOOT_STM32=3Dy<br>
&gt; +BR2_PACKAGE_HOST_OPENOCD=3Dy<br>
&gt; +BR2_PACKAGE_HOST_UTIL_LINUX=3Dy<br>
<br>
=C2=A0I also don&#39;t see where util-linux is used, but I may have missed =
it.<br>
<br>
<br>
=C2=A0I have marked the patch as Changes Requested in patchwork.<br>
<br>
=C2=A0Regards,<br>
=C2=A0Arnout<br>
</blockquote></div></div>
</blockquote></div>

--0000000000007fbd9f05c8409a73--


--===============7150714906424299315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7150714906424299315==--


