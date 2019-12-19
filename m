From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2019 12:11:07 +0100
Subject: [Buildroot] [PATCH v3 for-next 00/11] gitlab Qemu runtime
 testing
In-Reply-To: <99a9e061-7fca-c7c0-683b-49845067ba8f@mind.be> (Arnout
 Vandecappelle's message of "Wed, 18 Dec 2019 23:50:53 +0100")
References: <20191117201909.12900-1-romain.naour@smile.fr>
 <4ae261dd-e9f5-0212-eafd-c642c21d27bf@smile.fr>
 <99a9e061-7fca-c7c0-683b-49845067ba8f@mind.be>
Message-ID: <87k16s4lkk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I discussed about this series with Jeremy and he suggest to add the Qemu command
 >> line into the Qemu's defconfig file (add a new Kconfig option).
 >> With that, we can even add a new Makefile target "make run-qemu" to start Qemu
 >> when the Qemu command line is set in the defconfig (this would avoid adding
 >> several launch.sh script).

 > So something like

 > config BR2_PACKAGE_HOST_QEMU_LAUNCH_ARGS
 > 	string "qemu launch command"
 > 	help
 > 	  Command to launch qemu. If this is defined, 'make run-qemu' can be
 > 	  used to build everything and launch qemu.


 > HOST_QEMU_LAUNCH_ARGS = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_LAUNCH_ARGS))
 > ifneq ($(HOST_QEMU_LAUNCH_ARGS),)
 > run-qemu: world
 > 	$(Q)$(HOST_QEMU) <kernel args> <rootfs args> $(HOST_QEMU_LAUNCH_ARGS)
 > endif

 > Looks like a good idea indeed!

Cute. The kernel arguments (-kernel path/to/kernel/image) could indeed
probably be standardized, but we do some to have quite some variation in
the rootfs arguments.

But OK, we could start with just including the rootfs argument in
_LAUNCH_ARGS.

-- 
Bye, Peter Korsgaard
