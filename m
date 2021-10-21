Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C586CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 05:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A5C610A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 05:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7A5C610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B80B4062C;
	Thu, 21 Oct 2021 05:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HItaiRpcCSRa; Thu, 21 Oct 2021 05:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF824066D;
	Thu, 21 Oct 2021 05:58:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 004031BF2B6
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 05:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E374E83AD3
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 05:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRiXHrn0ZjFn for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 05:58:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54A8483AD1
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 05:58:23 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 188so27476220iou.12
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 22:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQhy6zMNtrnkucjh7WB9TdeDr+NOxlj7eHbY+2uiqes=;
 b=TheJY/hM1LSkSJeYHzPLsQl3cj+M5Hqm85YgY2SjKaGUTZG9zQK8IZIWebsAdpA//O
 LyAcTVZToY5ZiKDspfqj7dR5YWrNxp47chTBBB+PongfRXtTK5jNyhawxmJKYNu7J1ep
 ZlRfpBlnK1f5ui9J5Y/W4rMDtFu/gQERmM8kNd7CJdfizuYlabGDkI473Sm3uSJ4FtDF
 3xOf/cUKJCc60LVCVf/bI1CUYJ19It8CW0+Ir+n2pCQX1qG4KatNHnmC054qgKvihfiD
 w6zZpfHLdmltsxtK1pzowdbXPcqInouiQ0x5kocbeD/iS2kUaN/WFI2tDs+6mdwpiZWC
 ajWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQhy6zMNtrnkucjh7WB9TdeDr+NOxlj7eHbY+2uiqes=;
 b=m9B7hZkI+IjLpqT2LJExn2wd6/u1YS2q0wkg5ajUDV6/VqRNyJehzyj2JAxV/IFlDt
 tPVoXsJHM9hDXcpxeO2OzV1xsUg1b51v8LKTGgpEEBQlvTGaZRWJrGmFH0V5tEI5PjFy
 fQTBByh6SHFpnROodNJwlP6/PAoNWwNLaPpVoeLtr5BFumicbGYf72ayXgqIMA88ZLwc
 G3iO+p6Zvt8e3iiD/UZDOsRzYXE/0Pr84DHqa+k5VMvwh1bXbNTnkHsmCRqMRevkwFnH
 h1Dzc3THo4M36u4kl1p6a6wyGapoWbb738kDwOQbWuhyVvqviI47jnT4btHqz+R2dtiY
 iZAQ==
X-Gm-Message-State: AOAM530P+Cr+wHnknVk7MfNzO9DnBdXeCEgD98QfmB+GMt7eIKxvFTQG
 tDRd2h6RfTa9hSyW900b/o5AEwIiYKDm4IWLc5bgFQ2/rtPI
X-Google-Smtp-Source: ABdhPJxfvsNbFEG1imVvpaiPGjHW/NH2ZmQOSTvePF3Yr68/BJ9GI9PTsNmkd4oWSktZve1FxGM6UYDU3MSYppl0eq0=
X-Received: by 2002:a6b:fe05:: with SMTP id x5mr2625743ioh.201.1634795902370; 
 Wed, 20 Oct 2021 22:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
 <1641d5624553f991bb7abf9808e6bf99@umbiko.net>
 <CA+eej5PtS6iCJ+W1b6W0mZXk-fQJcB1hhr20_D7cE=fja8NzTw@mail.gmail.com>
 <3f8142a1afd59acc55e141f2d8a95e66@umbiko.net>
 <CA+eej5N4SBtyNcs-hUEsviA4X6wAk-XvqzmxkCVpiizzupm4FQ@mail.gmail.com>
 <c194f15a324b57b85e12c06b21dda4fd@umbiko.net>
