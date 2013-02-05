From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Feb 2013 08:16:21 +0100
Subject: [Buildroot] [PATCH 6/7] package/dtc: new package
In-Reply-To: <cee97011df7a8e715cbb2faad083a8e928f103a2.1359993560.git.yann.morin.1998@free.fr>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <cee97011df7a8e715cbb2faad083a8e928f103a2.1359993560.git.yann.morin.1998@free.fr>
Message-ID: <5110B1C5.3040200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 17:01, Yann E. MORIN wrote:
> dtc is the Device Tree Compiler, and manipulates device trees.
>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> ---
> Although Arnout suggested to move it out of the libraries sub-menu,
> I kept it there, as by default, only the library is installed, like
> it is done for, eg., libcurl.
> ---
>   package/Config.in                          |    1 +
>   package/dtc/Config.in                      |    9 +++++++
>   package/dtc/dtc-extra_cflags.patch         |   27 ++++++++++++++++++++++
>   package/dtc/dtc-separate-lib-install.patch |   28 +++++++++++++++++++++++
>   package/dtc/dtc.mk                         |   34 ++++++++++++++++++++++++++++
>   5 files changed, 99 insertions(+), 0 deletions(-)
>   create mode 100644 package/dtc/Config.in
>   create mode 100644 package/dtc/dtc-extra_cflags.patch
>   create mode 100644 package/dtc/dtc-separate-lib-install.patch
>   create mode 100644 package/dtc/dtc.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index a071a5f..f4a331c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -443,6 +443,7 @@ endmenu
>
>   menu "Hardware handling"
>   source "package/ccid/Config.in"
> +source "package/dtc/Config.in"
>   source "package/imx-lib/Config.in"
>   source "package/lcdapi/Config.in"
>   source "package/libaio/Config.in"
> diff --git a/package/dtc/Config.in b/package/dtc/Config.in
> new file mode 100644
> index 0000000..96225e3
> --- /dev/null
> +++ b/package/dtc/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_DTC
> +	bool "dtc"
> +	help
> +	  The Device Tree Compiler, dtc, takes as input a device-tree in
> +	  a given format and outputs a device-tree in another format.
> +	
> +	  Note that only the library is installed for now.
> +	
> +	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
> diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/dtc-extra_cflags.patch
> new file mode 100644
> index 0000000..9d1882b
> --- /dev/null
> +++ b/package/dtc/dtc-extra_cflags.patch
> @@ -0,0 +1,27 @@
> +Makefile: append the CFLAGS to existing ones
> +
> +Allow the user to pass custom CFLAGS (eg. optimisation flags).
> +
> +Do not use EXTRA_CFLAGS, append to existing CFLAGS with +=  (Arnout)
> +
> +Cc: Arnout Vandecappelle <arnout@mind.be>
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +---
> +Patch not sent upstream.
> +
> +Although not specific to buildroot, I am not sure this is the best
> +way to handle user-supplied CFLAGS.

  It is the proper way according to info '(make)Command Variables'

"If there are C compiler options that _must_ be used for proper
compilation of certain files, do not include them in `CFLAGS'.  Users
expect to be able to specify `CFLAGS' freely themselves.  Instead,
arrange to pass the necessary options to the C compiler independently
of `CFLAGS'..."

  Admittedly, the example that is given in the GNU make manual is a 
different approach: set the options that must be used directly in the rule.

> +
> +diff -durN dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile
> +--- dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile	2012-10-22 22:02:47.541240846 +0200
> ++++ dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile	2012-10-22 22:03:21.151047833 +0200
> +@@ -18,7 +18,7 @@
> + CPPFLAGS = -I libfdt -I .
> + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> + 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
> +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> ++CFLAGS += -g -Os -fPIC -Werror $(WARNINGS)

  Actually this is not yet entirely perfect, because the -g -Os -W... 
should be overridable by the user. I would have put:

CFLAGS ?= -g -Os -Werror $(WARNINGS)
CFLAGS += -fPIC

  (but that's a matter of opinion, I guess.

> +
> + BISON = bison
> + LEX = flex
> diff --git a/package/dtc/dtc-separate-lib-install.patch b/package/dtc/dtc-separate-lib-install.patch
> new file mode 100644
> index 0000000..c86d587
> --- /dev/null
> +++ b/package/dtc/dtc-separate-lib-install.patch
> @@ -0,0 +1,28 @@
> +Makefile: add a rule to only install libfdt
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +---
> +Patch not sent upstream.
> +
> +It's really specific to buildroot, and is probably not
> +good (aka generic) enough to be pushed upstream.
> +
> +diff --git a/Makefile b/Makefile
> +index 1169e6c..39e7190 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -160,10 +160,12 @@ endif
> + # intermediate target and building them again "for real"
> + .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
> +
> +-install: all $(SCRIPTS)
> ++install: all $(SCRIPTS) libfdt_install
> + 	@$(VECHO) INSTALL
> + 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
> + 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
> ++
> ++libfdt_install: libfdt
> + 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
> + 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
> + 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> new file mode 100644
> index 0000000..a0e1e35
> --- /dev/null
> +++ b/package/dtc/dtc.mk
> @@ -0,0 +1,34 @@
> +#############################################################
> +#
> +# dtc
> +#
> +#############################################################
> +
> +DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
> +DTC_SITE            = git://git.jdl.com/software/dtc.git

  I realize the choice between the in-kernel or external version was 
discussed before, but isn't it a bit strange that host-dtc is created 
from the in-kernel tree, while target-dtc uses the external tree?

  (this doesn't affect this patch, of course, since host support can be 
added later).

> +DTC_LICENSE         = GPLv2+/BSD-2c
> +DTC_LICENSE_FILES   = README.license GPL
> +# Note: the dual-license only applies to the library.
> +#       The DT compiler (dtc) is GPLv2+, but we do not install it.
> +DTC_INSTALL_STAGING = YES
> +
> +define DTC_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS)    \
> +	CFLAGS="$(TARGET_CFLAGS)"   \

  This is already in TARGET_CONFIGURE_OPTS...

> +	$(MAKE) -C $(@D) PREFIX=/usr libfdt
> +endef
> +
> +# libfdt_install is our own install rule added by our patch
> +define DTC_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
> +endef
> +
> +define DTC_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr libfdt_install
> +endef

  Another nice use-case of the unified install :-)


  Regards,
  Arnout

> +
> +define DTC_CLEAN_CMDS
> +	$(MAKE) -C $(@D) libfdt_clean
> +endef
> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
