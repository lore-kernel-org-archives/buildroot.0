Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F01C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 15:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3022F6120A
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 15:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3022F6120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6BD3400C9;
	Sat, 16 Oct 2021 15:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ev_B-cKinzlx; Sat, 16 Oct 2021 15:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A295D4021A;
	Sat, 16 Oct 2021 15:21:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EB8D1BF3D2
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 15:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E683605E3
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 15:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwUIGO-z-DcI for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 15:21:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88CFE605D6
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 15:21:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id e144so11205666iof.3
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OB5l5Xg7BGl4Mdw5M+JAxaS7Lk4rNprM8qRdC4TLVn8=;
 b=qvZ5hUVC+Iz3qTYSxZGu2C42YYiPujtE+fhkyqE0Dlv35uEXQhlxyRSCgzkCUwOy05
 B2AHHWwADhAVE2dqvuOq9xMqi+B2jHaNC5Z8D0OVEaaRkMSO8zof7YxYMT0BuPEl1q2Q
 VSpuOeb6aM2IAA/nMmZr7FX5Ji+4qgSRFYqcVeRhGgJTVwV7pnGGWbBfc1bcn9R0tv5M
 nKEhBiFbOtYY7IWYxXIZkGBPm7Wj+aMFRVEJvxZl0KzO6rVnjvBHGUZRgrQgA3DTeiKW
 RcAEaA4CODOlPUczBxyUMFmiNeKjgFMMa6bWWJz3T0yMqWlVdDIewLWZA3VHAvkpAMO8
 ogFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OB5l5Xg7BGl4Mdw5M+JAxaS7Lk4rNprM8qRdC4TLVn8=;
 b=DLeoP90xVP5xzf5rjAWF5lCROMhBeD6MvL5fqWI6LXTfYnBCGTx70R67oYmTLPPQr9
 fnKRbxfl9eTDF8GkVLWd0Xw2p4zfrRbMPdm4EJRNfB8Ai81ZCPCtPy2gHSBtoqmQGsz+
 ZqSxDOKRjZoi9uiXJixiGwot+LSuH+obSMb3KTgUPWtq7wHozmiaLh4+xtH2gMjjQD8E
 IlqB+xaVJ5BPHpSlT0fvgUugBrtDFV/ZTEyeHKgZP+OjKqiEVh5ijkYVfVD5aW6bW07h
 pUDP53U2dXNN/fITana5Z/0sPAsUSZ0vOtC1tqWnLaNxWBoR0DgltcFX16vBYaexp6uv
 LxMA==
X-Gm-Message-State: AOAM531WSXf2iNLxRMXN2gzSPv3uhhHZR4grkdWgpwCErqGLepcpGg98
 88qLT81y23wNvdwWbLajYFOV6Kae5DmxXQJsr4WV/ZrmYXRZ
X-Google-Smtp-Source: ABdhPJwrhlaGf7eDz/RyLFMYuWaG0CXmN1T9t41v9+74qrWeViQgxUmQ62+grXaH87L/AvLu9mX+BWUntezjPHQH4Vc=
X-Received: by 2002:a02:cc8c:: with SMTP id s12mr12475101jap.0.1634397678397; 
 Sat, 16 Oct 2021 08:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eej5MX+5kes-LBQkjRVTFiEBm9N4TO5qyecu01vkT98fCYwg@mail.gmail.com>
In-Reply-To: <CA+eej5MX+5kes-LBQkjRVTFiEBm9N4TO5qyecu01vkT98fCYwg@mail.gmail.com>
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Sat, 16 Oct 2021 19:21:13 +0200
Message-ID: <CA+eej5PnUzNDcRr7VviHOzLsHbWfVWLkSRJQYG1Dvao70CJEPg@mail.gmail.com>
To: buildroot@buildroot.org
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
Content-Type: multipart/mixed; boundary="===============1542884672883891910=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1542884672883891910==
Content-Type: multipart/alternative; boundary="0000000000000aea1c05ce79dd28"

--0000000000000aea1c05ce79dd28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In another way , i have seen some kernel modules infrastructure with

git grep "(kernel-module)" -- package/

