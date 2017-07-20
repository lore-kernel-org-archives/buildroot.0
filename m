From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:35:11 +0200
Subject: [Buildroot] [PATCH v8 00/10] Make the SDK relocatable
Message-ID: <1500561321-6623-1-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is v8 of my patch series to make the buildroot SDK (HOST_DIR)
relocatable. It sanitizes the RPATH of all ELF files in the "target",
"staging" and "host" tree using "patchelf --make-rpath-relative". We
now use patchelf v0.9 to still support old Debian and RHEL systems.

v5 did RPATH sanitization per package after package installation into
the host, staging or target tree using GLOBAL_INSTRUMENTATION_HOOKS.
This approach got more and more complex and inefficient. Therefore
it was abandoned in favor of global sanititation at the end of the
host, staging and target build (see changes since v5).

Furthermore this patch creates the script "relocate-sdk.sh" in the top
directory of the "host" tree allowing to relocate the SDK after it has
been moved to a new location. It replaces the old path with the new
one in all text files identified by "file --mime-type". The location
is stored in "share/buildroot/sdk-location". This patch is already
upstream.

Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
libraries. To overcome this problem, "qt5pase" now creates "qt.conf".

v8 now creates a relocatable SDK with "make sdk". The normal "make"
only sanitizes the RPATH in the target tree.

Hope I have not too much pending issues.

Wolfgang.

Changes since v7:
- patchelf patches are now created with git (base on v0.9)
- the target tree is now sanitized before the overlay files are copied
- "make sdk" sanitizes the staging and host tree and adds relocate.sh
- relocate.sh does not use basism an longer
- fix-rpath now uses absolute path without rootdir for staging and
  target dir
- various other minor fixes (doc, indention, etc.)

Changes since v6:
- patchelf patches: update patch header with upstream commit, etc.
- ${HOST_DIR}/usr is gone which required various fixes
- Proper qt.conf.in added

Changes since v5:
- switch back to v4
- patchelf patches are now based on v0.9
- patchelf now calculates minimal relative path to the ELF file
  (and not to the rootdir as before).
- patchelf: neededLibFound is now passed to libFoundInRPath
- Makefile: the "host-finalize" target has been added for SDK relocation
- fix-rpath now uses variables to define the list of dirs to be pruned
- fix-rpath: the staging tree is sanitized like the target tree
- various minor fixes (typos)

Changes since v4:

- RPATH sanitation is now done per package and installation step
  in "pkg-generic.mk".
- After the installation step, the list of the installed files is
  stored in "<package-build-dir>/.br_[host|staging|target]_filelist".
- The GLOBAL_INSTRUMENTATION_HOOKS "step_sanitize_rpath" then calls
  "fix-rpath" to do the sanitation.
- DEPENDENCIES_HOST_PREREQ += host-patchelf is set early in the
  Makefile as we need it for RPATH sanitation. As soon it's available
  sanitation can start (currently missing some packages).
- The patchelf "file busy" issue is now worked-around differently.

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

Samuel Martin (1):
  support/scripts: add fix-rpath script to sanitize the rpath

Wolfgang Grandegger (9):
  support/scripts: relocate-sdk.sh now uses a normal pipe to find
    strings
  package/patchelf: add patch for rpath sanitization under a root
    directory
  patchelf: always build this package required for RPATH sanitization
  core: sanitize RPATH in target tree before copying the overlay
  core: introduce "sdk" target to make a relocatable SDK
  core: sanitize RPATH in staging tree to make a relocatable SDK
  external-toolchain: check if a buildroot SDK has already been
    relocated
  core: install relocation script and location to make a relocatable SDK
  package/qt5base: provide "qt.conf" to make "qmake" relocatable

 Makefile                                           |  13 +
 ...move-apparently-incorrect-usage-of-static.patch |  56 ++++
 ...unction-for-splitting-a-colon-separated-s.patch |  63 ++++
 ...to-make-the-rpath-relative-under-a-specif.patch | 332 +++++++++++++++++++++
 package/patchelf/Config.in.host                    |   3 +-
 package/qt5/qt5base/qt.conf.in                     |  19 ++
 package/qt5/qt5base/qt5base.mk                     |   8 +
 support/misc/relocate-sdk.sh                       |   4 +-
 support/scripts/fix-rpath                          | 133 +++++++++
 toolchain/helpers.mk                               |  16 +
 .../toolchain-external/pkg-toolchain-external.mk   |   1 +
 11 files changed, 645 insertions(+), 3 deletions(-)
 create mode 100644 package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
 create mode 100644 package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
 create mode 100644 package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
 create mode 100644 package/qt5/qt5base/qt.conf.in
 create mode 100755 support/scripts/fix-rpath

-- 
2.7.4
