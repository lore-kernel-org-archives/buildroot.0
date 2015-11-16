From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 16 Nov 2015 19:54:17 +0200
Subject: [Buildroot] [PATCH 0/2] Samsung XE303C12 aka Chromebook Snow
Message-ID: <cover.1447689401.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This short series adds board config for Chromebook Snow.

There are several ways to boot a custom kernel on the device,
the one used here is perhaps the easiest to implement.
However, it needs vboot-tools to sign the custom kernel.

The kernel is packed into u-boot flat image tree (FIT) together with
the DT blob. Long story short, this is the only way I can get it to boot
with the original bootloader. Using uImage with appended DT should be
possible as well, but for some reason it does not seem to work.

At first I tried to add FIT option to the Kernel binary format menu,
because it's not really Chromebook-specific, but it turned out to be
ugly and much more complex than doing it in a post-build script.

Most of this boot stuff is common for all Chromebooks, even x86 ones,
but not for Samsung devices other than Chromebooks. Because of this,
it's boards/chromebook/snow and not boards/samsung/xe303c12.

Alex Suykov (2):
  vboot-utils: new package
  board: add support for Chromebook Snow

 board/chromebook/snow/kernel.args      |   1 +
 board/chromebook/snow/kernel.its       |  34 ++++++
 board/chromebook/snow/linux-4.3.config | 161 +++++++++++++++++++++++++++
 board/chromebook/snow/readme.txt       | 191 +++++++++++++++++++++++++++++++++
 board/chromebook/snow/sign.sh          |  32 ++++++
 configs/chromebook_snow_defconfig      |  17 +++
 package/Config.in.host                 |   1 +
 package/vboot-utils/Config.in.host     |   6 ++
 package/vboot-utils/vboot-utils.mk     |  23 ++++
 9 files changed, 466 insertions(+)
 create mode 100644 board/chromebook/snow/kernel.args
 create mode 100644 board/chromebook/snow/kernel.its
 create mode 100644 board/chromebook/snow/linux-4.3.config
 create mode 100644 board/chromebook/snow/readme.txt
 create mode 100755 board/chromebook/snow/sign.sh
 create mode 100644 configs/chromebook_snow_defconfig
 create mode 100644 package/vboot-utils/Config.in.host
 create mode 100644 package/vboot-utils/vboot-utils.mk

-- 
2.0.3
