Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,WEIRD_PORT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3569C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:21:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34C660F25
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A34C660F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A86581DB2;
	Sun,  8 Aug 2021 17:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQjVGxED3KSI; Sun,  8 Aug 2021 17:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B68882993;
	Sun,  8 Aug 2021 17:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D8991BF575
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A0AE4029D
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3_sCuKGTDlr for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 17:20:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02D424022A
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 17:20:58 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id m13so23782214iol.7
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6u/N7aAq8xCltt4ayhDLdtGkd/MmeamV6LjszgA+XIg=;
 b=QsaOhHW3ZZyb1j7Ob7w7uo6ROYyOb4kJRdXbzlBi7lwVS/19wd/3OZPWbW25u0n/80
 /E7IEiPRlbcGGJJJCpf4pEp1m0373v8UNlfRJXVReqN2kAJQCUT3OCv84MNuXhvxoa6f
 VV3cqP+Vs8s2KhdpYYprRQumrrw8N1H9UXI7/R0XtsSS8ruV8D/dTkQjBFWGswN5cWGU
 ZWFk6Qgj5IrnZXdXMjJohw68ONQngM7Lhm+ZVcGNjNgsnQYKTczWYdI2dYyCXKFEJME1
 IRjDcNVq6nU4ubYeRG0gILnYbiI1GWGjxj3QnbEVPdxK88CCpZROzzvNQ3AAjWdO0KDj
 9I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6u/N7aAq8xCltt4ayhDLdtGkd/MmeamV6LjszgA+XIg=;
 b=efXrJH1kVWjGXVieyhjK9Z+6xZujpkzN2JYf4uQAcWJkm+HVm2iBu3Dl4caks7VS+m
 BheH5Mg3wLoyuIM3VU2wxKKodPCsHvYdb2MZu+7G/gQbfEkksOFGg+JGhsSMINKwCEUv
 d6sGZp7dWr7e1M8gtS2P7mZXQGHTSoBdSLEfkGOsdg/RJ5N0lan3/YdUuzMIXYek+Ntt
 v1iFORZyflasKHD/hmpUjbyTmfQ0K3A1cX0xG1PglOKO5nh4nJRx/2xZgo2xVioO7bPx
 YxevvmBBUlTjU7/VD5bV8t1xUtpEfxiW+QysGVBttIpaEQPwm2kQady4t7PoynJ4dysv
 hGaA==
X-Gm-Message-State: AOAM530MZZCXXD7tBbS+KhYBCKvd5hxl6V42AreyiIcx8LatxWFm8VY3
 /8DBxWMZP/2zPCpeMxtehXljpfGXpHv2X4Zq23O98CXayFDqdQ6ExUA=
X-Google-Smtp-Source: ABdhPJzbd/U5u56klmWp3Nx2o6npViLRntmtd0KXEfuBW8sThm+FyDWToHftQE6AOJJvZYUYwQo/RZNraDMz5xjhwes=
X-Received: by 2002:a02:860d:: with SMTP id e13mr12143467jai.12.1628443257828; 
 Sun, 08 Aug 2021 10:20:57 -0700 (PDT)
MIME-Version: 1.0
From: Ernie Carp <erniecarp2018@gmail.com>
Date: Sun, 8 Aug 2021 10:20:46 -0700
Message-ID: <CAHdaamO=-SY7qERamRwb+R7J3W8_71p8eeqF4MVzAA=Y=zeOww@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] build error at91bootstrap3-custom
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
Content-Type: multipart/mixed; boundary="===============7379827123915819317=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7379827123915819317==
Content-Type: multipart/alternative; boundary="000000000000eb7c6405c90f7d6c"

--000000000000eb7c6405c90f7d6c
Content-Type: text/plain; charset="UTF-8"

Hello,

I have encountered a build error when building on Centos8 for
atmel_sama5d27_som1_ek_mmc_dev_defconfig

What I did was:

git clone git://git.buildroot.net/buildroot
cd /buildroot
make atmel_sama5d27_som1_ek_mmc_dev_defconfig
make

The error is below.

>>> at91bootstrap3 custom Building
/usr/bin/make -j17
CROSS_COMPILE=/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-
DESTDIR=/home/ernie/test/buildroot/output/images -C
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom
CC
========
  AS
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/crt0_gnu.S
/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
10.3.0

as FLAGS
========
-g -Os -Wall
-I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek
-Iinclude -Icontrib/include -DJUMP_ADDR=0x23f00000 -DTOP_OF_MEMORY=0x210000
-DMACH_TYPE=9999 -DLINK_ADDR=0x200000 -Dsama5d27_som1_ek -DMACH_TYPE=9999
-DTOP_OF_MEMORY=0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2 -mcpu=cortex-a5
-mtune=cortex-a5 -DCONFIG_CPU_V7 -DCONFIG_SAMA5D27_SOM1_EK
-DCONFIG_PMC_COMMON

