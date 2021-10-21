Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BBBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 08:52:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD51161038
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 08:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD51161038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F1F083AE8;
	Thu, 21 Oct 2021 08:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01kEHarJ5GME; Thu, 21 Oct 2021 08:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2629F83AEA;
	Thu, 21 Oct 2021 08:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF7471BF40E
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 08:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D84BB407BA
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 08:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBqXJty2VdxJ for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 08:51:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3371840498
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 08:51:58 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id a8so24990563ilj.10
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSoYO2Hd/g39vu84jVxuB+LDiNatEJGKkE9hWfvIv10=;
 b=nDLaAx/nmzrA6Wpsz3JFSNRF/MsCeA3ZnFk+7WREvLCS6qzZ+D+0jI25ZnWFE/Qf9I
 v3Pwyi3kTScDnxuxSsR2DYApflnHwJRHO3xNDXN1mPh3x/C6Wg+HfdyYfLTULZ/L3LmN
 o/vpNB8obuA5r16uk9nEhSJNZLP6hBuW65MNFw2Ts4x5hORt8xq5VT7VOj4E6HL7phxu
 e3NL3b42aLAP2xvPO8U2JN3CyketZKKnqav5Y80yyElxSTC6VBXDfi97c2riie/uJAM5
 5smiHeBxjkmzCPqHtYco5kd83g5qyArdfCZpkpDf1pxSxYxTI5OfwZyJn3d6LjqRg9q/
 N9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSoYO2Hd/g39vu84jVxuB+LDiNatEJGKkE9hWfvIv10=;
 b=zB849J8ummNKXQIln8aYBzZfpsWdKA99PPjv1NFaOAO3S0BsWQ4e2SFjONVmA0fwCP
 zQWJL6QtAMxbV6gHHNfjElvGX52ZZGqZQToBDxsC5dfYm+0I2sanMhvW281d9VeSf+AV
 wiFWdSfWalutflzd+uWINltdsN2emdB/w6cJoK9KQFhwjdTtbDHUgFwzdrpfprHJqd2i
 ESZojDHzVbMOQ77hD+uSG4jvG7eElZj79tY2uxkCUuEMxB/3Sar8VzdchOdxFFtwB7bk
 HUVcP6FQS9Vwdy2NwLDS/Cp3p0QBj3v4EpHmGEMqc77CzJKNL0q9EI/3wQpYp+vJ5dmo
 VxQQ==
X-Gm-Message-State: AOAM531/It8iCeC/CT12UviRtIHrm1F84WRqbfuBlpOu8sEYs9Xh2/mp
 lJQw6nkAE6CGwWPtdeaxlLYfMyiQ7r9ur9oKjQ==
X-Google-Smtp-Source: ABdhPJwgFJEJniu0euqvqxuHFOFgxnXibdKcGCQG7qRHZFOR2YrYJM0VcNz3C9zPEbddBVOo5o1rqZNxPS4VINP5ICo=
X-Received: by 2002:a05:6e02:1aa5:: with SMTP id
 l5mr2577416ilv.268.1634806317196; 
 Thu, 21 Oct 2021 01:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
 <1641d5624553f991bb7abf9808e6bf99@umbiko.net>
 <CA+eej5PtS6iCJ+W1b6W0mZXk-fQJcB1hhr20_D7cE=fja8NzTw@mail.gmail.com>
 <3f8142a1afd59acc55e141f2d8a95e66@umbiko.net>
 <CA+eej5N4SBtyNcs-hUEsviA4X6wAk-XvqzmxkCVpiizzupm4FQ@mail.gmail.com>
 <c194f15a324b57b85e12c06b21dda4fd@umbiko.net>
 <CA+eej5O8-SgiWzvPYd4YOGGTL_r87iNvy1VFVgmXb00_drvWhg@mail.gmail.com>
 <568e5010d412f9f5412f4a0e7afa2fd9@umbiko.net>
In-Reply-To: <568e5010d412f9f5412f4a0e7afa2fd9@umbiko.net>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Thu, 21 Oct 2021 12:51:56 +0200
Message-ID: <CA+eej5MVoigQn_PpDRAa76O78M2VrOStCjoHt-upO9qaxEVnzg@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
Subject: Re: [Buildroot] how can i implement my kernel module and debug it
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6389936807367432865=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6389936807367432865==
Content-Type: multipart/alternative; boundary="000000000000d028c905ced901cb"

