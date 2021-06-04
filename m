From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jun 2021 23:40:55 +0200
Subject: [Buildroot] [git commit] package/lvm2: disable parallel build
Message-ID: <20210604211734.7CB12836F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bedd8420786b184f4aec4433800083a3468cfe1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Parallel build is broken since bump to version 2.03.12 in commit
80997acd35. Commits 4526078d1b, 8a313b019c, and a7186cd1ea tried to fix
that by only installing systemd units when appropriate.

It turns out that there are more cases where parallel build still fails:

    http://autobuild.buildroot.org/results/995/995f46ee0033e34261ba7b24b61c41e7a088602b/

    >>> lvm2 2.03.12 Installing to staging directory
    [...]
        [INSTALL] ioctl/libdevmapper.so
        [CC] dmsetup.c
    /usr/bin/make -C lib install_device-mapper
        [CC] dmsetup.c
    [...]
        [CC] dmsetup
        [CC] dmsetup
    /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/Scrt1.o: in function `_start':
    (.text+0x54): undefined reference to `main'
    collect2: error: ld returned 1 exit status
    Makefile:60: recipe for target 'dmsetup' failed

Or:

    http://autobuild.buildroot.org/results/a4e/a4ea87da502272dc2e677123b6fbcb0c23106f0b/

    >>> lvm2 2.03.12 Installing to staging directory
    [...]
        [CC] dmsetup
    /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/lib/Scrt1.o: in function `_start_c':
    Scrt1.c:(.text._start_c+0x5c): undefined reference to `main'
    collect2: error: ld returned 1 exit status
    make[3]: *** [Makefile:61: dmsetup] Error 1
    make[3]: Leaving directory '/home/giuliobenetti/autobuild/run/instance-3/output-1/build/lvm2-2.03.12/libdm/dm-tools'
    make[2]: *** [../libdm/make.tmpl:315: dm-tools.device-mapper] Error 2
    make[2]: *** Waiting for unfinished jobs....
        [CC] dmsetup
        [INSTALL] dmsetup
    [...]

Similar traces in either case: it tries to build dmsetup twice, at
intall time instead of build time.

Fixes:
  - http://autobuild.buildroot.org/results/995/995f46ee0033e34261ba7b24b61c41e7a088602b/
  - http://autobuild.buildroot.org/results/a4e/a4ea87da502272dc2e677123b6fbcb0c23106f0b/

Note that this is just a workaround for a broken buildsystem anyway:
indeed, the build of dmsetup is done at install time, instead of build
time. More fixes should be worked on with upstream to properly fix the
issue...

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - update after the three partial fix-commits
  - extend commit log accordingly
  - add new upstream failures
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lvm2/lvm2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 5ce79768b6..6726e165b1 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -11,6 +11,8 @@ LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
 LVM2_CPE_ID_PRODUCT = redhat
+# parallel build issues
+LVM2_MAKE = $(MAKE1)
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner. We disable NLS because it's broken, and
