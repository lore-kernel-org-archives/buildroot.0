From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 19:55:33 +0200
Subject: [Buildroot] [PATCH v6 00/10] Make the SDK relocatable
In-Reply-To: <1499185359-8293-1-git-send-email-wg@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
Message-ID: <7fa2231c-4942-da98-6c91-435b4761940b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Wolfgang,

 I've already marked patch 7 and 10 as superseded in patchwork because they were
already applied by Thomas. Can you check if there is a significant difference
with what was applied?

On 04-07-17 18:22, Wolfgang Grandegger wrote:
> Hello,
> 
> this is v6 of my patch series to make the buildroot SDK (HOST_DIR)
> relocatable. It sanitizes the RPATH of all ELF files in the "target",
> "staging" and "host" tree using "patchelf --make-rpath-relative". We
> now use patchelf v0.9 to still support old Debian and RHEL systems.
> 
> v5 did RPATH sanitization per package after package installation into
> the host, staging or target tree using GLOBAL_INSTRUMENTATION_HOOKS.
> This approach got more and more complex and inefficient. Therefore
> it was abandoned in favor of global sanititation at the end of the
> host, staging and target build (see changes since v5).
> 
> Furthermore this patch creates the script "relocate-sdk.sh" in the top
> directory of the "host" tree allowing to relocate the SDK after it has
> been moved to a new location. It replaces the old path with the new
> one in all text files identified by "file --mime-type". The location
> is stored in "usr/share/buildroot/sdk-location".
> 
> Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
> libraries. To overcome this problem, "qt5pase" now creates "qt.conf".
> 
> Hope I have not too much pending issues.

 We all do :-) But this is really complicated infrastructural work, so it is to
be expected that it takes time. Just 7 revisions would already be pretty good!

> 
> Wolfgang.
> 
> Things not yet addressed:
> 
> - "make toolchain" creates a toolchain tree which still has references
>   to the build system (in ELF and text files).
> 
> Changes since v5:
> - switch back to v4
> - patchelf patches are now based on v0.9
> - patchelf now calculates minimal relative path to the ELF file
>   (and not to the rootdir as before).
> - patchelf: neededLibFound is now passed to libFoundInRPath

 If any more issues are found in the rpath fixup, they can be handled in
follow-up patches.


 Regards,
 Arnout

> - Makefile: the "host-finalize" target has been added for SDK relocation
> - fix-rpath now uses variables to define the list of dirs to be pruned
> - fix-rpath: the staging tree is sanitized like the target tree
> - various minor fixes (typos)
> 
> Changes since v4:
> 
> - RPATH sanitation is now done per package and installation step
>   in "pkg-generic.mk".
> - After the installation step, the list of the installed files is
>   stored in "<package-build-dir>/.br_[host|staging|target]_filelist".
> - The GLOBAL_INSTRUMENTATION_HOOKS "step_sanitize_rpath" then calls
>   "fix-rpath" to do the sanitation.
> - DEPENDENCIES_HOST_PREREQ += host-patchelf is set early in the
>   Makefile as we need it for RPATH sanitation. As soon it's available
>   sanitation can start (currently missing some packages).
> - The patchelf "file busy" issue is now worked-around differently.
> 
> Changes since v3:
> 
> - The patchelf patch implementing " --make-rpath-relative" now supports
>   the option "--relative-to-file" instructing to use "$ORIGIN" in
>   RPATHs. Otherwise an absolute path relative to the root directory will
>   be used.
> - The staging tree is now sanitized as well using the options
>   "--relative-to-file" and "--no-standard-libs".
> - For the "target" tree, relative RPATHs do not use "$ORIGIN" any
>   longer. An absolute path relative to the root directory is used
>   instead.
> 
> Changes since v2:
> 
> - provide "qt.conf" to make "qmake" relocatable
> - sed now uses the separator "\" to substitute the directory path.
>   It's one of the few characters not allowed in file names. To
>   avoid interpreting it as escape character, the "read -r" is used.
> - The paranoia substituion check is done before doing the real
>   substituion.
> 
> Changes since v1:
> 
> - The name SDK has been chosen for the relocatabed "HOST_DIR" (instead
>   of toolchanin).
> - The patchelf version bump and patching are now done by 2 patches
> - No more helper functions are used in the Makefile to call "fix-rpath"
>   but added directly.
> - The staging tree is not touched any more... until we have a good
>   reason to do so. 
> - The sanitation is now performed by an optimized "fix-rpath" script.
> - The relocate-sdk script is now copied for support/misc to the
>   top directory of the host tree.
> 
> Samuel Martin (1):
>   support/scripts: add fix-rpath script to sanitize the rpath
> 
> Wolfgang Grandegger (9):
>   support/scripts: check-host-rpath now handles $ORIGIN/../lib
>   package/patchelf: add patch for rpath sanitization under a root
>     directory
>   core: sanitize RPATH in staging tree at the end of target finalization
>   core: sanitize RPATH in target tree at the end of target finalization
>   core: sanitize RPATH in host tree at the very end of the build
>   support/scripts: add relocate-sdk.sh script for SDK relocation
>   core: install relocation script and location at the end of the build
>   external-toolchain: check if a buildroot SDK has already been
>     relocated
>   package/qt5base: provide "qt.conf" to make "qmake" relocatable
> 
>  Makefile                                           |  17 +-
>  ...move-apparently-incorrect-usage-of-static.patch |  49 +++
>  ...unction-for-splitting-a-colon-separated-s.patch |  58 +++
>  ...to-make-the-rpath-relative-under-a-specif.patch | 419 +++++++++++++++++++++
>  package/qt5/qt5base/qt.conf.in                     |   6 +
>  package/qt5/qt5base/qt5base.mk                     |   8 +
>  support/misc/relocate-sdk.sh                       |  47 +++
>  support/scripts/check-host-rpath                   |   2 +-
>  support/scripts/fix-rpath                          | 122 ++++++
>  toolchain/helpers.mk                               |  18 +
>  .../toolchain-external/pkg-toolchain-external.mk   |   1 +
>  11 files changed, 745 insertions(+), 2 deletions(-)
>  create mode 100644 package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>  create mode 100644 package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
>  create mode 100644 package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
>  create mode 100644 package/qt5/qt5base/qt.conf.in
>  create mode 100755 support/misc/relocate-sdk.sh
>  create mode 100755 support/scripts/fix-rpath
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
