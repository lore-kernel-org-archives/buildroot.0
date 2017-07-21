From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 21 Jul 2017 15:14:10 +0200
Subject: [Buildroot] [PATCH v9 0/3] Make the SDK relocatable
Message-ID: <1500642853-5565-1-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is v9 of my patch series to make the buildroot SDK (HOST_DIR)
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

In the meantime, various patches have been accepted. v9 will provide
the rest and fixes some minor issues.

Wolfgang.

Changes since v8:

- patch "external-toolchain: check if a buildroot SDK has
  already been relocated"" dropped. The SDK is not an external
  toolchain and should therefore not used for that purpose.
- patches for the "sdk" target squashed together
- "sdk" now depends on "world"
- "fix-rpath" now checks if executable patchelf utility exists.
- some ninor fixes (typos, coding style, etc.).

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

Wolfgang Grandegger (3):
  core: introduce "sdk" target to make a relocatable SDK
  support/scripts/fix-rpath: check if the patchelf utility exists
  support/scripts/fix-rpath: typo fix and unneeded ";" removed

 Makefile                  |  9 +++++++++
 support/scripts/fix-rpath | 12 ++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.7.4
