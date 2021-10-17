Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624F8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:45:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87BF61152
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A87BF61152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79192607FE;
	Sun, 17 Oct 2021 09:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lctCSaDjkBZp; Sun, 17 Oct 2021 09:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18956077C;
	Sun, 17 Oct 2021 09:45:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D055D1BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC54A403A5
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXHJ2KLa_ElP for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:45:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19FD04039E
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:45:33 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id C01E2C649FE4;
 Sun, 17 Oct 2021 11:45:31 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 17 Oct 2021 09:45:31 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Esa?e Ledoux NJONGSSI KOUAM <kouamdoux@gmail.com>
In-Reply-To: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
References: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1641d5624553f991bb7abf9808e6bf99@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Esaie,

On 2021-10-17 09:13, Esa?e Ledoux NJONGSSI KOUAM <kouamdoux@gmail.com> 
wrote:

> Hi everyone .
> Sorry for the inconvenience , ...
> 
> I want to know how to load my kernel module, run it see these traces 
> using
> dmesg and debug it.
> 

Buildroot is essentially a deployment tool, not a development 
infrastructure. You do need a working package to be able to integrate 
it.

Preferably, you do this step-by-step:

-- develop your kernel module, make sure it compiles and works correctly 
in your development environment
-- integrate the package into Buildroot (see comments below)
-- check if the package builds correctly within Buildroot and gets 
deployed to target/lib/modules
-- test on target hardware

> So , i have read this part of the  (manual
> <https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules>)
> , but i don't know how to use it :
> 
> | What you may have noticed is that, unlike other package 
> infrastructures,
> we | explicitly invoke a second infrastructure. This allows a package 
> to
> build a kernel | module, but also, if needed, use any one of other 
> package
> infrastructures to | build normal userland components (libraries,
> executables?). Using the kernel-module infrastructure on its own is not
> sufficient; another package infrastructure *must* be used.

This means that a 'normal' build infrastructure (make, cmake, etc.) has 
to be used; you covered this by using "generic-package" and providing a 
(project) make file.

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
> KERNEL_MODULE_VERSION = 1.0
> KERNEL_MODULE_SITE = $(BR2_EXTERNAL_KERNEL_MODULE_PATH)
> KERNEL_MODULE_SITE_METHOD = local
> $(eval $(kernel-module))
> $(eval $(generic-package))

This file has the same name as your package: "kernel-module.mk". Do not 
mix Buildroot configuration (BR2_EXTERNAL) and development project; 
provide a path to your source directory in KERNEL_MODULE_SITE.

If you want to use a BR2_EXTERNAL directory structure, some more work is 
necessary; see [1]. It will be easier to install your configuration in 
the Buildroot tree; in that case, all of these files go into the 
Buildroot package directory, inside a directory named "kernel-module". 
Edit "package/Config.in" and add your package under a convenient menu 
heading.

The files below go into your project directory, the one that is 
referenced by $KERNEL_MODULE_SITE

> - Makefile
> 
> obj-m += $(addsuffix .o, $(notdir $(basename $(wildcard
> $(BR2_EXTERNAL_KERNEL_MODULE_PATH)/*.c))))
> ccflags-y := -DDEBUG -g -std=gnu99 -Wno-declaration-after-statement
> 
> .PHONY: all clean
> 
> all:
>     $(MAKE) -C '$(LINUX_DIR)' M='$(PWD)' modules
> 
> clean:
>     $(MAKE) -C '$(LINUX_DIR)' M='$(PWD)' clean

Do not use Buildroot specific variables in your project makefile. 
Variables should be initialized. You are missing a modules_install 
target, see [2].

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
> make BR2_EXTERNAL="$(pwd)/../kernel_module" qemu_x86_64_defconfig
> echo 'BR2_PACKAGE_KERNEL_MODULE=y' >> .config
> make BR2_JLEVEL="$(($(nproc) - 2))" all
> qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive
> file=output/images/rootfs.ext2,if=virtio,format=raw -append
> root=/dev/vda -net nic,model=virtio -net user

If you plan to use BR2_EXTERNAL, provide all necessary files.
make <defconfig> needs to be run only once, to create a configuration. 
The configuration persists, until you modify it with "make 
{menu,n}config" or you call "make distclean". For the different 
configuration editors, see [3].

Start the config editor, select your package, exit and save. Afterwards 
start the build process:
$ make nconfig
$ make

> On qemu :
> 
> modprobe hello
> modprobe: module hello not found in modules.dep

The module has not been built and is not present on the target system.

> how can i solve it ??
> 
> please i need your help

Kind regards,
Andreas

[1] https://buildroot.org/downloads/manual/manual.html#outside-br-custom
[2] 
https://www.kernel.org/doc/html/latest/kbuild/modules.html?highlight=modules%20symvers
[3] 
https://buildroot.org/downloads/manual/manual.html#_buildroot_quick_start
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
