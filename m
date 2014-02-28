From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 28 Feb 2014 13:39:23 +0800
Subject: [Buildroot] [RFC, PATCH 6/8] package/petitboot: Add petitboot,
 the userspace bootloader
In-Reply-To: <20140130215159.432d7c13@skate>
References: <1389862338.917573.283530987294.0.gpush@pablo>	<1389862338.919458.196762877880.6.gpush@pablo>
 <20140130215159.432d7c13@skate>
Message-ID: <5310210B.70605@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> I don't think we want a dependency here, as it's not necessarily
> obvious that this needs a kexec implementation. Therefore, I think we
> should have something like:
> 
> 	select BR2_PACKAGE_KEXEC_LITE if !BR2_PACKAGE_KEXEC
> 
> So that at least one implementation is guaranteed to be selected.

OK, done.

>> +PETITBOOT_SITE = git://git.ozlabs.org/home/jk/git/petitboot
>> +PETITBOOT_DEPENDENCIES = ncurses udev
> 
> If kexec is only a runtime dependency (and not a build dependency),
> then there should be a comment above the "select" of kexec in the
> Config.in that says it's only a runtime dependency.
> 
> Same thing for powerpc-utils.

I've noted this in the Config.in file now.

>> +PETITBOOT_LICENSE = GPLv2
>> +PETITBOOT_LICENSE_FILES = COPYING
>> +
>> +PETITBOOT_CONF_OPT += --with-ncurses --without-twin-x11 --without-twin-fbdev \
>> +		      --localstatedir=/var --with-tftp=busybox \
> 
> The --with-tftp=busybox seems to implies that Busybox is used.
> Technically speaking, Buildroot allows to build a root filesystem
> without Busybox. So either you should support both Busybox-based and
> non-Busybox based filesystems, or depend/select Busybox.

Petitboot supports both busybox tftp and tftp-hpa, but by specifying
this to configure allows petitboot to skip a check at runtime. It's just
a little optimisation, and I'll make it conditional on BR2_PACKAGE_BUSYBOX.

>> +		      HOST_PROG_KEXEC=/usr/sbin/kexec \
>> +		      HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
>> +
>> +ifdef PETITBOOT_DEBUG
> 
> Where is PETITBOOT_DEBUG defined?

This is a little hack I use to build petitboot with debug enabled (so we
get more verbose log output), by specifying PETITBOOT_DEBUG=1 on the
make invocation. If this isn't acceptable, I can work around it :)

>> +PETITBOOT_CONF_OPT += --enable-debug
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_NCURSES_WIDEC),y)
>> +PETITBOOT_CONF_OPT += --with-ncursesw MENU_LIB=-lmenuw FORM_LIB=-lformw
>> +endif
>> +
>> +define PETITBOOT_PRE_CONFIGURE_BOOTSTRAP
>> +	(cd $(@D) && ./bootstrap $(PETITBOOT_VERSION))
>> +endef
>> +
>> +PETITBOOT_PRE_CONFIGURE_HOOKS += PETITBOOT_PRE_CONFIGURE_BOOTSTRAP
> 
> It's unfortunate that we can't use the normal <pkg>_AUTORECONF = YES
> logic, due to how configure.ac is generated from configure.ac.in.
> Anyway, if you do want to call the bootstrap script, you need to make
> this package depend on host-autoconf, host-automake and maybe
> host-libtool if you're using libtool.
> 
> Also, I see in your configure.ac.in that you use Lex and Yacc.
> Therefore, your package should depend on host-bison and host-flex.
> These are not mandatory dependencies of Buildroot.

OK, updated.

I'm planning to fix the autoreconf bits in a future petitboot change, so
this should get a little simpler later.

Thanks for the review, I'll post a new series soon.

Cheers,


Jeremy
