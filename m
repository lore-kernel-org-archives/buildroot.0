Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5662EC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 12:14:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BFC6126A
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 12:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8BFC6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE6440350;
	Sun, 22 Aug 2021 12:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPbhcnrCdaUv; Sun, 22 Aug 2021 12:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F564035A;
	Sun, 22 Aug 2021 12:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36DDA1BF331
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 12:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2692E606CC
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 12:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyRuB9O-gnf6 for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 12:13:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E28C4606A7
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 12:13:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso23015877otp.1
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNiEQFXJ8sGE1t//rQu1tAqX6wtde3VwAzDb3xLSDwI=;
 b=QNhFVlhb60KeVrhZ1N+fMz6nfVBrJGolKMq2HS+oIdPwwHPBadal+oPoAL1a1upP82
 6rsie8KqeNa/VzBE8tQmiGn+vhb9exNMtkjkZmgkcIBTiDUJOmdVzpL8/IEhVIlDiGrm
 IU/rVm7lFw/vYtzEVgtb2xRusXdIZkD3R+Eey+3KkEW/8u6TPcuPNQVHn6EKU7pu869T
 EDSWt36r8DaI33wWFpYoj/XbmHoL+QYELO0cWkZzb9Tg4ln7Z6+6qIeR6cWS4oVYm6Ad
 7Zzo000X+6+5VWo4N/kXwuTu+PNzmUrpvI74SK8MqDf05aEq5fmApsF7O9nBW1cUTgj0
 owRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNiEQFXJ8sGE1t//rQu1tAqX6wtde3VwAzDb3xLSDwI=;
 b=oO4AlCH6nkeEoqdu3r1qKQj35j3khFPEeeXWXEDC3jZBkrxPhx7ErZjQPVWQY4iqHt
 PcEADELSD2vkZqSwe8qE+S4FD5UfimQaOYucYWlCtsplsBI6Tcav1W3A/uUrfcw9ZSs5
 oNt6AmmBTJICDaKTU9GjgNJCsRb8lq+RnnNOk2Z8xS1eKu1Vm8JhZia5tsApkVXwZilx
 TN/ii4RULT8E6l60llU0BzxO2dSeAOcrRRS12Y8zF5wyKxbr2yTYpdEVjKrXUaosjPgp
 s7a2GXSaUenFUYUOO3vVwVH+Xfl19D89uBxt8tIvAdFWISnpo+kJUafFH4jO+dSN46SU
 Q8Ew==
X-Gm-Message-State: AOAM531E/6lgVTwZ1xGoGvcPR00jlrM0p31LhDqHRaVKc8ZfVjh4kbVM
 J23z21U3nZgY9+XG2812hlFqBT0cHRRMQ6yK0vg=
X-Google-Smtp-Source: ABdhPJzKgfem2H+jwSTo0IgEBTApHdxsK6t5Cso2Osy2/TeGKdesAflh37r3137jIWLNvNTJoK24mBCf34mSWksfRN0=
X-Received: by 2002:a05:6808:1284:: with SMTP id
 a4mr9060302oiw.13.1629634435691; 
 Sun, 22 Aug 2021 05:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210317095228.447428-1-salvador.joseluis@gmail.com>
 <20210413211601.GF359705@scaer>
 <640d83d7-f2f3-ebcc-da79-5bee7bf72ae6@gmail.com>
In-Reply-To: <640d83d7-f2f3-ebcc-da79-5bee7bf72ae6@gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 22 Aug 2021 14:13:44 +0200
Message-ID: <CAH+XeQaCV0-F-tg9y1TSU7E2SjcUYxsk0CAVCOf8NVr-MCZyvQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000a74f6205ca24d51a"
Subject: Re: [Buildroot] [PATCH v3] package/zfs: new package
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
Cc: Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--000000000000a74f6205ca24d51a
Content-Type: multipart/alternative; boundary="000000000000a74f6005ca24d518"

--000000000000a74f6005ca24d518
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Romain,

I added Philippe Serbruyns to CC (from another related thread).

I'm on it. Currently we have two main issues with ZFS:

