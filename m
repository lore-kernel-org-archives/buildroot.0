From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 16 Apr 2016 12:23:19 -0300
Subject: [Buildroot] [PATCH v3 0/4] Minnowboard: The grand unification
Message-ID: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following Arnout comments, here's a patchset that first unifies
the Minnowboard board support, and then adds a "graphics &
audio, yet minimum" defconfig.

The idea with this graphical_defconfig is to provide an X-based
system, with ALSA audio and OpenGL enabled, at its minimum
expression.

Regarding the Minnowboard board support unification, it's worth
mentioning that it's possible to use the same kernel on both.
However, a couple reasons made me retain the current choices:

  * It is desirable to use upstream, when possible. Hence,
    we use upstream v4.4 for the Minnowboard MAX.

  * The original Minnowboard has some GPIO keys that are
    not supported upstream. Using out-of-tree patches sucks
    because we need to carry them over when bumping, so I
    decided to just stick with the v3.8 yocto kernel.

The only change on this v3, is the replacement of the cumbersome
startx script (which was based on xinit's startx), with a simple
script that merely calls xinit with a vt7 server argument.

This is required for the X server to start, apparently due to
a bug that prevents starting X on the controlling terminal.
More details here: https://bugs.freedesktop.org/show_bug.cgi?id=87762

Ezequiel Garcia (4):
  board/minnowboard: Rework to generate SD card image
  board/minnowboard: Unify Minnowboard and Minnowboard MAX boards
  board/minnowboard-max: Add more peripherals and features to the kernel
  board/minnowboard-max: Add a X-based graphical defconfig

 board/minnowboard-max/post-build.sh                |  2 -
 board/minnowboard-max/readme.txt                   | 25 -------
 .../fs-overlay-graphical/etc/asound.conf           |  4 ++
 .../minnowboard/fs-overlay-graphical/root/.xinitrc |  1 +
 .../fs-overlay-graphical/usr/bin/startx            |  6 ++
 .../{minnowboard-max => minnowboard}/genimage.cfg  |  0
 .../grub-minnowboard-max.cfg}                      |  0
 .../minnowboard/{grub.cfg => grub-minnowboard.cfg} |  0
 .../linux.config => minnowboard/linux-4.4.config}  | 10 +++
 board/minnowboard/post-build.sh                    |  5 +-
 .../{minnowboard-max => minnowboard}/post-image.sh |  2 +-
 board/minnowboard/readme.txt                       | 39 ++++-------
 configs/minnowboard_defconfig                      | 10 +++
 configs/minnowboard_max-graphical_defconfig        | 79 ++++++++++++++++++++++
 configs/minnowboard_max_defconfig                  |  7 +-
 15 files changed, 133 insertions(+), 57 deletions(-)
 delete mode 100755 board/minnowboard-max/post-build.sh
 delete mode 100644 board/minnowboard-max/readme.txt
 create mode 100644 board/minnowboard/fs-overlay-graphical/etc/asound.conf
 create mode 100644 board/minnowboard/fs-overlay-graphical/root/.xinitrc
 create mode 100755 board/minnowboard/fs-overlay-graphical/usr/bin/startx
 rename board/{minnowboard-max => minnowboard}/genimage.cfg (100%)
 rename board/{minnowboard-max/grub.cfg => minnowboard/grub-minnowboard-max.cfg} (100%)
 rename board/minnowboard/{grub.cfg => grub-minnowboard.cfg} (100%)
 rename board/{minnowboard-max/linux.config => minnowboard/linux-4.4.config} (79%)
 rename board/{minnowboard-max => minnowboard}/post-image.sh (84%)
 create mode 100644 configs/minnowboard_max-graphical_defconfig

-- 
2.7.0
