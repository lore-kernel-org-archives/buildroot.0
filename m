From: Courousse, Damien <damien.courousse@logica.com>
Date: Wed, 29 Jul 2009 15:34:33 +0200
Subject: [Buildroot] linux .config : override: reassigning to symbolAEABI
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	<20090729132515.GM19257@buzzloop.caiaq.de>
Message-ID: <F81DF98CADE6064F81A746D7C8323593782CAD@fr-ex009.groupinfra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark, 

Thanks much for your help,

...
> > Looking up port of RPC 100003/2 on 10.84.34.52 Looking up port of 
> > RPC 100005/1 on 10.84.34.52
> > VFS: Mounted root (nfs filesystem).
> > Freeing init memory: 116K
> > Kernel panic - not syncing: Attempted to kill init!
> > ================================================================
> 
> That smells like an ABI confusion, yes.
> 
...
> > ================================================================
> 
> Building an OABI toolchain for an EABI kernel doesn't make sense, 
> hence the configs are brought in sync by buildroot.
> target/linux/Makefile.in.advanced is where it happens, and it AEABI 
> should not be set in the kernel config unless BR2_ARM_EABI is set. 
> Could you double check?
[Damien Courouss?] 

target/linux/Makefile.in.advanced contains the following: 
$(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.config
	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config ifeq ($(BR2_ARM_EABI),y)
	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config else

... and my configuration files look fine to me:
$ make saveconfig
(...)
$ cd local/logica_demo/
$ grep ABI *
linux-2.6.28.config:CONFIG_SLABINFO=y
linux-2.6.28.config:# CONFIG_AEABI is not set linux-2.6.28.config:# CONFIG_SECURITY_FILE_CAPABILITIES is not set logica_demo.config:BR2_ARM_OABI=y logica_demo.config:# BR2_ARM_EABI is not set logica_demo.config:BR2_GCC_TARGET_ABI="apcs-gnu"
uclibc-0.9.30.1.config:CONFIG_ARM_OABI=y
uclibc-0.9.30.1.config:# CONFIG_ARM_EABI is not set

... and the toolchain looks OK too : 
$ ls -l $( which arm-linux-gcc)
lrwxrwxrwx 1 damien damien 20 jui 29 14:58 /mnt/fractal/buildroot/buildroot-2009.05/build_arm/staging_dir/usr/bin/arm-linux-gcc -> arm-linux-uclibc-gcc

Do you see something else to check?

Best regards,
Damien



Please help Logica to respect the environment by not printing this email  / Pour contribuer comme Logica au respect de l'environnement, merci de ne pas imprimer ce mail /  Bitte drucken Sie diese Nachricht nicht aus und helfen Sie so Logica dabei, die Umwelt zu sch?tzen /  Por favor ajude a Logica a respeitar o ambiente nao imprimindo este correio electronico.



This e-mail and any attachment is for authorised use by the intended recipient(s) only. It may contain proprietary material, confidential information and/or be subject to legal privilege. It should not be copied, disclosed to, retained or used by, any other party. If you are not an intended recipient then please promptly delete this e-mail and any attachment and all copies and inform the sender. Thank you.
