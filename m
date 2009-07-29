From: Courousse, Damien <damien.courousse@logica.com>
Date: Wed, 29 Jul 2009 15:59:18 +0200
Subject: [Buildroot] linux .config : override: reassigning tosymbolAEABI
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	<20090729132515.GM19257@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CAC@fr-ex009.groupinfra.com>
	<20090729134234.GY13236@buzzloop.caiaq.de>
Message-ID: <F81DF98CADE6064F81A746D7C8323593782CB2@fr-ex009.groupinfra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> -----Message d'origine-----
> De?: Daniel Mack [mailto:daniel at caiaq.de]
> Envoy??: mercredi 29 juillet 2009 15:43
> ??: Courousse, Damien
> Cc?: buildroot at uclibc.org
> Objet?: Re: [Buildroot] linux .config : override: reassigning
> tosymbolAEABI
> 
> (please keep the mailing list copied - I'm not your personal supporter,
> and others might be interested in that, too.)
> 
> On Wed, Jul 29, 2009 at 03:32:52PM +0200, Courousse, Damien wrote:
> > > Building an OABI toolchain for an EABI kernel doesn't make sense,
> hence
> > > the configs are brought in sync by buildroot.
> > > target/linux/Makefile.in.advanced is where it happens, and it AEABI
> > > should not be set in the kernel config unless BR2_ARM_EABI is set.
> Could
> > > you double check?
> > [Damien Courouss?]
> >
> > target/linux/Makefile.in.advanced contains the following:
> > $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.config
> > 	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
> > ifeq ($(BR2_ARM_EABI),y)
> > 	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
> > 	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
> > 	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config
> > else
> 
> Could you check that this condition is met by adding an echo debug in
> there?
[Damien Courouss?] 
Here are the results - EABI is not set: 
rm -rf /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/buildroot-config
mkdir -p /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo
cp -dpRf package/config/buildroot-config /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/buildroot-config
/mnt/fractal/buildroot/buildroot-2009.05/toolchain_build_arm/bin/sed -i -e '/CONFIG_AEABI=y/d' /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28/.config
echo "-- TEST -- BR2_ARM_EABI is not SET"
-- TEST -- BR2_ARM_EABI is not SET
echo "# CONFIG_AEABI is not set" >> /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28/.config
/mnt/fractal/buildroot/buildroot-2009.05/toolchain_build_arm/bin/sed -i -e '/CONFIG_IPV6=y/d' /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28/.config

Maybe I was fooled but the message : "override: reassigning to symbol AEABI". I tought it means that the EABI symbol is set to "y", but it might only mean that the symbol was overridden, with no assumption about the final value!
And actually, in my case, as BR2_ARM_EABI is not set, the kernel config EABI symbol is overridden, but with the same value, i.e. it is not set.
However it does not explain the kernel panic.

> 
> > ... and my configuration files look fine to me:
> > $ make saveconfig
> > (...)
> > $ cd local/logica_demo/
> > $ grep ABI *
> > linux-2.6.28.config:CONFIG_SLABINFO=y
> > linux-2.6.28.config:# CONFIG_AEABI is not set
> > linux-2.6.28.config:# CONFIG_SECURITY_FILE_CAPABILITIES is not set
> > logica_demo.config:BR2_ARM_OABI=y
> > logica_demo.config:# BR2_ARM_EABI is not set
> > logica_demo.config:BR2_GCC_TARGET_ABI="apcs-gnu"
> > uclibc-0.9.30.1.config:CONFIG_ARM_OABI=y
> > uclibc-0.9.30.1.config:# CONFIG_ARM_EABI is not set
> 
> And what does your $(LINUX26_DIR)/.config look like afterwards? Is EABI
> set in there? 
[Damien Courouss?] 
Here are the contents of the $(LINUX26_DIR)/.config file - EABI is not present.
$ cd project_build_arm/logica_demo/linux
$ grep ABI .config
CONFIG_SLABINFO=y
# CONFIG_AEABI is not set
# CONFIG_SECURITY_FILE_CAPABILITIES is not set

Damien


Please help Logica to respect the environment by not printing this email  / Pour contribuer comme Logica au respect de l'environnement, merci de ne pas imprimer ce mail /  Bitte drucken Sie diese Nachricht nicht aus und helfen Sie so Logica dabei, die Umwelt zu sch?tzen /  Por favor ajude a Logica a respeitar o ambiente nao imprimindo este correio electronico.



This e-mail and any attachment is for authorised use by the intended recipient(s) only. It may contain proprietary material, confidential information and/or be subject to legal privilege. It should not be copied, disclosed to, retained or used by, any other party. If you are not an intended recipient then please promptly delete this e-mail and any attachment and all copies and inform the sender. Thank you.
