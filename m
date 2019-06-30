From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Jun 2019 15:55:55 +0200
Subject: [Buildroot] [PATCH 2/2] sdbusplus: new package
In-Reply-To: <20190624154451.22199-2-jfaith@impinj.com>
References: <20190624154451.22199-1-jfaith@impinj.com>
 <20190624154451.22199-2-jfaith@impinj.com>
Message-ID: <4e8f0e6e-0b71-ce71-c332-89b83e4bafe9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi John, Trent,

 I wanted to apply this but there were too many (small) issues to fix while
applying, so I've marked as Changes Requested.

On 24/06/2019 17:45, John Faith wrote:
> From: Trent Piepho <tpiepho@impinj.com>
> 
> A C++ library for interacting with sd-bus and a C++ bindings generator.
> 
> The host build produces a code generation tool, sdbus++ while the target
> build gives libsdbusplus.
> 
> The target build of sdbusplus tries to use the code generator tool,
> which we do not build for the target, to build an example program.
> Disable the examples to fix this.

 That's not correct. Instead, you add a patch that fixes the building of
examples if the sdbusplus tool isn't built.

> 
> The code generator requires host-python-pyyaml, since this isn't built
> on the target, the target build does not require python-pyyaml.

 Same for mako and inflection, I guess.

> 
> The host package includes a code and documentation generation program,
> which is useful for including in a buildroot SDK, even if no target
> packages built need it.  So make it a selected host package.
                                        ^^^^^^^^
                                  user-selectable
> 
> Signed-off-by: John Faith <jfaith@impinj.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/Config.in.host                        |  1 +
>  ...x-example-build-with-disable-sdbuspp.patch | 42 +++++++++++++++++++
>  package/sdbusplus/Config.in                   | 12 ++++++
>  package/sdbusplus/Config.in.host              | 10 +++++
>  package/sdbusplus/sdbusplus.hash              |  2 +
>  package/sdbusplus/sdbusplus.mk                | 21 ++++++++++
>  8 files changed, 90 insertions(+)
>  create mode 100644 package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
>  create mode 100644 package/sdbusplus/Config.in
>  create mode 100644 package/sdbusplus/Config.in.host
>  create mode 100644 package/sdbusplus/sdbusplus.hash
>  create mode 100644 package/sdbusplus/sdbusplus.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e9c521f400..08ef4f74eb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1176,6 +1176,7 @@ F:	package/dhcpcd/
>  
>  N:	John Faith <jfaith@impinj.com>
>  F:	package/python-inflection/
> +F:	package/sdbusplus/

 Shouldn't Trent be added as a developer too?

>  
>  N:	Jonathan Ben Avraham <yba@tkos.co.il>
>  F:	arch/Config.in.xtensa
> diff --git a/package/Config.in b/package/Config.in
> index d501b5a65b..73aeed26a1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -513,6 +513,7 @@ endmenu
>  	source "package/rtl8723bu/Config.in"
>  	source "package/rtl8821au/Config.in"
>  	source "package/sane-backends/Config.in"
> +	source "package/sdbusplus/Config.in"

 I think the "System tools" menu is more appropriate than "Hardware handling".

>  	source "package/sdparm/Config.in"
>  	source "package/sedutil/Config.in"
>  	source "package/setserial/Config.in"
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 1501889b72..835dd04237 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -61,6 +61,7 @@ menu "Host utilities"
>  	source "package/rustc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
> +	source "package/sdbusplus/Config.in.host"
>  	source "package/squashfs/Config.in.host"
>  	source "package/sunxi-tools/Config.in.host"
>  	source "package/swig/Config.in.host"
> diff --git a/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch b/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
> new file mode 100644
> index 0000000000..1262ced0f2
> --- /dev/null
> +++ b/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
> @@ -0,0 +1,42 @@
> +From c5d5a94f8e554f160e3f120b826e97b2961e2706 Mon Sep 17 00:00:00 2001
> +From: Trent Piepho <tpiepho@impinj.com>
> +Date: Mon, 14 May 2018 16:17:38 -0700
> +Subject: [PATCH] build: Fix example build with --disable-sdbuspp
> +
> +The calculator server examples uses the sdbus++ python program to build.
                         ^^^^^^^^
                         example

> +If this has been disabled, then trying to use it to build the example
> +could fail.  For instance, if python and all necessary python packages
> +are not available.  This might be the case when cross building the only
                                                   ^^^^^^^^^^^^^^^^^^^^^^^
                                                   cross-building only the

