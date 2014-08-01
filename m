From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Fri,  1 Aug 2014 03:33:45 +0200
Subject: [Buildroot] [PATCH v4 0/3] Add libgtk3 and bump webkit to version
	2.4.3
Message-ID: <1406856828-17350-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This series mainly does two things: add libgtk3 and bump webkit.

 - 1: add libgtk3
 - 2: bump webkit
 - 3: bump Midori to test WebKit 2.4.3

For now, only X11 support is done and tested for both libgtk3 and
webkit. Wayland support will be done later.

Tests:

* All is compiled-tested (with GTK+2 and GTK+3 for WebKit and Midori).
* Running tests were done for libgtk3 (with gtk3-demo) and Midori GTK+2
  with WebKit GTK+2 and webkit1 (on Qemu and BeagleBone Black).

For testing you will need GCC 4.8 because WebKit needs at least version
4.8 (see commit message) and X.org needs a version lesser than 4.9 (see
this issue:
http://lists.busybox.net/pipermail/buildroot/2014-June/098679.html).

There is still a weird problem with WebKit: parallel make with Make
3.81 results in a make hang on:
  CXXLD libWebCoreSVG.la
This is reproducible.

Does anyone has already encountered this?

You can find a defconfig for Qemu here:
http://bpaste.net/show/fR3jDhQPmtUHPYpGoiUn/

Changes v1 -> v2:

 - libgtk3: remove atk-bridge support, so we no longer need
   at-spi2-core and at-spi2-atk.
 - libgtk3: change the way we check for introspection to fix autoreconf
   error.
 - libgtk3: remove unnecessary extra definitions 

Changes v2 -> v3:

 - midori: fix the need of librsvg for the host

Changes v3 -> v4:

 - libgtk3: fix typo and formatting and improve .mk

Best regards,

Hadrien

---

Hadrien Boutteville (3):
  libgtk3: new package
  webkit: bump to version 2.4.3
  midori: bump to version 0.5.8

 package/Config.in                                  |    1 +
 package/libgtk3/Config.in                          |   46 +
 package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |   25 +
 .../libgtk3-0002-fix-introspection-check.patch     |   28 +
 .../libgtk3/libgtk3-0003-disable-atk-bridge.patch  |   45 +
 package/libgtk3/libgtk3.mk                         |  136 ++
 package/midori/Config.in                           |   15 +-
 package/midori/blocked.png                         |  Bin 0 -> 522 bytes
 package/midori/disabled.png                        |  Bin 0 -> 510 bytes
 package/midori/enabled.png                         |  Bin 0 -> 639 bytes
 package/midori/logo-shade.png                      |  Bin 0 -> 23862 bytes
 .../midori-0001-remove-libnotify-dependency.patch  |   27 +
 .../midori-0002-do-not-use-rsvg-convert.patch      |   39 +
 package/midori/midori.mk                           |   66 +-
 package/webkit/Config.in                           |   16 +-
 ...ebkit-0001-build-fix-for-32-bit-autotools.patch |   34 -
 .../webkit-0002-build-fix-for-gtklauncher.patch    |   51 -
 .../webkit/webkit-0003-detect-harfbuzz-icu.patch   |   28 -
 package/webkit/webkit-0004-disable-docrebase.patch |   27 -
 package/webkit/webkit-0005-disable-tests.patch     |   80 --
 package/webkit/webkit-0006-execinfo_h.patch        |   20 -
 package/webkit/webkit-0007-mips-dfg.patch          | 1490 --------------------
 package/webkit/webkit-0008-support-bison-3.0.patch |   22 -
 package/webkit/webkit.mk                           |   67 +-
 24 files changed, 433 insertions(+), 1830 deletions(-)
 create mode 100644 package/libgtk3/Config.in
 create mode 100644 package/libgtk3/libgtk3-0001-no-gtk-doc.patch
 create mode 100644 package/libgtk3/libgtk3-0002-fix-introspection-check.patch
 create mode 100644 package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
 create mode 100644 package/libgtk3/libgtk3.mk
 create mode 100644 package/midori/blocked.png
 create mode 100644 package/midori/disabled.png
 create mode 100644 package/midori/enabled.png
 create mode 100644 package/midori/logo-shade.png
 create mode 100644 package/midori/midori-0001-remove-libnotify-dependency.patch
 create mode 100644 package/midori/midori-0002-do-not-use-rsvg-convert.patch
 delete mode 100644 package/webkit/webkit-0001-build-fix-for-32-bit-autotools.patch
 delete mode 100644 package/webkit/webkit-0002-build-fix-for-gtklauncher.patch
 delete mode 100644 package/webkit/webkit-0003-detect-harfbuzz-icu.patch
 delete mode 100644 package/webkit/webkit-0004-disable-docrebase.patch
 delete mode 100644 package/webkit/webkit-0005-disable-tests.patch
 delete mode 100644 package/webkit/webkit-0006-execinfo_h.patch
 delete mode 100644 package/webkit/webkit-0007-mips-dfg.patch
 delete mode 100644 package/webkit/webkit-0008-support-bison-3.0.patch

-- 
2.0.1
