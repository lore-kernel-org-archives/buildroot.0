From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 20:54:22 +0200
Subject: [Buildroot] [RFCv2] Per-package out-of-tree build
Message-ID: <20130413205422.7eb87375@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here comes the second version of the per-package out of tree
prototype. The first version was posted as RFCv1 on January, 21st
2013. I am not posting the patches, because the series contains 43
patches and this is only a RFC.

The patches should be considered as a prototype, I haven't tested all
packages (of course), and there are quite certainly some corner case
issues that haven't been solved. However, I think it's a good time to
get more testing in order to find, and solve those issues.

It should also not be considered yet that we want this feature in
Buildroot. It is again only a prototype, which aims at solving the
remaining problems, and see if we think it is a good idea to have this
in Buildroot or not.

For those who want to test, the 'out-of-tree-v2' branch is available at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git

Here is a quick summary of what this patch set does:

 * The tarballs are now extracted in $(O)/src/<pkg>-<version>

 * Each tarball is extracted and patched only once, even if there is
   both a target build and a host build. Once a package has been
   extracted and patched, its source code is changed to not have write
   permissions, in order to catch misbehaving packages in terms of out
   of tree build.

 * The builds continue to be done in $(O)/build/<pkg>-<version> for
   target packages and $(O)/build/host-<pkg>-<version> for host
   packages.

 * A <pkg>_SUPPORTS_OUT_OF_TREE variable defines whether the package
   supports out of tree build or not. By default, it's set to NO, in
   which case the package source code is rsynced from its source
   directory to the build directory at the beginning of the configure
   step. It is set to YES by both the autotools and cmake package
   infrastructures (which have been modified to do out of tree build),
   and by some packages that use the generic infrastructure but
   nonetheless support out of tree build.

 * The override source directory mechanism is updated to take
   advantage of this out of tree support. Now, if you override a
   package that supports out of tree build, the source code is no
   longer rsynced to the build directory. This makes the override
   source directory mechanism a lot more usable for big packages such
   as the Linux kernel.

We can roughly divide the patch set in the following sets of patches:

 * Patches 1 to 23 have the goal of getting rid of the <pkg>_DIR and
   replace it by <pkg>_BUILDDIR and <pkg>_SRCDIR. Throughout all those
   patches, <pkg>_SRCDIR continues to be equal to <pkg>_BUILDDIR:
   out-of-tree build is not introduced. But this preparation work is
   needed to get out of tree support.

 * Patches 24 to 27 fix some other misc issues that would prevent some
   packages to build in out-of-tree builds, especially autotools-based
   packages that are known to have issues.

 * Patch 28 is where all the magic happens: from this point on, we use
   out of tree build for all autotools and cmake packages, and for the
   generic packages that explicitly declare their wish to use out of
   tree build.

 * Patches 29 to 42 modify various generic packages to have them
   implement the support for out of tree build.

 * Patch 43 is a minor cleanup.

Comments, ideas, suggestions are welcome.

Best regards,

Thomas

----------------------------------------------------------------
Thomas Petazzoni (43):
      packages: Use @D where possible
      package: fix <pkg>_SRCDIR and <pkg>_BUILDDIR values
      Introduce a global SRC_DIR variable
      package: prepare removal of <pkg>_DIR
      iw: fix to use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      owl-linux: fix to use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      linux-fusion: fix to use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      hostapd: fix to use <pkg>_BUILDDIR instead of <pkg>_DIR
      gst-fsl-plugins: use <pkg>_SRCDIR instead of <pkg>_DIR
      wpa_supplicant: use <pkg>_BUILDDIR instead of <pkg>_DIR
      busybox: use <pkg>_BUILDDIR instead of <pkg>_DIR
      python3:use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      rp-pppoe:use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      python: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      dbus: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      rtai: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      perf: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      lttng-modules: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      icu: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      imx-lib: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      igh-ethercat: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
      urg: fix to use <pkg>_SRCDIR instead of <pkg>_DIR
      package: kill the <pkg>_DIR variable
      autoconf: fix out-of-tree build
      pkgconf: doesn't support out of tree build
      python: fix out of tree build issues
      busybox: don't copy .config file in a post-extract hook
      package: switch to out-of-tree build
      busybox: support out of tree build
      mtd: support out of tree build
      barebox: support out of tree build
      uboot: support out of tree build
      cmake: support out of tree build
      makedevs: support out of tree build
      qt: add out of tree build support
      pkg-stats: generate stats for out of tree support
      jquery: support out of tree
      jquery-validation: support out of tree
      jquery-sparkline: support out of tree
      liberation: support out of tree
      linux-firmware: support out of tree
      linux: support out of tree build
      speex: remove useless BUILD_CMDS
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
