Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8E2ECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 11:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0227E60DE5;
	Fri,  9 Sep 2022 11:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0227E60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ROWU3MKU_hzD; Fri,  9 Sep 2022 11:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE0A60F8B;
	Fri,  9 Sep 2022 11:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE0A60F8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E62571BF2F8
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 11:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1B8883ED3
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 11:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B8883ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIrdavHi4aun for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 11:06:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA56583ED1
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA56583ED1
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 11:06:45 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id y136so1345977pfb.3
 for <buildroot@buildroot.org>; Fri, 09 Sep 2022 04:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bb4ukltHA9XeEcb5+Rk4b+UO4qVfybrQN3oji8SEb9Y=;
 b=QlOcAAR8clxT995+fdqaQTGRREml5KIKcfGQ5MhlaaKQhEGr3UWUEHZuXdO4yUK2vj
 pCy3UMh3BFsTPIM/HWLlgReZhNDkL5wd3ado3UmQ+G//bXxJ0v9ujPndESjCZ1hgA4hd
 j5CN/o67bp5YylHQrKIXne0H+7f/rUm8TBBd9FMqsFSn0JFMsK0hA0gNcDW1o4att8xX
 kwPrJHyklx4sHR+7N023jDQ8TRgmuBzjqWE7yvwlZNRTYeqOXsSvX4Ij+I/cEWRJGxLA
 v4ml+mIpxezw4ryWboLlLmwOwM2yvZ36oL4nqXqtn9JaFEFy0zQ5pLMWAXHVZ67YodQt
 lX3w==
X-Gm-Message-State: ACgBeo1+v3hlRaxfEEUkDmQxjOVTe7ioeRUZevN3oOBbzVtYabAiwT7z
 te3D5aHW7Ws1fawI7WNLcReEmPTcZlii80LvUF+Z4AmHOEhHfOP+
X-Google-Smtp-Source: AA6agR5YvnebQmRp3Lfl/I5gV3e5kU8BYIBeLSo5E5s8MWJpZtCIaAfwP71RMBjz/rj2B2rR8/w26SJvF6KE92nzWVA=
X-Received: by 2002:a05:6a00:1a44:b0:528:6af7:ff4a with SMTP id
 h4-20020a056a001a4400b005286af7ff4amr13886436pfv.78.1662721604303; Fri, 09
 Sep 2022 04:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220908191904.823806-1-dario.binacchi@amarulasolutions.com>
 <20220908191904.823806-3-dario.binacchi@amarulasolutions.com>
 <CAEyMn7Ygd-s7G8pbszseE8PKK=Zak_TZh1auv6be9LrQqKm=rA@mail.gmail.com>
 <CABGWkvqv-GPsTGQ69XvfiXa4Z2hBVAnxttXUx6btJH0T7P1XpQ@mail.gmail.com>
In-Reply-To: <CABGWkvqv-GPsTGQ69XvfiXa4Z2hBVAnxttXUx6btJH0T7P1XpQ@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 9 Sep 2022 13:06:31 +0200
Message-ID: <CAEyMn7YR1LviPTLf5PSZ6v6U-vUL=xM6ZOFAv8qbPvM3D6kJuw@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=bb4ukltHA9XeEcb5+Rk4b+UO4qVfybrQN3oji8SEb9Y=;
 b=REqXvZXFbARh9iyEaeZXnevDPZYDnjKA9RtGQ1Psw2sUl66QkuQ9/7Si5isGxA6dL0
 OmSrp4YyrY171pU1ZUn/7XgKlKOEnQEljTJ6zEXIJdlQzM4BW97FquR9suwxyTg+ZSNv
 PGyiu39arZGzZGjHQmTlQc6tLlFYiO8zUOl+ov/7yMdbyjEhDtKppFkL+QgC7X5ylmC3
 6gk+fs6g8sP3zI14OCS/4NmKzWdlDHDwOQcx4U2fLOn43o9KE4+hl8CCTYnXe8M+yCz+
 4TAydz5BzKsqxrPktPanv5OjXZAROLZDtTBWbv+HydTt5KPZItEEhmMRPM+If0KbW8cT
 YSyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=REqXvZXF
