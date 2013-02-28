From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Feb 2013 09:00:45 +0100
Subject: [Buildroot] [PATCH] gdb: convert to the package infrastructure
In-Reply-To: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <512F0EAD.4080406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/13 23:13, Thomas Petazzoni wrote:
> This commit converts gdb to the package infrastructure, and therefore
> moves it from toolchain/gdb to package/gdb.
>
> The target package is now visible in "Package selection for the
> target" => "Debugging, profiling and benchmark". The main option,
> "gdb", forcefully selects the "gdbserver" sub-option by
> default. Another sub-option, "full debugger" allows to install the
> complete gdb on the target. When this option is enabled, then
> "gdbserver" is no longer forcefully selected. This ensures that at
> least gdbserver or the full debugger gets built/installed, so that the
> package is not a no-op.
>
> The host debugger is still enabled through a configuration option in
> "Toolchain". It is now visible regardless of the toolchain type (it
> used to be hidden for External Toolchains). The configuration options
> relative to the host debugger are now in package/gdb/Config.in.host,
> similar to how we have package/binutils/Config.in.host.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

  This looks like a great idea!

  Just a couple of generic remarks, and then a few specific ones below. 
The generic remarks are probably for follow-up patches.

* It really doesn't make sense to build host-gdb without a gdbserver for 
the target. So I would auto-select gdbserver from host-gdb.

* Does it really make sense to keep options for four different gdb 
versions? Can't we just remove the user-selectable version completely?

* Do gdb-7.2+ actually work for avr32? If yes, why keep the 6.7.1 around?



> ---
> It would be good to have a few people testing this before committing.

  Nah, just let the autobuilders do it :-)

[snip]
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> new file mode 100644
> index 0000000..958a64a
> --- /dev/null
> +++ b/package/gdb/Config.in
> @@ -0,0 +1,38 @@
> +config BR2_PACKAGE_GDB
> +	bool "gdb"
> +	select BR2_PACKAGE_GDB_SERVER if !BR2_PACKAGE_GDB_DEBUGGER
> +	help
> +	  GDB, the GNU Project debugger, allows you to see what is
> +	  going on `inside' another program while it executes -- or
> +	  what another program was doing at the moment it crashed.
> +
> +	  This option allows to build gdbserver and/or the gdb
> +	  debugger for the target.
> +
> +	  For embedded development, the most common solution is to
> +	  build only 'gdbserver' for the target, and use a cross-gdb
> +	  on the host. See BR2_PACKAGE_HOST_GDB to enable one.

  "See BR2_PACKAGE_HOST_GDB in the Toolchain menu to enable one."

  It could be useful to add a comment that external toolchains often 
provide gdb/gdbserver.

> +
> +	  http://www.gnu.org/software/gdb/
> +
> +if BR2_PACKAGE_GDB
> +
> +config BR2_PACKAGE_GDB_SERVER
> +	bool "gdbserver"
> +	help
> +	  Build the gdbserver stub to run on the target.
> +	  A full gdb is needed to debug the progam.
> +
> +config BR2_PACKAGE_GDB_DEBUGGER
> +	bool "full debugger"
> +	select BR2_PACKAGE_NCURSES
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
> +	select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)

  It feels pretty strange to modify a toolchain option from a package 
Config.in. Remember, the user may add gdb in a second run and try to do 
an incremental build... So I would say: move it to a depends like we 
usually do.

> +
> +comment "full gdb on target needs WCHAR and threads support in toolchain"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +endif
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> new file mode 100644
> index 0000000..6ee1d26
> --- /dev/null
> +++ b/package/gdb/Config.in.host
> @@ -0,0 +1,56 @@
> +config BR2_PACKAGE_HOST_GDB
> +	bool "Build cross gdb for the host"
> +	help
> +	    Build a cross gdb that runs on the host machine and debugs
> +	    programs running on the target. It requires 'gdbserver'
> +	    installed on the target, see BR2_PACKAGE_GDB_SERVER to
> +	    enable it.

  As I said, I would just auto-select BR2_PACKAGE_GDB, which will select 
BR2_PACKAGE_GDB_SERVER

[snip]
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> new file mode 100644
> index 0000000..c102cc9
> --- /dev/null
> +++ b/package/gdb/gdb.mk
> @@ -0,0 +1,100 @@
> +#############################################################
> +#
> +# gdb
> +#
> +#############################################################
> +
> +GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
> +
> +# When no version is defined, it means that cross-gdb for the host has
> +# not been enabled, and we will only build gdbserver or gdb for the
> +# target. In this case, use the latest available version
> +# automatically.
> +ifeq ($(GDB_VERSION),)
> +ifeq ($(BR2_bfin),y)
> +GDB_VERSION = 6.6a
> +GDB_SITE    = $(BR2_GNU_MIRROR)/gdb

  Just define this once, either before the condition (and override it for 
avr32), or after the condition (and use ?=).

> +else ifeq ($(BR2_avr32),y)
> +GDB_VERSION = 6.7.1-avr32-2.1.5
> +GDB_SITE    = ftp://www.at91.com/pub/buildroot/
> +else
> +GDB_VERSION = 7.5.1
> +GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
> +endif
> +endif
> +
> +GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
> +GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
> +GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
> +
> +# We only want gdbserver and not the entire debugger.
> +ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
> +GDB_SUBDIR = gdb/gdbserver
> +HOST_GDB_SUBDIR = .
> +else
> +GDB_DEPENDENCIES = ncurses
> +endif
> +
> +# For the host variant, we really want to build with XML support,
> +# which is needed to read XML descriptions of target architectures.
> +HOST_GDB_DEPENDENCIES = host-expat

  Can we rely on host-nurses being present? It is not checked in 
dependencies.sh AFAIK. Admittedly, it is not a dependency of host-gdb 
now, but most people have ncurses installed anyway for menuconfig...

[snip]
> +define GDB_REMOVE_UNNEEDED_FILES
> +	$(RM) -rf $(TARGET_DIR)/usr/share/gdb
> +endef

  Perhaps a comment why this is needed? Or is it just to keep it 
consistent with the current behaviour?


  Regards,
  Arnout


> +
> +GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
> +
> +# A few notes:
> +#  * --target, because we're doing a cross build rather than a real
> +#    host build.
> +#  * --enable-static because gdb really wants to use libbfd.a
> +#  * --disable-shared, otherwise the old 6.7 version specific to AVR32
> +#    doesn't build because it wants to link a shared libbfd.so against
> +#    non-PIC liberty.a.
> +HOST_GDB_CONF_OPT = \
> +	--target=$(GNU_TARGET_NAME) \
> +	--enable-static --disable-shared \
> +	--without-uiout \
> +	--disable-tui \
> +	--disable-gdbtk \
> +	--without-x \
> +	--enable-threads \
> +	--disable-werror \
> +	--without-included-gettext \
> +	--disable-sim
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
