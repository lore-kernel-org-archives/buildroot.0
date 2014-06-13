From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:39 +0200
Subject: [Buildroot] [PATCH 0/20 v2 RFC] Introduce libudev (branch
	yem/libudev)
Message-ID: <cover.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Big fat warning: this is only an RFC for now!

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

Changes RFCv1 -> RFCv2:
  - have eudev and systemd be providers for libudev, instead of having
    udev be the provider  (Thomas, on IRC)
  - fix the manual lists after bugs were uncovered with the removal of
    the eudev and systemd prompts
  - convert some packages

Regards,
Yann E. MORIN.


The following changes since commit 712414ce2dc6f40ed98a3d8007e7d7ec382f79d4:

  gcc: drop redundant explicit version handling for aarch64 (2014-06-13 23:01:16 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/libudev

for you to fetch changes up to bc3939ee063e015da15063492b6ef0d0b1b7a6de:

  package/xserver_xorg-server: needs libudev, not a udev daemon (2014-06-14 00:47:52 +0200)

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
 package/eudev/eudev.mk                             | 47 +++++++++--
 package/libatasmart/Config.in                      |  2 +-
 package/libcec/libcec.mk                           |  4 +-
 package/libdrm/libdrm.mk                           |  4 +
 package/libinput/Config.in                         |  5 +-
 package/libinput/libinput.mk                       |  2 +-
 package/libudev/Config.in                          |  6 ++
 package/libudev/libudev.mk                         |  7 ++
 package/libusb/libusb.mk                           |  5 +-
 package/mesa3d/Config.in                           |  2 +-
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
 support/scripts/gen-manual-lists.py                | 92 ++++++++++++++++++----
 system/Config.in                                   | 76 ++++++++++++++----
 25 files changed, 294 insertions(+), 122 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
