Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4EAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 12:34:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF3A61260
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 12:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DF3A61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1620403A8;
	Tue, 19 Oct 2021 12:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlOfQ2Utok1p; Tue, 19 Oct 2021 12:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC4CC404DE;
	Tue, 19 Oct 2021 12:34:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8E401BF376
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 12:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7F8983592
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 12:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVyriBwOnW3I for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 12:34:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3B3583546
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 12:34:28 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id j3so400433ilr.6
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtq3GZUkzdPYV56R2E1X8zXwfyOZMohsgkCQsn3mokI=;
 b=q00McP2kuK+5XXZO7nzQGMX/jAIfv0qEs6Rm5NdTuaBluCvc3Pp0f+cwRV5MypXed2
 lNfTkNJXsuJJDdbMJKrxE6noWFwUvJ9zWUN6IJdCUzUbj/DKYQWFOWJShgFvT7evAUtM
 SPOuLMMHS97IdrDqvOLcnAJkAMdLRjd5wVdxqqHW6ZOq3Hbk/FcHrUnrbHCC6aZM3Nei
 v7seDmtSqu4r6Y2lh3psmPq1ZdyQmbLlZovWhkgp7KyQzQGe7+/OnPkFI11BqQaDLeMd
 uLwQ7rhydS6Pmc/VwBrtCsfKSgdRTLQxt6EPoaEfPMI73NTVbnghvLLeRirVWfZakBis
 XiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtq3GZUkzdPYV56R2E1X8zXwfyOZMohsgkCQsn3mokI=;
 b=EaiV/+lMCdmeyff48ExvjMR2Ltxim9FOoJ46/lfOhWeNpDni55a764XSm9NsQ9roid
 UAgLZ2G8QG+a06R9SLc5RG+HRbR1vR2YUKO5vatlDQ8ZbSE6lLdqJ06aO4kJr++hPv09
 75fn0n5e0rZejJ5m75PeIydvTfVUXo6WeIbqbX7gEmu5TOt4GV6pzadeLfZgq++3wAiR
 dEz1l0rdmHhmuuayGnzQUDzXOtjUB9kePyM/Dp23tvaAcmah+nTHkk/7+ZtTKz4j4tiK
 TbsNu3VlWX2cTkvOkrurYwsFiu4EVjolY5c72l0HYrXVf7frSwXCTkugNZaXpPZBsiD0
 a8+A==
X-Gm-Message-State: AOAM533EoTe/i9gZsg73HjPfWmU6Uk6Kt5wzXtV+tIpHh9gMRAiGj3nS
 +AeQuS+u8MW5DfWiKSQ8YB+Ev02PB3BHL8uE/QMidd5pi6f+
X-Google-Smtp-Source: ABdhPJyRoC/tM+4Bp/z59Tv7eIjrb2oXrgHaMLTHcgdAFy8WqxgaBZnDi0ytNLAj508AMFno3TPn/BKrl1itGZ5r4Uw=
X-Received: by 2002:a05:6e02:1a2d:: with SMTP id
 g13mr17957677ile.123.1634646867626; 
 Tue, 19 Oct 2021 05:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
 <1641d5624553f991bb7abf9808e6bf99@umbiko.net>
 <CA+eej5PtS6iCJ+W1b6W0mZXk-fQJcB1hhr20_D7cE=fja8NzTw@mail.gmail.com>
 <3f8142a1afd59acc55e141f2d8a95e66@umbiko.net>
In-Reply-To: <3f8142a1afd59acc55e141f2d8a95e66@umbiko.net>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Tue, 19 Oct 2021 16:34:19 +0200
Message-ID: <CA+eej5N4SBtyNcs-hUEsviA4X6wAk-XvqzmxkCVpiizzupm4FQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2675427818040448673=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2675427818040448673==
Content-Type: multipart/alternative; boundary="000000000000e0cec405ceb3e1f7"

--000000000000e0cec405ceb3e1f7
Content-Type: text/plain; charset="UTF-8"

