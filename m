From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:23:49 +0100
Subject: [Buildroot] [PATCH 0/7] RPi: enable building a device-tree-enabled
	kernel (branch yem/rpi-dt)
Message-ID: <cover.1420142707.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Recently, the Raspberry Pi fork of the kernel has gained support
for the device tree.

This series is an attempt at making it smoothly available in Buildroot:

  - allow Buildroot to build a DT kernel without necessarily building
    the DTB (the DTB can be hard-coded on a board, for example, or the
    bootloader will provide it, either dynamically built at runtime,
    or bundled in the bootloader sources);

  - bump rpi-firmware, and use different versions depending on
    whether we are using a DT kernel or not; install the DTBs when
    needed.

It is to be moted that the device tree support on the Raspberry Pi is
not trivially similar to how all other boards behave.


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
    5fdce56c57f419a8f8a57a6c5b90d63deabca713

Since this is not their stable branch, that specific commit may disapear
any time; just use the latest commit on rpi-3.18.y .

Regards,
Yann E. MORIN.


The following changes since commit b7e7b417fa1210a7f9c4e76ee747238981dcd012:

  wpa_supplicant: fix indentation and change file permissions (2015-01-01 11:31:14 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/rpi-dt

for you to fetch changes up to 0c0f5c97634b438044f09c32bdc42edcd878feb0:

  package/rpi-firmware: append the DTOK footer for DT-aware kernel (2015-01-01 18:33:20 +0100)

----------------------------------------------------------------
Yann E. MORIN (7):
      package/rpi-firmware: bump version
      linux: add option to rely on a bootloader-provided DTB
      docs/manual: document LIBFOO_INSTALL_IMAGES
      package/rpi-firmware: only install images
      package/rpi-firmware: add DT-aware marking script
      package/rpi-firmware: install DTB blobs
      package/rpi-firmware: append the DTOK footer for DT-aware kernel

 docs/manual/adding-packages-generic.txt |   5 +
 linux/Config.in                         |   8 ++
 linux/linux.mk                          |  12 +-
 package/rpi-firmware/Config.in          |  11 ++
 package/rpi-firmware/mkknlimg           | 204 ++++++++++++++++++++++++++++++++
 package/rpi-firmware/rpi-firmware.mk    |  41 ++++++-
 6 files changed, 278 insertions(+), 3 deletions(-)
 create mode 100755 package/rpi-firmware/mkknlimg

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
