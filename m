From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 09:52:25 +0100
Subject: [Buildroot] [PATCH 0/5 v5] systemd-boot: new simple EFI bootloader
 replacing gummmiboot (branch yem/systemd-boot)
Message-ID: <cover.1545814334.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

gummiboot has been deprecated about 5 years ago now [0], when it was
integrated as a component of systemd, as systemd-boot.

Even then, it is still an interesting bootloader on its own, as it is
simple and small, and can load any arbitrary EFI blob (even windows! ;-))

This series first brings two fixes to the meson infrastructure, that are
required to be able to build systemd-boot: first, tell meson that it can
never run what it builds (and override its internal mechanism), then fix
the list of CPU famillies known to meson.

Then, it brings a new variable for the meson infrastructure, so packages
can specify ninja "options" (really, build targets), like we already
have for the other inpackage infrastructures. This will be used by
the standalone systemd-boot, rather than duplicate the commands from the
infra.

Then the existing systemd package gains an option to build the
systemd-boot component.

And finally, we introduce systemd-boot as a standalone, separate
package, as a new bootloader, which is incompatible with systemd (in
the same sense that eudev is incompatible with systemd).

Note that we did not get rid of gummiboot yet, as some concerns were
raised that systemd-boot was not a 100% drop-in replacement yet.

This series was initiated by James, who did most of the work, while I
just refined it and put it into shape.

[0] https://cgit.freedesktop.org/gummiboot/commit/?id=55df1539c9d330732e88bd196afee386db6e4a1d


Regards,
Yann E. MORIN.


The following changes since commit 0b7ada555863cc6c9b558fd6f93a182fa32a2101

  Revert "package/x11r7/xcb-proto: remove pkgconf fix" (2018-12-22 17:26:41 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d38239f86f99924e87dcb6e045b2de3ac0cb435f

  boot/systemd-boot: new package (2018-12-26 09:21:03 +0100)


----------------------------------------------------------------
James Hilliard (4):
      package/meson: never try to run generated target binaries
      package/meson: fix CPU familly
      package/systemd: enable building of systemd-boot
      boot/systemd-boot: new package

Yann E. MORIN (1):
      core/pkg-infra: allow meson packages to specify custom build rules

 boot/Config.in                                     |   1 +
 boot/systemd-boot/0001-fix-getty-unit.patch        |   1 +
 .../0002-install-don-t-use-ln-relative.patch       |   1 +
 ...etect-whether-struct-statx-is-defined-in-.patch |   1 +
 ...-linux-stat.h-check-with-other-checks-and.patch |   1 +
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |   1 +
 ...eson.build-fix-detection-of-Werror-shadow.patch |   1 +
 ...lax-depenencies-to-be-able-to-just-build-.patch |  40 ++++++++
 boot/systemd-boot/Config.in                        |  32 +++++++
 boot/systemd-boot/boot-files                       |   1 +
 boot/systemd-boot/systemd-boot.hash                |   1 +
 boot/systemd-boot/systemd-boot.mk                  | 102 +++++++++++++++++++++
 docs/manual/adding-packages-meson.txt              |   3 +
 package/meson/cross-compilation.conf.in            |   1 +
 package/meson/meson.mk                             |  31 ++++++-
 package/pkg-meson.mk                               |   4 +-
 package/systemd/Config.in                          |  28 ++++++
 package/systemd/boot-files/buildroot.conf          |   3 +
 package/systemd/boot-files/loader.conf             |   2 +
 package/systemd/systemd.mk                         |  35 ++++++-
 20 files changed, 285 insertions(+), 5 deletions(-)
 create mode 120000 boot/systemd-boot/0001-fix-getty-unit.patch
 create mode 120000 boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
 create mode 120000 boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
 create mode 120000 boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
 create mode 120000 boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 120000 boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
 create mode 100644 boot/systemd-boot/1000-buildsys-relax-depenencies-to-be-able-to-just-build-.patch
 create mode 100644 boot/systemd-boot/Config.in
 create mode 120000 boot/systemd-boot/boot-files
 create mode 120000 boot/systemd-boot/systemd-boot.hash
 create mode 100644 boot/systemd-boot/systemd-boot.mk
 create mode 100644 package/systemd/boot-files/buildroot.conf
 create mode 100644 package/systemd/boot-files/loader.conf

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