--000000000000d028c905ced901cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thank you very much all of you.
It is working very well now .

So there is the kernel_module_test.mk :

KERNEL_MODULE_TEST_VERSION =3D 1.0
KERNEL_MODULE_TEST_SITE =3D kernel_module_test
KERNEL_MODULE_TEST_SITE_METHOD =3D local
$(eval $(kernel-module))
$(eval $(generic-package))

there is the output :

>>> kernel_module_test 1.0 Syncing from source dir kernel_module_test
rsync -au --chmod=3Du=3DrwX,go=3DrX  --exclude .svn --exclude .git --exclud=
e .hg
--exclude .bzr --exclude CVS kernel_module_test/
/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0
>>> kernel_module_test 1.0 Configuring
>>> kernel_module_test 1.0 Building
>>> kernel_module_test 1.0 Building kernel module(s)
PATH=3D"/home/ledoux/Documents/buildroot/output/host/bin:/home/ledoux/Docum=
ents/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/u=
sr/bin:/sbin:/bin:/usr/local/games:/usr/games"
PKG_CONFIG=3D"/home/ledoux/Documents/buildroot/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
PKG_CONFIG_LIBDIR=3D"/home/ledoux/Documents/buildroot/output/host/lib/pkgco=
nfig:/home/ledoux/Documents/buildroot/output/host/share/pkgconfig"
BR_BINARIES_DIR=3D/home/ledoux/Documents/buildroot/output/images
KCFLAGS=3D-Wno-attribute-alias /usr/bin/make -j3 -C
/home/ledoux/Documents/buildroot/output/build/linux-5.10.73
HOSTCC=3D"/usr/bin/gcc -O2
-I/home/ledoux/Documents/buildroot/output/host/include
-L/home/ledoux/Documents/buildroot/output/host/lib
-Wl,-rpath,/home/ledoux/Documents/buildroot/output/host/lib" ARCH=3Dx86_64
INSTALL_MOD_PATH=3D/home/ledoux/Documents/buildroot/output/target
CROSS_COMPILE=3D"/home/ledoux/Documents/buildroot/output/host/bin/x86_64-bu=
ildroot-linux-uclibc-"
DEPMOD=3D/home/ledoux/Documents/buildroot/output/host/sbin/depmod
INSTALL_MOD_STRIP=3D1
 PWD=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0=
/.
M=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/.
modules
make[1] : on entre dans le r=C3=A9pertoire
=C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB
  CC [M]
 /home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./hel=
lo.o
  LD [M]
 /home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./Hel=
loKernelModule.o
  MODPOST
/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./Modu=
le.symvers
  CC [M]
 /home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./Hel=
loKernelModule.mod.o
  LD [M]
 /home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./Hel=
loKernelModule.ko
make[1] : on quitte le r=C3=A9pertoire
=C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB
>>> kernel_module_test 1.0 Installing to target
>>> kernel_module_test 1.0 Installing kernel module(s)
PATH=3D"/home/ledoux/Documents/buildroot/output/host/bin:/home/ledoux/Docum=
ents/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/u=
sr/bin:/sbin:/bin:/usr/local/games:/usr/games"
PKG_CONFIG=3D"/home/ledoux/Documents/buildroot/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
PKG_CONFIG_LIBDIR=3D"/home/ledoux/Documents/buildroot/output/host/lib/pkgco=
nfig:/home/ledoux/Documents/buildroot/output/host/share/pkgconfig"
BR_BINARIES_DIR=3D/home/ledoux/Documents/buildroot/output/images
KCFLAGS=3D-Wno-attribute-alias /usr/bin/make -j3 -C
/home/ledoux/Documents/buildroot/output/build/linux-5.10.73
HOSTCC=3D"/usr/bin/gcc -O2
-I/home/ledoux/Documents/buildroot/output/host/include
-L/home/ledoux/Documents/buildroot/output/host/lib
-Wl,-rpath,/home/ledoux/Documents/buildroot/output/host/lib" ARCH=3Dx86_64
INSTALL_MOD_PATH=3D/home/ledoux/Documents/buildroot/output/target
CROSS_COMPILE=3D"/home/ledoux/Documents/buildroot/output/host/bin/x86_64-bu=
ildroot-linux-uclibc-"
DEPMOD=3D/home/ledoux/Documents/buildroot/output/host/sbin/depmod
INSTALL_MOD_STRIP=3D1
 PWD=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0=