gcc FLAGS
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/main.c
=========
-nostdinc -isystem
/home/ernie/test/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/10.3.0/include
-ffunction-sections -g -Os -Wall -mno-unaligned-access -fno-stack-protector
-fno-common -fno-builtin -fno-jump-tables -fno-pie
-I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek
-Icontrib/include -Iinclude -Ifs/include
-I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/config/at91bootstrap-config
-DAT91BOOTSTRAP_VERSION="3.9.2" -DCOMPILE_TIME="Sat Aug  7 19:04:54 PDT
2021" -DIMG_ADDRESS= -DIMG_SIZE= -DJUMP_ADDR=0x23f00000 -DOF_OFFSET=
-DOF_ADDRESS= -DMEM_BANK=0x20000000 -DMEM_SIZE=0x8000000
-DIMAGE_NAME="u-boot.bin" -DCMDLINE="" -DCMDLINE_FILE=""
-DTOP_OF_MEMORY=0x210000 -DMACH_TYPE=9999 -DCONFIG_DEBUG
-DBANNER="\n\nAT91Bootstrap " AT91BOOTSTRAP_VERSION " (" COMPILE_TIME
")\n\n" -DCONFIG_HW_DISPLAY_BANNER -DCONFIG_HW_INIT -Dsama5d27_som1_ek
-DMACH_TYPE=9999 -DTOP_OF_MEMORY=0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2
-mcpu=cortex-a5 -mtune=cortex-a5 -DCONFIG_SCLK -DCONFIG_CRYSTAL_24_000MHZ
-DCONFIG_CPU_CLK_492MHZ -DCONFIG_BUS_SPEED_164MHZ -DCONFIG_CPU_V7
-DCONFIG_MATRIX -DCONFIG_REDIRECT_ALL_INTS_AIC -DCPU_HAS_H32MXDIV
-DCONFIG_SAMA5D27_SOM1_EK -DCONFIG_DDRC -DCONFIG_DDR2 -DCONFIG_RAM_128MB
-DCONFIG_SDCARD -DCONFIG_PMC_COMMON -DCONFIG_PMC_V1
-DCONFIG_PMC_PCLK_SAM9X5 -DCONFIG_PMC_GENERIC_CLK -DCONFIG_PMC_UTMI_CLK
-DCONFIG_PMC_PLL_CLK -DBOOTSTRAP_DEBUG_LEVEL=DEBUG_INFO
-DCONFIG_DISABLE_WATCHDOG -DCPU_HAS_PIO4 -DCONFIG_SDHC -DCONFIG_SDHC0
-DCONFIG_USART -DCONFIG_RSTC

ld FLAGS
========
-nostartfiles
-Map=/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.map
--cref -static -T elf32-littlearm.lds --gc-sections -Ttext 0x200000

  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som1_ek/sama5d27_som1_ek.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/string.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/eabi_utils.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/div.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/consttime_memequal.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/debug.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_slowclk.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/common.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pio.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/common.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/periph-clk-sam9x5.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/generic-clk.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/utmi-clk.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/pll-clk.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_pit.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_wdt.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_usart.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_rstc.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/lp310_l2cc.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/ddramc.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/sdhc.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/mci_media.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/sdcard.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/matrix.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at91_aicredir.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/ff.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/diskio.c
  CC
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/option/ccsbcs.c
mkdir -p
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries
  LD        sama5d27_som1_ek-sdcardboot-uboot-3.9.2.elf
/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld:
Error: unable to disambiguate: -nostartfiles (did you mean --nostartfiles ?)
make[2]: *** [Makefile:328:
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-uboot-3.9.2.bin]
Error 1
make[1]: *** [package/pkg-generic.mk:270:
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/.stamp_built]
Error 2
make: *** [Makefile:84: _all] Error 2
[ernie@BuildRootC8 buildroot]$


I cannot find where to fix this and could use a little help please.

Thank you,
Ernie.

