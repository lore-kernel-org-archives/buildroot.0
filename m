From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:22 +0200
Subject: [Buildroot] [PATCH 0/20 v3] Introduce libudev (branch yem/libudev)
Message-ID: <cover.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces the possibility to just build and install libudev,
without requiring that the /dev management be handled by eudev or systemd.

A lot of packages that have a dependency on udev, in fact only require a
libudev, not anudev daemon. That's the case for e.g. libinput, libcec,
mesa3d...

The series contains:

  - a patch to remove a spurious dependency on udev for XBMC

  - three patches to fix generating the list of virtual packages for
    the manual

  - two patches to remove the prompts of eudev and systemd, since
    they are never user-selectable; a bit of cleanup is done in the
    dependencies as well

  - a patch to intrduce the libudev virtual package

  - two patches to add libudev providers: eudev and systemd

  - a patch to make eudev only build libudev if /dev management is
    handled by neither eudev nor systemd

  - ten patches to convert packages to depend on libusb instead of a
    udev daemon

Not all packages that reference udev have been switched over to depend
on libudev, though, since it is unclear to me whether they require a
udev daemon, or would be happy with just libudev.

Also, the converted packages have not been tested, not even build-tested;
this is just an RFC to validate the overal solution for now.

On your keyboards, get set, ready... Comment! :-)

Changes RFCv2 -> v3:
  - some typoes  (Samul)
  - misc fixes in gen-manual-lists.py  (Samuel)

Changes RFCv1 -> RFCv2:
  - have eudev and systemd be providers for libudev, instead of having
    udev be the provider  (Thomas, on IRC)
  - fix the manual lists after bugs were uncovered with the removal of
    the eudev and systemd prompts
  - convert some packages


Regards,
Yann E. MORIN.


The following changes since commit 1aa42ad4aed013c03d1e17f4cfe2ace2194f423d:

  make: bump to version 4.0 (2014-07-19 14:47:27 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot 

for you to fetch changes up to 7964be0c75358121baa69301d23eb93d72a64db9:

  package/xserver_xorg-server: needs libudev, not a udev daemon (2014-07-19 15:46:02 +0200)

----------------------------------------------------------------
Yann E. MORIN (20):
      package/xbmc: remove spurious build-dependency on udev
      support/gen-manual-lists.py: remove unneeded arg in private function
      support/gen-manual-lists.py: bail out early for legacy symbols
      support/gen-manual-lists.py: rework generating the virtual package list
      package/eudev: remove the prompt
      package/systemd: remove prompt
      package/libudev: new virtual package
      package/eudev: is a provider for libudev
      package/systemd: is a provider for libudev
      package/eudev: split udev/libudev
      package/libatasmart: needs libudev, not a udev daemon
      package/libcec: needs libudev, not a udev daemon
      package/libdrm: can also use only libudev
      package/libinput: needs libudev, not a udev daemon
      package/libusb: needs libudev, not a udev daemon
      package/mesa3d: depends on libudev, not udev
      package/vlc: needs libudev, not a udev daemon
      package/weston: needs libudev, not a udev daemon
      package/xdriver_xf86-input-evdev: needs libudev, not a udev daemon
      package/xserver_xorg-server: needs libudev, not a udev daemon

 package/Config.in                                  |  3 +-
 package/eudev/Config.in                            | 68 +++++++++++-----
 package/eudev/eudev.mk                             | 51 ++++++++++--
 package/libatasmart/Config.in                      |  5 +-
 package/libcec/libcec.mk                           |  4 +-
 package/libdrm/libdrm.mk                           |  4 +-
 package/libinput/Config.in                         |  5 +-
 package/libinput/libinput.mk                       |  2 +-
 package/libudev/Config.in                          |  6 ++
 package/libudev/libudev.mk                         |  7 ++
 package/libusb/libusb.mk                           |  5 +-
 package/mesa3d/Config.in                           |  6 +-
 package/mesa3d/mesa3d.mk                           |  4 +-
 package/systemd/Config.in                          | 55 +++++--------
 package/systemd/systemd.mk                         |  2 +-
 package/vlc/vlc.mk                                 |  4 +-
 package/weston/Config.in                           |  6 +-
 package/weston/weston.mk                           |  2 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |  5 +-
 .../xdriver_xf86-input-evdev.mk                    |  3 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |  4 +-
 package/xbmc/Config.in                             |  6 +-
 package/xbmc/xbmc.mk                               |  2 +-
 support/scripts/gen-manual-lists.py                | 95 ++++++++++++++++++----
 system/Config.in                                   | 76 +++++++++++++----
 25 files changed, 301 insertions(+), 129 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
