From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu,  7 Jan 2021 14:53:04 +0100
Subject: [Buildroot] [PATCH 0/3] refpolicy: Allow booting without denied
 actions
Message-ID: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the refpolicy support recently added, this series adds support
for booting basic systems using SELinux with a first batch of fixes,
allowing a clean boot without denied actions.

Some remaining issues are left to be fixed in order to boot in Enforcing
mode.

Most of the series adds the missing rules in the refpolicy for Buildroot
to be supported. An ongoing effort is currently being made to upstream
as much of these rules in the refpolicy itself, and some of these fixes
are already there, waiting for the next release.

Some other fixes are still being discussed, and finally some are waiting
to be better analysed in order to find the correct solution for
upstreaming in the refpolicy.

Still, this series adds patches that apply onto the refpolicy to fix
ongoing issues, along with a buildroot SELinux module to fix some rules
that needs to be analysed and upstreamed, being specific to embedded
systems.

Finally, the last patch adds a check for the number of denied actions in
the bootlog for the 2 testcases currently existing for SELinux, while
still using the Permissive mode.

These patches and the module are due to evolve, hopefully being thinner
and thinner until we can use the vanilla refpolicy.

Thanks to Antoine Tenart <atenart@kernel.org> for initiating this work
and doing the heavy lifting.

Thanks,

Maxime

Maxime Chevallier (3):
  package/refpolicy: Add patches pending the next release
  package/refpolicy: Add a buildroot module
  support/testing: improve SELinux test

 .../refpolicy/0001-pending-next-release.patch | 673 ++++++++++++++++++
 ...-private-type-for-run-systemd-userdb.patch | 130 ++++
 .../0003-authlogin-connect-to-userdb.patch    |  92 +++
 ...0004-systemd-logind-utilize-nsswitch.patch |  33 +
 ...0005-getty-utilize-auth_use_nsswitch.patch |  40 ++
 ...d-tmpfiles-utilize-auth_use_nsswitch.patch |  32 +
 .../refpolicy/0007-first-udevadm-patch.patch  | 130 ++++
 ...ing-Fixes-for-Buildroot-to-boot-in-e.patch | 190 +++++
 .../refpolicy/selinux-modules/buildroot.fc    |   0
 .../refpolicy/selinux-modules/buildroot.if    |   1 +
 .../refpolicy/selinux-modules/buildroot.te    | 121 ++++
 .../tests/init/test_systemd_selinux.py        |   6 +
 12 files changed, 1448 insertions(+)
 create mode 100644 package/refpolicy/0001-pending-next-release.patch
 create mode 100644 package/refpolicy/0002-systemd-private-type-for-run-systemd-userdb.patch
 create mode 100644 package/refpolicy/0003-authlogin-connect-to-userdb.patch
 create mode 100644 package/refpolicy/0004-systemd-logind-utilize-nsswitch.patch
 create mode 100644 package/refpolicy/0005-getty-utilize-auth_use_nsswitch.patch
 create mode 100644 package/refpolicy/0006-systemd-tmpfiles-utilize-auth_use_nsswitch.patch
 create mode 100644 package/refpolicy/0007-first-udevadm-patch.patch
 create mode 100644 package/refpolicy/0008-pending-upstreaming-Fixes-for-Buildroot-to-boot-in-e.patch
 create mode 100644 package/refpolicy/selinux-modules/buildroot.fc
 create mode 100644 package/refpolicy/selinux-modules/buildroot.if
 create mode 100644 package/refpolicy/selinux-modules/buildroot.te

-- 
2.25.4