In-Reply-To: <c194f15a324b57b85e12c06b21dda4fd@umbiko.net>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Thu, 21 Oct 2021 09:58:21 +0200
Message-ID: <CA+eej5O8-SgiWzvPYd4YOGGTL_r87iNvy1VFVgmXb00_drvWhg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8218519780445777219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8218519780445777219==
Content-Type: multipart/alternative; boundary="0000000000000a893a05ced6956b"

--0000000000000a893a05ced6956b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay ...
I think I have a new form of error, I think it is while compiling.

buildroot# make kernel_module_test-dirclean
rm -Rf /home/ledoux/Documents/buildroot/output/build/kernel_module_test

/buildroot# make
>>> kernel_module_test  Extracting
>>> kernel_module_test  Patching
>>> kernel_module_test  Configuring
>>> kernel_module_test  Building
>>> kernel_module_test  Building kernel module(s)
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
 PWD=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test/.
M=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test/. modu=
les
make[1] : on entre dans le r=C3=A9pertoire
=C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB
scripts/Makefile.build:44:
/home/ledoux/Documents/buildroot/output/build/kernel_module_test/./Makefile=
:
Aucun fichier ou dossier de ce type
make[2]: *** Aucune r=C3=A8gle pour fabriquer la cible
=C2=AB /home/ledoux/Documents/buildroot/output/build/kernel_module_test/./M=
akefile
=C2=BB.
Arr=C3=AAt.
make[1]: *** [Makefile:1822 :
/home/ledoux/Documents/buildroot/output/build/kernel_module_test/.] Erreur =
2
make[1] : on quitte le r=C3=A9pertoire
=C2=AB /home/ledoux/Documents/buildroot/output/build/linux-5.10.73 =C2=BB
make: *** [package/pkg-generic.mk:295 :
/home/ledoux/Documents/buildroot/output/build/kernel_module_test/.stamp_bui=
lt]
Erreur 2


however here is what is inside the files:

Config.in :

config BR2_PACKAGE_KERNEL_MODULE_TEST
        bool "kernel_module_test"
        depends on BR2_LINUX_KERNEL
        help
                Linux Kernel Module Cheat.

Makefile :

obj-m :=3D HelloKernelModule.o
HelloKernelModule-objs :=3D hello.o

MAKE :=3D make
KSRC :=3D /lib/modules/$(shell uname -r)/build/
SRC :=3D $(shell pwd)

modules:
        $(MAKE) -C $(KSRC) M=3D$(SRC) modules

modules_install:
        $(MAKE) -C $(KSRC) M=3D$(SRC) modules_install

clean:
        $(MAKE) -C $(KSRC) M=3D$(SRC) clean

external.desc :

name: KERNEL_MODULE_TEST

kernel_module_test.mk :

