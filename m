From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 Jan 2015 23:46:19 +0100
Subject: [Buildroot] [PATCH 0/5 v2] RPi: enable building a
	device-tree-enabled kernel (branch yem/rpi-dt)
Message-ID: <cover.1420843412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Recently, the Raspberry Pi fork of the kernel has gained support
for the device tree.

This series is an attempt at making it smoothly available in Buildroot:

  - add the necessary infrastructure: install DTBs from rpi-firmware,
    and install a script to mark the kernel (see below);

  - update the board documentation;

  - add a defconfig.

It is to be moted that the device tree support on the Raspberry Pi is
not trivially similar to how all other boards behave:


====
First, the bootloader needs to know if the kernel has DT support or not,
so it looks for a magic DTOK footer (a header at the end); if this header
is present, DT support is assumed, and the bootloader loads the DTB.

This is not very much like what is done on other boards...

====
Second, the bootloader knows what model of the RPi it boots on, and is
thus capable of loading the correct DTB. This is nice, because it means
that a single firmware will work on all RPI models, auto magically.

This requires the kernel image has the footer appended, of course.


===
Third, if the kernel does not have a DTOK footer, it is possible to
force-load a DTB, by adding a directive in the config.txt file (the
configuration of the bootloader).

In this case, the bootloader will force-load that file as a DTB before
booting the kernel.

But we loose the autodetection of the model we are running on, and
it is not longer possible to run the same firmware on all models.


===
Eventually, there is a not-so-simple perl script that is provided in
a separate RPi repository. Since this repository is rather huge, we
just copied that script and bundled it in Buildroot.

Notes: I've upstreamed a fix for that perl script, that has been
accepted. Round-trip: 2 hours! Yeah! :-)


===
This has been tested to work great with the currently-latest cset on
the rpi-3.18.y branch, at:
    https://github.com/raspberrypi/linux/tree/rpi-3.18.y
    b9c9f8fc69aaba236169798c18dc1590fccf7acd

Since this is not their stable branch, that specific commit may disapear
any time; just use the latest commit on rpi-3.18.y .


Changes v1 -> v2:
  - do not force DT support in the kernel  (thomas P., Peter)
  - update the marking script
  - update the board documentation


Regards,
Yann E. MORIN.


The following changes since commit 799c12ebe6c830338124f90a81d12feaa08de391:

  xz-utils: needs threads (2015-01-09 13:26:27 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/rpi-dt

for you to fetch changes up to b65d009bf4aeb83b97e02a9fd03c14888b5f1ce2:

  configs: add a DT-enabled Raspberry Pi defconfig (2015-01-09 23:27:28 +0100)

----------------------------------------------------------------
Yann E. MORIN (5):
      package/rpi-firmware: add DT-aware marking script
      package/rpi-firmware: install DTB blobs
      boards/raspberrypi: don't document non-existent files
      boards/raspberrypi: update readme with Device Tree instructions
      configs: add a DT-enabled Raspberry Pi defconfig

 board/raspberrypi/readme.txt         |  33 ++++-
 configs/raspberrypi_dt_defconfig     |  12 ++
 package/rpi-firmware/Config.in       |  11 ++
 package/rpi-firmware/mkknlimg        | 227 +++++++++++++++++++++++++++++++++++
 package/rpi-firmware/rpi-firmware.mk |  24 ++++
 5 files changed, 301 insertions(+), 6 deletions(-)
 create mode 100644 configs/raspberrypi_dt_defconfig
 create mode 100755 package/rpi-firmware/mkknlimg

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
