Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FE9ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 11:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C4D61025;
	Fri,  9 Sep 2022 11:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61C4D61025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snElJvqcgvNL; Fri,  9 Sep 2022 11:29:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF8E60DE5;
	Fri,  9 Sep 2022 11:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF8E60DE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF7911BF855
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 11:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A9CD40462
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 11:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9CD40462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEHshWJrxuD7 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 11:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18CED4026A
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18CED4026A
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 11:29:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id fy31so3265779ejc.6
 for <buildroot@buildroot.org>; Fri, 09 Sep 2022 04:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zvtfI/X9yHmpzocZu/C+cequB9IJvIAkcrLvunl4+/Y=;
 b=omlo9RBWGRW9VJiyn7ibtjaMxglbGsyWiXy2VCLV1CwNp0X056XqwMC0Jl5h3EgwkH
 8buGwaZdj7GmXe2zosQLKQDmrdTTcqesnCt4T0tugrt97AsF3CFFYIuUb4ykdOaN3Q4U
 7RdFGbM7w8mfe8nKx4tade8rVbjQ6pXYpG+fwH0FCNuro71XvbJ3p9Me3CTcKt+P7UMf
 gj3hZ4btSbsPQvGsK9tpgvQRIditzi/1pNpQ0u7qSuaCmjVxP8rT3J789KWVINq7twwZ
 txhwbgfXujwjHnfKHPQBYtUBtnUKi1Es0oz2gwww3iW6CTs2V6Y1fVkP634FzNi4Blhc
 Qujg==
X-Gm-Message-State: ACgBeo1yAYT9/DTMojeZH/5ltE5qy6nuLpC2lhbThAah+ub5rCR5lUWt
 ML/mfwZVc9zKN4uhE/xUk6kh/dbHbYg0PouA8xzGUdeQsR0=
X-Google-Smtp-Source: AA6agR6ebc8LTexx4z1Cq+w5RHA/djH+yAcpQqXACexHE+GB6lZOUX7V5PeGadzoeiwE9OgHsEw4+JWY1VWUpHu0//s=
X-Received: by 2002:a17:906:5a61:b0:741:78ac:851f with SMTP id
 my33-20020a1709065a6100b0074178ac851fmr9239878ejc.431.1662722977428; Fri, 09
 Sep 2022 04:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220908191904.823806-1-dario.binacchi@amarulasolutions.com>
 <20220908191904.823806-3-dario.binacchi@amarulasolutions.com>
 <CAEyMn7Ygd-s7G8pbszseE8PKK=Zak_TZh1auv6be9LrQqKm=rA@mail.gmail.com>
 <CABGWkvqv-GPsTGQ69XvfiXa4Z2hBVAnxttXUx6btJH0T7P1XpQ@mail.gmail.com>
 <CAEyMn7YR1LviPTLf5PSZ6v6U-vUL=xM6ZOFAv8qbPvM3D6kJuw@mail.gmail.com>
In-Reply-To: <CAEyMn7YR1LviPTLf5PSZ6v6U-vUL=xM6ZOFAv8qbPvM3D6kJuw@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 9 Sep 2022 13:29:24 +0200
Message-ID: <CAOf5uw=r_G2oXOrk+1w78qZu1QXgP8O+shd4X3RgTAP5wq-mJQ@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zvtfI/X9yHmpzocZu/C+cequB9IJvIAkcrLvunl4+/Y=;
 b=ExmSgqEo/33vjs2H1GlEfJoZQT/+lBfrzliz/5brFYviNL0uaqWx3USSDYVakVDUnz
 Rr4ScR7pIqq5uqXfAeerEd46XP+965m3g8yp30Ml94tfm2KS2ywVg0gQq4NiR12QS6U9
 fXLLU14tXZffCtLBnKvemJRIrKSxw+pmQYHKA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ExmSgqEo
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
 Buildroot Mailing List <buildroot@buildroot.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: multipart/mixed; boundary="===============4603671458317324811=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4603671458317324811==
Content-Type: multipart/alternative; boundary="0000000000006e150605e83cdc37"

--0000000000006e150605e83cdc37
Content-Type: text/plain; charset="UTF-8"

Hi

Il ven 9 set 2022, 13:06 Heiko Thiery <heiko.thiery@gmail.com> ha scritto:

> Hi Dario,
>
> Am Fr., 9. Sept. 2022 um 11:59 Uhr schrieb Dario Binacchi
> <dario.binacchi@amarulasolutions.com>:
> >
> > Hi Heiko,
> >
> > On Fri, Sep 9, 2022 at 11:36 AM Heiko Thiery <heiko.thiery@gmail.com>
> wrote:
> > >
> > > Hi Dario,
> > >
> > > Am Do., 8. Sept. 2022 um 21:20 Uhr schrieb Dario Binacchi
> > > <dario.binacchi@amarulasolutions.com>:
> > > >
> > > > From: Michael Trimarchi <michael@amarulasolutions.com>
> > > >
> > > > BSH SMM S2 PRO (SystemMaster S2 Pro) Board is an add-on board which
> > > > provide input and output interfaces to a dedicated carrier board. It
> is
> > > > designed mainly to provide graphical/video and connectivity
> interfaces
> > > > to the appliance.
> > > >
> > > > Board support package includes the following components:
> > > > - mainline Linux kernel 5.19.7
> > > > - mainline U-Boot 2022-07
> > > > - Default packages from buildroot
> > > >
> > > >
> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> > > >
> > > > Add Ariel D'Alessandro and Dario Binacchi as co-maintainer, we work
> > > > together on platform mainline
> > > >
> > > > Build and tested using:
> > > > docker pull
> registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
> > > >
> > > > Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > > Cc: Heiko Thiery <heiko.thiery@gmail.com>
> > > > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > > > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > > Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > > ---
> > > > Changes in v5:
> > > > - Update the commit description.
> > > > - Bump the kernel version to 5.19.7.
> > > >
> > > > Changes in v4:
> > > > - Update the commit description.
> > > > - Bump the kernel version to 5.18.19.
> > > >
> > > > Changes in v3:
> > > > - Update the commit description.
> > > > - Bump U-Boot to version 2022-07.
> > > >
> > > > Changes in v2:
> > > > - Change commit subject line.
> > > > - Use the buildroot's output directory if the binaries directory is
> > > >   not passed as a parameter to the `flash.sh' script.
> > > > - Replace the linux.config file with an architectural defconfig and
> > > >   a config fragment for the changes.
> > > >
> > > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > > ---
> > > >  DEVELOPERS                                    |  4 +
> > > >  .../imx8mn-bsh-smm-s2/linux.fragment          |  0
> > > >  board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |  4 +
> > > >  board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      | 23 ++++++
> > > >  board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  | 17 +++++
> > > >  board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |  7 ++
> > > >  board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |  3 +
> > > >  board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    | 73
> +++++++++++++++++++
> > > >  configs/imx8mn_bsh_smm_s2_defconfig           |  2 +-
> > > >  configs/imx8mn_bsh_smm_s2_pro_defconfig       | 41 +++++++++++
> > > >  10 files changed, 173 insertions(+), 1 deletion(-)
> > > >  rename board/bsh/{ => common}/imx8mn-bsh-smm-s2/linux.fragment
> (100%)
> > > >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > > >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > > >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > > >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
> > > >  create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
> > > >  create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
> > > >  create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defconfig
> > > >
> > > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > > index d63cb22cce1d..cb2c10d322fb 100644
> > > > --- a/DEVELOPERS
> > > > +++ b/DEVELOPERS
> > > > @@ -216,6 +216,8 @@ F:  configs/snps_archs38_haps_defconfig
> > > >  F:     configs/snps_archs38_hsdk_defconfig
> > > >
> > > >  N:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> > > > +F:     board/bsh/
> > > > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> > > >  F:     package/axfsutils/
> > > >  F:     package/mali-t76x/
> > > >
> > > > @@ -675,6 +677,7 @@ F:  package/xinetd/
> > > >  N:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > >  F:     board/bsh/
> > > >  F:     configs/imx8mn_bsh_smm_s2_defconfig
> > > > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> > > >  F:     package/uuu/
> > > >
> > > >  N:     Dario Binacchi <dariobin@libero.it>
> > > > @@ -2108,6 +2111,7 @@ F:        package/python-pyzmq/
> > > >  N:     Michael Trimarchi <michael@amarulasolutions.com>
> > > >  F:     board/bsh/
> > > >  F:     configs/imx8mn_bsh_smm_s2_defconfig
> > > > +F:     configs/imx8mn_bsh_smm_s2_pro_defconfig
> > > >  F:     package/python-spidev/
> > > >
> > > >  N:     Michael Vetter <jubalh@iodoru.org>
> > > > diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> b/board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> > > > similarity index 100%
> > > > rename from board/bsh/imx8mn-bsh-smm-s2/linux.fragment
> > > > rename to board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
> > > > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > > > new file mode 100644
> > > > index 000000000000..911135474253
> > > > --- /dev/null
> > > > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
> > > > @@ -0,0 +1,4 @@
> > > > +label buildroot
> > > > +  kernel /boot/Image
> > > > +  devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb
> > > > +  append root=PARTUUID=%PARTUUID% rootwait rw
> > > > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > > > new file mode 100755
> > > > index 000000000000..17b20f009771
> > > > --- /dev/null
> > > > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > > > @@ -0,0 +1,23 @@
> > > > +#!/bin/bash
> > > > +
> > > > +if [ $# -eq 0 ]; then
> > > > +    OUTPUT_DIR=output
> > > > +else
> > > > +    OUTPUT_DIR=$1
> > > > +fi
> > > > +
> > > > +if ! test -d "${OUTPUT_DIR}" ; then
> > > > +    echo "ERROR: no output directory specified."
> > > > +    echo "Usage: $0 OUTPUT_DIR"
> > > > +    echo ""
> > > > +    echo "Arguments:"
> > > > +    echo "    OUTPUT_DIR    The Buildroot output directory."
> > > > +    exit 1
> > > > +fi
> > > > +
> > > > +IMAGES_DIR=${OUTPUT_DIR}/images
> > > > +
> > > > +${OUTPUT_DIR}/host/bin/uuu -v -b emmc_all \
> > > > +  ${IMAGES_DIR}/flash.bin \
> > > > +  ${IMAGES_DIR}/sdcard.img
> > > > +
> > > > diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > > > new file mode 100644
> > > > index 000000000000..bc100b171dd6
> > > > --- /dev/null
> > > > +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
> > > > @@ -0,0 +1,17 @@
> > > > +image sdcard.img {
> > > > +       hdimage {
> > > > +               partition-table-type = "gpt"
> > > > +       }
> > > > +
> > > > +       partition imx-boot {
> > > > +               in-partition-table = "no"
> > > > +               image = "flash.bin"
> > > > +               offset = 33K
> > >
> > > I was just wondering that the offset here is 33k. I had remembered
> > > that for imx8mn boards the offset is 32k. Or am I wrong? Are you sure
> > > that you start the bootloader from an SD card and not from eMMC?
> >
> > The board boots from eMMC. The board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
> > calls the uuu application with the "emmc_all" option.
>
> Ah ok. I'm not familiar with the uuu tool. Nevertheless, the offset in
> the genimage config looks wrong to me. If you want to install the
> created image without the uuu tool it will probably not work, because
> the imx8mn processor expects the bootloader (flash.bin) image at
> offset 32k.
>

He is right

Michael


> > Thanks and regards,
> > Dario
> >
> > >
> > > [SNIP]
> > >
> > > --
> > > Heiko
> >
> >
> >
> > --
> >
> > Dario Binacchi
> >
> > Embedded Linux Developer
> >
> > dario.binacchi@amarulasolutions.com
> >
> > __________________________________
> >
> >
> > Amarula Solutions SRL
> >
> > Via Le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 042 243 5310
> > info@amarulasolutions.com
> >
> > www.amarulasolutions.com
>

--0000000000006e150605e83cdc37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Il ven 9 set 2022, 13:06 Heiko Thiery &lt;<a href=3D=
"mailto:heiko.thiery@gmail.com">heiko.thiery@gmail.com</a>&gt; ha scritto:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Dario,<br>
<br>
Am Fr., 9. Sept. 2022 um 11:59 Uhr schrieb Dario Binacchi<br>
&lt;<a href=3D"mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank=
" rel=3D"noreferrer">dario.binacchi@amarulasolutions.com</a>&gt;:<br>
&gt;<br>
&gt; Hi Heiko,<br>
&gt;<br>
&gt; On Fri, Sep 9, 2022 at 11:36 AM Heiko Thiery &lt;<a href=3D"mailto:hei=
ko.thiery@gmail.com" target=3D"_blank" rel=3D"noreferrer">heiko.thiery@gmai=
l.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Dario,<br>
&gt; &gt;<br>
&gt; &gt; Am Do., 8. Sept. 2022 um 21:20 Uhr schrieb Dario Binacchi<br>
&gt; &gt; &lt;<a href=3D"mailto:dario.binacchi@amarulasolutions.com" target=
=3D"_blank" rel=3D"noreferrer">dario.binacchi@amarulasolutions.com</a>&gt;:=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarul=
asolutions.com" target=3D"_blank" rel=3D"noreferrer">michael@amarulasolutio=
ns.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; BSH SMM S2 PRO (SystemMaster S2 Pro) Board is an add-on boar=
d which<br>
&gt; &gt; &gt; provide input and output interfaces to a dedicated carrier b=
oard. It is<br>
&gt; &gt; &gt; designed mainly to provide graphical/video and connectivity =
interfaces<br>
&gt; &gt; &gt; to the appliance.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Board support package includes the following components:<br>
&gt; &gt; &gt; - mainline Linux kernel 5.19.7<br>
&gt; &gt; &gt; - mainline U-Boot 2022-07<br>
&gt; &gt; &gt; - Default packages from buildroot<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://www.apertis.org/reference_hardware/imx8mn=
_bsh_smm_s2pro_setup/" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Add Ariel D&#39;Alessandro and Dario Binacchi as co-maintain=
er, we work<br>
&gt; &gt; &gt; together on platform mainline<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Build and tested using:<br>
&gt; &gt; &gt; docker pull <a href=3D"http://registry.gitlab.com/buildroot.=
org/buildroot/base:20220105.2314" rel=3D"noreferrer noreferrer" target=3D"_=
blank">registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314</a><b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cc: Ariel D&#39;Alessandro &lt;<a href=3D"mailto:ariel.dales=
sandro@collabora.com" target=3D"_blank" rel=3D"noreferrer">ariel.dalessandr=
o@collabora.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions.=
com" target=3D"_blank" rel=3D"noreferrer">jagan@amarulasolutions.com</a>&gt=
;<br>
&gt; &gt; &gt; Cc: Heiko Thiery &lt;<a href=3D"mailto:heiko.thiery@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">heiko.thiery@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@bene=
ttiengineering.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@ben=
ettiengineering.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.ben=
etti@benettiengineering.com" target=3D"_blank" rel=3D"noreferrer">giulio.be=
netti@benettiengineering.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Michael Trimarchi &lt;<a href=3D"mailto:micha=
el@amarulasolutions.com" target=3D"_blank" rel=3D"noreferrer">michael@amaru=
lasolutions.com</a>&gt;<br>
&gt; &gt; &gt; Tested-by: Ariel D&#39;Alessandro &lt;<a href=3D"mailto:arie=
l.dalessandro@collabora.com" target=3D"_blank" rel=3D"noreferrer">ariel.dal=
essandro@collabora.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.bi=
nacchi@amarulasolutions.com" target=3D"_blank" rel=3D"noreferrer">dario.bin=
acchi@amarulasolutions.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; Changes in v5:<br>
&gt; &gt; &gt; - Update the commit description.<br>
&gt; &gt; &gt; - Bump the kernel version to 5.19.7.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Changes in v4:<br>
&gt; &gt; &gt; - Update the commit description.<br>
&gt; &gt; &gt; - Bump the kernel version to 5.18.19.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Changes in v3:<br>
&gt; &gt; &gt; - Update the commit description.<br>
&gt; &gt; &gt; - Bump U-Boot to version 2022-07.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Changes in v2:<br>
&gt; &gt; &gt; - Change commit subject line.<br>
&gt; &gt; &gt; - Use the buildroot&#39;s output directory if the binaries d=
irectory is<br>
&gt; &gt; &gt;=C2=A0 =C2=A0not passed as a parameter to the `flash.sh&#39; =
script.<br>
&gt; &gt; &gt; - Replace the linux.config file with an architectural defcon=
fig and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0a config fragment for the changes.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.bi=
nacchi@amarulasolutions.com" target=3D"_blank" rel=3D"noreferrer">dario.bin=
acchi@amarulasolutions.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 +<br>
&gt; &gt; &gt;=C2=A0 .../imx8mn-bsh-smm-s2/linux.fragment=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt; &gt; &gt;=C2=A0 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |=C2=A0 =
4 +<br>
&gt; &gt; &gt;=C2=A0 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh=C2=A0 =C2=A0 =
=C2=A0 | 23 ++++++<br>
&gt; &gt; &gt;=C2=A0 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg=C2=A0 | 1=
7 +++++<br>
&gt; &gt; &gt;=C2=A0 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |=C2=A0 =
7 ++<br>
&gt; &gt; &gt;=C2=A0 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |=C2=A0 =
3 +<br>
&gt; &gt; &gt;=C2=A0 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt=C2=A0 =C2=
=A0 | 73 +++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 configs/imx8mn_bsh_smm_s2_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; &gt;=C2=A0 configs/imx8mn_bsh_smm_s2_pro_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 41 +++++++++++<br>
&gt; &gt; &gt;=C2=A0 10 files changed, 173 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;=C2=A0 rename board/bsh/{ =3D&gt; common}/imx8mn-bsh-smm-s2/l=
inux.fragment (100%)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/ext=
linux.conf<br>
&gt; &gt; &gt;=C2=A0 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/fla=
sh.sh<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/gen=
image.cfg<br>
&gt; &gt; &gt;=C2=A0 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/pos=
t-build.sh<br>
&gt; &gt; &gt;=C2=A0 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/pos=
t-image.sh<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/rea=
dme.txt<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defco=
nfig<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; &gt; &gt; index d63cb22cce1d..cb2c10d322fb 100644<br>
&gt; &gt; &gt; --- a/DEVELOPERS<br>
&gt; &gt; &gt; +++ b/DEVELOPERS<br>
&gt; &gt; &gt; @@ -216,6 +216,8 @@ F:=C2=A0 configs/snps_archs38_haps_defco=
nfig<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0configs/snps_archs38_hsdk_defcon=
fig<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 N:=C2=A0 =C2=A0 =C2=A0Ariel D&#39;Alessandro &lt;<a hr=
ef=3D"mailto:ariel@vanguardiasur.com.ar" target=3D"_blank" rel=3D"noreferre=
r">ariel@vanguardiasur.com.ar</a>&gt;<br>
&gt; &gt; &gt; +F:=C2=A0 =C2=A0 =C2=A0board/bsh/<br>
&gt; &gt; &gt; +F:=C2=A0 =C2=A0 =C2=A0configs/imx8mn_bsh_smm_s2_pro_defconf=
ig<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0package/axfsutils/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0package/mali-t76x/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -675,6 +677,7 @@ F:=C2=A0 package/xinetd/<br>
&gt; &gt; &gt;=C2=A0 N:=C2=A0 =C2=A0 =C2=A0Dario Binacchi &lt;<a href=3D"ma=
ilto:dario.binacchi@amarulasolutions.com" target=3D"_blank" rel=3D"noreferr=
er">dario.binacchi@amarulasolutions.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0board/bsh/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0configs/imx8mn_bsh_smm_s2_defcon=
fig<br>
&gt; &gt; &gt; +F:=C2=A0 =C2=A0 =C2=A0configs/imx8mn_bsh_smm_s2_pro_defconf=
ig<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0package/uuu/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 N:=C2=A0 =C2=A0 =C2=A0Dario Binacchi &lt;<a href=3D"ma=
ilto:dariobin@libero.it" target=3D"_blank" rel=3D"noreferrer">dariobin@libe=
ro.it</a>&gt;<br>
&gt; &gt; &gt; @@ -2108,6 +2111,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/=
python-pyzmq/<br>
&gt; &gt; &gt;=C2=A0 N:=C2=A0 =C2=A0 =C2=A0Michael Trimarchi &lt;<a href=3D=
"mailto:michael@amarulasolutions.com" target=3D"_blank" rel=3D"noreferrer">=
michael@amarulasolutions.com</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0board/bsh/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0configs/imx8mn_bsh_smm_s2_defcon=
fig<br>
&gt; &gt; &gt; +F:=C2=A0 =C2=A0 =C2=A0configs/imx8mn_bsh_smm_s2_pro_defconf=
ig<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0 =C2=A0package/python-spidev/<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 N:=C2=A0 =C2=A0 =C2=A0Michael Vetter &lt;<a href=3D"ma=
ilto:jubalh@iodoru.org" target=3D"_blank" rel=3D"noreferrer">jubalh@iodoru.=
org</a>&gt;<br>
&gt; &gt; &gt; diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment b/bo=
ard/bsh/common/imx8mn-bsh-smm-s2/linux.fragment<br>
&gt; &gt; &gt; similarity index 100%<br>
&gt; &gt; &gt; rename from board/bsh/imx8mn-bsh-smm-s2/linux.fragment<br>
&gt; &gt; &gt; rename to board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment<=
br>
&gt; &gt; &gt; diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf b=
/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..911135474253<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf<br>
&gt; &gt; &gt; @@ -0,0 +1,4 @@<br>
&gt; &gt; &gt; +label buildroot<br>
&gt; &gt; &gt; +=C2=A0 kernel /boot/Image<br>
&gt; &gt; &gt; +=C2=A0 devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb<=
br>
&gt; &gt; &gt; +=C2=A0 append root=3DPARTUUID=3D%PARTUUID% rootwait rw<br>
&gt; &gt; &gt; diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh b/boar=
d/bsh/imx8mn-bsh-smm-s2-pro/flash.sh<br>
&gt; &gt; &gt; new file mode 100755<br>
&gt; &gt; &gt; index 000000000000..17b20f009771<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh<br>
&gt; &gt; &gt; @@ -0,0 +1,23 @@<br>
&gt; &gt; &gt; +#!/bin/bash<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +if [ $# -eq 0 ]; then<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 OUTPUT_DIR=3Doutput<br>
&gt; &gt; &gt; +else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 OUTPUT_DIR=3D$1<br>
&gt; &gt; &gt; +fi<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +if ! test -d &quot;${OUTPUT_DIR}&quot; ; then<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 echo &quot;ERROR: no output directory specifi=
ed.&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 echo &quot;Usage: $0 OUTPUT_DIR&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 echo &quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 echo &quot;Arguments:&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 OUTPUT_DIR=C2=A0 =C2=
=A0 The Buildroot output directory.&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; &gt; &gt; +fi<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +IMAGES_DIR=3D${OUTPUT_DIR}/images<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +${OUTPUT_DIR}/host/bin/uuu -v -b emmc_all \<br>
&gt; &gt; &gt; +=C2=A0 ${IMAGES_DIR}/flash.bin \<br>
&gt; &gt; &gt; +=C2=A0 ${IMAGES_DIR}/sdcard.img<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg b/=
board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..bc100b171dd6<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg<br>
&gt; &gt; &gt; @@ -0,0 +1,17 @@<br>
&gt; &gt; &gt; +image sdcard.img {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part=
ition-table-type =3D &quot;gpt&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0partition imx-boot {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-p=
artition-table =3D &quot;no&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imag=
e =3D &quot;flash.bin&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offs=
et =3D 33K<br>
&gt; &gt;<br>
&gt; &gt; I was just wondering that the offset here is 33k. I had remembere=
d<br>
&gt; &gt; that for imx8mn boards the offset is 32k. Or am I wrong? Are you =
sure<br>
&gt; &gt; that you start the bootloader from an SD card and not from eMMC?<=
br>
&gt;<br>
&gt; The board boots from eMMC. The board/bsh/imx8mn-bsh-smm-s2-pro/flash.s=
h<br>
&gt; calls the uuu application with the &quot;emmc_all&quot; option.<br>
<br>
Ah ok. I&#39;m not familiar with the uuu tool. Nevertheless, the offset in<=
br>
the genimage config looks wrong to me. If you want to install the<br>
created image without the uuu tool it will probably not work, because<br>
the imx8mn processor expects the bootloader (flash.bin) image at<br>
offset 32k.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">He is right</div><div dir=3D"auto"><br></div><div dir=3D"auto">M=
ichael</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Thanks and regards,<br>
&gt; Dario<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; [SNIP]<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Heiko<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Dario Binacchi<br>
&gt;<br>
&gt; Embedded Linux Developer<br>
&gt;<br>
&gt; <a href=3D"mailto:dario.binacchi@amarulasolutions.com" target=3D"_blan=
k" rel=3D"noreferrer">dario.binacchi@amarulasolutions.com</a><br>
&gt;<br>
&gt; __________________________________<br>
&gt;<br>
&gt;<br>
&gt; Amarula Solutions SRL<br>
&gt;<br>
&gt; Via Le Canevare 30, 31100 Treviso, Veneto, IT<br>
&gt;<br>
&gt; T. +39 042 243 5310<br>
&gt; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank" rel=3D"=
noreferrer">info@amarulasolutions.com</a><br>
&gt;<br>
&gt; <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer noreferr=
er" target=3D"_blank">www.amarulasolutions.com</a><br>
</blockquote></div></div></div>

--0000000000006e150605e83cdc37--

--===============4603671458317324811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4603671458317324811==--
