From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 02:30:32 +0100
Subject: [Buildroot] [PATCH 1/7] docs/manual: update 'adding packages'
 with the new _AVAILABLE symbol
In-Reply-To: <1347234052-10527-2-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <1347234052-10527-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5091D0B8.6050404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/12 01:40, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> ---
>   docs/manual/adding-packages-autotools.txt |   48 ++++++--
>   docs/manual/adding-packages-directory.txt |  190 +++++++++++++++--------------
>   docs/manual/adding-packages-generic.txt   |   85 ++++++++-----
>   3 files changed, 191 insertions(+), 132 deletions(-)
>
> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
> index 9fb0918..0f14489 100644
> --- a/docs/manual/adding-packages-autotools.txt
> +++ b/docs/manual/adding-packages-autotools.txt
> @@ -20,10 +20,24 @@ package, with an example :
>   08: LIBFOO_SITE = http://www.foosoftware.org/download
>   09: LIBFOO_INSTALL_STAGING = YES
>   10: LIBFOO_INSTALL_TARGET = YES
> -11: LIBFOO_CONF_OPT = --enable-shared
> -12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
> -13:
> -14: $(eval $(autotools-package))
> +11: LIBFOO_DEPENDENCIES = host-libaaa libbbb

  In the Config.in example, it's libbar, not libbb.

> +12:
> +13: ifeq ($(BR2_PACKAGE_LIBFOO_FROBBLE),y)
> +14: LIBFOO_CONF_OPT += --enable-frobble
> +15: else
> +16: LIBFOO_CONF_OPT += --disable-frobble
> +17: endif
> +18:
> +19: LIBFOO_CONF_OPT += --with-gazzle-level=$(BR2_PACKAGE_LIBFOO_GAZZLE_LEVEL)

  This one is going a bit too far...  And if you keep it, it should
probably have a qstrip.

> +20:
> +21: ifeq ($(BR2_PACKAGE_LIBFOO_GOO),y)
> +22: LIBFOO_DEPENDENCIES += goo
> +23: LIBFOO_CONF_OPT += --enable-goo
> +24: else
> +25: LIBFOO_CONF_OPT += --disable-goo
> +26: endif

  While you're at it, an automatic enable/disable example would
be nice too.

> +27:
> +28: $(eval $(autotools-package))
>   ------------------------
>
>   On line 6, we declare the version of the package.
> @@ -50,16 +64,26 @@ installation is enabled, so in fact, this line is not strictly
>   necessary. Also by default, packages are installed in this location
>   using the +make install+ command.
>
> -On line 11, we tell Buildroot to pass a custom configure option, that
> -will be passed to the +./configure+ script before configuring
> -and building the package.
> +On line 11, we declare our dependencies, so that they are built before the
> +build process of our package starts.
>
> -On line 12, we declare our dependencies, so that they are built
> -before the build process of our package starts.
> +On lines 13 to 17, if the user selected the option 'frobble'
> ++BR2_PACKAGE_LIBFOO_FROBBLE+, we add the corresponding configure option
> +to enable 'frobble' (line 14), or disable it (line 16), that will be
> +passed to the +./configure+ script before configuring and building the
> +package.

  "before configuring and building the package" is redundant.

>
> -Finally, on line line 14, we invoke the +autotools-package+
> -macro that generates all the Makefile rules that actually allows the
> -package to be built.
> +Similarly, on line 19, we add the configure option that defines the
> +'bazzle level' +BR2_PACKAGE_LIBFOO_GAZZLE_LEVEL+.

  bazzle -> gazzle.

> +
> +On lines 21 to 26, if user selected the option 'goo' +BR2_PACKAGE_LIBFOO_GOO+,
> +we add a dependency on the package +goo+ (line 22), and add the corresponding
> +configure option to enable 'goo' (line 23); or if 'goo' support is not
> +selected, we pass the configure option to disable it (line 25).
> +
> +Finally, on line line 28, we invoke the +autotools-package+ macro that
> +generates all the Makefile rules that actually allows the package to be
> +built.
>
>   [[autotools-package-reference]]
>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 4a96415..4863332 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -12,30 +12,37 @@ one of these categories, then create your package directory in these.
>   +Config.in+ file
>   ~~~~~~~~~~~~~~~~
>
> -Then, create a file named +Config.in+. This file will contain the
> -option descriptions related to our +libfoo+ software that will be used
> -and displayed in the configuration tool. It should basically contain:
> +Then, create a file named +Config.in+. This file will contain the option
> +descriptions related to our +libfoo+ software that will be used and
> +displayed in the configuration tool. It should basically contain:
>
>   ---------------------------
> +config BR2_PACKAGE_LIBFOO_AVAILABLE
> +	def_bool y
> +
>   config BR2_PACKAGE_LIBFOO
>   	bool "libfoo"
> +	depends on BR2_PACKAGE_LIBFOO_AVAILABLE
>   	help
>   	  This is a comment that explains what libfoo is.
>
>   	  http://foosoftware.org/libfoo/
>   ---------------------------
>
> -The +bool+ line, +help+ line and other meta-informations about the
> -configuration option must be indented with one tab. The help text
> -itself should be indented with one tab and two spaces, and it must
> -mention the upstream URL of the project.
> +*Notes*
> +
> +* This is a very simple example, not really complete, for a very simple
> +  package with no dependency.
> +
> +* The syntax of the +Config.in+ file is the same as the one for the kernel
> +  Kconfig file. The documentation for this syntax is available at:
> +  https://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/kbuild/kconfig-language.txt[]

  http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt

