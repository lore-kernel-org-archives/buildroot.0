From: David Lechner <david@lechnology.com>
Date: Sun, 30 Oct 2016 18:32:22 -0500
Subject: [Buildroot] [PATCH 0/4] LEGO MINDSTORMS EV3 Updates
Message-ID: <1477870346-4941-1-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I saw that you have EV3 support using the ev3dev kernel (I'm the ev3dev
maintainer). Here are some updates for better EV3 support in Buildroot.

Earlier this year, I submitted a patch to U-Boot for EV3 support, so we can
now use mainline U-Boot for EV3.

Also, following up from a recent Buildroot email thread, I have added a script
to create usable images using the genimage tool. I also added a linux extension
for the ev3dev drivers. We use them as a git submodule in our kernel, but since
buildroot doesn't seem to be able to handle that, this accomplishes the same
result.

FYI, I am also working on mainline linux kernel support for the EV3, so maybe
around 4.10 or 4.11, we can switch to a mainline kernel here and it will
actually boot. If you don't want to include the ev3dev kernel extension stuff,
that is OK. I assume no one is using Buildroot much with the EV3 at this point
anyway.

David Lechner (4):
  configs/lego_ev3: add U-Boot support
  board/lego/ev3: Create images using genimage
  linux: add ev3dev extension
  board/lego/ev3: Use ev3dev linux ext for ev3dev drivers

 board/lego/ev3/genimage.cfg                        |  57 ++++
 board/lego/ev3/linux_defconfig                     | 297 +++++++++++++++++++++
 .../0001-Create-empty-drivers-lego-Kconfig.patch   |  24 --
 board/lego/ev3/post-image.sh                       |  14 +
 board/lego/ev3/readme.txt                          |  84 ++----
 configs/lego_ev3_defconfig                         |  17 +-
 linux/Config.ext.in                                |  10 +
 linux/linux-ext-ev3dev.mk                          |  13 +
 package/Config.in                                  |   1 +
 package/ev3dev/Config.in                           |  12 +
 package/ev3dev/ev3dev.mk                           |  11 +
 package/ev3dev/lego-linux-drivers.hash             |   2 +
 support/scripts/pkg-stats                          |   1 +
 13 files changed, 450 insertions(+), 93 deletions(-)
 create mode 100644 board/lego/ev3/genimage.cfg
 create mode 100644 board/lego/ev3/linux_defconfig
 delete mode 100644 board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
 create mode 100755 board/lego/ev3/post-image.sh
 create mode 100644 linux/linux-ext-ev3dev.mk
 create mode 100644 package/ev3dev/Config.in
 create mode 100644 package/ev3dev/ev3dev.mk
 create mode 100644 package/ev3dev/lego-linux-drivers.hash

-- 
2.7.4
