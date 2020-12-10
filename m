From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Dec 2020 20:40:09 +0100
Subject: [Buildroot] [PATCH/next v1 1/2] package/ninja: bump version to
 1.10.2
In-Reply-To: <20201210201947.144986f5@gmx.net>
References: <20201202194236.1751-1-ps.report@gmx.net>
 <20201205212830.6cb9158d@windsurf.home>
 <20201209235010.5105b11c@gmx.net>
 <CAGm1_ksL0d+9NBFiX4RbTe5B9mq=1HWFKPvd3u+YVQ78re1uZQ@mail.gmail.com>
 <20201210200139.030b21d8@gmx.net> <20201210201947.144986f5@gmx.net>
Message-ID: <20201210204009.6d3a5746@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Thu, 10 Dec 2020 20:19:47 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Yegor,
>
> On Thu, 10 Dec 2020 20:01:39 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Hello Yegor,
> >
> > On Thu, 10 Dec 2020 11:36:40 +0100, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> >
> > > Hi Peter, all,
> > >
> > > On Wed, Dec 9, 2020 at 11:50 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > >
> > > > Hello Thomas,
> > > >
> > > > On Sat, 5 Dec 2020 21:28:30 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > > >
> > > > > On Wed,  2 Dec 2020 20:42:35 +0100
> > > > > Peter Seiderer <ps.report@gmx.net> wrote:
> > > > >
> > > > > > - rebased 0001-set-minimum-cmake-version-to-3.10.patch
> > > > > >
> > > > > > - removed 0002-remove-fdiagnostics-color-from-make-command.patch
> > > > > >   (superseeded by upstream commit [1])
> > > > > >
> > > > > > - rebased package/ninja/0003-CMake-fix-object-library-usage.patch
> > > > > >
> > > > > > [1] https://github.com/ninja-build/ninja/commit/418d59b8a6054ce9ef1a28c07c41d3a0bb386836
> > > > > >
> > > > > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > > > ---
> > > > > >  ...01-set-minimum-cmake-version-to-3.10.patch | 20 +++---
> > > > > >  ...fdiagnostics-color-from-make-command.patch | 29 --------
> > > > > >  .../0003-CMake-fix-object-library-usage.patch | 67 ++++++++++---------
> > > > > >  package/ninja/ninja.hash                      |  4 +-
> > > > > >  package/ninja/ninja.mk                        |  2 +-
> > > > > >  5 files changed, 49 insertions(+), 73 deletions(-)
> > > > > >  delete mode 100644 package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch
> > > > >
> > > > > Both applied. Could you keep an eye of meson-based package failures in
> > > > > the coming days? Updates of Meson have had a tendency to break stuff a
> > > > > bit in the past. Thanks!
> > > >
> > > > No breakage detected (yet?), the only new feature is the following
> > > > deprecation warning:
> > > >
> > > >         DEPRECATION: c_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> > > >         DEPRECATION: c_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> > > >         DEPRECATION: cpp_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> > > >         DEPRECATION: cpp_link_args in the [properties] section of the machine file is deprecated, use the [built-in options] section.
> > > >
> > > >
> > > > Which can be fixed by the following patch:
> > > >
> > > > --- a/package/meson/cross-compilation.conf.in
> > > > +++ b/package/meson/cross-compilation.conf.in
> > > > @@ -14,13 +14,15 @@ g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
> > > >
> > > >  [properties]
> > > >  needs_exe_wrapper = true
> > > > +sys_root = '@STAGING_DIR@'
> > > > +pkg_config_libdir = '@STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig'
> > > > +pkg_config_static = '@STATIC@'
> > > > +
> > > > +[built-in options]
> > > >  c_args = [@TARGET_CFLAGS@]
> > > >  c_link_args = [@TARGET_LDFLAGS@]
> > > >  cpp_args = [@TARGET_CXXFLAGS@]
> > > >  cpp_link_args = [@TARGET_LDFLAGS@]
> > > > -sys_root = '@STAGING_DIR@'
> > > > -pkg_config_libdir = '@STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig'
> > > > -pkg_config_static = '@STATIC@'
> > > >
> > > >  [host_machine]
> > > >  system = 'linux'
> > >
> > > Ninja build breaks on my development host because my host CMake is
> > > 3.10.2 and the following source file option like INCLUDE_DIRECTORIES
> > > was introduced in a later version:
> >
> > Are you sure this is cmake version related? According to [1]
> > INCLUDE_DIRECTORIES is valid for cmake-3.10.x..., what is the exact
> > failure message?
> >
> > >
> > >         set_source_files_properties(src/browse.cc
> > >                 PROPERTIES
> > >                         OBJECT_DEPENDS "${CMAKE_BINARY_DIR}/build/browse_py.h"
> > >                         INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}"
> > >                         COMPILE_DEFINITIONS NINJA_PYTHON="python"
> > >         )
> >
> > The offending code was introduces with commit [2] 'CMake: Add support for
> > "browse" mode'...
> >
> > >
> > > The build breaks because build/browse_py.h cannot be found.
> >
> > This file should be created by the cmake build system, see [3]...,
> > so something seems to fail for this build step on your system
> > (dependency?, missing tool?)...
> >
> > >
> > > Though I can create a patch for it, I wonder whether it is time to
> > > bump the minimal CMake version to something new? To 3.16 for example?
> >
> > I believe unrelated to the failure...
>
> Update: according to [4] INCLUDE_DIRECTORIES is mentioned for
> 'Properties on Source Files' (cmake-latest) but not for
> cmake-3.10.x [5]...
>
> Maybe the failure can be avoided by changing from using
> INCLUDE_DIRECTORIES to COMPILE_FLAGS?

Care to try rfc patch [6]?

Regards,
Peter

[6] https://patchwork.ozlabs.org/project/buildroot/patch/20201210193807.19225-1-ps.report at gmx.net/

>
> Regards,
> Peter
>
> [4] https://cmake.org/cmake/help/latest/manual/cmake-properties.7.html#source-file-properties
> [5] https://cmake.org/cmake/help/v3.10/manual/cmake-properties.7.html#source-file-properties
>
> >
> > Regards,
> > Peter
> >
> > >
> > > Best regards,
> > > Yegor
> >
> > [1] https://cmake.org/cmake/help/v3.10/prop_tgt/INCLUDE_DIRECTORIES.html
> > [2] https://github.com/ninja-build/ninja/commit/5b80abbc729e94abb5f5776a3438ad57d480c097
> > [3] https://github.com/ninja-build/ninja/blob/master/CMakeLists.txt#L151
>
