From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 21 Nov 2014 13:18:59 -0300
Subject: [Buildroot] [PATCH v4 0/9] target permissions
Message-ID: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey guys,

fourth patchset to fix the target permissions variability.

I checked (to the best of my knowledge) every 'cp' and 'rsync' call
under package/. There are two bigs cases:

(1) Copies from the package or download directory to the build directory
(example: cache-calibrator, fan-ctrl, ramspeed, samba4). They are OK,
since they copy source code, a Makefile or some other build files. These
files _shouldn't_ affect the result, so I left them the way they are. We
can change them if you agree, but I thought it'd be too much noise for
now.

(2) Copies from anything under output/ to the target. These should
all be fine. Since we now build with a controlled umask and reset any
permissions that could vary (tar files don't vary), we shouldn't observe
any variability under output/ (modulo (1)-kind copies).

I tested parallel builds with this, as Yann suggested, and they seem to
work the same, which is expected since we just wrap everything at the
top level.

Differences from v3 are:

- Recursive running of make is done with $(MAKE), and not using
  --no-print-directory. Also, change the "%" rule in "$(MAKECMDGOALS)"
  to properly detect phony rules.

- Use --chmod on the external toolchain's rsync, to prevent any weird
  permissions coming from there. This isn't stricly necessary, since the
  toolchain libs are copied to the target via 'install', which won't
  depend on any existing permissions. But this way we're safer in case
  anything changes in the future. Also we make sure everything under
  output/ is controlled.

- Fix some cp's to the target from non-controlled dirs
  on boot/grub/grub.mk, fs/iso9660/iso9660.mk, and
  board/boundarydevices/nitrogen6x/post-build.sh

- Fifth patch dropped as it was accepted.

- Added the umask setting in the Makefile generated in the $(O) dir.
  This is just an optimization so we don't have another level of 'make'
  running.

- Fixed 'install' call on matchbox-keyboard patch (#4)

Thanks!

---

Guido Mart?nez (9):
  Makefile: don't depend on the umask
  Makefile: don't depend on current skeleton/overlay permissions
  toolchain/helpers.mk: use --chmod on rsync
  pkg-generic.mk: don't depend on external package permissions
  package: matchbox-keyboard: use install instead of cp
  scripts: mkmakefile: set umask before calling BR's makefile
  nitrogen6x: use install instead of cp
  boot/grub: use install instead of cp
  fs/iso9660: use install instead of cp

 Makefile                                              | 19 +++++++++++++++++--
 board/boundarydevices/nitrogen6x/post-build.sh        |  6 +++---
 boot/grub/grub.mk                                     | 14 +++++++-------
 fs/iso9660/iso9660.mk                                 | 16 +++++++++-------
 .../matchbox/matchbox-keyboard/matchbox-keyboard.mk   |  2 +-
 package/pkg-generic.mk                                |  2 +-
 support/scripts/mkmakefile                            |  2 +-
 toolchain/helpers.mk                                  |  2 +-
 8 files changed, 40 insertions(+), 23 deletions(-)

-- 
2.1.3
