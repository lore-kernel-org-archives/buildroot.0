From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Sep 2012 16:04:05 +0200
Subject: [Buildroot] [pull request] Remove Xtensa architecture and target/
	directory
Message-ID: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The goal of this branch is to get rid of the Xtensa architecture, and
then get rid of the target/ directory, which becomes mostly useless
once the Xtensa architecture has been removed.

 * Patch 1 removes the Xtensa architecture and all related files and
   references in Buildroot. It allows to review a bunch of special
   stuff here and there which were annoying. The Xtensa architecture
   has been introduced a few years ago in Buildroot, and has never
   been maintained since then, despite being marked deprecated since
   several months.

 * Patch 2 creates a new top-level directory called 'system' to store
   the default device table, the default skeleton, and system-wide
   configuration options.

 * Patch 3 removes an useless file in target/

 * Patch 4 removes the last file from target/, Config.in.arch, by
   splitting it into smaller chunks into a new top-level arch/
   directory.

Note that Patch 1 can be applied independently of the last three
patches, which may require more discussion.

Best regards,

Thomas

The following changes since commit 27045cde7d18f6132ab804ed30673e3fb3961879:

  gcc: default to 4.6.x (2012-09-04 13:28:03 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git remove-xtensa-and-target-dir

for you to fetch changes up to bf030fb668c9608de1f3e99bac17bf300ad59c67:

  Split target/Config.in.arch into multiple Config.in.* in arch/ (2012-09-04 15:50:57 +0200)

----------------------------------------------------------------
Thomas Petazzoni (4):
      Remove the Xtensa architecture
      New top-level directory: system
      Remove target/Makefile.in, now useless
      Split target/Config.in.arch into multiple Config.in.* in arch/

 Config.in                                          |    4 +-
 Makefile                                           |    5 +-
 arch/Config.in                                     |    9 +
 arch/Config.in.arches                              |  129 +++
 arch/Config.in.arm                                 |   83 ++
 arch/Config.in.bfin                                |   10 +
 arch/Config.in.common                              |  245 ++++++
 arch/Config.in.mips                                |   57 ++
 arch/Config.in.powerpc                             |   83 ++
 arch/Config.in.sh                                  |   24 +
 arch/Config.in.sparc                               |   43 +
 arch/Config.in.x86                                 |  146 ++++
 linux/Config.in                                    |    2 +-
 package/ltrace/Config.in                           |    2 +-
 {target/generic => system}/Config.in               |    2 +-
 {target/generic => system}/device_table.txt        |    0
 {target/generic => system}/device_table_dev.txt    |    0
 {fs => system}/skeleton/bin/.empty                 |    0
 {fs => system}/skeleton/dev/log                    |    0
 {fs => system}/skeleton/dev/pts/.empty             |    0
 {fs => system}/skeleton/etc/TZ                     |    0
 {fs => system}/skeleton/etc/fstab                  |    0
 {fs => system}/skeleton/etc/group                  |    0
 {fs => system}/skeleton/etc/hostname               |    0
 {fs => system}/skeleton/etc/hosts                  |    0
 {fs => system}/skeleton/etc/init.d/S20urandom      |    0
 {fs => system}/skeleton/etc/init.d/S40network      |    0
 {fs => system}/skeleton/etc/init.d/rcK             |    0
 {fs => system}/skeleton/etc/init.d/rcS             |    0
 {fs => system}/skeleton/etc/inittab                |    0
 {fs => system}/skeleton/etc/inputrc                |    0
 {fs => system}/skeleton/etc/issue                  |    0
 {fs => system}/skeleton/etc/ld.so.conf.d/.empty    |    0
 {fs => system}/skeleton/etc/mtab                   |    0
 .../skeleton/etc/network/if-down.d/.empty          |    0
 .../skeleton/etc/network/if-post-down.d/.empty     |    0
 .../skeleton/etc/network/if-pre-up.d/.empty        |    0
 {fs => system}/skeleton/etc/network/if-up.d/.empty |    0
 {fs => system}/skeleton/etc/network/interfaces     |    0
 {fs => system}/skeleton/etc/passwd                 |    0
 {fs => system}/skeleton/etc/profile                |    0
 {fs => system}/skeleton/etc/protocols              |    0
 {fs => system}/skeleton/etc/random-seed            |  Bin 512 -> 512 bytes
 {fs => system}/skeleton/etc/resolv.conf            |    0
 {fs => system}/skeleton/etc/securetty              |    0
 {fs => system}/skeleton/etc/services               |    0
 {fs => system}/skeleton/etc/shadow                 |    0
 {fs => system}/skeleton/home/ftp/.empty            |    0
 {fs => system}/skeleton/lib/.empty                 |    0
 {fs => system}/skeleton/media/.empty               |    0
 {fs => system}/skeleton/mnt/.empty                 |    0
 {fs => system}/skeleton/opt/.empty                 |    0
 {fs => system}/skeleton/proc/.empty                |    0
 {fs => system}/skeleton/root/.bash_history         |    0
 {fs => system}/skeleton/root/.bash_logout          |    0
 {fs => system}/skeleton/root/.bash_profile         |    0
 {fs => system}/skeleton/root/.empty                |    0
 {fs => system}/skeleton/run                        |    0
 {fs => system}/skeleton/sbin/.empty                |    0
 {fs => system}/skeleton/sys/.empty                 |    0
 {fs => system}/skeleton/tmp/.empty                 |    0
 {fs => system}/skeleton/usr/bin/.empty             |    0
 {fs => system}/skeleton/usr/lib/.empty             |    0
 {fs => system}/skeleton/usr/sbin/.empty            |    0
 {fs => system}/skeleton/var/cache                  |    0
 {fs => system}/skeleton/var/lib/misc               |    0
 {fs => system}/skeleton/var/lib/pcmcia             |    0
 {fs => system}/skeleton/var/lock                   |    0
 {fs => system}/skeleton/var/log                    |    0
 {fs => system}/skeleton/var/pcmcia                 |    0
 {fs => system}/skeleton/var/run                    |    0
 {fs => system}/skeleton/var/spool                  |    0
 {fs => system}/skeleton/var/tmp                    |    0
 target/generic/Makefile.in => system/system.mk     |    0
 target/Config.in.arch                              |  878 --------------------
 target/Makefile.in                                 |    3 -
 target/device/xtensa/device_table.txt              |  189 -----
 target/xtensa/.gitignore                           |    1 -
 target/xtensa/Makefile.in                          |    1 -
 target/xtensa/defconfig                            |  129 ---
 target/xtensa/patch.in                             |   33 -
 target/xtensa/setup-config                         |   57 --
 target/xtensa/uClibc-0.9.30.config                 |  245 ------
 target/xtensa/uClibc.config                        |  190 -----
 target/xtensa/xt-buildroot-overlay-install         |  488 -----------
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    7 +-
 toolchain/gdb/gdb.mk                               |    7 +-
 toolchain/toolchain-common.in                      |    2 +-
 toolchain/uClibc/uclibc.mk                         |    1 -
 89 files changed, 838 insertions(+), 2237 deletions(-)
 create mode 100644 arch/Config.in
 create mode 100644 arch/Config.in.arches
 create mode 100644 arch/Config.in.arm
 create mode 100644 arch/Config.in.bfin
 create mode 100644 arch/Config.in.common
 create mode 100644 arch/Config.in.mips
 create mode 100644 arch/Config.in.powerpc
 create mode 100644 arch/Config.in.sh
 create mode 100644 arch/Config.in.sparc
 create mode 100644 arch/Config.in.x86
 rename {target/generic => system}/Config.in (99%)
 rename {target/generic => system}/device_table.txt (100%)
 rename {target/generic => system}/device_table_dev.txt (100%)
 rename {fs => system}/skeleton/bin/.empty (100%)
 rename {fs => system}/skeleton/dev/log (100%)
 rename {fs => system}/skeleton/dev/pts/.empty (100%)
 rename {fs => system}/skeleton/etc/TZ (100%)
 rename {fs => system}/skeleton/etc/fstab (100%)
 rename {fs => system}/skeleton/etc/group (100%)
 rename {fs => system}/skeleton/etc/hostname (100%)
 rename {fs => system}/skeleton/etc/hosts (100%)
 rename {fs => system}/skeleton/etc/init.d/S20urandom (100%)
 rename {fs => system}/skeleton/etc/init.d/S40network (100%)
 rename {fs => system}/skeleton/etc/init.d/rcK (100%)
 rename {fs => system}/skeleton/etc/init.d/rcS (100%)
 rename {fs => system}/skeleton/etc/inittab (100%)
 rename {fs => system}/skeleton/etc/inputrc (100%)
 rename {fs => system}/skeleton/etc/issue (100%)
 rename {fs => system}/skeleton/etc/ld.so.conf.d/.empty (100%)
 rename {fs => system}/skeleton/etc/mtab (100%)
 rename {fs => system}/skeleton/etc/network/if-down.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-post-down.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-pre-up.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-up.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/interfaces (100%)
 rename {fs => system}/skeleton/etc/passwd (100%)
 rename {fs => system}/skeleton/etc/profile (100%)
 rename {fs => system}/skeleton/etc/protocols (100%)
 rename {fs => system}/skeleton/etc/random-seed (100%)
 rename {fs => system}/skeleton/etc/resolv.conf (100%)
 rename {fs => system}/skeleton/etc/securetty (100%)
 rename {fs => system}/skeleton/etc/services (100%)
 rename {fs => system}/skeleton/etc/shadow (100%)
 rename {fs => system}/skeleton/home/ftp/.empty (100%)
 rename {fs => system}/skeleton/lib/.empty (100%)
 rename {fs => system}/skeleton/media/.empty (100%)
 rename {fs => system}/skeleton/mnt/.empty (100%)
 rename {fs => system}/skeleton/opt/.empty (100%)
 rename {fs => system}/skeleton/proc/.empty (100%)
 rename {fs => system}/skeleton/root/.bash_history (100%)
 rename {fs => system}/skeleton/root/.bash_logout (100%)
 rename {fs => system}/skeleton/root/.bash_profile (100%)
 rename {fs => system}/skeleton/root/.empty (100%)
 rename {fs => system}/skeleton/run (100%)
 rename {fs => system}/skeleton/sbin/.empty (100%)
 rename {fs => system}/skeleton/sys/.empty (100%)
 rename {fs => system}/skeleton/tmp/.empty (100%)
 rename {fs => system}/skeleton/usr/bin/.empty (100%)
 rename {fs => system}/skeleton/usr/lib/.empty (100%)
 rename {fs => system}/skeleton/usr/sbin/.empty (100%)
 rename {fs => system}/skeleton/var/cache (100%)
 rename {fs => system}/skeleton/var/lib/misc (100%)
 rename {fs => system}/skeleton/var/lib/pcmcia (100%)
 rename {fs => system}/skeleton/var/lock (100%)
 rename {fs => system}/skeleton/var/log (100%)
 rename {fs => system}/skeleton/var/pcmcia (100%)
 rename {fs => system}/skeleton/var/run (100%)
 rename {fs => system}/skeleton/var/spool (100%)
 rename {fs => system}/skeleton/var/tmp (100%)
 rename target/generic/Makefile.in => system/system.mk (100%)
 delete mode 100644 target/Config.in.arch
 delete mode 100644 target/Makefile.in
 delete mode 100644 target/device/xtensa/device_table.txt
 delete mode 100644 target/xtensa/.gitignore
 delete mode 100644 target/xtensa/Makefile.in
 delete mode 100644 target/xtensa/defconfig
 delete mode 100644 target/xtensa/patch.in
 delete mode 100644 target/xtensa/setup-config
 delete mode 100644 target/xtensa/uClibc-0.9.30.config
 delete mode 100644 target/xtensa/uClibc.config
 delete mode 100644 target/xtensa/xt-buildroot-overlay-install

Thanks,
-- 
Thomas Petazzoni