- AIO uClibc support for zfs 2.1.X and beyond:

This is the reason I didn't send the `zfs 2.1.x bump version` yet.

This commit added AIO in order to improve the speed importing volumes
parallely:
https://github.com/openzfs/zfs/commit/e50b5217e7a85f1466edf88d5f3ea5aed0c2f=
d22

But uClibc doesn't support `#include <aio.h>`. So I need to only import
this library when it is not uClibc. I don't figure out yet how (attached a
`poc.patch` for ZFS that does not work).

I'm trying to create a proper patch for upstream.



- Cross-platform-compilations and the `empty module` test:

This issue is very old, and everything is about environments and
cross-platform-compilations. The problem comes from here:
https://github.com/openzfs/zfs/blob/master/config/kernel.m4#L598

In this test, the `make` (modules) is from the host because (I think)
somewhere someone unset all environments. Some people include `export PATH`
in order to execute the `make` from the cross-compilation environment. I am
still thinking about a proper patch for upstream.

Here is my `build.log` from the referred `make`:

make[2]: Entering directory
'/home/jlsalvador/src/buildroot-rpi4-tmp/build/linux-custom'


  ERROR: Kernel configuration is invalid.

         include/generated/autoconf.h or include/config/auto.conf are
missing.

         Run 'make oldconfig && make prepare' on kernel src to fix it.

make[2]: *** [Makefile:719: include/config/auto.conf] Error 1

make[2]: Failed to remake makefile 'include/config/auto.conf'.

  CC [M]
 /home/jlsalvador/src/buildroot-rpi4-tmp/build/zfs-2.0.5/build/conftest/con=
ftest.o

aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized argument in
option =E2=80=98-mcmodel=3Dkernel=E2=80=99

aarch64-buildroot-linux-uclibc-gcc.br_real: note: valid arguments to
=E2=80=98-mcmodel=3D=E2=80=99 are: large small tiny

aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized
command-line option =E2=80=98-mno-sse=E2=80=99; did you mean =E2=80=98-fno-=
dse=E2=80=99?

aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized
command-line option =E2=80=98-mno-mmx=E2=80=99

aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized
command-line option =E2=80=98-mno-sse2=E2=80=99

aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized
command-line option =E2=80=98-mno-3dnow=E2=80=99

aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized
command-line option =E2=80=98-m64=E2=80=99

aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized
command-line option =E2=80=98-mno-red-zone=E2=80=99

make[3]: *** [scripts/Makefile.build:279:
/home/jlsalvador/src/buildroot-rpi4-tmp/build/zfs-2.0.5/build/conftest/conf=
test.o]
Error 1

make[3]: Target '__build' not remade because of errors.

make[2]: *** [Makefile:1824:
/home/jlsalvador/src/buildroot-rpi4-tmp/build/zfs-2.0.5/build/conftest]
Error 2

make[2]: Target 'modules' not remade because of errors.

make[2]: Leaving directory
'/home/jlsalvador/src/buildroot-rpi4-tmp/build/linux-custom'

The `include/config/auto.conf` file exists:

$ file
/home/jlsalvador/src/buildroot-rpi4-tmp/build/linux-custom/include/config/a=
uto.conf
/home/jlsalvador/src/buildroot-rpi4-tmp/build/linux-custom/include/config/a=
uto.conf:
Linux make config build file, ASCII text


But because the `make` is from a x86, and the final platform is a Arm64,
the LINUX config is incorrect.

As you already saw, I need to figure out how to use the `make` from the
cross-compilation path instead of the host path for this test.


This is the current status. I'm trying to fix the second issue today. Any
help is more than welcome.

Greetings.

El dom, 22 ago 2021 a las 12:38, Romain Naour (<romain.naour@gmail.com>)
escribi=C3=B3:

