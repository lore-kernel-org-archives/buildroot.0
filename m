From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Mar 2013 22:57:06 +0100
Subject: [Buildroot] [PATCH v3 1/3] gdb: convert to the package
	infrastructure
In-Reply-To: <1364117858-6626-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 10:37:36 +0100")
References: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364117858-6626-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vc8c4ibx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit converts gdb to the package infrastructure, and therefore
 Thomas> moves it from toolchain/gdb to package/gdb.

 Thomas> The target package is now visible in "Package selection for the
 Thomas> target" => "Debugging, profiling and benchmark". The main option,
 Thomas> "gdb", forcefully selects the "gdbserver" sub-option by
 Thomas> default. Another sub-option, "full debugger" allows to install the
 Thomas> complete gdb on the target. When this option is enabled, then
 Thomas> "gdbserver" is no longer forcefully selected. This ensures that at
 Thomas> least gdbserver or the full debugger gets built/installed, so that the
 Thomas> package is not a no-op.

 Thomas> The host debugger is still enabled through a configuration option in
 Thomas> "Toolchain". It is now visible regardless of the toolchain type (it
 Thomas> used to be hidden for External Toolchains). The configuration options
 Thomas> relative to the host debugger are now in package/gdb/Config.in.host,
 Thomas> similar to how we have package/binutils/Config.in.host.

 Thomas> Since gdb is now a proper package, it is no longer allowed to 'select
 Thomas> BR2_PTHREADS_DEBUG' to ensure thread debugging is available when
 Thomas> needed. Instead, it now 'depends on
 Thomas> BR2_TOOLCHAIN_HAS_THREADS_DEBUG'. This option, in turn, is select by
 Thomas> the different toolchain backends when appropriate. The
 Thomas> 'BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED' option is removed, since
 Thomas> we no longer need to know when it is allowed to 'select
 Thomas> BR2_PTHREADS_DEBUG'. Also, the 'BR2_PTHREADS_DEBUG' option is moved to
 Thomas> appear right below the thread implementation selection (in the case of
 Thomas> the Buildroot toolchain backend).

Thanks, I like it - Unfortunately there's some issues (see below)

 Thomas>  Config.in.legacy                                   |    9 +
 Thomas>  package/Config.in                                  |    1 +
 Thomas>  package/gdb/6.6a/100-uclibc-conf.patch             |   82 +++++
 Thomas>  .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |   69 +++++
 Thomas>  package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch      |  238 +++++++++++++++
 Thomas>  package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch   |  314 ++++++++++++++++++++
 Thomas>  package/gdb/7.4.1/05_all_readline-headers.patch    |   42 +++
 Thomas>  package/gdb/7.4.1/xtensa-asm-ptrace-h.patch        |   22 ++
 Thomas>  package/gdb/7.4.1/xtensa-gdb-regsize.patch         |   19 ++
 Thomas>  package/gdb/Config.in                              |   40 +++
 Thomas>  package/gdb/Config.in.host                         |   56 ++++
 Thomas>  package/gdb/gdb.mk                                 |  101 +++++++
 Thomas>  toolchain/Config.in                                |    2 -
 Thomas>  toolchain/gdb/6.6a/100-uclibc-conf.patch           |   82 -----
 Thomas>  .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |   69 -----
 Thomas>  toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch    |  238 ---------------
 Thomas>  toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch |  314 --------------------
 Thomas>  toolchain/gdb/7.4.1/05_all_readline-headers.patch  |   42 ---
 Thomas>  toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch      |   22 --
 Thomas>  toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch       |   19 --
 Thomas>  toolchain/gdb/Config.in                            |   99 ------
 Thomas>  toolchain/gdb/gdb.mk                               |  234 ---------------
 Thomas>  toolchain/toolchain-buildroot.mk                   |    1 -
 Thomas>  toolchain/toolchain-buildroot/Config.in.2          |    7 +
 Thomas>  toolchain/toolchain-common.in                      |    7 +-
 Thomas>  toolchain/toolchain-crosstool-ng.mk                |    1 -
 Thomas>  toolchain/toolchain-crosstool-ng/Config.in         |    3 +
 Thomas>  toolchain/toolchain-external.mk                    |    1 -
 Thomas>  toolchain/toolchain-external/Config.in             |    7 +
 Thomas>  toolchain/uClibc/Config.in                         |    6 -
 Thomas>  30 files changed, 1011 insertions(+), 1136 deletions(-)
 Thomas>  create mode 100644 package/gdb/6.6a/100-uclibc-conf.patch
 Thomas>  create mode 100644 package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
 Thomas>  create mode 100644 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
 Thomas>  create mode 100644 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
 Thomas>  create mode 100644 package/gdb/7.4.1/05_all_readline-headers.patch
 Thomas>  create mode 100644 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
 Thomas>  create mode 100644 package/gdb/7.4.1/xtensa-gdb-regsize.patch
 Thomas>  create mode 100644 package/gdb/Config.in
 Thomas>  create mode 100644 package/gdb/Config.in.host
 Thomas>  create mode 100644 package/gdb/gdb.mk
 Thomas>  delete mode 100644 toolchain/gdb/6.6a/100-uclibc-conf.patch
 Thomas>  delete mode 100644 toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
 Thomas>  delete mode 100644 toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
 Thomas>  delete mode 100644 toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
 Thomas>  delete mode 100644 toolchain/gdb/7.4.1/05_all_readline-headers.patch
 Thomas>  delete mode 100644 toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch
 Thomas>  delete mode 100644 toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch
 Thomas>  delete mode 100644 toolchain/gdb/Config.in
 Thomas>  delete mode 100644 toolchain/gdb/gdb.mk

