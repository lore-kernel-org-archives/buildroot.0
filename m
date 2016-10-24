From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Oct 2016 18:38:49 +0200
Subject: [Buildroot] [PATCH 0/6] xorg: fix imput drivers install paths
Message-ID: <cover.1477327063.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes the install paths of the few remaining input drivers
that incorrectly installed headers in $(TARGET_DIR)/$(STAGING_DIR).

The underlying issue is that xorg defines an "sdkdir" pkg-config
variable, as the location to find/install headers. This location is an
absolute path to the staging dir (aka sysroot), but headers are
installed in $(DESTDIR)/$(sdkdir).

We fix that by entirely ditching the use of sdkdir, as was done in all
other xorg dirvers, with the 5 first patches of the series.

Additionally, to catch such situation, the 6th and last patch of the
series checks no such paths are present, neither in target/ nor in
staging/ .


Regards,
Yann E. MORIN.


The following changes since commit 90e38737a699a25f577684742c767375e74683c5

  uclibc: fix pthread.h (2016-10-24 14:50:00 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 705884038a0fa0824f162280fc1ac2adfd6f03d7

  core/pkg-generic: check proper package installation (2016-10-24 18:05:23 +0200)


----------------------------------------------------------------
Yann E. MORIN (6):
      package/xdriver_xf86-input-evdev: fix install paths
      package/xdriver_xf86-input-joystick: fix install paths
      package/xdriver_xf86-input-libinput: fix install paths
      package/xdriver_xf86-input-mouse: fix install paths
      package/xdriver_xf86-input-synaptics: fix install paths
      core/pkg-generic: check proper package installation

 package/pkg-generic.mk                             | 15 ++++
 .../0001-build-get-rid-of-sdkdir.patch             | 87 +++++++++++++++++++++
 .../xdriver_xf86-input-evdev.mk                    |  2 +
 .../0001-build-get-rid-of-sdkdir.patch             | 78 +++++++++++++++++++
 .../xdriver_xf86-input-joystick.mk                 |  1 +
 .../0001-build-get-rid-of-sdkdir.patch             | 78 +++++++++++++++++++
 .../xdriver_xf86-input-libinput.mk                 |  1 +
 .../0001-build-get-rid-of-sdkdir.patch             | 81 ++++++++++++++++++++
 .../xdriver_xf86-input-mouse.mk                    |  1 +
 .../0001-build-get-rid-of-sdkdir.patch             | 88 ++++++++++++++++++++++
 .../xdriver_xf86-input-synaptics.mk                |  1 +
 11 files changed, 433 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-input-evdev/0001-build-get-rid-of-sdkdir.patch
 create mode 100644 package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch
 create mode 100644 package/x11r7/xdriver_xf86-input-libinput/0001-build-get-rid-of-sdkdir.patch
 create mode 100644 package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
 create mode 100644 package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
