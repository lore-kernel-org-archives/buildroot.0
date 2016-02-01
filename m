From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 22:55:51 +0100
Subject: [Buildroot] [PATCH 18/18] erlang: make libatomic_ops optional
In-Reply-To: <CA+-urNRdjP16nOm6ARH3WLgtopK61hhQB8PSm9FnYk_MdBUJJg@mail.gmail.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
 <1453511471-28519-19-git-send-email-fhunleth@troodon-software.com>
 <20160123092549.2c47f3b5@free-electrons.com>
 <CA+-urNRdjP16nOm6ARH3WLgtopK61hhQB8PSm9FnYk_MdBUJJg@mail.gmail.com>
Message-ID: <20160201225551.5bb70783@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank,

On Mon, 25 Jan 2016 19:43:05 -0500, Frank Hunleth wrote:

> >> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> >> index 0ec01bb..9bd64ac 100644
> >> --- a/package/erlang/Config.in
> >> +++ b/package/erlang/Config.in
> >> @@ -7,8 +7,7 @@ config BR2_PACKAGE_ERLANG
> >>       bool "erlang"
> >>       depends on BR2_USE_MMU # fork()
> >>       depends on !BR2_STATIC_LIBS
> >> -     depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
> >> -     select BR2_PACKAGE_LIBATOMIC_OPS
> >> +     depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # erlang native atomics and libatomic_ops
> >
> > This shouldn't be here, since you no longer select libatomic_ops.
> 
> I'm having trouble addressing this one. It seems like some "depends
> on" clause should be here. The Erlang docs are vague on what all they
> support natively, so I was originally thinking that
> BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS has a good list.

This one is easy: BR2_PACKAGE_xxx_ARCH_SUPPORTS options are meant to
more easily propagate the architecture dependencies of one package when
you select that package.

Remember that in Buildroot, when a package does:

	select BR2_PACKAGE_<foo>

It *must* replicate the "depends on" that exist in the defintion of
BR2_PACKAGE_<foo>.

For some packages, such dependencies are architecture dependencies,
like:

config BR2_PACKAGE_<foo>
	bool "foo"
	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || ...

Then in all packages selecting BR2_PACKAGE_<foo>, we would have to
replicate this long "depends on" line. And when this "depends on"
changes, propagate to all reverse dependencies. Not nice.

Hence we rather do:

config BR2_PACKAGE_<foo>_ARCH_SUPPORTS
	bool
	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || ...

config BR2_PACKAGE_<foo>
	bool "foo"
	depends on BR2_PACKAGE_<foo>_ARCH_SUPPORTS

This way, not only BR2_PACKAGE_<foo> uses
BR2_PACKAGE_<foo>_ARCH_SUPPORTS, but also all reverse dependencies of
the "foo" package.

So, if you are not selecting BR2_PACKAGE_<foo>, there is no reason to
use BR2_PACKAGE_<foo>_ARCH_SUPPORTS. Does that make sense ?

> 
> "Erlang/OTP itself provides implementations of native atomic memory operations
> that can be used when compiling with a `gcc` compatible compiler for 32/64-bit
> x86, 32/64-bit SPARC V9, 32-bit PowerPC, or 32-bit Tile. When compiling with
> a `gcc` compatible compiler for other architectures, the VM may be able to make
> use of native atomic operations using the `__atomic_*` builtins (may be
> available when using a `gcc` of at least version 4.7) and/or using the
> `__sync_*` builtins (may be available when using a `gcc` of at least version
> 4.1). If only the `gcc`'s `__sync_*` builtins are available, the performance
> will suffer. Such a configuration should only be used as a last resort. When
> compiling on Windows using a MicroSoft Visual C++ compiler native atomic
> memory operations are provided by Windows APIs.
> 
> Native atomic implementation in the order preferred:
> 1.  The implementation provided by Erlang/OTP.
> 2.  The API provided by Windows.
> 3.  The implementation based on the `gcc` `__atomic_*` builtins.
> 4.  If none of the above are available for your architecture/compiler, you
>     are recommended to build and install [libatomic_ops][] before building
>     Erlang/OTP. The `libatomic_ops` library provides native atomic memory
>     operations for a variety of architectures and compilers. When building
>     Erlang/OTP you need to inform the build system of where the
>     `libatomic_ops` library is installed using the
>     `--with-libatomic_ops=PATH` `configure` switch.
> 5.  As a last resort, the implementation solely based on the `gcc`
>     `__sync_*` builtins. This will however cause lots of expensive and
>     unnecessary memory barrier instructions to be issued. That is,
>     performance will suffer. The `configure` script will warn at the end
>     of its execution if it cannot find any other alternative than this.
> "

Ah, at least the Erlang documentation is quite verbose and actually
useful. So, let's take this point by point:

 (1) According to their documentation, this is only available on x86
     (not sure 32 bits or 64 bits, let's assume both), SPARC v9,
     PowerPC and Tile (we don't care about Tile).

 (2) We don't care.

 (3) __atomic_*() built-ins are available on *all* architectures,
     provided you link with -latomic.

 (4) libatomic_ops is available on architectures listed in
     BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS

 (5) The availability of __sync_*() operations depend on the
     architectures. See
     http://lists.busybox.net/pipermail/buildroot/2016-January/150744.html
     for the lengthy details. We would actually need to know which
     __sync_*() built-ins Erlang is using. According to
     http://autobuild.buildroot.org/results/209/2090874eee165af3349cf2d597657fc1b4ca1012/build-end.log,
     it needs the 4-byte and 8-byte version.

So, with this in hand, here is how we could encode the architecture
dependency of Erlang:

config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
	bool
	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sparc_v9 # case (1)
	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # case (3)
	default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # case (4)
	default y if BR2_TOOLCHAIN_HAS_SYNC_4 && BR2_TOOLCHAIN_HAS_SYNC_8 # case (5)

Of course, this should come with a pretty fat comment on top of it that
replicates the good explanation of the Erlang documentation. *And* in
order for case (3) to work, you must make sure that Erlang links with
-latomic.

> >> +ifeq ($(BR2_PACKAGE_ERLANG_USE_LIBATOMIC_OPS),y)
> >>  ERLANG_DEPENDENCIES += libatomic_ops
> >>  ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
> >> +endif
> >
> > Can you add a "else" clause to explicitly disable libatomic_ops
> > support? Otherwise, libatomic_ops may be enabled in the Buildroot
> > configuration, built before erlang, and detected automatically by
> > erlang configure script.
> 
> The configure script doesn't provide a --without-libatomic_ops or a
> --only-use-native-atomic-ops or anything that I can tell can be used
> to disable use of libatomic_ops. Based on my tests, the configure
> script does not use libatomic_ops even if present. It's also low down
> on their priority list for the atomics implementation to use, so I
> think this was intentional.

OK, so what you did is good. Maybe just add a comment on top of it.

Also, are you sure LIBS=-latomic_ops is needed ? This seems weird, I
believe Erlang should automatically link against libatomic_ops.

One last thing: do not confuse libatomic and libatomic_ops. They are
completely different things!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
