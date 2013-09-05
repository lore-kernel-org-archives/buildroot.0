From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 00:17:06 +0200
Subject: [Buildroot] [PATCH 1/1] omniorb: new package
In-Reply-To: <1378418584-21899-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1378418584-21899-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20130906001706.0c59d0ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 5 Sep 2013 17:03:04 -0500, Matt Weber wrote:

> +config BR2_PACKAGE_OMNIORB
> +	bool "omniorb"
> +	help
> +          omniORB is a robust high performance CORBA ORB for C++ and Python. 

Indentation of those lines should be one tab + two spaces, not two tabs.

> +          omniORB is largely CORBA 2.6 compliant. omniORB is one of only three ORBs 
> +          to have been awarded the Open Group's Open Brand for CORBA. This means that 
> +          omniORB has been tested and certified CORBA compliant, to version 2.1 of the 
> +          CORBA specification. You can find out more about the branding program at 
> +          the Open Group.

These lines looks slightly too long. They should fit in 72 columns if I
remember correctly.

> +config BR2_OMNIORB_EXTRA_CONFIG_OPTIONS
> +	string "Additional omniorb configuration options"
> +	depends on BR2_PACKAGE_OMNIORB
> +	default ""
> +	help
> +	  Any additional configure options you may want to include.

We generally don't offer such 'free' options for packages, so I'd
prefer not having it, unless there are good reasons for it.

> diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
> new file mode 100644
> index 0000000..ed2a7e7
> --- /dev/null
> +++ b/package/omniorb/omniorb.mk
> @@ -0,0 +1,68 @@
> +################################################################################
> +#
> +# omniorb 
> +#
> +################################################################################
> +
> +OMNIORB_VERSION = 4.1.6
> +OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-${OMNIORB_VERSION}

Please use $(...) instead of ${...} everywhere.

> +OMNIORB_SOURCE = omniORB-${OMNIORB_VERSION}.tar.bz2
> +OMNIORB_INSTALL_STAGING = YES
> +OMNIORB_INSTALL_TARGET = YES

This last line is not needed, that's the default.

> +OMNIORB_DEPENDENCIES = python 

Then this package either needs a depends on BR2_PACKAGE_PYTHON or a
select BR2_PACKAGE_PYTHON. What is omniORB exactly? Is it just a set of
Python modules? Something more than that?

> +OMNIORB_LICENSE = GPL2 LGPLv2.1

Can you check it's not GPLv2+ and LGPLv2.1+ by looking at the copyright
headers in the source code.

> +OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
> +
> +OMNIORB_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_OMNIORB_EXTRA_CONFIG_OPTIONS))
> +
> +OMNIORB_CONF_OPT = $(OMNIORB_EXTRA_CONFIG_OPTIONS)

As per the above comment, these two lines should probably be removed.

> +
> +# The following is a space-separated list of files that need to have directory fixups
> +OMNIORB_FIXUP_FILES = ${STAGING_DIR}/usr/bin/omniidl
> +
> +define OMNIORB_INSTALL_STAGING_CMDS
> +	echo "Installing to staging dir: $(STAGING_DIR)"
> +	$(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_INSTALL_STAGING_OPT) -C $($(PKG)_SRCDIR)
> +	for i in $(OMNIORB_FIXUP_FILES); do \
> +	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $$i; \
> +	done
> +endef
> +
> +define OMNIORB_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_SRCDIR)
> +endef

For autotools packages, please don't overload the
<pkg>_INSTALL_STAGING_CMDS and <pkg>_INSTALL_TARGET_COMMANDS.

If you need to do some tweaking after the staging installation, use a
POST_INSTALL_STAGING_HOOKS (see the Buildroot manual for details).

> +# OMNIORB has some host tools integrated into it's build.  We first build those, then use
> +# the host IDL2CPP/depend tools to generate code for the target compilation

Hum... I believe a post configure hook might be more appropriate here.
Something like:

define OMNIORB_BUILD_HOST_TOOLS
	$(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/tool/omkdepend
	cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
	$(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/tool/omniidl/cxx/cccp
	$(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/tool/omniidl/cxx
endef

Or, the alternative is to build a complete host variant of omniorb.

> +define OMNIORB_BUILD_CMDS
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omkdepend
> +	cp $($(PKG)_SRCDIR)src/tool/omkdepend/omkdepend $($(PKG)_SRCDIR)/bin
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx/cccp
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx
> +	${TARGET_MAKE_ENV} ${MAKE} -C $($(PKG)_SRCDIR)
> +endef
> +
> +define OMNIORB_CLEAN_CMDS
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omkdepend clean
> +	$(RM) $($(PKG)_SRCDIR)/bin/omkdepend
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx/cccp clean
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($(PKG)_SRCDIR)src/tool/omniidl/cxx clean
> +	${TARGET_MAKE_ENV} ${MAKE} -C $($(PKG)_SRCDIR) clean
> +endef
> +
> +define OMNIORB_UNINSTALL_STAGING_CMDS
> +	$(RM) -r ${STAGING_DIR}/usr/include/omniORB4 ${STAGING_DIR}/usr/include/omnithread
> +	$(RM) ${STAGING_DIR}/usr/include/omniconfig.h ${STAGING_DIR}/usr/include/omnithread.h
> +	$(RM) ${STAGING_DIR}/usr/lib/libomni*
> +	$(RM) ${STAGING_DIR}/usr/bin/omni* ${STAGING_DIR}/usr/bin/omkdepend
> +endef
> +
> +define OMNIORB_UNINSTALL_TARGET_CMDS
> +	$(RM) -r ${TARGET_DIR}/usr/include/omniORB4 ${TARGET_DIR}/usr/include/omnithread
> +	$(RM) ${TARGET_DIR}/usr/include/omniconfig.h ${TARGET_DIR}/usr/include/omnithread.h
> +	$(RM) ${TARGET_DIR}/usr/lib/libomni*
> +	$(RM) ${TARGET_DIR}/usr/bin/omni* ${TARGET_DIR}/usr/bin/omkdepend
> +endef

We generally don't bother implementing uninstall and clean commands.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
