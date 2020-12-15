From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 15 Dec 2020 11:59:39 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: fix host ccache support
 for CMake 3.19
In-Reply-To: <20201213215627.GN3281876@scaer>
References: <20201212225224.117940-1-bernd.amend@gmail.com>
 <20201213215627.GN3281876@scaer>
Message-ID: <CAGm1_ks0sShkfF453xs=m6FmBYHC9NCjFj+eK=eU1CTTyDUiBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Sun, Dec 13, 2020 at 10:56 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Bernd, All,
>
> +Peter, +Yegor: you guys are doing some other cmake-related stuff
> recently: what's you opinion on that patch?
>
> Regards,
> Yann E. MORIN.
>
> On 2020-12-12 23:52 +0100, Bernd Amend spake thusly:
> > Starting with CMake 3.4 CMake supports setting a compiler launcher
> > like ccache. The feature is described in
> > https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_LAUNCHER.html
> > This should be safe since everything is built for the host using make or ninja.
> > The use of *_ARG1 is discouraged by the cmake developers
> > https://cmake-developers.cmake.narkive.com/OTa9EKfj/cmake-c-compiler-arg-not-documented .
> >
> > Without this patch I get the following error message with CMake 3.19.1 on Arch Linux.
> > Disabling BR2_CCACHE also resolves the issue.
> >
> > /usr/bin/cmake [~]/buildroot/build/host-lzo-2.10/ -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_FIND_ROOT_PATH="[...]" -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" -DCMAKE_FIND_ROOT_P
> > ATH_MODE_LIBRARY="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" -DCMAKE_INSTALL_PREFIX="[...]" -DCMAKE_C_FLAGS="-O2 -I[...]/include" -DCMAKE_CXX_FLAGS="-O2 -I[...]/include" -DCMAKE_EXE_LINKER_FLAGS="-L[...]/lib -Wl,-rpath,[...]/lib" -DCMAKE_SHARED_LINKER_FLAGS="-L[...]/l
> > ib -Wl,-rpath,[...]/lib" -DCMAKE_ASM_COMPILER="/usr/bin/as" -DCMAKE_C_COMPILER="[...]/bin/ccache" -DCMAKE_CXX_COMPILER="[...]/bin/ccache"
> > -DCMAKE_C_COMPILER_ARG1="/usr/bin/gcc" -DCMAKE_CXX_COMPILER_ARG1="/usr/bin/g++"  -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF -DBUILD_TESTING=O
> > FF  -DENABLE_SHARED=ON -DENABLE_STATIC=OFF )
> > -- The C compiler identification is unknown
> > -- Detecting C compiler ABI info
> > -- Detecting C compiler ABI info - failed
> > -- Check for working C compiler: [...]/bin/ccache
> > -- Check for working C compiler: [...]/bin/ccache - broken
> > CMake Error at /usr/share/cmake-3.19/Modules/CMakeTestCCompiler.cmake:66 (message):
> > The C compiler
> >
> > Signed-off-by: Bernd Amend <bernd.amend@gmail.com>

Interesting option. Never heard about it before. So, my tests with
ccache were successful.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Regards,
Yegor

> > ---
> >  package/pkg-cmake.mk | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index dc545caed9..3ee7067250 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -22,10 +22,10 @@
> >
> >  # Set compiler variables.
> >  ifeq ($(BR2_CCACHE),y)
> > -CMAKE_HOST_C_COMPILER = $(HOST_DIR)/bin/ccache
> > -CMAKE_HOST_CXX_COMPILER = $(HOST_DIR)/bin/ccache
> > -CMAKE_HOST_C_COMPILER_ARG1 = $(HOSTCC_NOCCACHE)
> > -CMAKE_HOST_CXX_COMPILER_ARG1 = $(HOSTCXX_NOCCACHE)
> > +CMAKE_HOST_C_COMPILER = $(HOSTCC_NOCCACHE)
> > +CMAKE_HOST_CXX_COMPILER = $(HOSTCXX_NOCCACHE)
> > +CMAKE_HOST_C_COMPILER_LAUNCHER = $(HOST_DIR)/bin/ccache
> > +CMAKE_HOST_CXX_COMPILER_LAUNCHER = $(HOST_DIR)/bin/ccache
> >  else
> >  CMAKE_HOST_C_COMPILER = $(HOSTCC)
> >  CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
> > @@ -134,9 +134,9 @@ define $(2)_CONFIGURE_CMDS
> >               -DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
> >               -DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
> >               -DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
> > -             $(if $$(CMAKE_HOST_C_COMPILER_ARG1),\
> > -                     -DCMAKE_C_COMPILER_ARG1="$$(CMAKE_HOST_C_COMPILER_ARG1)" \
> > -                     -DCMAKE_CXX_COMPILER_ARG1="$$(CMAKE_HOST_CXX_COMPILER_ARG1)" \
> > +             $(if $$(CMAKE_HOST_C_COMPILER_LAUNCHER),\
> > +                     -DCMAKE_C_COMPILER_LAUNCHER="$$(CMAKE_HOST_C_COMPILER_LAUNCHER)" \
> > +                     -DCMAKE_CXX_COMPILER_LAUNCHER="$$(CMAKE_HOST_CXX_COMPILER_LAUNCHER)" \
> >               ) \
> >               -DCMAKE_COLOR_MAKEFILE=OFF \
> >               -DBUILD_DOC=OFF \
> > --
> > 2.29.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
