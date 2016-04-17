From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 17 Apr 2016 23:38:17 +0200
Subject: [Buildroot] [PATCH v8 00/14] Relocatable SDK/Build machine leaks:
	RPATH fixing
Message-ID: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Here is yet another round of the series aiming improving the relocatability
of the SDK built by Buildroot.

This time, I reduce the series to those related to RPATH (hope a shorter
series will be easier to review...). Besides, the noticeable changes are:
- the refactoring of the O definition, as it needs to point to the
  absolute canonical path for the whole build, so that fix-rpath can do
  its job, without missing anything;
- and the refactoring of the check-host-leaks script.

For further details, check the per-commit changelog in each commit log.


Patches 1 and 2:
  Fix the O variable definition.

Patches 3 to 5:
  Add the fix-rpath script, then run it on the Buildroot host, target and
  staging trees.

Patch 6:
  Clean-up speex package WRT its RPATH hook.

Patch 7:
  Add a post-install hook to the toolchain package to render it relocatable.

Patch 8 to 10:
  Update and fix the check-host-rpath to re-use the shell helpers.

Patches 11 to 13:
  Add means to track build machine leaks into the host, target and staging
  trees. These patches will allow to identify what remains to be fixed WRT
  build machine leaks.

Patches 14:
  Update documentation about how to enable/adjust log level on script using
  the shell modules introduced in patch 8/18.


Regards,
Samuel


Samuel Martin (14):
  core: split variables definition related to in/out-of-tree build from
    O itself
  core: re-enter make if $(CURDIR) or $(O) are not absolute canonical
    path
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
  support/scripts/check-host-leaks: add option to classify leaks
  docs/manual: document how to debug shell script

 Makefile                            | 128 ++++++++++++---
 docs/manual/debugging-buildroot.txt |  17 ++
 package/pkg-utils.mk                |   5 +
 package/speex/speex.mk              |   5 -
 support/scripts/check-host-leaks    | 181 +++++++++++++++++++++
 support/scripts/check-host-rpath    |  73 ++++-----
 support/scripts/fix-rpath           | 116 ++++++++++++++
 support/scripts/shell/log.sh        |  61 +++++++
 support/scripts/shell/patchelf.sh   | 178 +++++++++++++++++++++
 support/scripts/shell/readelf.sh    | 306 ++++++++++++++++++++++++++++++++++++
 support/scripts/shell/sdk.sh        |  75 +++++++++
 support/scripts/shell/source.sh     |  77 +++++++++
 support/scripts/shell/utils.sh      |  74 +++++++++
 toolchain/toolchain/toolchain.mk    |   5 +
 14 files changed, 1230 insertions(+), 71 deletions(-)
 create mode 100755 support/scripts/check-host-leaks
 create mode 100755 support/scripts/fix-rpath
 create mode 100644 support/scripts/shell/log.sh
 create mode 100644 support/scripts/shell/patchelf.sh
 create mode 100644 support/scripts/shell/readelf.sh
 create mode 100644 support/scripts/shell/sdk.sh
 create mode 100644 support/scripts/shell/source.sh
 create mode 100644 support/scripts/shell/utils.sh

--
2.8.0
