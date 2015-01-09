From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 17:34:02 +0100
Subject: [Buildroot] [PATCH v4 06/27] policycoreutils: new package
In-Reply-To: <1420816288-8750-7-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1420816288-8750-7-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150109173402.7e1d6818@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Fri,  9 Jan 2015 09:11:07 -0600, Matt Weber wrote:

>  menu "Security"
> +menu "policycoreutils"
> +	source "package/policycoreutils/Config.in"
> +endmenu

Why a menu...endmenu here? If you really want a menu, it should be
defined inside this package Config.in file, not in package/Config.in.

> diff --git a/package/policycoreutils/0001-cross-compile-fixes.patch b/package/policycoreutils/0001-cross-compile-fixes.patch
> new file mode 100644
> index 0000000..8f47907
> --- /dev/null
> +++ b/package/policycoreutils/0001-cross-compile-fixes.patch
> @@ -0,0 +1,332 @@
> +Patch to enable cross compile build and install.
> +
> +Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>

Please split that up in several patches, for the different issues. And
submit upstream.

> +-INOTIFYH = $(shell ls /usr/include/sys/inotify.h 2>/dev/null)
> ++INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)
> + 
> +-ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
> ++ifeq (${INOTIFYH}, $(DESTDIR)/usr/include/sys/inotify.h)

This is really horrible :-/. If you do a build with
DESTDIR=$(TARGET_DIR), things won't work because there are no headers
in $(TARGET_DIR). It's not going to cause a practical problem, but it's
not nice.

> + CFLAGS ?= -g -Werror -Wall -W
> +-override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/lib/glib-2.0/include
> ++override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I$(PREFIX)/include/glib-2.0 \
> ++		-I$(PREFIX)/lib64/glib-2.0/include -I$(PREFIX)/lib/glib-2.0/include

Can we do something sane, like:

	$(shell pkg-config --cflags glib-2.0)

> + LDLIBS += -lselinux $(DBUSLIB) -lglib-2.0 -L$(LIBDIR)
> + 
> + all: restorecond
> + 
> ++%.o: %.c
> ++	$(CC) $(CFLAGS) -c -o $@ $<

Huh? This is normally part of make implicit rules. I don't see why you
would need this.

> ++PYTHON_ARGS = LDSHARED="$(CC) -shared" \
> ++		CROSS_COMPILING=yes              \
> ++		_python_sysroot=$(DESTDIR)       \
> ++		_python_srcdir=$(PYTHON_SRC)     \
> ++		_python_prefix=/usr              \
> ++		_python_exec_prefix=/usr
> ++
> + all: python-build
> + 
> + python-build: info.c search.c common.h policy.h policy.c
> +-	$(PYTHON) setup.py build
> ++	$(PYTHON_ARGS) $(PYTHON) setup.py build

This is not really great, as this cannot be upstreamed: some of those
Python variables only exist because the patches Buildroot has on
Python. Maybe the Buildroot .mk file should pass them, instead?

> +-PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
> +-ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
> ++PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk '{ print $$3 }')
> ++ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk '{ print $$3 }')

Removing -S. Why?

> diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
> new file mode 100644
> index 0000000..67bfacf
> --- /dev/null
> +++ b/package/policycoreutils/Config.in
> @@ -0,0 +1,71 @@
> +config BR2_PACKAGE_POLICYCOREUTILS
> +	bool "policycoreutils"
> +	select BR2_PACKAGE_LIBSEMANAGE
> +	select BR2_PACKAGE_SEPOLGEN # host python bindings

Not clear what you mean by "host python bindings" here. Host package
dependencies are not reflected in Config.in files.


> +if BR2_PACKAGE_POLICYCOREUTILS
> +
> +config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
> +	bool "restorecond Utility"
> +	select BR2_PACKAGE_DBUS_GLIB
> +	depends on BR2_USE_WCHAR # dbus-glib
> +	depends on BR2_USE_MMU # dbus-glib
> +	help
> +	  Enable restorecond to be built
> +
> +comment "restorecond needs a toolchain w/ wchar, mmu"
> +	depends on !BR2_USE_WCHAR || !BR2_USE_MMU
> +
> +config BR2_PACKAGE_POLICYCOREUTILS_MCSTRANS
> +	bool "mcstrans Utility"
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_LIBCAP
> +	help
> +	  Enable mcstrans to be built
> +
> +config BR2_PACKAGE_POLICYCOREUTILS_SANDBOX
> +	bool "sandbox Utility"
> +	select BR2_PACKAGE_POLICYCOREUTILS_POLICY_DEBUGGING

Where is this option defined?

