Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E3FECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 09:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA3E41A0E;
	Fri,  9 Sep 2022 09:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEA3E41A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUxlhr4ICy9c; Fri,  9 Sep 2022 09:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5260541A0B;
	Fri,  9 Sep 2022 09:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5260541A0B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7E801BF20B
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3D4C40CD8
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D4C40CD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTSG2L22tqdO for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 09:59:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB36840CF8
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB36840CF8
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 09:59:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u18so1799107lfo.8
 for <buildroot@buildroot.org>; Fri, 09 Sep 2022 02:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=m81nQefpCg4kP9cTE/X5AZFp66kAR2kt2lF57vBdzAE=;
 b=33XEi4I2G+eCi18EQu1su/6GgQH77LwqQuLZFRew0gWfozwSvQUWJV6c7G6kT3WnS1
 ePWoi4/FlqLTbfD0AXAYc5dyTbRGqj5chcsOPq7QuO5udSThY0xs42eu/9Fm4MEqxZ/p
 kontQDkmZsgUs/vfbAghH3de1edi4o7r5I76v5eL/iXRYHlbYtOh1h1U+BM91BLXbGpi
 jPucft/intsmhmPm7E1xmibnXw2x/PUkWJQutb6VNuDIWtumOZkKO64p2hJXcK5Dbsnu
 SDy+HFqkiON/DT/BLXnR9snneqceafQX4aqVxwH2IknfHUSwasHHFeQ4wdwOVFGFGCKH
 Y8kQ==
X-Gm-Message-State: ACgBeo3zF+kUexWPATv7nc+R6RPq24PD8tOiHdFR1FuceBXKVEhK0Twj
 DaKvFbvQ/OudGD/bFSCODkIo33U8ReSovoMavCVC4pQYIVibiQ==
X-Google-Smtp-Source: AA6agR4ORGd2YN9pcIlHPpzopwK4kcI+189+bajnQjkLxGN7Mhn2pjRCXB7SoMAbOrXuN6q1ayhwN63wilerLepWQwg=
X-Received: by 2002:ac2:46f9:0:b0:498:f633:8136 with SMTP id
 q25-20020ac246f9000000b00498f6338136mr1287799lfo.117.1662717577138; Fri, 09
 Sep 2022 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220908191904.823806-1-dario.binacchi@amarulasolutions.com>
 <20220908191904.823806-3-dario.binacchi@amarulasolutions.com>
 <CAEyMn7Ygd-s7G8pbszseE8PKK=Zak_TZh1auv6be9LrQqKm=rA@mail.gmail.com>
In-Reply-To: <CAEyMn7Ygd-s7G8pbszseE8PKK=Zak_TZh1auv6be9LrQqKm=rA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 Sep 2022 11:59:26 +0200
Message-ID: <CABGWkvqv-GPsTGQ69XvfiXa4Z2hBVAnxttXUx6btJH0T7P1XpQ@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=m81nQefpCg4kP9cTE/X5AZFp66kAR2kt2lF57vBdzAE=;
 b=qa5teRHnfwYtKARhKyPyh4RcKj6IvqCcSbjjdG9DSOEqafTUep1fYnW5KMIM564am/
 k+E1juIhtyUrAror4F2siYQLSQmZqBR6cjkH+M2V1l6L0LJIFyonWa0g42FK9dF51Us4
 nfLFg1ARuL6BAStsCJiilJPNJVYHpBGUfTbuI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qa5teRHn
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

Hi Heiko,

