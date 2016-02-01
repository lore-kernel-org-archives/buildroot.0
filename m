From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:28 +0100
Subject: [Buildroot] [PATCH v6 00/13] Relocatable SDK / build machine leaks
Message-ID: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Series formerly named: "Host-package: RPATH fixup")


Hi all,


Here is yet another round of the series aiming improving the relocatability
of the SDK built by Buildroot.

Compare to the previous submissions [1,2], the biggest change in this version
is the rewritting in shell of the fix-rpath script.

In details:

Patches 1 to 3:
  Clean up and preparatory work for the relocatable SDK series and also helping
  to track build machine leaks into host, target and staging trees.

Patches 4 to 6:
  Make some pieces of the Buildroot SDK relocatable (limited to some symlinks
  and *-config scripts).

Patches 7 to 9:
  Add the fix-rpath script, then run it on the Buildroot host, target and
  staging trees.

Patch 10:
  Clean-up speex package WRT its RPATH hook.

Patch 11:
  Update the check-host-rpath to re-use the shell helpers.

Patches 12 and 13:
  Add means to track build machine leaks into the host, target and staging
  trees. These patches will allow to identify what remains to be fixed WRT
  build machine leaks.


Per-patch changelog is appended to the commit message of each patch.


[1] http://lists.busybox.net/pipermail/buildroot/2015-July/132440.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-July/132659.html


Regards,

Samuel

Samuel Martin (13):
  package/linux-headers: cleanup installation
  core: use $(CURDIR) to set TOPDIR
  core: re-enter make if $(CURDIR) or $(O) are not absolute canonical
    path
  core: staging symlink uses a relative path when possible
  core: make staging *-config scripts relocatable
  core: make host *-config scripts relocatable
  support/scripts: add fix-rpath script + a bunch of helpers
  core: add HOST_SANITIZE_RPATH_HOOK to TARGET_FINALIZE_HOOKS
  core: add {TARGET,STAGING}_SANITIZE_RPATH_HOOK to
    TARGET_FINALIZE_HOOKS
  package/speex: remove no longer needed hook
  support/scripts: update check-host-rpath to use the shell helpers
  support/scripts: add check-host-leaks script + all needed helpers
  core: add check-leaks-in-{target,host,staging} targets

 Makefile                               |  88 +++++++++++++++++-
 package/linux-headers/linux-headers.mk |   1 +
 package/pkg-generic.mk                 |  14 ++-
 package/pkg-utils.mk                   |   5 +
 package/speex/speex.mk                 |   5 -
 support/scripts/check-host-leaks       |  63 +++++++++++++
 support/scripts/check-host-rpath       |  67 +++++---------
 support/scripts/fix-rpath              | 101 ++++++++++++++++++++
 support/scripts/shell/log.sh           |  57 ++++++++++++
 support/scripts/shell/patchelf.sh      | 163 +++++++++++++++++++++++++++++++++
 support/scripts/shell/readelf.sh       | 151 ++++++++++++++++++++++++++++++
 support/scripts/shell/sdk.sh           | 141 ++++++++++++++++++++++++++++
 support/scripts/shell/source.sh        |  73 +++++++++++++++
 support/scripts/shell/utils.sh         | 142 ++++++++++++++++++++++++++++
 14 files changed, 1017 insertions(+), 54 deletions(-)
 create mode 100755 support/scripts/check-host-leaks
 create mode 100755 support/scripts/fix-rpath
 create mode 100644 support/scripts/shell/log.sh
 create mode 100644 support/scripts/shell/patchelf.sh
 create mode 100644 support/scripts/shell/readelf.sh
 create mode 100644 support/scripts/shell/sdk.sh
 create mode 100644 support/scripts/shell/source.sh
 create mode 100644 support/scripts/shell/utils.sh

--
2.7.0
