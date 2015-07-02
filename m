From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 2 Jul 2015 11:43:08 +0200
Subject: [Buildroot] [PATCH 2/2] xen: new package
In-Reply-To: <20150629121202.23c1ebae@free-electrons.com>
References: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
 <1435241096-23969-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150629121202.23c1ebae@free-electrons.com>
Message-ID: <20150702094308.GK2266@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jun 29, 2015 at 12:12:02PM +0200, Thomas Petazzoni wrote:
> > diff --git a/package/xen/0001-xencommons-create-log-directory-before-using-it.patch b/package/xen/0001-xencommons-create-log-directory-before-using-it.patch
> > new file mode 100644
> > index 000000000000..365cdc5b5a9b
> > --- /dev/null
> > +++ b/package/xen/0001-xencommons-create-log-directory-before-using-it.patch
> > @@ -0,0 +1,31 @@
> > +From a7d1fde9a14ca0cf9c3f7c7950a6f9ea89ff58a6 Mon Sep 17 00:00:00 2001
> > +From: Maxime Ripard <maxime.ripard@free-electrons.com>
> > +Date: Thu, 25 Jun 2015 15:47:42 +0200
> > +Subject: [PATCH] xencommons: create log directory before using it
> > +
> > +In the case where /var/log is volatile, for example when using a tmpfs, the
> > +/var/log/xen directory will not be found on the system, and every attempt
> > +to log something to one of the files in that directory will fail.
> > +
> > +Create it in the xencommons init script
> > +
> > +Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > +---
> > + tools/hotplug/Linux/init.d/xencommons.in | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/tools/hotplug/Linux/init.d/xencommons.in b/tools/hotplug/Linux/init.d/xencommons.in
> > +index a1095c29ce0f..89210a02120a 100644
> > +--- a/tools/hotplug/Linux/init.d/xencommons.in
> > ++++ b/tools/hotplug/Linux/init.d/xencommons.in
> > +@@ -61,6 +61,7 @@ do_start () {
> > + 
> > + 	mkdir -p ${XEN_RUN_DIR}
> > + 	mkdir -p ${XEN_LOCK_DIR}
> > ++	mkdir -p /var/log/xen
> > + 
> > + 	if ! `${BINDIR}/xenstore-read -s / >/dev/null 2>&1`
> > + 	then
> > +-- 
> > +2.4.3
> > +
> 
> Has this patch been submitted upstream?

Not yet.

> 
> > diff --git a/package/xen/Config.in b/package/xen/Config.in
> > new file mode 100644
> > index 000000000000..33eb11c50a8e
> > --- /dev/null
> > +++ b/package/xen/Config.in
> > @@ -0,0 +1,30 @@
> > +config BR2_PACKAGE_XEN
> > +	bool "xen"
> > +	depends on BR2_arm || BR2_arm64 || \
> > +		BR2_i386 || BR2_x86_64
> > +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
> > +	depends on !BR2_STATIC_LIBS # dtc (libfdt)
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> > +	depends on BR2_USE_WCHAR # libglib2, util-linux
> 
> You need a comment to match these 'depends on' toolchain features.

Ack.

> > +	select BR2_PACKAGE_DTC
> > +	select BR2_PACKAGE_LIBAIO
> > +	select BR2_PACKAGE_LIBGLIB2
> > +	select BR2_PACKAGE_NCURSES
> > +	select BR2_PACKAGE_OPENSSL
> > +	select BR2_PACKAGE_PIXMAN
> > +	select BR2_PACKAGE_UTIL_LINUX
> > +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> > +	select BR2_PACKAGE_YAJL
> 
> Are all these dependencies needed when you don't install the Xen tools?

Probably not, the hypervisor is completely standalone, so I don't
think it would require any of these.

BTW, I just found out that I left something out of this patch. The
initscripts are using some bashism that don't work with busybox'
ash. What's the way Buildroot deal with this usually? Add a dependency
on bash?

> > +	help
> > +	  This builds the Xen hypervisor and toolstack
> > +
> > +	  http://www.xenproject.org/
> > +
> > +if BR2_PACKAGE_XEN
> > +
> > +config BR2_PACKAGE_XEN_HYPERVISOR
> > +	bool "Build the Xen hypervisor"
> > +
> > +config BR2_PACKAGE_XEN_TOOLS
> > +	bool "Build the Xen tools"
> > +endif
> 
> Empty newline missing after "endif".
>
> Also, if neither the hypervisor nor the tools are enabled, what gets
> built? Nothing? If so, maybe you want:
> 
> 	select BR2_PACKAGE_XEN_HYPERVISOR if !BR2_PACKAGE_XEN_TOOLS
> 
> in the top-level option.

I think it would make more sense to have the tools built by default,
which would reverse the select statement I guess?

> 
> > diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> > new file mode 100644
> > index 000000000000..fee9fdc12cdf
> > --- /dev/null
> > +++ b/package/xen/xen.mk
> > @@ -0,0 +1,49 @@
> > +################################################################################
> > +#
> > +# Xen
> > +#
> > +################################################################################
> > +
> > +XEN_VERSION = 4.5.0
> > +XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
> 
> Missing LICENSE + LICENSE_FILES.

Ah, right.

It uses the GPL as its license, with some 2c and 3c BSD
exceptions. How is that usually dealt with ?

Using 
LICENSE = GPLv2 with exceptions

Or making an exhaustive list of the licenses used?

> 
> > +XEN_INSTALL_IMAGES = YES
> > +
> > +XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl
> > +
> > +XEN_MAKE_ENV = \
> > +	XEN_TARGET_ARCH=arm32 \
> 
> Hard-coded arm32 doesn't seem right.

No it's not.

> > +	CROSS_COMPILE=$(TARGET_CROSS) \
> > +	CXXFLAGS="$(TARGET_CXXFLAGS) -D_FILE_OFFSET_BITS=64" \
> > +	CFLAGS="$(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64" \
> 
> Why do you pass -D_FILE_OFFSET_BITS=64 ? It is already in
> TARGET_CFLAGS / TARGET_CXXFLAGS.

It was required during the make invocation, while Buildroot only
passes it during the configure.

> > +	PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY)
> > +
> > +XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
> 
> This seems weird, you're losing the "install" target.

