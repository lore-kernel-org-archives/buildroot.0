From: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 19 Jul 2021 11:38:14 +0200
Subject: [Buildroot] [PATCH v3 0/1] Add support for teamd/libteam
Message-ID: <20210719093815.2017764-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi everyone!

Third time's a charm, I hope.  Here's the updated patch to add support
for teamd/libteam in Buildroot.  As mentioned previously, a few musl
libc related patches have been backported from project's master branch
at

    https://github.com/jpirko/libteam/

This time the Config.in dependency handling is actually fixed.  I did
not really understand it before.  Huge thanks to Yann and Yegor for
patiently explaining it to me!

I've also dropped the previously selected team modes, as suggested by
Yann, and rearranged the directives in libteam.mk slightly.  Could not
find any official CPE, so used the package name, as other packages do.

Basic tests still pass, and as of v3 br-arm-full-static is now skipped,
as expected:

    $ ./utils/check-package package/libteam/*
    199 lines processed
    0 warnings generated

    $ ./utils/test-pkg -c libteam.config -p libteam
               bootlin-armv5-uclibc [1/6]: OK
                bootlin-armv7-glibc [2/6]: OK
              bootlin-armv7m-uclibc [3/6]: SKIPPED
                bootlin-x86-64-musl [4/6]: OK
                 br-arm-full-static [5/6]: SKIPPED
                       sourcery-arm [6/6]: OK
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed


Best regards
 /Joachim

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

---
v3:
 - properly fix dependency handling
 - update package comment, depends on mmu
 - rearrange .mk slightly and add CPE vendor
 - update team kernel deps
 - drop team modes from kernel conf
 - update help with info on team modes
v2:
 - added missing libnl deps in libteam/Config.in

Joachim Wiberg (1):
  package/libteam: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-revert-disregard-current-state.patch | 51 +++++++++++++++++++
 .../0002-fix-build-on-openwrt-musl-libc.patch | 41 +++++++++++++++
 ...3-increase-wait-time-for-daemon-kill.patch | 37 ++++++++++++++
 package/libteam/Config.in                     | 30 +++++++++++
 package/libteam/libteam.hash                  |  3 ++
 package/libteam/libteam.mk                    | 24 +++++++++
 8 files changed, 188 insertions(+)
 create mode 100644 package/libteam/0001-revert-disregard-current-state.patch
 create mode 100644 package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
 create mode 100644 package/libteam/0003-increase-wait-time-for-daemon-kill.patch
 create mode 100644 package/libteam/Config.in
 create mode 100644 package/libteam/libteam.hash
 create mode 100644 package/libteam/libteam.mk

-- 
2.25.1
