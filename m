From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 09:56:45 +0100
Subject: [Buildroot] [PATCH] gdb: convert to the package infrastructure
In-Reply-To: <512F0EAD.4080406@mind.be>
References: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <512F0EAD.4080406@mind.be>
Message-ID: <20130228095645.2cdfffd6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 28 Feb 2013 09:00:45 +0100, Arnout Vandecappelle wrote:

>   This looks like a great idea!

Thanks :-)

>   Just a couple of generic remarks, and then a few specific ones
> below. The generic remarks are probably for follow-up patches.
> 
> * It really doesn't make sense to build host-gdb without a gdbserver
> for the target. So I would auto-select gdbserver from host-gdb.

See the point made by James Hogan regarding kgdb. I don't have a strong
opinion on this one, and we could decide that gdbserver is lightweight
enough that even with James use case of kgdb, it still makes sense to
have gdbserver on the target when host-gdb is enabled.

> * Does it really make sense to keep options for four different gdb 
> versions? Can't we just remove the user-selectable version completely?

I just kept as it was.

> * Do gdb-7.2+ actually work for avr32? If yes, why keep the 6.7.1
> around?

I also just kept it as it was. If we want to upgrade gdb for avr32,
then let's do it as a follow-up. People having access to avr32 hardware
should test that.

> > ---
> > It would be good to have a few people testing this before
> > committing.
> 
>   Nah, just let the autobuilders do it :-)

Autobuilders are nice, but they are not yet capable of starting
gdbserver on the target, connect gdb, and verify that it works :)

> > +	  For embedded development, the most common solution is to
> > +	  build only 'gdbserver' for the target, and use a
> > cross-gdb
> > +	  on the host. See BR2_PACKAGE_HOST_GDB to enable one.
> 
>   "See BR2_PACKAGE_HOST_GDB in the Toolchain menu to enable one."
> 
>   It could be useful to add a comment that external toolchains often 
> provide gdb/gdbserver.

Indeed. I am not sure what do with external toolchains here. In the
past, I was hiding the option to build host-gdb and gdbserver for
the target, making the assumption that the external toolchain already
have those, and instead there was the option to copy the toolchain's
gdbserver to the target. Now, everything is available: host-gdb built
by Buildroot, gdbserver built by Buildroot, and gdbserver copied from
the external toolchain. Should I keep all this?

Also, the "gdbserver build by Buildroot" thing is in Packages ->
Debugging, but the "copy gdbserver from toolchain" thing is in
Toolchain. But it's not easy to put it in a package, as the code needed
to copy gdbserver from the toolchain really relates to all the complex
external toolchain logic.

> > +	  http://www.gnu.org/software/gdb/
> > +
> > +if BR2_PACKAGE_GDB
> > +
> > +config BR2_PACKAGE_GDB_SERVER
> > +	bool "gdbserver"
> > +	help
> > +	  Build the gdbserver stub to run on the target.
> > +	  A full gdb is needed to debug the progam.
> > +
> > +config BR2_PACKAGE_GDB_DEBUGGER
> > +	bool "full debugger"
> > +	select BR2_PACKAGE_NCURSES
> > +	depends on BR2_USE_WCHAR
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32
> > && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
> > +	select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT
> > && !BR2_PTHREADS_NONE)
> 
>   It feels pretty strange to modify a toolchain option from a package 
> Config.in. Remember, the user may add gdb in a second run and try to
> do an incremental build... So I would say: move it to a depends like
> we usually do.

Ok.

> > +comment "full gdb on target needs WCHAR and threads support in
> > toolchain"
> > +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +endif
> > diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> > new file mode 100644
> > index 0000000..6ee1d26
> > --- /dev/null
> > +++ b/package/gdb/Config.in.host
> > @@ -0,0 +1,56 @@
> > +config BR2_PACKAGE_HOST_GDB
> > +	bool "Build cross gdb for the host"
> > +	help
> > +	    Build a cross gdb that runs on the host machine and
> > debugs
> > +	    programs running on the target. It requires 'gdbserver'
> > +	    installed on the target, see BR2_PACKAGE_GDB_SERVER to
> > +	    enable it.
> 
>   As I said, I would just auto-select BR2_PACKAGE_GDB, which will
> select BR2_PACKAGE_GDB_SERVER

Hum, why not select BR2_PACKAGE_GDB and BR2_PACKAGE_GDB_SERVER? If you
select BR2_PACKAGE_GDB only, it still the user the possibility to build
only the target debugger, and not gdbserver.

> > +# When no version is defined, it means that cross-gdb for the host
> > has +# not been enabled, and we will only build gdbserver or gdb
> > for the +# target. In this case, use the latest available version
> > +# automatically.
> > +ifeq ($(GDB_VERSION),)
> > +ifeq ($(BR2_bfin),y)
> > +GDB_VERSION = 6.6a
> > +GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
> 
>   Just define this once, either before the condition (and override it
> for avr32), or after the condition (and use ?=).

Ok.

> 
> > +else ifeq ($(BR2_avr32),y)
> > +GDB_VERSION = 6.7.1-avr32-2.1.5
> > +GDB_SITE    = ftp://www.at91.com/pub/buildroot/
> > +else
> > +GDB_VERSION = 7.5.1
> > +GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
> > +endif
> > +endif
> > +
> > +GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
> > +GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
> > +GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
> > +
> > +# We only want gdbserver and not the entire debugger.
> > +ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
> > +GDB_SUBDIR = gdb/gdbserver
> > +HOST_GDB_SUBDIR = .
> > +else
> > +GDB_DEPENDENCIES = ncurses
> > +endif
> > +
> > +# For the host variant, we really want to build with XML support,
> > +# which is needed to read XML descriptions of target architectures.
> > +HOST_GDB_DEPENDENCIES = host-expat
> 
>   Can we rely on host-nurses being present? It is not checked in 
> dependencies.sh AFAIK. Admittedly, it is not a dependency of host-gdb 
> now, but most people have ncurses installed anyway for menuconfig...

host-ncurses wasn't a dependency, and our host-ncurses package is only
here to build a version of "tic" that works properly. Some systems had
a "tic" version causing problems when building a more recent ncurses
for the target. I think that other than for this "tic" program, we
should really on the pre-installed ncurses library, which should
already be present since the user uses menuconfig.

However, it's true we don't check it in dependencies.sh, and the user
could very well be using xconfig or gconfig, neither of which require
ncurses.

I'd say that's a separate matter really.

> [snip]
> > +define GDB_REMOVE_UNNEEDED_FILES
> > +	$(RM) -rf $(TARGET_DIR)/usr/share/gdb
> > +endef
> 
>   Perhaps a comment why this is needed? Or is it just to keep it 
> consistent with the current behaviour?

The old gdb installation logic was to manually copy the gdb binary to
the $(TARGET_DIR). In my patch, I've chosen to use 'make install'
instead, which requires removing a bunch of generally useless stuff
(Python scripts and XML descriptions of targets, which as per my
understanding, are needed only when you do remote debugging).

Thanks for the review!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
