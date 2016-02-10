From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 23:13:24 +0100
Subject: [Buildroot] [PATCH 2/2] Add Xen 4.6
In-Reply-To: <1454719042-6185-3-git-send-email-alistair.francis@xilinx.com>
References: <1454719042-6185-1-git-send-email-alistair.francis@xilinx.com>
 <1454719042-6185-3-git-send-email-alistair.francis@xilinx.com>
Message-ID: <56BBB604.30903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-02-16 01:37, Alistair Francis wrote:
> Add support to compile Xen 4.6 and Xen tools.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  package/Config.in     |  1 +
>  package/xen/Config.in | 31 +++++++++++++++++++++++++++++++
>  package/xen/xen.hash  |  2 ++
>  package/xen/xen.mk    | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 package/xen/Config.in
>  create mode 100644 package/xen/xen.hash
>  create mode 100644 package/xen/xen.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 529ad33..4227195 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1616,6 +1616,7 @@ endif
>  	source "package/tpm-tools/Config.in"
>  	source "package/unscd/Config.in"
>  	source "package/util-linux/Config.in"
> +	source "package/xen/Config.in"
>  endmenu
>  
>  menu "Text editors and viewers"
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> new file mode 100644
> index 0000000..28da69c
> --- /dev/null
> +++ b/package/xen/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_XEN
> + bool "xen"

 Everything should be indented with a tab, the help text with tab + 2 spaces.

> + depends on BR2_arm || BR2_aarch64 || \
> + BR2_i386 || BR2_x86_64
> + depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
> + depends on !BR2_STATIC_LIBS # dtc (libfdt)
> + depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> + depends on BR2_USE_WCHAR # libglib2, util-linux

 You need to add a coment explaining why xen is not available. See the section
"Dependencies on target and toolchain options" in the manual.


> + select BR2_PACKAGE_DTC
> + select BR2_PACKAGE_LIBAIO
> + select BR2_PACKAGE_LIBGLIB2
> + select BR2_PACKAGE_NCURSES
> + select BR2_PACKAGE_OPENSSL
> + select BR2_PACKAGE_PIXMAN
> + select BR2_PACKAGE_UTIL_LINUX
> + select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> + select BR2_PACKAGE_YAJL

 Are all these needed both for Xen and for the tools?

> + help
> +  This builds the Xen hypervisor and toolstack
> +
> +  http://www.xenproject.org/
> +
> +if BR2_PACKAGE_XEN
> +
> +config BR2_PACKAGE_XEN_HYPERVISOR
> + bool "Build the Xen hypervisor"

 It would be nice to add a little help text, for example where the binary will
be put and how it should be used (refering to the appropriate documentation of
course).

> +
> +config BR2_PACKAGE_XEN_TOOLS
> + bool "Build the Xen tools"
> +endif

 If neither of them is selected, only some documentation will be installed. So I
think at least one of the should default y.

> +
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
> index 0000000..4331136
> --- /dev/null
> +++ b/package/xen/xen.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# Xen
> +#
> +################################################################################
> +
> +XEN_VERSION = 4.6.0
> +XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
> +XEN_INSTALL_IMAGES = YES

 Actually, only ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)

> +
> +XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl

 You're missing a LICENSE and LICENSE_FILES.

> +
> +XEN_MAKE_ENV = \
> + XEN_TARGET_ARCH=arm64 \

 I'm sure that xen works on other architectures as well... You'll need to define
a XEN_ARCH that converts the buildroot architecture names into the appropriate
xen architecture names. And maybe it isn't even needed, I think it can do some
autodetection based on the compiler.

> + CROSS_COMPILE=$(TARGET_CROSS) \
> + CXXFLAGS="$(TARGET_CXXFLAGS) -D_FILE_OFFSET_BITS=64" \
> + CFLAGS="$(TARGET_CFLAGS) -D_FILE_OFFSET_BITS=64" \
> + PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY)

 All of this should already be passed into the environment by autotools-package.
So if it is needed, it's really necessary to explain why.

> +
> +XEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
> +
> +ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> +XEN_MAKE_OPTS += dist-xen
> +
> +define XEN_INSTALL_IMAGES_CMDS
> + cp $(@D)/xen/xen $(BINARIES_DIR)
> +endef
> +else
> +XEN_CONF_OPTS += --disable-xen
> +endif
> +
> +XEN_CONF_OPTS += --disable-ocamltools

 The unconditional CONF_OPTS should come before all the conditionals.

> +
> +ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
> +XEN_MAKE_OPTS += dist-tools
> +XEN_INSTALL_TARGET_OPTS += install-tools
> +
> +define XEN_RENAME_INIT_SCRIPTS
> + mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
> + mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog
> + mv $(TARGET_DIR)/etc/init.d/xendomains $(TARGET_DIR)/etc/init.d/S60xendomains
> +endef

 Instead of calling this RENAME_INIT_SCRIPTS, you could put it in
XEN_INSTALL_INIT_SYSV, then you don't need to add it to the hook. Of course,
then it won't get done under systemd, but in that case the renaming is useless
anyway.


 Regards,
 Arnout

> +else
> +XEN_CONF_OPTS += --disable-tools
> +endif
> +
> +XEN_POST_INSTALL_TARGET_HOOKS += XEN_RENAME_INIT_SCRIPTS
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
