From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Jul 2017 15:21:44 +0200
Subject: [Buildroot] [PATCH] packages: remove numerous dependencies on
 Busybox
In-Reply-To: <20170707184516.5948-1-thomas.petazzoni@free-electrons.com>
References: <20170707184516.5948-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170708132144.GA3867@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-07 20:45 +0200, Thomas Petazzoni spake thusly:
> A lot of packages that provide a full-featured version of a tool
> otherwise provided in a more lightweight version in Busybox add a
> <pkg>_DEPENDENCIES on the busybox package to ensure they get built and
> installed after Busybox and therefore overwrite the Busybox symbolic
> links.
> 
> However, the Busybox installation process does not overwrite existing
> files when creating its symbolic links. For example, if dos2unix has
> already been installed in its full-featured version, the Busybox
> installation process will not overwrite it.

I have checked that this is still true when the applets are installed as
hard-links or script wrappers.

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Therefore, making all those packages depend on busybox if available is
> not necessary, and we consequently drop such dependencies.
> 
> A few packages still depend on Busybox if available:
> 
>  - The logging related packages (syslog-ng, rsyslog, sysklogd),
>    because they install a S01logging script that should overwrite the
>    one installed by Busybox.
> 
>  - The systemd package, for a mysterious reason documented in
>    systemd.mk "Make sure that systemd will always be built after
>    busybox so that we have a consistent init setup between two builds"
> 
> After building a number of packages providing full-featured versions
> of tools also provided by Busybox, and forcing the Busybox
> installation afterwards, the Busybox installation process says:
> 
>   /home/thomas/projets/buildroot/output/target//bin/chattr already exists
>   /home/thomas/projets/buildroot/output/target//bin/cpio already exists
>   /home/thomas/projets/buildroot/output/target//bin/gunzip already exists
>   /home/thomas/projets/buildroot/output/target//bin/gzip already exists
>   /home/thomas/projets/buildroot/output/target//bin/lsattr already exists
>   /home/thomas/projets/buildroot/output/target//bin/run-parts already exists
>   /home/thomas/projets/buildroot/output/target//bin/tar already exists
>   /home/thomas/projets/buildroot/output/target//bin/zcat already exists
>   /home/thomas/projets/buildroot/output/target//sbin/fsck already exists
>   /home/thomas/projets/buildroot/output/target//sbin/insmod already exists
>   /home/thomas/projets/buildroot/output/target//sbin/lsmod already exists
>   /home/thomas/projets/buildroot/output/target//sbin/mke2fs already exists
>   /home/thomas/projets/buildroot/output/target//sbin/modprobe already exists
>   /home/thomas/projets/buildroot/output/target//sbin/rmmod already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/awk already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/cmp already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/dc already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/diff already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/dos2unix already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/fuser already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/killall already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/less already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/lsof already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/lspci already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/mkpasswd already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/tftp already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/unix2dos already exists
>   /home/thomas/projets/buildroot/output/target//usr/bin/wget already exists
>   /home/thomas/projets/buildroot/output/target//usr/sbin/fbset already exists
>   /home/thomas/projets/buildroot/output/target//usr/sbin/i2cdetect already exists
>   /home/thomas/projets/buildroot/output/target//usr/sbin/i2cdump already exists
>   /home/thomas/projets/buildroot/output/target//usr/sbin/i2cget already exists
>   /home/thomas/projets/buildroot/output/target//usr/sbin/i2cset already exists
>   /home/thomas/projets/buildroot/output/target//usr/sbin/ubirename already exists
> 
> And therefore none of those programs were overwritten by Busybox
> symbolic links.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/bash/bash.mk                           | 4 +---
>  package/bc/bc.mk                               | 5 -----
>  package/binutils/binutils.mk                   | 5 -----
>  package/coreutils/coreutils.mk                 | 6 ------
>  package/cpio/cpio.mk                           | 1 -
>  package/dcron/dcron.mk                         | 5 -----
>  package/debianutils/debianutils.mk             | 2 --
>  package/diffutils/diffutils.mk                 | 4 ----
>  package/dos2unix/dos2unix.mk                   | 1 -
>  package/e2fsprogs/e2fsprogs.mk                 | 6 ------
>  package/fbset/fbset.mk                         | 5 -----
>  package/gawk/gawk.mk                           | 5 -----
>  package/grep/grep.mk                           | 5 -----
>  package/gzip/gzip.mk                           | 2 --
>  package/i2c-tools/i2c-tools.mk                 | 4 ----
>  package/ifenslave/ifenslave.mk                 | 1 -
>  package/ifplugd/ifplugd.mk                     | 5 -----
>  package/ifupdown/ifupdown.mk                   | 1 -
>  package/iproute2/iproute2.mk                   | 6 ------
>  package/iputils/iputils.mk                     | 6 ------
>  package/kmod/kmod.mk                           | 3 ---
>  package/less/less.mk                           | 3 +--
>  package/lsof/lsof.mk                           | 3 ---
>  package/mtd/mtd.mk                             | 4 ----
>  package/net-tools/net-tools.mk                 | 5 -----
>  package/netcat-openbsd/netcat-openbsd.mk       | 6 ------
>  package/ntp/ntp.mk                             | 2 +-
>  package/pciutils/pciutils.mk                   | 5 -----
>  package/procps-ng/procps-ng.mk                 | 6 ------
>  package/psmisc/psmisc.mk                       | 5 -----
>  package/rsyslog/rsyslog.mk                     | 2 +-
>  package/start-stop-daemon/start-stop-daemon.mk | 3 +--
>  package/sysklogd/sysklogd.mk                   | 2 +-
>  package/sysvinit/sysvinit.mk                   | 5 -----
>  package/tar/tar.mk                             | 5 -----
>  package/tftpd/tftpd.mk                         | 5 -----
>  package/unzip/unzip.mk                         | 2 --
>  package/usbutils/usbutils.mk                   | 5 -----
>  package/util-linux/util-linux.mk               | 6 ------
>  package/vim/vim.mk                             | 4 +---
>  package/wget/wget.mk                           | 5 -----
>  package/whois/whois.mk                         | 3 +--
>  42 files changed, 8 insertions(+), 160 deletions(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 32c87a6..fd1a8bd 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -6,9 +6,7 @@
>  
>  BASH_VERSION = 4.4
>  BASH_SITE = $(BR2_GNU_MIRROR)/bash
> -# Build after since bash is better than busybox shells
> -BASH_DEPENDENCIES = ncurses readline host-bison \
> -	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +BASH_DEPENDENCIES = ncurses readline host-bison
>  BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
>  BASH_LICENSE = GPL-3.0+
>  BASH_LICENSE_FILES = COPYING
> diff --git a/package/bc/bc.mk b/package/bc/bc.mk
> index a6446ce..ee0e438 100644
> --- a/package/bc/bc.mk
> +++ b/package/bc/bc.mk
> @@ -11,9 +11,4 @@ BC_DEPENDENCIES = host-flex
>  BC_LICENSE = GPL-2.0+, LGPL-2.1+
>  BC_LICENSE_FILES = COPYING COPYING.LIB
>  
> -# Build after busybox so target ends up with bc's "dc" version
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -BC_DEPENDENCIES += busybox
> -endif
> -
>  $(eval $(autotools-package))
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index c64ec47..8a07fed 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -78,11 +78,6 @@ ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
>  BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
>  endif
>  
> -# Install binutils after busybox to prefer full-blown utilities
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -BINUTILS_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  BINUTILS_DEPENDENCIES += zlib
>  endif
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 6a8a31b..3f41e6f 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -59,12 +59,6 @@ COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
>  	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
>  	uname join
>  
> -# If both coreutils and busybox are selected, make certain coreutils
> -# wins the fight over who gets to have their utils actually installed.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -COREUTILS_DEPENDENCIES = busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ACL),y)
>  COREUTILS_DEPENDENCIES += acl
>  else
> diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
> index 7e8549d..9a09279 100644
> --- a/package/cpio/cpio.mk
> +++ b/package/cpio/cpio.mk
> @@ -7,7 +7,6 @@
>  CPIO_VERSION = 2.12
>  CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
>  CPIO_CONF_OPTS = --bindir=/bin
> -CPIO_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  CPIO_LICENSE = GPL-3.0+
>  CPIO_LICENSE_FILES = COPYING
>  
> diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> index 7e81b63..2ee0709 100644
> --- a/package/dcron/dcron.mk
> +++ b/package/dcron/dcron.mk
> @@ -9,11 +9,6 @@ DCRON_SITE = http://www.jimpryor.net/linux/releases
>  # The source code does not specify the version of the GPL that is used.
>  DCRON_LICENSE = GPL
>  
> -# Overwrite cron-related Busybox commands if available
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -DCRON_DEPENDENCIES = busybox
> -endif
> -
>  define DCRON_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
>  endef
> diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
> index 86f201d..189d983 100644
> --- a/package/debianutils/debianutils.mk
> +++ b/package/debianutils/debianutils.mk
> @@ -8,8 +8,6 @@ DEBIANUTILS_VERSION = 4.8.1
>  DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
>  DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20161118T033019Z/pool/main/d/debianutils
>  DEBIANUTILS_CONF_OPTS = --exec-prefix=/
> -# Make sure we override the busybox tools, such as which
> -DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
>  DEBIANUTILS_LICENSE_FILES = debian/copyright
>  
> diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
> index 6e5b9b6..648d64c 100644
> --- a/package/diffutils/diffutils.mk
> +++ b/package/diffutils/diffutils.mk
> @@ -11,8 +11,4 @@ DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  DIFFUTILS_LICENSE = GPL-3.0+
>  DIFFUTILS_LICENSE_FILES = COPYING
>  
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -DIFFUTILS_DEPENDENCIES += busybox
> -endif
> -
>  $(eval $(autotools-package))
> diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
> index 276a18e..2a26e1a 100644
> --- a/package/dos2unix/dos2unix.mk
> +++ b/package/dos2unix/dos2unix.mk
> @@ -9,7 +9,6 @@ DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
>  DOS2UNIX_LICENSE = BSD-2-Clause
>  DOS2UNIX_LICENSE_FILES = COPYING.txt
>  DOS2UNIX_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
>  ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 75e9213..c46710e 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -17,12 +17,6 @@ E2FSPROGS_INSTALL_STAGING = YES
>  E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
>  HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
>  
> -# If both e2fsprogs and busybox are selected, make certain e2fsprogs
> -# wins the fight over who gets to have their utils actually installed
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -E2FSPROGS_DEPENDENCIES += busybox
> -endif
> -
>  # e4defrag doesn't build on older systems like RHEL5.x, and we don't
>  # need it on the host anyway.
>  # Disable fuse2fs as well to avoid carrying over deps, and it's unused
> diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
> index d6ee104..787b4e1 100644
> --- a/package/fbset/fbset.mk
> +++ b/package/fbset/fbset.mk
> @@ -9,11 +9,6 @@ FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
>  FBSET_DEPENDENCIES = host-bison host-flex
>  FBSET_LICENSE = GPL-2.0
>  
> -# Make sure full fbset wins over busybox fbset
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -FBSET_DEPENDENCIES += busybox
> -endif
> -
>  define FBSET_BUILD_CMDS
>  	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>  endef
> diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
> index a3a2927..5792211 100644
> --- a/package/gawk/gawk.mk
> +++ b/package/gawk/gawk.mk
> @@ -11,11 +11,6 @@ GAWK_DEPENDENCIES = host-gawk
>  GAWK_LICENSE = GPL-3.0+
>  GAWK_LICENSE_FILES = COPYING
>  
> -# Prefer full-blown gawk over busybox awk
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -GAWK_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
>  GAWK_DEPENDENCIES += libsigsegv
>  endif
> diff --git a/package/grep/grep.mk b/package/grep/grep.mk
> index a2ef422..8545cee 100644
> --- a/package/grep/grep.mk
> +++ b/package/grep/grep.mk
> @@ -25,9 +25,4 @@ GREP_CONF_OPTS += --enable-perl-regexp
>  GREP_DEPENDENCIES += pcre
>  endif
>  
> -# Full grep preferred over busybox grep
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -GREP_DEPENDENCIES += busybox
> -endif
> -
>  $(eval $(autotools-package))
> diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
> index 26fc8ec..d69215a 100644
> --- a/package/gzip/gzip.mk
> +++ b/package/gzip/gzip.mk
> @@ -9,8 +9,6 @@ GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
>  GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
>  # Some other tools expect it to be in /bin
>  GZIP_CONF_OPTS = --exec-prefix=/
> -# Prefer full gzip over potentially lightweight/slower from busybox
> -GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  GZIP_LICENSE = GPL-3.0+
>  GZIP_LICENSE_FILES = COPYING
>  GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
> index 978c5c0..c7c143f 100644
> --- a/package/i2c-tools/i2c-tools.mk
> +++ b/package/i2c-tools/i2c-tools.mk
> @@ -17,10 +17,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  I2C_TOOLS_DEPENDENCIES += python3
>  endif
>  
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -I2C_TOOLS_DEPENDENCIES += busybox
> -endif
> -
>  # Build/install steps mirror the distutil python package type in the python package
>  # infrastructure
>  ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
> index 4030d22..b51aa72 100644
> --- a/package/ifenslave/ifenslave.mk
> +++ b/package/ifenslave/ifenslave.mk
> @@ -9,7 +9,6 @@ IFENSLAVE_SOURCE = ifenslave_$(IFENSLAVE_VERSION).tar.xz
>  IFENSLAVE_SITE = http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave
>  IFENSLAVE_LICENSE = GPL-3.0+
>  IFENSLAVE_LICENSE_FILES = debian/copyright
> -IFENSLAVE_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  
>  # shell script, so nothing to build
>  
> diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
> index b569320..c7874b4 100644
> --- a/package/ifplugd/ifplugd.mk
> +++ b/package/ifplugd/ifplugd.mk
> @@ -15,11 +15,6 @@ IFPLUGD_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
>  IFPLUGD_CONF_OPTS = --disable-lynx --with-initdir=/etc/init.d/
>  IFPLUGD_DEPENDENCIES = libdaemon
>  
> -# Prefer big ifplugd
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -IFPLUGD_DEPENDENCIES += busybox
> -endif
> -
>  define IFPLUGD_INSTALL_FIXUP
>  	$(INSTALL) -D -m 0644 $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
>  	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
> diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
> index dfc3f3c..84d24ae 100644
> --- a/package/ifupdown/ifupdown.mk
> +++ b/package/ifupdown/ifupdown.mk
> @@ -7,7 +7,6 @@
>  IFUPDOWN_VERSION = 0.8.16
>  IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
>  IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160922T165503Z/pool/main/i/ifupdown
> -IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  IFUPDOWN_LICENSE = GPL-2.0+
>  IFUPDOWN_LICENSE_FILES = COPYING
>  
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 5502d73..26d1f08 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -12,12 +12,6 @@ IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
>  IPROUTE2_LICENSE = GPL-2.0
>  IPROUTE2_LICENSE_FILES = COPYING
>  
> -# If both iproute2 and busybox are selected, make certain we win
> -# the fight over who gets to have their utils actually installed.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -IPROUTE2_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ELFUTILS),y)
>  IPROUTE2_DEPENDENCIES += elfutils
>  endif
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index b20cd12..1f2db3f 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -17,12 +17,6 @@ IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
>  # Only includes a license file for BSD
>  IPUTILS_LICENSE_FILES = ninfod/COPYING
>  
> -# Build after busybox so target ends up with this package's full
> -# versions of the applications instead of busybox applets.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -IPUTILS_DEPENDENCIES += busybox
> -endif
> -
>  IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\
>  	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>  
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index bd67610..0b67460 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -49,9 +49,6 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
>  KMOD_LICENSE := $(KMOD_LICENSE), GPL-2.0+ (tools)
>  KMOD_LICENSE_FILES += COPYING
>  
> -# take precedence over busybox implementation
> -KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> -
>  # /sbin is really /usr/sbin with merged /usr, so adjust relative symlink
>  ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>  KMOD_BIN_PATH = ../bin/kmod
> diff --git a/package/less/less.mk b/package/less/less.mk
> index bccc08b..ef3643c 100644
> --- a/package/less/less.mk
> +++ b/package/less/less.mk
> @@ -8,8 +8,7 @@ LESS_VERSION = 487
>  LESS_SITE = $(BR2_GNU_MIRROR)/less
>  LESS_LICENSE = GPL-3.0+
>  LESS_LICENSE_FILES = COPYING
> -# Build after busybox, full-blown is better
> -LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +LESS_DEPENDENCIES = ncurses
>  
>  define LESS_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index e5cd4bc..1f8e2e8 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -13,9 +13,6 @@ LSOF_LICENSE = lsof license
>  # It is also defined in 00README, but that contains a lot of other cruft.
>  LSOF_LICENSE_FILES = dialects/linux/dproto.h
>  
> -# Make certain full-blown lsof gets built after the busybox version (1.20+)
> -LSOF_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> -
>  ifeq ($(BR2_USE_WCHAR),)
>  define LSOF_CONFIGURE_WCHAR_FIXUPS
>  	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 3bac2d5..cfc573a 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -31,10 +31,6 @@ else
>  MTD_CONF_OPTS += --disable-tests
>  endif
>  
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -MTD_DEPENDENCIES += busybox
> -endif
> -
>  # If extended attributes are required, the acl package must
>  # also be enabled which will also include the attr package.
>  ifeq ($(BR2_PACKAGE_ACL),y)
> diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
> index bc87290..a3fd4b9 100644
> --- a/package/net-tools/net-tools.mk
> +++ b/package/net-tools/net-tools.mk
> @@ -10,11 +10,6 @@ NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  NET_TOOLS_LICENSE = GPL-2.0+
>  NET_TOOLS_LICENSE_FILES = COPYING
>  
> -# Install after busybox for the full-blown versions
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -NET_TOOLS_DEPENDENCIES += busybox
> -endif
> -
>  define NET_TOOLS_CONFIGURE_CMDS
>  	(cd $(@D); yes "" | ./configure.sh config.in )
>  endef
> diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
> index e1a6fee..7cc6823 100644
> --- a/package/netcat-openbsd/netcat-openbsd.mk
> +++ b/package/netcat-openbsd/netcat-openbsd.mk
> @@ -10,12 +10,6 @@ NETCAT_OPENBSD_LICENSE = BSD-3-Clause
>  NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
>  NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
>  
> -# Ensure Busybox gets built/installed before, so that this package
> -# overrides Busybox nc.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -NETCAT_OPENBSD_DEPENDENCIES += busybox
> -endif
> -
>  define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
>  	if [ -d $(@D)/debian/patches ]; then \
>  		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index c70d6e6..86365e5 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -7,7 +7,7 @@
>  NTP_VERSION_MAJOR = 4.2
>  NTP_VERSION = $(NTP_VERSION_MAJOR).8p10
>  NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
> -NTP_DEPENDENCIES = host-pkgconf libevent openssl $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +NTP_DEPENDENCIES = host-pkgconf libevent openssl
>  NTP_LICENSE = NTP
>  NTP_LICENSE_FILES = COPYRIGHT
>  NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
> diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
> index 2dd5771..30d429e 100644
> --- a/package/pciutils/pciutils.mk
> +++ b/package/pciutils/pciutils.mk
> @@ -46,11 +46,6 @@ else
>  PCIUTILS_MAKE_OPTS += SHARED=yes
>  endif
>  
> -# Build after busybox since it's got a lightweight lspci
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -PCIUTILS_DEPENDENCIES += busybox
> -endif
> -
>  define PCIUTILS_CONFIGURE_CMDS
>  	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
>  	$(SED) 's/uname -s/echo Linux/' \
> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
> index 22ebc1a..68116a8 100644
> --- a/package/procps-ng/procps-ng.mk
> +++ b/package/procps-ng/procps-ng.mk
> @@ -16,12 +16,6 @@ PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
>  PROCPS_NG_AUTORECONF = YES
>  PROCPS_NG_GETTEXTIZE = YES
>  
> -# If both procps-ng and busybox are selected, make certain procps-ng
> -# wins the fight over who gets to have their utils actually installed.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -PROCPS_NG_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  PROCPS_NG_DEPENDENCIES += systemd
>  PROCPS_NG_CONF_OPTS += --with-systemd
> diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
> index 3d9a804..3916e34 100644
> --- a/package/psmisc/psmisc.mk
> +++ b/package/psmisc/psmisc.mk
> @@ -23,9 +23,4 @@ ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
>  PSMISC_CONF_OPTS = --disable-harden-flags
>  endif
>  
> -# build after busybox, we prefer fat versions while we're at it
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -PSMISC_DEPENDENCIES += busybox
> -endif
> -
>  $(eval $(autotools-package))
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index bbf7d95..24c4e17 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -17,7 +17,7 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
>  RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
>  	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
>  
> -# Build after BusyBox
> +# We override Busybox S01logging script
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  RSYSLOG_DEPENDENCIES += busybox
>  endif
> diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
> index 7071f56..01a6719 100644
> --- a/package/start-stop-daemon/start-stop-daemon.mk
> +++ b/package/start-stop-daemon/start-stop-daemon.mk
> @@ -19,8 +19,7 @@ START_STOP_DAEMON_CONF_ENV = \
>  	dpkg_cv_va_copy=yes \
>  	dpkg_cv_c99_snprintf=yes \
>  	DPKG_DEVEL_MODE=1
> -START_STOP_DAEMON_DEPENDENCIES = host-pkgconf \
> -	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +START_STOP_DAEMON_DEPENDENCIES = host-pkgconf
>  # Patching m4/dpkg-arch.m4
>  START_STOP_DAEMON_AUTORECONF = YES
>  START_STOP_DAEMON_LICENSE = GPL-2.0+
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index e1f0c34..66ab0e6 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -9,7 +9,7 @@ SYSKLOGD_SITE = http://www.infodrom.org/projects/sysklogd/download
>  SYSKLOGD_LICENSE = GPL-2.0+
>  SYSKLOGD_LICENSE_FILES = COPYING
>  
> -# Override BusyBox implementations if BusyBox is enabled.
> +# We override Busybox S01logging script
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  SYSKLOGD_DEPENDENCIES = busybox
>  endif
> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index ca7d06b..fff7d95 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -13,11 +13,6 @@ SYSVINIT_LICENSE_FILES = COPYING
>  
>  SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
>  
> -# Override BusyBox implementations if BusyBox is enabled.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -SYSVINIT_DEPENDENCIES = busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  SYSVINIT_DEPENDENCIES += libselinux
>  SYSVINIT_MAKE_OPTS += WITH_SELINUX="yes"
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index cb2ddc0..04c1b78 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -13,11 +13,6 @@ TAR_CONF_OPTS = --exec-prefix=/
>  TAR_LICENSE = GPL-3.0+
>  TAR_LICENSE_FILES = COPYING
>  
> -# Prefer full-blown tar over buybox's version
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -TAR_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ACL),y)
>  TAR_DEPENDENCIES += acl
>  TAR_CONF_OPTS += --with-posix-acls
> diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
> index 78df835..c42456a 100644
> --- a/package/tftpd/tftpd.mk
> +++ b/package/tftpd/tftpd.mk
> @@ -9,11 +9,6 @@ TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
>  TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
>  TFTPD_CONF_OPTS = --without-tcpwrappers
>  
> -# Override BusyBox implementations if BusyBox is enabled.
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -TFTPD_DEPENDENCIES += busybox
> -endif
> -
>  define TFTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
>  	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
> index 7d48d25..cff5951 100644
> --- a/package/unzip/unzip.mk
> +++ b/package/unzip/unzip.mk
> @@ -7,8 +7,6 @@
>  UNZIP_VERSION = 60
>  UNZIP_SOURCE = unzip$(UNZIP_VERSION).tgz
>  UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
> -# take precedence over busybox implementation
> -UNZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>  UNZIP_LICENSE = Info-ZIP
>  UNZIP_LICENSE_FILES = LICENSE
>  
> diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
> index c397d0a..9cb791d 100644
> --- a/package/usbutils/usbutils.mk
> +++ b/package/usbutils/usbutils.mk
> @@ -11,11 +11,6 @@ USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
>  USBUTILS_LICENSE = GPL-2.0+
>  USBUTILS_LICENSE_FILES = COPYING
>  
> -# Build after busybox since it's got a lightweight lsusb
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -USBUTILS_DEPENDENCIES += busybox
> -endif
> -
>  # Nice lsusb.py script only if there's python
>  ifeq ($(BR2_PACKAGE_PYTHON),)
>  define USBUTILS_REMOVE_PYTHON
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 4c2b1f6..bf55bad 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -39,12 +39,6 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>  # We also don't want the host-python dependency
>  HOST_UTIL_LINUX_CONF_OPTS = --without-python
>  
> -# If both util-linux and busybox are selected, make certain util-linux
> -# wins the fight over who gets to have their utils actually installed
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -UTIL_LINUX_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_NCURSES),y)
>  UTIL_LINUX_DEPENDENCIES += ncurses
>  ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index c235a08..3cb96d4 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -6,10 +6,8 @@
>  
>  VIM_VERSION = v8.0.0329
>  VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
> -# Win over busybox vi since vim is more feature-rich
>  VIM_DEPENDENCIES = \
> -	ncurses $(TARGET_NLS_DEPENDENCIES) \
> -	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +	ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
>  VIM_CONF_ENV = \
>  	vim_cv_toupper_broken=no \
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index 4cb48dc..67fae65 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -11,11 +11,6 @@ WGET_DEPENDENCIES = host-pkgconf
>  WGET_LICENSE = GPL-3.0+
>  WGET_LICENSE_FILES = COPYING
>  
> -# Prefer full-blown wget over busybox
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -WGET_DEPENDENCIES += busybox
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  WGET_CONF_OPTS += --with-ssl=gnutls
>  WGET_DEPENDENCIES += gnutls
> diff --git a/package/whois/whois.mk b/package/whois/whois.mk
> index b773499..3d2be09 100644
> --- a/package/whois/whois.mk
> +++ b/package/whois/whois.mk
> @@ -7,8 +7,7 @@
>  WHOIS_VERSION = 5.2.14
>  WHOIS_SITE = http://snapshot.debian.org/archive/debian/20161230T032015Z/pool/main/w/whois
>  WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
> -# take precedence over busybox implementation
> -WHOIS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) $(TARGET_NLS_DEPENDENCIES)
> +WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
>  WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
>  	LIBS="$(WHOIS_EXTRA_LIBS)"
> -- 
> 2.9.4
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
