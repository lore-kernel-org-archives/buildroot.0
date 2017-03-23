From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 23 Mar 2017 08:54:43 +0100
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
Message-ID: <1490255693-9134-1-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is v3 of my RFC patch series to make the buildroot SDK (HOST_DIR)
relocatable. It sanitizes the RPATH of all ELF files in the "target"
and "host" tree using "patchelf --make-rpath-relative". I have started
the mainlining process implementing "--make-rpath-relative" using
GitHub pull request [1]... till now, no answer!

Furthermore this patch creates the script "relocate-sdk.sh" in the top
directory of the "host" tree allowing to relocate the SDK after it has
been moved to a new location. It replaces the old path with the new
one in all text files identified by "file --mime-type". The location
is stored in "usr/share/buildroot/sdk-location".

Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
libraries. To overcome this problem, "qt5pase" now creates "qt.conf".

Other Questions:

- Why do we want relative RPATHs starting with "$ORIGIN" also for ELF
  files in the target tree. "/lib" and "/usr/lib" have been removed
  already. 

Things not yet addressed:

- "make toolchain" creates a toolchain tree which still has references
  to the build system (in ELF and text files).  

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

Wolfgang Grandegger (9):
  package/patchelf: use most recent version as a base for rpath
    sanitation
  package/patchelf: add patch for rpath sanitation under a root
    directory
  core: sanitize RPATH in host tree at the very end of the build
  core: sanitize RPATH in target tree at the end of the target
    finalization
  support/scripts: add reloacte-sdk.sh script for SDK relocation
  core: install relocation script and location at the end of the build
  external-toolchain: check if a buildroot SDK has already been
    relocated
  support/scripts: check-host-rpath now handles $ORIGIN as well
  package/qt5base: provide "qt.conf" to make "qmake" relocatable

 Makefile                                           |  10 +
 ...to-make-the-rpath-relative-under-a-specif.patch | 315 +++++++++++++++++++++
 package/patchelf/patchelf.hash                     |   2 +-
 package/patchelf/patchelf.mk                       |   6 +-
 package/qt5/qt5base/qt.conf.in                     |   6 +
 package/qt5/qt5base/qt5base.mk                     |   8 +
 support/misc/relocate-sdk.sh                       |  47 +++
 support/scripts/check-host-rpath                   |   2 +-
 support/scripts/fix-rpath                          | 103 +++++++
 toolchain/helpers.mk                               |  15 +
 .../toolchain-external/pkg-toolchain-external.mk   |   1 +
 11 files changed, 510 insertions(+), 5 deletions(-)
 create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
 create mode 100644 package/qt5/qt5base/qt.conf.in
 create mode 100755 support/misc/relocate-sdk.sh
 create mode 100755 support/scripts/fix-rpath

-- 
1.9.1
