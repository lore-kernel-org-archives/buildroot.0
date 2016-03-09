From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:41 +0100
Subject: [Buildroot] [PATCH v7 00/18] Relocatable SDK / build machine leaks
Message-ID: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Here is yet another round of the series aiming improving the relocatability
of the SDK built by Buildroot.

The new round improves the shell implementation started in the previous
submission.


In details:

Patches 1 to 3:
  Clean up and preparatory work for the relocatable SDK series and also helping
  to track build machine leaks into host, target and staging trees.

Patches 4 to 7:
  Make some pieces of the Buildroot SDK relocatable (limited to some symlinks
  and *-config scripts).

Patches 8 to 10:
  Add the fix-rpath script, then run it on the Buildroot host, target and
  staging trees.

Patch 11:
  Clean-up speex package WRT its RPATH hook.

Patch 12:
  Add a post-install hook to the toolchain package to render it relocatable.

Patch 13 to 15:
  Update and fix the check-host-rpath to re-use the shell helpers.

Patches 16 and 17:
  Add means to track build machine leaks into the host, target and staging
  trees. These patches will allow to identify what remains to be fixed WRT
  build machine leaks.

Patches 18:
  Update documentation about how to enable/adjust log level on script using
  the shell modules introduced in patch 8/18.


Worth noting:

* patches 4, 5, 6 and 7 fix scripts or wrappers WRT improving the SDK
  relocatability;

* patches 8 and 16 add new scripts (which are not executed without the
  patches 9, 10 and 12).

* patches 9, 10 and 12 add make targets called on all builds, improving the
  SDK relocatability; patch 17 also add make targets, but they are not in as
  dependency of any other, so must be invoke explicitly.

* all others patches are fairly trivial fixes or improvements.


Future works:

* Handling autotools/libtools relocation

* Analysing and fixing leaks and relocation remaining issues


Regards,
Samuel
--

Samuel Martin (18):
  package/linux-headers: cleanup installation
  core: use $(CURDIR) to set TOPDIR
  core: re-enter make if $(CURDIR) or $(O) are not absolute canonical
    path
  core: staging symlink uses a relative path when possible
  core: make staging *-config scripts relocatable
  core: make host *-config scripts relocatable
  package/pkgconf: make the pkg-config wrapper relocatable
  support/scripts: add fix-rpath script + a bunch of helpers
  core: add HOST_SANITIZE_RPATH_HOOK to TARGET_FINALIZE_HOOKS
  core: add {TARGET,STAGING}_SANITIZE_RPATH_HOOK to
    TARGET_FINALIZE_HOOKS
  package/speex: remove no longer needed hook
  toolchain: add post-install hooks making the toolchain relocatable
  support/scripts: update check-host-rpath to use the shell helpers
  support/scripts/check-host-rpath: silent find command
  support/scripts/check-host-rpath: also check HOST_DIR/{bin,sbin}
  support/scripts: add check-host-leaks script + all needed helpers
  core: add check-leaks-in-{target,host,staging} targets
  docs/manual: document how to debug shell script

 Makefile                               |  76 +++++++-
 docs/manual/debugging-buildroot.txt    |  15 ++
 package/linux-headers/linux-headers.mk |   1 +
 package/pkg-generic.mk                 |  14 +-
 package/pkg-utils.mk                   |   5 +
 package/pkgconf/pkg-config.in          |   4 +-
 package/pkgconf/pkgconf.mk             |   8 +-
 package/speex/speex.mk                 |   5 -
 support/scripts/check-host-leaks       |  63 +++++++
 support/scripts/check-host-rpath       |  71 +++----
 support/scripts/fix-rpath              | 116 ++++++++++++
 support/scripts/shell/log.sh           |  61 ++++++
 support/scripts/shell/patchelf.sh      | 178 ++++++++++++++++++
 support/scripts/shell/readelf.sh       | 328 +++++++++++++++++++++++++++++++++
 support/scripts/shell/sdk.sh           | 138 ++++++++++++++
 support/scripts/shell/source.sh        |  77 ++++++++
 support/scripts/shell/utils.sh         |  76 ++++++++
 toolchain/toolchain/toolchain.mk       |   5 +
 18 files changed, 1183 insertions(+), 58 deletions(-)
 mode change 100644 => 100755 package/pkgconf/pkg-config.in
 create mode 100755 support/scripts/check-host-leaks
 create mode 100755 support/scripts/fix-rpath
 create mode 100644 support/scripts/shell/log.sh
 create mode 100644 support/scripts/shell/patchelf.sh
 create mode 100644 support/scripts/shell/readelf.sh
 create mode 100644 support/scripts/shell/sdk.sh
 create mode 100644 support/scripts/shell/source.sh
 create mode 100644 support/scripts/shell/utils.sh

--
2.7.2
