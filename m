From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 18:55:01 +0200
Subject: [Buildroot] [PATCH v2] omniorb: new package
In-Reply-To: <1378923239-30344-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1378923239-30344-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20130912185501.31c30f18@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

Thanks for this updated version. There are still a few things to fix,
but we're definitely approaching something that can be applied. See
below.

On Wed, 11 Sep 2013 13:13:59 -0500, Matt Weber wrote:

> diff --git a/package/Config.in b/package/Config.in
> index a94cb62..b4cc869 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -600,6 +600,7 @@ source "package/libupnp/Config.in"
>  source "package/libvncserver/Config.in"
>  source "package/libwebsockets/Config.in"
>  source "package/nss-mdns/Config.in"
> +source "package/omniorb/Config.in"
>  source "package/openpgm/Config.in"
>  source "package/ortp/Config.in"
>  source "package/slirp/Config.in"
> diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
> new file mode 100644
> index 0000000..eaa1585
> --- /dev/null
> +++ b/package/omniorb/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_OMNIORB
> +	bool "omniorb"
> +	select BR2_PACKAGE_PYTHON

You shouldn't select BR2_PACKAGE_PYTHON here: it is not a mandatory
dependency, and your package automatically enables Python bindings when
the target Python package is enabled.

> +	help
> +	  omniORB is a robust high performance CORBA ORB for C++ and Python.
> +	  omniORB is largely CORBA 2.6 compliant. omniORB is one of only 
> +	  three ORBs to have been awarded the Open Group's Open Brand for 
> +	  CORBA. This means that omniORB has been tested and certified 
> +	  CORBA compliant, to version 2.1 of the CORBA specification. 

Please add an empty line here, and then the upstream URL of the project
(http://omniorb.sourceforge.net/). See
http://buildroot.org/downloads/manual/manual.html#writing-rules-config-in.

> diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
> new file mode 100644
> index 0000000..15f7ced
> --- /dev/null
> +++ b/package/omniorb/omniorb.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# omniorb
> +#
> +################################################################################
> +
> +OMNIORB_VERSION = 4.1.6
> +OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
> +OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
> +OMNIORB_INSTALL_STAGING = YES
> +OMNIORB_LICENSE = GPL2+ LGPLv2.1+
> +OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
> +OMNIORB_DEPENDENCIES += host-python

Is Python really needed to *build* omniorb? Note that Python is already
a core dependency of Buildroot, so normally there's no need to depend
on host-python, but I agree that this is not a rule that is
consistently applied across Buildroot today.

(Also, note that the += is unnecessary, we usually use a normal = here).

> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +	OMNIORB_DEPENDENCIES += python
> +	OMNIORB_CONF_OPT += --enable-python-bindings
> +else
> +	OMNIORB_CONF_OPT += --disable-python-bindings
> +endif

This looks good, provided you remove the "select BR2_PACKAGE_PYTHON" in
the Config.in file.

> +# The following is a space-separated list of files that need to have directory fixups
> +OMNIORB_FIXUP_FILES = ${STAGING_DIR}/usr/bin/omniidl
> +
> +# Should be able to create a patch that cleans this up.........
> +define OMNIORB_FIXUP_FILE_PATHS_HOOK
> +	echo "Fixing file paths..."
> +	for i in $(OMNIORB_FIXUP_FILES); do \
> +	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $$i; \
> +	done
> +endef
> +OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS_HOOK 

It seems a bit too much to have a loop when a single file needs to be
fixed. I believe the fixup you're doing here is the right solution, so
no need for a comment that explains it should be turned into a patch.

Also, something that is incorrect in various places in your .mk file:
you should *always* use $(...) to reference make variables, and not
${...}.

So, you can do something like:

define OMNIORB_FIXUP_FILE_PATHS
	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $(STAGING_DIR)/usr/bin/omniidl
endef
OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS

> +# OMNIORB is currently not cross-compile friendly and has some assumptions where
> +# a couple host tools are built in place and then used during the build.  The tools
> +# generate code from the IDL description language, which is then built into the 
> +# cross compiled OMNIORB application.
> +# So this hook first builds the couple tools required for the host side generation of code.
> +# It then leaves/places them in the locations where the existing build infrastructure expects.

Excellent comment. Can you just wrap the lines at a slightly smaller
length?

> +define OMNIORB_TOOLS_HOOK
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $(@D)/src/tool/omkdepend
> +	cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $(@D)/src/tool/omniidl/cxx/cccp
> +	${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $(@D)/src/tool/omniidl/cxx

Please use $(...) instead of ${...} for all variables. Also, you should
use quotes when passing CC or CXX, or you'll break the ccache support
that adds a space within the value of $(HOSTCXX) and $(HOSTCC). And in
fact, instead of passing HOSTCXX and HOSTCC manually, we can just use
$(HOST_CONFIGURE_OPTS) :

	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/tool/omkdepend
	cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/tool/omniidl/cxx/cccp
	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/tool/omniidl/cxx

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
