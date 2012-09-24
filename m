From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Sep 2012 08:34:28 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch
	remove-target-dir
Message-ID: <cover.1348468443.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The goal of this branch is to get rid of the target/ directory, which
has now become mostly useless since the Xtensa architecture has been
removed.

 * Patch 1 creates a new top-level directory called 'system' to store
   the default device table, the default skeleton, and system-wide
   configuration options.

 * Patch 2 removes the last file from target/, Config.in.arch, by
   splitting it into smaller chunks into a new top-level arch/
   directory.

 * Patch 3 improves the organization of files in arch/ by moving all
   the gcc mtune, march, mcpu and al. definitions to each
   architecture-specific file rather than having a big
   Config.in.common file for those definitions. Idea given by Yann
   E. Morin.

Changes from v1:

 * Get rid of the Xtensa removal patch, since it has been applied.

 * Squash the patch remove target/Makefile.in into the patch moving
   stuff into system/, since it was causing bisection breakage.

 * Implement Yann's idea on how to implement nicely the definition of
   the gcc mtune, mcpu, march and al. values.

Best regards,

Thomas

The following changes since commit 90f908f21e4f7b1b7dd0c4c44515db67f441dcc3:

  xlsclient: unbreak build (2012-09-23 21:27:13 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git remove-target-dir

for you to fetch changes up to a9b004ff67d93f81796aa2a6a10734cf1d59ccf2:

  arch: improve definition of gcc mtune, mcpu, etc. (2012-09-24 08:17:46 +0200)

----------------------------------------------------------------
Thomas Petazzoni (3):
      New top-level directory: system
      Split target/Config.in.arch into multiple Config.in.* in arch/
      arch: improve definition of gcc mtune, mcpu, etc.

 Config.in                                          |    4 +-
 Makefile                                           |    2 +-
 arch/Config.in                                     |  201 +++++
 arch/Config.in.arm                                 |  114 +++
 arch/Config.in.avr32                               |    5 +
 arch/Config.in.bfin                                |   16 +
 fs/skeleton/bin/.empty => arch/Config.in.common    |    0
 arch/Config.in.m68k                                |   21 +
 arch/Config.in.microblaze                          |   10 +
 arch/Config.in.mips                                |   79 ++
 arch/Config.in.powerpc                             |  128 +++
 arch/Config.in.sh                                  |   41 +
 arch/Config.in.sparc                               |   69 ++
 arch/Config.in.x86                                 |  235 ++++++
 {target/generic => system}/Config.in               |    2 +-
 {target/generic => system}/device_table.txt        |    0
 {target/generic => system}/device_table_dev.txt    |    0
 .../dev/pts => system/skeleton/bin}/.empty         |    0
 {fs => system}/skeleton/dev/log                    |    0
 .../skeleton/dev/pts}/.empty                       |    0
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
 .../skeleton/etc/ld.so.conf.d}/.empty              |    0
 {fs => system}/skeleton/etc/mtab                   |    0
 .../skeleton/etc/network/if-down.d}/.empty         |    0
 .../skeleton/etc/network/if-post-down.d}/.empty    |    0
 .../skeleton/etc/network/if-pre-up.d}/.empty       |    0
 .../skeleton/etc/network/if-up.d}/.empty           |    0
 {fs => system}/skeleton/etc/network/interfaces     |    0
 {fs => system}/skeleton/etc/passwd                 |    0
 {fs => system}/skeleton/etc/profile                |    0
 {fs => system}/skeleton/etc/protocols              |    0
 {fs => system}/skeleton/etc/random-seed            |  Bin 512 -> 512 bytes
 {fs => system}/skeleton/etc/resolv.conf            |    0
 {fs => system}/skeleton/etc/securetty              |    0
 {fs => system}/skeleton/etc/services               |    0
 {fs => system}/skeleton/etc/shadow                 |    0
 .../lib => system/skeleton/home/ftp}/.empty        |    0
 {fs/skeleton/media => system/skeleton/lib}/.empty  |    0
 {fs/skeleton/mnt => system/skeleton/media}/.empty  |    0
 {fs/skeleton/opt => system/skeleton/mnt}/.empty    |    0
 {fs/skeleton/proc => system/skeleton/opt}/.empty   |    0
 {fs/skeleton/root => system/skeleton/proc}/.empty  |    0
 {fs => system}/skeleton/root/.bash_history         |    0
 {fs => system}/skeleton/root/.bash_logout          |    0
 {fs => system}/skeleton/root/.bash_profile         |    0
 {fs/skeleton/sbin => system/skeleton/root}/.empty  |    0
 {fs => system}/skeleton/run                        |    0
 {fs/skeleton/sys => system/skeleton/sbin}/.empty   |    0
 {fs/skeleton/tmp => system/skeleton/sys}/.empty    |    0
 .../usr/bin => system/skeleton/tmp}/.empty         |    0
 .../usr/lib => system/skeleton/usr/bin}/.empty     |    0
 .../usr/sbin => system/skeleton/usr/lib}/.empty    |    0
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
 target/Config.in.arch                              |  822 --------------------
 target/Makefile.in                                 |    3 -
 75 files changed, 923 insertions(+), 829 deletions(-)
 create mode 100644 arch/Config.in
 create mode 100644 arch/Config.in.arm
 create mode 100644 arch/Config.in.avr32
 create mode 100644 arch/Config.in.bfin
 rename fs/skeleton/bin/.empty => arch/Config.in.common (100%)
 create mode 100644 arch/Config.in.m68k
 create mode 100644 arch/Config.in.microblaze
 create mode 100644 arch/Config.in.mips
 create mode 100644 arch/Config.in.powerpc
 create mode 100644 arch/Config.in.sh
 create mode 100644 arch/Config.in.sparc
 create mode 100644 arch/Config.in.x86
 rename {target/generic => system}/Config.in (99%)
 rename {target/generic => system}/device_table.txt (100%)
 rename {target/generic => system}/device_table_dev.txt (100%)
 rename {fs/skeleton/dev/pts => system/skeleton/bin}/.empty (100%)
 rename {fs => system}/skeleton/dev/log (100%)
 rename {fs/skeleton/etc/ld.so.conf.d => system/skeleton/dev/pts}/.empty (100%)
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
 rename {fs/skeleton/etc/network/if-down.d => system/skeleton/etc/ld.so.conf.d}/.empty (100%)
 rename {fs => system}/skeleton/etc/mtab (100%)
 rename {fs/skeleton/etc/network/if-post-down.d => system/skeleton/etc/network/if-down.d}/.empty (100%)
 rename {fs/skeleton/etc/network/if-pre-up.d => system/skeleton/etc/network/if-post-down.d}/.empty (100%)
 rename {fs/skeleton/etc/network/if-up.d => system/skeleton/etc/network/if-pre-up.d}/.empty (100%)
 rename {fs/skeleton/home/ftp => system/skeleton/etc/network/if-up.d}/.empty (100%)
 rename {fs => system}/skeleton/etc/network/interfaces (100%)
 rename {fs => system}/skeleton/etc/passwd (100%)
 rename {fs => system}/skeleton/etc/profile (100%)
 rename {fs => system}/skeleton/etc/protocols (100%)
 rename {fs => system}/skeleton/etc/random-seed (100%)
 rename {fs => system}/skeleton/etc/resolv.conf (100%)
 rename {fs => system}/skeleton/etc/securetty (100%)
 rename {fs => system}/skeleton/etc/services (100%)
 rename {fs => system}/skeleton/etc/shadow (100%)
 rename {fs/skeleton/lib => system/skeleton/home/ftp}/.empty (100%)
 rename {fs/skeleton/media => system/skeleton/lib}/.empty (100%)
 rename {fs/skeleton/mnt => system/skeleton/media}/.empty (100%)
 rename {fs/skeleton/opt => system/skeleton/mnt}/.empty (100%)
 rename {fs/skeleton/proc => system/skeleton/opt}/.empty (100%)
 rename {fs/skeleton/root => system/skeleton/proc}/.empty (100%)
 rename {fs => system}/skeleton/root/.bash_history (100%)
 rename {fs => system}/skeleton/root/.bash_logout (100%)
 rename {fs => system}/skeleton/root/.bash_profile (100%)
 rename {fs/skeleton/sbin => system/skeleton/root}/.empty (100%)
 rename {fs => system}/skeleton/run (100%)
 rename {fs/skeleton/sys => system/skeleton/sbin}/.empty (100%)
 rename {fs/skeleton/tmp => system/skeleton/sys}/.empty (100%)
 rename {fs/skeleton/usr/bin => system/skeleton/tmp}/.empty (100%)
 rename {fs/skeleton/usr/lib => system/skeleton/usr/bin}/.empty (100%)
 rename {fs/skeleton/usr/sbin => system/skeleton/usr/lib}/.empty (100%)
 create mode 100644 system/skeleton/usr/sbin/.empty
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

Thanks,
-- 
Thomas Petazzoni
