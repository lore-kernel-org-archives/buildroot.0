From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:44 +0100
Subject: [Buildroot] [RFC PATCH 0/9] Make the buildroot toolchain relocatable
Message-ID: <1488550733-3956-1-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is a RFC patch series to make the buildroot toolchain relocatable.
It's based on Samuel's related patch series but it now uses a patched
version of patchelf to sanitize the RPATH in the ELF files of the "target",
"sysroot" and "host" tree. Actually "patchelf --make-rpath-relative" does
the job. The idea is to get that patch mainlined but first I would like to
get some feedback here.

Furthermore it creates the script "relocate-toolchain.sh" in "host/usr"
allowing to relocate the toolchain after it has been moved to a new
location. It replaces the old path with the new one in all text files
identified by "file --mime-type".

Things not yet addressed:

- "make toolchain" creates a toolchain tree which still has references
  to the build system (in ELF and text files).  

Wolfgang.

Samuel Martin (3):
  support/scripts: add fix-rpath script to sanitize the rpath
  core: sanitize HOST_DIR at the very end of the build
  core: add {TARGET, STAGING}_SANITIZE_RPATH_HOOK to
    TARGET_FINALIZE_HOOKS

Wolfgang Grandegger (6):
  package/patchelf: use a recent version and add "--make-rpath-relative"
    patch
  support/scripts: add create-relocation-script for toolchain relocation
  core: create relocate-toolchain.sh in HOST_DIR/usr at the end of the
    build
  external-toolchain: check if a buildroot toolchain has already been
    relocated
  support/scripts: check-host-rpath now handles $ORIGIN as well
  support/scripts: check-host-rpath now uses patchelf to get the rpath

 Makefile                                           |  33 +++
 ...to-make-the-rpath-relative-within-a-speci.patch | 313 +++++++++++++++++++++
 package/patchelf/patchelf.hash                     |   2 +-
 package/patchelf/patchelf.mk                       |   6 +-
 support/scripts/check-host-rpath                   |  14 +-
 support/scripts/create-relocation-script           |  72 +++++
 support/scripts/fix-rpath                          | 106 +++++++
 toolchain/helpers.mk                               |  14 +
 .../toolchain-external/pkg-toolchain-external.mk   |   1 +
 9 files changed, 547 insertions(+), 14 deletions(-)
 create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-within-a-speci.patch
 create mode 100755 support/scripts/create-relocation-script
 create mode 100755 support/scripts/fix-rpath

-- 
1.9.1