/.
M=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/.
modules_install
make[1] : on entre dans le r=C3=A9pertoire
=C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB
  INSTALL
/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./Hell=
oKernelModule.ko
  DEPMOD  5.10.73
make[1] : on quitte le r=C3=A9pertoire
=C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB

the module.dep file :

kernel/drivers/char/hw_random/rng-core.ko:
kernel/drivers/char/hw_random/intel-rng.ko:
kernel/drivers/char/hw_random/rng-core.ko
kernel/drivers/char/hw_random/amd-rng.ko:
kernel/drivers/char/hw_random/rng-core.ko
kernel/drivers/char/hw_random/via-rng.ko:
kernel/drivers/char/hw_random/rng-core.ko
kernel/drivers/char/hw_random/virtio-rng.ko:
kernel/drivers/char/hw_random/rng-core.ko
kernel/drivers/thermal/intel/x86_pkg_temp_thermal.ko:
extra/HelloKernelModule.ko:

And there output/build/kernel_module_test-1.0 :

buildroot/output/build/kernel_module_test-1.0#  ls -la
total 148
drwxr-xr-x  2 root root  4096 21 oct.  12:38 .
drwxr-xr-x 57 root root  4096 21 oct.  12:38 ..
-rwxr-xr-x  1 root root   164 21 oct.  12:19 Config.in
-rwxr-xr-x  1 root root    25 21 oct.  08:03 external.desc
-rwxr-xr-x  1 root root    49 19 oct.  20:58 external.mk
-rw-r--r--  1 root root     0 21 oct.  12:38 .files-list-host.txt
-rw-r--r--  1 root root     0 21 oct.  12:38 .files-list-staging.txt
-rw-r--r--  1 root root   652 21 oct.  12:38 .files-list.txt
-rwxr-xr-x  1 root root   266 16 oct.  13:19 hello.c
-rw-r--r--  1 root root  3696 21 oct.  12:38 HelloKernelModule.ko
-rw-r--r--  1 root root   525 21 oct.  12:38 .HelloKernelModule.ko.cmd
-rw-r--r--  1 root root    80 21 oct.  12:38 HelloKernelModule.mod
-rw-r--r--  1 root root   534 21 oct.  12:38 HelloKernelModule.mod.c
-rw-r--r--  1 root root   292 21 oct.  12:38 .HelloKernelModule.mod.cmd
-rw-r--r--  1 root root  2648 21 oct.  12:38 HelloKernelModule.mod.o
-rw-r--r--  1 root root 30656 21 oct.  12:38 .HelloKernelModule.mod.o.cmd
-rw-r--r--  1 root root  1864 21 oct.  12:38 HelloKernelModule.o
-rw-r--r--  1 root root   372 21 oct.  12:38 .HelloKernelModule.o.cmd
-rw-r--r--  1 root root  1672 21 oct.  12:38 hello.o
-rw-r--r--  1 root root 29282 21 oct.  12:38 .hello.o.cmd
-rwxr-xr-x  1 root root   169 21 oct.  12:21 kernel_module_test.mk
-rwxr-xr-x  1 root root   296 21 oct.  12:28 Makefile
-rw-r--r--  1 root root    92 21 oct.  12:38 modules.order
-rw-r--r--  1 root root   306 21 oct.  12:38 .modules.order.cmd
-rw-r--r--  1 root root     0 21 oct.  12:38 Module.symvers
-rw-r--r--  1 root root   337 21 oct.  12:38 .Module.symvers.cmd
-rw-r--r--  1 root root     0 21 oct.  12:38 .stamp_built
-rw-r--r--  1 root root     0 21 oct.  12:38 .stamp_configured
-rw-r--r--  1 root root     0 21 oct.  12:38 .stamp_installed
-rw-r--r--  1 root root     0 21 oct.  12:38 .stamp_rsynced
-rw-r--r--  1 root root     0 21 oct.  12:38 .stamp_target_installed

I' so happy.
thank you for all again , ...