, but i don't know how to load each kernel module and trace it or debug it =
.

How it is possible ??

Le sam. 16 oct. 2021 =C3=A0 18:57, Esa=C3=AFe Ledoux NJONGSSI KOUAM <
kouamdoux@gmail.com> a =C3=A9crit :

> Hi everyone .
> Sorry for the inconvenience , ...
>
> I want to know how to load my kernel module, run it see these traces usin=
g
> dmesg and debug it.
>
> So , i have read this part of the  (manual
> <https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_p=
ackages_building_kernel_modules>)
> , but i don't know how to use it :
>
> | What you may have noticed is that, unlike other package infrastructures=
,
> we | explicitly invoke a second infrastructure. This allows a package to
> build a kernel | module, but also, if needed, use any one of other packag=
e
> infrastructures to | build normal userland components (libraries,
> executables=E2=80=A6). Using the kernel-module infrastructure on its own =
is not
> sufficient; another package infrastructure *must* be used.
>
> but in my way , i have try something :
>
> - Config.in
>
> config BR2_PACKAGE_KERNEL_MODULE
>         bool "kernel_module"
>         depends on BR2_LINUX_KERNEL
>         help
>                 Linux Kernel Module Cheat.
>
> - external.mk
>
> KERNEL_MODULE_VERSION =3D 1.0
> KERNEL_MODULE_SITE =3D $(BR2_EXTERNAL_KERNEL_MODULE_PATH)
> KERNEL_MODULE_SITE_METHOD =3D local
> $(eval $(kernel-module))
> $(eval $(generic-package))
>
> - Makefile
>
> obj-m +=3D $(addsuffix .o, $(notdir $(basename $(wildcard $(BR2_EXTERNAL_=
KERNEL_MODULE_PATH)/*.c))))
> ccflags-y :=3D -DDEBUG -g -std=3Dgnu99 -Wno-declaration-after-statement
>
> .PHONY: all clean
>
> all:
>     $(MAKE) -C '$(LINUX_DIR)' M=3D'$(PWD)' modules
>
> clean:
>     $(MAKE) -C '$(LINUX_DIR)' M=3D'$(PWD)' clean
>
> - hello.c
>
> #include <linux/module.h>#include <linux/kernel.h>
>
> MODULE_LICENSE("GPL");
> static int myinit(void)
> {
>     printk(KERN_INFO "hello init\n");
>     return 0;
> }
> static void myexit(void)
> {
>     printk(KERN_INFO "hello exit\n");
> }
>
> module_init(myinit)
> module_exit(myexit)
>
> And in the terminal :
>
> make BR2_EXTERNAL=3D"$(pwd)/../kernel_module" qemu_x86_64_defconfig
> echo 'BR2_PACKAGE_KERNEL_MODULE=3Dy' >> .config
> make BR2_JLEVEL=3D"$(($(nproc) - 2))" all
> qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=3Doutp=
ut/images/rootfs.ext2,if=3Dvirtio,format=3Draw -append root=3D/dev/vda -net=
 nic,model=3Dvirtio -net user
>
>
> On qemu :
>
> modprobe hello
> modprobe: module hello not found in modules.dep
>
> how can i solve it ??
>
> please i need your help
>
>
>

--0000000000000aea1c05ce79dd28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In another way , i have seen some kernel modules infr=
astructure with <br><pre class=3D"gmail-lang-c gmail-s-code-block"><code cl=
ass=3D"gmail-hljs gmail-language-c">git grep <span class=3D"gmail-hljs-stri=
ng">&quot;(kernel-module)&quot;</span> -- package/</code></pre> , but i don=
&#39;t know how to load each kernel module and trace it or debug it .</div>=
<div><br></div><div>How it is possible ??<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 16 oct. 202=
1 =C3=A0=C2=A018:57, Esa=C3=AFe Ledoux NJONGSSI KOUAM &lt;<a href=3D"mailto=
:kouamdoux@gmail.com">kouamdoux@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi e=
veryone .<br>Sorry for the inconvenience , ...<br><br><div>I want to know h=
ow to load my kernel module, run it see these traces using dmesg and debug =
it.</div><div><br></div><div>So , i have read this part of the=C2=A0 (<a hr=
ef=3D"https://buildroot.org/downloads/manual/manual.html#_infrastructure_fo=
r_packages_building_kernel_modules" target=3D"_blank">manual</a>) , but i d=
on&#39;t know how to use it :</div><div><br></div><div>| What you may have =
noticed is that, unlike other package infrastructures,
we | explicitly invoke a second infrastructure. This allows a package to
build a kernel | module, but also, if needed, use any one of other package
infrastructures to | build normal userland components (libraries,
executables=E2=80=A6). Using the <code>kernel-module</code> infrastructure =
on its own is
not sufficient; another package infrastructure <span><strong>must</strong><=
/span> be used.</div><div><br></div><div>but in my way , i have try somethi=
ng : <br></div><div><br></div><div>- Config.in</div><div><pre><code>config =
BR2_PACKAGE_KERNEL_MODULE
        <span>bool</span> <span>&quot;kernel_module&quot;</span>
        depends on BR2_LINUX_KERNEL
        help
                Linux Kernel Module Cheat.</code></pre></div><div>- <a href=
=3D"http://external.mk" target=3D"_blank">external.mk</a></div><div><br></d=
iv><div><pre><code>KERNEL_MODULE_VERSION =3D <span>1.0</span>
KERNEL_MODULE_SITE =3D $(BR2_EXTERNAL_KERNEL_MODULE_PATH)
KERNEL_MODULE_SITE_METHOD =3D local
$(eval $(kernel-module))
$(eval $(generic-package))<br><br>- Makefile<br><br><code>obj-m +=3D $(adds=
uffix .o, $(notdir $(basename $(wildcard $(BR2_EXTERNAL_KERNEL_MODULE_PATH)=
<span>/*.c))))
ccflags-y :=3D -DDEBUG -g -std=3Dgnu99 -Wno-declaration-after-statement

.PHONY: all clean

all:
    $(MAKE) -C &#39;$(LINUX_DIR)&#39; M=3D&#39;$(PWD)&#39; modules

clean:
    $(MAKE) -C &#39;$(LINUX_DIR)&#39; M=3D&#39;$(PWD)&#39; clean<br><br>- h=
ello.c<br><br><code><span>#<span>include</span> <span>&lt;linux/module.h&gt=
;</span></span>
<span>#<span>include</span> <span>&lt;linux/kernel.h&gt;</span></span>

MODULE_LICENSE(<span>&quot;GPL&quot;</span>);

<span>static</span> <span>int</span> <span>myinit</span><span>(<span>void</=
span>)</span>
{
    printk(KERN_INFO <span>&quot;hello init\n&quot;</span>);
    <span>return</span> <span>0</span>;
}

<span>static</span> <span>void</span> <span>myexit</span><span>(<span>void<=
/span>)</span>
{
    printk(KERN_INFO <span>&quot;hello exit\n&quot;</span>);
}

module_init(myinit)
module_exit(myexit)<br><br><code>And in the terminal : </code></code></span=
></code></code></pre></div><div><pre><code>make BR2_EXTERNAL=3D<span>&quot;=
$(pwd)/../kernel_module&quot;</span> qemu_x86_64_defconfig
echo <span>&#39;BR2_PACKAGE_KERNEL_MODULE=3Dy&#39;</span> &gt;&gt; .config
make BR2_JLEVEL=3D<span>&quot;$(($(nproc) - 2))&quot;</span> all
qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=3Doutput=
/images/rootfs.ext2,<span>if</span>=3Dvirtio,format=3Draw -append root=3D/d=
ev/vda -net nic,model=3Dvirtio -net user<br><br><br></code></pre><pre><code=
>On qemu :<br></code></pre><pre><code>modprobe hello<br>modprobe: module he=
llo not found in modules.dep<br><br></code></pre><pre><code>how can i solve=
 it ??<br></code></pre><pre><code>please i need your help<br></code></pre><=
pre><code><br></code></pre></div></div>
</blockquote></div>

--0000000000000aea1c05ce79dd28--

--===============1542884672883891910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1542884672883891910==--