> Hello Jos=C3=A9 Luis, All,
>
> Le 13/04/2021 =C3=A0 23:16, Yann E. MORIN a =C3=A9crit :
> > Jos=C3=A9 Luis, All,
> >
> > On 2021-03-17 10:52 +0100, Jos=C3=A9 Luis Salvador Rufo spake thusly:
> >> OpenZFS is an advanced file system and volume manager which was
> originally
> >> developed for Solaris and is now maintained by the OpenZFS community.
> This
> >> repository contains the code for running OpenZFS on Linux and FreeBSD.
> >>
> >> http://zfsonlinux.org/
> >>
> >> Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.c=
om>
> >
> > I did a few substancial changes:
> >
> >   - fix test case on how to use a pre-built toolchain
> >   - reorder the test case config
> >   - add test case with glibc
> >   - drop superflous test timeout override
> >   - only select libtirpc when C library lacks native RPC
> >   - drop unused ZFS_MODULES variable
> >   - drop ZFS_CPE_ID_PREFIX and ZFS_AUTORECONF_OPTS which are defaults
> >   - drop NLS options, already set in a generic manner
> >   - drop incomplete/improper sysvinit support
> >   - some cosmetics
> >
> > Applied to master with the above changes, thanks.
> >
> > Regards,
> > Yann E. MORIN.
> >
> >> ---
> >> Changes v2 -> v3:
> >>   - Updated OpenZFS to 2.0.4
> >> Changes v1 -> v2:
> >>   (suggested by Yann E. MORIN)
> >>   - Config.in: check-package accomplished
> >>   - Config.in: fixed Config.in dependences
> >>   - zfs.hash: proper zfs.hash format
> >>   - zfs.mk: added cpe for openzfs
> >>   - zfs.mk: uclibc patch merged into upstream
> >>   - zfs.mk: removed futile comments as "zfs needs"
> >>   - zfs.mk: added comments about the kernel dependence
> >>   - zfs.mk: removed autotools default arguments values
> >>   - zfs.mk: added optional PAM dependence
> >>   - zfs.mk: replaced inline conditionals by full explained blocks
> >>   - zfs.mk: added comments about optionals systemd and sysv
> >>   - zfs.mk: removed --disable-silent-rules
> >>   - zfs.mk: reordered autoreconf
> >>   - zfs.mk: removed futile shared, static, and both logic
> >>   - zfs.mk: fixed optional python(2|3) support for pyzfs
> >>   - zfs.mk: removed futile kernel fragment
> >>   - test_zfs: replaced external toolchain by already defined bootlin
> >>   - test_zfs: increased memory a bit to prevents OOM
> >>   - test_zfs: added pyzfs test
> >>
> >>  DEVELOPERS                                |  4 +
> >>  package/Config.in                         |  1 +
> >>  package/zfs/Config.in                     | 32 ++++++++
> >>  package/zfs/zfs.hash                      |  6 ++
> >>  package/zfs/zfs.mk                        | 90 ++++++++++++++++++++++=
+
> >>  support/testing/tests/package/test_zfs.py | 61 +++++++++++++++
>
> The test_zfs doesn't build in our gitlab CI:
>
> https://gitlab.com/kubu93/buildroot/-/jobs/1522848483
>
> zfs use the host compiler to check if it can build zfs modules for the
> target
>
> checking kernel source directory...
> /builds/kubu93/buildroot/test-output/TestZfsGlibc/build/linux-5.12.13
> checking kernel build directory...
> /builds/kubu93/buildroot/test-output/TestZfsGlibc/build/linux-5.12.13
> checking kernel source version... 5.12.13
> checking kernel file name for module symbols... Module.symvers
> checking whether modules can be built... no
> configure: error:
>         *** Unable to build an empty module.
>
> See build-host-gcc-6.log
>
>   CC [M]
>
> /home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/conf=
test/conftest.o
> In file included from <command-line>:0:0:
> ./arch/x86/include/asm/segment.h: In function 'vdso_read_cpunode':
> ././include/linux/compiler_types.h:250:24: error: expected '(' before
> '__inline'
>  #define asm_inline asm __inline
>
> The check pass if a newer host gcc is used (gcc 10.3 here).
>
> Can you have a look ?
>
> Best regards,
> Romain
>