> +	select BR2_PACKAGE_LIBCGROUP
> +	depends on BR2_INSTALL_LIBSTDCPP # libcgroup
> +	help
> +	  Enable sandbox to be built
> +
> +comment "policycoreutils sandbox needs an toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +endif
> diff --git a/package/policycoreutils/S15restorecond b/package/policycoreutils/S15restorecond
> new file mode 100644
> index 0000000..e408281
> --- /dev/null
> +++ b/package/policycoreutils/S15restorecond
> @@ -0,0 +1,85 @@
> +#!/bin/sh
> +#
> +# restorecond:		Daemon used to maintain path file context
> +#
> +# description:	restorecond uses inotify to look for creation of new files \
> +# listed in the /etc/selinux/restorecond.conf file, and restores the \
> +# correct security context.
> +#
> +# processname: /usr/sbin/restorecond
> +# config: /etc/selinux/restorecond.conf 
> +# pidfile: /var/run/restorecond.pid
> +#
> +# Return values according to LSB for all commands but status:
> +# 0 - success
> +# 1 - generic or unspecified error
> +# 2 - invalid or excess argument(s)
> +# 3 - unimplemented feature (e.g. "reload")
> +# 4 - insufficient privilege
> +# 5 - program is not installed
> +# 6 - program is not configured
> +# 7 - program is not running
> +
> +PATH=/sbin:/bin:/usr/bin:/usr/sbin
> +
> +[ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled || exit 7
> +
> +# Check that we are root ... so non-root users stop here
> +test $EUID = 0  || exit 4
> +
> +test -x /usr/sbin/restorecond  || exit 5
> +test -f /etc/selinux/restorecond.conf  || exit 6
> +
> +RETVAL=0
> +
> +start() 
> +{
> +	echo -n $"Starting restorecond: "
> +	unset HOME MAIL USER USERNAME
> +	/usr/sbin/restorecond 
> +	RETVAL=$?
> +	touch /var/lock/subsys/restorecond
> +	echo
> +	return $RETVAL
> +}
> +
> +stop() 
> +{
> +	echo -n $"Shutting down restorecond: "
> +	killproc restorecond
> +	RETVAL=$?
> +	rm -f  /var/lock/subsys/restorecond
> +	echo
> +	return $RETVAL
> +}
> +
> +restart() 
> +{
> +	stop
> +	start
> +}
> +
> +# See how we were called.
> +case "$1" in
> +  start)
> +	start
> +	;;
> +  stop)
> +	stop
> +	;;
> +  status)
> +	status restorecond
> +	RETVAL=$?
> +	;;
> +  force-reload|restart|reload)
> +	restart
> +	;;
> +  condrestart)
> +	[ -e /var/lock/subsys/restorecond ] && restart || :
> +	;;
> +  *)
> +	echo $"Usage: $0 {start|stop|restart|force-reload|status|condrestart}"
> +	RETVAL=3
> +esac
> +
> +exit $RETVAL

Same comment as for other init scripts: please make this more similar
to other Buildroot init scripts.

> diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
> new file mode 100644
> index 0000000..0e5d802
> --- /dev/null
> +++ b/package/policycoreutils/policycoreutils.mk
> @@ -0,0 +1,243 @@
> +################################################################################
> +#
> +# policycoreutils
> +#
> +################################################################################
> +
> +POLICYCOREUTILS_VERSION = 2.1.14
> +POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +POLICYCOREUTILS_LICENSE = GPLv2
> +POLICYCOREUTILS_LICENSE_FILES = COPYING
> +
> +POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng

Why is libcap-ng a mandatory dependency here, but not referenced in the
Config.in file?

> +
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +	POLICYCOREUTILS_DEPENDENCIES += linux-pam
> +	POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
> +define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
> +	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
> +	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +	POLICYCOREUTILS_DEPENDENCIES += audit
> +	POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
> +endif
> +
> +# Enable LSPP_PRIV if both audit and linux pam are enabled
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +ifeq ($(BR2_PACKAGE_AUDIT),y)

This can be:

ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)

> +	POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
> +endif
> +endif
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h 
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +POLICYCOREUTILS_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS+="-U_FILE_OFFSET_BITS"

Should be:

	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"

In some other packages, I've opted for a filter-out,
seehttp://git.buildroot.net/buildroot/tree/package/musl/musl.mk#n24.
But maybe a -U<foo> as you did is better.

> +
> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
> +
> +POLICYCOREUTILS_DEPENDENCIES += dbus-glib
> +
> +define POLICYCOREUTILS_RESTORECOND_BUILD_CMDS
> +	$(MAKE) -C $(@D)/restorecond $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all

No quotes around $(STAGING_DIR), we don't do it anywhere else.

> +endef
> +
> +define POLICYCOREUTILS_RESTORECOND_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D)/restorecond $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(TARGET_DIR)" install

Ditto.

