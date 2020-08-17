From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:07:20 +0200
Subject: [Buildroot] [PATCHv2] package/gdb: bump to version 9.2
In-Reply-To: <20200805140337.427704-1-romain.naour@gmail.com>
References: <20200805140337.427704-1-romain.naour@gmail.com>
Message-ID: <20200817120720.5a440cc0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain, Maxim,

On Wed,  5 Aug 2020 16:03:37 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From: Maxim Kochetkov <fido_max@inbox.ru>
> 
> The in-tree build restriction has been added after the move of gnulib to top level [1] [2].
> This restriction has been added as a workaround a build issue with gdbserver that still use
> it's own copy of gnulib.
> 
> gnulib is configured a second time if we build in-tree gdb and gdbserver:
>     configure: error: source directory already configured; run "make distclean" there first
>     configure: error: .././../../gnulib/configure failed for build-gnulib-gdbserver
>     configure: error: ./configure failed for gdbserver
> 
> Use the same pre-configure-hook as gcc package.
> 
> Older gdb version support building out of tree even if it's not required.
> 
> There is no in-tree build restriction of we only build gdbserver for the target.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=73cc72729a184f00bf6fc4d74684a8516ba6b683
> [2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=043a0010933a6b55081535ecaf7fde9cc1491be0
> 
> See:
> https://sourceware.org/pipermail/gdb-announce/2020/000122.html
> https://sourceware.org/pipermail/gdb-announce/2020/000123.html
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> [Romain:
>     - add in-tree build support
>     - improve commit log]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

I've applied to next, and also changed the default gdb version to 8.3,
and dropped support for gdb 8.1.

>  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 ++++++++++++++++
>  ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++
>  package/gdb/9.2/0003-use-asm-sgidefs.h.patch  | 40 ++++++++++++
>  .../0004-gdbserver-fix-build-for-m68k.patch   | 62 +++++++++++++++++++
>  ...fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++

Do you know if there is a chance to get rid of those patches at some
point?

> +# Since gdb 9, in-tree builds for GDB are not allowed anymore,
> +# so we create a 'build' subdirectory in the gcc sources, and

                                                ^^^ gdb

> +# build from there.
> +define GDB_CONFIGURE_SYMLINK
> +	mkdir -p $(@D)/$(GDB_SUBDIR)
> +	ln -sf ../configure $(@D)/$(GDB_SUBDIR)/configure
> +endef
> +GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
> +
>  endif
>  
>  # For the host variant, we really want to build with XML support,
> @@ -251,6 +261,17 @@ else
>  HOST_GDB_CONF_OPTS += --disable-sim
>  endif
>  
> +# Since gdb 9, in-tree builds for GDB are not allowed anymore,
> +# so we create a 'build' subdirectory in the gcc sources, and

                                                ^^^ gdb

(I have fixed this when applying).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
