From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 15:23:39 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: new package
In-Reply-To: <1396599134-2411-1-git-send-email-kaszak@gmail.com>
References: <1396599134-2411-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140406152339.0ce57d9e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

Thanks a lot for working on this, much appreciated! Here are a few
comments below.

On Fri,  4 Apr 2014 10:12:13 +0200, Karoly Kasza wrote:
> Hi,
> 
> this patch adds the latest stable open-vm-tools to buildroot.
> (http://open-vm-tools.sourceforge.net/)
> It should be compatible with all 3 libc implementations.
> Also Contains a small patch for the source, a SysV init script and
> a small shutdown script to make the VM power options usable from
> the host OS.
> Addresses Bugzilla bug 3991.
> 
> BR
> Karoly

This part of your e-mail would become part of the git commit log
forever, so it shouldn't contain "personal" informations. If you want
to include personal informations, they should either be in an
introduction e-mail separate from the patch itself (see "git send-email
--cover"), or below the "---" sign after your Signed-off-by line.

> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/Config.in                                  |    1 +
>  package/openvmtools/Config.in                      |   92 +++++++++++++++++++
>  package/openvmtools/S98vmtoolsd                    |   31 +++++++
>  .../openvmtools-01-has_bsd_printf.patch            |   26 ++++++
>  package/openvmtools/openvmtools.mk                 |   93 ++++++++++++++++++++
>  package/openvmtools/shutdown                       |    7 ++
>  6 files changed, 250 insertions(+)
>  create mode 100644 package/openvmtools/Config.in
>  create mode 100755 package/openvmtools/S98vmtoolsd
>  create mode 100644 package/openvmtools/openvmtools-01-has_bsd_printf.patch
>  create mode 100644 package/openvmtools/openvmtools.mk
>  create mode 100755 package/openvmtools/shutdown
> 
> diff --git a/package/Config.in b/package/Config.in
> index e816603..907cb23 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -328,6 +328,7 @@ source "package/on2-8170-modules/Config.in"
>  source "package/open2300/Config.in"
>  source "package/openocd/Config.in"
>  source "package/openpowerlink/Config.in"
> +source "package/openvmtools/Config.in"

Is openvmtools really related to Hardware handling? It should probably
be under "System tools" or something like that.

>  source "package/owl-linux/Config.in"
>  source "package/parted/Config.in"
>  source "package/pciutils/Config.in"
> diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
> new file mode 100644
> index 0000000..fd9486b
> --- /dev/null
> +++ b/package/openvmtools/Config.in
> @@ -0,0 +1,92 @@
> +config BR2_PACKAGE_OPENVMTOOLS
> +	bool "openvmtools"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_USE_MMU #libglib2
> +	depends on BR2_USE_WCHAR #libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS #libglib2

One space after "#"

> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC #needed by an include in lib/include/vmxrpc.h

For some reason, we generally don't document why these
toolchain dependencies are needed.

> +	depends on BR2_LARGEFILE #needed by an include in lib/include/vmxrpc.h
> +	depends on BR2_ENABLE_LOCALE #needed by __locale_t in lib/misc/codesetOld.c

Ditto.

> +	select BR2_PACKAGE_LIBGLIB2 #always needed

No need for "#always needed".

> +	help
> +	  Open Virtual Machine Tools for VMware guest OS
> +
> +	  http://open-vm-tools.sourceforge.net/
> +
> +if BR2_PACKAGE_OPENVMTOOLS
> +
> +menu "openvmtools options"
> +
> +#This can't be disabled by configure, will compile itself if libfuse is found,
> +#so we warn the user
> +comment "openvmtools vmblock-fuse is disabled because these is no libfuse!"
> +	depends on !BR2_PACKAGE_LIBFUSE
> +
> +comment "openvmtools vmblock-fuse is enabled because libfuse is found!"
> +	depends on BR2_PACKAGE_LIBFUSE

Such comments are not necessary. You may want to include some
explanation in the help text of the main option, such as:

	Support for vmblock-fuse will be enabled in openvmtools if the
	libfuse package is selected.

> +config BR2_PACKAGE_OPENVMTOOLS_PROCPS
> +	bool "openvmtools procps support"
> +	depends on BR2_PACKAGE_PROCPS

Why a "depends on" here?

> +	help
> +	  Enable support for procps / meminfo
> +
> +comment "openvmtools procps support needs procps"
> +	depends on !BR2_PACKAGE_PROCPS
> +
> +config BR2_PACKAGE_OPENVMTOOLS_DNET
> +	bool "openvmtools dnet support"
> +	depends on BR2_INET_IPV6 #needed by services/plugins/guestInfo/getlib/guestInfoPosix.c
> +	select BR2_PACKAGE_LIBDNET

And a select here?

Also, this is a bit inconsistent with the choice you've made for the
libfuse dependency:

 * Either you add explicit sub-options under the openvmtools options,
   for the various optional features, and you make them "select" the
   appropriate dependencies.

 * Or you make these optional features automatically enabled when the
   necessary set of dependencies are available, as you did for
   vmblock-fuse above.

> +	help
> +	  Enable support for libdnet / nicinfo
> +
> +comment "openvmtools dnet support needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> +
> +config BR2_PACKAGE_OPENVMTOOLS_PAM
> +	bool "openvmtools PAM support"
> +	select BR2_PACKAGE_LINUX_PAM
> +	help
> +	  Support for PAM in openvmtools
> +
> +config BR2_PACKAGE_OPENVMTOOLS_MODULES
> +	bool "openvmtools older kernel modules - SEE HELP!"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  Compile older Linux kernel modules for openvmtools
> +	  This is absolutely NOT NEEDED for recent kernels, as they already
> +	  include open-vm-tools modules.
> +	  Better to choose this in a current Linux kernel's config, not here.
> +	  Only compile this if you are positive that you need it!
> +	  Also, this is highly untested, so probably you'll need to hack it.
> +
> +comment "openvmtools older kernel modules needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +comment "openvmtools ICU locales are not supported"

Don't put comment for things that are not supported.

> +
> +#Does not compile, also needs some hacks in configure...
> +#config BR2_PACKAGE_OPENVMTOOLS_ICU
> +#	bool "openvmtools icu locales suport"
> +#	depends on BR2_INSTALL_LIBSTDCPP #needed by icu
> +#	select BR2_PACKAGE_ICU
> +#	help
> +#	  Use icu for openvmtools locales
> +#	  I would only recommend to use this only if you already has icu,
> +#	  as it is large and requires a C++ compiler
> +
> +#comment "openvmtools icu locales support needs a toolchain w/ C++"
> +#	depends on !BR2_INSTALL_LIBSTDCPP

Don't keep commented code.

> +
> +comment "openvmtools X11 tools are not supported"

Same as above.

> +
> +endmenu
> +
> +endif
> +
> +comment "openvmtools needs a toolchain w/ wchar, threads, RPC, largefile, locale"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR ||!BR2_TOOLCHAIN_HAS_THREADS || \
> +	!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_LARGEFILE || !BR2_ENABLE_LOCALE
> diff --git a/package/openvmtools/S98vmtoolsd b/package/openvmtools/S98vmtoolsd
> new file mode 100755
> index 0000000..4b51e0a
> --- /dev/null
> +++ b/package/openvmtools/S98vmtoolsd
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +#
> +# Start vmtoolsd
> +#
> +
> +PID=/var/run/vmtoolsd.pid
> +
> +case "$1" in
> +  start)
> +	echo -n "Starting vmtoolsd: "
> +	/usr/bin/vmtoolsd -b $PID
> +	if [ $? != 0 ]; then
> +		echo "FAILED"
> +		exit 1
> +	else
> +		echo "OK"
> +	fi
> +	;;
> +  stop)
> +	echo -n "Stopping vmtoolsd: "
> +	kill `cat $PID`
> +	echo "OK"

