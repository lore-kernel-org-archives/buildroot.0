From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:38:40 +0200
Subject: [Buildroot] [PATCH v3 5/5] policycoreutils: bump to 2.7
In-Reply-To: <20171012180921.22768-5-Adamduskett@outlook.com>
References: <20171012180921.22768-1-Adamduskett@outlook.com>
 <20171012180921.22768-5-Adamduskett@outlook.com>
Message-ID: <20171012223840.7e87a8f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Oct 2017 14:09:21 -0400, Adam Duskett wrote:

> +config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
> +	bool "policycoreutils audit2allow option removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_SEPOLGEN

Why is selecting BR2_PACKAGE_SEPOLGEN needed?

> +	select BR2_PACKAGE_SELINUX_PYTHON
> +	select BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
> +	help
> +	  The policycoreutils package no longer offers audit2allow
> +	  as a option.  This package has been moved into the

Why do you have two spaces between the "." and the next sentence? Could
you fix this globally?

> +	  selinux-python package by the SELinux maintainers.
> +
> +config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
> +	bool "policycoreutils restorecond option removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_DBUS_GLIB

Why do you select those options? It seems totally useless:
BR2_PACKAGE_RESTORECOND already selects BR2_PACKAGE_DBUS_GLIB.

> +	select BR2_PACKAGE_RESTORECOND
> +	help
> +	  The policycoreutils package no longer offers restorecond
> +	  as a option.  This package has been moved into a seperate
> +	  package maintained by the SELinux maintainers.
> +
> +config BR2_PACKAGE_SEPOLGEN
> +	bool "sepolgen package has been removed"

So actually there is some code above that selects an option that is
legacy ? This doesn't make much sense.

> diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
> new file mode 100644
> index 0000000000..1ce1bcb605
> --- /dev/null
> +++ b/package/restorecond/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_RESTORECOND
> +	bool "restorecond"
> +	depends on BR2_PACKAGE_DBUS # dbus-glib

Perhaps this should be a "select BR2_PACKAGE_DBUS", as it's not obvious
that DBus is needed. D-Bus only depends on threads and MMU, which you
already depend on anyway.

> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	select BR2_PACKAGE_LIBSELINUX
> +	select BR2_PACKAGE_DBUS_GLIB
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  restorecond is a daemon that watches for file creation and
> +	  then sets the default SELinux file context for that file.

Missing upstream URL. Missing Config.in comment that details the
dependencies.


> +define RESTORECOND_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D $(@D)/restorecond.init \
> +		$(TARGET_DIR)/etc/init.d/restorecond

A script named /etc/init.d/restorecond will not be executed at boot
time.

> +endef
> +
> +define RESTORECOND_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0644 -D $(@D)/restorecond.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/restorecond.service
> +
> +	$(INSTALL) -m 0600 -D $(@D)/org.selinux.Restorecond.service \
> +		$(TARGET_DIR)/etc/systemd/system/org.selinux.Restorecond.service
> +endef
> +
> +define RESTORECOND_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0644 -D $(@D)/restorecond.conf $(TARGET_DIR)/etc/selinux/restorecond.conf
> +	$(INSTALL) -m 0644 -D $(@D)/restorecond_user.conf $(TARGET_DIR)/etc/selinux/restorecond_user.conf
> +	$(INSTALL) -m 0755 -D $(@D)/restorecond $(TARGET_DIR)/usr/sbin/restorecond
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

A host generic package call, but no definition of
HOST_RESTORECOND_BUILD_CMDS or installation commands? Seems like the
host variant of restorecond is not used anywhere.

> diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
> new file mode 100644
> index 0000000000..6d8e5ed03b
> --- /dev/null
> +++ b/package/selinux-python/Config.in
> @@ -0,0 +1,63 @@
> +menuconfig BR2_PACKAGE_SELINUX_PYTHON
> +	bool "selinux python"

selinux-python (i.e exactly spelled like the package name)

> +	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
> +	depends on BR2_USE_MMU
> +	depends on BR2_USE_WCHAR 
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  A set of SELinux tools written in python that help with
> +	  managing a system with SELinux enabled. If no packages are
> +	  selected nothing will actually be built.
> +	  https://github.com/SELinuxProject/selinux/wiki
> +
> +if BR2_PACKAGE_SELINUX_PYTHON
> +
> +comment "packages"

Useless Config.in comment.

> +
> +config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
> +	bool "audit2allow"
> +	depends on BR2_USE_WCHAR # python3, sepolgen
> +	depends on BR2_USE_MMU # python3, sepolgen
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3, sepolgen, checkpolicy
> +	depends on !BR2_STATIC_LIBS # python3, sepolgen

python3 is selected above, so it's already guaranteed to be there, so
I'm not sure why you mention python3 in all those comments.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
> +	depends on !BR2_arc # checkpolicy
> +	select BR2_PACKAGE_CHECKPOLICY
> +	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
> +	help
> +	  This module installs two programs:
> +  	  
> +  	  audit2allow - Generate SELinux policy allow/dontaudit rules
> +  	  from logs of denied operations.
> +  	  
> +  	  audit2why - translates SELinux audit messages into a
> +  	  description of why the access was denied (audit2allow -w)
> +
> +comment "audit2allow needs a glibc toolchain w/ wchar, threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_arc
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
> +	bool "sepolgen"
> +	depends on BR2_USE_WCHAR # python3
> +	depends on BR2_USE_MMU # python3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> +	depends on !BR2_STATIC_LIBS # python3

Ditto.

> +	help
> +	  This package contains a Python module that allows you to
> +	  generate an initial SELinux policy module template.
> +
> +comment "sepolgen needs a toolchain w/ wchar, threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
> +
> +endif
> +
> +comment "SELinux Python packages needs a toolchain w/ wchar, threads, dynamic library"

comment "selinux-python needs a toolchain w/ ..."

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
