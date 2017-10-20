From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 20 Oct 2017 21:45:10 +0200
Subject: [Buildroot] [PATCH v3 1/3] meson: new package
In-Reply-To: <20170727095527.14324-2-joerg.krause@embedded.rocks>
References: <20170727095527.14324-1-joerg.krause@embedded.rocks>
 <20170727095527.14324-2-joerg.krause@embedded.rocks>
Message-ID: <20171020214510.02384766@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg, Eric,

On Thu, 27 Jul 2017 11:55:25 +0200, J?rg Krause <joerg.krause@embedded.rocks> wrote:

> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> 
> This new package provides the host variant of the Meson Build System, an
> open source build system meant to be both extremely fast, and as user
> friendly as possible.
> 
> More precisely, Meson creates configuration files for the Ninja build
> system.
> 
> Besides building Meson, it generates a configuration file
> ("$(HOST_DIR)/etc/meson/cross-compilation.conf") to be used when
> cross-compiling a Meson-based project.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> [J?rg Krause:
>  * bump to version 0.41.2
>  * use explicit tarball release instead of github helper
>  * use explicit sed
>  * pass BR2_GCC_TARGET_CPU to cross file]
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v3:
>  * fix missing mkdir
> ---
>  package/meson/cross-compilation.conf.in | 15 +++++++++++++++
>  package/meson/meson.hash                |  2 ++
>  package/meson/meson.mk                  | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 package/meson/cross-compilation.conf.in
>  create mode 100644 package/meson/meson.hash
>  create mode 100644 package/meson/meson.mk
> 
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> new file mode 100644
> index 0000000000..d38fbb03cc
> --- /dev/null
> +++ b/package/meson/cross-compilation.conf.in
> @@ -0,0 +1,15 @@
> +# Note: in Meson terminology, what Buildroot calls the "host" system is the
> +# "build" system and the "target" system is called the "host" system.
> +
> +[binaries]
> +c = '@TARGET_CROSS at gcc'
> +cpp = '@TARGET_CROSS at g++'
> +ar = '@TARGET_CROSS at ar'
> +strip = '@TARGET_CROSS at strip'
> +pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> +
> +[host_machine]
> +system = 'linux'
> +cpu_family ='@TARGET_ARCH@'
> +cpu = '@TARGET_CPU@'
> +endian = '@TARGET_ENDIAN@'
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> new file mode 100644
> index 0000000000..7f0de1d437
> --- /dev/null
> +++ b/package/meson/meson.hash
> @@ -0,0 +1,2 @@
> +# Locally generated
> +sha256  074dd24fd068be0893e2e45bcc35c919d8e12777e9d6a7efdf72d4dc300867ca  meson-0.41.2.tar.gz
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> new file mode 100644
> index 0000000000..e9f1ffe4d4
> --- /dev/null
> +++ b/package/meson/meson.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# meson
> +#
> +################################################################################
> +
> +MESON_VERSION = 0.41.2
> +MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
> +MESON_LICENSE = Apache-2.0
> +MESON_LICENSE_FILES = COPYING
> +MESON_SETUP_TYPE = setuptools
> +
> +HOST_MESON_DEPENDENCIES = host-ninja
> +HOST_MESON_NEEDS_HOST_PYTHON = python3
> +
> +HOST_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z' 'a-z')
> +
> +define HOST_MESON_INSTALL_CROSS_CONF
> +	mkdir -p $(HOST_DIR)/etc/meson
> +	sed -e 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
> +	    -e 's;@TARGET_ARCH@;$(ARCH);g' \
> +	    -e 's;@TARGET_CPU@;$(BR2_GCC_TARGET_CPU);g' \

This leads to the following entry in the cross-compilation.conf file
  cpu = '"cortex-a53"'
and a compile failure on a first try to enable meson build for gstreamer1
package. The following patch fixes the entry to
  cpu = 'cortex-a53'
which fixes the gstreamer1 meson based build for me:

@ -14,12 +14,13 @@ HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3
 
 HOST_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z' 'a-z')
+HOST_MESON_TARGET_CPU = $(call qstrip,$(BR2_GCC_TARGET_CPU))
 
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
 	    -e 's;@TARGET_ARCH@;$(ARCH);g' \
-	    -e 's;@TARGET_CPU@;$(BR2_GCC_TARGET_CPU);g' \
+	    -e 's;@TARGET_CPU@;$(HOST_MESON_TARGET_CPU);g' \
 	    -e 's;@TARGET_ENDIAN@;$(HOST_MESON_TARGET_ENDIAN);g' \
 	    -e 's;@HOST_DIR@;$(HOST_DIR);g' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \

Regards,
Peter

Note: the next version of libinput (1.9.0) drops autotools support and
changed to using meson, see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2017-October/035469.html

> +	    -e 's;@TARGET_ENDIAN@;$(HOST_MESON_TARGET_ENDIAN);g' \
> +	    -e 's;@HOST_DIR@;$(HOST_DIR);g' \
> +	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> +	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
> +endef
> +
> +HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
> +
> +$(eval $(host-python-package))