> +
> +* The +bool+ line, +help+ line and other meta-informations about the
> +  configuration option must be indented with one tab. The help text
> +  itself should be indented with one tab and two spaces, and it must
> +  mention the upstream URL of the project.
>
> -Of course, you can add other sub-options into a +if
> -BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
> -in your software. You can look at examples in other packages. The
> -syntax of the +Config.in+ file is the same as the one for the kernel
> -Kconfig file. The documentation for this syntax is available at
> -http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt[]
>
>   Finally you have to add your new +libfoo/Config.in+ to
>   +package/Config.in+ (or in a category subdirectory if you decided to
> @@ -47,103 +54,108 @@ supposed to contain anything but the 'bare' name of the package.
>   source "package/libfoo/Config.in"
>   --------------------------
>
> -The +Config.in+ file of your package must also ensure that
> -dependencies are enabled. Typically, Buildroot uses the following
> -rules:
> +The +Config.in+ file for your package must also ensure that its
> +dependencies are available. This is done in four steps:
>
> -* Use a +select+ type of dependency for dependencies on
> -  libraries. These dependencies are generally not obvious and it
> -  therefore make sense to have the kconfig system ensure that the
> -  dependencies are selected. For example, the _libgtk2_ package uses
> -  +select BR2_PACKAGE_LIBGLIB2+ to make sure this library is also
> -  enabled.
> +1. The +BR2_PACKAGE_LIBFOO_AVAILABLE+ symbol shall +depends on+ any
> +other package's +_AVAILABLE+ symbol. It may also depend on any other
> +symbol, such as toolchain features, but should not directly depend on
> +any package's main symbol.

  ... except for _XORG7, _PYTHON, etc.

>
> -* Use a +depends on+ type of dependency when the user really needs to
> -  be aware of the dependency. Typically, Buildroot uses this type of
> -  dependency for dependencies on toolchain options (large file
> -  support, RPC support, IPV6 support), or for dependencies on "big"
> -  things, such as the X.org system. In some cases, especially
> -  dependency on toolchain options, it is recommended to add a
> -  +comment+ displayed when the option is not enabled, so that the user
> -  knows why the package is not available.
> +1. The main +BR2_PACKAGE_LIBFOO+ symbol should directly +depends
> +on+ it's own +_AVAILABLE+ symbol, +BR2_PACKAGE_LIBFOO_AVAILABLE+, and
> +should not depend on any other symbol.
>
> -An example illustrates both the usage of +select+ and +depends on+.
> +1. For each +_AVAILABLE+ symbol your package's own +_AVAILABLE+
> +symbol depends on, your package's main symbol should +select+ the
> +corresponding package's main symbol.
> +
> +1. Add a +comment+ briefly explaining why your package is not
> +available. That +comment+ shall have a single negative dependency on
> +your package's +_AVAILABLE+ symbol.
> +
> +The example below illustrates this mechanism for our libfoo package:
>
>   --------------------------
> -config BR2_PACKAGE_ACL
> -        bool "acl"
> -        select BR2_PACKAGE_ATTR
> -        depends on BR2_LARGEFILE
> -        help
> -          POSIX Access Control Lists, which are used to define more
> -          fine-grained discretionary access rights for files and
> -          directories.
> -          This package also provides libacl.
> -
> -          http://savannah.nongnu.org/projects/acl
> -
> -comment "acl requires a toolchain with LARGEFILE support"
> -        depends on !BR2_LARGEFILE
> +config BR2_PACKAGE_LIBFOO_AVAILABLE
> +	def_bool y
> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_LIBBAR
> +
> +comment "libfoo requires libbar, and a toolchain with support for LARGEFILEs"
> +	depends on !BR2_PACKAGE_LIBFOO_AVAILABLE
> +
> +config BR2_PACKAGE_LIBFOO
> +	bool "libfoo"
> +	depends on BR2_PACKAGE_LIBFOO_AVAILABLE
> +	select BR2_PACKAGE_LIBBAR
> +	help
> +	  This is a comment that explains what libfoo is.
> +
> +	  http://foosoftware.org/libfoo/
>   --------------------------
>
> +*Notes*
> +
> +* Even if your package does not have any dependency, you should anyway
> +  add the corresponding +_AVAILABLE+ symbol. This way, other packages can
> +  safely use the mechanism above to select your package, even if it is later
> +  updated and dependencies are added (eg. a new version of the package is
> +  released; or features, initially disabled, are now enabled...)
> +
> +* The symbols and the comment should be in this order, so that the
> +  +menuconfig+ will be properly laid out.
> +
> +* The dependencies in +Config.in+ will make sure that your package's
> +  dependencies options are also enabled, but they will not necessarily be
> +  built before your package. To do so, these dependencies also need to be
> +  expressed in the +.mk+ file of the package (see below).
>
> -Note that these two dependency types are only transitive with the
> -dependencies of the same kind.
> +If your package can be fine-tuned, you can add sub-options, enclosed inside
> +an +if BR2_PACKAGE_LIBFOO ... endif+ block. You can even have each option
> +depend on other packages, using the +_AVAILABLE+ and main symbols for
> +those pacakges.
>
> -This means, in the following example:
> +Finally, here's our now-complete example package:
>
>   --------------------------
> -config BR2_PACKAGE_A
> -        bool "Package A"
> +config BR2_PACKAGE_LIBFOO_AVAILABLE
> +	def_bool y
> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_LIBBAR
>
> -config BR2_PACKAGE_B
> -        bool "Package B"
> -        depends on BR2_PACKAGE_A
> +comment "libfoo requires libbar"

  And largefile.  Copy the comment from above.

> +	depends on !BR2_PACKAGE_LIBFOO_AVAILABLE
>
> -config BR2_PACKAGE_C
> -        bool "Package C"
> -        depends on BR2_PACKAGE_B
> +config BR2_PACKAGE_LIBFOO
> +	bool "libfoo"
> +	depends on BR2_PACKAGE_LIBFOO_AVAILABLE
> +	select BR2_PACKAGE_LIBBAR
> +	help
> +	  This is a comment that explains what libfoo is.
>
> -config BR2_PACKAGE_D
> -        bool "Package D"
> -        select BR2_PACKAGE_B
> +	  http://foosoftware.org/libfoo/
>
> -config BR2_PACKAGE_E
> -        bool "Package E"
> -        select BR2_PACKAGE_D
> ---------------------------
> +if BR2_PACKAGE_LIBFOO
>
> -* Selecting +Package C+ will be visible if +Package B+ has been
> -  selected, which in turn is only visible if +Package A+ has been
> -  selected.
> +config BR2_PACKAGE_LIBFOO_FROBBLE
> +	bool "Frobble the foo"
>
> -* Selecting +Package E+ will select +Package D+, which will select
> -  +Package B+, it will not check for the dependencies of +Package B+,
> -  so it will not select +Package A+.
> +config BR2_PACKAGE_LIBFOO_GAZZLE_LEVEL
> +	int "Gazzle level"
> +	range 0 10

  We currently don't have a single range config option, and only one int.
So the example is a bit contrived...  If you add an extra example, a string
option that is qstripped in the .mk file is more appropriate.

>
> -* Since +Package B+ is selected but +Package A+ is not, this violates
> -  the dependency of +Package B+ on +Package A+.  Therefore, in such a
> -  situation, the transitive dependency has to be added explicitly:
> +comment "goo option requires package goo"
> +	depends on !BR2_PACKAGE_GOO_AVAILABLE
>
> ---------------------------
> -config BR2_PACKAGE_D
> -	bool "Package D"
> -	select BR2_PACKAGE_B
> -	depends on BR2_PACKAGE_A
> -
> -config BR2_PACKAGE_E
> -	bool "Package E"
> -	select BR2_PACKAGE_D
> -	depends on BR2_PACKAGE_A
> ---------------------------
> +config BR2_PACKAGE_LIBFOO_GOO
> +	bool "goo"
> +	depends on BR2_PACKAGE_GOO_AVAILABLE
> +	select BR2_PACKAGE_GOO
>
> -Overall, for package library dependencies, +select+ should be
> -preferred.
> +endif
> +--------------------------
>
> -Note that such dependencies will make sure that the dependency option
> -is also enabled, but not necessarily built before your package. To do
> -so, the dependency also needs to be expressed in the +.mk+ file of the
> -package.
>
>   The +.mk+ file
>   ~~~~~~~~~~~~~~
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index d3a4abb..3e4c864 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -23,30 +23,45 @@ system is based on hand-written Makefiles or shell scripts.
>   09: LIBFOO_INSTALL_STAGING = YES
>   10: LIBFOO_DEPENDENCIES = host-libaaa libbbb

  libbar

>   11:
> -12: define LIBFOO_BUILD_CMDS
> -13: 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> -14: endef
> +12: ifeq ($(BR2_PACKAGE_LIBFOO_FROBBLE),y)
> +13: LIBFOO_CFLAGS += -DFROBBLE
> +14: endif
>   15:
> -16: define LIBFOO_INSTALL_STAGING_CMDS
> -17: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
> -18: 	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
> -19: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
> -20: endef
> -21:
> -22: define LIBFOO_INSTALL_TARGET_CMDS
> -23: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
> -24: 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
> -25: endef
> -26:
> -27: define LIBFOO_DEVICES
> -28: 	/dev/foo  c  666  0  0  42  0  -  -  -
> +16: LIBFOO_CFLAGS += -DGAZZLE_LEVEL=$(BR2_PACKAGE_LIBFOO_GAZZLE_LEVEL)
> +17:
> +18: ifeq ($(BR2_PACKAGE_LIBFOO_GOO),y)
> +19: LIBFOO_DEPENDENCIES += goo
> +20: LIBFOO_CFLAGS       += -DGOO
> +21: LIBFOO_LDFLAGS      += -lgoo
> +22: endif
> +23:
> +24: define LIBFOO_BUILD_CMDS
> +25: 	$(MAKE) -C $(@D)                                        \
> +26: 	        CC="$(TARGET_CC)" CFLAGS="$(LIBFOO_CFLAGS)"     \
> +27: 	        LD="$(TARGET_LD)" LDFLAGS="$(LIBFOO_LDFLAGS)"   \
> +28: 	        all
>   29: endef
>   30:
> -31: define LIBFOO_PERMISSIONS
> -32: 	/bin/foo  f  4755  0  0  -  -  -  -  -
> -33: endef
> -34:
> -35: $(eval $(generic-package))
> +31: define LIBFOO_INSTALL_STAGING_CMDS
> +32: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
> +33: 	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
> +34: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
> +35: endef
> +36:
> +37: define LIBFOO_INSTALL_TARGET_CMDS
> +38: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
> +39: 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
> +40: endef
> +41:
> +42: define LIBFOO_DEVICES
> +43: 	/dev/foo  c  666  0  0  42  0  -  -  -
> +44: endef
> +45:
> +46: define LIBFOO_PERMISSIONS
> +47: 	/bin/foo  f  4755  0  0  -  -  -  -  -
> +48: endef
> +49:
> +50: $(eval $(generic-package))
>   --------------------------------
>
>   The Makefile begins on line 6 to 8 with metadata information: the
> @@ -64,12 +79,20 @@ install header files and other development files in the staging space.
>   This will ensure that the commands listed in the
>   +LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
>
> -On line 10, we specify the list of dependencies this package relies
> -on. These dependencies are listed in terms of lower-case package names,
> -which can be packages for the target (without the +host-+
> -prefix) or packages for the host (with the +host-+) prefix).
> -Buildroot will ensure that all these packages are built and installed
> -'before' the current package starts its configuration.
> +On line 10, we specify the list of dependencies this package relies on.
> +These dependencies are listed in terms of lower-case package names, which
> +can be packages for the target (without the +host-+ prefix) or packages
> +for the host (with the +host-+ prefix). Buildroot will ensure that all
> +these packages are built and installed 'before' the current package starts
> +its configuration.
> +
> +On lines 12 to 14, if the user did select the option
> ++BR2_PACKAGE_LIBFOO_FROBBLE+ (see above, in the +Config.in+), we
> +conditionnally add a value to the +CFLAGS+. On line 16, we add the 'gazzle

  conditionally

