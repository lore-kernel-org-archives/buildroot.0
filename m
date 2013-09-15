From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 20:45:50 +0200
Subject: [Buildroot] [PATCH v5] omniorb: new package
In-Reply-To: <1379089723-7253-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Fri, 13 Sep 2013 11:28:43 -0500")
References: <1379089723-7253-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87six5ly8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 Matt> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
 Matt> ---
 Matt> Changes v4 -> v5
 Matt>   * Fixed depend bug, didn't retest Kconfig before submitting v4
 Matt>     package/omniorb/Config.in

I'm afraid you still didn't test enough, as there's a small error:

 Matt> +++ b/package/omniorb/Config.in
 Matt> @@ -0,0 +1,14 @@
 Matt> +config BR2_PACKAGE_OMNIORB
 Matt> +	bool "omniorb"
 Matt> +	depends on BR2_INSTALL_LIBSTCPP
 Matt> +	help
 Matt> +	  omniORB is a robust high performance CORBA ORB for C++ and Python.
 Matt> +	  omniORB is largely CORBA 2.6 compliant. omniORB is one of only
 Matt> +	  three ORBs to have been awarded the Open Group's Open Brand for
 Matt> +	  CORBA. This means that omniORB has been tested and certified
 Matt> +	  CORBA compliant, to version 2.1 of the CORBA specification.
 Matt> +
 Matt> +	  http://omniorb.sourceforge.net/
 Matt> +
 Matt> +comment "omniORB requires a toolchain with C++ support"
 Matt> +	depends on !BR2_INSTALL_LIBSTCPP

The C++ symbol is BR2_INSTALL_LIBSTDCPP, both places.

 Matt> +# omniORB is currently not cross-compile friendly and has some assumptions 
 Matt> +# where a couple host tools are built in place and then used during the 
 Matt> +# build.  The tools generate code from the IDL description language, which 
 Matt> +# is then built into the cross compiled OMNIORB application.
 Matt> +# So this first hook builds the tools required for the host side 
 Matt> +# generation of code. Then the second hook cleans up before the install.

You still have some trailing spaces here.

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

The final ';' isn't needed.

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard
