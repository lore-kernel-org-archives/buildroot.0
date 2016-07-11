From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:31 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
	yem/libudev-4)
Message-ID: <cover.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces the possibility to just build and install
libudev, without requiring that the /dev management be handled by
eudev or systemd.

A lot of packages that have a dependency on udev, in fact only require a
libudev, not a udev daemon. That's the case for e.g. libinput, libcec,
mesa3d...

During previous developers days, it was suggested that libudev was to be
made a virtual package that could be selected (like jpeg is). So I
eventually got some time to rework it (since the series was not adopted
by Peter as it was discussed during those DevDays:
https://lite5.framapad.org/p/buildrootfosdem15 ;-) ).

This series is a full rewrite from scratch, with very little caried over
from the previous attempts (far back in the past).

  - first come a few cleanup patches;

  - then eudev is split in two, virtually providing to different
    packages in one, with two different configure/build/install
    procedures, one for libudev only, one for the full package;

  - then the libudev virtual package is introduced, with eudev and
    systemd both declared as providers;

  - libudev is made selectable, so that packages can select it instead
    of depending (like is usual) on the virtual package;

  - eventually, two packages are converted over to using libudev:
    qt5base, as an optional implicit dependency, and libinput, as a
    mandatory dependency.

Not all packages that reference udev have been switched over to depend
on libudev, though, since it is unclear to me whether they require a
udev daemon, or would be happy with just libudev. This can be done in
follow up patches once libudev is eventually in the tree (for good this
time I hope! ;-) )


Changes v7 -> v8:
  - total rewrite
  - libudev is selectable


Regards,
Yann E. MORIN.


The following changes since commit c2dacf7e07cc0434475518e6f57863c829e16d34

  python-tomako: bump to version 0.1.0.post1 (2016-07-11 14:12:13 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ed0dbe6a8b6bc7dfcfc5e665fe07f9360c2e7723

  package/libinput: only needs libudev, not udev daemon (2016-07-11 23:50:34 +0200)


----------------------------------------------------------------
Yann E. MORIN (12):
      package/eudev: explicitly disable rules generator if not wanted
      package/eudev: use the description on their home page
      package/eudev: add option to enable the udev daemon
      package/eudev: fix configure options
      package/eudev: libgudev is no longer provided by eudev
      package/eudev: allow building only libudev
      package/libudev: new virtual package
      package/eudev: provides libudev
      package/systemd: provides libudev
      package/libudev: make it selectable
      package/qt5base: optionally use libudev
      package/libinput: only needs libudev, not udev daemon

 package/Config.in              |  1 +
 package/eudev/Config.in        | 60 +++++++++++++++++++++++++++---------
 package/eudev/eudev.mk         | 70 +++++++++++++++++++++++++++++++++---------
 package/libinput/Config.in     | 10 ++++--
 package/libudev/Config.in      | 13 ++++++++
 package/libudev/libudev.mk     |  7 +++++
 package/qt5/qt5base/qt5base.mk |  4 +--
 package/systemd/Config.in      |  4 +++
 package/systemd/systemd.mk     |  2 +-
 system/Config.in               |  1 +
 10 files changed, 137 insertions(+), 35 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
