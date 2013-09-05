From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 09:51:29 +0200
Subject: [Buildroot] [PATCH 02/17] libselinux: new package
In-Reply-To: <1378336196-27403-3-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378336196-27403-3-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130905095129.7396d46c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 4 Sep 2013 18:09:41 -0500, Clayton Shotwell wrote:

>  menu "Security"
>  source "package/libsepol/Config.in"
> +source "package/libselinux/Config.in"
>  endmenu

Same comment as previous package: libselinux is a library, so it should
be under Target packages -> Libraries.

>  
>  menu "System tools"
> diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
> new file mode 100644
> index 0000000..4f3be64
> --- /dev/null
> +++ b/package/libselinux/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LIBSELINUX
> +	bool "libselinux"
> +	depends on BR2_LINUX_KERNEL

Hum, can you clarify why a dependency on the kernel is needed here?

> +	help
> +	  libselinux is the runtime SELinux library that provides interfaces 
> +	  (e.g. library functions for the SELinux kernel APIs like getcon(), 
> +	  other support functions like getseuserbyname()) to SELinux-aware 
> +	  applications. libselinux may use the shared libsepol to manipulate 
> +	  the binary policy if necessary (e.g. to downgrade the policy format 
> +	  to an older version supported by the kernel) when loading policy.
> +	  
> +	  http://selinuxproject.org/page/Main_Page
> +
> +if BR2_PACKAGE_LIBSELINUX
> +
> +config BR2_PACKAGE_LIBSELINUX_PYTHON_BINDINGS
> +	select BR2_PACKAGE_PYTHON

Here I am not sure whether we should have:

 (1) An option that selects BR2_PACKAGE_PYTHON (as you did)

 (2) An option that depends on BR2_PACKAGE_PYTHON

 (3) No option at all, and have the package automatically enable Python
     bindings when BR2_PACKAGE_PYTHON is enabled.

What do the others think?

> +	bool "python bindings"
> +	help
> +	  enable building python bindings
> +
> +endif
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> new file mode 100644
> index 0000000..ed90186
> --- /dev/null
> +++ b/package/libselinux/libselinux.mk
> @@ -0,0 +1,128 @@
> +################################################################################
> +#
> +# libselinux
> +#
> +################################################################################

One empty line between header and variables.

> +LIBSELINUX_VERSION = 2.1.13
> +LIBSELINUX_SOURCE = libselinux-$(LIBSELINUX_VERSION).tar.gz

This line is not needed, that's the default value.

> +LIBSELINUX_SITE = http://userspace.selinuxproject.org/releases/20130423/
> +LIBSELINUX_LICENSE = PublicDomain
> +LIBSELINUX_LICENSE_FILES = LICENSE
> +
> +##############################
> +# Target Section
> +##############################

Comment not needed.

> +LIBSELINUX_DEPENDENCIES = libsepol pcre

Then you should select BR2_PACKAGE_LIBSEPOL and BR2_PACKAGE_PCRE in
your Config.in file.

> +
> +LIBSELINUX_INSTALL_STAGING = YES
> +LIBSELINUX_INSTALL_TARGET = YES

This last line is not needed, that's the default.

> +
> +LIBSELINUX_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"

This could use a little bit of wrapping:

LIBSELINUX_MAKE_CMDS = \
	$(TARGET_CONFIGURE_OPTS) \
	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"

BTW, I'm not sure _MAKE_CMDS is really the appropriate suffix, maybe
_MAKE_OPTS ?

> +ifeq ($(BR2_PACKAGE_LIBSELINUX_PYTHON_BINDINGS),y)
> +
> +LIBSELINUX_DEPENDENCIES += python host-swig host-python
> +LIBSELINUX_MAKE_CMDS += PYINC="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
> +	PYTHONLIBDIR="-L$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
> +	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
> +	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
> +
> +define LIBSELINUX_PYTHON_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR) swigify
> +	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR) pywrap

DESTDIR really needed at build time ?

> +endef
> +
> +define LIBSELINUX_PYTHON_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) install-pywrap $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define LIBSELINUX_PYTHON_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) install-pywrap $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
> +endef
> +
> +define LIBSELINUX_PYTHON_UNINSTALL_STAGING_CMDS
> +	rm -rf $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/selinux
> +endef
> +
> +define LIBSELINUX_PYTHON_UNINSTALL_TARGET_CMDS
> +	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/selinux
> +endef

