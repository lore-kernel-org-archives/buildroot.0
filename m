From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 12 Dec 2020 21:59:21 +0100
Subject: [Buildroot] [RFC v2] package/ninja: fix to be cmake-3.10
 compatible again
In-Reply-To: <CAGm1_kvUN-nYCmq4-LiAGyjH7-Og-OO0Tggrh8hmaAEGYXxPnA@mail.gmail.com>
References: <20201210215405.12318-1-ps.report@gmx.net>
 <CAGm1_kuufhqwTTyUeLBcqY5FA7X3U99Or+JVG4d+PxfGsH1c8g@mail.gmail.com>
 <20201211193841.19427c34@gmx.net>
 <CAGm1_ktznMS6DHboQM0RZYcFWbxvnNUGa9yguzeUw+QBnxiJwQ@mail.gmail.com>
 <20201211203753.17c902f0@gmx.net>
 <CAGm1_ksn39+fnUA2=N15YAdA0dnGT2MPtRwXRj-nBU1tY68YQQ@mail.gmail.com>
 <CAGm1_kvUN-nYCmq4-LiAGyjH7-Og-OO0Tggrh8hmaAEGYXxPnA@mail.gmail.com>
Message-ID: <20201212215921.29fe8858@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Sat, 12 Dec 2020 12:41:43 +0100, Yegor Yefremov via buildroot <buildroot@busybox.net> wrote:

> On Fri, Dec 11, 2020 at 11:38 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > Hello Peter,
> >
> > On Fri, Dec 11, 2020 at 8:37 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > Hello Yegor,
> > >
> > > On Fri, 11 Dec 2020 20:20:05 +0100, Yegor Yefremov via buildroot <buildroot@busybox.net> wrote:
> > >
> > > > On Fri, Dec 11, 2020 at 7:38 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > > >
> > > > > Hello Yegor,
> > > > >
> > > > > On Fri, 11 Dec 2020 06:37:08 +0100, Yegor Yefremov via buildroot <buildroot@busybox.net> wrote:
> > > > >
> > > > > > On Thu, Dec 10, 2020 at 10:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > > > > >
> > > > > > > Fixes (see [1]):
> > > > > > >
> > > > > > > ToDo: ...
> > > > > > >
> > > > > > > [1] http://lists.busybox.net/pipermail/buildroot/2020-December/298159.html
> > > > > > >
> > > > > > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > > >
> > > > > > Works like a charm.
> > > > >
> > > > > Thanks for testing, mind to send me the original failure message/log
> > > > > so I can fill the missing part in the patch commit message?
> > > >
> > > > Here you are (error shown with VERBOSE=ON):
> > > >
> > > > [ 93%] Building CXX object CMakeFiles/ninja.dir/src/ninja.cc.o
> > > > [ 96%] Building CXX object CMakeFiles/ninja.dir/src/browse.cc.o
> > > > /home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache
> > > > /usr/bin/g++  -DNINJA_HAVE_BROWSE  -O2
> > > > -I/home/user/MyProjects/oss/br-test-v2/s2srv/host/include
> > > > -Wno-deprecated -fdiagnostics-color   -o
> > > > CMakeFiles/ninja.dir/src/ninja.cc.o -c
> > > > /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/src/ninja.cc
> > > > /home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache
> > > > /usr/bin/g++  -DNINJA_HAVE_BROWSE -DNINJA_PYTHON=\"python\"  -O2
> > > > -I/home/user/MyProjects/oss/br-test-v2/s2srv/host/include
> > > > -Wno-deprecated -fdiagnostics-color   -o
> > > > CMakeFiles/ninja.dir/src/browse.cc.o -c
> > > > /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/src/browse.cc
> > > > /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/src/browse.cc:23:10:
> > > > fatal error: build/browse_py.h: No such file or directory
> > > >  #include "build/browse_py.h"
> > > >           ^~~~~~~~~~~~~~~~~~~
> > > > compilation terminated.
> > >
> > > Thanks for the log...., but this is a follow-up failure because the file
> > > is not generated, I believe because the dependency declared for src/browse.cc
> > > (line 155-161, specially line 158: OBJECT_DEPENDS "${CMAKE_BINARY_DIR}/build/browse_py.h")
> > > is not evaluated because the unknown INCLUDE_DIRECTORIES, no warning about this
> > > earlier in the logs?
> >
> > The file build/browse_py.h was generated. It is only include path that
> > is missing. So no earlier warnings.