--000000000000eb7c6405c90f7d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hello,<div><br></div><div>I have encountered a build error when b=
uilding on Centos8 for atmel_sama5d27_som1_ek_mmc_dev_defconfig</div><div><=
br></div><div>What I did was:</div><div><br></div><div>git clone git://<a h=
ref=3D"http://git.buildroot.net/buildroot">git.buildroot.net/buildroot</a><=
br></div><div>cd /buildroot</div><div>make atmel_sama5d27_som1_ek_mmc_dev_d=
efconfig<br></div><div>make</div><div><br></div><div>The error is below.</d=
iv><div><br></div><div><div>&gt;&gt;&gt; at91bootstrap3 custom Building</di=
v><div>/usr/bin/make -j17 CROSS_COMPILE=3D/home/ernie/test/buildroot/output=
/host/bin/arm-buildroot-linux-uclibcgnueabihf- DESTDIR=3D/home/ernie/test/b=
uildroot/output/images -C /home/ernie/test/buildroot/output/build/at91boots=
trap3-custom</div><div>CC</div><div>=3D=3D=3D=3D=3D=3D=3D=3D</div><div>=C2=
=A0 AS=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/a=
t91bootstrap3-custom/crt0_gnu.S</div><div>/home/ernie/test/buildroot/output=
/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc 10.3.0</div><div><br></di=
v><div>as FLAGS</div><div>=3D=3D=3D=3D=3D=3D=3D=3D</div><div>-g -Os -Wall -=
I/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d=
27_som1_ek -Iinclude -Icontrib/include -DJUMP_ADDR=3D0x23f00000 -DTOP_OF_ME=
MORY=3D0x210000 -DMACH_TYPE=3D9999 -DLINK_ADDR=3D0x200000 -Dsama5d27_som1_e=
k -DMACH_TYPE=3D9999 -DTOP_OF_MEMORY=3D0x210000 -DCRYSTAL_24_000MHZ -DSAMA5=
D2 -mcpu=3Dcortex-a5 -mtune=3Dcortex-a5 -DCONFIG_CPU_V7 -DCONFIG_SAMA5D27_S=
OM1_EK -DCONFIG_PMC_COMMON</div><div><br></div><div>gcc FLAGS</div><div>=C2=
=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/a=
t91bootstrap3-custom/main.c</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div=
>-nostdinc -isystem /home/ernie/test/buildroot/output/host/lib/gcc/arm-buil=
droot-linux-uclibcgnueabihf/10.3.0/include -ffunction-sections -g -Os -Wall=
 -mno-unaligned-access -fno-stack-protector -fno-common -fno-builtin -fno-j=
ump-tables -fno-pie -I/home/ernie/test/buildroot/output/build/at91bootstrap=
3-custom/board/sama5d27_som1_ek -Icontrib/include -Iinclude -Ifs/include -I=
/home/ernie/test/buildroot/output/build/at91bootstrap3-custom/config/at91bo=
otstrap-config -DAT91BOOTSTRAP_VERSION=3D&quot;3.9.2&quot; -DCOMPILE_TIME=
=3D&quot;Sat Aug=C2=A0 7 19:04:54 PDT 2021&quot; -DIMG_ADDRESS=3D -DIMG_SIZ=
E=3D -DJUMP_ADDR=3D0x23f00000 -DOF_OFFSET=3D -DOF_ADDRESS=3D -DMEM_BANK=3D0=
x20000000 -DMEM_SIZE=3D0x8000000 -DIMAGE_NAME=3D&quot;u-boot.bin&quot; -DCM=
DLINE=3D&quot;&quot; -DCMDLINE_FILE=3D&quot;&quot; -DTOP_OF_MEMORY=3D0x2100=
00 -DMACH_TYPE=3D9999 -DCONFIG_DEBUG -DBANNER=3D&quot;\n\nAT91Bootstrap &qu=
ot; AT91BOOTSTRAP_VERSION &quot; (&quot; COMPILE_TIME &quot;)\n\n&quot; -DC=
ONFIG_HW_DISPLAY_BANNER -DCONFIG_HW_INIT -Dsama5d27_som1_ek -DMACH_TYPE=3D9=
999 -DTOP_OF_MEMORY=3D0x210000 -DCRYSTAL_24_000MHZ -DSAMA5D2 -mcpu=3Dcortex=
-a5 -mtune=3Dcortex-a5 -DCONFIG_SCLK -DCONFIG_CRYSTAL_24_000MHZ -DCONFIG_CP=
U_CLK_492MHZ -DCONFIG_BUS_SPEED_164MHZ -DCONFIG_CPU_V7 -DCONFIG_MATRIX -DCO=
NFIG_REDIRECT_ALL_INTS_AIC -DCPU_HAS_H32MXDIV -DCONFIG_SAMA5D27_SOM1_EK -DC=
ONFIG_DDRC -DCONFIG_DDR2 -DCONFIG_RAM_128MB -DCONFIG_SDCARD -DCONFIG_PMC_CO=
MMON -DCONFIG_PMC_V1 -DCONFIG_PMC_PCLK_SAM9X5 -DCONFIG_PMC_GENERIC_CLK -DCO=
NFIG_PMC_UTMI_CLK -DCONFIG_PMC_PLL_CLK -DBOOTSTRAP_DEBUG_LEVEL=3DDEBUG_INFO=
 -DCONFIG_DISABLE_WATCHDOG -DCPU_HAS_PIO4 -DCONFIG_SDHC -DCONFIG_SDHC0 -DCO=
