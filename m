From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 19 Jun 2017 21:41:53 +0300
Subject: [Buildroot] [PATCH 1/2] llvm: new package
In-Reply-To: <20170617163154.2b32a518@windsurf.lan>
References: <20170616204143.29198-1-aperez@igalia.com>
 <20170616204143.29198-2-aperez@igalia.com>
 <20170617163154.2b32a518@windsurf.lan>
Message-ID: <20170619214153.GB17980@momiji.helsinki.igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for taking some time to review the patches :-)
I'll comment inline below.

On Sat, 17 Jun 2017 16:31:54 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> On Fri, 16 Jun 2017 23:41:42 +0300, Adrian Perez de Castro wrote:
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Thanks a lot for this patch. It's definitely good to see someone
> working on LLVM support.
>
> > diff --git a/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch b/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
> > new file mode 100644
> > index 0000000000..679683a823
> > --- /dev/null
> > +++ b/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
> > @@ -0,0 +1,57 @@
> > +From 628b899be14a6bab4b32dbd53aabd447dcc16cb7 Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
> > +Date: Sat, 20 Aug 2016 23:47:41 +0200
> > +Subject: [PATCH] llvm-config: Clean up exported values, update for shared
> > + linking
> > +
> > +Gentoo-specific fixup for llvm-config, including:
> > +- wiping build-specific CFLAGS, CXXFLAGS,
> > +- making --src-root return invalid path (/dev/null).
> 
> It would be nice to explain why this patch is needed.

This patch does a couple of things which I are interesting for myself (to
build Mesa3D with llvmpipe in swrast), and which I image may be desired for
Buildroot as well:

 * Removes CFLAGS/CXXFLAGS from the output of ?llvm-config?. This way packages
   which use LLVM will use the Buildroot compiler flags (either global ones or
   defined locally-defined in a package). For example, this avoids cases like
   the following:

	 - A build being done with ?-Os? chosen in .config
	 - A package known to break with ?-Os? replaces it with ?-O2?.
	 - LLVM built with ?-Os? has the output from ?llvm-config? including ?-Os?
	   and adding that to the package build flags end up being ?-O2 ? -Os?,
	   resulting in a broken package.

 * It makes ?llvm-config --src-root? return ?/dev/null?. This is to prevent
   other packages to build tools which should be built as part of the LLVM
   build process (and that therefore need the path to the LLVM sources).

Depending on which approach Buildroot follows regarding additional tools
(lldb, clang, lld, etc), it may be possible to drop the second part of the
patch. What would we prefer, using separate per-component packages, or
sub-options for the LLVM package? Personally I would favor the latter,
as it seems to be less error prone, but I have no strong preference here.

> > +Thanks to Steven Newbury for the initial patch.
> > +
> > +Bug: https://bugs.gentoo.org/565358
> > +Bug: https://bugs.gentoo.org/501684
> > +
> > +Fetch from: https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-devel/llvm/files/9999/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
> > +
> > +
> 
> Please add your Signed-off-by here.

Oh, I forgot this, thanks.

> > diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> > new file mode 100644
> > index 0000000000..92ad52d7b2
> > --- /dev/null
> > +++ b/package/llvm/Config.in
> > @@ -0,0 +1,48 @@
> > +config BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORT
> 
> Why are you calling this BR2_PACKAGE_HOST_LLVM ? Isn't this instead
> related to which target architectures LLVM support?
> 
> Also, it should be "SUPPORTS" with a final "S".

Indeed, this a mistake. I'll rename it to ?BR2_PACKAGE_LLVM_ARCH_SUPPORTS?.

> > +	bool
> > +	default y
> > +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || \
> > +		BR2_i386 || BR2_x86_64 || \
> > +		BR2_mips || BR2_mipsel || \
> > +		BR2_mips64 || BR2_mips64el || \
> > +		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> > +		BR2_sparc
> 
> It would IMO be a bit more readable as follows:
> 
> config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> 	bool
> 	default y if BR2_arm || BR2_armeb
> 	default y if BR2_aarch64
> 	default y if ...

Cool, I didn't know that multiple ?default y? lines are supported :-)

> > +menuconfig BR2_PACKAGE_LLVM
> 
> A "menuconfig" is probably not needed, keep this just a plain "config".

Okay.

> > +	bool "llvm"
> > +	depends on BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORT && \
> > +		BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_BUILDROOT_WCHAR
> 
> Please split each depends on on its own line.

Will do.

> > +	select BR2_PACKAGE_LIBXML2
> > +	select BR2_PACKAGE_ZLIB
> > +	help
> > +		The LLVM Project is a collection of modular and reusable compiler
> > +		and toolchain technologies.
> > +
> > +		http://llvm.org
> 
> Indentation of the help text is one tab + two spaces. Please run your
> package through ./support/scripts/check-package to detect such coding
> style related issues.

Handy tool, and works nicely with Vim, I'm now using this to get the list of
reported issues in the quickfix window:

   :set makeprg=./support/scripts/check-package\ %
   :make

:-)

