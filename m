From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Sep 2013 23:41:27 +0200
Subject: [Buildroot] [PATCH v3] omniorb: new package
In-Reply-To: <1379017961-22950-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Thu, 12 Sep 2013 15:32:41 -0500")
References: <1379017961-22950-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87six9pvjs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 Matt> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
 Matt> ---
 Matt> Changes v2 -> v3
 Matt>   * Removed depend on python as the mk accounts for it 
 Matt>     package/omniorb/Config.in (suggested by Thomas)
 Matt>   * Added link to website package/omniorb/Config.in (suggested by Thomas)
 Matt>   * Added note about host python requirement for build 
 Matt>     package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Removed staging loop of fixing file paths for a single file.  Instead it 
 Matt>     no just operates on a single file package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Fixed brackets  package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Cleaned up host tool comment  package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Cleaned up host tools to use HOST_CONFIGURE_OPTS to fix ccache 
 Matt>     support package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Switched over to use a make tools export and clean hook.  Required
 Matt>     patching of the package to correctly assign the CC/CXX/etc defines.
 Matt>     Submitted this patch upsteam as well as including in this patchset.
 Matt>     package/omniorb/omniorb.mk (suggested by Arnout)

 Matt> Changes v1 -> v2:
 Matt>   * Fixed formatting of help and added select of python in  package/omniorb/Config.in (suggested by Thomas)
 Matt>   * Removed extra open ended config option as it isn't used  package/omniorb/Config.in (suggested by Thomas)
 Matt>   * Cleaned up use of brackets and replaced with braces package/omniorb/Config.in (suggested by Thomas)
 Matt>   * Updated licenses to be GPL and LGPL with a + package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Removed redundant conf opt and target install sets package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Added a post install step to replace overloading the default staging installs package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Broke out tools(host) build into seperate post conf step package/omniorb/omniorb.mk (suggested by Thomas)
 Matt>   * Removed clean and uninstall package/omniorb/omniorb.mk (suggested by Thomas)

 Matt>  package/Config.in                                  |    1 +
 Matt>  package/omniorb/Config.in                          |   10 ++++
 Matt>  ...mniorb-0001-supportCrossCompileToolExport.patch |   27 +++++++++++
 Matt>  package/omniorb/omniorb.mk                         |   47 ++++++++++++++++++++
 Matt>  4 files changed, 85 insertions(+), 0 deletions(-)
 Matt>  create mode 100644 package/omniorb/Config.in
 Matt>  create mode 100644 package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch
 Matt>  create mode 100644 package/omniorb/omniorb.mk

 Matt> diff --git a/package/Config.in b/package/Config.in
 Matt> index 02e5afc..820fae2 100644
 Matt> --- a/package/Config.in
 Matt> +++ b/package/Config.in
 Matt> @@ -624,6 +624,7 @@ source "package/libupnp/Config.in"
 Matt>  source "package/libvncserver/Config.in"
 Matt>  source "package/libwebsockets/Config.in"
 Matt>  source "package/nss-mdns/Config.in"
 Matt> +source "package/omniorb/Config.in"
 Matt>  source "package/openpgm/Config.in"
 Matt>  source "package/ortp/Config.in"
 Matt>  source "package/slirp/Config.in"
 Matt> diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
 Matt> new file mode 100644
 Matt> index 0000000..327de03
 Matt> --- /dev/null
 Matt> +++ b/package/omniorb/Config.in
 Matt> @@ -0,0 +1,10 @@
 Matt> +config BR2_PACKAGE_OMNIORB
 Matt> +	bool "omniorb"
 Matt> +	help
 Matt> +	  omniORB is a robust high performance CORBA ORB for C++ and Python.
 Matt> +	  omniORB is largely CORBA 2.6 compliant. omniORB is one of only 
 Matt> +	  three ORBs to have been awarded the Open Group's Open Brand for 
 Matt> +	  CORBA. This means that omniORB has been tested and certified 
 Matt> +	  CORBA compliant, to version 2.1 of the CORBA specification. 

Presumably this needs to depend on BR2_INSTALL_LIBSTCPP and show a
comment if the toolchain doesn't have C++ support.

You also have a number of trailing spaces in the help text.


 Matt> +
 Matt> +	  http://omniorb.sourceforge.net/
 Matt> diff --git a/package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch b/package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch
 Matt> new file mode 100644
 Matt> index 0000000..20643a0
 Matt> --- /dev/null
 Matt> +++ b/package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch
 Matt> @@ -0,0 +1,27 @@
 Matt> +
 Matt> +This patch has been posted upstream (mlweber1 at rockwellcollins.com) 09/12/2013.
 Matt> +

Please provide a git-style description of what the patch does and your
signed-off-by.

If possible, add a link to the mailing list archive of the patch you
sent upstream.

I believe you were already asked to rename this patch filename to lower case/words-seperated-by-dashes?

 Matt> diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
 Matt> new file mode 100644
 Matt> index 0000000..5dd1a98
 Matt> --- /dev/null
 Matt> +++ b/package/omniorb/omniorb.mk
 Matt> @@ -0,0 +1,47 @@
 Matt> +################################################################################
 Matt> +#
 Matt> +# omniorb
 Matt> +#
 Matt> +################################################################################
 Matt> +
 Matt> +OMNIORB_VERSION = 4.1.6
 Matt> +OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 Matt> +OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 Matt> +OMNIORB_INSTALL_STAGING = YES
 Matt> +OMNIORB_LICENSE = GPL2+ LGPLv2.1+
 Matt> +OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 Matt> +# Required for internal code generation scripts
 Matt> +OMNIORB_DEPENDENCIES = host-python
 Matt> +
 Matt> +ifeq ($(BR2_PACKAGE_PYTHON),y)
 Matt> +	OMNIORB_DEPENDENCIES += python
 Matt> +	OMNIORB_CONF_OPT += --enable-python-bindings
 Matt> +else
 Matt> +	OMNIORB_CONF_OPT += --disable-python-bindings
 Matt> +endif
 Matt> +
 Matt> +# OMNIORB is currently not cross-compile friendly and has some assumptions 
 Matt> +# where a couple host tools are built in place and then used during the 
 Matt> +# build.  The tools generate code from the IDL description language, which 
 Matt> +# is then built into the cross compiled OMNIORB application.
 Matt> +# So this first hook builds the tools required for the host side 
 Matt> +# generation of code. Then the second hook cleans up before the install.

Why the upper case OMNIORB?


 Matt> +define OMNIORB_BUILD_TOOLS
 Matt> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
 Matt> +		-C $(@D)/src/tool export
 Matt> +endef
 Matt> +OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_BUILD_TOOLS
 Matt> +
 Matt> +define OMNIORB_CLEAN_TOOLS
 Matt> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
 Matt> +		-C $(@D)/src/tool clean
 Matt> +endef
 Matt> +OMNIORB_POST_BUILD_HOOKS += OMNIORB_CLEAN_TOOLS
 Matt> +
 Matt> +define OMNIORB_FIXUP_FILE_PATHS_HOOK
 Matt> +	$(SED) "s:$(HOST_DIR)/usr:/usr:g" $(STAGING_DIR)/usr/bin/omniidl;
 Matt> +endef
 Matt> +OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS_HOOK 
 Matt> +
 Matt> +$(eval $(autotools-package))
 Matt> +

Please don't add empty lines after autotools-package. You also have a
number of trailing spaces.

-- 
Bye, Peter Korsgaard