On Fri, Sep 9, 2022 at 11:36 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Hi Dario,
>
> Am Do., 8. Sept. 2022 um 21:20 Uhr schrieb Dario Binacchi
> <dario.binacchi@amarulasolutions.com>:
> >
> > From: Michael Trimarchi <michael@amarulasolutions.com>
> >
> > BSH SMM S2 PRO (SystemMaster S2 Pro) Board is an add-on board which
> > provide input and output interfaces to a dedicated carrier board. It is
> > designed mainly to provide graphical/video and connectivity interfaces
> > to the appliance.
> >
> > Board support package includes the following components:
> > - mainline Linux kernel 5.19.7
> > - mainline U-Boot 2022-07
> > - Default packages from buildroot
> >
> > https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> >
> > Add Ariel D'Alessandro and Dario Binacchi as co-maintainer, we work
> > together on platform mainline
> >
> > Build and tested using:
> > docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
> >
> > Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > Cc: Heiko Thiery <heiko.thiery@gmail.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> > Changes in v5:
> > - Update the commit description.
> > - Bump the kernel version to 5.19.7.
> >
> > Changes in v4:
> > - Update the commit description.
> > - Bump the kernel version to 5.18.19.
> >
> > Changes in v3:
> > - Update the commit description.
> > - Bump U-Boot to version 2022-07.
> >
> > Changes in v2:
> > - Change commit subject line.
> > - Use the buildroot's output directory if the binaries directory is
> >   not passed as a parameter to the `flash.sh' script.
> > - Replace the linux.config file with an architectural defconfig and
> >   a config fragment for the changes.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >  DEVELOPERS                                    |  4 +
> >  .../imx8mn-bsh-smm-s2/linux.fragment          |  0
> >  board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |  4 +
> >  board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      | 23 ++++++
> >  board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  | 17 +++++
> >  board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |  7 ++
> >  board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |  3 +
> >  board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    | 73 +++++++++++++++++++
> >  configs/imx8mn_bsh_smm_s2_defconfig           |  2 +-
> >  configs/imx8mn_bsh_smm_s2_pro_defconfig       | 41 +++++++++++
> >  10 files changed, 173 insertions(+), 1 deletion(-)
> >  rename board/bsh/{ => common}/imx8mn-bsh-smm-s2/linux.fragment (100%)
> >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
> >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
> >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
> >  create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defconfig
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index d63cb22cce1d..cb2c10d322fb 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -216,6 +216,8 @@ F:  configs/snps_archs38_haps_defconfig
> >  F:     configs/snps_archs38_hsdk_defconfig
> >
> >  N:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> > +F:     board/bsh/
> > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> >  F:     package/axfsutils/
> >  F:     package/mali-t76x/
> >
> > @@ -675,6 +677,7 @@ F:  package/xinetd/
> >  N:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >  F:     board/bsh/
> >  F:     configs/imx8mn_bsh_smm_s2_defconfig
> > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> >  F:     package/uuu/
> >
> >  N:     Dario Binacchi <dariobin@libero.it>
> > @@ -2108,6 +2111,7 @@ F:        package/python-pyzmq/
> >  N:     Michael Trimarchi <michael@amarulasolutions.com>
> >  F:     board/bsh/
> >  F:     configs/imx8mn_bsh_smm_s2_defconfig
> > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> >  F:     package/python-spidev/
> >
> >  N:     Michael Vetter <jubalh@iodoru.org>
> > diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment b/board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> > similarity index 100%
> > rename from board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> > rename to board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > new file mode 100644
> > index 000000000000..911135474253
> > --- /dev/null
> > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > @@ -0,0 +1,4 @@
> > +label buildroot
> > +  kernel /boot/Image
> > +  devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb
> > +  append root=PARTUUID=%PARTUUID% rootwait rw
> > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > new file mode 100755
> > index 000000000000..17b20f009771
> > --- /dev/null
> > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > @@ -0,0 +1,23 @@
> > +#!/bin/bash
> > +
> > +if [ $# -eq 0 ]; then
> > +    OUTPUT_DIR=output
> > +else
> > +    OUTPUT_DIR=$1
> > +fi
> > +
> > +if ! test -d "${OUTPUT_DIR}" ; then
> > +    echo "ERROR: no output directory specified."
> > +    echo "Usage: $0 OUTPUT_DIR"
> > +    echo ""
> > +    echo "Arguments:"
> > +    echo "    OUTPUT_DIR    The Buildroot output directory."
> > +    exit 1
> > +fi
> > +
> > +IMAGES_DIR=${OUTPUT_DIR}/images
> > +
> > +${OUTPUT_DIR}/host/bin/uuu -v -b emmc_all \
> > +  ${IMAGES_DIR}/flash.bin \
> > +  ${IMAGES_DIR}/sdcard.img
> > +
> > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > new file mode 100644
> > index 000000000000..bc100b171dd6
> > --- /dev/null
> > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > @@ -0,0 +1,17 @@
> > +image sdcard.img {
> > +       hdimage {
> > +               partition-table-type = "gpt"
> > +       }
> > +
> > +       partition imx-boot {
> > +               in-partition-table = "no"
> > +               image = "flash.bin"
> > +               offset = 33K
>
> I was just wondering that the offset here is 33k. I had remembered
> that for imx8mn boards the offset is 32k. Or am I wrong? Are you sure
> that you start the bootloader from an SD card and not from eMMC?

The board boots from eMMC. The board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
calls the uuu application with the "emmc_all" option.

Thanks and regards,
Dario

>
> [SNIP]
>
> --
> Heiko



-- 

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
