From: Dmytro Milinevskyy <milinevskyy@gmail.com>
Date: Wed, 16 Jun 2010 23:25:09 +0300
Subject: [Buildroot] [PATCH 0/2]  skeleton reorganization patchset
Message-ID: <4c1933c5.0b4ddf0a.0de4.6a7a@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This is a patchset for the reorganization of target rootfs skeleton.
First one moves target/generic/target_skeleton to fs/skeleton, makes it default and drops busybox skeleton
Second patch adds option to define path to detault skeleton used for the build

Changes from previos attempt:
 - Indentation according to Thomas suggestion

Regards,

-- Dmytro Milinevskyy


Dmytro Milinevskyy (2):
  [skeleton] move default skeleton to fs/ and drop busybox skeleton
  [skeleton] option to define path to custom rootfs skeleton

 Makefile                                           |    5 +
 configs/at91rm9200df_defconfig                     |    1 -
 configs/at91rm9200df_ext_defconfig                 |    1 -
 configs/at91sam9260dfc_defconfig                   |    1 -
 configs/at91sam9260dfc_ext_defconfig               |    1 -
 configs/at91sam9260pf_defconfig                    |    1 -
 configs/at91sam9261ek_defconfig                    |    1 -
 configs/at91sam9261ek_ext_defconfig                |    1 -
 configs/at91sam9263ek_defconfig                    |    1 -
 configs/at91sam9263ek_ext_defconfig                |    1 -
 configs/at91sam9g20dfc_defconfig                   |    1 -
 configs/at91sam9g20dfc_ext_defconfig               |    1 -
 configs/atngw100-base_defconfig                    |    1 -
 configs/atngw100_defconfig                         |    1 -
 configs/atstk1005_defconfig                        |    1 -
 configs/atstk100x_defconfig                        |    1 -
 configs/i386_defconfig                             |    1 -
 configs/i686_defconfig                             |    1 -
 configs/integrator926_defconfig                    |    1 -
 configs/integrator926_huge_defconfig               |    1 -
 configs/kb9202_defconfig                           |    1 -
 configs/v100sc2_defconfig                          |    1 -
 fs/Config.in                                       |   23 ++
 fs/skeleton/dev/log                                |    1 +
 fs/skeleton/etc/TZ                                 |    1 +
 fs/skeleton/etc/fstab                              |    8 +
 fs/skeleton/etc/group                              |   17 ++
 fs/skeleton/etc/hostname                           |    1 +
 fs/skeleton/etc/hosts                              |    1 +
 fs/skeleton/etc/init.d/S20urandom                  |   54 ++++
 fs/skeleton/etc/init.d/S40network                  |   25 ++
 fs/skeleton/etc/init.d/rcS                         |   27 ++
 fs/skeleton/etc/inittab                            |   46 +++
 fs/skeleton/etc/inputrc                            |   44 +++
 fs/skeleton/etc/issue                              |    3 +
 fs/skeleton/etc/mtab                               |    1 +
 fs/skeleton/etc/network/interfaces                 |    4 +
 fs/skeleton/etc/passwd                             |   15 +
 fs/skeleton/etc/profile                            |   48 +++
 fs/skeleton/etc/protocols                          |   31 ++
 fs/skeleton/etc/random-seed                        |  Bin 0 -> 512 bytes
 fs/skeleton/etc/resolv.conf                        |    1 +
 fs/skeleton/etc/securetty                          |   35 +++
 fs/skeleton/etc/services                           |  302 ++++++++++++++++++++
 fs/skeleton/etc/shadow                             |   12 +
 fs/skeleton/root/.bash_logout                      |    7 +
 fs/skeleton/root/.bash_profile                     |   15 +
 fs/skeleton/root/.bashrc                           |   48 +++
 fs/skeleton/usr/share/udhcpc/default.script        |   39 +++
 fs/skeleton/var/cache                              |    1 +
 fs/skeleton/var/lib/pcmcia                         |    1 +
 fs/skeleton/var/lock                               |    1 +
 fs/skeleton/var/log                                |    1 +
 fs/skeleton/var/pcmcia                             |    1 +
 fs/skeleton/var/run                                |    1 +
 fs/skeleton/var/spool                              |    1 +
 fs/skeleton/var/tmp                                |    1 +
 package/busybox/Config.in                          |    6 -
 package/busybox/busybox.mk                         |    4 -
 target/generic/Makefile.in                         |    7 -
 target/generic/target_busybox_skeleton/etc/TZ      |    1 -
 target/generic/target_busybox_skeleton/etc/fstab   |    8 -
 target/generic/target_busybox_skeleton/etc/group   |   16 -
 .../generic/target_busybox_skeleton/etc/hostname   |    1 -
 target/generic/target_busybox_skeleton/etc/hosts   |    1 -
 .../target_busybox_skeleton/etc/init.d/S20urandom  |   54 ----
 .../target_busybox_skeleton/etc/init.d/S40network  |   25 --
 .../generic/target_busybox_skeleton/etc/init.d/rcS |   27 --
 target/generic/target_busybox_skeleton/etc/inittab |   51 ----
 target/generic/target_busybox_skeleton/etc/inputrc |   44 ---
 target/generic/target_busybox_skeleton/etc/issue   |    3 -
 target/generic/target_busybox_skeleton/etc/mtab    |    1 -
 .../target_busybox_skeleton/etc/network/interfaces |    4 -
 target/generic/target_busybox_skeleton/etc/passwd  |   15 -
 target/generic/target_busybox_skeleton/etc/profile |   48 ---
 .../generic/target_busybox_skeleton/etc/protocols  |   31 --
 .../target_busybox_skeleton/etc/random-seed        |  Bin 512 -> 0 bytes
 .../target_busybox_skeleton/etc/resolv.conf        |    1 -
 .../generic/target_busybox_skeleton/etc/securetty  |   35 ---
 .../generic/target_busybox_skeleton/etc/services   |  302 --------------------
 target/generic/target_busybox_skeleton/etc/shadow  |   12 -
 target/generic/target_busybox_skeleton/var/cache   |    1 -
 .../generic/target_busybox_skeleton/var/lib/pcmcia |    1 -
 target/generic/target_busybox_skeleton/var/lock    |    1 -
 target/generic/target_busybox_skeleton/var/log     |    1 -
 target/generic/target_busybox_skeleton/var/pcmcia  |    1 -
 target/generic/target_busybox_skeleton/var/run     |    1 -
 target/generic/target_busybox_skeleton/var/spool   |    1 -
 target/generic/target_busybox_skeleton/var/tmp     |    1 -
 target/generic/target_skeleton/dev/log             |    1 -
 target/generic/target_skeleton/etc/TZ              |    1 -
 target/generic/target_skeleton/etc/fstab           |    8 -
 target/generic/target_skeleton/etc/group           |   17 --
 target/generic/target_skeleton/etc/hostname        |    1 -
 target/generic/target_skeleton/etc/hosts           |    1 -
 .../generic/target_skeleton/etc/init.d/S20urandom  |   54 ----
 .../generic/target_skeleton/etc/init.d/S40network  |   25 --
 target/generic/target_skeleton/etc/init.d/rcS      |   27 --
 target/generic/target_skeleton/etc/inittab         |   46 ---
 target/generic/target_skeleton/etc/inputrc         |   44 ---
 target/generic/target_skeleton/etc/issue           |    3 -
 target/generic/target_skeleton/etc/mtab            |    1 -
 .../generic/target_skeleton/etc/network/interfaces |    4 -
 target/generic/target_skeleton/etc/passwd          |   15 -
 target/generic/target_skeleton/etc/profile         |   48 ---
 target/generic/target_skeleton/etc/protocols       |   31 --
 target/generic/target_skeleton/etc/random-seed     |  Bin 512 -> 0 bytes
 target/generic/target_skeleton/etc/resolv.conf     |    1 -
 target/generic/target_skeleton/etc/securetty       |   35 ---
 target/generic/target_skeleton/etc/services        |  302 --------------------
 target/generic/target_skeleton/etc/shadow          |   12 -
 target/generic/target_skeleton/root/.bash_logout   |    7 -
 target/generic/target_skeleton/root/.bash_profile  |   15 -
 target/generic/target_skeleton/root/.bashrc        |   48 ---
 .../usr/share/udhcpc/default.script                |   39 ---
 target/generic/target_skeleton/var/cache           |    1 -
 target/generic/target_skeleton/var/lib/pcmcia      |    1 -
 target/generic/target_skeleton/var/lock            |    1 -
 target/generic/target_skeleton/var/log             |    1 -
 target/generic/target_skeleton/var/pcmcia          |    1 -
 target/generic/target_skeleton/var/run             |    1 -
 target/generic/target_skeleton/var/spool           |    1 -
 target/generic/target_skeleton/var/tmp             |    1 -
 123 files changed, 822 insertions(+), 1520 deletions(-)
 create mode 100644 fs/skeleton/bin/.empty
 create mode 120000 fs/skeleton/dev/log
 create mode 100644 fs/skeleton/dev/pts/.empty
 create mode 100644 fs/skeleton/etc/TZ
 create mode 100644 fs/skeleton/etc/fstab
 create mode 100644 fs/skeleton/etc/group
 create mode 100644 fs/skeleton/etc/hostname
 create mode 100644 fs/skeleton/etc/hosts
 create mode 100755 fs/skeleton/etc/init.d/S20urandom
 create mode 100755 fs/skeleton/etc/init.d/S40network
 create mode 100755 fs/skeleton/etc/init.d/rcS
 create mode 100644 fs/skeleton/etc/inittab
 create mode 100644 fs/skeleton/etc/inputrc
 create mode 100644 fs/skeleton/etc/issue
 create mode 100644 fs/skeleton/etc/ld.so.conf.d/.empty
 create mode 120000 fs/skeleton/etc/mtab
 create mode 100644 fs/skeleton/etc/network/interfaces
 create mode 100644 fs/skeleton/etc/passwd
 create mode 100644 fs/skeleton/etc/profile
 create mode 100644 fs/skeleton/etc/protocols
 create mode 100644 fs/skeleton/etc/random-seed
 create mode 120000 fs/skeleton/etc/resolv.conf
 create mode 100644 fs/skeleton/etc/securetty
 create mode 100644 fs/skeleton/etc/services
 create mode 100644 fs/skeleton/etc/shadow
 create mode 100644 fs/skeleton/home/.empty
 create mode 100644 fs/skeleton/lib/.empty
 create mode 100644 fs/skeleton/mnt/.empty
 create mode 100644 fs/skeleton/opt/.empty
 create mode 100644 fs/skeleton/proc/.empty
 create mode 100644 fs/skeleton/root/.bash_history
 create mode 100644 fs/skeleton/root/.bash_logout
 create mode 100644 fs/skeleton/root/.bash_profile
 create mode 100644 fs/skeleton/root/.bashrc
 create mode 100644 fs/skeleton/root/.empty
 create mode 100644 fs/skeleton/sbin/.empty
 create mode 100644 fs/skeleton/sys/.empty
 create mode 100644 fs/skeleton/tmp/.empty
 create mode 100644 fs/skeleton/usr/bin/.empty
 create mode 100644 fs/skeleton/usr/lib/.empty
 create mode 100644 fs/skeleton/usr/sbin/.empty
 create mode 100755 fs/skeleton/usr/share/udhcpc/default.script
 create mode 120000 fs/skeleton/var/cache
 create mode 120000 fs/skeleton/var/lib/pcmcia
 create mode 120000 fs/skeleton/var/lock
 create mode 120000 fs/skeleton/var/log
 create mode 120000 fs/skeleton/var/pcmcia
 create mode 120000 fs/skeleton/var/run
 create mode 120000 fs/skeleton/var/spool
 create mode 120000 fs/skeleton/var/tmp
 delete mode 100644 target/generic/target_busybox_skeleton/dev/.empty
 delete mode 100644 target/generic/target_busybox_skeleton/etc/TZ
 delete mode 100644 target/generic/target_busybox_skeleton/etc/fstab
 delete mode 100644 target/generic/target_busybox_skeleton/etc/group
 delete mode 100644 target/generic/target_busybox_skeleton/etc/hostname
 delete mode 100644 target/generic/target_busybox_skeleton/etc/hosts
 delete mode 100755 target/generic/target_busybox_skeleton/etc/init.d/S20urandom
 delete mode 100755 target/generic/target_busybox_skeleton/etc/init.d/S40network
 delete mode 100755 target/generic/target_busybox_skeleton/etc/init.d/rcS
 delete mode 100644 target/generic/target_busybox_skeleton/etc/inittab
 delete mode 100644 target/generic/target_busybox_skeleton/etc/inputrc
 delete mode 100644 target/generic/target_busybox_skeleton/etc/issue
 delete mode 120000 target/generic/target_busybox_skeleton/etc/mtab
 delete mode 100644 target/generic/target_busybox_skeleton/etc/network/interfaces
 delete mode 100644 target/generic/target_busybox_skeleton/etc/passwd
 delete mode 100644 target/generic/target_busybox_skeleton/etc/profile
 delete mode 100644 target/generic/target_busybox_skeleton/etc/protocols
 delete mode 100644 target/generic/target_busybox_skeleton/etc/random-seed
 delete mode 120000 target/generic/target_busybox_skeleton/etc/resolv.conf
 delete mode 100644 target/generic/target_busybox_skeleton/etc/securetty
 delete mode 100644 target/generic/target_busybox_skeleton/etc/services
 delete mode 100644 target/generic/target_busybox_skeleton/etc/shadow
 delete mode 100644 target/generic/target_busybox_skeleton/proc/.empty
 delete mode 100644 target/generic/target_busybox_skeleton/root/.empty
 delete mode 100644 target/generic/target_busybox_skeleton/sys/.empty
 delete mode 100644 target/generic/target_busybox_skeleton/tmp/.empty
 delete mode 100644 target/generic/target_busybox_skeleton/usr/sbin/.empty
 delete mode 120000 target/generic/target_busybox_skeleton/var/cache
 delete mode 120000 target/generic/target_busybox_skeleton/var/lib/pcmcia
 delete mode 120000 target/generic/target_busybox_skeleton/var/lock
 delete mode 120000 target/generic/target_busybox_skeleton/var/log
 delete mode 120000 target/generic/target_busybox_skeleton/var/pcmcia
 delete mode 120000 target/generic/target_busybox_skeleton/var/run
 delete mode 120000 target/generic/target_busybox_skeleton/var/spool
 delete mode 120000 target/generic/target_busybox_skeleton/var/tmp
 delete mode 100644 target/generic/target_skeleton/bin/.empty
 delete mode 120000 target/generic/target_skeleton/dev/log
 delete mode 100644 target/generic/target_skeleton/dev/pts/.empty
 delete mode 100644 target/generic/target_skeleton/etc/TZ
 delete mode 100644 target/generic/target_skeleton/etc/fstab
 delete mode 100644 target/generic/target_skeleton/etc/group
 delete mode 100644 target/generic/target_skeleton/etc/hostname
 delete mode 100644 target/generic/target_skeleton/etc/hosts
 delete mode 100755 target/generic/target_skeleton/etc/init.d/S20urandom
 delete mode 100755 target/generic/target_skeleton/etc/init.d/S40network
 delete mode 100755 target/generic/target_skeleton/etc/init.d/rcS
 delete mode 100644 target/generic/target_skeleton/etc/inittab
 delete mode 100644 target/generic/target_skeleton/etc/inputrc
 delete mode 100644 target/generic/target_skeleton/etc/issue
 delete mode 100644 target/generic/target_skeleton/etc/ld.so.conf.d/.empty
 delete mode 120000 target/generic/target_skeleton/etc/mtab
 delete mode 100644 target/generic/target_skeleton/etc/network/interfaces
 delete mode 100644 target/generic/target_skeleton/etc/passwd
 delete mode 100644 target/generic/target_skeleton/etc/profile
 delete mode 100644 target/generic/target_skeleton/etc/protocols
 delete mode 100644 target/generic/target_skeleton/etc/random-seed
 delete mode 120000 target/generic/target_skeleton/etc/resolv.conf
 delete mode 100644 target/generic/target_skeleton/etc/securetty
 delete mode 100644 target/generic/target_skeleton/etc/services
 delete mode 100644 target/generic/target_skeleton/etc/shadow
 delete mode 100644 target/generic/target_skeleton/home/.empty
 delete mode 100644 target/generic/target_skeleton/lib/.empty
 delete mode 100644 target/generic/target_skeleton/mnt/.empty
 delete mode 100644 target/generic/target_skeleton/opt/.empty
 delete mode 100644 target/generic/target_skeleton/proc/.empty
 delete mode 100644 target/generic/target_skeleton/root/.bash_history
 delete mode 100644 target/generic/target_skeleton/root/.bash_logout
 delete mode 100644 target/generic/target_skeleton/root/.bash_profile
 delete mode 100644 target/generic/target_skeleton/root/.bashrc
 delete mode 100644 target/generic/target_skeleton/root/.empty
 delete mode 100644 target/generic/target_skeleton/sbin/.empty
 delete mode 100644 target/generic/target_skeleton/sys/.empty
 delete mode 100644 target/generic/target_skeleton/tmp/.empty
 delete mode 100644 target/generic/target_skeleton/usr/bin/.empty
 delete mode 100644 target/generic/target_skeleton/usr/lib/.empty
 delete mode 100644 target/generic/target_skeleton/usr/sbin/.empty
 delete mode 100755 target/generic/target_skeleton/usr/share/udhcpc/default.script
 delete mode 120000 target/generic/target_skeleton/var/cache
 delete mode 120000 target/generic/target_skeleton/var/lib/pcmcia
 delete mode 120000 target/generic/target_skeleton/var/lock
 delete mode 120000 target/generic/target_skeleton/var/log
 delete mode 120000 target/generic/target_skeleton/var/pcmcia
 delete mode 120000 target/generic/target_skeleton/var/run
 delete mode 120000 target/generic/target_skeleton/var/spool
 delete mode 120000 target/generic/target_skeleton/var/tmp
