From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 20 Oct 2017 16:08:54 -0400
Subject: [Buildroot] [WIP 0/2] gobject-introspection
Message-ID: <20171020200856.19406-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Preface:

For the several days straight I have taken it upon myself to try to get
gobject-introspection integrated with BuildRoot. This is no light undertaking.

Through multiple discussions with Yann, Thomas, and Arnout, staring at
the bitbake recipe, I have managed to cobble together what I believe a fairly
decent starting point.

However; I am at the point where I need help to cross the finish line and
to put this beast to bed, and that's where I am going to rely on the rest
of the maintainers to help me.

Thomas, Arnout, Yanni, and anybody else who dare look upon the horrors of
gobject-introspection, I caution you, this is for people with a strong iron
will and a hearty constitution.

Why do you ask?  What could possibly be so bad about this library?
A multitude of things. However; let me just paste a quote from a developer:

"Basically, we produce a binary that contains an array of ints with 
constant expression initialisers (sizeof, struct offsets, etc).
We put magic values on either side of that array and then we scan
the resulting compiler output for those magic values in order to
discover the values of the expressions we put in."

To top it all off:  This program requires host-qemu to run. There isn't
a good way for us to bypass it either. This means that several wrappers
are needed that call host-qemu-$(arch) and then the real program that
reads the binary and produces a .gir and a .typelib file.


If it's so bad, why does BuildRoot need it?
Good question! Because several prominent programs and libraries depend
on gobject-introspection to compile. This also means that buildroot is
stuck a very very old version of python-gobject (2.28.6) because anything
newer requires this library to build.

This also means that a very prominent and juicy library that is sorely
lacking from BuildRoot is missing. gst1-python. This would be a very
very nice library to have.


WHAT WORKS:

Currently, this patch series does the following:
- builds the latest host-gobject-introspection.
- Installs the wrapper programs.
- builds the latest target gobject-introspection
- After the target system is built, removes all the .gir files from
  the target directory.
  (.gir files are for development, typelib is for runtime.)


WHAT DOESNT WORK:

This is where I am hung up and need help!

Anybody wanting to help, I urge you to do the following:
- Apply the patch series
- Build gobject-introspection
- build gstreamer

Gstreamer will now fail to build!
Why? Gstreamer looks for an introspection library during the configure
stage, and if it finds it, attempts to use it.
Because some library paths not being making it to the introspection
compiler, it will now fail to build with linking errors! Oh no!

In Yocto, you can call out:
export GIR_EXTRA_LIBS_PATH="path" 
(see meta/recipes-multimedia/gstreamer/gstreamer1.0.inc for an example)
in the recipe file, which will be then get passed to g-ir-scanner-qemuwrapper,
which will then set the environment variable LD_LIBRARY_PATH to the value of
GIR_EXTRA_LIBS_PATH, whcih will then call g-ir-scanner, which will then
call the functions in the script entitled "ccompiler.py" in the host directory.
which will then resolve the library paths properly based off of the
LD_LIBRARY_PATH variable. It's a very easy and clean solution to the problem.

However, this isn't possible with BuildRoot because a script called from
a GNU Makefile can't change the parent environment, and so the build
will fail miserably.

(Granted we could just disable introspection for gstreamer, but then it
be possible to later add gst1-python)

I hope there is a clean solution to this problem that will make it easier
to add the library paths to programs in the future that isn't more patches.

I really would appreciate a good discussion on this, as what you see here
is around 40 hours of work in 3.5 days.

Thanks for the help!

Adam

Adam Duskett (2):
  qemu: add BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
  gobject-introspection: new package

 DEVELOPERS                                         |   1 +
 Makefile                                           |   1 +
 package/Config.in                                  |   1 +
 ...ncomplete-upstream-attempt-at-cross-compi.patch |  50 +++
 ...c-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 203 ++++++++++++
 ...3-giscanner-add-use-binary-wrapper-option.patch |  52 +++
 ...04-giscanner-add-a-use-ldd-wrapper-option.patch |  48 +++
 ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  97 ++++++
 .../0006-add-PYTHON_INCLUDES-override.patch        |  39 +++
 package/gobject-introspection/Config.in            |  29 ++
 package/gobject-introspection/cross-ldd            | 362 +++++++++++++++++++++
 .../gobject-introspection/g-ir-compiler-wrapper.in |   2 +
 .../g-ir-scanner-lddwrapper.in                     |   2 +
 .../g-ir-scanner-qemuwrapper.in                    |  10 +
 .../gobject-introspection/g-ir-scanner-wrapper.in  |   3 +
 .../gobject-introspection.hash                     |   4 +
 .../gobject-introspection/gobject-introspection.mk |  83 +++++
 package/qemu/Config.in.host                        |  13 +-
 18 files changed, 996 insertions(+), 4 deletions(-)
 create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 create mode 100644 package/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
 create mode 100644 package/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
 create mode 100644 package/gobject-introspection/0006-add-PYTHON_INCLUDES-override.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100755 package/gobject-introspection/cross-ldd
 create mode 100644 package/gobject-introspection/g-ir-compiler-wrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-wrapper.in
 create mode 100644 package/gobject-introspection/gobject-introspection.hash
 create mode 100644 package/gobject-introspection/gobject-introspection.mk

-- 
2.13.6
