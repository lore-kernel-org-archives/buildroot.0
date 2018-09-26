From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 27 Sep 2018 00:37:14 +0200
Subject: [Buildroot] [PATCH v3 0/5] grub2: add support for arm and aarch64
Message-ID: <20180926223719.12604-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds arm and aarch64 support to grub2.
First, a refactor of the recipe is performed, to better separate the
host and target builds, which right now are happening in the same step
and are confusing to deal with.
This is achieved by introducing host-grub2 to build the host tools and
just build everything to the target on the target grub2 package.

Then support is added for arm and aarch64, along with a new defconfig
that makes it used somewhere, and some documentation.

I've had this branch for such a long time, v2 was over a year ago, we
even discussed about this in last year's developer meeting.
I had already done some improvements there but unfortunately I don't
recall if all of the suggestions are here.
I finally took the time to rebase it and retest, sorry for the delay.
The most significant improvement since v2 is to drop grub2-tools and
concentrate everything on the grub2 package.

This time it was runtime tested with qemu and the aarch64_efi,
pc_x86_64_bios and pc_x86_64_efi defconfigs, as well as build tested
with test-pkg using all available configurations:

$ cat grub-test.config
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_INSTALL_TOOLS=y
$ utils/test-pkg -a -c grub-test.config -p grub2
                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: SKIPPED
                            br-arm-basic [ 5/47]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: OK
                      br-arm-full-static [11/47]: OK
                   br-i386-pentium4-full [12/47]: OK
                br-i386-pentium-mmx-musl [13/47]: OK
                       br-m68k-5208-full [14/47]: SKIPPED
                      br-m68k-68040-full [15/47]: SKIPPED
                    br-microblazeel-full [16/47]: SKIPPED
                 br-mips32r6-el-hf-glibc [17/47]: SKIPPED
                      br-mips64-n64-full [18/47]: SKIPPED
                 br-mips64r6-el-hf-glibc [19/47]: SKIPPED
                      br-mipsel-o32-full [20/47]: SKIPPED
                          br-nios2-glibc [21/47]: SKIPPED
                      br-openrisc-uclibc [22/47]: SKIPPED
               br-powerpc-603e-basic-cpp [23/47]: SKIPPED
             br-powerpc64le-power8-glibc [24/47]: SKIPPED
               br-powerpc64-power7-glibc [25/47]: SKIPPED
                  br-powerpc-e500mc-full [26/47]: SKIPPED
                             br-sh4-full [27/47]: SKIPPED
                        br-sparc64-glibc [28/47]: SKIPPED
                         br-sparc-uclibc [29/47]: SKIPPED
                    br-x86-64-core2-full [30/47]: OK
                          br-x86-64-musl [31/47]: OK
                          br-xtensa-full [32/47]: SKIPPED
                     i686-ctng-linux-gnu [33/47]: OK
                       linaro-aarch64-be [34/47]: SKIPPED
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: SKIPPED
             mips64el-ctng_n64-linux-gnu [38/47]: SKIPPED
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: SKIPPED
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: SKIPPED
                           sourcery-mips [44/47]: SKIPPED
                          sourcery-nios2 [45/47]: SKIPPED
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 27 skipped, 0 build failed, 0 legal-info failed

Some references:

[1] https://www.hellion.org.uk/blog/posts/grub-on-uboot-on-qemu/
[2] https://www.kraxel.org/repos/jenkins/edk2/
[3] https://www.youtube.com/watch?v=bNL1pd-rwCU

Changes v2 -> v3:
  - grub2 version bump patch dropped as it was already applied in v2.
  - Dropped the grub2-tools separate package and host-grub2-tools, in
  favour of just host-grub2. In the previous proposal, everything was
  built twice and it was confusing because grub2-tools also installed
  modules to the target. The new proposal is probably simpler as
  everything is built once and only the installation of optional bits to
  the target is optional, in case the user wants to save space.
  - Added aarch64_efi_defconfig config so that we have a qemu-bootable
  defconfig to catch build issues with grub2 for aarch64.
  - Added dependency on BR2_USE_MMU to skip builds on arm nommu.

Changes v1 -> v2:
  - Update to the 2.02 release, this settles the questions about using
  git master or a beta release, as it is now an official release.
  - Moved the grub2 additional documentation from its Config.in to a
  readme.txt in the package directory as it was discussed in v1.
  - Added grub2 extra documentation for arm and aarch64.
  - Fixed small bugs such as the lack of depends on wchar.
  - Re-tested everything, including pc_* defconfigs, except BeagleBone
  (lots of extra work, not my primary target, and nothing changed on the
   arm-efi part).
  Odroid-C2 works much more nicely with u-boot bootefi + grub2
  aarch64-efi now that it has better u-boot/kernel upstream support.
  - The Image.gz format for linux aarch64.

Erico Nunes (5):
  grub2: separate target and host builds
  grub2: add option to install tools
  grub2: enable support for arm and aarch64 targets
  configs/aarch64_efi_defconfig: new defconfig
  grub2: add usage notes for grub2 arm and aarch64

 board/aarch64-efi/genimage-efi.cfg |  30 +++++++
 board/aarch64-efi/grub.cfg         |   6 ++
 board/aarch64-efi/post-image.sh    |   5 ++
 board/aarch64-efi/readme.txt       |  17 ++++
 boot/grub2/Config.in               |  50 ++++++++++-
 boot/grub2/grub2.mk                |  74 ++++++++++-----
 boot/grub2/readme.txt              | 140 ++++++++++++++++++++++++++++-
 configs/aarch64_efi_defconfig      |  33 +++++++
 support/scripts/check-bin-arch     |   4 +
 9 files changed, 328 insertions(+), 31 deletions(-)
 create mode 100644 board/aarch64-efi/genimage-efi.cfg
 create mode 100644 board/aarch64-efi/grub.cfg
 create mode 100755 board/aarch64-efi/post-image.sh
 create mode 100644 board/aarch64-efi/readme.txt
 create mode 100644 configs/aarch64_efi_defconfig

-- 
2.17.1
