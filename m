From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 00:13:39 +0200
Subject: [Buildroot] [PATCH v7 05/22] policycoreutils: new package
In-Reply-To: <1433251718-3167-6-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-6-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150618001339.13b15272@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue,  2 Jun 2015 08:28:21 -0500, Clayton Shotwell wrote:

> diff --git a/package/policycoreutils/0001-cross-compile-fixes.patch b/package/policycoreutils/0001-cross-compile-fixes.patch
> new file mode 100644
> index 0000000..8f47907
> --- /dev/null
> +++ b/package/policycoreutils/0001-cross-compile-fixes.patch
> @@ -0,0 +1,332 @@
> +Patch to enable cross compile build and install.
> +
> +Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>

This patch should really be split into smaller patches. Especially
since we definitely want you to upstream this patch. One patch adding
DESTDIR where needed, one patch adding PREFIX where needed, other
patches doing the other details here and there.


> ++PYTHON_ARGS = LDSHARED="$(CC) -shared" \
> ++		CROSS_COMPILING=yes              \
> ++		_python_sysroot=$(DESTDIR)       \
> ++		_python_srcdir=$(PYTHON_SRC)     \
> ++		_python_prefix=/usr              \
> ++		_python_exec_prefix=/usr

This cannot be put inside the patch itself. Some of these variables
(_python_*) are Buildroot specific, and therefore do not belong inside
the policycoreutils source, they should be passed by policycoreutils.mk.


> diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
> new file mode 100644
> index 0000000..733b896
> --- /dev/null
> +++ b/package/policycoreutils/Config.in
> @@ -0,0 +1,53 @@
> +config BR2_PACKAGE_POLICYCOREUTILS
> +	bool "policycoreutils"
> +	select BR2_PACKAGE_LIBSEMANAGE
> +	select BR2_PACKAGE_LIBCAP_NG
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # uses fts.h
> +	help
> +	  Policycoreutils is a collection of policy utilities (originally
> +	  the "core" set of utilities needed to use SELinux, although it
> +	  has grown a bit over time), which have different dependencies.
> +	  sestatus, secon, run_init, and newrole only use libselinux.
> +	  load_policy and setfiles only use libselinux and libsepol.
> +	  semodule and semanage use libsemanage (and thus bring in
> +	  dependencies on libsepol and libselinux as well). setsebool
> +	  uses libselinux to make non-persistent boolean changes (via
> +	  the kernel interface) and uses libsemanage to make persistent
> +	  boolean changes.
> +
> +	  The base package will install the following utilities:
> +	      load_policy
> +	      newrole
> +	      restorecond
> +	      run_init
> +	      secon
> +	      semodule
> +	      semodule_deps
> +	      semodule_expand
> +	      semodule_link
> +	      semodule_package
> +	      sepolgen-ifgen
> +	      sestatus
> +	      setfiles
> +	      setsebool
> +
> +	  http://selinuxproject.org/page/Main_Page
> +
> +comment "policycoreutils needs a toolchain w/ threads, glibc or musl"

policycoreutils needs a glibc or musl toolchain w/ threads

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS  \
> +		|| !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
> +if BR2_PACKAGE_POLICYCOREUTILS
> +
> +config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
> +	bool "restorecond Utility"
> +	depends on BR2_PACKAGE_DBUS_GLIB

Make that a "select BR2_PACKAGE_DBUS_GLIB", and propagate the necessary
dependencies (there shouldn't be many since you anyway already depend
on glibc or musl).



> new file mode 100644
> index 0000000..b03ea5c
> --- /dev/null
> +++ b/package/policycoreutils/policycoreutils.mk
> @@ -0,0 +1,107 @@
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
> +# gettext for load_policy.c use of libintl_* functions
> +POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(if $(BR2_NEEDS_GETTEXT),gettext)
> +
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +	POLICYCOREUTILS_DEPENDENCIES += linux-pam
> +	POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y

Don't indent such lines. Only the comands should be indented.

> +define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
> +	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
> +	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +	POLICYCOREUTILS_DEPENDENCIES += audit
> +	POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y

Ditto.

> +endif
> +
> +# Enable LSPP_PRIV if both audit and linux pam are enabled
> +ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
> +	POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y

Ditto.

> +endif
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +POLICYCOREUTILS_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \

This _FILE_OFFSET_BITS hack is not pretty, but oh well.

> +	LDFLAGS="$(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)"
> +
> +POLICYCOREUTILS_MAKE_DIRS = load_policy newrole run_init \
> +	secon semodule semodule_deps semodule_expand semodule_link \
> +	semodule_package sepolgen-ifgen sestatus setfiles setsebool
> +
> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
> +POLICYCOREUTILS_DEPENDENCIES += dbus-glib
> +POLICYCOREUTILS_MAKE_DIRS += restorecond
> +endif
> +
> +define POLICYCOREUTILS_BUILD_CMDS
> +	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all || exit 1 ; \
> +	done
> +endef
> +
> +define POLICYCOREUTILS_INSTALL_TARGET_CMDS
> +	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install || exit 1 ; \
> +	done
> +endef
> +
> +HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage host-dbus-glib host-sepolgen host-setools
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +HOST_POLICYCOREUTILS_MAKE_OPTS = \
> +	$(HOST_CONFIGURE_OPTS) \
> +	CFLAGS+="-U_FILE_OFFSET_BITS" \

This CFLAGS += doesn't make much sense, += compared to what? Don't you
want CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" ?

> +	PYTHON="$(HOST_DIR)/usr/bin/python"
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
> +HOST_POLICYCOREUTILS_MAKE_OPTS += \
> +	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)" \
> +	PYTHON_SRC="$(BUILD_DIR)/host-python$(PYTHON3_VERSION)"
> +else
> +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
> +HOST_POLICYCOREUTILS_MAKE_OPTS += \
> +	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
> +	PYTHON_SRC="$(BUILD_DIR)/host-python$(PYTHON_VERSION)"

Gaah, why does it need access to the Python source code ?

> +endif
> +
> +# Note: We are only building the programs required by the refpolicy build
> +HOST_POLICYCOREUTILS_MAKE_DIRS = load_policy semodule semodule_deps semodule_expand semodule_link \
> +	semodule_package setfiles restorecond audit2allow audit2why scripts semanage sepolicy
> +
> +define HOST_POLICYCOREUTILS_BUILD_CMDS
> +	for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) all || exit 1 ; \
> +	done
> +endef
> +
> +define HOST_POLICYCOREUTILS_INSTALL_CMDS
> +	for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) install || exit 1 ; \
> +	done
> +	# Fix python paths
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/audit2allow
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/audit2why
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/sepolgen-ifgen
> +	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/sepolicy

Maybe a small loop is in order here. Also, use % or , as the sed
separator, it's more traditional in Buildroot than ~.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