You can get rid of install commands.

> +
> +endif
> +
> +define LIBSELINUX_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR) all

DESTDIR unneeded at build time.

> +	$(LIBSELINUX_PYTHON_BUILD_CMDS)
> +endef
> +
> +define LIBSELINUX_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +	$(LIBSELINUX_PYTHON_INSTALL_STAGING_CMDS)
> +endef
> +
> +define LIBSELINUX_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) install $(LIBSELINUX_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
> +	$(LIBSELINUX_PYTHON_INSTALL_TARGET_CMDS)
> +endef
> +
> +define LIBSELINUX_CLEAN_CMDS
> +	$(MAKE) -C $(@D) clean
> +endef
> +
> +LIBSELINUX_SBIN_FILES = avcstat compute_av compute_create compute_member \
> +	compute_relabel compute_user getconlist getdefaultcon getenforce \
> +	getfilecon getpidcon getsebool getseuser matchpathcon policyvers \
> +	sefcontext_compile selinux_check_securetty_context selinuxenabled \
> +	selinuxexeccon setenforce setfilecon togglesebool
> +
> +define LIBSELINUX_UNINSTALL_STAGING_CMDS
> +	rm -rf $(addprefix $(STAGING_DIR), /usr/include/selinux \
> +		$(addprefix /usr/sbin/, $(LIBSELINUX_SBIN_FILES)) \
> +		/usr/lib/pkgconfig/libselinux* /usr/lib/libselinux* /lib/libselinux*)
> +	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man3/*.3)))
> +	rm -f $(addprefix $(STAGING_DIR)/usr/man/man5/,$(notdir $(wildcard $(@D)/man/man5/*.5)))
> +	rm -f $(addprefix $(STAGING_DIR)/usr/man/man8/,$(notdir $(wildcard $(@D)/man/man8/*.8)))
> +	$(LIBSELINUX_PYTHON_UNINSTALL_STAGING_CMDS)
> +endef
> +
> +define LIBSELINUX_UNINSTALL_TARGET_CMDS
> +	rm -rf $(addprefix $(TARGET_DIR), /usr/include/selinux \
> +		$(addprefix /usr/sbin/, $(LIBSELINUX_SBIN_FILES)) \
> +		/usr/lib/pkgconfig/libselinux* /usr/lib/libselinux* /lib/libselinux*)
> +	$(LIBSELINUX_PYTHON_UNINSTALL_TARGET_CMDS)
> +endef

Yeah, just drop the uninstall commands.

> +##############################
> +# Host Section
> +##############################

Drop this header.

> +HOST_LIBSELINUX_DEPENDENCIES = host-python host-libsepol host-swig host-pcre

So for the host variant, the Python bindings are always enabled? Is
there a reason for that?

> +
> +HOST_LIBSELINUX_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread"\
> +	PYINC="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/" \
> +	PYTHONLIBDIR="-L$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/" \
> +	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
> +	SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/" \
> +
> +define HOST_LIBSELINUX_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR) all
> +	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR) swigify
> +	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR) pywrap

DESTDIR usually not needed at build time.

> +endef
> +
> +define HOST_LIBSELINUX_INSTALL_CMDS
> +	$(MAKE) -C $(@D) install install-pywrap $(HOST_LIBSELINUX_MAKE_CMDS) DESTDIR=$(HOST_DIR)
> +	mv $(HOST_DIR)/lib/libselinux.so.1 $(HOST_DIR)/usr/lib
> +	(cd $(HOST_DIR)/usr/lib; rm -f libselinux.so; ln -s libselinux.so.1 libselinux.so)
> +	rmdir $(HOST_DIR)/lib
> +	(if -f $(HOST_DIR)/sbin/matchpathcon; then \
> +		mv $(HOST_DIR)/sbin/matchpathcon $(HOST_DIR)/usr/sbin/; \
> +		rmdir $(HOST_DIR)/sbin; \
> +	fi)

Same suggestion as above: what if you pass DESTDIR=$(HOST_DIR)/usr ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
