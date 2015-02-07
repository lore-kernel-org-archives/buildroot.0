From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 14:53:22 +0100
Subject: [Buildroot] [PATCH 0/11 v7] Introduce libudev (branch yem/libudev3)
Message-ID: <cover.1423317174.git.yann.morin.1998@free.fr>
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

During the last two developers days, it was suggested that libudev was
to be made a virtual package that could be selected (like jpeg is). I
tried doing so, but I did not like the outcome of this. See my comments
on my previous attempt:
    http://lists.busybox.net/pipermail/buildroot/2014-December/115455.html

Since I am not really interested in libudev all by itself (and I was
taking care of it just to get something clean), and am not either
motivated to maintain this series forever, it was decided at the last
developers days that I should respin the series and that Peter would take
over to conclude this work.

So be it. ;-)

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


Changes v6 -> v7:
  - rebase ontop latest master

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


The following changes since commit b49e4cf3ec7eab7505957c704a0d9727edcdbcca:

  dropbear: add extra build customization options (2015-02-07 12:52:25 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/libudev3

for you to fetch changes up to a6926397cba17b322a97a6e5fbf44f7f164aa0db:

  package/xdriver_xf86-input-evdev: needs libudev, not a udev daemon (2015-02-07 14:41:05 +0100)

----------------------------------------------------------------
Yann E. MORIN (11):
      support/gen-manual-lists.py: rework generating the virtual package list
      package/libudev: new virtual package
      package/eudev: is a provider for libudev
      package/systemd: is a provider for libudev
      package/eudev: align comments to the ones in eudev /dev management
      package/eudev: split udev/libudev
      package/mesa3d: remove suprefluous dependency on udev
      package/mesa3d: depends on libudev, not udev
      package/libcec: needs libudev, not a udev daemon
      package/libdrm: can also use only libudev
      package/xdriver_xf86-input-evdev: needs libudev, not a udev daemon

 package/Config.in                                  |  1 +
 package/eudev/Config.in                            | 40 ++++++++--
 package/eudev/eudev.mk                             | 53 ++++++++++--
 package/kodi/Config.in                             |  6 +-
 package/libcec/Config.in                           |  5 +-
 package/libcec/libcec.mk                           |  4 +-
 package/libdrm/libdrm.mk                           |  4 +-
 package/libudev/Config.in                          |  6 ++
 package/libudev/libudev.mk                         |  7 ++
 package/mesa3d/Config.in                           | 10 +--
 package/mesa3d/mesa3d.mk                           |  4 +-
 package/systemd/Config.in                          |  4 +
 package/systemd/systemd.mk                         |  2 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |  5 +-
 .../xdriver_xf86-input-evdev.mk                    |  3 +-
 support/scripts/gen-manual-lists.py                | 93 ++++++++++++++++++----
 system/Config.in                                   | 22 +++--
 17 files changed, 213 insertions(+), 56 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