Le jeu. 21 oct. 2021 =C3=A0 08:41, Andreas Ziegler <br015@umbiko.net> a =C3=
=A9crit :

> Hi Esa=C3=AFe,
>
> check the variables in kernel_module_test.mk. They need to be prefixed
> with KERNEL_MODULE_TEST.
>
> On 2021-10-21 07:58, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> > Okay ...
> > I think I have a new form of error, I think it is while compiling.
> >
> > buildroot# make kernel_module_test-dirclean
> > rm -Rf
> > /home/ledoux/Documents/buildroot/output/build/kernel_module_test
> >
> > /buildroot# make
> >>>> kernel_module_test  Extracting
> >>>> kernel_module_test  Patching
> >>>> kernel_module_test  Configuring
> >>>> kernel_module_test  Building
> >>>> kernel_module_test  Building kernel module(s)
> >
> PATH=3D"/home/ledoux/Documents/buildroot/output/host/bin:/home/ledoux/Doc=
uments/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:=
/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"
> > PKG_CONFIG=3D"/home/ledoux/Documents/buildroot/output/host/bin/pkg-conf=
ig"
> > PKG_CONFIG_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1
> > PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1
> >
> PKG_CONFIG_LIBDIR=3D"/home/ledoux/Documents/buildroot/output/host/lib/pkg=
config:/home/ledoux/Documents/buildroot/output/host/share/pkgconfig"
> > BR_BINARIES_DIR=3D/home/ledoux/Documents/buildroot/output/images
> > KCFLAGS=3D-Wno-attribute-alias /usr/bin/make -j3 -C
> > /home/ledoux/Documents/buildroot/output/build/linux-5.10.73
> > HOSTCC=3D"/usr/bin/gcc -O2
> > -I/home/ledoux/Documents/buildroot/output/host/include
> > -L/home/ledoux/Documents/buildroot/output/host/lib
> > -Wl,-rpath,/home/ledoux/Documents/buildroot/output/host/lib"
> > ARCH=3Dx86_64
> > INSTALL_MOD_PATH=3D/home/ledoux/Documents/buildroot/output/target
> >
> CROSS_COMPILE=3D"/home/ledoux/Documents/buildroot/output/host/bin/x86_64-=
buildroot-linux-uclibc-"
> > DEPMOD=3D/home/ledoux/Documents/buildroot/output/host/sbin/depmod
> > INSTALL_MOD_STRIP=3D1
> > PWD=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test/=
.
> > M=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test/.
> > modules
> > make[1] : on entre dans le r=C3=A9pertoire =C2=AB
> > /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB
> > scripts/Makefile.build:44:
> >
> /home/ledoux/Documents/buildroot/output/build/kernel_module_test/./Makefi=
le:
> > Aucun fichier ou dossier de ce type
> > make[2]: *** Aucune r=C3=A8gle pour fabriquer la cible =C2=AB
> >
> /home/ledoux/Documents/buildroot/output/build/kernel_module_test/./Makefi=
le
> > =C2=BB. Arr=C3=AAt.
> > make[1]: *** [Makefile:1822 :
> > /home/ledoux/Documents/buildroot/output/build/kernel_module_test/.]
> > Erreur 2
> > make[1] : on quitte le r=C3=A9pertoire =C2=AB
> > /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB
> > make: *** [package/pkg-generic.mk:295 [4] :
> >
> /home/ledoux/Documents/buildroot/output/build/kernel_module_test/.stamp_b=
uilt]
> > Erreur 2
>
> <cut>
>
> Kind regards,
> Andreas
>

