From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:44 +0200
Subject: [Buildroot] [PATCH 0/32 v2] matchbox: huge cleanups (branch
	yem/matchbox)
Message-ID: <cover.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at cleaning up the matchbox packages.

Currently, the matchbox pckages are in a dire situation, where some
packages do not even have a corresponding BR2_PACKAGE_FOO option, but are
nonetheless build dependencies ones of others.

Also, some support code has been bit-rotting and is not even buildable
today, like support for compositing, which simply FTBFS.

Finally, some dependencies are incorrect. For example, there are build
dependencies not expressed in the Kconfig (not even counting the missing
Kconfig entries for packages), or are entirely wrong.

So, this series aims at fixing all of this. And adds a little bit of
extra features we're currently missing. Not everything that is possible
with matchbox has been handled, though, like support for NLS. There are
also other matchbox-related packages; they are not added in this series,
and left as an exercise to the adventurous! ;-)

The series is split into multiple parts;

  - patch 1 stands out alone, it is a purely cosmetic removal of dead
    code.

  - patches 2-9 make all packages real packages, i.e. with proper
    Kconfig options. No functionality change.

  - patches 10-12 do a little eye-candy cleanups. No functionality
    change.

  - patch 13-14 move everything out of the matchbox-specific
    sub-directory, and directly into package/ like almost all otehr
    packages, and change the prompts according to our policy.

  - patches 15-17 fixes dependencies. No functionality change done on
    purpose, except because of added proper dependency tracking.

  - patch 18 stands out alone, a bit of eye-candy to add prompts for
    previously prompt-less packages. No functionality change.

  - patches 19-32 are not really sorted. They are a mix of fixes,
    eye-candy and the few new features.

This has been build-tested only, with about every possible combinations
excercised, for ARM. No run-time testing has been done, though.

Enjoy! ;-)


Changes v1 -> v2:
  - reordering  (Arnout)
  - some cleanups here and there  (Arnout)
  - lots of typoes/nits  (Arnout)
  - don't joke about Yocto ;-)  (Alexandre)


Regards,
Yann E. MORIN.


