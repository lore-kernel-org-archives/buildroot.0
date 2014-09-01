From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:38:22 +0200
Subject: [Buildroot] [PATCH 0/15 v5] Introduce libudev (branch yem/libudev2)
Message-ID: <cover.1409578332.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces the possibility to just build and install libudev,
without requiring that the /dev management be handled by eudev or systemd.

A lot of packages that have a dependency on udev, in fact only require a
libudev, not a udev daemon. That's the case for e.g. libinput, libcec,
mesa3d...

The series contains:

  - a patch to fix generating the list of virtual packages for the manual

  - three patches to introduce the libudev virtual package, and its
    providers: eudev and systemd

  - a patch to make eudev only build libudev if /dev management is
    handled by neither eudev nor systemd

  - four patches to convert packages to depend on libusb instead of a
    udev daemon; those packages have been confirmed by Bernd to indeed
    only need libudev and not a udev daemon

  - five RFC patches to convert packages we are not sure whether they
    would be happy with only a libudev, and which would need run-time
    testing to check

Not all packages that reference udev have been switched over to depend
on libudev, though, since it is unclear to me whether they require a
udev daemon, or would be happy with just libudev.

On your keyboards, get set, ready... Comment! :-)

Changes v4 -> v5:
  - bump to eudev 1.10  (Bernd)

Changes v3 -> v4:
  - do not remove the prompts for eudev and systemd  (Thomas P.)
  - patch to convert xserver_xorg-server dropped  (Bernd)

Changes RFCv2 -> v3:
  - some typoes  (Samuel)
  - misc fixes in gen-manual-lists.py  (Samuel)

Changes RFCv1 -> RFCv2:
  - have eudev and systemd be providers for libudev, instead of having
    udev be the provider  (Thomas, on IRC)
  - fix the manual lists after bugs were uncovered with the removal of
    the eudev and systemd prompts
  - convert some packages


Regards,
Yann E. MORIN.


The following changes since commit fcd720dfcf702d796fbc625b9abc4c06cb848d84:

  Update for 2014.08 (2014-09-01 13:20:56 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/libudev2

for you to fetch changes up to 3b319ddea8c364db04b3553fa6433c3d843fe5a0:

  [RFC] package/weston: needs libudev, not a udev daemon (2014-09-01 15:31:17 +0200)

----------------------------------------------------------------
Yann E. MORIN (15):
      support/gen-manual-lists.py: rework generating the virtual package list
      package/libudev: new virtual package
      package/eudev: is a provider for libudev
      package/systemd: is a provider for libudev
      package/eudev: bump to 1.10
      package/eudev: split udev/libudev
      package/mesa3d: depends on libudev, not udev
      package/libcec: needs libudev, not a udev daemon
      package/libdrm: can also use only libudev
      package/xdriver_xf86-input-evdev: needs libudev, not a udev daemon
      [RFC] package/libatasmart: needs libudev, not a udev daemon
      [RFC] package/libinput: needs libudev, not a udev daemon
      [RFC] package/libusb: needs libudev, not a udev daemon
      [RFC] package/vlc: needs libudev, not a udev daemon
      [RFC] package/weston: needs libudev, not a udev daemon

 package/Config.in                                  |  1 +
 package/eudev/Config.in                            | 36 +++++++--
 ...y-use-pragma-for-ignoring-diagnostics-if-.patch |  8 +-
 package/eudev/eudev.mk                             | 55 +++++++++++--
 package/libatasmart/Config.in                      |  4 +-
 package/libcec/libcec.mk                           |  4 +-
 package/libdrm/libdrm.mk                           |  4 +-
 package/libinput/Config.in                         |  6 +-
 package/libinput/libinput.mk                       |  2 +-
 package/libudev/Config.in                          |  6 ++
 package/libudev/libudev.mk                         |  7 ++
 package/libusb/libusb.mk                           |  5 +-
 package/mesa3d/Config.in                           |  6 +-
 package/mesa3d/mesa3d.mk                           |  4 +-
 package/systemd/Config.in                          |  4 +
 package/systemd/systemd.mk                         |  2 +-
 package/vlc/vlc.mk                                 |  4 +-
 package/weston/Config.in                           |  6 +-
 package/weston/weston.mk                           |  2 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |  5 +-
 .../xdriver_xf86-input-evdev.mk                    |  3 +-
 package/xbmc/Config.in                             |  6 +-
 support/scripts/gen-manual-lists.py                | 93 ++++++++++++++++++----
 system/Config.in                                   | 26 ++++--
 24 files changed, 232 insertions(+), 67 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