Rename detection would have made this significantly easier to review :/

 Thomas> +++ b/package/gdb/Config.in
 Thomas> @@ -0,0 +1,40 @@
 Thomas> +config BR2_PACKAGE_GDB
 Thomas> +	bool "gdb"
 Thomas> +	select BR2_PACKAGE_GDB_SERVER if !BR2_PACKAGE_GDB_DEBUGGER
 Thomas> +	help
 Thomas> +	  GDB, the GNU Project debugger, allows you to see what is
 Thomas> +	  going on `inside' another program while it executes -- or
 Thomas> +	  what another program was doing at the moment it crashed.
 Thomas> +
 Thomas> +	  This option allows to build gdbserver and/or the gdb
 Thomas> +	  debugger for the target.
 Thomas> +
 Thomas> +	  For embedded development, the most common solution is to
 Thomas> +	  build only 'gdbserver' for the target, and use a cross-gdb
 Thomas> +	  on the host. See BR2_PACKAGE_HOST_GDB in the Toolchain menu
 Thomas> +	  to enable one. Notice that external toolchains often provide
 Thomas> +	  their own pre-built cross-gdb and gdbserver binaries.
 Thomas> +
 Thomas> +	  http://www.gnu.org/software/gdb/
 Thomas> +
 Thomas> +if BR2_PACKAGE_GDB
 Thomas> +
 Thomas> +config BR2_PACKAGE_GDB_SERVER
 Thomas> +	bool "gdbserver"
 Thomas> +	help
 Thomas> +	  Build the gdbserver stub to run on the target.
 Thomas> +	  A full gdb is needed to debug the progam.
 Thomas> +
 Thomas> +config BR2_PACKAGE_GDB_DEBUGGER
 Thomas> +	bool "full debugger"
 Thomas> +	select BR2_PACKAGE_NCURSES
 Thomas> +	depends on BR2_USE_WCHAR
 Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Thomas> +	depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 Thomas> +	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
 Thomas> +
 Thomas> +comment "full gdb on target needs WCHAR, thread and thread debugging support in toolchain"
 Thomas> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 Thomas> +		!BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 Thomas> +
 Thomas> +endif

This is afaik not correct (and now how it was before). Both gdbserver
and full gdb need thread / thread debugging support for gdb 7.x.

It becomes a bit complicated as we only have the version selection if
we're building gdb for the host though ..

From a usability POV, it's also a bit less handy when using the internal
toolchain that you now need to go and enable the _HAS_THREADS_DEBUG
option, but ok.

-- 
Bye, Peter Korsgaard