The following changes since commit 0606cf10be3ed9934c90e8c752fe931918f55d15:

  qt5cinex: fix license typo (2015-06-02 23:32:28 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/matchbox

for you to fetch changes up to 0186d2b3c5d0409658ade1fbfca5d07b8044e119:

  package/matchbox-panel: fix WiFi monitoring (2015-06-03 22:09:31 +0200)

----------------------------------------------------------------
Yann E. MORIN (32):
      package/matchbox-wm: drop useless commented options
      package/matchbox: make matchbox-lib a real package
      package/matchbox: make matchbox-wm a real package
      package/matchbox: make matchbox-panel a real package
      package/matchbox: make matchbox-desktop a real package
      package/matchbox: make matchbox-common a real package
      package/matchbox: make matchbox-fakekey a real package
      package/matchbox: make matchbox-keyboard a real package
      package/matchbox: make match-startup-monitor a real package
      package/matchbox: remove superfluous conditional includes
      package/matchbox: point to new home
      package/matchbox: get rid of intermediate non-package matchbox
      package/matchbox-common: move one directory higher
      package/matchbox: fix option prompts
      package/matchbox: add missing dependencies to matchbox-lib
      package/matchbox-common: fix dependencies
      package/matchbox-fakekey: add missing dependency
      package/matchbox: finally add prompts to all sub-packages
      package/matchbox-startup-monitor: invert dependency chain
      package/matchbox: forcibly disable gconf
      package/matchbox: forcibly disable support for compositing
      package/matchbox: make it a menu
      package/matchbox: enable support for the Xsession manager
      package/matchbox: drop useless dependencies
      package/matchbox-keyboard: enforce disabling support for cairo
      package/matchbox-common: explicitly disable PDA folders when not selected
      package/matchbox: wrap long lines
      package/matchbox: xlib-libXcursor is an optional dependency
      package/matchbox: xlib_libXfixes is an optional dependency
      package/matchbox-panel: use ACPI for the battery applet
      package/matchbox-panel: add support for dnotify
      package/matchbox-panel: fix WiFi monitoring

 package/matchbox-common/Config.in                  | 10 +++++
 .../matchbox-common/matchbox-common.hash           |  0
 .../matchbox-common/matchbox-common.mk             |  2 +
 package/matchbox-desktop/Config.in                 |  6 +++
 .../matchbox-desktop/matchbox-desktop.hash         |  0
 .../matchbox-desktop/matchbox-desktop.mk           |  0
 package/matchbox-fakekey/Config.in                 |  6 +++
 .../matchbox-fakekey/matchbox-fakekey.hash         |  0
 .../matchbox-fakekey/matchbox-fakekey.mk           |  0
 package/matchbox-keyboard/Config.in                |  8 ++++
 .../matchbox-keyboard/matchbox-keyboard.hash       |  0
 .../matchbox-keyboard/matchbox-keyboard.mk         |  4 +-
 .../matchbox-keyboard/mb-applet-kbd-wrapper.sh     |  0
 .../matchbox-lib/0001-index-is-legacy.patch        |  0
 .../matchbox-lib/0002-libpng15.patch               |  0
 .../matchbox-lib/0003-include-setjmp-h.patch       |  0
 package/matchbox-lib/Config.in                     |  4 ++
 .../{matchbox => }/matchbox-lib/matchbox-lib.hash  |  0
 .../{matchbox => }/matchbox-lib/matchbox-lib.mk    |  3 +-
 .../matchbox-panel/0001-index-is-legacy.patch      |  0
 .../matchbox-panel/0002-mb-applet-wireless.patch   |  0
 .../matchbox-panel/0003-mb-applet-battery.patch    | 21 ++++++++++
 package/matchbox-panel/Config.in                   |  6 +++
 .../matchbox-panel/matchbox-panel.hash             |  0
 .../matchbox-panel/matchbox-panel.mk               | 15 +++++--
 .../matchbox-startup-monitor/0001-true-false.patch |  0
 package/matchbox-startup-monitor/Config.in         |  6 +++
 .../matchbox-startup-monitor.hash                  |  0
 .../matchbox-startup-monitor.mk                    |  0
 .../{matchbox-wm => }/0001-defaulttheme.patch      |  0
 package/matchbox/Config.in                         | 47 ++++++++-------------
 package/matchbox/matchbox-wm/matchbox-wm.mk        | 41 ------------------
 .../matchbox-wm.hash => matchbox.hash}             |  0
 package/matchbox/matchbox.mk                       | 48 ++++++++++++++++++++--
 34 files changed, 146 insertions(+), 81 deletions(-)
 create mode 100644 package/matchbox-common/Config.in
 rename package/{matchbox => }/matchbox-common/matchbox-common.hash (100%)
 rename package/{matchbox => }/matchbox-common/matchbox-common.mk (92%)
 create mode 100644 package/matchbox-desktop/Config.in
 rename package/{matchbox => }/matchbox-desktop/matchbox-desktop.hash (100%)
 rename package/{matchbox => }/matchbox-desktop/matchbox-desktop.mk (100%)
 create mode 100644 package/matchbox-fakekey/Config.in
 rename package/{matchbox => }/matchbox-fakekey/matchbox-fakekey.hash (100%)
 rename package/{matchbox => }/matchbox-fakekey/matchbox-fakekey.mk (100%)
 create mode 100644 package/matchbox-keyboard/Config.in
 rename package/{matchbox => }/matchbox-keyboard/matchbox-keyboard.hash (100%)
 rename package/{matchbox => }/matchbox-keyboard/matchbox-keyboard.mk (85%)
 rename package/{matchbox => }/matchbox-keyboard/mb-applet-kbd-wrapper.sh (100%)
 rename package/{matchbox => }/matchbox-lib/0001-index-is-legacy.patch (100%)
 rename package/{matchbox => }/matchbox-lib/0002-libpng15.patch (100%)
 rename package/{matchbox => }/matchbox-lib/0003-include-setjmp-h.patch (100%)
 create mode 100644 package/matchbox-lib/Config.in
 rename package/{matchbox => }/matchbox-lib/matchbox-lib.hash (100%)
 rename package/{matchbox => }/matchbox-lib/matchbox-lib.mk (97%)
 rename package/{matchbox => }/matchbox-panel/0001-index-is-legacy.patch (100%)
 rename package/{matchbox => }/matchbox-panel/0002-mb-applet-wireless.patch (100%)
 create mode 100644 package/matchbox-panel/0003-mb-applet-battery.patch
 create mode 100644 package/matchbox-panel/Config.in
 rename package/{matchbox => }/matchbox-panel/matchbox-panel.hash (100%)
 rename package/{matchbox => }/matchbox-panel/matchbox-panel.mk (65%)
 rename package/{matchbox => }/matchbox-startup-monitor/0001-true-false.patch (100%)
 create mode 100644 package/matchbox-startup-monitor/Config.in
 rename package/{matchbox => }/matchbox-startup-monitor/matchbox-startup-monitor.hash (100%)
 rename package/{matchbox => }/matchbox-startup-monitor/matchbox-startup-monitor.mk (100%)
 rename package/matchbox/{matchbox-wm => }/0001-defaulttheme.patch (100%)
 delete mode 100644 package/matchbox/matchbox-wm/matchbox-wm.mk
 rename package/matchbox/{matchbox-wm/matchbox-wm.hash => matchbox.hash} (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
