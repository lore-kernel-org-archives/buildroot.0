From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 15 Nov 2018 14:41:43 -0600
Subject: [Buildroot] [PATCH 1/5] package/compiler-rt: new package
In-Reply-To: <aab3bb30-7b2d-0e36-d0cc-52dd7b047cf1@smile.fr>
References: <1542150146-12188-1-git-send-email-matthew.weber@rockwellcollins.com>
 <aab3bb30-7b2d-0e36-d0cc-52dd7b047cf1@smile.fr>
Message-ID: <CANQCQpbLEqNdNiR2UON0BritSUnVsL0DgfnL1ntGm6=RF8KStw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,


On Thu, Nov 15, 2018 at 10:46 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi Matt,
>
> Le 14/11/2018 ? 00:02, Matt Weber a ?crit :
> > This patch adds support for the compiler-rt (CLANG runtime) libary.
> > It builds a set of static libraries and installs them into the
> > CLANG/LLVM toolchain resource folder.
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  DEVELOPERS                           |  1 +
> >  package/Config.in                    |  1 +
> >  package/compiler-rt/Config.in        | 12 ++++++++++++
> >  package/compiler-rt/compiler-rt.hash |  3 +++
> >  package/compiler-rt/compiler-rt.mk   | 35 +++++++++++++++++++++++++++++++++++
> >  5 files changed, 52 insertions(+)
> >  create mode 100644 package/compiler-rt/Config.in
> >  create mode 100644 package/compiler-rt/compiler-rt.hash
> >  create mode 100644 package/compiler-rt/compiler-rt.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 53467da..e78d649 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1360,6 +1360,7 @@ F:      package/bridge-utils/
> >  F:   package/checkpolicy/
> >  F:   package/checksec/
> >  F:   package/cgroupfs-mount/
> > +F:   package/compiler-rt/
> >  F:   package/crda/
> >  F:   package/devmem2/
> >  F:   package/dnsmasq/
> > diff --git a/package/Config.in b/package/Config.in
> > index b60e770..73ddc2d 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1602,6 +1602,7 @@ menu "Other"
> >       source "package/clapack/Config.in"
> >       source "package/classpath/Config.in"
> >       source "package/cmocka/Config.in"
> > +     source "package/compiler-rt/Config.in"
> >       source "package/cppcms/Config.in"
> >       source "package/cracklib/Config.in"
> >       source "package/dawgdic/Config.in"
> > diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
> > new file mode 100644
> > index 0000000..e15d3aa
> > --- /dev/null
> > +++ b/package/compiler-rt/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_COMPILER_RT
> > +     bool "compiler-rt"
> > +     depends on BR2_PACKAGE_LLVM
> > +     help
> > +       A collection of runtime libraries primarily used by clang and
> > +       llvm to provide builtins, sanitizer runtimes, and profiling
> > +       at runtime.
> > +
> > +       https://compiler-rt.llvm.org/
> > +
> > +comment "compiler-rt requires llvm to be enabled"
> > +     depends on !BR2_PACKAGE_LLVM
> > diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
> > new file mode 100644
> > index 0000000..df6ed19
> > --- /dev/null
> > +++ b/package/compiler-rt/compiler-rt.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed:
> > +sha256 bdec7fe3cf2c85f55656c07dfb0bd93ae46f2b3dd8f33ff3ad6e7586f4c670d6  compiler-rt-7.0.0.src.tar.xz
> > +sha256 417541d990edb3f96327ac03cb67e52eac80fc5c3e7afc69213cd04d7c3b9b27  LICENSE.TXT
> > diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
> > new file mode 100644
> > index 0000000..3f44639
> > --- /dev/null
> > +++ b/package/compiler-rt/compiler-rt.mk
> > @@ -0,0 +1,35 @@
> > +################################################################################
> > +#
> > +# compiler-rt
> > +#
> > +################################################################################
> > +
> > +# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
> > +# tied to the version of those tools
> > +COMPILER_RT_VERSION = 7.0.0
> > +COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
> > +COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
> > +COMPILER_RT_LICENSE = NCSA MIT
> > +COMPILER_RT_LICENSE_FILES = LICENSE.TXT
> > +COMPILER_RT_DEPENDENCIES = host-cmake host-clang llvm
>
> No need to add host-cmake since compiler-rt is a cmake based package.

True, funny what you miss when you review your own work :-) I'll remove that.

>
> > +
> > +COMPILER_RT_INSTALL_STAGING = YES
> > +COMPILER_RT_INSTALL_TARGET = NO
>
> Compiler-rt is a "collection of runtime libraries", so it's weird to not install
> them on the target. Maybe it's due to compiler-rt provide only static libraries?
> In that case it's fine but can you add a comment?

For this initial usecase, yes the libraries I'm using are just static.
Maybe a comment like follows?

"Only static libraries are currently assumed to support a libfuzzer
use-case, however there could be use-cases to install shared
libraries, if compiler-rt is used in other forms to build executables
with Clang."

>
> > +
> > +
> > +# -DCMAKE_INSTALL_PREFIX="" allows the COMPILER_RT_INSTALL_STAGING_CMDS to
> > +# provide the complete path to compilier-rt for installation of the runtime
> > +# libraries into the host-{clang,llvm} resources directory. The "resources"
> > +# directory is loosely document at this point and will probably need revisited
> > +# when making the llvm/clang tools SDK relocatable.
> > +COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_INCLUDE_TESTS=ON \
> > +     -DCOMPILER_RT_STANDALONE_BUILD=ON \
> > +     -DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
> > +     -DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config \
> > +     -DCMAKE_INSTALL_PREFIX=""
> > +
> > +define COMPILER_RT_INSTALL_STAGING_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/ install/fast
> > +endef
>
> I need to take a look, usually CMAKE_INSTALL_PREFIX should be set to /usr.

Agree, however currently I end up with a pathing problem I haven't
been able to solve yet.
 i.e. if CMAKE_INSTALL_PREFIX=/usr
/home/foobar/buildroot/output/host/lib/clang/7.0.0/usr/lib/*.a

 i.e. if CMAKE_INSTALL_PREFIX=""
/home/foobar/buildroot/output/host/lib/clang/7.0.0/lib/*.a

The toolchain is actually looking in the location
CMAKE_INSTALL_PREFIX="" for the runtime libraries it uses to build.

Thank you for the review on this series,
Matt