NFIG_USART -DCONFIG_RSTC</div><div><br></div><div>ld FLAGS</div><div>=3D=3D=
=3D=3D=3D=3D=3D=3D</div><div>-nostartfiles -Map=3D/home/ernie/test/buildroo=
t/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-u=
boot-3.9.2.map --cref -static -T elf32-littlearm.lds --gc-sections -Ttext 0=
x200000</div><div><br></div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home=
/ernie/test/buildroot/output/build/at91bootstrap3-custom/board/sama5d27_som=
1_ek/sama5d27_som1_ek.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /hom=
e/ernie/test/buildroot/output/build/at91bootstrap3-custom/lib/string.c</div=
><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/outpu=
t/build/at91bootstrap3-custom/lib/eabi_utils.c</div><div>=C2=A0 CC=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3=
-custom/lib/div.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/erni=
e/test/buildroot/output/build/at91bootstrap3-custom/lib/consttime_memequal.=
c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot=
/output/build/at91bootstrap3-custom/driver/debug.c</div><div>=C2=A0 CC=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootst=
rap3-custom/driver/at91_slowclk.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver=
/common.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/b=
uildroot/output/build/at91bootstrap3-custom/driver/at91_pio.c</div><div>=C2=
=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/a=
t91bootstrap3-custom/driver/pmc/common.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom=
/driver/pmc/periph-clk-sam9x5.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/pm=
c/generic-clk.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/=
test/buildroot/output/build/at91bootstrap3-custom/driver/pmc/utmi-clk.c</di=
v><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/outp=
ut/build/at91bootstrap3-custom/driver/pmc/pll-clk.c</div><div>=C2=A0 CC=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootst=
rap3-custom/driver/at91_pit.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/at=
91_wdt.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/bu=
ildroot/output/build/at91bootstrap3-custom/driver/at91_usart.c</div><div>=
=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/buil=
d/at91bootstrap3-custom/driver/at91_rstc.c</div><div>=C2=A0 CC=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custo=
m/driver/lp310_l2cc.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/=
ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/ddramc.c</di=
v><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/outp=
ut/build/at91bootstrap3-custom/driver/sdhc.c</div><div>=C2=A0 CC=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-cu=
stom/driver/mci_media.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /hom=
e/ernie/test/buildroot/output/build/at91bootstrap3-custom/driver/sdcard.c</=
div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/ou=
tput/build/at91bootstrap3-custom/driver/matrix.c</div><div>=C2=A0 CC=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3=
-custom/driver/at91_aicredir.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /home/ernie/test/buildroot/output/build/at91bootstrap3-custom/fs/src/ff=
.c</div><div>=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroo=
t/output/build/at91bootstrap3-custom/fs/src/diskio.c</div><div>=C2=A0 CC=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /home/ernie/test/buildroot/output/build/at91bootst=
rap3-custom/fs/src/option/ccsbcs.c</div><div>mkdir -p /home/ernie/test/buil=
droot/output/build/at91bootstrap3-custom/binaries</div><div>=C2=A0 LD=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 sama5d27_som1_ek-sdcardboot-uboot-3.9.2.elf</div><div=
>/home/ernie/test/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnuea=
bihf-ld: Error: unable to disambiguate: -nostartfiles (did you mean --nosta=
rtfiles ?)</div><div>make[2]: *** [Makefile:328: /home/ernie/test/buildroot=
/output/build/at91bootstrap3-custom/binaries/sama5d27_som1_ek-sdcardboot-ub=
oot-3.9.2.bin] Error 1</div><div>make[1]: *** [package/<a href=3D"http://pk=
g-generic.mk:270">pkg-generic.mk:270</a>: /home/ernie/test/buildroot/output=
/build/at91bootstrap3-custom/.stamp_built] Error 2</div><div>make: *** [Mak=
efile:84: _all] Error 2</div><div>[ernie@BuildRootC8 buildroot]$=C2=A0</div=
></div><div><br></div><div><br></div><div>I cannot find where to fix this a=
nd could use a little help please.</div><div><br></div><div>Thank you,</div=
><div>Ernie.</div><div><br></div><div><br></div><div><br></div><div><br></d=
iv><div><br></div></div></div></div></div></div>

--000000000000eb7c6405c90f7d6c--

--===============7379827123915819317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7379827123915819317==--