--000000000000a74f6005ca24d518
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Romain,<div><br></div><div>I added=
=C2=A0Philippe Serbruyns to CC (from another related thread).</div><div><br=
></div><div>I&#39;m on it. Currently we have two main issues with ZFS:</div=
><div><br></div><div>- AIO uClibc support for zfs 2.1.X and beyond:</div><d=
iv><br></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px=
"><div>This is the reason I didn&#39;t send the `zfs 2.1.x bump version` ye=
t.</div><div><br></div><div>This commit added AIO in order to improve the s=
peed importing volumes parallely:</div><div><a href=3D"https://github.com/o=
penzfs/zfs/commit/e50b5217e7a85f1466edf88d5f3ea5aed0c2fd22">https://github.=
com/openzfs/zfs/commit/e50b5217e7a85f1466edf88d5f3ea5aed0c2fd22</a></div><d=
iv><br></div><div>But uClibc doesn&#39;t support `#include &lt;aio.h&gt;`. =
So I need to only import this library when it is not uClibc. I don&#39;t fi=
gure out yet how (attached a `poc.patch` for ZFS that does not work).</div>=
<div><br></div></blockquote><blockquote style=3D"margin:0 0 0 40px;border:n=
one;padding:0px"><div>I&#39;m trying to create a proper patch for upstream.=
</div></blockquote><div><br></div><div><br></div><div>- Cross-platform-comp=
ilations=C2=A0and the `empty module` test:</div><div><br></div><blockquote =
style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>This issue is very=
 old,=C2=A0and everything is about environments and cross-platform-compilat=
ions. The problem comes from here:</div><div><a href=3D"https://github.com/=
openzfs/zfs/blob/master/config/kernel.m4#L598">https://github.com/openzfs/z=
fs/blob/master/config/kernel.m4#L598</a></div><div><br></div><div>In this=
=C2=A0test, the `make` (modules) is from the host because (I think) somewhe=
re someone unset all=C2=A0environments. Some people include `export PATH` i=
n order to execute the `make` from the cross-compilation environment. I am =
still thinking about a proper patch for upstream.</div><div><br></div></blo=
ckquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px">Her=
e is my `build.log` from the referred `make`:<br></blockquote><blockquote s=
tyle=3D"margin:0 0 0 40px;border:none;padding:0px"><blockquote style=3D"mar=
gin:0 0 0 40px;border:none;padding:0px">make[2]: Entering directory &#39;/h=
ome/jlsalvador/src/buildroot-rpi4-tmp/build/linux-custom&#39;</blockquote><=
blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><br></blockq=
uote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px">=C2=A0=
 ERROR: Kernel configuration is invalid.</blockquote><blockquote style=3D"m=
argin:0 0 0 40px;border:none;padding:0px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0include/generated/autoconf.h or include/config/auto.conf are missing.</b=
lockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run &#39;make oldconfig &amp;&amp; make p=
repare&#39; on kernel src to fix it.<br><br></blockquote></blockquote><bloc=
kquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><blockquote styl=
e=3D"margin:0 0 0 40px;border:none;padding:0px">make[2]: *** [Makefile:719:=
 include/config/auto.conf] Error 1</blockquote><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px">make[2]: Failed to remake makefile &#39=
;include/config/auto.conf&#39;.</blockquote><blockquote style=3D"margin:0 0=
 0 40px;border:none;padding:0px">=C2=A0 CC [M] =C2=A0/home/jlsalvador/src/b=
uildroot-rpi4-tmp/build/zfs-2.0.5/build/conftest/conftest.o</blockquote><bl=
ockquote style=3D"margin:0 0 0 40px;border:none;padding:0px">aarch64-buildr=
oot-linux-uclibc-gcc.br_real: error: unrecognized argument in option =E2=80=
=98-mcmodel=3Dkernel=E2=80=99</blockquote><blockquote style=3D"margin:0 0 0=
 40px;border:none;padding:0px">aarch64-buildroot-linux-uclibc-gcc.br_real: =