> +the library component for a target system.
> +
> +Don't build the calculator example when sdbus++ has been disabled.
> +
> +Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> +---
> + example/Makefile.am | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/example/Makefile.am b/example/Makefile.am
> +index 2cf8941..b0c3a4f 100644
> +--- a/example/Makefile.am
> ++++ b/example/Makefile.am
> +@@ -1,4 +1,7 @@
> +-noinst_PROGRAMS = calculator-server list-users
> ++noinst_PROGRAMS = list-users
> ++
> ++if WANT_SDBUSPP
> ++noinst_PROGRAMS += calculator-server
> + 
> + calculator_server_generated_files = \
> + 	net/poettering/Calculator/server.hpp \
> +@@ -8,6 +11,7 @@ calculator_server_generated_files = \
> + 
> + calculator_markdown_generated_files = \
> + 	calculator.md
> ++endif
> + 
> + calculator_server_SOURCES = \
> + 	calculator-server.cpp $(calculator_server_generated_files)
> +-- 
> +2.14.3
> +
> diff --git a/package/sdbusplus/Config.in b/package/sdbusplus/Config.in
> new file mode 100644
> index 0000000000..578d2d5bd7
> --- /dev/null
> +++ b/package/sdbusplus/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_SDBUSPLUS
> +	bool "sdbusplus"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_SYSTEMD

 Unfortunately, we can't select systemd. Instead you have to depend on it.

 I think adding a comment isn't even needed - it's quite obvious that you need
systemd as an init system for sdbus bindings.

> +	select BR2_PACKAGE_HOST_PKGCONF

 We don't usually do this, but I definitely don't mind if you do.

> +	help
> +	  A C++ library for sd-bus with a bindings and doc generator.
> +
> +	  This will build the target library.  See the host package for
> +	  the bindings and documentation generation program.
> +
> +	  https://github.com/openbmc/sdbusplus
> diff --git a/package/sdbusplus/Config.in.host b/package/sdbusplus/Config.in.host
> new file mode 100644
> index 0000000000..03f55c4c4f
> --- /dev/null
> +++ b/package/sdbusplus/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_SDBUSPLUS
> +	bool "host-sdbusplus"
> +	select BR2_PACKAGE_HOST_PKGCONF
> +	help
> +	  A C++ library for sd-bus with a bindings and doc generator.
> +
> +	  This will be the host side generation tool for bindings and
> +	  documentation.
> +
> +	  https://github.com/openbmc/sdbusplus
> diff --git a/package/sdbusplus/sdbusplus.hash b/package/sdbusplus/sdbusplus.hash
> new file mode 100644
> index 0000000000..5b616970d5
> --- /dev/null
> +++ b/package/sdbusplus/sdbusplus.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  9136215c5fc849c33555db4210f17d844864c1b0790fe35026d594af965aa09d  sdbusplus-28dc36d509ba8f77ffb5726cc7d5f0184f8054b1.tar.gz
> diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
> new file mode 100644
> index 0000000000..b1b3d5c138
> --- /dev/null
> +++ b/package/sdbusplus/sdbusplus.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# sdbusplus
> +#
> +################################################################################
> +
> +SDBUSPLUS_VERSION = 28dc36d509ba8f77ffb5726cc7d5f0184f8054b1
> +SDBUSPLUS_SITE = $(call github,openbmc,sdbusplus,$(SDBUSPLUS_VERSION))
> +SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd

 It's nice to explain in the commit message why you need autoconf-archive.

> +HOST_SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf \
> +	$(PKG_PYTHON_HOST_PYTHON) host-python-inflection host-python-mako host-python-pyyaml
> +SDBUSPLUS_CONF_OPTS = --disable-sdbuspp
> +HOST_SDBUSPLUS_CONF_OPTS = --disable-libsdbusplus
> +SDBUSPLUS_AUTORECONF = YES
> +SDBUSPLUS_AUTORECONF_OPTS = --include=$(HOST_DIR)/usr/share/autoconf-archive

 The usr part has been removed.

> +SDBUSPLUS_INSTALL_STAGING = YES
> +SDBUSPLUS_LICENSE = Apache-2.0
> +SDBUSPLUS_LICENSE_FILES = LICENSE

 Please also add a hash for the license file.

 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 