> +	rm $(TARGET_DIR)/etc/init.d/restorecond
> +endef
> +
> +define POLICYCOREUTILS_RESTORECOND_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 package/policycoreutils/S15restorecond \
> +		$(TARGET_DIR)/etc/init.d/
> +endef
> +
> +endif # End of BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
> +
> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_MCSTRANS),y)
> +
> +POLICYCOREUTILS_DEPENDENCIES += pcre libcap
> +
> +define POLICYCOREUTILS_MCSTRANS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/mcstrans $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +endef
> +
> +define POLICYCOREUTILS_MCSTRANS_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D)/mcstrans $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(TARGET_DIR)" install
> +endef
> +
> +endif # End of BR2_PACKAGE_POLICYCOREUTILS_MCSTRANS
> +
> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_SANDBOX),y)
> +
> +POLICYCOREUTILS_DEPENDENCIES += libcgroup
> +
> +define POLICYCOREUTILS_SANDBOX_BUILD_CMDS
> +	$(MAKE) -C $(@D)/sandbox $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +endef
> +
> +define POLICYCOREUTILS_SANDBOX_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D)/sandbox $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(TARGET_DIR)" install
> +endef
> +
> +endif # End of BR2_PACKAGE_POLICYCOREUTILS_SANDBOX
> +
> +define POLICYCOREUTILS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/load_policy $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/newrole $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/run_init $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/secon $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/semodule $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/semodule_deps $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/semodule_expand $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/semodule_link $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/semodule_package $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/sepolgen-ifgen $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/sestatus $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/setfiles $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(MAKE) -C $(@D)/setsebool $(POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" all
> +	$(POLICYCOREUTILS_RESTORECOND_BUILD_CMDS)
> +	$(POLICYCOREUTILS_MCSTRANS_BUILD_CMDS)
> +	$(POLICYCOREUTILS_SANDBOX_BUILD_CMDS)
> +endef

Very repetitive, no? What about:

POLICYCOREUTILS_MAKE_DIRS = load_policy newrole run_init \
	secon semodule semodule_deps semodule_expand semodule_link \
	semodule_package sepolgen-ifgen sestatus setfiles setsebool

ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
POLICYCOREUTILS_DEPENDENCIES += dbus-glib
POLICYCOREUTILS_MAKE_DIRS + restorecond
endif

ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_MCSTRANS),y)
POLICYCOREUTILS_DEPENDENCIES += pcre libcap
POLICYCOREUTILS_MAKE_DIRS + mcstrans
endif

... ditto for sandbox ...

and then:

define POLICYCOREUTILS_BUILD_CMDS
	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all || exit 1 ; \
	done
endef

define POLICYCOREUTILS_INSTALL_TARGET_CMDS
	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install || exit 1 ; \
	done
endef

Seems a bit smarter, no?

> +HOST_POLICYCOREUTILS_DEPENDENCIES += host-libsemanage host-dbus-glib host-sepolgen host-setools

Why a += ?

> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h 
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +HOST_POLICYCOREUTILS_MAKE_OPTS = \
> +	$(HOST_CONFIGURE_OPTS) \
> +	CFLAGS+="-U_FILE_OFFSET_BITS" \
> +	PYTHON="$(HOST_DIR)/usr/bin/python"
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
> +HOST_POLICYCOREUTILS_MAKE_OPTS = \
> +	$(HOST_CONFIGURE_OPTS) \
> +	CFLAGS+="-U_FILE_OFFSET_BITS" \
> +	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)" \
> +	PYTHON_SRC="$(BUILD_DIR)/host-python$(PYTHON3_VERSION)"
> +else
> +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
> +HOST_POLICYCOREUTILS_MAKE_OPTS = \
> +	$(HOST_CONFIGURE_OPTS) \
> +	CFLAGS+="-U_FILE_OFFSET_BITS" \
> +	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
> +	PYTHON_SRC="$(BUILD_DIR)/host-python$(PYTHON_VERSION)"
> +endif

Why do you duplicate things?

> +# Note: We are only building the programs required by the refpolicy build
> +define HOST_POLICYCOREUTILS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/semodule $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_package $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_link $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_expand $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_deps $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/load_policy $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/setfiles $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/restorecond $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(HOST_DIR)" all
> +	$(MAKE) -C $(@D)/audit2allow $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(HOST_DIR)" all
> +	$(MAKE) -C $(@D)/audit2why $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(HOST_DIR)" all
> +	$(MAKE) -C $(@D)/scripts $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(HOST_DIR)" all
> +	$(MAKE) -C $(@D)/semanage $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(HOST_DIR)" all
> +	$(MAKE) -C $(@D)/sepolicy $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR="$(HOST_DIR)" all
> +endef
> +
> +define HOST_POLICYCOREUTILS_INSTALL_CMDS
> +	$(MAKE) -C $(@D)/semodule install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_package install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_link install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_expand install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semodule_deps install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/load_policy install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/setfiles install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/restorecond install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/audit2allow install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/audit2why install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/scripts install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/semanage install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D)/sepolicy install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
> +		DESTDIR=$(HOST_DIR)
> +	# Fix python paths
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/audit2allow
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/audit2why
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/sepolgen-ifgen
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/sepolicy
> +endef

Same comment, please refactor.

> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