--000000000000d028c905ced901cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>thank you very much all of you.</div><div>It is worki=
ng very well now .</div><div><br></div><div>So there is the <a href=3D"http=
://kernel_module_test.mk">kernel_module_test.mk</a> :</div><div><br></div><=
div><font size=3D"1"><span style=3D"font-family:arial narrow,sans-serif">KE=
RNEL_MODULE_TEST_VERSION =3D 1.0<br>KERNEL_MODULE_TEST_SITE =3D kernel_modu=
le_test<br>KERNEL_MODULE_TEST_SITE_METHOD =3D local<br>$(eval $(kernel-modu=
le))<br>$(eval $(generic-package))</span></font></div><div><br></div><div>t=
here is the output :</div><div><br></div><div><font size=3D"1"><span style=
=3D"font-family:arial narrow,sans-serif">&gt;&gt;&gt; kernel_module_test 1.=
0 Syncing from source dir kernel_module_test<br>rsync -au --chmod=3Du=3DrwX=
,go=3DrX =C2=A0--exclude .svn --exclude .git --exclude .hg --exclude .bzr -=
-exclude CVS kernel_module_test/ /home/ledoux/Documents/buildroot/output/bu=
ild/kernel_module_test-1.0<br>&gt;&gt;&gt; kernel_module_test 1.0 Configuri=
ng<br>&gt;&gt;&gt; kernel_module_test 1.0 Building<br>&gt;&gt;&gt; kernel_m=
odule_test 1.0 Building kernel module(s)<br>PATH=3D&quot;/home/ledoux/Docum=
ents/buildroot/output/host/bin:/home/ledoux/Documents/buildroot/output/host=
/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/loc=
al/games:/usr/games&quot; PKG_CONFIG=3D&quot;/home/ledoux/Documents/buildro=
ot/output/host/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; =
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CON=
FIG_LIBDIR=3D&quot;/home/ledoux/Documents/buildroot/output/host/lib/pkgconf=
ig:/home/ledoux/Documents/buildroot/output/host/share/pkgconfig&quot; BR_BI=
NARIES_DIR=3D/home/ledoux/Documents/buildroot/output/images KCFLAGS=3D-Wno-=
attribute-alias /usr/bin/make -j3 -C /home/ledoux/Documents/buildroot/outpu=
t/build/linux-5.10.73 HOSTCC=3D&quot;/usr/bin/gcc -O2 -I/home/ledoux/Docume=
nts/buildroot/output/host/include -L/home/ledoux/Documents/buildroot/output=
/host/lib -Wl,-rpath,/home/ledoux/Documents/buildroot/output/host/lib&quot;=
 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D/home/ledoux/Documents/buildroot/output/t=
arget CROSS_COMPILE=3D&quot;/home/ledoux/Documents/buildroot/output/host/bi=
n/x86_64-buildroot-linux-uclibc-&quot; DEPMOD=3D/home/ledoux/Documents/buil=
droot/output/host/sbin/depmod INSTALL_MOD_STRIP=3D1 =C2=A0PWD=3D/home/ledou=
x/Documents/buildroot/output/build/kernel_module_test-1.0/. M=3D/home/ledou=
x/Documents/buildroot/output/build/kernel_module_test-1.0/. modules<br>make=
[1]=C2=A0: on entre dans le r=C3=A9pertoire =C2=AB=C2=A0/home/ledoux/Docume=
nts/buildroot/output/build/linux-5.10.73=C2=A0=C2=BB<br>=C2=A0 CC [M] =C2=
=A0/home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./h=
ello.o<br>=C2=A0 LD [M] =C2=A0/home/ledoux/Documents/buildroot/output/build=
/kernel_module_test-1.0/./HelloKernelModule.o<br>=C2=A0 MODPOST /home/ledou=
x/Documents/buildroot/output/build/kernel_module_test-1.0/./Module.symvers<=
br>=C2=A0 CC [M] =C2=A0/home/ledoux/Documents/buildroot/output/build/kernel=
_module_test-1.0/./HelloKernelModule.mod.o<br>=C2=A0 LD [M] =C2=A0/home/led=
oux/Documents/buildroot/output/build/kernel_module_test-1.0/./HelloKernelMo=
dule.ko<br>make[1]=C2=A0: on quitte le r=C3=A9pertoire =C2=AB=C2=A0/home/le=
doux/Documents/buildroot/output/build/linux-5.10.73=C2=A0=C2=BB<br>&gt;&gt;=
&gt; kernel_module_test 1.0 Installing to target<br>&gt;&gt;&gt; kernel_mod=
ule_test 1.0 Installing kernel module(s)<br>PATH=3D&quot;/home/ledoux/Docum=
ents/buildroot/output/host/bin:/home/ledoux/Documents/buildroot/output/host=
/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/loc=
al/games:/usr/games&quot; PKG_CONFIG=3D&quot;/home/ledoux/Documents/buildro=
ot/output/host/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; =
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CON=
FIG_LIBDIR=3D&quot;/home/ledoux/Documents/buildroot/output/host/lib/pkgconf=
ig:/home/ledoux/Documents/buildroot/output/host/share/pkgconfig&quot; BR_BI=
NARIES_DIR=3D/home/ledoux/Documents/buildroot/output/images KCFLAGS=3D-Wno-=
attribute-alias /usr/bin/make -j3 -C /home/ledoux/Documents/buildroot/outpu=
t/build/linux-5.10.73 HOSTCC=3D&quot;/usr/bin/gcc -O2 -I/home/ledoux/Docume=
nts/buildroot/output/host/include -L/home/ledoux/Documents/buildroot/output=
/host/lib -Wl,-rpath,/home/ledoux/Documents/buildroot/output/host/lib&quot;=
 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D/home/ledoux/Documents/buildroot/output/t=
