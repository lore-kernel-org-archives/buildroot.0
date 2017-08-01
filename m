From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Aug 2017 00:52:10 +0200
Subject: [Buildroot] [PATCH v5 00/14] system: properly handle systemd as
	init system
Message-ID: <20170801225224.16899-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is a proposal to fix our handling of systemd as an init
system.

Our default skeleton is not well suited for systemd:

  - we have /var/log a symlink to /tmp/log, but the way systemd starts
    hides the journals:
    - start systemd-journald, stores journals in /tmp/log/ (because of
      the redirection above)
    - mounts a tmpfs over /tmp, thus hidding the journals.

  - on a read-only rootfs, systemd expects /var to be read-write, which
    we do not provide. Read-only rootfs will be handled in a separate
    series.

All of this sounds trivial, but fixing it is definitely not.

The overall idea is that we need different skeletons, one for each type
of init systems: sysv, systemd, others (aka custom).

The skeleton package becomes a virtual package, that is provided by one
of four implementations:

  - skeleton-sysv or skeleton-systemd, as their names imply, for either
    SysV- or systemd-based systems, and which depend on skeleton-common;

  - skeleton-common, that provides base files and directories comon to
    all skeletons (except custom, below); skeleton-common is also a
    provider for the skeleton virtual package, for use with no-init (aka
    custom init) systems;

  - skeleton-custom, for user-provided custom skeleton, and of which we
    expect it is fully prepared; skeleton-custom does not depend on
    skeleton-common.

Eventually, we add support for runing systemd on a read-only rootfs.
This requires that we play tricks with /var and the systemd-tmpfiles
factory feautre.

A series of runtime tests have also been added, running on the QEMU
vexpress:

    init system         rootfs      DHCP?
    -------------------------------------
    busybox             ext4        no
    busybox             ext4        eth0
    busybox             squashfs    no
    busybox             squashfs    eth0

  * systemd-ifupdown    ext4        eth0
  * systemd-ifupdown    squashfs    eth0
 ** systemd-networkd    ext4        eth0
 ** systemd-networkd    squashfs    eth0
*** systemd-full        ext4        eth0
*** systemd-full        squashfs    eth0

  + no-init             squashfs    no

  * systemd-networkd: only what gets selected automatically when
    systemd is used as init system, with all other options unset;

 ** systemd-ifupdown: like systemd-networkd, but with networkd
    disabled, thus using ifupdown instead;

*** systemd-full: all systemd options enabled, implies networkd;

  + a shell is launched as init

Those new tests are not exhaustive, especially the systemd one; instead,
they just test basic features: what init is being used, and did we get
an IP adress for eth0? More tests can be added later on.

You can also find this series on https://gitlab.com/arnout/buildroot
branch systemd-skeleton-5-by-arnout

Changes v4 -> v5:
  - moved the test infra patch all the way to the beginning of the series
  - dropped the patch that removed support for BR2_INIT_NONE with the default
    skeleton
  - to make that possible, merged the patch that re-introduced BR2_INIT_NONE
    support with the patch that breaks it, i.e. the introduction of
    skeleton-sysv and skeleton-systemd
  - split the patch that splits off skeleton-custom into 4 patches; the first
    one does only the split, the other ones do 3 clean-ups. Except for
    comments, the end result is the same as the original skeleton-custom
  - add a further cleanup to skeleton-common that renames
    SKELETON_ROOT_PASSWORD to SKELETON_CUSTOM_ROOT_PASSWORD
  - re-generate .gitlab-ci.yml in the two patches that create new tests.

Changes v3 -> v4:
  - fix the read-only support  (Arnout)
  - add reviewed-by tags from Arnout. Thanks a lot!
  - enhance some commit logs after those reviews
  - simplify no-init skeleton-common  (Arnout)

Changes v2 -> v3:
  - too much to note, mostly rewriten from scratch

Changes v1 -> v2:
  - enhance the commit logs

Regards,
Arnout

----------------------------------------------------------------
Arnout Vandecappelle (1):
  skeleton-common: rename SKELETON_ROOT_PASSWORD to
    SKELETON_CUSTOM_ROOT_PASSWORD

