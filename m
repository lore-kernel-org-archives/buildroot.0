From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 18:23:25 +0200
Subject: [Buildroot] [PATCH 1/2] meson: new package
In-Reply-To: <1468072147-17509-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1468072147-17509-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468072147-17509-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160717162325.GM3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?ric, All,

On 2016-07-09 15:49 +0200, Eric Le Bihan spake thusly:
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

OK, so I've done a review on this package, because it is not far from
being good.

However, I wonder how much we should have it *now* in Buildroot.

As you said as a reply to my previous review, there are not many
packages that use the meson buildsystem, and that you did not plan on
providing one in the foreseeable future.

What was your interest in adding meson in Buildroot, if you do not have
at least one package to submit that uses it?

Host packages that are not used by any target package, and that have no
entry in Kconfig, will never be exercised by the autobuilders, so we
won't be able to catch any build failure. Also, they are prone to
bit-rot, because they are not used, and thus breakage is never caught,
and thus no one fixes them.

In other words: why would we, in Buildroot mainstream, add this host
package, right now?

Regards,
Yann E. MORIN.

> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/meson/cross-compilation.conf.in | 17 +++++++++++++++++
>  package/meson/meson.hash                |  2 ++
>  package/meson/meson.mk                  | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
>  create mode 100644 package/meson/cross-compilation.conf.in
>  create mode 100644 package/meson/meson.hash
>  create mode 100644 package/meson/meson.mk
> 
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> new file mode 100644
> index 0000000..33fa001
> --- /dev/null
> +++ b/package/meson/cross-compilation.conf.in
> @@ -0,0 +1,17 @@
> +# Note: in Meson terminology, what Buildroot calls the "host" system is the
> +# "build" system and the "target" system is called the "host" system.
> +
> +[host_machine]
> +system = 'linux'
> +cpu_family ='@TARGET_ARCH@'
> +cpu = 'generic'
> +endian = '@TARGET_ENDIAN@'
> +
> +[properties]
> +
> +[binaries]
> +c = '@TARGET_CROSS at gcc'
> +cpp = '@TARGET_CROSS at g++'
> +ar = '@TARGET_CROSS at ar'
> +strip = '@TARGET_CROSS at strip'
> +pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> new file mode 100644
> index 0000000..3a9ac2a
> --- /dev/null
> +++ b/package/meson/meson.hash
> @@ -0,0 +1,2 @@
> +# Locally generated
> +sha256 372c18e40ffc3fe101f4ab48e8077f048dd774eaf4e87bbea3221908fca74835 meson-0.32.0.tar.gz
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> new file mode 100644
> index 0000000..8b95a6f
> --- /dev/null
> +++ b/package/meson/meson.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# meson
> +#
> +################################################################################
> +
> +MESON_VERSION = 0.32.0
> +MESON_SITE = $(call github,mesonbuild,meson,$(MESON_VERSION))
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
> +	$(INSTALL) -D -m 0644 package/meson/cross-compilation.conf.in \
> +		$(HOST_DIR)/etc/meson/cross-compilation.conf
> +	$(SED) 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
> +		-e 's;@TARGET_ARCH@;$(ARCH);g' \
> +		-e 's;@TARGET_ENDIAN@;$(HOST_MESON_TARGET_ENDIAN);g' \
> +		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
> +		$(HOST_DIR)/etc/meson/cross-compilation.conf
> +endef
> +
> +HOST_MESON_POST_INSTALL_HOOKS += \
> +	HOST_MESON_INSTALL_CROSS_CONF
> +
> +$(eval $(host-python-package))
> -- 
> 2.4.11
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