arget CROSS_COMPILE=3D&quot;/home/ledoux/Documents/buildroot/output/host/bi=
n/x86_64-buildroot-linux-uclibc-&quot; DEPMOD=3D/home/ledoux/Documents/buil=
droot/output/host/sbin/depmod INSTALL_MOD_STRIP=3D1 =C2=A0PWD=3D/home/ledou=
x/Documents/buildroot/output/build/kernel_module_test-1.0/. M=3D/home/ledou=
x/Documents/buildroot/output/build/kernel_module_test-1.0/. modules_install=
<br>make[1]=C2=A0: on entre dans le r=C3=A9pertoire =C2=AB=C2=A0/home/ledou=
x/Documents/buildroot/output/build/linux-5.10.73=C2=A0=C2=BB<br>=C2=A0 INST=
ALL /home/ledoux/Documents/buildroot/output/build/kernel_module_test-1.0/./=
HelloKernelModule.ko<br>=C2=A0 DEPMOD =C2=A05.10.73<br>make[1]=C2=A0: on qu=
itte le r=C3=A9pertoire =C2=AB=C2=A0/home/ledoux/Documents/buildroot/output=
/build/linux-5.10.73=C2=A0=C2=BB</span></font><br></div><div><br></div><div=
>the module.dep file :</div><div><br></div><div><font size=3D"1"><span styl=
e=3D"font-family:arial narrow,sans-serif">kernel/drivers/char/hw_random/rng=
-core.ko:<br>kernel/drivers/char/hw_random/intel-rng.ko: kernel/drivers/cha=
r/hw_random/rng-core.ko<br>kernel/drivers/char/hw_random/amd-rng.ko: kernel=
/drivers/char/hw_random/rng-core.ko<br>kernel/drivers/char/hw_random/via-rn=
g.ko: kernel/drivers/char/hw_random/rng-core.ko<br>kernel/drivers/char/hw_r=
andom/virtio-rng.ko: kernel/drivers/char/hw_random/rng-core.ko<br>kernel/dr=
ivers/thermal/intel/x86_pkg_temp_thermal.ko:<br>extra/HelloKernelModule.ko:=
</span></font></div><div><br></div><div>And there output/build/kernel_modul=
e_test-1.0 :</div><div><br></div><div><font size=3D"1"><span style=3D"font-=
family:arial narrow,sans-serif">buildroot/output/build/kernel_module_test-1=
.0# =C2=A0ls -la<br>total 148<br>drwxr-xr-x =C2=A02 root root =C2=A04096 21=
 oct. =C2=A012:38 .<br>drwxr-xr-x 57 root root =C2=A04096 21 oct. =C2=A012:=