I believe it would be better to use start-stop-daemon here. Have a look
at package/connman/S45connman for an example.


> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> new file mode 100644
> index 0000000..1278dae
> --- /dev/null
> +++ b/package/openvmtools/openvmtools.mk
> @@ -0,0 +1,93 @@
> +#############################################################
> +#
> +# openvmtools
> +#
> +#############################################################

There should be 80 # signs for this header, and an empty line between
the header and the first variable.

> +OPENVMTOOLS_VERSION = 9.4.0-1280544
> +OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
> +OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-9.4.x
> +
> +OPENVMTOOLS_CONF_OPT += --disable-docs

Not needed, already passed by the autotools-package infrastructure.

> +OPENVMTOOLS_MAKE_OPT += "CFLAGS+=-Wno-unused-local-typedefs"

This should be part of _CONF_ENV, as follows:

# A comment that explains why this is needed.
OPENVMTOOLS_CONF_ENV = \
	CFLAGS="$(TARGET_CFLAGS) -Wno-unused-local-typedefs"

> +OPENVMTOOLS_DEPENDENCIES += libglib2
> +OPENVMTOOLS_POST_INSTALL_TARGET_HOOKS += OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES

The registration of a hook should be close (usually right after) the
hook definition.

> +
> +#If libfuse is found, vmblock-fuse is always compiled, we just set a sequence

"set a sequence" is a bit confusing, and is not part of the typical
Buildroot terminology. Instead this could be something like:

# When libfuse is available, openvmtools can build vmblock-fuse, so
# make sure that libfuse gets built first.

> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +OPENVMTOOLS_DEPENDENCIES += libfuse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> +OPENVMTOOLS_CONF_OPT += --with-procps LDFLAGS="-L$(TARGET_DIR)/lib -L$(TARGET_DIR)/usr/lib"

No: you should instead change the procps package (as part of a separate
patch) to make it install its libraries to the staging directory. Then
you won't need those special LDFLAGS.

> +OPENVMTOOLS_DEPENDENCIES += procps
> +else
> +OPENVMTOOLS_CONF_OPT += --without-procps
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> +OPENVMTOOLS_CONF_OPT += --with-dnet CUSTOM_DNET_CPPFLAGS=-I$(TARGET_DIR)/usr/include

libdnet headers are installed to the staging directory, so there should
be no need for these CUSTOM_DNET_CPPFLAGS, and if they are really
needed, they should point to $(STAGING_DIR).

> +OPENVMTOOLS_DEPENDENCIES += libdnet
> +OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_DNET_FIX
> +else
> +OPENVMTOOLS_CONF_OPT += --without-dnet
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
> +OPENVMTOOLS_CONF_OPT += --with-pam
> +OPENVMTOOLS_DEPENDENCIES += linux-pam
> +else
> +OPENVMTOOLS_CONF_OPT += --without-pam
> +endif
> +
> +#For older kernels only!
> +#See http://sourceforge.net/p/open-vm-tools/mailman/message/30113760/ for some clue
> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_MODULES),y)
> +OPENVMTOOLS_CONF_OPT += --with-kernel-modules --with-linuxdir=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)

Use $(LINUX_DIR) instead of
$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION). Especially since
$(LINUX_HEADERS_VERSION) is the version of the kernel headers, not the
version of the kernel being built.

> +OPENVMTOOLS_DEPENDENCIES += linux
> +OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_LINUX_FIX
> +else
> +OPENVMTOOLS_CONF_OPT += --without-kernel-modules
> +endif
> +
> +#Does not configure or compile, needs hacks, also not really needed...
> +#ifeq ($(BR2_PACKAGE_OPENVMTOOLS_ICU),y)
> +#OPENVMTOOLS_CONF_OPT += --with-icu
> +#OPENVMTOOLS_DEPENDENCIES = icu
> +#else
> +OPENVMTOOLS_CONF_OPT += --without-icu
> +#endif

Don't keep commented code.

> +
> +#No X11 suport (yet)
> +OPENVMTOOLS_CONF_OPT += --without-x
> +OPENVMTOOLS_CONF_OPT += --without-gtk2
> +OPENVMTOOLS_CONF_OPT += --without-gtkmm

Add these at the top of the file, like:

OPENVMTOOLS_CONF_OPT = \
	--without-x \
	--without-gtk2 \
	--without-gtkmm

> +#create a "build" directory symlink if building kernel modules
> +define OPENVMTOOLS_PRE_CONFIGURE_LINUX_FIX
> +	if [ ! -e $(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)/build ]; then \
> +		ln -s . $(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)/build; \

Huh, why?

> +	fi
> +endef
> +
> +define OPENVMTOOLS_PRE_CONFIGURE_DNET_FIX
> +	cp -f $(BUILD_DIR)/libdnet-$(LIBDNET_VERSION)/dnet-config $(TARGET_DIR)/usr/bin

Arrggh, no! It is absolutely horrible for package A to install files
from package B into the target directory. In addition to this,
dnet-config is already installed into $(STAGING_DIR)/usr/bin/.
Normally, the openvmtools configure script should take an environment
variable that allows to set the location of the dnet-config script.

> +endef
> +
> +define OPENVMTOOLS_POST_INSTALL_TARGET_THINGIES
> +#needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
> +	if [ ! -e $(TARGET_DIR)/etc/lfs-release ]; then \
> +		ln -s os-release $(TARGET_DIR)/etc/lfs-release; \
> +	fi
> +#for Guest OS restart/shutdown
> +	if [ ! -e $(TARGET_DIR)/sbin/shutdown ]; then \
> +		$(INSTALL) -D -m 755 package/openvmtools/shutdown \
> +			$(TARGET_DIR)/sbin/shutdown; \
> +	fi
> +endef
> +
> +define OPENVMTOOLS_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/openvmtools/S98vmtoolsd \
> +		$(TARGET_DIR)/etc/init.d/S98vmtoolsd
> +endef
> +
> +$(eval $(autotools-package))
> diff --git a/package/openvmtools/shutdown b/package/openvmtools/shutdown
> new file mode 100755
> index 0000000..bca9765
> --- /dev/null
> +++ b/package/openvmtools/shutdown
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +#compatibility script for openvmtools
> +if [ "$1" == "-r" ]; then
> +/sbin/reboot
> +else
> +/sbin/poweroff
> +fi

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
