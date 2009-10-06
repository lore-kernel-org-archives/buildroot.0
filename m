From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 5 Oct 2009 20:17:26 -0400
Subject: [Buildroot] Bug in target/linux/Makefile
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901DB7781@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I just noticed what may be a bug in the buildroot Makefile that builds
the linux kernel.

Both Makefile.in and Makefile.in.advanced do this when first configuring
the kernel:

$(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
ifeq ($(BR2_ARM_EABI),y)
	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config
else
	echo "# CONFIG_AEABI is not set" >> $(LINUX26_DIR)/.config
endif

If I understand this correctly this is what happens:
1) CONFIG_AEABI=y is deleted if it exists
2) If BR2_ARM_EABI is set
2a) CONFIG_AEABI=y is added back
2b) CONFIG_OABI_COMPAT is deleted if it exists
2c) # CONFIG_OABI_COMPAT is not set is added

The problem I see is with ARM platforms aarch/arm/Kconfig says:

menu "Floating point emulation"

comment "At least one emulation must be selected"

But both FPE_NWFPE and FPE_FASTFPE have this depends:

	depends on !AEABI || OABI_COMPAT

Without a Floating point emulation select the kernel hangs after
uncompressing.  If I then reconfigure my kernel and select OABI_COMPAT
and FPE_NWFPE the kernel boots fine.

I have noticed this problem ever since I switched to an EABI toolchain
but just now tracked down where OABI_COMPAT was getting disabled.

Regards,
Hartley