38 ..<br>-rwxr-xr-x =C2=A01 root root =C2=A0 164 21 oct. =C2=A012:19 Config=
.in<br>-rwxr-xr-x =C2=A01 root root =C2=A0 =C2=A025 21 oct. =C2=A008:03 ext=
ernal.desc<br>-rwxr-xr-x =C2=A01 root root =C2=A0 =C2=A049 19 oct. =C2=A020=
:58 <a href=3D"http://external.mk">external.mk</a><br>-rw-r--r-- =C2=A01 ro=
ot root =C2=A0 =C2=A0 0 21 oct. =C2=A012:38 .files-list-host.txt<br>-rw-r--=
r-- =C2=A01 root root =C2=A0 =C2=A0 0 21 oct. =C2=A012:38 .files-list-stagi=
ng.txt<br>-rw-r--r-- =C2=A01 root root =C2=A0 652 21 oct. =C2=A012:38 .file=
s-list.txt<br>-rwxr-xr-x =C2=A01 root root =C2=A0 266 16 oct. =C2=A013:19 h=
ello.c<br>-rw-r--r-- =C2=A01 root root =C2=A03696 21 oct. =C2=A012:38 Hello=
KernelModule.ko<br>-rw-r--r-- =C2=A01 root root =C2=A0 525 21 oct. =C2=A012=
:38 .HelloKernelModule.ko.cmd<br>-rw-r--r-- =C2=A01 root root =C2=A0 =C2=A0=
80 21 oct. =C2=A012:38 HelloKernelModule.mod<br>-rw-r--r-- =C2=A01 root roo=
t =C2=A0 534 21 oct. =C2=A012:38 HelloKernelModule.mod.c<br>-rw-r--r-- =C2=
=A01 root root =C2=A0 292 21 oct. =C2=A012:38 .HelloKernelModule.mod.cmd<br=
>-rw-r--r-- =C2=A01 root root =C2=A02648 21 oct. =C2=A012:38 HelloKernelMod=
ule.mod.o<br>-rw-r--r-- =C2=A01 root root 30656 21 oct. =C2=A012:38 .HelloK=
ernelModule.mod.o.cmd<br>-rw-r--r-- =C2=A01 root root =C2=A01864 21 oct. =
=C2=A012:38 HelloKernelModule.o<br>-rw-r--r-- =C2=A01 root root =C2=A0 372 =
21 oct. =C2=A012:38 .HelloKernelModule.o.cmd<br>-rw-r--r-- =C2=A01 root roo=
t =C2=A01672 21 oct. =C2=A012:38 hello.o<br>-rw-r--r-- =C2=A01 root root 29=
282 21 oct. =C2=A012:38 .hello.o.cmd<br>-rwxr-xr-x =C2=A01 root root =C2=A0=
 169 21 oct. =C2=A012:21 <a href=3D"http://kernel_module_test.mk">kernel_mo=
