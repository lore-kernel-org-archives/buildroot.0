From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 16 Mar 2017 15:23:18 +0100
Subject: [Buildroot] [RFC PATCH v2 0/9] Make the buildroot SDK relocatable
Message-ID: <1489674207-6876-1-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this is v2 of my RFC patch series to make the buildroot SDK (HOST_DIR)
relocatable. It sanitizes the RPATH of all  ELF files in the "target"
and "host" tree using "patchelf --make-rpath-relative". I have started
the mainlining process implementing that feature using GitHub pull
request [1]... no answer till now.

Furthermore this patch creates the script "relocate-toolchain.sh" in
the top directory of the "host" tree allowing to relocate the SDK
after it has been moved to a new location. It replaces the old path
with the new one in all text files identified by "file --mime-type".

Other Questions:

- What is the exat meaning of "toolchain" and "SDK"? My understanding
  is: SDK is the tree under "HOST_DIR" while the toolchain is under
  "HOST_DIR/usr". At least that's what I have now implemented.

- Why do we want relative RPATHs starting with "$ORIGIN" also for ELF
  files in the target tree. "/lib" and "/usr/lib" have been removed
  anyway. 

Things not yet addressed:

- "make toolchain" creates a toolchain tree which still has references
  to the build system (in ELF and text files).  

Changes since v1:

- The patchelf version bump and patching are now done by 2 patches
- The staging tree is not touched any more... until we have a good
  reason to do so. 
- The sanitation is now performed by an optimized "fix-rpath" script.
- No more helper functions are used in the Makefile to call "fix-rpath"
  but added directly.

[1] https://github.com/NixOS/patchelf/pull/118

Wolfgang.

Samuel Martin (1):
  support/scripts: add fix-rpath script to sanitize the rpath

Wolfgang Grandegger (8):
  package/patchelf: use most recent version as a base for rpath
    sanitation
  package/patchelf: add patch for rpath sanitation under a root
    directory
  core: sanitize RPATH in host tree at the very end of the build
  core: sanitize RPATH in target tree at the end of the target
    finalization
  support/scripts: add create-sdk-relocation-script for SDK relocation
  core: create relocate-sdk.sh in HOST_DIR at the end of the build
  external-toolchain: check if a buildroot SDK has already been
    relocated
  support/scripts: check-host-rpath now handles $ORIGIN as well

 Makefile                                           |   9 +
 ...to-make-the-rpath-relative-under-a-specif.patch | 315 +++++++++++++++++++++
 package/patchelf/patchelf.hash                     |   2 +-
 package/patchelf/patchelf.mk                       |   6 +-
 support/scripts/check-host-rpath                   |   2 +-
 support/scripts/create-sdk-relocation-script       |  72 +++++
 support/scripts/fix-rpath                          | 103 +++++++
 toolchain/helpers.mk                               |  15 +
 .../toolchain-external/pkg-toolchain-external.mk   |   1 +
 9 files changed, 520 insertions(+), 5 deletions(-)
 create mode 100644 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
 create mode 100755 support/scripts/create-sdk-relocation-script
 create mode 100755 support/scripts/fix-rpath

-- 
1.9.1
