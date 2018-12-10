From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 10 Dec 2018 11:53:03 -0500
Subject: [Buildroot] [PATCH v8 4/5] gobject-introspection: new package
In-Reply-To: <CAMWSM7iREzCgopFqYUqycQw01vy8PKTa_bzHPZo0dB9h0qX8TQ@mail.gmail.com>
References: <20180729191921.11216-1-aduskett@gmail.com>
 <20180729191921.11216-5-aduskett@gmail.com>
 <CAMWSM7iREzCgopFqYUqycQw01vy8PKTa_bzHPZo0dB9h0qX8TQ@mail.gmail.com>
Message-ID: <CAFSsvmo2-LHR_d2xwOPFZyenbw2_dYSgNHHmAmzXVOYsUSP+eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

Sorry about the late reply!

It looks like for x86 specifically, a -cpu option has to be appended
to the g-ir-scanner-qemuwrapper file.
That should clean up the errors. I will submit a patch hopefully in
the next few days that will address the issue.

Thanks!

Adam
On Wed, Dec 5, 2018 at 5:26 PM Joseph Kogut <joseph.kogut@gmail.com> wrote:
>
> Hi Adam,
>
> I'm getting a build error on a Threadripper 1950X system. Qemu
> segfaults with an illegal instruction when running one of the
> wrappers.
>
>   CCLD     g-ir-generate
>   CCLD     glib-print
>   CCLD     g-ir-compiler
>   CCLD     g-ir-inspect
>   GICOMP   gir/DBus-1.0.gir
>   GICOMP   gir/fontconfig-2.0.gir
>   GICOMP   gir/freetype2-2.0.gir
>   GICOMP   gir/GL-1.0.gir
>   GISCAN   GLib-2.0.gir
>   GICOMP   gir/xft-2.0.gir
>   GICOMP   gir/libxml2-2.0.gir
>   GICOMP   gir/xfixes-4.0.gir
>   GICOMP   gir/xlib-2.0.gir
>   GICOMP   gir/xrandr-1.3.gir
>   GICOMP   gir/win32-1.0.gir
>   GICOMP   gir/cairo-1.0.gir
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> /home/joseph/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/bin/g-ir-scanner-qemuwrapper:
> line 5: 33269 Illegal instruction     (core dumped) PSEUDO_UNLOAD=1
> /home/joseph/mercury-firmware/buildroot/output/host/bin/qemu-x86_64 -r
> 4.18 -L $STAGING_DIR -E
> LD_LIBRARY_PATH=$GIR_EXTRA_LIBS_PATH:.libs:$STAGING_DIR/usr/lib:$STAGING_DIR/lib
> "$@"
> If the above error message is about missing .so libraries, then
> setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
> (typically like this: GIR_EXTRA_LIBS_PATH="$(@D)/.libs")
> make[4]: *** [Makefile:3818: gir/xlib-2.0.typelib] Error 1
> make[4]: *** Waiting for unfinished jobs....
>
>
> On Sun, Jul 29, 2018 at 12:19 PM Adam Duskett <aduskett@gmail.com> wrote:
> >
> >
> > GObject introspection is a middleware layer between C
> > libraries (using GObject) and language bindings. The C library
> > can be scanned at compile time and generate a metadata file,
> > in addition to the actual native C library. Then at runtime,
> > language bindings can read this metadata and automatically
> > provide bindings to call into the C library.
> >
> > There's an XML format called GIR used by GObject-Introspection.
> > The purpose of it is to provide a standard structure to access the
> > complete available API that a library or other unit of code exports.
> > It is meant to be language agnostic using namespaces to separate
> > core, language or library specific functionality.
> >
> > Cross-compiling gobject-introspection is not an easy task. The main
> > issue is that in the process of creating the XML files,
> > gobject-introspection must first run and scan the binary, which, if the
> > binary is cross-compiled, would not typically be possible from the host
> > system.
> >
> > Because of this limitation, several wrappers are used to call instead
> > first out qemu which will then run the native scanner to create the
> > binaries.
> >
> > There are seven total patches and four different wrapper files needed
> > to successfully cross-compile and run this package, many of them are
> > from open-embedded, but two of them are of my own doing.
> >
> > 1) Revert a previous, incomplete attempt at adding cross-compiling
> >     support.
> >
> > 2) Add support for the various wrappers. (See patch for details.)
> >
> > 3) Add an option to use a binary wrapper; this patch will force
> >    giscanner to use a wrapper executable to run binaries it's producing,
> >    instead of attempting to run them from the host.
> >
> > 4) Add an option to use an LDD wrapper, again, useful for
> >     cross-compiled environments.
> >
> > 5) Overwrite python includes during the initial configure stage.
> >
> > 6) Add a --lib-dirs-envar option to pass to giscanner.
> >    (See patch for details.)
> >
> > 7) Add rpath-links to ccompiler: when passing the
> >     PACKAGE_GIR_EXTRA_LIBS_PATH to the ccompiler.py script,
> >     ccompiler.py needs to add -Wl,-rpath-link to the environment for the
> >     package to correctly link against the passed on paths.
> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - Fixed wrappers
> >   - Added 0007-giscanner-add-a-lib-dirs-envvar-option.patch
> >   - Added 0008-add-Float128.patch
> >
> > Changes v2 -> v3:
> >   - Removed Linux kernel dependency (baruch)
> >   - Changed $(LINUX_VERSION) to $(BR2_TOOLCHAIN_HEADERS_AT_LEAST) (baruch)
> >   - Changed @LINUX_VERSION@ in g-ir-scanner-qemuwrapper.in to
> >     @TOOLCHAIN_HEADERS_VERSION@ to match the above variable change.
> >   - Added BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS_TARGET in Config.in
> >     with only BR2_arm selected for now.
> >   - Removed BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS in favor of the above change.
> >   - Added two new lines in the base Makefile which removes any remaining .gir
> >     or .rnc files from the target filing system, as these are not needed for
> >     runtime, only compile time.
> >
> > Changes v3 -> v4:
> >   - Removed RFC tag.
> >   - Added 0007-Add-rpath-links-to-ccompiler.patch
> >   - Removed config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch as it is not
> >     Yocto specific.
> >   - Added the _GIR_EXTRA_LIBS_PATH to pkg-autotools.mk. This allows package
> >     specific Gir libraries to be passed on to g-ir-scanner-qemuwrapper.
> >   - Fixed a typo in g-ir-scanner-qemuwrapper.in.
> >   - Remove BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS_TARGET in favor of
> >     BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> >
> > Changes v4 -> v5:
> >   - Added a more detailed commit message (Yann)
> >   - Removed  $HOST_DIR/bin/qemu- at HOST_QEMU_ARCH@ @HOST_QEMU_CPU_TUNE@
> >     in favor of @QEMU_USER@ (Thanks Yann)
> >
> > Changes v5 -> v6:
> >   - Update gobject-introspection to 1.56.1
> >   - Remove upstreamed 0008-add-Float128.patch
> >
> > Changes v6 -> v7:
> >   - Remove the cross-ldd script in favor of the prelink-cross package.
> >   - Install the ldd and qemu wrappers in a post patch hook seperate of
> >     the other wrappers.
> >   - Set --enable-introspection-data in the configure options.
> >
> > Changes v7 -> v8:
> >   - Add "select BR2_PACKAGE_HOST_PRELINK_CROSS" to Config.in
> >
> >  DEVELOPERS                                    |   1 +
> >  Makefile                                      |   2 +
> >  package/Config.in                             |   1 +
> >  ...lete-upstream-attempt-at-cross-compi.patch |  50 +++++
> >  ...-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 203 ++++++++++++++++++
> >  ...canner-add-use-binary-wrapper-option.patch |  52 +++++
> >  ...scanner-add-a-use-ldd-wrapper-option.patch |  48 +++++
> >  .../0005-add-PYTHON_INCLUDES-override.patch   |  39 ++++
> >  ...scanner-add-a-lib-dirs-envvar-option.patch |  73 +++++++
> >  .../0007-Add-rpath-links-to-ccompiler.patch   |  29 +++
> >  package/gobject-introspection/Config.in       |  31 +++
> >  .../gobject-introspection/g-ir-compiler.in    |   2 +
> >  .../g-ir-scanner-lddwrapper.in                |   2 +
> >  .../g-ir-scanner-qemuwrapper.in               |  10 +
> >  package/gobject-introspection/g-ir-scanner.in |   3 +
> >  .../gobject-introspection.hash                |   4 +
> >  .../gobject-introspection.mk                  |  98 +++++++++
> >  package/pkg-autotools.mk                      |   3 +
> >  18 files changed, 651 insertions(+)
> >  create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
> >  create mode 100644 package/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
> >  create mode 100644 package/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
> >  create mode 100644 package/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
> >  create mode 100644 package/gobject-introspection/0005-add-PYTHON_INCLUDES-override.patch
> >  create mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
> >  create mode 100644 package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
> >  create mode 100644 package/gobject-introspection/Config.in
> >  create mode 100644 package/gobject-introspection/g-ir-compiler.in
> >  create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
> >  create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> >  create mode 100644 package/gobject-introspection/g-ir-scanner.in
> >  create mode 100644 package/gobject-introspection/gobject-introspection.hash
> >  create mode 100644 package/gobject-introspection/gobject-introspection.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 014b245b3d..d2d61a23c3 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -34,6 +34,7 @@ F:    package/audit/
> >  F:     package/busybox/
> >  F:     package/checkpolicy/
> >  F:     package/cppdb/
> > +F:     package/gobject-introspection/
> >  F:     package/gstreamer1/gstreamer1/
> >  F:     package/gstreamer1/gstreamer1-mm/
> >  F:     package/gstreamer1/gst1-plugins-bad/
> > diff --git a/Makefile b/Makefile
> > index 37c7072c7c..b1d4aa60d1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -699,6 +699,8 @@ target-finalize: $(PACKAGES)
> >                 $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
> >                 $(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
> >         find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
> > +       find $(TARGET_DIR)/usr/share/ -name '*.gir' -print0 | xargs -0 rm -f
> > +       find $(TARGET_DIR)/usr/share/ -name '*.rnc' -print0 | xargs -0 rm -f
> >         find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
> >                 \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
> >  ifneq ($(BR2_PACKAGE_GDB),y)
> > diff --git a/package/Config.in b/package/Config.in
> > index f5a17492c7..4e1961f345 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1536,6 +1536,7 @@ menu "Other"
> >         source "package/glibmm/Config.in"
> >         source "package/glm/Config.in"
> >         source "package/gmp/Config.in"
> > +       source "package/gobject-introspection/Config.in"
> >         source "package/gsl/Config.in"
> >         source "package/gtest/Config.in"
> >         source "package/jemalloc/Config.in"
> > diff --git a/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
> > new file mode 100644
> > index 0000000000..ecc7565b7a
> > --- /dev/null
> > +++ b/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
> > @@ -0,0 +1,50 @@
> > +From 3a9d1e5ee0aae56fafec0beba2014c19e4ff310c Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Wed, 23 Mar 2016 17:07:28 +0200
> > +Subject: [PATCH] Revert an incomplete upstream attempt at cross-compile support
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > +---
> > + common.mk                | 4 ----
> > + giscanner/gdumpparser.py | 6 ------
> > + 2 files changed, 10 deletions(-)
> > +
> > +diff --git a/common.mk b/common.mk
> > +index b778f7a..e26c637 100644
> > +--- a/common.mk
> > ++++ b/common.mk
> > +@@ -24,12 +24,8 @@ INTROSPECTION_SCANNER_ARGS = \
> > +     --add-include-path=$(top_builddir) \
> > +     --add-include-path=$(top_builddir)/gir
> > +
> > +-# GI_CROSS_LAUNCHER is the command to use for executing g-ir-compiler.
> > +-# Normally will be undefined but can be set (e.g. to wine or qemu)
> > +-# when cross-compiling
> > + INTROSPECTION_COMPILER = \
> > +     env PATH=".libs:$(PATH)" \
> > +-        $(GI_CROSS_LAUNCHER) \
> > +         $(top_builddir)/g-ir-compiler$(EXEEXT)
> > +
> > + INTROSPECTION_COMPILER_ARGS = \
> > +diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
> > +index 1134f33..9bdc2bc 100644
> > +--- a/giscanner/gdumpparser.py
> > ++++ b/giscanner/gdumpparser.py
> > +@@ -162,12 +162,6 @@ blob containing data gleaned from GObject's primitive introspection."""
> > +         out_path = os.path.join(self._binary.tmpdir, 'dump.xml')
> > +
> > +         args = []
> > +-
> > +-        # Prepend the launcher command and arguments, if defined
> > +-        launcher = os.environ.get('GI_CROSS_LAUNCHER')
> > +-        if launcher:
> > +-            args.extend(launcher.split())
> > +-
> > +         args.extend(self._binary.args)
> > +         args.append('--introspect-dump=%s,%s' % (in_path, out_path))
> > +
> > +--
> > +2.7.0
> > +
> > diff --git a/package/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch b/package/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
> > new file mode 100644
> > index 0000000000..80837abc44
> > --- /dev/null
> > +++ b/package/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
> > @@ -0,0 +1,203 @@
> > +From b1503fe2693d602b3e24e4b832dc0934960d5d22 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Mon, 19 Oct 2015 18:29:21 +0300
> > +Subject: [PATCH] configure.ac: add host-gi, gi-cross-wrapper, gi-ldd-wrapper and introspection-data options
> > +
> > +With the first option, gobject-introspection tools (g-ir-doc-tool and g-ir-scanner)
> > +that are already installed in the host system will be used for building the source tree.
> > +
> > +With the second option, g-ir-scanner will be instructed to use an executable
> > +wrapper to run binaries it's producing, and g-ir-compiler will be run
> > +through the same wrapper (host system's g-ir-compiler cannot be used because
> > +it's producing architecture-specific output).
> > +
> > +With the third option, giscanner will be instructed to use a special ldd
> > +command instead of system's ldd (which does not work when the binary to inspect
> > +is compiled for a different architecture).
> > +
> > +With the fourth option, it is possible to disable building of introspection data
> > +(.gir and .typelib files), which may be difficult or impossible in cross-compilation
> > +environments, because of lack of emulation (or native hardware) for the target architecture
> > +on which the target binaries can be run.
> > +
> > +These options are useful when cross-compiling for a different target architecture.
> > +
> > +Upstream-Status: Pending [review on oe-core list]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > +---
> > + Makefile.am       |  2 ++
> > + common.mk         | 39 +++++++++++++++++++++++++++++++++++++++
> > + configure.ac      | 42 ++++++++++++++++++++++++++++++++++++++++++
> > + tests/Makefile.am |  5 ++++-
> > + 4 files changed, 87 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index b080a89..ce8d29b 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -21,7 +21,9 @@ include Makefile-cmph.am
> > + include Makefile-girepository.am
> > + include Makefile-giscanner.am
> > + include Makefile-examples.am
> > ++if BUILD_INTROSPECTION_DATA
> > + include Makefile-gir.am
> > ++endif
> > + include Makefile-tools.am
> > + include Makefile-msvcproj.am
> > +
> > +diff --git a/common.mk b/common.mk
> > +index e26c637..9f3a65f 100644
> > +--- a/common.mk
> > ++++ b/common.mk
> > +@@ -6,6 +6,15 @@
> > + # module itself.
> > + #
> > +
> > ++if USE_HOST_GI
> > ++INTROSPECTION_SCANNER = \
> > ++    env PATH="$(PATH)" \
> > ++        LPATH=.libs \
> > ++        CC="$(CC)" \
> > ++        PYTHONPATH=$(top_builddir):$(top_srcdir) \
> > ++        UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
> > ++        g-ir-scanner
> > ++else
> > + INTROSPECTION_SCANNER = \
> > +     env PATH=".libs:$(PATH)" \
> > +         LPATH=.libs \
> > +@@ -14,9 +23,24 @@ INTROSPECTION_SCANNER = \
> > +         UNINSTALLED_INTROSPECTION_SRCDIR=$(top_srcdir) \
> > +         UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
> > +         $(top_builddir)/g-ir-scanner
> > ++endif
> > ++
> > ++if USE_CROSS_WRAPPER
> > ++CROSS_WRAPPER_ARG = --use-binary-wrapper=$(GI_CROSS_WRAPPER)
> > ++else
> > ++CROSS_WRAPPER_ARG =
> > ++endif
> > ++
> > ++if USE_LDD_WRAPPER
> > ++LDD_WRAPPER_ARG = --use-ldd-wrapper=$(GI_LDD_WRAPPER)
> > ++else
> > ++LDD_WRAPPER_ARG =
> > ++endif
> > +
> > + INTROSPECTION_SCANNER_ARGS = \
> > +     --verbose \
> > ++    $(CROSS_WRAPPER_ARG) \
> > ++    $(LDD_WRAPPER_ARG) \
> > +     -I$(top_srcdir) \
> > +     --add-include-path=$(srcdir) \
> > +     --add-include-path=$(top_srcdir)/gir \
> > +@@ -24,9 +48,15 @@ INTROSPECTION_SCANNER_ARGS = \
> > +     --add-include-path=$(top_builddir) \
> > +     --add-include-path=$(top_builddir)/gir
> > +
> > ++if USE_CROSS_WRAPPER
> > ++INTROSPECTION_COMPILER = \
> > ++    env PATH=".libs:$(PATH)" \
> > ++        $(GI_CROSS_WRAPPER) $(top_builddir)/g-ir-compiler$(EXEEXT)
> > ++else
> > + INTROSPECTION_COMPILER = \
> > +     env PATH=".libs:$(PATH)" \
> > +         $(top_builddir)/g-ir-compiler$(EXEEXT)
> > ++endif
> > +
> > + INTROSPECTION_COMPILER_ARGS = \
> > +     --includedir=$(srcdir) \
> > +@@ -35,6 +65,14 @@ INTROSPECTION_COMPILER_ARGS = \
> > +     --includedir=$(top_builddir) \
> > +     --includedir=$(top_builddir)/gir
> > +
> > ++if USE_HOST_GI
> > ++INTROSPECTION_DOCTOOL = \
> > ++    env PATH="$(PATH)" \
> > ++        LPATH=.libs \
> > ++        PYTHONPATH=$(top_builddir):$(top_srcdir) \
> > ++        UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
> > ++        g-ir-doc-tool
> > ++else
> > + INTROSPECTION_DOCTOOL = \
> > +     env PATH=".libs:$(PATH)" \
> > +         LPATH=.libs \
> > +@@ -42,6 +80,7 @@ INTROSPECTION_DOCTOOL = \
> > +         UNINSTALLED_INTROSPECTION_SRCDIR=$(top_srcdir) \
> > +         UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
> > +         $(top_builddir)/g-ir-doc-tool
> > ++endif
> > +
> > + INTROSPECTION_DOCTOOL_ARGS = \
> > +     --add-include-path=$(srcdir) \
> > +diff --git a/configure.ac b/configure.ac
> > +index 6c91fa5..21340a5 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -367,6 +367,48 @@ dnl
> > + AM_CONDITIONAL(MSVC_BASE_NO_TOOLSET_SET, [test x$MSVC_BASE_TOOLSET = x])
> > + AM_CONDITIONAL(MSVC_NO_TOOLSET_SET, [test x$MSVC_TOOLSET = x])
> > +
> > ++AC_ARG_ENABLE([host-gi],
> > ++[AS_HELP_STRING([--enable-host-gi],[Use gobject introspection tools installed in the host system (useful when cross-compiling)])],
> > ++[case "${enableval}" in
> > ++  yes) host_gi=true ;;
> > ++  no)  host_gi=false ;;
> > ++  *) AC_MSG_ERROR([bad value ${enableval} for --enable-host-gi]) ;;
> > ++esac],[host_gi=false])
> > ++AM_CONDITIONAL([USE_HOST_GI], [test x$host_gi = xtrue])
> > ++
> > ++AC_ARG_ENABLE([gi-cross-wrapper],
> > ++[AS_HELP_STRING([--enable-gi-cross-wrapper=path],[Use a wrapper to run gicompiler and binaries produced by giscanner (useful when cross-compiling)])],
> > ++[
> > ++GI_CROSS_WRAPPER="${enableval}"
> > ++use_wrapper=true
> > ++],[
> > ++GI_CROSS_WRAPPER=""
> > ++use_wrapper=false
> > ++])
> > ++AC_SUBST(GI_CROSS_WRAPPER)
> > ++AM_CONDITIONAL([USE_CROSS_WRAPPER], [test x$use_wrapper = xtrue])
> > ++
> > ++AC_ARG_ENABLE([gi-ldd-wrapper],
> > ++[AS_HELP_STRING([--enable-gi-ldd-wrapper=path],[Use a ldd wrapper instead of system's ldd command in giscanner (useful when cross-compiling)])],
> > ++[
> > ++GI_LDD_WRAPPER="${enableval}"
> > ++use_ldd_wrapper=true
> > ++],[
> > ++GI_LDD_WRAPPER=""
> > ++use_ldd_wrapper=false
> > ++])
> > ++AC_SUBST(GI_LDD_WRAPPER)
> > ++AM_CONDITIONAL([USE_LDD_WRAPPER], [test x$use_ldd_wrapper = xtrue])
> > ++
> > ++AC_ARG_ENABLE([introspection-data],
> > ++[AS_HELP_STRING([--enable-introspection-data],[Build introspection data (.gir and .typelib files) in addition to library and tools])],
> > ++[case "${enableval}" in
> > ++  yes) introspection_data=true ;;
> > ++  no)  introspection_data=false ;;
> > ++  *) AC_MSG_ERROR([bad value ${enableval} for --enable-introspection-data]) ;;
> > ++esac],[introspection_data=true])
> > ++AM_CONDITIONAL([BUILD_INTROSPECTION_DATA], [test x$introspection_data = xtrue])
> > ++
> > + AC_CONFIG_FILES([
> > + Makefile
> > + tests/Makefile
> > +diff --git a/tests/Makefile.am b/tests/Makefile.am
> > +index bdd0fa7..75dd3c9 100644
> > +--- a/tests/Makefile.am
> > ++++ b/tests/Makefile.am
> > +@@ -1,6 +1,9 @@
> > + include $(top_srcdir)/common.mk
> > +
> > +-SUBDIRS = . scanner repository offsets warn
> > ++SUBDIRS = . scanner repository warn
> > ++if BUILD_INTROSPECTION_DATA
> > ++SUBDIRS += offsets
> > ++endif
> > +
> > + EXTRA_DIST=
> > + BUILT_SOURCES=
> > +--
> > +2.7.0
> > +
> > diff --git a/package/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch b/package/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
> > new file mode 100644
> > index 0000000000..0a8e6c032f
> > --- /dev/null
> > +++ b/package/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
> > @@ -0,0 +1,52 @@
> > +From 704b888d0abfb01067352c40156f49f655691c7c Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Mon, 19 Oct 2015 18:26:40 +0300
> > +Subject: [PATCH] giscanner: add --use-binary-wrapper option
> > +
> > +With this option, giscanner will use a wrapper executable to run
> > +binaries it's producing, instead of running them directly. This
> > +is useful when binaries are cross-compiled and cannot be run directly,
> > +but they can be run using for example QEMU emulation.
> > +
> > +Upstream-Status: Pending [review on oe-core list]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > +---
> > + giscanner/scannermain.py | 14 ++++++++++++++
> > + 1 file changed, 14 insertions(+)
> > +
> > +diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
> > +index 633496f..d684cd0 100755
> > +--- a/giscanner/scannermain.py
> > ++++ b/giscanner/scannermain.py
> > +@@ -124,6 +124,9 @@ def _get_option_parser():
> > +     parser.add_option("", "--program",
> > +                       action="store", dest="program", default=None,
> > +                       help="program to execute")
> > ++    parser.add_option("", "--use-binary-wrapper",
> > ++                      action="store", dest="wrapper", default=None,
> > ++                      help="wrapper to use for running programs (useful when cross-compiling)")
> > +     parser.add_option("", "--program-arg",
> > +                       action="append", dest="program_args", default=[],
> > +                       help="extra arguments to program")
> > +@@ -422,6 +425,17 @@ def create_binary(transformer, options, args):
> > +                                               gdump_parser.get_error_quark_functions())
> > +
> > +     shlibs = resolve_shlibs(options, binary, options.libraries)
> > ++    if options.wrapper:
> > ++        # The wrapper needs the binary itself, not the libtool wrapper script,
> > ++        # so we check if libtool has sneaked the binary into .libs subdirectory
> > ++        # and adjust the path accordingly
> > ++        import os.path
> > ++        dir_name, binary_name  = os.path.split(binary.args[0])
> > ++        libtool_binary = os.path.join(dir_name, '.libs', binary_name)
> > ++        if os.path.exists(libtool_binary):
> > ++            binary.args[0] = libtool_binary
> > ++      # Then prepend the wrapper to the command line to execute
> > ++        binary.args = [options.wrapper] + binary.args
> > +     gdump_parser.set_introspection_binary(binary)
> > +     gdump_parser.parse()
> > +     return shlibs
> > +--
> > +2.7.0
> > +
> > diff --git a/package/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch b/package/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
> > new file mode 100644
> > index 0000000000..97880ef51d
> > --- /dev/null
> > +++ b/package/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
> > @@ -0,0 +1,48 @@
> > +From d4ad57fd4a32c4f0d2f0522a3090ef940746431b Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Fri, 30 Oct 2015 16:28:46 +0200
> > +Subject: [PATCH] giscanner: add a --use-ldd-wrapper option
> > +
> > +This is useful in cross-compile environments where system's ldd
> > +command does not work on binaries built for a different architecture
> > +
> > +Upstream-Status: Pending [review in oe-core]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > +---
> > + giscanner/scannermain.py | 3 +++
> > + giscanner/shlibs.py      | 4 +++-
> > + 2 files changed, 6 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
> > +index d684cd0..1b3b369 100755
> > +--- a/giscanner/scannermain.py
> > ++++ b/giscanner/scannermain.py
> > +@@ -127,6 +127,9 @@ def _get_option_parser():
> > +     parser.add_option("", "--use-binary-wrapper",
> > +                       action="store", dest="wrapper", default=None,
> > +                       help="wrapper to use for running programs (useful when cross-compiling)")
> > ++    parser.add_option("", "--use-ldd-wrapper",
> > ++                      action="store", dest="ldd_wrapper", default=None,
> > ++                      help="wrapper to use instead of ldd (useful when cross-compiling)")
> > +     parser.add_option("", "--program-arg",
> > +                       action="append", dest="program_args", default=[],
> > +                       help="extra arguments to program")
> > +diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
> > +index c93d20c..c5b5942 100644
> > +--- a/giscanner/shlibs.py
> > ++++ b/giscanner/shlibs.py
> > +@@ -105,7 +105,9 @@ def _resolve_non_libtool(options, binary, libraries):
> > +             args.extend(libtool)
> > +             args.append('--mode=execute')
> > +         platform_system = platform.system()
> > +-        if platform_system == 'Darwin':
> > ++        if options.ldd_wrapper:
> > ++            args.extend([options.ldd_wrapper, binary.args[0]])
> > ++        elif platform_system == 'Darwin':
> > +             args.extend(['otool', '-L', binary.args[0]])
> > +         else:
> > +             args.extend(['ldd', binary.args[0]])
> > +--
> > +2.7.0
> > +
> > diff --git a/package/gobject-introspection/0005-add-PYTHON_INCLUDES-override.patch b/package/gobject-introspection/0005-add-PYTHON_INCLUDES-override.patch
> > new file mode 100644
> > index 0000000000..21bcd9db94
> > --- /dev/null
> > +++ b/package/gobject-introspection/0005-add-PYTHON_INCLUDES-override.patch
> > @@ -0,0 +1,39 @@
> > +From 08ee7e704d3ebbb783e26768074a5969d6843204 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <Adamduskett@outlook.com>
> > +Date: Wed, 18 Oct 2017 17:31:19 -0400
> > +Subject: [PATCH] add PYTHON_INCLUDES override
> > +
> > +As the configure script mixes up host/target python. Equivalent to the
> > +similar code in dbus-python.
> > +
> > +Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> > +---
> > + m4/python.m4 | 12 +++++++++++-
> > + 1 file changed, 11 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/m4/python.m4 b/m4/python.m4
> > +index ed5559d..9853263 100644
> > +--- a/m4/python.m4
> > ++++ b/m4/python.m4
> > +@@ -43,7 +43,17 @@ AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
> > + [AC_REQUIRE([AM_PATH_PYTHON])
> > + AC_MSG_CHECKING(for headers required to compile python extensions)
> > + dnl deduce PYTHON_INCLUDES
> > +-PYTHON_INCLUDES=`$PYTHON-config --includes`
> > ++if test "${PYTHON_INCLUDES+set}" = set; then
> > ++  AC_MSG_NOTICE([PYTHON_INCLUDES overridden to: $PYTHON_INCLUDES])
> > ++else
> > ++  if test -x "$PYTHON_CONFIG"; then
> > ++    PYTHON_INCLUDES=`$PYTHON_CONFIG --includes 2>/dev/null`
> > ++  else
> > ++    PYTHON_INCLUDES=`$PYTHON -c "import distutils.sysconfig, sys; sys.stdout.write(distutils.sysconfig.get_python_inc(True))"`
> > ++    PYTHON_INCLUDES="-I$PYTHON_INCLUDES"
> > ++  fi
> > ++fi
> > ++
> > + AC_SUBST(PYTHON_INCLUDES)
> > + dnl check if the headers exist:
> > + save_CPPFLAGS="$CPPFLAGS"
> > +--
> > +2.13.6
> > +
> > diff --git a/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch b/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
> > new file mode 100644
> > index 0000000000..053219188b
> > --- /dev/null
> > +++ b/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
> > @@ -0,0 +1,73 @@
> > +From 3a9b3d8179b7eb9d2cc93da31578945bc03a45c3 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Fri, 27 Apr 2018 12:56:15 -0400
> > +Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
> > +
> > +By default LD_LIBRARY_PATH is set to the list of target library paths;
> > +this breaks down in cross-compilation environment, as we need to run a
> > +native emulation wrapper rather than the target binary itself. This patch
> > +allows exporting those paths to a different environment variable
> > +which can be picked up and used by the wrapper.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> > +---
> > + giscanner/ccompiler.py   | 4 ++--
> > + giscanner/dumper.py      | 3 ++-
> > + giscanner/scannermain.py | 3 +++
> > + 3 files changed, 7 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
> > +index d10327c..6cf25d5 100644
> > +--- a/giscanner/ccompiler.py
> > ++++ b/giscanner/ccompiler.py
> > +@@ -109,7 +109,7 @@ class CCompiler(object):
> > +
> > +             self._cflags_no_deprecation_warnings = "-Wno-deprecated-declarations"
> > +
> > +-    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths):
> > ++    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths, lib_dirs_envvar):
> > +         # An "internal" link is where the library to be introspected
> > +         # is being built in the current directory.
> > +
> > +@@ -119,7 +119,7 @@ class CCompiler(object):
> > +         if os.name == 'nt':
> > +             runtime_path_envvar = ['LIB', 'PATH']
> > +         else:
> > +-            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH']
> > ++            runtime_path_envvar = ['LD_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
> > +             # Search the current directory first
> > +             # (This flag is not supported nor needed for Visual C++)
> > +             args.append('-L.')
> > +diff --git a/giscanner/dumper.py b/giscanner/dumper.py
> > +index 3c7220b..0abd565 100644
> > +--- a/giscanner/dumper.py
> > ++++ b/giscanner/dumper.py
> > +@@ -259,7 +259,8 @@ class DumpCompiler(object):
> > +                                                    libtool,
> > +                                                    self._options.libraries,
> > +                                                    self._options.extra_libraries,
> > +-                                                   self._options.library_paths)
> > ++                                                   self._options.library_paths,
> > ++                                                   self._options.lib_dirs_envvar)
> > +             args.extend(pkg_config_libs)
> > +
> > +         else:
> > +diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
> > +index d262785..51c9570 100755
> > +--- a/giscanner/scannermain.py
> > ++++ b/giscanner/scannermain.py
> > +@@ -130,6 +130,9 @@ def _get_option_parser():
> > +     parser.add_option("", "--use-ldd-wrapper",
> > +                       action="store", dest="ldd_wrapper", default=None,
> > +                       help="wrapper to use instead of ldd (useful when cross-compiling)")
> > ++    parser.add_option("", "--lib-dirs-envvar",
> > ++                      action="store", dest="lib_dirs_envvar", default=None,
> > ++                      help="environment variable to write a list of library directories to (for running the transient binary), instead of standard LD_LIBRARY_PATH")
> > +     parser.add_option("", "--program-arg",
> > +                       action="append", dest="program_args", default=[],
> > +                       help="extra arguments to program")
> > +--
> > +2.14.3
> > +
> > diff --git a/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
> > new file mode 100644
> > index 0000000000..02fcdbeb25
> > --- /dev/null
> > +++ b/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
> > @@ -0,0 +1,29 @@
> > +From 72a427bc50daee8f1ded0e9221e53dbbf2a80f08 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <aduskett@gmail.com>
> > +Date: Wed, 14 Mar 2018 12:07:10 -0400
> > +Subject: [PATCH] Add rpath links to ccompiler
> > +
> > +This patch allows gobject-introspection to process extra paths passed to the
> > +compiler via the GIR_EXTRA_LIBS_PATH variable.
> > +
> > +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > +---
> > + giscanner/ccompiler.py | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
> > +index a8bd5b1..51bb9bc 100644
> > +--- a/giscanner/ccompiler.py
> > ++++ b/giscanner/ccompiler.py
> > +@@ -163,6 +163,8 @@ class CCompiler(object):
> > +
> > +         for envvar in runtime_path_envvar:
> > +             if envvar in os.environ:
> > ++                for envvar_path in os.environ[envvar].split(':'):
> > ++                    args.append("-Wl,-rpath-link," + envvar_path)
> > +                 os.environ[envvar] = \
> > +                     os.pathsep.join(runtime_paths + [os.environ[envvar]])
> > +             else:
> > +--
> > +2.14.3
> > +
> > diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> > new file mode 100644
> > index 0000000000..1da3cfa000
> > --- /dev/null
> > +++ b/package/gobject-introspection/Config.in
> > @@ -0,0 +1,31 @@
> > +config BR2_PACKAGE_GOBJECT_INTROSPECTION
> > +       bool "gobject-introspection"
> > +       depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS # libffi, libglib2
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC
> > +       depends on BR2_USE_MMU # python3, libglib2
> > +       depends on BR2_USE_WCHAR # python3, libglib2 -> gettext
> > +       depends on !BR2_STATIC_LIBS
> > +       depends on !BR2_MIPS_NABI32
> > +       select BR2_PACKAGE_LIBFFI
> > +       select BR2_PACKAGE_ZLIB
> > +       select BR2_PACKAGE_LIBGLIB2
> > +       select BR2_PACKAGE_HOST_PRELINK_CROSS
> > +       select BR2_PACKAGE_HOST_QEMU
> > +       select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
> > +       select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
> > +       help
> > +         GObject introspection is a middleware layer between C
> > +         libraries (using GObject) and language bindings. The C library
> > +         can be scanned at compile time and generate a metadata file,
> > +         in addition to the actual native C library. Then at runtime,
> > +         language bindings can read this metadata and automatically
> > +         provide bindings to call into the C library.
> > +
> > +         https://wiki.gnome.org/action/show/Projects/GObjectIntrospection
> > +
> > +comment "gobject-introspection needs a glibc toolchain w/ wchar, threads, dynamic library"
> > +       depends on BR2_USE_MMU
> > +       depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS_TARGET
> > +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> > +               BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
> > diff --git a/package/gobject-introspection/g-ir-compiler.in b/package/gobject-introspection/g-ir-compiler.in
> > new file mode 100644
> > index 0000000000..b2f97ea870
> > --- /dev/null
> > +++ b/package/gobject-introspection/g-ir-compiler.in
> > @@ -0,0 +1,2 @@
> > +#!/bin/sh
> > +$STAGING_DIR/usr/bin/g-ir-scanner-qemuwrapper $STAGING_DIR/usr/bin/g-ir-compiler.real "$@"
> > diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> > new file mode 100644
> > index 0000000000..12b064e4ad
> > --- /dev/null
> > +++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> > @@ -0,0 +1,2 @@
> > +#!/bin/sh
> > +${HOST_DIR}/sbin/prelink-rtld --root=${STAGING_DIR} "$@"
> > diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> > new file mode 100644
> > index 0000000000..e793ce193f
> > --- /dev/null
> > +++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> > @@ -0,0 +1,10 @@
> > +#!/bin/sh
> > +# Use a modules directory which does not exist so we don't load random things
> > +# which may then get deleted (or their dependencies) and potentially segfault
> > +export GIO_MODULE_DIR=$STAGING_DIR/usr/lib/gio/modules-dummy
> > +PSEUDO_UNLOAD=1 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ -L $STAGING_DIR -E LD_LIBRARY_PATH=$GIR_EXTRA_LIBS_PATH:.libs:$STAGING_DIR/usr/lib:$STAGING_DIR/lib "$@"
>
> Adding the parameter "-cpu max" to the invocation of QEMU_USER
> in g-ir-scanner-qemuwrapper.in resolves the issue for me.
>
> > +if [[ $? -ne 0 ]]; then
> > +    echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help."
> > +    echo '(typically like this: GIR_EXTRA_LIBS_PATH="$(@D)/.libs")'
> > +    exit 1
> > +fi
> > diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
> > new file mode 100644
> > index 0000000000..71b1871cfd
> > --- /dev/null
> > +++ b/package/gobject-introspection/g-ir-scanner.in
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +export GI_SCANNER_DISABLE_CACHE=1
> > +$HOST_DIR/bin/g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=$STAGING_DIR/usr/bin/g-ir-scanner-qemuwrapper --use-ldd-wrapper=$STAGING_DIR/usr/bin/g-ir-scanner-lddwrapper --add-include-path=$STAGING_DIR/usr/share/gir-1.0 "$@"
> > diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
> > new file mode 100644
> > index 0000000000..6524da8909
> > --- /dev/null
> > +++ b/package/gobject-introspection/gobject-introspection.hash
> > @@ -0,0 +1,4 @@
> > +#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.56/gobject-introspection-1.56.1.sha256sum
> > +sha256 5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d9ea24b gobject-introspection-1.56.1.tar.xz
> > +sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING.LGPL
> > +sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING.GPL
> > diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> > new file mode 100644
> > index 0000000000..cff92fadbc
> > --- /dev/null
> > +++ b/package/gobject-introspection/gobject-introspection.mk
> > @@ -0,0 +1,98 @@
> > +################################################################################
> > +#
> > +# gobject-introspection
> > +#
> > +################################################################################
> > +
> > +GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.56
> > +GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
> > +GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
> > +GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
> > +GOBJECT_INTROSPECTION_DEPENDENCIES = libffi zlib libglib2 host-qemu host-gobject-introspection host-prelink-cross
> > +GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
> > +GOBJECT_INTROSPECTION_AUTORECONF = YES
> > +GOBJECT_INTROSPECTION_LICENSE = Dual LGPLv2+/GPLv2+
> > +GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL
> > +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = host-libglib2 host-flex host-bison
> > +
> > +GOBJECT_INTROSPECTION_CONF_OPTS = \
> > +       --enable-host-gi \
> > +       --disable-static \
> > +       --enable-gi-cross-wrapper=$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper \
> > +       --enable-gi-ldd-wrapper=$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper \
> > +       --enable-introspection-data
> > +
> > +ifeq ($(BR2_PACKAGE_CAIRO),y)
> > +GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
> > +endif
> > +ifeq ($(BR2_PACKAGE_LIBFFI),y)
> > +GOBJECT_INTROSPECTION_DEPENDENCIES += libffi
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_PYTHON),y)
> > +GOBJECT_INTROSPECTION_DEPENDENCIES += python
> > +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES += host-python
> > +GOBJECT_INTROSPECTION_PYTHON_PATH="$(STAGING_DIR)/usr/bin/python2"
> > +else
> > +GOBJECT_INTROSPECTION_DEPENDENCIES += python3
> > +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES += host-python3
> > +GOBJECT_INTROSPECTION_PYTHON_PATH="$(STAGING_DIR)/usr/bin/python3"
> > +endif
> > +
> > +# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
> > +HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
> > +       GI_SCANNER_DISABLE_CACHE=1 \
> > +       HOST_GOBJECT_INTROSPECTION_GIR_EXTRA_LIBS_PATH=$(@D)/.libs
> > +
> > +# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
> > +GOBJECT_INTROSPECTION_CONF_ENV = \
> > +       GI_SCANNER_DISABLE_CACHE=1 \
> > +       GOBJECT_INTROSPECTION_GIR_EXTRA_LIBS_PATH=$(@D)/.libs \
> > +       PYTHON_INCLUDES="`$(GOBJECT_INTROSPECTION_PYTHON_PATH)-config --includes`"
> > +
> > +# Make sure g-ir-tool-template uses the host python.
> > +define GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> > +       sed -i -e '1s,#!.*,#!$(HOST_DIR)/bin/python,' $(@D)/tools/g-ir-tool-template.in
> > +endef
> > +GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS = GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> > +HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS = GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
> > +
> > +GOBJECT_INTROSPECTION_WRAPPERS = \
> > +       g-ir-compiler \
> > +       g-ir-scanner
> > +
> > +# These wrappers allow gobject-introspection to build the internal introspection
> > +# libraries during the build process.
> > +define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
> > +       $(INSTALL) -D -m 755 package/gobject-introspection/g-ir-scanner-lddwrapper.in $(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
> > +       $(INSTALL) -D -m 755 package/gobject-introspection/g-ir-scanner-qemuwrapper.in $(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> > +       $(SED) "s|@QEMU_USER@|$(QEMU_USER)|g" $(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> > +       $(SED) "s|@TOOLCHAIN_HEADERS_VERSION@|$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)|g" $(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> > +endef
> > +GOBJECT_INTROSPECTION_POST_PATCH_HOOKS = GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
> > +
> > +# In order for gobject-introspection to work, qemu needs to run temporarily
> > +# to create binaries on the fly by g-ir-scanner. This involves creating
> > +# several wrapper scripts to accomplish the task:
> > +# g-ir-scanner-qemuwrapper, g-ir-compiler-wrapper,
> > +# g-ir-scanner-lddwrapper, g-ir-scanner-wrapper, g-ir-compiler-wrapper.
> > +define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> > +       # Move the real binaries to their names.real, then replace them with
> > +       # the wrappers.
> > +       $(foreach w,$(GOBJECT_INTROSPECTION_WRAPPERS),
> > +               mv $(STAGING_DIR)/usr/bin/$(w) $(STAGING_DIR)/usr/bin/$(w).real
> > +               $(INSTALL) -D -m 755 \
> > +               package/gobject-introspection/$(w).in $(STAGING_DIR)/usr/bin/$(w)
> > +       )
> > +       $(SED) "s at g_ir_scanner=.*@g_ir_scanner=$(STAGING_DIR)/usr/bin/g-ir-scanner at g" \
> > +       $(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
> > +
> > +       # The pkgconfig file needs to point towards the wrappers instead of the native
> > +       # binaries.
> > +       $(SED) "s at g_ir_compiler=.*@g_ir_compiler=$(STAGING_DIR)/usr/bin/g-ir-compiler at g" \
> > +       $(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
> > +endef
> > +GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS = GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> > +
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> > diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> > index 45de99356f..06021f95c1 100644
> > --- a/package/pkg-autotools.mk
> > +++ b/package/pkg-autotools.mk
> > @@ -162,6 +162,7 @@ endif
> >
> >  $(2)_CONF_ENV                  ?=
> >  $(2)_CONF_OPTS                 ?=
> > +$(2)_GIR_EXTRA_LIBS_PATH       ?=
> >  $(2)_MAKE_ENV                  ?=
> >  $(2)_MAKE_OPTS                 ?=
> >  $(2)_INSTALL_OPTS                ?= install
> > @@ -239,6 +240,8 @@ endef
> >  endif
> >  endif
> >
> > +export GIR_EXTRA_LIBS_PATH=$$($$(PKG)_GIR_EXTRA_LIBS_PATH)
> > +
> >  $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
> >
> >  ifeq ($$($(2)_AUTORECONF),YES)
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
> Regards,
> Joseph