dule_test.mk</a><br>-rwxr-xr-x =C2=A01 root root =C2=A0 296 21 oct. =C2=A01=
2:28 Makefile<br>-rw-r--r-- =C2=A01 root root =C2=A0 =C2=A092 21 oct. =C2=
=A012:38 modules.order<br>-rw-r--r-- =C2=A01 root root =C2=A0 306 21 oct. =
=C2=A012:38 .modules.order.cmd<br>-rw-r--r-- =C2=A01 root root =C2=A0 =C2=
=A0 0 21 oct. =C2=A012:38 Module.symvers<br>-rw-r--r-- =C2=A01 root root =
=C2=A0 337 21 oct. =C2=A012:38 .Module.symvers.cmd<br>-rw-r--r-- =C2=A01 ro=
ot root =C2=A0 =C2=A0 0 21 oct. =C2=A012:38 .stamp_built<br>-rw-r--r-- =C2=
=A01 root root =C2=A0 =C2=A0 0 21 oct. =C2=A012:38 .stamp_configured<br>-rw=
-r--r-- =C2=A01 root root =C2=A0 =C2=A0 0 21 oct. =C2=A012:38 .stamp_instal=
led<br>-rw-r--r-- =C2=A01 root root =C2=A0 =C2=A0 0 21 oct. =C2=A012:38 .st=
amp_rsynced<br>-rw-r--r-- =C2=A01 root root =C2=A0 =C2=A0 0 21 oct. =C2=A01=
2:38 .stamp_target_installed</span></font><br></div><div><br></div><div>I&#=
39; so happy.</div><div>thank you for all again , ...</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 21 =
oct. 2021 =C3=A0=C2=A008:41, Andreas Ziegler &lt;<a href=3D"mailto:br015@um=
biko.net">br015@umbiko.net</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hi Esa=C3=AFe,<br>
<br>
check the variables in <a href=3D"http://kernel_module_test.mk" rel=3D"nore=
ferrer" target=3D"_blank">kernel_module_test.mk</a>. They need to be prefix=
ed <br>
with KERNEL_MODULE_TEST.<br>
<br>
On 2021-10-21 07:58, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:<br>
&gt; Okay ...<br>
&gt; I think I have a new form of error, I think it is while compiling.<br>
&gt; <br>
&gt; buildroot# make kernel_module_test-dirclean<br>
&gt; rm -Rf<br>
&gt; /home/ledoux/Documents/buildroot/output/build/kernel_module_test<br>
&gt; <br>
&gt; /buildroot# make<br>
&gt;&gt;&gt;&gt; kernel_module_test=C2=A0 Extracting<br>
&gt;&gt;&gt;&gt; kernel_module_test=C2=A0 Patching<br>
&gt;&gt;&gt;&gt; kernel_module_test=C2=A0 Configuring<br>
&gt;&gt;&gt;&gt; kernel_module_test=C2=A0 Building<br>
&gt;&gt;&gt;&gt; kernel_module_test=C2=A0 Building kernel module(s)<br>
&gt; PATH=3D&quot;/home/ledoux/Documents/buildroot/output/host/bin:/home/le=
doux/Documents/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/u=
sr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games&quot;<br>
&gt; PKG_CONFIG=3D&quot;/home/ledoux/Documents/buildroot/output/host/bin/pk=
g-config&quot;<br>
&gt; PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=
=3D1<br>
&gt; PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1<br>
&gt; PKG_CONFIG_LIBDIR=3D&quot;/home/ledoux/Documents/buildroot/output/host=
/lib/pkgconfig:/home/ledoux/Documents/buildroot/output/host/share/pkgconfig=
&quot;<br>
&gt; BR_BINARIES_DIR=3D/home/ledoux/Documents/buildroot/output/images<br>
&gt; KCFLAGS=3D-Wno-attribute-alias /usr/bin/make -j3 -C<br>
&gt; /home/ledoux/Documents/buildroot/output/build/linux-5.10.73<br>
&gt; HOSTCC=3D&quot;/usr/bin/gcc -O2<br>
&gt; -I/home/ledoux/Documents/buildroot/output/host/include<br>
&gt; -L/home/ledoux/Documents/buildroot/output/host/lib<br>
&gt; -Wl,-rpath,/home/ledoux/Documents/buildroot/output/host/lib&quot;<br>
&gt; ARCH=3Dx86_64<br>
&gt; INSTALL_MOD_PATH=3D/home/ledoux/Documents/buildroot/output/target<br>
&gt; CROSS_COMPILE=3D&quot;/home/ledoux/Documents/buildroot/output/host/bin=
/x86_64-buildroot-linux-uclibc-&quot;<br>
&gt; DEPMOD=3D/home/ledoux/Documents/buildroot/output/host/sbin/depmod<br>
&gt; INSTALL_MOD_STRIP=3D1<br>
&gt; PWD=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test=
/.<br>
&gt; M=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test/.=
<br>
&gt; modules<br>
&gt; make[1] : on entre dans le r=C3=A9pertoire =C2=AB<br>
&gt; /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB<br>
&gt; scripts/Makefile.build:44:<br>
&gt; /home/ledoux/Documents/buildroot/output/build/kernel_module_test/./Mak=
efile:<br>
&gt; Aucun fichier ou dossier de ce type<br>
&gt; make[2]: *** Aucune r=C3=A8gle pour fabriquer la cible =C2=AB<br>
&gt; /home/ledoux/Documents/buildroot/output/build/kernel_module_test/./Mak=
efile<br>
&gt; =C2=BB. Arr=C3=AAt.<br>
&gt; make[1]: *** [Makefile:1822 :<br>
&gt; /home/ledoux/Documents/buildroot/output/build/kernel_module_test/.]<br=
>
&gt; Erreur 2<br>
&gt; make[1] : on quitte le r=C3=A9pertoire =C2=AB<br>
&gt; /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB<br>
&gt; make: *** [package/<a href=3D"http://pkg-generic.mk:295" rel=3D"norefe=
rrer" target=3D"_blank">pkg-generic.mk:295</a> [4] :<br>
&gt; /home/ledoux/Documents/buildroot/output/build/kernel_module_test/.stam=
p_built]<br>
&gt; Erreur 2<br>
<br>
&lt;cut&gt;<br>
<br>
Kind regards,<br>
Andreas<br>
</blockquote></div>

--000000000000d028c905ced901cb--

--===============6389936807367432865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6389936807367432865==--