It's actually on purpose. Xen has a specific install target for the
tools (install-target), that is added a bit later when compiling the
tools.

> > +
> > +ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> > +XEN_MAKE_OPTS += dist-xen
> > +
> > +define XEN_INSTALL_IMAGES_CMDS
> > +	cp $(@D)/xen/xen $(BINARIES_DIR)
> > +endef
> > +else
> > +XEN_CONF_OPTS += --disable-xen
> > +endif
> > +
> > +XEN_CONF_OPTS += --disable-ocamltools
> 
> We generally put the common options towards the top of the file, before
> all the conditional stuff. And the += is unneeded then, it can be just
> a '='.

Ok.

> 
> > +ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
> > +XEN_MAKE_OPTS += dist-tools
> > +XEN_INSTALL_TARGET_OPTS += install-tools
> 
> Ah, so here it comes. So maybe instead you want to do
> XEN_INSTALL_TARGET = NO by default, and do XEN_INSTALL_TARGET_OPTS =
> DESTDIR=$(TARGET_DIR) install-tools when BR2_PACKAGE_XEN_TOOLS=y.

Now I see that I forgot that as well, but the hypervisor can be
installed in /boot using install-xen.

Maybe I could just add a new option to ask whether we want to install
it to /boot, and add install-xen to INSTALL_TARGET_OPTS if relevant.

> > +define XEN_RENAME_INIT_SCRIPTS
> > +	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
> > +	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
> > +	mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
> 
> Don't know if it's better or not:
> 
> 	(cd $(TARGET_DIR)/etc/init.d; \
> 		mv xencommons S50xencommons; \
> 		mv ... ; \
> 		mv ...)

I don't really have a preference. I'll change this if you want.

> > +endef
> > +else
> > +XEN_CONF_OPTS += --disable-tools
> > +endif
> > +
> > +XEN_POST_INSTALL_TARGET_HOOKS += XEN_RENAME_INIT_SCRIPTS
> 
> Should be part of the ifeq BR2_PACKAGE_XEN_TOOLS=y.

Is it? My understanding was that the macro wouldn't be defined and it
would call an empty one in such a case?

> Also, here it doesn't build, because it cannot find libyajl due to the
> following failure:
> 
> configure:8342: /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FI
> LE_OFFSET_BITS=64     conftest.c -lyajl  -lcrypto -laio  -lutil >&5
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.so: warning: gethostbyname is obsolescent, use getnameinfo() instead.
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libyajl.so: undefined reference to `__isnan'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libyajl.so: undefined reference to `__isinf'
> 
> You need to change:
> 
> AC_CHECK_LIB([yajl], [yajl_alloc], [],
>     [AC_MSG_ERROR([Could not find yajl])])
> 
> to:
> 
> AC_CHECK_LIB([yajl], [yajl_alloc], [],
>     [AC_MSG_ERROR([Could not find yajl])], [m])

Ack.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150702/c0adb888/attachment.asc>
