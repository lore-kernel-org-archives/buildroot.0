From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue,  8 Jul 2014 15:57:03 +0200
Subject: [Buildroot] [RFC 0/9] Add libgtk3 and bump webkit to version 2.4.3
Message-ID: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This series mainly does two things: add libgtk3 and bump webkit.

 - 1..5: requirements and dependencies for libgtk3
 - 6: add libgtk3
 - 7: bump webkit
 - 8: is required by Midori
 - 9: bump Midori to test WebKit 2.4.3

For now, only X11 support is done and tested for both libgtk3 and webkit.
Wayland support will be done later.

Tests:

* All is compiled-tested (with GTK+2 and GTK+3 for WebKit and Midori).
* Running tests were done for libgtk3 (with gtk3-demo) and Midori GTK+2 with
  WebKit GTK+2 and webkit1 (on Qemu and BeagleBone Black).

For testing you will need GCC 4.8 because WebKit needs at least version 4.8 (see
commit message) and X.org needs a version lesser than 4.9 (see this issue:
http://lists.busybox.net/pipermail/buildroot/2014-June/098679.html).

There is still a weird problem with WebKit: parallel make with Make 3.81 results
in a make hang on:
  CXXLD libWebCoreSVG.la
This is reproducible.

You can find a defconfig for Qemu here: 
http://bpaste.net/show/fR3jDhQPmtUHPYpGoiUn/

Best regards,

Hadrien

---

Hadrien Boutteville (9):
  libglib2: bump to version 2.40.0
  pango: bump to version 1.36.3
  cairo: add freetype and gobject support
  at-spi2-core: new package
  at-spi2-atk: new package
  libgtk3: new package
  webkit: bump to version 2.4.3
  libsoup: add libsoup-gnome support
  midori: bump to version 0.5.8

 package/Config.in                                  |    3 +
 package/at-spi2-atk/Config.in                      |   16 +
 package/at-spi2-atk/at-spi2-atk.mk                 |   19 +
 package/at-spi2-core/Config.in                     |   17 +
 ...se-AC_CHECK_ALIGNOF-instead-of-custom-DBI.patch |   79 ++
 package/at-spi2-core/at-spi2-core.mk               |   24 +
 package/cairo/cairo.mk                             |   14 +
 ...ror-format-string-errors-from-mismatched-.patch |   56 -
 package/libglib2/libglib2-0002-no-gtk-doc.patch    |   25 +
 package/libglib2/libglib2.mk                       |    4 +-
 package/libgtk3/Config.in                          |   47 +
 package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |   11 +
 .../libgtk3-0002-add-file-introspection-m4.patch   |  100 ++
 package/libgtk3/libgtk3.mk                         |  184 +++
 package/libsoup/Config.in                          |    5 +
 package/libsoup/libsoup.mk                         |    8 +-
 package/midori/Config.in                           |   15 +-
 .../midori-0001-remove-libnotify-dependency.patch  |   27 +
 package/midori/midori.mk                           |   51 +-
 package/pango/Config.in                            |    1 +
 package/pango/pango-0001-no-tests.patch            |   27 +
 package/pango/pango-0002-no-gtk-doc.patch          |   25 +
 package/pango/pango-no-const-return.patch          |  475 -------
 package/pango/pango-no-tests.patch                 |   22 -
 package/pango/pango.mk                             |   19 +-
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
 35 files changed, 711 insertions(+), 2398 deletions(-)
 create mode 100644 package/at-spi2-atk/Config.in
 create mode 100644 package/at-spi2-atk/at-spi2-atk.mk
 create mode 100644 package/at-spi2-core/Config.in
 create mode 100644 package/at-spi2-core/at-spi2-core-0001-configure-use-AC_CHECK_ALIGNOF-instead-of-custom-DBI.patch
 create mode 100644 package/at-spi2-core/at-spi2-core.mk
 delete mode 100644 package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
 create mode 100644 package/libglib2/libglib2-0002-no-gtk-doc.patch
 create mode 100644 package/libgtk3/Config.in
 create mode 100644 package/libgtk3/libgtk3-0001-no-gtk-doc.patch
 create mode 100644 package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch
 create mode 100644 package/libgtk3/libgtk3.mk
 create mode 100644 package/midori/midori-0001-remove-libnotify-dependency.patch
 create mode 100644 package/pango/pango-0001-no-tests.patch
 create mode 100644 package/pango/pango-0002-no-gtk-doc.patch
 delete mode 100644 package/pango/pango-no-const-return.patch
 delete mode 100644 package/pango/pango-no-tests.patch
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