so i have develop my kernel module and it is working very well.

there is my folder :

hello.c :

#include <linux/module.h>    // included for all kernel modules
#include <linux/kernel.h>    // included for KERN_INFO
#include <linux/init.h>      // included for __init and __exit macros

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Lakshmanan");
MODULE_DESCRIPTION("A Simple Hello World module");

static int __init hello_init(void)
{
    printk(KERN_INFO "Hello world!\n");
    return 0;    // Non-zero return means that the module couldn't be
loaded.
}

static void __exit hello_cleanup(void)
{
    printk(KERN_INFO "Cleaning up module.\n");
}

module_init(hello_init);
module_exit(hello_cleanup);

> Makefile :

obj-m += helloKernelModule.o
all:
make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

when i run make , it generate some files like hello.o , hello.ko , ...

> integrate the package into Buildroot (see comments below)

But , i'm not understanding very well when you said i integrate the package
on buildroot. Is it only the Makefile and the hello.c code or Makefile ,
hello.c code ,  hello.o , hello.ko , ... ?

> check if the package builds correctly within Buildroot and gets
deployed to target/lib/modules

Okay , i have put the project on one folder kernel_module_test in buildroot
tree

external.desc :

name: BR2_PACKAGE_KERNEL_MODULE_TEST

external.mk :

