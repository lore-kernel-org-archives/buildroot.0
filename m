From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Jun 2014 01:40:08 +0200
Subject: [Buildroot] [PATCH 0/5 RFC] Introduce libudev (branch yem/libudev)
Message-ID: <cover.1402529398.git.yann.morin.1998@free.fr>
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

The series starts with two cleanup patches, to remove the prompts of eudev
and systemd, since they are never user-selectable; a bit of cleanup is
done in the dependencies as well.

The two following patches add a new virtual package 'libudev', and the
'udev' virtual package is made a provider for this new virtual package.

Finally, the fifth patch 'upgrades' the existing eudev package with the
possibility to only install libudev if needed. This is the tricky part,
and is explained in the commit log. More details can be added in a future
respin of the series.

No package has so far been converted to depend on libudev instead of just
udev. This is relatively trivial, but I would prefer we agree on the above
first. And it is late here, so let's just spin what I have for now! ;-)

On your keyboards, get set, ready... Comment! :-)

Regards,
Yann E. MORIN.


The following changes since commit 11dbb615338cd768acc2c3138064ddf557e9b60b:

  hdparm: prevent package makefile from stripping the hdparm binary (2014-06-11 23:03:48 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git 

for you to fetch changes up to 972a759982e4bdbd069e2f1fb6a213aa9f829c29:

  package/eudev: split udev/libudev (2014-06-12 01:29:49 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      package/eudev: remove the prompt
      package/systemd: remove prompt
      package/libudev: new virtual package
      package/udev: is a provider for libudev
      package/eudev: split udev/libudev

 package/Config.in          |  3 +-
 package/eudev/Config.in    | 66 +++++++++++++++++++++++++++-------------
 package/eudev/eudev.mk     | 46 +++++++++++++++++++++++++---
 package/libudev/Config.in  |  6 ++++
 package/libudev/libudev.mk |  7 +++++
 package/systemd/Config.in  | 53 +++++++++++---------------------
 package/udev/Config.in     |  4 +++
 package/udev/udev.mk       |  2 ++
 system/Config.in           | 76 +++++++++++++++++++++++++++++++++++++---------
 9 files changed, 187 insertions(+), 76 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
