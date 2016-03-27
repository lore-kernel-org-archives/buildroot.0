From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Mar 2016 14:54:18 +0200
Subject: [Buildroot] [PATCH V2] Add Xen 4.6
In-Reply-To: <1457483717-17947-1-git-send-email-alistair.francis@xilinx.com>
References: <1457483717-17947-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <56F7D7FA.40001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 01:35, Alistair Francis wrote:
> Add support to compile Xen 4.6 and Xen tools.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> V2:
>   - Lots of fixups pointed out by Arnout Vandecappelle
>
>   package/Config.in     |  1 +
>   package/xen/Config.in | 36 ++++++++++++++++++++++++++++++++++++
>   package/xen/xen.hash  |  2 ++
>   package/xen/xen.mk    | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 85 insertions(+)
>   create mode 100644 package/xen/Config.in
>   create mode 100644 package/xen/xen.hash
>   create mode 100644 package/xen/xen.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d916154..37be762 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1656,6 +1656,7 @@ endif
>   	source "package/tpm-tools/Config.in"
>   	source "package/unscd/Config.in"
>   	source "package/util-linux/Config.in"
> +	source "package/xen/Config.in"
>   endmenu
>
>   menu "Text editors and viewers"
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> new file mode 100644
> index 0000000..4235f48
> --- /dev/null
> +++ b/package/xen/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_XEN
> +	bool "xen"
> +	# Xen only supports these architectures
> +	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_WCHAR # libglib2, util-linux
> +	select BR2_PACKAGE_LIBAIO
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PIXMAN
> +	select BR2_PACKAGE_YAJL
> +	help
> +	  This builds the Xen hypervisor and toolstack.

  There should be an empty line here.

> +	  http://www.xenproject.org/
> +
> +if BR2_PACKAGE_XEN
> +
> +config BR2_PACKAGE_XEN_HYPERVISOR
> +	bool "Build the Xen hypervisor"
> +	default y
> +	help
> +	  The Xen binaries are avaliable in ./usr/lib/xen/

  No . in the beginning of the path, it's the absolute path on the target.

> +	  See http://wiki.xenproject.org/wiki/Getting_Started for using the Xen hypervisor.

  Wrap at 72 columns (where the tab counts for 8).

> +
> +config BR2_PACKAGE_XEN_TOOLS
> +	bool "Build the Xen tools"
> +	depends on !BR2_STATIC_LIBS # dtc (libfdt)
> +	select BR2_PACKAGE_DTC
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID

  It also seems to need:

	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC

> +	help
> +	  The Xen tools can be accessed by the xl command.
> +
> +endif
> diff --git a/package/xen/xen.hash b/package/xen/xen.hash
> new file mode 100644
> index 0000000..c124b3a
> --- /dev/null
> +++ b/package/xen/xen.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478e80909 xen-4.6.0.tar.gz
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> new file mode 100644
> index 0000000..2c0a4c9
> --- /dev/null
> +++ b/package/xen/xen.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# Xen
> +#
> +################################################################################
> +
> +XEN_VERSION = 4.6.0
> +XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
> +XEN_LICENSE = GPLv2
> +XEN_LICENSE_FILES = COPYING
> +
> +ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> +XEN_INSTALL_IMAGES = YES
> +endif
> +
> +XEN_DEPENDENCIES += libaio libglib2 ncurses openssl pixman yajl
> +
> +XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
> +
> +XEN_CONF_OPTS += --disable-ocamltools

  For some reason, it doesn't seem to be cross-compiling for me, it uses "gcc" 
to build. I think you need to pass TARGET_CONFIGURE_OPTS in XEN_MAKE_ENV.

> +
> +ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> +XEN_MAKE_OPTS += dist-xen
> +
> +define XEN_INSTALL_IMAGES_CMDS
> + cp $(@D)/xen/xen $(BINARIES_DIR)

  Commands should be indented with a tab.

> +endef
> +else
> +XEN_CONF_OPTS += --disable-xen
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
> +XEN_DEPENDENCIES += dtc util-linux
> +XEN_INSTALL_TARGET_OPTS += install-tools
> +XEN_MAKE_OPTS += dist-tools
> +
> +define XEN_INSTALL_INIT_SYSV
> + mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
> + mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
> + mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains

  Same here.


  Regards,
  Arnout


> +endef
> +else
> +XEN_CONF_OPTS += --disable-tools
> +endif
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