> > +comment "llvm requires C++ and wide-character support"
> 
> Should be:
> 
> comment "llvm needs a toolchain w/ C++, wchar"
> 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>
> Indeed, the wording of such comments is standardized in Buildroot, and
> the depends on allows to not show the comment if llvm is anyway not
> available for the selected architecture.

Wouldn't the existing dependencies be needed as well? I.e:

    comment "llvm needs a toolchain w/ C++, wchar"
    	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
    	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_BUILDROOT_WCHAR

> > +config BR2_PACKAGE_LLVM_ENABLE_RTTI
> > +	bool "C++: Support RTTI"
> > +	default n
> > +	help
> > +		Enable support for C++ Run-Time Type Information (RTTI)
> > +
> > +config BR2_PACKAGE_LLVM_ENABLE_EH
> > +	bool "C++: Support exception handling"
> > +	default n
> > +	help
> > +		Enable support for C++ exception handling (try/catch)
> 
> Is it really important to make those features configurable, as opposed
> to having them unconditionally enabled? What is the size impact?

Both add a measurable amount of data to the generated object code. The
size binary size reduction when disabling RTTI for building LLVM are in the
ballpark of 5 to 10% according to Chris Lattner, one of the developers:

  https://stackoverflow.com/a/5138926

The same goes for exception handling. I did one build with both of them
disabled, and another with both options enabled, with the following results
for the combined shared library (?strip -x --strip-unneeded libLLVM-4.0.so?):

  text        data    bss     dec       hex
  15664977    385820  113648  16164445  f6a65d libLLVM-4.0.so  [with EH+RTTI]
  14164237    361440  113648  14639325  df60dd libLLVM-4.0.so  [without EH/RTTI]

That's a total saving of 1.45 MiB, which looks pretty good to me.

> > diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> > new file mode 100644
> > index 0000000000..0e9bd5fc41
> > --- /dev/null
> > +++ b/package/llvm/llvm.mk
> > @@ -0,0 +1,145 @@
> > +################################################################################
> > +#
> > +# llvm
> > +#
> > +################################################################################
> > +
> > +LLVM_VERSION = 4.0.0
> > +LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
> > +LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> > +LLVM_LICENSE = University of Illinois/NCSA Open Source License
> 
> We want SPDX license codes for the <pkg>_LICENSE variable. According to
> https://spdx.org/licenses/, the corresponding code is just "NCSA".
> 
> > +LLVM_LICENSE_FILES = LICENSE.TXT
> > +LLVM_INSTALL_STAGING = YES
> > +LLVM_INSTALL_TARGET = YES
> 
> This last line is not needed, it's the default.
> 
> > +LLVM_DEPENDENCIES = libxml2 zlib host-python host-cmake
> 
> Remove host-cmake, it's automatically added to the dependencies since
> you're using cmake-package.
> 
> > +# Determine the name of the LLVM target to enable depending on
> > +# the Buildroot target settings.
> > +#
> > +ifeq ($(BR2_i386),y)
> > +  LLVM_TARGET_ARCH := X86
> > +else ifeq ($(BR2_x86_64),y)
> > +  LLVM_TARGET_ARCH := X86
> > +else ifeq ($(BR2_arm),y)
> > +  LLVM_TARGET_ARCH := ARM
> > +else ifeq ($(BR2_armeb),y)
> > +  LLVM_TARGET_ARCH := ARM
> > +else ifeq ($(BR2_aarch64),y)
> > +  LLVM_TARGET_ARCH := AArch64
> > +else ifeq ($(BR2_mips),y)
> > +  LLVM_TARGET_ARCH := Mips
> > +else ifeq ($(BR2_mipsel),y)
> > +  LLVM_TARGET_ARCH := Mips
> > +else ifeq ($(BR2_mips64),y)
> > +  LLVM_TARGET_ARCH := Mips
> > +else ifeq ($(BR2_mips64el),y)
> > +  LLVM_TARGET_ARCH := Mips
> > +else ifeq ($(BR2_powerpc),y)
> > +  LLVM_TARGET_ARCH := PowerPC
> > +else ifeq ($(BR2_powerpc64),y)
> > +  LLVM_TARGET_ARCH := PowerPC
> > +else ifeq ($(BR2_powerpc64le),y)
> > +  LLVM_TARGET_ARCH := PowerPC
> > +else ifeq ($(BR2_sparc),y)
> > +  LLVM_TARGET_ARCH := Sparc
> > +else
> > +  $(error Target architecture not supported by LLVM)
> > +endif
> 
> Don't use := for assignments, but =. Also, this could probably be more
> nicely handled in the Config.in file. Something like:
>
> config BR2_PACKAGE_LLVM_ARCH
> 	string
> 	default "X86" if BR2_i386 || BR2_x86_64
> 	default "ARM" if BR2_arm || BR2_armeb
> 	...
>
> and in llvm.mk:
>
> LLVM_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_ARCH))

Now that's a neat trick using kconfig, thanks!

> > +# List of build options at:
> > +#    http://llvm.org/docs/CMake.html
> > +#
> > +LLVM_CONF_OPTS := \
>
> Use = for assignments, not :=.

Out of curiosity, and as a side question: What is the reason for not using
?:=? for assignments?