Yann E. MORIN (13):
  support/testing: add runtime testing for init systems
  package/skeleton: split out into skeleton-custom
  package/skeleton-custom: rework the merged_usr and building conditions
  package/skeleton-custom: also check for missing directories
  package/skeleton-custom: simplify target/staging install
  package/skeleton: split out into skeleton-common
  package/skeleton: make it a virtual package
  package/skeleton-common: simplify staging install
  package/skeleton: introduce sysv- and systemd-specific skeletons
  system: separate sysv and systemd parts of the skeleton
  fs: add pre- and post-command hooks
  system: make systemd work on a read-only rootfs
  support/testing: add runtime testing for read-only systemd

 .gitlab-ci.yml                                     |   8 ++
 fs/common.mk                                       |   4 +
 package/Config.in                                  |   4 +
 package/pkg-generic.mk                             |   4 +
 package/skeleton-common/Config.in                  |  17 +++
 package/skeleton-common/skeleton-common.mk         |  90 ++++++++++++
 package/skeleton-custom/Config.in                  |   6 +
 package/skeleton-custom/skeleton-custom.mk         | 107 +++++++++++++++
 package/skeleton-systemd/Config.in                 |   7 +
 package/skeleton-systemd/skeleton-systemd.mk       |  71 ++++++++++
 package/skeleton-sysv/Config.in                    |   7 +
 package/skeleton-sysv/skeleton-sysv.mk             |  22 +++
 {system => package/skeleton-sysv}/skeleton/dev/log |   0
 .../skeleton-sysv}/skeleton/dev/pts/.empty         |   0
 .../skeleton-sysv}/skeleton/dev/shm/.empty         |   0
 .../skeleton-sysv}/skeleton/etc/fstab              |   0
 .../skeleton-sysv}/skeleton/var/cache              |   0
 .../skeleton-sysv}/skeleton/var/lib/misc           |   0
 .../skeleton-sysv}/skeleton/var/lock               |   0
 {system => package/skeleton-sysv}/skeleton/var/log |   0
 {system => package/skeleton-sysv}/skeleton/var/run |   0
 .../skeleton-sysv}/skeleton/var/spool              |   0
 {system => package/skeleton-sysv}/skeleton/var/tmp |   0
 package/skeleton/Config.in                         |   9 +-
 package/skeleton/skeleton.mk                       | 139 +------------------
 .../testing/tests/init/__init__.py                 |   0
 support/testing/tests/init/base.py                 |  47 +++++++
 .../testing/tests/init/systemd-factory/var/foo/bar |   1 +
 support/testing/tests/init/test_busybox.py         |  67 +++++++++
 support/testing/tests/init/test_none.py            |  32 +++++
 support/testing/tests/init/test_systemd.py         | 152 +++++++++++++++++++++
 system/Config.in                                   |  12 +-
 system/skeleton/dev/{pts => }/.empty               |   0
 33 files changed, 663 insertions(+), 143 deletions(-)
 create mode 100644 package/skeleton-common/Config.in
 create mode 100644 package/skeleton-common/skeleton-common.mk
 create mode 100644 package/skeleton-custom/Config.in
 create mode 100644 package/skeleton-custom/skeleton-custom.mk
 create mode 100644 package/skeleton-systemd/Config.in
 create mode 100644 package/skeleton-systemd/skeleton-systemd.mk
 create mode 100644 package/skeleton-sysv/Config.in
 create mode 100644 package/skeleton-sysv/skeleton-sysv.mk
 rename {system => package/skeleton-sysv}/skeleton/dev/log (100%)
 copy {system => package/skeleton-sysv}/skeleton/dev/pts/.empty (100%)
 rename {system => package/skeleton-sysv}/skeleton/dev/shm/.empty (100%)
 rename {system => package/skeleton-sysv}/skeleton/etc/fstab (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/cache (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/lib/misc (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/lock (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/log (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/run (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/spool (100%)
 rename {system => package/skeleton-sysv}/skeleton/var/tmp (100%)
 copy system/skeleton/dev/pts/.empty => support/testing/tests/init/__init__.py (100%)
 create mode 100644 support/testing/tests/init/base.py
 create mode 100644 support/testing/tests/init/systemd-factory/var/foo/bar
 create mode 100644 support/testing/tests/init/test_busybox.py
 create mode 100644 support/testing/tests/init/test_none.py
 create mode 100644 support/testing/tests/init/test_systemd.py
 rename system/skeleton/dev/{pts => }/.empty (100%)

-- 
2.13.3