note: valid arguments to =E2=80=98-mcmodel=3D=E2=80=99 are: large small tin=
y</blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0p=
x">aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized command-=
line option =E2=80=98-mno-sse=E2=80=99; did you mean =E2=80=98-fno-dse=E2=
=80=99?</blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padd=
ing:0px">aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized co=
mmand-line option =E2=80=98-mno-mmx=E2=80=99</blockquote><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px">aarch64-buildroot-linux-ucli=
bc-gcc.br_real: error: unrecognized command-line option =E2=80=98-mno-sse2=
=E2=80=99</blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;pa=
dding:0px">aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized =
command-line option =E2=80=98-mno-3dnow=E2=80=99</blockquote><blockquote st=
yle=3D"margin:0 0 0 40px;border:none;padding:0px">aarch64-buildroot-linux-u=
clibc-gcc.br_real: error: unrecognized command-line option =E2=80=98-m64=E2=
=80=99</blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;paddi=
ng:0px">aarch64-buildroot-linux-uclibc-gcc.br_real: error: unrecognized com=
mand-line option =E2=80=98-mno-red-zone=E2=80=99</blockquote><blockquote st=
yle=3D"margin:0 0 0 40px;border:none;padding:0px">make[3]: *** [scripts/Mak=
efile.build:279: /home/jlsalvador/src/buildroot-rpi4-tmp/build/zfs-2.0.5/bu=
ild/conftest/conftest.o] Error 1</blockquote><blockquote style=3D"margin:0 =
0 0 40px;border:none;padding:0px">make[3]: Target &#39;__build&#39; not rem=
ade because of errors.</blockquote><blockquote style=3D"margin:0 0 0 40px;b=
order:none;padding:0px">make[2]: *** [Makefile:1824: /home/jlsalvador/src/b=
uildroot-rpi4-tmp/build/zfs-2.0.5/build/conftest] Error 2</blockquote><bloc=
kquote style=3D"margin:0 0 0 40px;border:none;padding:0px">make[2]: Target =
&#39;modules&#39; not remade because of errors.</blockquote><blockquote sty=
le=3D"margin:0 0 0 40px;border:none;padding:0px">make[2]: Leaving directory=
 &#39;/home/jlsalvador/src/buildroot-rpi4-tmp/build/linux-custom&#39;<br><b=
r></blockquote></blockquote><blockquote style=3D"margin:0 0 0 40px;border:n=
one;padding:0px">The `include/config/auto.conf` file exists:<br></blockquot=
e><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><blockquo=
te style=3D"margin:0 0 0 40px;border:none;padding:0px">$ file /home/jlsalva=
dor/src/buildroot-rpi4-tmp/build/linux-custom/include/config/auto.conf<br>/=
home/jlsalvador/src/buildroot-rpi4-tmp/build/linux-custom/include/config/au=
to.conf: Linux make config build file, ASCII text<br></blockquote></blockqu=
ote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><br>But=
 because the `make` is from a x86, and the final platform is a Arm64, the L=
INUX config is incorrect.<br><br></blockquote><blockquote style=3D"margin:0=
 0 0 40px;border:none;padding:0px"><blockquote style=3D"margin:0 0 0 40px;b=
