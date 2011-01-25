From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 22:07:14 +0100
Subject: [Buildroot] [git commit master 1/1] python: convert to autotargets,
	bump to 2.7.1, many improvements
Message-ID: <20110125211621.007368D245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3418f69cf2f17d54dfb521adedbe8abf6e35927
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit does a number of changes and improvements to the Python
interpreter package :

 * It converts the .mk file to the AUTOTARGETS infrastructure. Even
   though Python uses only autoconf and not automake, the AUTOTARGETS
   is a fairly good fit for the Python interpreter, so we make use of
   it.

 * It bumps the version to 2.7.1. As this is a minor release compared
   to 2.7, there are no particular changes needed because of this
   bump. All changes done to the package are cleanups and improvements
   unrelated to the version bump.

 * It uses the system libffi. Until now, Python was building its own
   libffi (a library used by interprets to build code that makes
   function call at runtime). Using the Python internal libffi was not
   working as Python was not passing the appropriate arguments down to
   libffi ./configure script. And it sounded better to use a
   system-wide libffi, that could potentially be used by other
   packages as well. This libffi is needed for the ctypes Python
   module.

 * Remove all "depends on BR2_PACKAGE_PYTHON" by moving all
   Python-related options under a "if BR2_PACKAGE_PYTHON ... endif"
   condition.

 * Make the installation of pre-compiled Python modules (.pyc) the
   default, since they are smaller and do not need to be compiled on
   the target. It is still possible to install uncompiled modules, or
   both the uncompiled and pre-compiled versions.

 * The options to select the set of Python modules to compile has been
   moved to a submenu.

 * The codecscjk (Japanese, Korean and Chinese codecs) module is no
   longer enabled by default.

 * The commented options for gdbm and nis in Python have been
   removed. Those were not supported, so let's get rid of unused code.

 * The option for the tkinker module in Python has been removed, since
   we don't have a package for Tk in Buildroot.

 * Options for the bzip2, sqlite and zlib modules have been added,
   since those modules have external dependencies.

 * The set of patches has been completely reworked and extended, with
   more fine-grained patches and newer functionalities. The patches
   are split in two categories:

    - Patches that make various modifications to the Python build
      system to support cross-compilation or make some minor
      modifications. Those patches are numbered from 0 to 100.

    - Patches that add configuration options to the Python build
      system in order to enable/disable the compilation of Python
      extensions or modules (test modules, pydoc, lib2to3, sqlite, tk,
      curses, expat, codecs-cjk, nis, unicodedata, database modules,
      ssl, bzip2, zlib). These patches are numbered from 100 to 200.

   All features of the previous four patches are preserved, but they
   are organized differently and the patches have been renamed. This
   makes it difficult to see the differences from the existing
   patches.

 * The host Python interpreter is now installed in $(HOST_DIR), since
   it is used to build third party Python modules.

 * The BR2_PACKAGE_PYTHON_DEV option is removed since
   BR2_HAVE_DEVFILES already does the necessary work.

 * The "make -i install" workaround introduced by Maxime Ripard is no
   longer needed. It was caused by the compilation of the tests that
   required the unicodedata module (which wasn't built in the host
   Python interpreter). Since we no longer compile the Python tests,
   the problem doesn't exist anymore and we can avoid this "-i"
   option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
