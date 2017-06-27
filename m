From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 27 Jun 2017 12:26:36 +0200
Subject: [Buildroot] [PATCH v4 00/11] Make the SDK relocatable
Message-ID: <1498559207-8050-1-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is v4 of my patch series to make the buildroot SDK (HOST_DIR)
relocatable. It sanitizes the RPATH of all ELF files in the "target",
"staging" and "host" tree using "patchelf --make-rpath-relative". I
have started the mainlining process to implement "--make-rpath-relative"
using GitHub pull request [1]... till now, no answer!

Furthermore this patch creates the script "relocate-sdk.sh" in the top
directory of the "host" tree allowing to relocate the SDK after it has
been moved to a new location. It replaces the old path with the new
one in all text files identified by "file --mime-type". The location
is stored in "usr/share/buildroot/sdk-location".

Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
libraries. To overcome this problem, "qt5pase" now creates "qt.conf".

I also checked if the rpath sanitation could be done per package
after package installation into the host, staging or target tree
using GLOBAL_INSTRUMENTATION_HOOKS, similar to "check-bin-arch"
or "check-host-rpath". Unfortunately, this approach does required
bigger changes to the infrastructure, mainly to maintain a list of
ELF files installed per package into the various trees. This needs
more thought/discussion...

Other Questions:

Things not yet addressed:

- "make toolchain" creates a toolchain tree which still has references
  to the build system (in ELF and text files).

Changes since v3:

- The patchelf patch implementing " --make-rpath-relative" now supports
  the option "--relative-to-file" instructing to use "$ORIGIN" in
  RPATHs. Otherwise an absolute path relative to the root directory will
  be used.
- The staging tree is now sanitized as well using the options
  "--relative-to-file" and "--no-standard-libs".
- For the "target" tree, relative RPATHs do not use "$ORIGIN" any
  longer. An absolute path relative to the root directory is used
  instead.

Changes since v2:

- provide "qt.conf" to make "qmake" relocatable
- sed now uses the separator "\" to substitute the directory path.
  It's one of the few characters not allowed in file names. To
  avoid interpreting it as escape character, the "read -r" is used.
- The paranoia substituion check is done before doing the real
  substituion.

Changes since v1:

- The name SDK has been chosen for the relocatabed "HOST_DIR" (instead
  of toolchanin).
- The patchelf version bump and patching are now done by 2 patches
- No more helper functions are used in the Makefile to call "fix-rpath"
  but added directly.
- The staging tree is not touched any more... until we have a good
  reason to do so. 
- The sanitation is now performed by an optimized "fix-rpath" script.
- The relocate-sdk script is now copied for support/misc to the
  top directory of the host tree.

[1] https://github.com/NixOS/patchelf/pull/118

Samuel Martin (1):
  support/scripts: add fix-rpath script to sanitize the rpath

Wolfgang Grandegger (10):
  package/patchelf: use most recent version as a base for rpath
    sanitation
  package/patchelf: add patch for rpath sanitation under a root
    directory
  core: sanitize RPATH in staging tree at the end of the target
    finalization
  core: sanitize RPATH in target tree at the end of the target
    finalization
  core: sanitize RPATH in host tree at the very end of the build
  support/scripts: add reloacte-sdk.sh script for SDK relocation
  core: install relocation script and location at the end of the build
  external-toolchain: check if a buildroot SDK has already been
    relocated
  support/scripts: check-host-rpath now handles $ORIGIN as well
  package/qt5base: provide "qt.conf" to make "qmake" relocatable

 Makefile                                           |  12 +
 ...to-make-the-rpath-relative-under-a-specif.patch | 326 +++++++++++++++++++++
 package/patchelf/patchelf.hash                     |   2 +-
 package/patchelf/patchelf.mk                       |   8 +-
 package/qt5/qt5base/qt.conf.in                     |   6 +
 package/qt5/qt5base/qt5base.mk                     |   8 +
 support/misc/relocate-sdk.sh                       |  47 +++
 support/scripts/check-host-rpath                   |   2 +-
 support/scripts/fix-rpath                          | 112 +++++++
 toolchain/helpers.mk                               |  15 +
 .../toolchain-external/pkg-toolchain-external.mk   |   1 +
 11 files changed, 533 insertions(+), 6 deletions(-)
 create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
 create mode 100644 package/qt5/qt5base/qt.conf.in
 create mode 100755 support/misc/relocate-sdk.sh
 create mode 100755 support/scripts/fix-rpath

-- 
2.7.4
