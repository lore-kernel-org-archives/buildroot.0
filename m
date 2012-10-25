From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Oct 2012 23:55:48 +0200
Subject: [Buildroot] [PATCH 02/47] package/libfdt: new package
In-Reply-To: <1351113973-17237-3-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-3-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5089B564.4090500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  The package is called dtc, not libfdt.

On 24/10/12 23:25, Yann E. MORIN wrote:
> libfdt allows one to manipulate a Flat Device Tree.

  Flattened Device Tree

>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> ---
>   package/Config.in                          |    1 +
>   package/dtc/Config.in                      |    9 +++++++
>   package/dtc/dtc-extra_cflags.patch         |   12 +++++++++
>   package/dtc/dtc-separate-lib-install.patch |   28 +++++++++++++++++++++
>   package/dtc/dtc.mk                         |   36 ++++++++++++++++++++++++++++
>   5 files changed, 86 insertions(+), 0 deletions(-)
>   create mode 100644 package/dtc/Config.in
>   create mode 100644 package/dtc/dtc-extra_cflags.patch
>   create mode 100644 package/dtc/dtc-separate-lib-install.patch
>   create mode 100644 package/dtc/dtc.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1650c71..c9cb3ed 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -396,6 +396,7 @@ source "package/libaio/Config.in"
>   source "package/libraw1394/Config.in"
>   source "package/tslib/Config.in"
>   source "package/libfreefare/Config.in"
> +source "package/dtc/Config.in"

  Alphabetical order.

  Also, even if for now it only installs libftd, I guess it shouldn't be
a problem to install dtc as well.  In that case it fits more in
Development tools or Hardware handling.

>   source "package/libftdi/Config.in"
>   source "package/libhid/Config.in"
>   source "package/libiqrf/Config.in"
> diff --git a/package/dtc/Config.in b/package/dtc/Config.in
> new file mode 100644
> index 0000000..7b86c60
> --- /dev/null
> +++ b/package/dtc/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_DTC
> +	bool "dtc"
> +	help
> +	  dtc is the Device Tree Compiler, to generate Device Trees.

  dtc generates Flattened Device Trees (i.e. it flattens the device
tree).

> +	  libfdt if a library to manipulate Flat Device Trees.

  Flattened

> +	
> +	  Note that only the library is installed for now.

  Why?  Build failures in the binaries?

> +	
> +	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
> diff --git a/package/dtc/dtc-extra_cflags.patch b/package/dtc/dtc-extra_cflags.patch
> new file mode 100644
> index 0000000..03225e7
> --- /dev/null
> +++ b/package/dtc/dtc-extra_cflags.patch
> @@ -0,0 +1,12 @@
> +diff -durN dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile
> +--- dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile	2012-10-22 22:02:47.541240846 +0200
> ++++ dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile	2012-10-22 22:03:21.151047833 +0200
> +@@ -18,7 +18,7 @@
> + CPPFLAGS = -I libfdt -I .
> + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> + 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
> +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> ++CFLAGS = -g -Os -fPIC -Werror $(WARNINGS) $(EXTRA_CFLAGS)

  Why not CFLAGS += ...?

  And maybe CPPFLAGS should also be fixed.

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
> +Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
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
> index 0000000..d53e78a
> --- /dev/null
> +++ b/package/dtc/dtc.mk
> @@ -0,0 +1,36 @@
> +#############################################################
> +#
> +# libcurl
> +#
> +#############################################################
> +
> +DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
> +DTC_SITE            = git://git.jdl.com/software/dtc.git
> +DTC_LICENSE         = GPLv2+/BSD-2c
> +DTC_LICENSE_FILES   = README.license GPL
> +# Note: the dual-license only applies to the library.
> +#       The DT compiler (dtc) is GPLv2+, but we do not install it.
> +DTC_INSTALL_STAGING = YES
> +
> +# Need -fPIC for x86-64

  ???

> +define DTC_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)                          \

  Looking at the Makefile, I don't see why parallel builds would fail...

> +	                                  EXTRA_CFLAGS="$(TARGET_CFLAGS)"   \
> +	                                  PREFIX=/usr                       \

  It's nicer to put these two options in DTC_MAKE_OPTS.

  Regards,
  Arnout

> +	                                  libfdt
> +endef
> +
> +# libfdt_install is our own install rule added by our patch
> +define DTC_INSTALL_STAGING_CMDS
> +	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
> +endef
> +
> +define DTC_INSTALL_TARGET_CMDS
> +	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr libfdt_install
> +endef
> +
> +define DTC_CLEAN_CMDS
> +	$(MAKE) -C $(@D) libfdt_clean
> +endef
> +
> +$(eval $(generic-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
