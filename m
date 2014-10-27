From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:11 -0700
Subject: [Buildroot] [PATCH 0/15 v6] Introduce libudev (branch yem/libudev2)
Message-ID: <cover.1414442699.git.yann.morin.1998@free.fr>
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


Changes v5 -> v6:
  - rebase ontop latest master
  - fix misc comments  (Peter, Bernd)

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


The following changes since commit 36531f35490d704c072007fe5cfe9743b537fb88:

  imagemagick: bump to version 6.8.9-9 (2014-10-27 19:31:43 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/libudev2

for you to fetch changes up to 194186ed8f4117444db62f8642ad3f305a11fa27:

  [RFC] package/weston: needs libudev, not a udev daemon (2014-10-27 13:43:08 -0700)

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
 package/eudev/Config.in                            | 40 ++++++++--
 ...y-use-pragma-for-ignoring-diagnostics-if-.patch |  8 +-
 package/eudev/eudev.mk                             | 55 +++++++++++--
 package/libatasmart/Config.in                      |  4 +-
 package/libcec/Config.in                           |  5 +-
 package/libcec/libcec.mk                           |  4 +-
 package/libdrm/libdrm.mk                           |  4 +-
 package/libinput/Config.in                         |  6 +-
 package/libinput/libinput.mk                       |  2 +-
 package/libudev/Config.in                          |  6 ++
 package/libudev/libudev.mk                         |  7 ++
 package/libusb/libusb.mk                           |  5 +-
 package/mesa3d/Config.in                           | 11 +--
 package/mesa3d/mesa3d.mk                           |  4 +-
 package/systemd/Config.in                          |  4 +
 package/systemd/systemd.mk                         |  2 +-
 package/vlc/vlc.mk                                 |  4 +-
 package/weston/Config.in                           |  8 +-
 package/weston/weston.mk                           |  2 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |  5 +-
 .../xdriver_xf86-input-evdev.mk                    |  3 +-
 package/xbmc/Config.in                             |  6 +-
 support/scripts/gen-manual-lists.py                | 93 ++++++++++++++++++----
 system/Config.in                                   | 26 ++++--
 25 files changed, 239 insertions(+), 76 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
