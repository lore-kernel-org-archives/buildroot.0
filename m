From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Dec 2010 22:34:17 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
	CMake packages
In-Reply-To: <AANLkTi=tmgB5T23WvH112P1YgrO-w+xjwtiU9=D01J90@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTinkazQ2EzvCE46nSYmAkGiEJ3Ti+oM6=7g+u0Y5@mail.gmail.com>
	<AANLkTi=tmgB5T23WvH112P1YgrO-w+xjwtiU9=D01J90@mail.gmail.com>
Message-ID: <AANLkTi=frxyYAzAaApiwAfxairhSKe38qkBgvk633_eF@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bj?rn,


> You configure and build in the source tree, why not.. but CMake

> supports (i'd like to say: it's designed to) build out of source tree (and

> it messes up a bite the build tree...).


> I agree, it's a bit messy. But where to but the build tree? Inside the

srctree or in a directory at the same level? I guess I would prefer the

latter, something like


> srctree:

 output/build/cdrkit-1.1.10


> buildtree:

 output/build/cdrkit-1.1.10.build

or:
srctree:
  output/build/cdrkit-1.1.10
buildtree:
  output/build/cdrkit-1.1.10/build
Like this, we keep only one directory per package and don't mess up the
source tree.
Whatever, both solutions are good. For me, it's not a big deal, but maybe BR
leaders will prefer one or the other solution to keep it consistent.

However, isn't there a little conflict between internal and external use?

For internal use I'd like Buildroot to force build configurations on all

packages, like Debug/Release. but for external packages I'd like to control

this in the package itself.

Debug/Release configuration is a setting managed by CMAKE_BUILD_TYPE, so if
we want to force the release config inside BR, we can
define CMAKE_BUILD_TYPE in the CONFIGURE_CMDS function.
We can even add the option in the menuconfig...

Maybe we should use the same toolchain-file internally and externally,

That's my goal.


> but give CMake CFLAGS/CXXFLAGS on the commandline when building internal
> packages?

If we need, yes, but i am quite doubtful about the usefulness of these
flags.


Cheers,

Samuel


2010/12/14 Bj?rn Forsman <bjorn.forsman@gmail.com>

> Hi Samuel,
>
> 2010/12/13 Samuel Martin <s.martin49@gmail.com>:
> > Hi Bj?rn,
> > Thanks for submitting these patches that join some of my works,
> especially
> > about generating a cmake-toolchain file. You beat me to the punch ;)
> > Details:
> >>
> >> +# CMake doesn't support having the --sysroot option directly in the
> >>
> >> +# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
> >>
> >> +CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
> >>
> >> +CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
> >>
> >> +CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC))
> $(TARGET_CFLAGS)
> >>
> >> +CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX))
> >> $(TARGET_CXXFLAGS)
> >
> > I think it is not necessary to add the --sysroot option to any of these
> > flags if we correctly define the CMake toolchain file (cf. patch review
> > of [PATCH 3/4])
>
> I guess you're right.
>
> >> +# Configure package for target
> >>
> >> +define $(2)_CONFIGURE_CMDS
> >>
> >> +       (cd $$($$(PKG)_SRCDIR) && \
> >
> > You configure and build in the source tree, why not.. but CMake
> > supports (i'd like to say: it's designed to) build out of source tree
> (and
> > it messes up a bite the build tree...).
>
> I agree, it's a bit messy. But where to but the build tree? Inside the
> srctree or in a directory at the same level? I guess I would prefer the
> latter, something like
>
> srctree:
>  output/build/cdrkit-1.1.10
>
> buildtree:
>  output/build/cdrkit-1.1.10.build
>
> But as the autotools infrastructure does (AFAIK) buildtree == srctree, I
> just did the same.
>
> >>
> >> +       rm -f CMakeCache.txt && \
> >>
> >> +       $$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake
> $$($$(PKG)_SRCDIR)
> >> \
> >>
> >> +               -Wno-dev \
> >>
> >> +               -DCMAKE_SYSTEM_NAME:STRING="Linux" \
> >>
> >> +               -DCMAKE_C_COMPILER:FILEPATH="$$(CMAKE_TARGET_CC)" \
> >>
> >> +               -DCMAKE_CXX_COMPILER:FILEPATH="$$(CMAKE_TARGET_CXX)" \
> >>
> >> +               -DCMAKE_C_FLAGS:STRING="$$(CMAKE_TARGET_CFLAGS)" \
> >>
> >> +               -DCMAKE_CXX_FLAGS:STRING="$$(CMAKE_TARGET_CXXFLAGS)" \
> >>
> >> +               -DCMAKE_EXE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
> >>
> >> +               -DCMAKE_MODULE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)"
> \
> >>
> >> +               -DCMAKE_SHARED_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)"
> \
> >>
> >> +               -DCMAKE_FIND_ROOT_PATH:PATH="$$(STAGING_DIR)" \
> >>
> >> +               -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM:STRING="NEVER" \
> >>
> >> +               -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY:STRING="ONLY" \
> >>
> >> +               -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE:STRING="ONLY" \
> >
> > Why don't you use the -DCMAKE_TOOLCHAIN_FILE <cmake-toolchain-file> here
> > instead of all these -D... ?
>
> Good question :-)
>
> 1) It's because the toolchain-file patch was written after this :-)
>
> 2) The -D... flags come from cdrkit.mk, which I used as "template" for
> CMAKETARGETS. Some of the flags I'm not sure if are right (or is needed)
> for a toolchain-file:
>
> CMAKE_{C,CXX}_FLAGS, CMAKE_{EXE,MODULE,SHARED}_LINKER_FLAGS
>
> Neither of these are listed in CMake Cross-compiling page[1].
>
> So, I took the easy way out: build CMake packages inside Buildroot using
> cdrkit.mk settings (should cause minimal breakage) and add a minimal
> toolchain-file for out-of-Buildroot packages which just have the bare
> minimum of settings.
>
> I will take another look at the above CMake variables during a build, and
> try to come up with a minimal toolchain-file that can work well internally
> and externally.
>
> However, isn't there a little conflict between internal and external use?
> For internal use I'd like Buildroot to force build configurations on all
> packages, like Debug/Release. but for external packages I'd like to control
> this in the package itself. Maybe we should use the same toolchain-file
> internally and externally, but give CMake CFLAGS/CXXFLAGS on the
> commandline when building internal packages?
>
> [1] the http://www.vtk.org/Wiki/CMake_Cross_Compiling
>
> Best regards,
> Bj?rn Forsman
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101222/ea44e062/attachment-0001.html>