Subject: Re: [Buildroot] [PATCH v5 2/2]
 configs/imx8mn_bsh_smm_s2_pro_defconfig: new defconfig
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 giulio.benetti@benettiengineering.com,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Am Fr., 9. Sept. 2022 um 11:59 Uhr schrieb Dario Binacchi
<dario.binacchi@amarulasolutions.com>:
>
> Hi Heiko,
>
> On Fri, Sep 9, 2022 at 11:36 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > Hi Dario,
> >
> > Am Do., 8. Sept. 2022 um 21:20 Uhr schrieb Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>:
> > >
> > > From: Michael Trimarchi <michael@amarulasolutions.com>
> > >
> > > BSH SMM S2 PRO (SystemMaster S2 Pro) Board is an add-on board which
> > > provide input and output interfaces to a dedicated carrier board. It is
> > > designed mainly to provide graphical/video and connectivity interfaces
> > > to the appliance.
> > >
> > > Board support package includes the following components:
> > > - mainline Linux kernel 5.19.7
> > > - mainline U-Boot 2022-07
> > > - Default packages from buildroot
> > >
> > > https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> > >
> > > Add Ariel D'Alessandro and Dario Binacchi as co-maintainer, we work
> > > together on platform mainline
> > >
> > > Build and tested using:
> > > docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
> > >
> > > Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > Cc: Heiko Thiery <heiko.thiery@gmail.com>
> > > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > ---
> > > Changes in v5:
> > > - Update the commit description.
> > > - Bump the kernel version to 5.19.7.
> > >
> > > Changes in v4:
> > > - Update the commit description.
> > > - Bump the kernel version to 5.18.19.
> > >
> > > Changes in v3:
> > > - Update the commit description.
> > > - Bump U-Boot to version 2022-07.
> > >
> > > Changes in v2:
> > > - Change commit subject line.
> > > - Use the buildroot's output directory if the binaries directory is
> > >   not passed as a parameter to the `flash.sh' script.
> > > - Replace the linux.config file with an architectural defconfig and
> > >   a config fragment for the changes.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > ---
> > >  DEVELOPERS                                    |  4 +
> > >  .../imx8mn-bsh-smm-s2/linux.fragment          |  0
> > >  board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |  4 +
> > >  board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      | 23 ++++++
> > >  board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  | 17 +++++
> > >  board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |  7 ++
> > >  board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |  3 +
> > >  board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    | 73 +++++++++++++++++++
> > >  configs/imx8mn_bsh_smm_s2_defconfig           |  2 +-
> > >  configs/imx8mn_bsh_smm_s2_pro_defconfig       | 41 +++++++++++
> > >  10 files changed, 173 insertions(+), 1 deletion(-)
> > >  rename board/bsh/{ => common}/imx8mn-bsh-smm-s2/linux.fragment (100%)
> > >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
> > >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
> > >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
> > >  create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defconfig
> > >
> > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > index d63cb22cce1d..cb2c10d322fb 100644
> > > --- a/DEVELOPERS
> > > +++ b/DEVELOPERS
> > > @@ -216,6 +216,8 @@ F:  configs/snps_archs38_haps_defconfig
> > >  F:     configs/snps_archs38_hsdk_defconfig
> > >
> > >  N:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> > > +F:     board/bsh/
> > > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> > >  F:     package/axfsutils/
> > >  F:     package/mali-t76x/
> > >
> > > @@ -675,6 +677,7 @@ F:  package/xinetd/
> > >  N:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > >  F:     board/bsh/
> > >  F:     configs/imx8mn_bsh_smm_s2_defconfig
> > > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> > >  F:     package/uuu/
> > >
> > >  N:     Dario Binacchi <dariobin@libero.it>
> > > @@ -2108,6 +2111,7 @@ F:        package/python-pyzmq/
> > >  N:     Michael Trimarchi <michael@amarulasolutions.com>
> > >  F:     board/bsh/
> > >  F:     configs/imx8mn_bsh_smm_s2_defconfig
> > > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> > >  F:     package/python-spidev/
> > >
> > >  N:     Michael Vetter <jubalh@iodoru.org>
> > > diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment b/board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> > > similarity index 100%
> > > rename from board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> > > rename to board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> > > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > > new file mode 100644
> > > index 000000000000..911135474253
> > > --- /dev/null
> > > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > > @@ -0,0 +1,4 @@
> > > +label buildroot
> > > +  kernel /boot/Image
> > > +  devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb
> > > +  append root=PARTUUID=%PARTUUID% rootwait rw
> > > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > > new file mode 100755
> > > index 000000000000..17b20f009771
> > > --- /dev/null
> > > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > > @@ -0,0 +1,23 @@
> > > +#!/bin/bash
> > > +
> > > +if [ $# -eq 0 ]; then
> > > +    OUTPUT_DIR=output
> > > +else
> > > +    OUTPUT_DIR=$1
> > > +fi
> > > +
> > > +if ! test -d "${OUTPUT_DIR}" ; then
> > > +    echo "ERROR: no output directory specified."
> > > +    echo "Usage: $0 OUTPUT_DIR"
> > > +    echo ""
> > > +    echo "Arguments:"
> > > +    echo "    OUTPUT_DIR    The Buildroot output directory."
> > > +    exit 1
> > > +fi
> > > +
> > > +IMAGES_DIR=${OUTPUT_DIR}/images
> > > +
> > > +${OUTPUT_DIR}/host/bin/uuu -v -b emmc_all \
> > > +  ${IMAGES_DIR}/flash.bin \
> > > +  ${IMAGES_DIR}/sdcard.img
> > > +
> > > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > > new file mode 100644
> > > index 000000000000..bc100b171dd6
> > > --- /dev/null
> > > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > > @@ -0,0 +1,17 @@
> > > +image sdcard.img {
> > > +       hdimage {
> > > +               partition-table-type = "gpt"
> > > +       }
> > > +
> > > +       partition imx-boot {
> > > +               in-partition-table = "no"
> > > +               image = "flash.bin"
> > > +               offset = 33K
> >
> > I was just wondering that the offset here is 33k. I had remembered
> > that for imx8mn boards the offset is 32k. Or am I wrong? Are you sure
> > that you start the bootloader from an SD card and not from eMMC?
>
> The board boots from eMMC. The board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> calls the uuu application with the "emmc_all" option.

Ah ok. I'm not familiar with the uuu tool. Nevertheless, the offset in
the genimage config looks wrong to me. If you want to install the
created image without the uuu tool it will probably not work, because
the imx8mn processor expects the bootloader (flash.bin) image at
offset 32k.

> Thanks and regards,
> Dario
>
> >
> > [SNIP]
> >
> > --
> > Heiko
>
>
>
> --
>
> Dario Binacchi
>
> Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