KERNEL_MODULE_VERSION =3D 1.0
KERNEL_MODULE_SITE =3D
$(BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/kernel_module_test
KERNEL_MODULE_SITE_METHOD =3D local
$(eval $(kernel-module))
$(eval $(generic-package))

I'm not understanding very well that compilation error??
Where is it coming from ??

Le mer. 20 oct. 2021 =C3=A0 08:17, Andreas Ziegler <br015@umbiko.net> a =C3=
=A9crit :

> Hi Esa=C3=AFe,
>
> TL;DR: Main problem is probably the one Arnout mentioned. Fix
> external.desc, kernel-module-test.mk and Makefile; in that order.
>
> There are still some inconsistencies in your configuration, see remarks
> below.
>
> Stick to '-' (dash) in file names and '_' (underscore) in (k)config
> variables. The Linux kernel uses the same convention.
>
> On 2021-10-19 14:34, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> > so i have develop my kernel module and it is working very well.
> >
> > there is my folder :
> >
> > hello.c :
> >
> > #include <linux/module.h>    // included for all kernel modules
> > #include <linux/kernel.h>    // included for KERN_INFO
> > #include <linux/init.h>      // included for __init and __exit macros
> >
> > MODULE_LICENSE("GPL");
> > MODULE_AUTHOR("Lakshmanan");
> > MODULE_DESCRIPTION("A Simple Hello World module");
> >
> > static int __init hello_init(void)
> > {
> >     printk(KERN_INFO "Hello world!\n");
> >     return 0;    // Non-zero return means that the module couldn't be
> > loaded.
> > }
> >
> > static void __exit hello_cleanup(void)
> > {
> >     printk(KERN_INFO "Cleaning up module.\n");
> > }
> >
> > module_init(hello_init);
> > module_exit(hello_cleanup);
> >
> >> Makefile :
> >
> > obj-m +=3D helloKernelModule.o
> > all:
> > make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) modules
> >
> > clean:
> > make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) clean
> >
> > when i run make , it generate some files like hello.o , hello.ko , ...
>
> This Makefile is broken, and will also not work correctly when run from
> inside the Buildroot environment: the syntax is incorrect, there is no
> rule how to make helloKernelModule.o from hello.c, you have an absolute
> reference to your host kernel, which is different from the one Buildroot
> uses.
>
> Introduce variables that work on your development machine, but can be
> overridden by Buildroot:
>
> obj-m :=3D HelloKernelModule.o
> HelloKernelModule-objs :=3D hello.o
>
> MAKE :=3D make
> KSRC :=3D /lib/modules/$(shell uname -r)/build/
> SRC :=3D $(shell pwd)
>
> modules:
>         $(MAKE) -C $(KSRC) M=3D$(SRC) modules
>
> modules_install:
>         $(MAKE) -C $(KSRC) M=3D$(SRC) modules_install
>
> clean:
>         $(MAKE) -C $(KSRC) M=3D$(SRC) clean
>
> >> integrate the package into Buildroot (see comments below)
> >
> > But , i'm not understanding very well when you said i integrate the
> > package on buildroot. Is it only the Makefile and the hello.c code or
> > Makefile , hello.c code ,  hello.o , hello.ko , ... ?
>
> None of these. Your project is distinct; Buildroot sees it only as a
> source code package - a tarball that you download from the internet.
> Buildroot integration means defining where the source code can be found
> and what to to with it (Config.in and kernel-module-test.mk).
>
> >> check if the package builds correctly within Buildroot and gets
> > deployed to target/lib/modules
> >
> > Okay , i have put the project on one folder kernel_module_test in
> > buildroot tree
> >
> > external.desc :
> >
> > name: BR2_PACKAGE_KERNEL_MODULE_TEST
>
> This is not a Buildroot variable, but something that you define. So call
> it just KERNEL_MODULE_TEST. The string defined here will be inserted
> between 'BR2_EXTERNAL_' and '_PATH' ...
>
> > external.mk [1] :
> >
> > include $(sort $(wildcard
> > $(BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/*/*.mk))
>
> BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH is undefined and expands to an
> empty string. This probably works only because the files are located
> inside the buildroot tree. Should work correctly, once you fix 'name' in
> external.desc.
>
> > Config.in :
> >
> > config BR2_PACKAGE_KERNEL_MODULE_TEST
> >         bool "kernel_module_test"
> >         depends on BR2_LINUX_KERNEL
> >         help
> >                 Linux Kernel Module Cheat.
> >
> > kernel_module_test.mk [2] :
> >
> > KERNEL_MODULE_VERSION =3D 1.0
> > KERNEL_MODULE_SITE =3D
> > $(BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/kernel_module_test
> > KERNEL_MODULE_SITE_METHOD =3D local
> > $(eval $(kernel_module_test))
> > $(eval $(generic-package))
>
> You renamed the project to KERNEL_MODULE_TEST. You must also do this to
> the variables in the .mk file. But do NOT rename $(eval
> $(kernel-module))!
>
> > As you can see , i want to use a BR2_EXTERNAL directory structure.
> >
> > So i have make it by typing :
> >
> > /buildroot# make BR2_EXTERNAL=3Dkernel_module_test menuconfig
> >
> > Go ahead into External Options , and fortunatly , i have see my
> > package inside, .. so i have saved it and exit.
> >
> > After that i have type make.
> >
> >  i have seen my package on output/build , looks like
> > kernel_module_test folder that contains some files.
>
> Yes, but which files? They should be identical to the output of 'make'
> in the project folder. The important file is HelloKernelModule.ko.
>
> > Finaly , i have seen some files on
> > output/target/lib/modules/${BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE} but
> > not my module.
>
> Eventually you will have a folder 'extra' in target/lib/modules/$(uname
> -r), containing HelloKernelModule.ko. Also modules.dep will have a
> corresponding entry at the end.
>
> > So i think that it means that my modules/package was not loaded and i
> > can't exploit it.
> >
> > please where i have mistaken ??
> >
> >
> > Links:
> > ------
> > [1] http://external.mk
> > [2] http://kernel_module_test.mk
>
> Kind regards,
> Andreas
>

--0000000000000a893a05ced6956b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Okay ...</div><div>I think I have a new form of error=
, I think it is while compiling.</div><div><br></div><div><font size=3D"1">=
<span style=3D"font-family:arial narrow,sans-serif">buildroot# make kernel_=
module_test-dirclean</span></font><br><font size=3D"1"><span style=3D"font-=
family:arial narrow,sans-serif">rm -Rf /home/ledoux/Documents/buildroot/out=
put/build/kernel_module_test</span></font></div><div><br></div><div><font s=
ize=3D"1"><span style=3D"font-family:arial narrow,sans-serif">/buildroot# m=
ake<br>&gt;&gt;&gt; kernel_module_test =C2=A0Extracting<br>&gt;&gt;&gt; ker=
nel_module_test =C2=A0Patching<br>&gt;&gt;&gt; kernel_module_test =C2=A0Con=
figuring<br>&gt;&gt;&gt; kernel_module_test =C2=A0Building<br>&gt;&gt;&gt; =
kernel_module_test =C2=A0Building kernel module(s)<br>PATH=3D&quot;/home/le=
doux/Documents/buildroot/output/host/bin:/home/ledoux/Documents/buildroot/o=
utput/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bi=
n:/usr/local/games:/usr/games&quot; PKG_CONFIG=3D&quot;/home/ledoux/Documen=
ts/buildroot/output/host/bin/pkg-config&quot; PKG_CONFIG_SYSROOT_DIR=3D&quo=
t;/&quot; PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=
=3D1 PKG_CONFIG_LIBDIR=3D&quot;/home/ledoux/Documents/buildroot/output/host=
/lib/pkgconfig:/home/ledoux/Documents/buildroot/output/host/share/pkgconfig=
&quot; BR_BINARIES_DIR=3D/home/ledoux/Documents/buildroot/output/images KCF=
LAGS=3D-Wno-attribute-alias /usr/bin/make -j3 -C /home/ledoux/Documents/bui=
ldroot/output/build/linux-5.10.73 HOSTCC=3D&quot;/usr/bin/gcc -O2 -I/home/l=
edoux/Documents/buildroot/output/host/include -L/home/ledoux/Documents/buil=
droot/output/host/lib -Wl,-rpath,/home/ledoux/Documents/buildroot/output/ho=
st/lib&quot; ARCH=3Dx86_64 INSTALL_MOD_PATH=3D/home/ledoux/Documents/buildr=
oot/output/target CROSS_COMPILE=3D&quot;/home/ledoux/Documents/buildroot/ou=
tput/host/bin/x86_64-buildroot-linux-uclibc-&quot; DEPMOD=3D/home/ledoux/Do=
cuments/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=3D1 =C2=A0PWD=
=3D/home/ledoux/Documents/buildroot/output/build/kernel_module_test/. M=3D/=
home/ledoux/Documents/buildroot/output/build/kernel_module_test/. modules<b=
r>make[1]=C2=A0: on entre dans le r=C3=A9pertoire =C2=AB=C2=A0/home/ledoux/=
Documents/buildroot/output/build/linux-5.10.73=C2=A0=C2=BB<br>scripts/Makef=
ile.build:44: /home/ledoux/Documents/buildroot/output/build/kernel_module_t=
est/./Makefile: Aucun fichier ou dossier de ce type<br>make[2]: *** Aucune =
r=C3=A8gle pour fabriquer la cible =C2=AB=C2=A0/home/ledoux/Documents/build=
root/output/build/kernel_module_test/./Makefile=C2=A0=C2=BB. Arr=C3=AAt.<br=
>make[1]: *** [Makefile:1822 : /home/ledoux/Documents/buildroot/output/buil=
d/kernel_module_test/.] Erreur 2<br>make[1]=C2=A0: on quitte le r=C3=A9pert=
oire =C2=AB=C2=A0/home/ledoux/Documents/buildroot/output/build/linux-5.10.7=
3=C2=A0=C2=BB<br>make: *** [package/<a href=3D"http://pkg-generic.mk:295">p=
kg-generic.mk:295</a> : /home/ledoux/Documents/buildroot/output/build/kerne=
l_module_test/.stamp_built] Erreur 2</span></font><br></div><div><br></div>=
<div><br></div><div>however here is what is inside the files:</div><div><br=
></div><div>Config.in :</div><div><br></div><div><font size=3D"1"><span sty=
le=3D"font-family:arial narrow,sans-serif">config BR2_PACKAGE_KERNEL_MODULE=
_TEST<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;kernel_module_test&quot;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_LINUX_KERNEL<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 help<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Linux Kernel Module Cheat.</span></font></div><div><br></div><div>Makef=
ile :</div><div><br></div><div><font size=3D"1"><span style=3D"font-family:=
arial narrow,sans-serif">obj-m :=3D HelloKernelModule.o<br>HelloKernelModul=
e-objs :=3D hello.o<br><br>MAKE :=3D make<br>KSRC :=3D /lib/modules/$(shell=
 uname -r)/build/<br>SRC :=3D $(shell pwd)<br><br>modules:<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 $(MAKE) -C $(KSRC) M=3D$(SRC) modules<br><br>modules_install=
:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $(KSRC) M=3D$(SRC) modules_inst=
all<br><br>clean:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $(KSRC) M=3D$(S=
RC) clean</span></font></div><div><br></div><div>external.desc :</div><div>=
<br></div><div><font size=3D"1"><span style=3D"font-family:arial narrow,san=
s-serif">name: KERNEL_MODULE_TEST</span></font></div><div><br></div><div><a=
 href=3D"http://kernel_module_test.mk">kernel_module_test.mk</a> :</div><di=
v><br></div><div><font size=3D"1"><span style=3D"font-family:arial narrow,s=
ans-serif">KERNEL_MODULE_VERSION =3D 1.0<br>KERNEL_MODULE_SITE =3D $(BR2_EX=
TERNAL_KERNEL_MODULE_TEST_PATH)/kernel_module_test<br>KERNEL_MODULE_SITE_ME=
THOD =3D local<br>$(eval $(kernel-module))<br>$(eval $(generic-package))</s=
pan></font></div><div><font size=3D"1"><span style=3D"font-family:arial nar=
row,sans-serif"><br></span></font></div><div>I&#39;m not understanding very=
 well that compilation error??</div><div>Where is it coming from ??<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Le mer. 20 oct. 2021 =C3=A0 08:17, Andreas Ziegler &lt;<a href=3D"mailto:=
br015@umbiko.net" target=3D"_blank">br015@umbiko.net</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Esa=
=C3=AFe,<br>
<br>
TL;DR: Main problem is probably the one Arnout mentioned. Fix <br>
external.desc, <a href=3D"http://kernel-module-test.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">kernel-module-test.mk</a> and Makefile; in tha=
t order.<br>
<br>
There are still some inconsistencies in your configuration, see remarks <br=
>
below.<br>
<br>
Stick to &#39;-&#39; (dash) in file names and &#39;_&#39; (underscore) in (=
k)config <br>
variables. The Linux kernel uses the same convention.<br>
<br>
On 2021-10-19 14:34, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:<br>
&gt; so i have develop my kernel module and it is working very well.<br>
&gt; <br>
&gt; there is my folder :<br>
&gt; <br>
&gt; hello.c :<br>
&gt; <br>
&gt; #include &lt;linux/module.h&gt;=C2=A0 =C2=A0 // included for all kerne=
l modules<br>
&gt; #include &lt;linux/kernel.h&gt;=C2=A0 =C2=A0 // included for KERN_INFO=
<br>
&gt; #include &lt;linux/init.h&gt;=C2=A0 =C2=A0 =C2=A0 // included for __in=
it and __exit macros<br>
&gt; <br>
&gt; MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; MODULE_AUTHOR(&quot;Lakshmanan&quot;);<br>
&gt; MODULE_DESCRIPTION(&quot;A Simple Hello World module&quot;);<br>
&gt; <br>
&gt; static int __init hello_init(void)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0printk(KERN_INFO &quot;Hello world!\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 // Non-zero return means tha=
t the module couldn&#39;t be<br>
&gt; loaded.<br>
&gt; }<br>
&gt; <br>
&gt; static void __exit hello_cleanup(void)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0printk(KERN_INFO &quot;Cleaning up module.\n&quot;)=
;<br>
&gt; }<br>
&gt; <br>
&gt; module_init(hello_init);<br>
&gt; module_exit(hello_cleanup);<br>
&gt; <br>
&gt;&gt; Makefile :<br>
&gt; <br>
&gt; obj-m +=3D helloKernelModule.o<br>
&gt; all:<br>
&gt; make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) modules<br>
&gt; <br>
&gt; clean:<br>
&gt; make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) clean<br>
&gt; <br>
&gt; when i run make , it generate some files like hello.o , hello.ko , ...=
<br>
<br>
This Makefile is broken, and will also not work correctly when run from <br=
>
inside the Buildroot environment: the syntax is incorrect, there is no <br>
rule how to make helloKernelModule.o from hello.c, you have an absolute <br=
>
reference to your host kernel, which is different from the one Buildroot <b=
r>
uses.<br>
<br>
Introduce variables that work on your development machine, but can be <br>
overridden by Buildroot:<br>
<br>
obj-m :=3D HelloKernelModule.o<br>
HelloKernelModule-objs :=3D hello.o<br>
<br>
MAKE :=3D make<br>
KSRC :=3D /lib/modules/$(shell uname -r)/build/<br>
SRC :=3D $(shell pwd)<br>
<br>
modules:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $(KSRC) M=3D$(SRC) modules<br>
<br>
modules_install:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $(KSRC) M=3D$(SRC) modules_install<b=
r>
<br>
clean:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $(KSRC) M=3D$(SRC) clean<br>
<br>
&gt;&gt; integrate the package into Buildroot (see comments below)<br>
&gt; <br>
&gt; But , i&#39;m not understanding very well when you said i integrate th=
e<br>
&gt; package on buildroot. Is it only the Makefile and the hello.c code or<=
br>
&gt; Makefile , hello.c code ,=C2=A0 hello.o , hello.ko , ... ?<br>
<br>
None of these. Your project is distinct; Buildroot sees it only as a <br>
source code package - a tarball that you download from the internet. <br>
Buildroot integration means defining where the source code can be found <br=
>
and what to to with it (Config.in and <a href=3D"http://kernel-module-test.=
mk" rel=3D"noreferrer noreferrer" target=3D"_blank">kernel-module-test.mk</=
a>).<br>
<br>
&gt;&gt; check if the package builds correctly within Buildroot and gets<br=
>
&gt; deployed to target/lib/modules<br>
&gt; <br>
&gt; Okay , i have put the project on one folder kernel_module_test in<br>
&gt; buildroot tree<br>
&gt; <br>
&gt; external.desc :<br>
&gt; <br>
&gt; name: BR2_PACKAGE_KERNEL_MODULE_TEST<br>
<br>
This is not a Buildroot variable, but something that you define. So call <b=
r>
it just KERNEL_MODULE_TEST. The string defined here will be inserted <br>
between &#39;BR2_EXTERNAL_&#39; and &#39;_PATH&#39; ...<br>
<br>
&gt; <a href=3D"http://external.mk" rel=3D"noreferrer noreferrer" target=3D=
"_blank">external.mk</a> [1] :<br>
&gt; <br>
&gt; include $(sort $(wildcard<br>
&gt; $(BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/*/*.mk))<br>
<br>
BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH is undefined and expands to an <br>
empty string. This probably works only because the files are located <br>
inside the buildroot tree. Should work correctly, once you fix &#39;name&#3=
9; in <br>
external.desc.<br>
<br>
&gt; Config.in :<br>
&gt; <br>
&gt; config BR2_PACKAGE_KERNEL_MODULE_TEST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;kernel_module_test&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_LINUX_KERNEL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux Ker=
nel Module Cheat.<br>
&gt; <br>
&gt; <a href=3D"http://kernel_module_test.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">kernel_module_test.mk</a> [2] :<br>
&gt; <br>
&gt; KERNEL_MODULE_VERSION =3D 1.0<br>
&gt; KERNEL_MODULE_SITE =3D<br>
&gt; $(BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/kernel_module_test<br>
&gt; KERNEL_MODULE_SITE_METHOD =3D local<br>
&gt; $(eval $(kernel_module_test))<br>
&gt; $(eval $(generic-package))<br>
<br>
You renamed the project to KERNEL_MODULE_TEST. You must also do this to <br=
>
the variables in the .mk file. But do NOT rename $(eval <br>
$(kernel-module))!<br>
<br>
&gt; As you can see , i want to use a BR2_EXTERNAL directory structure.<br>
&gt; <br>
&gt; So i have make it by typing :<br>
&gt; <br>
&gt; /buildroot# make BR2_EXTERNAL=3Dkernel_module_test menuconfig<br>
&gt; <br>
&gt; Go ahead into External Options , and fortunatly , i have see my<br>
&gt; package inside, .. so i have saved it and exit.<br>
&gt; <br>
&gt; After that i have type make.<br>
&gt; <br>
&gt;=C2=A0 i have seen my package on output/build , looks like<br>
&gt; kernel_module_test folder that contains some files.<br>
<br>
Yes, but which files? They should be identical to the output of &#39;make&#=
39; <br>
in the project folder. The important file is HelloKernelModule.ko.<br>
<br>
&gt; Finaly , i have seen some files on<br>
&gt; output/target/lib/modules/${BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE} but=
<br>
&gt; not my module.<br>
<br>
Eventually you will have a folder &#39;extra&#39; in target/lib/modules/$(u=
name <br>
-r), containing HelloKernelModule.ko. Also modules.dep will have a <br>
corresponding entry at the end.<br>
<br>
&gt; So i think that it means that my modules/package was not loaded and i<=
br>
&gt; can&#39;t exploit it.<br>
&gt; <br>
&gt; please where i have mistaken ??<br>
&gt; <br>
&gt; <br>
&gt; Links:<br>
&gt; ------<br>
&gt; [1] <a href=3D"http://external.mk" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">http://external.mk</a><br>
&gt; [2] <a href=3D"http://kernel_module_test.mk" rel=3D"noreferrer norefer=
rer" target=3D"_blank">http://kernel_module_test.mk</a><br>
<br>
Kind regards,<br>
Andreas<br>
</blockquote></div>

--0000000000000a893a05ced6956b--

--===============8218519780445777219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8218519780445777219==--