order:none;padding:0px"></blockquote></blockquote><blockquote style=3D"marg=
in:0 0 0 40px;border:none;padding:0px">As you already=C2=A0saw, I need to f=
igure out how to use the `make` from the cross-compilation path instead of =
the host path for this test.<br></blockquote><div><br></div><div>This is th=
e current status. I&#39;m trying to fix the second issue today. Any help is=
 more than welcome.</div><div><br></div><div>Greetings.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El dom, 22 ago=
 2021 a las 12:38, Romain Naour (&lt;<a href=3D"mailto:romain.naour@gmail.c=
om" target=3D"_blank">romain.naour@gmail.com</a>&gt;) escribi=C3=B3:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Jos=C3=A9 Luis, =
All,<br>
<br>
Le 13/04/2021 =C3=A0 23:16, Yann E. MORIN a =C3=A9crit=C2=A0:<br>
&gt; Jos=C3=A9 Luis, All,<br>
&gt; <br>
&gt; On 2021-03-17 10:52 +0100, Jos=C3=A9 Luis Salvador Rufo spake thusly:<=
br>
&gt;&gt; OpenZFS is an advanced file system and volume manager which was or=
iginally<br>
&gt;&gt; developed for Solaris and is now maintained by the OpenZFS communi=
ty. This<br>
&gt;&gt; repository contains the code for running OpenZFS on Linux and Free=
BSD.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://zfsonlinux.org/" rel=3D"noreferrer" target=3D"_b=
lank">http://zfsonlinux.org/</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:=
salvador.joseluis@gmail.com" target=3D"_blank">salvador.joseluis@gmail.com<=
/a>&gt;<br>
&gt; <br>
&gt; I did a few substancial changes:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- fix test case on how to use a pre-built toolchain<br>
&gt;=C2=A0 =C2=A0- reorder the test case config<br>
&gt;=C2=A0 =C2=A0- add test case with glibc<br>
&gt;=C2=A0 =C2=A0- drop superflous test timeout override<br>
&gt;=C2=A0 =C2=A0- only select libtirpc when C library lacks native RPC<br>
&gt;=C2=A0 =C2=A0- drop unused ZFS_MODULES variable<br>
&gt;=C2=A0 =C2=A0- drop ZFS_CPE_ID_PREFIX and ZFS_AUTORECONF_OPTS which are=
 defaults<br>
&gt;=C2=A0 =C2=A0- drop NLS options, already set in a generic manner<br>
&gt;=C2=A0 =C2=A0- drop incomplete/improper sysvinit support<br>
&gt;=C2=A0 =C2=A0- some cosmetics<br>
&gt; <br>
&gt; Applied to master with the above changes, thanks.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Yann E. MORIN.<br>
&gt; <br>
&gt;&gt; ---<br>
&gt;&gt; Changes v2 -&gt; v3:<br>
&gt;&gt;=C2=A0 =C2=A0- Updated OpenZFS to 2.0.4<br>
&gt;&gt; Changes v1 -&gt; v2:<br>
&gt;&gt;=C2=A0 =C2=A0(suggested by Yann E. MORIN)<br>
&gt;&gt;=C2=A0 =C2=A0- Config.in: check-package accomplished<br>
&gt;&gt;=C2=A0 =C2=A0- Config.in: fixed Config.in dependences<br>
&gt;&gt;=C2=A0 =C2=A0- zfs.hash: proper zfs.hash format<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: added cpe for openzfs<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: uclibc patch merged into upstream<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: removed futile comments as &quot;zfs needs&quot;<br=
>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: added comments about the kernel dependence<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: removed autotools default arguments values<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: added optional PAM dependence<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: replaced inline conditionals by full explained bloc=
ks<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: added comments about optionals systemd and sysv<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: removed --disable-silent-rules<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: reordered autoreconf<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: removed futile shared, static, and both logic<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: fixed optional python(2|3) support for pyzfs<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"http://zfs.mk" rel=3D"noreferrer" target=
=3D"_blank">zfs.mk</a>: removed futile kernel fragment<br>
&gt;&gt;=C2=A0 =C2=A0- test_zfs: replaced external toolchain by already def=
ined bootlin<br>
&gt;&gt;=C2=A0 =C2=A0- test_zfs: increased memory a bit to prevents OOM<br>
&gt;&gt;=C2=A0 =C2=A0- test_zfs: added pyzfs test<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +<=
br>
&gt;&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt;=C2=A0 package/zfs/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++++++<br>
&gt;&gt;=C2=A0 package/zfs/zfs.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++<br>
&gt;&gt;=C2=A0 package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer" tar=
get=3D"_blank">zfs.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 90 +++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 support/testing/tests/package/test_zfs.py | 61 +++++++++++++=
++<br>
<br>
The test_zfs doesn&#39;t build in our gitlab CI:<br>
<br>
<a href=3D"https://gitlab.com/kubu93/buildroot/-/jobs/1522848483" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.com/kubu93/buildroot/-/jobs/1522=
848483</a><br>
<br>
zfs use the host compiler to check if it can build zfs modules for the targ=
et<br>
<br>
checking kernel source directory...<br>
/builds/kubu93/buildroot/test-output/TestZfsGlibc/build/linux-5.12.13<br>
checking kernel build directory...<br>
/builds/kubu93/buildroot/test-output/TestZfsGlibc/build/linux-5.12.13<br>
checking kernel source version... 5.12.13<br>
checking kernel file name for module symbols... Module.symvers<br>
checking whether modules can be built... no<br>
configure: error:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *** Unable to build an empty module.<br>
<br>
See build-host-gcc-6.log<br>
<br>
=C2=A0 CC [M]<br>
/home/br-user/buildroot/testsuite/TestZfsGlibc/build/zfs-2.0.5/build/confte=
st/conftest.o<br>
In file included from &lt;command-line&gt;:0:0:<br>
./arch/x86/include/asm/segment.h: In function &#39;vdso_read_cpunode&#39;:<=
br>
././include/linux/compiler_types.h:250:24: error: expected &#39;(&#39; befo=
re &#39;__inline&#39;<br>
=C2=A0#define asm_inline asm __inline<br>
<br>
The check pass if a newer host gcc is used (gcc 10.3 here).<br>
<br>
Can you have a look ?<br>
<br>
Best regards,<br>
Romain<br>
</blockquote></div>
</div>

--000000000000a74f6005ca24d518--

--000000000000a74f6205ca24d51a
Content-Type: text/x-patch; charset="US-ASCII"; name="poc.patch"
Content-Disposition: attachment; filename="poc.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ksn4gc930>
X-Attachment-Id: f_ksn4gc930

ZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzLzAwMDEtenV0aWxfaW1wb3J0LnBhdGNoIGIvcGFja2Fn
ZS96ZnMvMDAwMS16dXRpbF9pbXBvcnQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMjQ3ODhiYmYzNQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvemZzLzAw
MDEtenV0aWxfaW1wb3J0LnBhdGNoCkBAIC0wLDAgKzEsMzYgQEAKK2RpZmYgLS1naXQgYS9saWIv
bGlienV0aWwvenV0aWxfaW1wb3J0LmMgYi9saWIvbGlienV0aWwvenV0aWxfaW1wb3J0LmMKK2lu
ZGV4IDBlNTllYzhjOC4uNjRiNTM2NTFiIDEwMDY0NAorLS0tIGEvbGliL2xpYnp1dGlsL3p1dGls
X2ltcG9ydC5jCisrKysgYi9saWIvbGlienV0aWwvenV0aWxfaW1wb3J0LmMKK0BAIC00Nyw3ICs0
NywxMCBAQAorICAqIHVzaW5nIG91ciBkZXJpdmVkIGNvbmZpZywgYW5kIHJlY29yZCB0aGUgcmVz
dWx0cy4KKyAgKi8KKyAKKy0jaW5jbHVkZSA8YWlvLmg+CisrI2lmIChfX0dMSUJDX18gJiYgIV9f
VUNMSUJDX18pCisrIyB3YXJuaW5nIEFJTyBpbmNsdWRlZAorKyMgaW5jbHVkZSA8YWlvLmg+Cisr
I2VuZGlmCisgI2luY2x1ZGUgPGN0eXBlLmg+CisgI2luY2x1ZGUgPGRpcmVudC5oPgorICNpbmNs
dWRlIDxlcnJuby5oPgorQEAgLTk3Myw2ICs5NzUsOCBAQCB6cG9vbF9yZWFkX2xhYmVsX3Nsb3co
aW50IGZkLCBudmxpc3RfdCAqKmNvbmZpZywgaW50ICpudW1fbGFiZWxzKQorIGludAorIHpwb29s
X3JlYWRfbGFiZWwoaW50IGZkLCBudmxpc3RfdCAqKmNvbmZpZywgaW50ICpudW1fbGFiZWxzKQor
IHsKKysJI2lmIChfX0dMSUJDX18gJiYgIV9fVUNMSUJDX18pCisrCSMgd2FybmluZyBBSU8gaW5j
bHVkZWQKKyAJc3RydWN0IHN0YXQ2NCBzdGF0YnVmOworIAlzdHJ1Y3QgYWlvY2IgYWlvY2JzW1ZE
RVZfTEFCRUxTXTsKKyAJc3RydWN0IGFpb2NiICphaW9jYnBzW1ZERVZfTEFCRUxTXTsKK0BAIC0x
MDkzLDYgKzEwOTYsMTAgQEAgenBvb2xfcmVhZF9sYWJlbChpbnQgZmQsIG52bGlzdF90ICoqY29u
ZmlnLCBpbnQgKm51bV9sYWJlbHMpCisgCSpjb25maWcgPSBleHBlY3RlZF9jb25maWc7CisgCisg
CXJldHVybiAoMCk7CisrCSNlbHNlCisrCWludCBlcnJvciA9IHpwb29sX3JlYWRfbGFiZWxfc2xv
dyhmZCwgY29uZmlnLCBudW1fbGFiZWxzKTsKKysJcmV0dXJuIChlcnJvcik7CisrCSNlbmRpZgor
IH0KKyAKKyAvKgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pm
cy96ZnMuaGFzaAppbmRleCA1YTBjNDNkMzY2Li4xODhiOWFjZmU4IDEwMDY0NAotLS0gYS9wYWNr
YWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pmcy96ZnMuaGFzaApAQCAtMSw1ICsxLDUg
QEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDdkMTM0NGM1NDMzYjkxODIzZjAyYzJl
NDBiMzNkMTgxZmE2ZmFmMjg2YmVhNTU5MWY0YjE5NjVmMjNkNDVmNmMgIHpmcy0yLjAuNC50YXIu
Z3oKK3NoYTI1NiAgNjBiZGRjYjYzMDI4NGM3NzFkY2Y1YTExMDljYTkzMjlkMTY1MjNhM2E0MGEz
NzQwMTk5NTVjZmJmOTdiZjM0ZiAgemZzLTIuMS4wLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vu
c2UgZmlsZXM6CiBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5ZjA0ZTk0N2ZhY2M1Yzc4NTFmMjg5NjA5
MjU2YWFjYjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
emZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawppbmRleCBjOGUzM2E3YjFhLi4yNWZkOWU1
Njc2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKKysrIGIvcGFja2FnZS96ZnMvemZz
Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotWkZTX1ZF
UlNJT04gPSAyLjAuNAorWkZTX1ZFUlNJT04gPSAyLjEuMAogWkZTX1NJVEUgPSBodHRwczovL2dp
dGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLSQoWkZTX1ZFUlNJT04p
CiBaRlNfTElDRU5TRSA9IENEREwKIFpGU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRSBDT1BZUklH
SFQKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKaW5kZXggZTVmNTUy
NmZhZi4uYjYzNmMxZjJhYSAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF96ZnMucHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96
ZnMucHkKQEAgLTEzLDcgKzEzLDcgQEAgY2xhc3MgVGVzdFpmc0dsaWJjKGluZnJhLmJhc2V0ZXN0
LkJSVGVzdCk6CiAgICAgICAgIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVE
RVY9eQogICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKICAgICAgICAgQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVkVSU0lPTj15Ci0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjUuMTAuMjMiCisgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjUuMTMuMiIKICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NP
TkZJRz15CiAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2Fy
ZC9xZW11L3g4Nl82NC9saW51eC5jb25maWciCiAgICAgICAgIEJSMl9QQUNLQUdFX1pGUz15CkBA
IC03MCw3ICs3MCw3IEBAIGNsYXNzIFRlc3RaZnNVY2xpYmMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0
KToKICAgICAgICAgQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15CiAg
ICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQogICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OPXkKLSAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iNS4xMC4yMyIKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iNS4xMy4yIgogICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkK
ICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3FlbXUv
eDg2XzY0L2xpbnV4LmNvbmZpZyIKICAgICAgICAgQlIyX1BBQ0tBR0VfWkZTPXkK
--000000000000a74f6205ca24d51a
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--000000000000a74f6205ca24d51a--