It looks to me as if it would be better to use the immediate-expansion
assignment (?:=?) at least when the right side of the assignment contains
potentially expensive expansions. For example:

  LLVM_ARCH := $(call qstrip,$(BR2_PACKAGE_LLVM_ARCH))
  LLVM_CONF_OPTS += \
	-DLLVM_TARGETS_TO_BUILD=$(LLVM_ARCH) \
  	-DLLVM_TARGET_ARCH=$(LLVM_ARCH) ...

...will call ?qstrip? only once, while using a lazy-expansion assignment (?=?)
causes the ?qstrip? macro to be called twice every time that $(LLVM_CONF_OPTS)
gets expanded. Using ?:=? expands the macro just once.

(I am sure there is a good reason for sticking with ?=?, and I am curious
about it, that's all)

> > +  -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
> > +  -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME) \
> > +  -DLLVM_TARGETS_TO_BUILD=$(LLVM_TARGET_ARCH) \
> > +  -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH) \
> > +  -DLLVM_OPTIMIZED_TABLEGEN=YES \
> > +  -DLLVM_ENABLE_ZLIB=YES \
> 
> zlib support is optional ?

Yes. Support for zlib is enabled by default, and it's possible to disable it.
Do you think it would be worth to enable it conditionally when zlib is being
built? Probably any target for which LLVM will be built surely has a few KiB
more for zlib.

> > +# XXX: LLVM does include some support for building native tools. This is used
> > +#      to build e.g. llvm-config, and a host-native llvm-tblgen if needed.
> > +#      Unfortunately, Buildroot is overzealous about passing the parameters
> > +#      needed for cross-building, and the CMake configuration for the native
> 
> Can you explain in what respect Buildroot is "overzealous"? Is there
> anything we can/should fix?

To be honest, I am not 100% sure that Buildroot is to blame here. There is
some code in the build files for LLVM which supposedly handle building a
version of ?llvm-config? which can be executed in the host:

  https://github.com/llvm-mirror/llvm/blob/master/tools/llvm-config/CMakeLists.txt#L65

but even when ?CMAKE_CROSSCOMPILING? is indeed correctly set in the toolchain
file generated by Buildroot, when the tools under ?NATIVE/? are built normally
the results and up being ARM (=target) binaries. The same happens with the
?llvm-tblgen? binary, which needs to be run in the host during compilation.

After much struggling and trying different things, I settled on re-configuring
the ?NATIVE/? subdirectory to use ?HOST{CC,CXX}_NOCACHE? which has been working
reliably for weeks now (somehow, trying to use ccache here breaks the builds,
though :-S)

Because LLVM includes some provisions for cross-compiling which are not
working well, I assumed that maybe Buildroot is doing something funny here.
But take into account that my knowledge of CMake is limited (for now!) and it
could as well be that the LLVM build system is broken instead.

> > +#      tools ends up using the cross-toolchain. Once "cmake-package" has
> > +#      defined LLVM_*_CMDS, this adds:
> > +#
> > +#        - A call to CMake which resets CMAKE_{C,CXX,ASM}_COMPILER with the
> > +#          paths to the host-native ones. Note that using the *_NOCCACHE
> > +#          variables is needed, otherwise CMake will choke.
> > +#
> > +#        - The file "BuildVariables.inc" is copied over from the cross-build
> > +#          directory to the native one. This way a new "llvm-config" which
> > +#          can run on the build host returns information about the target
> > +#          build which gets installed in the sysroot. This is done as an
> > +#          appended build command. Note that Make has to be re-invoked to
> > +#          rebuild after copying the file over.
> > +#
> > +#        - Last but not least, "llvm-config" is copied into the sysroot with
> > +#          the target triple prefix, because packages using sane build systems
> > +#          will first try that.
> 
> Buildroot doesn't rename <foo>-config scripts/programs to be prefixed
> with the target triple prefix, so it would be better to keep it named
> llvm-config, like all other <foo>-config in $(STAGING_DIR)/usr/bin.

It's fine to just call the binary ?llvm-config?, the idea behind this was to
avoid this warning when configuring Mesa3D:

  Checking for llvm-config... /home/aperez/devel/wpe/buildroot-upstream/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/bin/llvm-config
  configure: WARNING: using cross tools not prefixed with host triplet

Let's change it back to just ?llvm-config?, then.

> > +LLVM_CONFIGURE_CMDS += \
> 
> Using those += is really not clean. Instead, you should use
> POST_CONFIGURE_HOOKS, POST_BUILD_HOOKS and POST_INSTALL_STAGING_HOOKS.

Certainly.

> However, I'd really like to understand how Buildroot is "overzealous"
> and see if things can work out of the box without doing those hacks.

As mentioned above, I do not have a good reason to be 100% sure that this is
Buildroot's fault. Any ideas on what may be going on here will be very welcome
and I am willing to try and improve this as much as my spare time allows. In
the next days I won't have the chance to spend time figuring this out, but at
any rate, I will be submitting an updated patch today or tomorrow with the
rest of suggested changes.

Cheers,

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170619/811d091c/attachment.asc>
