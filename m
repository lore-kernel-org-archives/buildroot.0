From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 06:48:15 -0300
Subject: [Buildroot] [PATCH v3 00/11] The big webkitgtk bump
Message-ID: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Second take at the webkit/midori bump...

There's support for libgtk2 & libgtk3, though libgtk2 is always needed
for the plugin system.

GL* support was only tested via mesa software renderer.

Wayland support wasn't enabled because it still needs gtk2 (plugins) -
this could possibly be patched away.

Multimedia support is automatic via detection of gst1-plugins-base,
ideally this should be an option but right now opencv+gst generate a
dependency loop if gstreamer1 is selected. Also codecs will need to be
catered by the user via the appropiate gst selects.

MIPS support was disabled pending libatomic support for
__sync_fetch_and_add_8 which is handled there for some 32-bit
architectures.
Update for v2: MIPS(eb) SIGBUSes, so disabled in general, kept the
libatomic tweak for reference. MIPSel untested.

Possible TODOs:
Wayland in a proper way, granite support, gcr support, more arch
testing/support.

v3:
* Work around make 3.81 looping bug for webkitgtk24. [Gustavo]

* Fold libatomic patches.
  webkitgtk24 requires libatomic for i386 support.
  While a better solution is desirable for other packages such as
  strongswan on microblazeel there's no final solution yet, and it
  most likely will require copying them anyway. [Gustavo]

* Add host variants of: harfbuzz, cairo, pango, librsvg.
  host-librsvg is required by midori for rsvg-convert.
  The rest are just dependencies of host-librsvg. [Gustavo]

v2:
* Needs NPTL [Gustavo]
  It uses pthread_getattr_np()

* Handle libatomic [Gustavo]
  Needed for i386, mips & mipsel at least.

* Deprecate libgail, no longer used by any package [Gustavo]

v1:

* Bump webkitgtk to version 2.4.x in a versioned package.
  This is because midori can't use 2.6.x or 2.8.x and this way we can
  have another webkitgtk package in parallel for other uses.
  The series is still security-supported upstream.

* Bump midori to version 0.5.9.
  No effort was made to enable support for the old webkit 1.x. series,
  it may be possible to do so but it makes no sense.

* Deprecate old webkit package.
  Security bugs, build issues, general instability.

Gustavo Zacarias (11):
  gcc-final: install libatomic
  toolchain-external: install libatomic
  harfbuzz: add host variant
  cairo: add host variant
  pango: add host variant
  librsvg: add host variant
  librsvg: add hash file
  webkitgtk24: new package
  midori: bump to version 0.5.9
  webkit: mark as deprecated
  libgail: mark as deprecated

 package/Config.in                                  |   1 +
 package/cairo/cairo.mk                             |  28 ++++++
 package/gcc/gcc-final/gcc-final.mk                 |   9 ++
 package/harfbuzz/harfbuzz.mk                       |  15 +++
 package/libgail/Config.in                          |   2 +
 package/librsvg/librsvg.hash                       |   2 +
 package/librsvg/librsvg.mk                         |   2 +
 package/midori/0001-disable-libnotify.patch        |  43 +++++++++
 package/midori/Config.in                           |  39 +++++---
 package/midori/midori.hash                         |   2 +
 package/midori/midori.mk                           |  58 +++++------
 package/pango/pango.mk                             |   9 ++
 package/webkit/Config.in                           |   3 +
 package/webkitgtk24/0001-fix-bug-137640.patch      |  17 ++++
 package/webkitgtk24/Config.in                      |  56 +++++++++++
 package/webkitgtk24/webkitgtk24.hash               |   2 +
 package/webkitgtk24/webkitgtk24.mk                 | 107 +++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |   2 +-
 18 files changed, 357 insertions(+), 40 deletions(-)
 create mode 100644 package/librsvg/librsvg.hash
 create mode 100644 package/midori/0001-disable-libnotify.patch
 create mode 100644 package/midori/midori.hash
 create mode 100644 package/webkitgtk24/0001-fix-bug-137640.patch
 create mode 100644 package/webkitgtk24/Config.in
 create mode 100644 package/webkitgtk24/webkitgtk24.hash
 create mode 100644 package/webkitgtk24/webkitgtk24.mk

-- 
2.0.5