As INCLUDE_DIRECTORIES is unknown/unused with cmake-3.10 it has no effect (same as
setting some complete other/private var), so the build failure...

Thanks for reporting, testing and patience for providing the log files ;-)

Updated patch with update commit description already sent out to the mailing
list...

Regards,
Peter

>
> Below you'll find the full log:
>
> >>> host-ninja 1.10.2 Configuring
> (mkdir -p /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/
> && cd /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/
> && rm -f CMakeCache.txt &&
> PATH="/home/user/MyProjects/oss/br-test-v2/s2srv/host/bin:/home/user/MyProjects/oss/br-test-v2/s2srv/host/sbin:/home/user/.nvm/versions/node/v6.17.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
> PKG_CONFIG="/home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR="/"
> PKG_CONFIG_LIBDIR="/home/user/MyProjects/oss/br-test-v2/s2srv/host/lib/pkgconfig:/home/user/MyProjects/oss/br-test-v2/s2srv/host/share/pkgconfig"
> PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> /usr/bin/cmake /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/
> -DCMAKE_INSTALL_SO_NO_EXE=0
> -DCMAKE_FIND_ROOT_PATH="/home/user/MyProjects/oss/br-test-v2/s2srv/host"
> -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH"
> -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH"
> -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH"
> -DCMAKE_INSTALL_PREFIX="/home/user/MyProjects/oss/br-test-v2/s2srv/host"
> -DCMAKE_C_FLAGS="-O2
> -I/home/user/MyProjects/oss/br-test-v2/s2srv/host/include"
> -DCMAKE_CXX_FLAGS="-O2
> -I/home/user/MyProjects/oss/br-test-v2/s2srv/host/include"
> -DCMAKE_EXE_LINKER_FLAGS="-L/home/user/MyProjects/oss/br-test-v2/s2srv/host/lib
> -Wl,-rpath,/home/user/MyProjects/oss/br-test-v2/s2srv/host/lib"
> -DCMAKE_SHARED_LINKER_FLAGS="-L/home/user/MyProjects/oss/br-test-v2/s2srv/host/lib
> -Wl,-rpath,/home/user/MyProjects/oss/br-test-v2/s2srv/host/lib"
> -DCMAKE_ASM_COMPILER="/usr/bin/as"
> -DCMAKE_C_COMPILER="/home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache"
> -DCMAKE_CXX_COMPILER="/home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache"
>  -DCMAKE_C_COMPILER_ARG1="/usr/bin/gcc"
> -DCMAKE_CXX_COMPILER_ARG1="/usr/bin/g++"  -DCMAKE_COLOR_MAKEFILE=OFF
> -DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF
> -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF
> -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON   )
> -- The C compiler identification is GNU 7.4.0
> -- The CXX compiler identification is GNU 7.4.0
> -- Check for working C compiler:
> /home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache
> -- Check for working C compiler:
> /home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache -- works
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - done
> -- Detecting C compile features
> -- Detecting C compile features - done
> -- Check for working CXX compiler:
> /home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache
> -- Check for working CXX compiler:
> /home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/ccache -- works
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Detecting CXX compile features
> -- Detecting CXX compile features - done
> -- IPO / LTO enabled
> -- Performing Test flag_no_deprecated
> -- Performing Test flag_no_deprecated - Success
> -- Performing Test flag_color_diag
> -- Performing Test flag_color_diag - Success
> -- Looking for C++ include unistd.h
> -- Looking for C++ include unistd.h - found
> -- Configuring done
> -- Generating done
> CMake Warning:
>   Manually-specified variables were not used by the project:
>
>     BUILD_DOC
>     BUILD_DOCS
>     BUILD_EXAMPLE
>     BUILD_EXAMPLES
>     BUILD_TEST
>     BUILD_TESTS
>     CMAKE_ASM_COMPILER
>     CMAKE_FIND_ROOT_PATH_MODE_LIBRARY
>
>
> -- Build files have been written to:
> /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2
>
> >>> host-ninja 1.10.2 Building
> PATH="/home/user/MyProjects/oss/br-test-v2/s2srv/host/bin:/home/user/MyProjects/oss/br-test-v2/s2srv/host/sbin:/home/user/.nvm/versions/node/v6.17.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
> PKG_CONFIG="/home/user/MyProjects/oss/br-test-v2/s2srv/host/bin/pkg-config"
> PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> PKG_CONFIG_LIBDIR="/home/user/MyProjects/oss/br-test-v2/s2srv/host/lib/pkgconfig:/home/user/MyProjects/oss/br-test-v2/s2srv/host/share/pkgconfig"
>  /usr/bin/make -j9  -C
> /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/
> [  3%] Generating lexer.cc
> [  6%] Generating depfile_parser.cc
> Scanning dependencies of target libninja
> Scanning dependencies of target libninja-re2c
> [ 10%] Building CXX object CMakeFiles/libninja.dir/src/build_log.cc.o
> [ 16%] Building CXX object CMakeFiles/libninja.dir/src/clean.cc.o
> [ 16%] Building CXX object CMakeFiles/libninja.dir/src/dyndep_parser.cc.o
> [ 20%] Building CXX object CMakeFiles/libninja.dir/src/build.cc.o
> [ 23%] Building CXX object CMakeFiles/libninja.dir/src/clparser.cc.o
> [ 30%] Building CXX object CMakeFiles/libninja.dir/src/debug_flags.cc.o
> [ 30%] Building CXX object CMakeFiles/libninja.dir/src/dyndep.cc.o
> [ 33%] Building CXX object CMakeFiles/libninja.dir/src/deps_log.cc.o
> [ 36%] Building CXX object CMakeFiles/libninja-re2c.dir/depfile_parser.cc.o
> [ 40%] Building CXX object CMakeFiles/libninja-re2c.dir/lexer.cc.o
> [ 43%] Building CXX object CMakeFiles/libninja.dir/src/edit_distance.cc.o
> [ 46%] Building CXX object CMakeFiles/libninja.dir/src/disk_interface.cc.o
> [ 50%] Building CXX object CMakeFiles/libninja.dir/src/graph.cc.o
> [ 56%] Building CXX object CMakeFiles/libninja.dir/src/graphviz.cc.o
> [ 56%] Building CXX object CMakeFiles/libninja.dir/src/eval_env.cc.o
> [ 60%] Building CXX object CMakeFiles/libninja.dir/src/line_printer.cc.o
> [ 63%] Building CXX object CMakeFiles/libninja.dir/src/manifest_parser.cc.o
> [ 66%] Building CXX object CMakeFiles/libninja.dir/src/metrics.cc.o
> [ 66%] Built target libninja-re2c
> [ 70%] Building CXX object CMakeFiles/libninja.dir/src/parser.cc.o
> [ 73%] Building CXX object CMakeFiles/libninja.dir/src/state.cc.o
> [ 80%] Building CXX object CMakeFiles/libninja.dir/src/util.cc.o
> [ 80%] Building CXX object CMakeFiles/libninja.dir/src/version.cc.o
> [ 83%] Building CXX object CMakeFiles/libninja.dir/src/string_piece_util.cc.o
> [ 86%] Building CXX object CMakeFiles/libninja.dir/src/subprocess-posix.cc.o
> [ 86%] Built target libninja
> [ 90%] Generating build/browse_py.h
> Scanning dependencies of target ninja
> [ 93%] Building CXX object CMakeFiles/ninja.dir/src/ninja.cc.o
> [ 96%] Building CXX object CMakeFiles/ninja.dir/src/browse.cc.o
> /home/user/MyProjects/oss/br-test-v2/s2srv/build/host-ninja-1.10.2/src/browse.cc:23:10:
> fatal error: build/browse_py.h: No such file or directory
>  #include "build/browse_py.h"
>           ^~~~~~~~~~~~~~~~~~~
> compilation terminated.
> CMakeFiles/ninja.dir/build.make:93: recipe for target
> 'CMakeFiles/ninja.dir/src/browse.cc.o' failed
>
>
> Regards,
> Yegor
>
> >
> > >
> > > 139 if(platform_supports_ninja_browse)
> > > 140         # Inlines src/browse.py into the browse_py.h header, so that it can be included
> > > 141         # by src/browse.cc
> > > 142         add_custom_command(
> > > 143                 OUTPUT build/browse_py.h
> > > 144                 MAIN_DEPENDENCY src/browse.py
> > > 145                 DEPENDS src/inline.sh
> > > 146                 COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/build
> > > 147                 COMMAND src/inline.sh kBrowsePy
> > > 148                                                 < src/browse.py
> > > 149                                                 > ${CMAKE_BINARY_DIR}/build/browse_py.h
> > > 150                 WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
> > > 151                 VERBATIM
> > > 152         )
> > > 153
> > > 154         target_compile_definitions(ninja PRIVATE NINJA_HAVE_BROWSE)
> > > 155         target_sources(ninja PRIVATE src/browse.cc)
> > > 156         set_source_files_properties(src/browse.cc
> > > 157                 PROPERTIES
> > > 158                         OBJECT_DEPENDS "${CMAKE_BINARY_DIR}/build/browse_py.h"
> > > 159                         INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}"
> > > 160                         COMPILE_DEFINITIONS NINJA_PYTHON="python"
> > > 161         )
> > > 162 endif()
> > >
> > > Regards,
> > > Peter
> > >
> > > >
> > > > Regards,
> > > > Yegor
> > > >
> > > > > Regards,
> > > > > Peter
> > > > >
> > > > > >
> > > > > > Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > > > >
> > > > > > Regards,
> > > > > > Yegor
> > > > > >
> > > > > > > ---
> > > > > > > Changes v1 -> v2:
> > > > > > >   - really use COMPILE_FLAGS (as the patch subject says)
> > > > > > >     (suggested by Yegor Yefremov)
> > > > > > > ---
> > > > > > >  ...onform-COMPILE_FLAGS-instead-of-3.15.patch | 27 +++++++++++++++++++
> > > > > > >  1 file changed, 27 insertions(+)
> > > > > > >  create mode 100644 package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> > > > > > >
> > > > > > > diff --git a/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch b/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..d92959a938
> > > > > > > --- /dev/null
> > > > > > > +++ b/package/ninja/0004-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> > > > > > > @@ -0,0 +1,27 @@
> > > > > > > +From 71840d514511291410d514790c25956be9d4dfe5 Mon Sep 17 00:00:00 2001
> > > > > > > +From: Peter Seiderer <ps.report@gmx.net>
> > > > > > > +Date: Thu, 10 Dec 2020 20:29:19 +0100
> > > > > > > +Subject: [PATCH] use cmake-3.10 conform COMPILE_FLAGS instead of 3.15
> > > > > > > + INCLUDE_DIRECTORIES property
> > > > > > > +
> > > > > > > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > > > > +---
> > > > > > > + CMakeLists.txt | 2 +-
> > > > > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > +
> > > > > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > > > > +index 7f03c35..f582d2f 100644
> > > > > > > +--- a/CMakeLists.txt
> > > > > > > ++++ b/CMakeLists.txt
> > > > > > > +@@ -156,7 +156,7 @@ if(platform_supports_ninja_browse)
> > > > > > > +       set_source_files_properties(src/browse.cc
> > > > > > > +               PROPERTIES
> > > > > > > +                       OBJECT_DEPENDS "${CMAKE_BINARY_DIR}/build/browse_py.h"
> > > > > > > +-                      INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}"
> > > > > > > ++                      COMPILE_FLAGS "-I${CMAKE_BINARY_DIR}"
> > > > > > > +                       COMPILE_DEFINITIONS NINJA_PYTHON="python"
> > > > > > > +       )
> > > > > > > + endif()
> > > > > > > +--
> > > > > > > +2.29.2
> > > > > > > +
> > > > > > > --
> > > > > > > 2.29.2
> > > > > > >
> > > > > > _______________________________________________
> > > > > > buildroot mailing list
> > > > > > buildroot at busybox.net
> > > > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