> +level' +BR2_PACKAGE_LIBFOO_GAZZLE_LEVEL+ to the +CFLAGS+. And on lines 18
> +to 22, if the user selected 'goo' support, +BR2_PACKAGE_LIBFOO_GOO+, we
> +add a dependency on the package +goo+, and add appropriate +CFLAGS+ and
> ++LDFLAGS+.
>
>   The rest of the Makefile defines what should be done at the different
>   steps of the package configuration, compilation and installation.
> @@ -79,11 +102,11 @@ steps should be performed to install the package in the staging space.
>   +LIBFOO_INSTALL_TARGET_CMDS+ tells what steps should be
>   performed to install the package in the target space.

  Shouldn't _DEVICES and _PERMISSIONS be explained?

>
> -All these steps rely on the +$(@D)+ variable, which
> -contains the directory where the source code of the package has been
> -extracted.
> +All these steps rely on the +$(@D)+ variable, which contains the directory
> +where the source code of the package has been extracted, and where the
> +package is being built.
>
> -Finally, on line 35, we call the +generic-package+ which
> +Finally, on line 50, we call the +generic-package+ which
>   generates, according to the variables defined previously, all the
>   Makefile code necessary to make your package working.
>


  Overall, a very good addition to the doc, regardless of the _AVAILABLE stuff!

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
