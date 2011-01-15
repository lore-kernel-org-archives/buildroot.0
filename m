From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 15 Jan 2011 21:53:24 +0100
Subject: [Buildroot] [PATCH v2 0/4] Introducing CMAKETARGETS infrastructure
Message-ID: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a new infrastructure for CMake packages called
CMAKETARGETS. It is based on the AUTOTARGETS infrastructure.

Changes in v2:

 * The toolchain-file is now also used by Buildroot for internal packages.
   This means less code duplication.

 * Add CMAKE_C/CXX_FLAGS, CMAKE_PROGRAM_PATH and CMAKE_INSTALL_SO_NO_EXE
   to the toolchain-file.

 * Remove CMAKE_{EXE,SHARED,MODULE}_LINKER_FLAGS from the
   infrastructure. CMake packages should use FIND_LIBRARY() or
   FIND_PACKAGE() and not rely on -L flags. If a package fails to build
   without -L, fix the package. Or add needed -L flags on a per package basis.

 * Move CMAKE_TARGET_{CC,CXX,CFLAGS,CXXFLAGS} variable initialization from
   package/Makefile.cmake.in (CMAKETARGETS_INNER macro) to package/Makefile.in.

 * Add a $(2)_BUILDDIR variable so that we can split build dir and
   source dir. $(2)_BUILD_DIR currently points to $(2)_SRCDIR to behave like
   the autotools infrastructure.

 * Remove -Wno-dev from configure options so that build system warnings
   are displayed. (Warnings should get fixed, so don't hide them.)

NOTE: The doc is (still) more or less a copy of of the autotools stuff. I don't
know how many build infrastructures Buildroot can have before the doc is
better off being refactored a bit so that the each build system is more about
what's different instead of repeating a bunch of stuff.

NOTE: There is no mention of the toolchain-file and how it can be used for
building packages outside of Buildroot in the doc. As the documentation
currently focuses on *integrating* packages in Buildroot, I didn't find a
suitable place for it. Is this ok for now?

NOTE: ccache needs testing

Thanks to Samuel Martin and Thomas Petazzoni for the comments on v1.

Comments also welcome on v2 :-)

 Makefile                  |   16 ++++-
 docs/buildroot.html       |  151 +++++++++++++++++++++++++++++++++-
 package/Makefile.cmake.in |  197 +++++++++++++++++++++++++++++++++++++++++++++
 package/Makefile.in       |    8 ++
 package/cdrkit/cdrkit.mk  |   65 ++-------------
 5 files changed, 376 insertions(+), 61 deletions(-)