include $(sort $(wildcard $(BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/*/*.mk))

Config.in :

config BR2_PACKAGE_KERNEL_MODULE_TEST
        bool "kernel_module_test"
        depends on BR2_LINUX_KERNEL
        help
                Linux Kernel Module Cheat.

kernel_module_test.mk :

KERNEL_MODULE_VERSION = 1.0
KERNEL_MODULE_SITE =
$(BR2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/kernel_module_test
KERNEL_MODULE_SITE_METHOD = local
$(eval $(kernel_module_test))
$(eval $(generic-package))

As you can see , i want to use a BR2_EXTERNAL directory structure.

So i have make it by typing :

/buildroot# make BR2_EXTERNAL=kernel_module_test menuconfig

Go ahead into External Options , and fortunatly , i have see my package
inside, .. so i have saved it and exit.

After that i have type make.

 i have seen my package on output/build , looks like kernel_module_test
folder that contains some files.

Finaly , i have seen some files on
output/target/lib/modules/${BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE} but not
my module.

So i think that it means that my modules/package was not loaded and i can't
exploit it.

please where i have mistaken ??

--000000000000e0cec405ceb3e1f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>so i have develop my kernel module and it is working =
very well.</div><div><br></div><div>there is my folder :</div><div><br></di=
v><div>hello.c :</div><div><br></div><div>#include &lt;linux/module.h&gt; =
=C2=A0 =C2=A0// included for all kernel modules<br>#include &lt;linux/kerne=
l.h&gt; =C2=A0 =C2=A0// included for KERN_INFO<br>#include &lt;linux/init.h=
&gt; =C2=A0 =C2=A0 =C2=A0// included for __init and __exit macros<br><br><f=
ont size=3D"1"><span style=3D"font-family:arial narrow,sans-serif">MODULE_L=
ICENSE(&quot;GPL&quot;);<br>MODULE_AUTHOR(&quot;Lakshmanan&quot;);<br>MODUL=
E_DESCRIPTION(&quot;A Simple Hello World module&quot;);<br><br>static int _=
_init hello_init(void)<br>{<br>=C2=A0 =C2=A0 printk(KERN_INFO &quot;Hello w=
orld!\n&quot;);<br>=C2=A0 =C2=A0 return 0; =C2=A0 =C2=A0// Non-zero return =
means that the module couldn&#39;t be loaded.<br>}<br><br>static void __exi=
t hello_cleanup(void)<br>{<br>=C2=A0 =C2=A0 printk(KERN_INFO &quot;Cleaning=
 up module.\n&quot;);<br>}<br><br>module_init(hello_init);<br>module_exit(h=
ello_cleanup);</span></font></div><div><br></div><div>&gt; Makefile : <br><=
/div><div><br></div><div><font size=3D"1"><span style=3D"font-family:arial =
narrow,sans-serif">obj-m +=3D helloKernelModule.o<br>all:<br>	make -C /lib/=
modules/$(shell uname -r)/build M=3D$(PWD) modules<br><br>clean:<br>	make -=
C /lib/modules/$(shell uname -r)/build M=3D$(PWD) clean</span></font></div>=
<div><br></div><div>when i run make , it generate some files like hello.o ,=
 hello.ko , ...</div><div><br></div><div>&gt; integrate the package into Bu=
ildroot (see comments below)</div><div><br></div><div>But , i&#39;m not und=
erstanding very well when you said i integrate the package on buildroot. Is=
 it only the Makefile and the hello.c code or Makefile , hello.c code ,=C2=
=A0 hello.o , hello.ko , ... ?<br></div><div><br></div><div>&gt; check if t=
he package builds correctly within Buildroot and gets <br>
deployed to target/lib/modules</div><div><br></div><div>Okay , i have put t=
he project on one folder kernel_module_test in buildroot tree<br></div><div=
><br></div><div>external.desc :</div><div><br></div><div><font size=3D"1"><=
span style=3D"font-family:arial narrow,sans-serif">name: BR2_PACKAGE_KERNEL=
_MODULE_TEST</span></font></div><div><br></div><div><a href=3D"http://exter=
nal.mk">external.mk</a> :</div><div><br></div><div><font size=3D"1"><span s=
tyle=3D"font-family:arial narrow,sans-serif">include $(sort $(wildcard $(BR=
2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/*/*.mk))</span></font></div><div><br></=
div><div>Config.in :</div><div><br></div><div><font size=3D"1"><span style=
=3D"font-family:arial narrow,sans-serif">config BR2_PACKAGE_KERNEL_MODULE_T=
EST<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;kernel_module_test&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_LINUX_KERNEL<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 help<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Linux Kernel Module Cheat.</span></font></div><div><br></div><div><a hr=
ef=3D"http://kernel_module_test.mk">kernel_module_test.mk</a> :</div><div><=
font size=3D"1"><span style=3D"font-family:arial narrow,sans-serif"><br></s=
pan></font></div><div><font size=3D"1"><span style=3D"font-family:arial nar=
row,sans-serif">KERNEL_MODULE_VERSION =3D 1.0<br>KERNEL_MODULE_SITE =3D $(B=
R2_EXTERNAL_KERNEL_MODULE_TEST_PATH)/kernel_module_test<br>KERNEL_MODULE_SI=
TE_METHOD =3D local<br>$(eval $(kernel_module_test))<br>$(eval $(generic-pa=
ckage))</span></font></div><div><br></div><div>As you can see , i want to u=
se a BR2_EXTERNAL directory structure.</div><div><br></div><div>So i have m=
ake it by typing :</div><div><br></div><div><pre class=3D"gmail-screen">/bu=
ildroot# make BR2_EXTERNAL=3Dkernel_module_test menuconfig</pre></div><div>=
Go ahead into External Options , and fortunatly , i have see my package ins=
ide, .. so i have saved it and exit.</div><div><br></div><div>After that i =
have type <font size=3D"1"><span style=3D"font-family:arial narrow,sans-ser=
if">make</span></font>.</div><div><br></div><div>=C2=A0i have seen my packa=
ge on output/build , looks like kernel_module_test folder that contains som=
e files.</div><div><br></div><div><div>Finaly , i have seen some files on o=
utput/target/lib/modules/${BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE} but not m=
y module.<br></div><div><br></div><div>So i think that it means that my mod=
ules/package was not loaded and i can&#39;t exploit it.</div><div><br></div=
><div>please where i have mistaken ??<br></div></div></div>

--000000000000e0cec405ceb3e1f7--

--===============2675427818040448673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2675427818040448673==--
